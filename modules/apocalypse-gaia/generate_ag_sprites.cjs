#!/usr/bin/env node
/**
 * Generate 4bpp SNES sprite tile graphics for the Apocalypse Gaia boss.
 *
 * Grid-aware layout: 16×16 OAM sprites use tiles at base, base+1,
 * base+16, base+17 in VRAM. Tiles are placed at their correct VRAM
 * grid positions rather than linearly.
 *
 * Phase 1 (gfx_ag_sprites.raw.bin): 192 tiles → VRAM $4400 (tile $40+)
 * Phase 3 (gfx_ag_phase3.raw.bin): 192 tiles → VRAM $4400 (tile $40+)
 *
 * Phase 3 includes shared FX tiles at the same grid positions as Phase 1
 * so explosions render correctly after the P2→P3 DMA transition.
 */

const fs = require('fs');
const path = require('path');

const TILE_SIZE = 32;

function encode4bppTile(pixels) {
    const tile = Buffer.alloc(TILE_SIZE, 0);
    for (let y = 0; y < 8; y++) {
        let bp0 = 0, bp1 = 0, bp2 = 0, bp3 = 0;
        for (let x = 0; x < 8; x++) {
            const px = pixels[y * 8 + x] & 0x0F;
            const bit = 7 - x;
            if (px & 1) bp0 |= (1 << bit);
            if (px & 2) bp1 |= (1 << bit);
            if (px & 4) bp2 |= (1 << bit);
            if (px & 8) bp3 |= (1 << bit);
        }
        tile[y * 2 + 0] = bp0;
        tile[y * 2 + 1] = bp1;
        tile[16 + y * 2 + 0] = bp2;
        tile[16 + y * 2 + 1] = bp3;
    }
    return tile;
}

// --- Pixel art generators ---

function makeSolidTile(color) {
    return encode4bppTile(new Array(64).fill(color));
}

function makeGradientSphere(coreColor, highlightColor, shadowColor) {
    const pixels = [];
    for (let y = 0; y < 8; y++) {
        for (let x = 0; x < 8; x++) {
            const cx = x - 3.5, cy = y - 3.5;
            const dist = Math.sqrt(cx * cx + cy * cy);
            if (dist > 4.2) { pixels.push(0); continue; }
            const lightAngle = (cx * -0.7 + cy * -0.7);
            if (lightAngle > 1.5) pixels.push(highlightColor);
            else if (dist > 3.5) pixels.push(shadowColor);
            else if (lightAngle > 0) pixels.push(coreColor);
            else pixels.push(shadowColor);
        }
    }
    return encode4bppTile(pixels);
}

function makeCornerTile(position, borderColor, fillColor, highlightColor) {
    const pixels = [];
    for (let y = 0; y < 8; y++) {
        for (let x = 0; x < 8; x++) {
            let cx, cy;
            switch (position) {
                case 'TL': cx = x; cy = y; break;
                case 'TR': cx = 7 - x; cy = y; break;
                case 'BL': cx = x; cy = 7 - y; break;
                case 'BR': cx = 7 - x; cy = 7 - y; break;
            }
            const dist = Math.sqrt(cx * cx + cy * cy);
            if (position === 'TL' || position === 'TR') {
                if (dist > 10 && cy < 3) { pixels.push(0); continue; }
            }
            if (cx === 0 && cy < 2 && position.startsWith('T')) {
                pixels.push(highlightColor || borderColor);
            } else if (cy === 0 && cx < 2 && position.startsWith('T')) {
                pixels.push(highlightColor || borderColor);
            } else {
                pixels.push(fillColor);
            }
        }
    }
    return encode4bppTile(pixels);
}

function makeOrbTile(mainColor, glowColor) {
    const pixels = [];
    for (let y = 0; y < 8; y++) {
        for (let x = 0; x < 8; x++) {
            const cx = x - 3.5, cy = y - 3.5;
            const dist = Math.sqrt(cx * cx + cy * cy);
            if (dist > 3.8) { pixels.push(0); continue; }
            if (dist < 1.5) pixels.push(glowColor);
            else if (dist < 2.8) pixels.push(mainColor);
            else pixels.push(glowColor);
        }
    }
    return encode4bppTile(pixels);
}

function makeMechanicalTile(baseColor, detailColor) {
    const pixels = [];
    for (let y = 0; y < 8; y++) {
        for (let x = 0; x < 8; x++) {
            if (x === 0 || x === 7) pixels.push(detailColor);
            else if (y === 0 || y === 7) pixels.push(detailColor);
            else if ((y === 2 || y === 5) && x > 1 && x < 6) pixels.push(detailColor);
            else pixels.push(baseColor);
        }
    }
    return encode4bppTile(pixels);
}

function makeExplosionTile(frame, color1, color2) {
    const pixels = [];
    for (let y = 0; y < 8; y++) {
        for (let x = 0; x < 8; x++) {
            const cx = x - 3.5, cy = y - 3.5;
            const dist = Math.sqrt(cx * cx + cy * cy);
            const angle = Math.atan2(cy, cx);
            const ray = Math.sin(angle * (3 + frame)) * 0.5 + 0.5;
            if (dist > 3.5 + ray) { pixels.push(0); continue; }
            if (dist < 1.5 - frame * 0.3) pixels.push(color2);
            else pixels.push(ray > 0.5 ? color1 : color2);
        }
    }
    return encode4bppTile(pixels);
}

function makeEnergyBeamTile(color, bgColor) {
    const pixels = [];
    for (let y = 0; y < 8; y++) {
        for (let x = 0; x < 8; x++) {
            if (y >= 2 && y <= 5) {
                if (y === 3 || y === 4) pixels.push(color);
                else pixels.push(bgColor || 0);
            } else {
                pixels.push(0);
            }
        }
    }
    return encode4bppTile(pixels);
}

function makeArrowTile(direction, color) {
    const masks = {
        N: [0,0,0,1,1,0,0,0, 0,0,1,1,1,1,0,0, 0,1,0,1,1,0,1,0, 0,0,0,1,1,0,0,0, 0,0,0,1,1,0,0,0, 0,0,0,1,1,0,0,0, 0,0,0,1,1,0,0,0, 0,0,0,1,1,0,0,0],
        NE:[0,0,0,1,1,1,1,0, 0,0,0,0,1,1,1,0, 0,0,0,1,0,1,1,0, 0,0,1,0,0,0,1,0, 0,1,0,0,0,0,0,0, 1,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0],
        E: [0,0,0,0,0,0,0,0, 0,0,0,1,0,0,0,0, 0,0,0,0,1,0,0,0, 1,1,1,1,1,1,1,0, 1,1,1,1,1,1,1,0, 0,0,0,0,1,0,0,0, 0,0,0,1,0,0,0,0, 0,0,0,0,0,0,0,0],
        SE:[0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 1,0,0,0,0,0,0,0, 0,1,0,0,0,0,0,0, 0,0,1,0,0,0,1,0, 0,0,0,1,0,1,1,0, 0,0,0,0,1,1,1,0, 0,0,0,1,1,1,1,0],
        S: [0,0,0,1,1,0,0,0, 0,0,0,1,1,0,0,0, 0,0,0,1,1,0,0,0, 0,0,0,1,1,0,0,0, 0,0,0,1,1,0,0,0, 0,1,0,1,1,0,1,0, 0,0,1,1,1,1,0,0, 0,0,0,1,1,0,0,0],
        SW:[0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,1, 0,0,0,0,0,0,1,0, 0,1,0,0,0,1,0,0, 0,1,1,0,1,0,0,0, 0,1,1,1,0,0,0,0, 0,1,1,1,1,0,0,0],
        W: [0,0,0,0,0,0,0,0, 0,0,0,0,1,0,0,0, 0,0,0,1,0,0,0,0, 0,1,1,1,1,1,1,1, 0,1,1,1,1,1,1,1, 0,0,0,1,0,0,0,0, 0,0,0,0,1,0,0,0, 0,0,0,0,0,0,0,0],
        NW:[0,1,1,1,1,0,0,0, 0,1,1,1,0,0,0,0, 0,1,1,0,1,0,0,0, 0,1,0,0,0,1,0,0, 0,0,0,0,0,0,1,0, 0,0,0,0,0,0,0,1, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0],
    };
    const mask = masks[direction] || masks.N;
    return encode4bppTile(mask.map(m => m ? color : 0));
}

function makeBulletTile(color) {
    return makeOrbTile(color, 1);
}

// --- Grid-aware tile placement ---
// For a 192-tile buffer, place a 16×16 sprite's 4 tiles at grid positions:
//   base, base+1, base+16, base+17 (relative to the VRAM base tile)

function place16x16(buf, tileIdx, baseTile, tl, tr, bl, br) {
    const offset = tileIdx - baseTile;
    buf[offset] = tl;
    buf[offset + 1] = tr;
    buf[offset + 16] = bl;
    buf[offset + 17] = br;
}

function place8x8(buf, tileIdx, baseTile, tile) {
    buf[tileIdx - baseTile] = tile;
}

// ============================================================
// Phase 1 Tile Sheet (192 tiles, VRAM $4400 = tile $40)
// ============================================================

function generatePhase1Tiles() {
    const NUM_TILES = 192;
    const BASE = 0x40;
    const buf = new Array(NUM_TILES).fill(null);

    // Pair A ($40-$5F): Core idle frames — dark purple sphere
    const coreMainColor = 11;    // purple
    const coreShadow = 14;       // dark blue
    const coreHighlight = 2;     // light gray

    // Core idle 0: tiles $40,$42,$44,$46 (each 16×16 = 4 tiles)
    place16x16(buf, 0x40, BASE,
        makeCornerTile('TL', 1, coreMainColor, coreHighlight),
        makeCornerTile('TR', 1, coreMainColor, coreHighlight),
        makeCornerTile('BL', 1, coreShadow),
        makeCornerTile('BR', 1, coreShadow));
    place16x16(buf, 0x42, BASE,
        makeCornerTile('TL', 1, coreMainColor),
        makeCornerTile('TR', 1, coreMainColor),
        makeCornerTile('BL', 1, coreShadow),
        makeCornerTile('BR', 1, coreShadow));
    place16x16(buf, 0x44, BASE,
        makeCornerTile('TL', 1, coreShadow),
        makeCornerTile('TR', 1, coreShadow),
        makeCornerTile('BL', 1, coreShadow),
        makeCornerTile('BR', 1, coreShadow));
    place16x16(buf, 0x46, BASE,
        makeCornerTile('TL', 1, coreShadow),
        makeCornerTile('TR', 1, coreShadow),
        makeCornerTile('BL', 1, coreShadow),
        makeCornerTile('BR', 1, coreShadow));

    // Core idle 1: tiles $48,$4A,$4C,$4E
    place16x16(buf, 0x48, BASE,
        makeCornerTile('TL', 1, coreHighlight),
        makeCornerTile('TR', 1, coreMainColor, coreHighlight),
        makeCornerTile('BL', 1, coreMainColor),
        makeCornerTile('BR', 1, coreShadow));
    place16x16(buf, 0x4A, BASE,
        makeCornerTile('TL', 1, coreMainColor),
        makeCornerTile('TR', 1, coreHighlight),
        makeCornerTile('BL', 1, coreShadow),
        makeCornerTile('BR', 1, coreMainColor));
    place16x16(buf, 0x4C, BASE,
        makeCornerTile('TL', 1, coreShadow),
        makeCornerTile('TR', 1, coreMainColor),
        makeCornerTile('BL', 1, coreShadow),
        makeCornerTile('BR', 1, coreShadow));
    place16x16(buf, 0x4E, BASE,
        makeCornerTile('TL', 1, coreMainColor),
        makeCornerTile('TR', 1, coreShadow),
        makeCornerTile('BL', 1, coreShadow),
        makeCornerTile('BR', 1, coreShadow));

    // Pair B ($60-$7F): Core variants
    // Core attack: $60, $62 — orange energy burst
    place16x16(buf, 0x60, BASE,
        makeCornerTile('TL', 6, 7, 1),
        makeCornerTile('TR', 6, 5, 1),
        makeCornerTile('BL', 6, 7),
        makeCornerTile('BR', 6, 5));
    place16x16(buf, 0x62, BASE,
        makeCornerTile('TL', 6, 5, 1),
        makeCornerTile('TR', 6, 7, 1),
        makeCornerTile('BL', 6, 5),
        makeCornerTile('BR', 6, 7));
    // Core damage: $64, $66 — pink flash
    place16x16(buf, 0x64, BASE,
        makeCornerTile('TL', 1, 12, 1),
        makeCornerTile('TR', 12, 11),
        makeCornerTile('BL', 12, 14),
        makeCornerTile('BR', 12, 14));
    place16x16(buf, 0x66, BASE,
        makeCornerTile('TL', 12, 11),
        makeCornerTile('TR', 1, 12, 1),
        makeCornerTile('BL', 12, 14),
        makeCornerTile('BR', 12, 14));
    // Core death: $68, $6A — dark crumbling
    place16x16(buf, 0x68, BASE,
        makeExplosionTile(0, 13, 5),
        makeExplosionTile(1, 13, 5),
        makeExplosionTile(2, 13, 5),
        makeExplosionTile(3, 13, 5));
    place16x16(buf, 0x6A, BASE,
        makeExplosionTile(1, 5, 13),
        makeExplosionTile(0, 5, 13),
        makeExplosionTile(3, 5, 13),
        makeExplosionTile(2, 5, 13));
    // Core extra: $6C, $6E — pulsing energy
    place16x16(buf, 0x6C, BASE,
        makeCornerTile('TL', 6, 13, 7),
        makeCornerTile('TR', 6, 5, 7),
        makeCornerTile('BL', 6, 13),
        makeCornerTile('BR', 6, 5));
    place16x16(buf, 0x6E, BASE,
        makeCornerTile('TL', 6, 5, 7),
        makeCornerTile('TR', 6, 13, 7),
        makeCornerTile('BL', 6, 5),
        makeCornerTile('BR', 6, 13));

    // Pair C ($80-$9F): Sub-actors
    // Bit idle: $80 — blue energy orb
    place16x16(buf, 0x80, BASE,
        makeOrbTile(10, 9), makeOrbTile(10, 9),
        makeOrbTile(10, 14), makeOrbTile(10, 14));
    // Bit attack: $82 — cyan flash
    place16x16(buf, 0x82, BASE,
        makeOrbTile(9, 1), makeOrbTile(9, 1),
        makeOrbTile(9, 10), makeOrbTile(9, 10));
    // Bit vulnerable: $84 — green weakened
    place16x16(buf, 0x84, BASE,
        makeOrbTile(8, 7), makeOrbTile(8, 7),
        makeOrbTile(8, 0), makeOrbTile(8, 0));
    // Bit dead: $86 — dark husk
    place16x16(buf, 0x86, BASE,
        makeOrbTile(14, 3), makeOrbTile(14, 3),
        makeOrbTile(14, 0), makeOrbTile(14, 0));
    // Launcher idle: $88 — yellow mechanical
    place16x16(buf, 0x88, BASE,
        makeMechanicalTile(7, 3), makeMechanicalTile(7, 3),
        makeMechanicalTile(7, 4), makeMechanicalTile(7, 4));
    // Launcher fire: $8A — orange active
    place16x16(buf, 0x8A, BASE,
        makeMechanicalTile(6, 1), makeMechanicalTile(6, 1),
        makeMechanicalTile(6, 5), makeMechanicalTile(6, 5));
    // Nuke: $8C — red projectile
    place16x16(buf, 0x8C, BASE,
        makeGradientSphere(5, 7, 13), makeGradientSphere(5, 6, 13),
        makeGradientSphere(13, 5, 4), makeGradientSphere(13, 5, 4));
    // Dead bit fire: $8E — pink flame
    place16x16(buf, 0x8E, BASE,
        makeExplosionTile(0, 12, 5), makeExplosionTile(1, 12, 5),
        makeExplosionTile(2, 12, 6), makeExplosionTile(3, 12, 6));

    // Pair D ($A0-$BF): Floor beam + 8×8 sprites
    // Floor beam: $A0 (16×16)
    place16x16(buf, 0xA0, BASE,
        makeEnergyBeamTile(1, 9), makeEnergyBeamTile(9, 1),
        makeEnergyBeamTile(9, 10), makeEnergyBeamTile(10, 9));
    // 8×8 sprites
    place8x8(buf, 0xA2, BASE, makeGradientSphere(9, 1, 10));     // bubble
    place8x8(buf, 0xA3, BASE, makeEnergyBeamTile(1, 0));          // beam
    place8x8(buf, 0xA4, BASE, makeGradientSphere(6, 7, 5));       // nuke piece
    place8x8(buf, 0xA5, BASE, makeGradientSphere(5, 7, 13));      // fire object
    place8x8(buf, 0xA6, BASE, makeExplosionTile(0, 1, 9));        // bubble death
    place8x8(buf, 0xA7, BASE, makeExplosionTile(1, 9, 0));        // bubble pop/debris A
    place8x8(buf, 0xA8, BASE, makeExplosionTile(2, 10, 0));       // debris B

    // Fill empty positions with transparent tiles
    for (let i = 0; i < NUM_TILES; i++) {
        if (buf[i] === null) buf[i] = makeSolidTile(0);
    }

    return Buffer.concat(buf);
}

// ============================================================
// Phase 3 Tile Sheet (192 tiles, VRAM $4400 = tile $40)
// Same VRAM range as Phase 1. DMA replaces P1 tiles with P3 content.
// Shared FX tiles ($8C, $8E, $A4, $A5) preserved at same positions.
// ============================================================

function generatePhase3Tiles() {
    const NUM_TILES = 192;
    const BASE = 0x40;
    const buf = new Array(NUM_TILES).fill(null);

    const fcoreMain = 11;  // purple
    const fcoreDark = 14;  // dark blue
    const fcoreGlow = 12;  // pink

    // Pair A ($40-$5F): Final Core body (replaces P1 Core idle)
    // fcore_move_0: $40,$42,$44,$46
    place16x16(buf, 0x40, BASE,
        makeCornerTile('TL', fcoreGlow, fcoreMain, 1),
        makeCornerTile('TR', fcoreGlow, fcoreMain, 1),
        makeCornerTile('BL', fcoreGlow, fcoreDark),
        makeCornerTile('BR', fcoreGlow, fcoreDark));
    place16x16(buf, 0x42, BASE,
        makeCornerTile('TL', fcoreGlow, fcoreMain),
        makeCornerTile('TR', fcoreGlow, fcoreMain),
        makeCornerTile('BL', fcoreGlow, fcoreDark),
        makeCornerTile('BR', fcoreGlow, fcoreDark));
    place16x16(buf, 0x44, BASE,
        makeCornerTile('TL', fcoreGlow, fcoreDark),
        makeCornerTile('TR', fcoreGlow, fcoreDark),
        makeCornerTile('BL', fcoreGlow, fcoreDark),
        makeCornerTile('BR', fcoreGlow, fcoreDark));
    place16x16(buf, 0x46, BASE,
        makeCornerTile('TL', fcoreGlow, fcoreDark),
        makeCornerTile('TR', fcoreGlow, fcoreDark),
        makeCornerTile('BL', fcoreGlow, fcoreDark),
        makeCornerTile('BR', fcoreGlow, fcoreDark));

    // fcore_move_1: $48,$4A,$4C,$4E
    place16x16(buf, 0x48, BASE,
        makeCornerTile('TL', 1, fcoreMain, 1),
        makeCornerTile('TR', fcoreGlow, fcoreMain),
        makeCornerTile('BL', fcoreGlow, fcoreDark),
        makeCornerTile('BR', fcoreGlow, fcoreMain));
    place16x16(buf, 0x4A, BASE,
        makeCornerTile('TL', fcoreGlow, fcoreMain),
        makeCornerTile('TR', 1, fcoreMain, 1),
        makeCornerTile('BL', fcoreGlow, fcoreMain),
        makeCornerTile('BR', fcoreGlow, fcoreDark));
    place16x16(buf, 0x4C, BASE,
        makeCornerTile('TL', fcoreGlow, fcoreDark),
        makeCornerTile('TR', fcoreGlow, fcoreMain),
        makeCornerTile('BL', fcoreGlow, fcoreDark),
        makeCornerTile('BR', fcoreGlow, fcoreDark));
    place16x16(buf, 0x4E, BASE,
        makeCornerTile('TL', fcoreGlow, fcoreMain),
        makeCornerTile('TR', fcoreGlow, fcoreDark),
        makeCornerTile('BL', fcoreGlow, fcoreDark),
        makeCornerTile('BR', fcoreGlow, fcoreDark));

    // Pair B ($60-$7F): Final Core variants + Minis
    // fcore_dmg: $60, $62
    place16x16(buf, 0x60, BASE,
        makeCornerTile('TL', 1, 12, 1),
        makeCornerTile('TR', 12, fcoreMain),
        makeCornerTile('BL', 12, fcoreDark),
        makeCornerTile('BR', 12, fcoreDark));
    place16x16(buf, 0x62, BASE,
        makeCornerTile('TL', 12, fcoreMain),
        makeCornerTile('TR', 1, 12, 1),
        makeCornerTile('BL', 12, fcoreDark),
        makeCornerTile('BR', 12, fcoreDark));
    // fcore_alt: $64, $66
    place16x16(buf, 0x64, BASE,
        makeCornerTile('TL', fcoreGlow, fcoreMain, 1),
        makeCornerTile('TR', 1, fcoreDark, fcoreGlow),
        makeCornerTile('BL', fcoreGlow, fcoreMain),
        makeCornerTile('BR', 1, fcoreDark));
    place16x16(buf, 0x66, BASE,
        makeCornerTile('TL', 1, fcoreDark, fcoreGlow),
        makeCornerTile('TR', fcoreGlow, fcoreMain, 1),
        makeCornerTile('BL', 1, fcoreDark),
        makeCornerTile('BR', fcoreGlow, fcoreMain));
    // Mini fall: $68
    place16x16(buf, 0x68, BASE,
        makeOrbTile(8, 1), makeOrbTile(8, 1),
        makeOrbTile(8, 0), makeOrbTile(8, 0));
    // Mini idle: $6A
    place16x16(buf, 0x6A, BASE,
        makeOrbTile(8, 7), makeOrbTile(8, 7),
        makeOrbTile(8, 0), makeOrbTile(8, 0));
    // Mini move: $6C
    place16x16(buf, 0x6C, BASE,
        makeOrbTile(8, 9), makeOrbTile(8, 9),
        makeOrbTile(8, 10), makeOrbTile(8, 10));
    // Mini damage: $6E
    place16x16(buf, 0x6E, BASE,
        makeOrbTile(7, 1), makeOrbTile(7, 1),
        makeOrbTile(7, 8), makeOrbTile(7, 8));

    // Pair C ($80-$9F): Mini death + 5 Cannons + Shared FX
    // Mini death: $80
    place16x16(buf, 0x80, BASE,
        makeExplosionTile(0, 13, 8), makeExplosionTile(1, 13, 8),
        makeExplosionTile(2, 13, 0), makeExplosionTile(3, 13, 0));
    // Cannons N,NE,E,SE,S: $82,$84,$86,$88,$8A
    const cannonDirsC = ['N', 'NE', 'E', 'SE', 'S'];
    const cannonTilesC = [0x82, 0x84, 0x86, 0x88, 0x8A];
    for (let d = 0; d < 5; d++) {
        const arrow = makeArrowTile(cannonDirsC[d], 6);
        const body = makeMechanicalTile(6, 3);
        place16x16(buf, cannonTilesC[d], BASE, arrow, body, body, body);
    }
    // Shared FX: Nuke at $8C, Deadbit at $8E (same as P1)
    place16x16(buf, 0x8C, BASE,
        makeGradientSphere(5, 7, 13), makeGradientSphere(5, 6, 13),
        makeGradientSphere(13, 5, 4), makeGradientSphere(13, 5, 4));
    place16x16(buf, 0x8E, BASE,
        makeExplosionTile(0, 12, 5), makeExplosionTile(1, 12, 5),
        makeExplosionTile(2, 12, 6), makeExplosionTile(3, 12, 6));

    // Pair D ($A0-$BF): 3 Cannons + Shared FX 8×8 + Bullets
    // Cannon SW: $A0, Cannon W: $A2, Cannon NW: $A6
    const cannonDirsD = ['SW', 'W', 'NW'];
    const cannonTilesD = [0xA0, 0xA2, 0xA6];
    for (let d = 0; d < 3; d++) {
        const arrow = makeArrowTile(cannonDirsD[d], 6);
        const body = makeMechanicalTile(6, 3);
        place16x16(buf, cannonTilesD[d], BASE, arrow, body, body, body);
    }
    // Shared FX 8×8 at same positions as P1
    place8x8(buf, 0xA4, BASE, makeGradientSphere(6, 7, 5));       // nuke piece
    place8x8(buf, 0xA5, BASE, makeGradientSphere(5, 7, 13));      // fire object
    // Body segment: $A8
    place8x8(buf, 0xA8, BASE, makeOrbTile(3, 0));
    // Bullet starts: $A9-$AF, $B4
    const bulletStartTilesP3 = [0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB4];
    for (let d = 0; d < 8; d++) {
        place8x8(buf, bulletStartTilesP3[d], BASE, makeBulletTile(7));
    }
    // Bullet hitboxes: $B5, $B8-$BE
    const bulletHitTilesP3 = [0xB5,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE];
    for (let d = 0; d < 8; d++) {
        place8x8(buf, bulletHitTilesP3[d], BASE, makeBulletTile(5));
    }

    // Fill empty positions
    for (let i = 0; i < NUM_TILES; i++) {
        if (buf[i] === null) buf[i] = makeSolidTile(0);
    }

    return Buffer.concat(buf);
}

// ============================================================
// Generate files
// ============================================================

const outDir = __dirname;

const phase1 = generatePhase1Tiles();
const phase3 = generatePhase3Tiles();

fs.writeFileSync(path.join(outDir, 'gfx_ag_sprites.raw.bin'), phase1);
fs.writeFileSync(path.join(outDir, 'gfx_ag_phase3.raw.bin'), phase3);

console.log(`Generated gfx_ag_sprites.raw.bin: ${phase1.length} bytes (${phase1.length / 32} tiles, VRAM $4400)`);
console.log(`Generated gfx_ag_phase3.raw.bin: ${phase3.length} bytes (${phase3.length / 32} tiles, VRAM $4400)`);
