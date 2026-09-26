#!/usr/bin/env node
// =============================================================================
// Minimap V2 — Asset Generator (4x4 compact tilemap)
// =============================================================================
// Generates:
//   1. minimap_v2_tiles.raw.bin   — 80 tiles (76 map + 4 border) x 16 bytes (2bpp)
//   2. minimap_v2_encode.raw.bin  — 256 x 2 bytes encode table
//   3. minimap_v2_objpal.pal      — OBJ palette 7: 16 colors x 2 bytes = 32 bytes
//   4. minimap_v2_objtiles.raw.bin — 4 marker tiles x 32 bytes = 128 bytes (4bpp)
//   5. minimap_v2_shimmer.raw.bin — 29 x 2-byte BGR555 gradient entries = 58 bytes
//
// BG3 palette data is NO LONGER in a binary file — written inline in ASM via
// LDA/STA to avoid MVN bank issues and guarantee correct CGRAM placement.
// Only palettes 4, 6, 7 are used (pal 3 conflicts with BG1 scene data,
// pal 5 conflicts with HUD stat text).
//
// Each 8x8 SNES tile contains 4 solid-color 4x4 quadrants (TL, TR, BL, BR).
// 76 unique tiles cover all 256 possible 4-color quad patterns when H-flip
// and V-flip are used to reduce duplicates (Burnside's lemma).
//
// Run: node gen-minimap-v2-assets.mjs

import { writeFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

// -----------------------------------------------------------------------------
// BGR555 color helper: SNES CGRAM format is bbbbb_ggggg_rrrrr (little-endian)
// -----------------------------------------------------------------------------
function bgr555(r, g, b) {
    const r5 = Math.round(r * 31 / 255) & 0x1F;
    const g5 = Math.round(g * 31 / 255) & 0x1F;
    const b5 = Math.round(b * 31 / 255) & 0x1F;
    return (b5 << 10) | (g5 << 5) | r5;
}

// -----------------------------------------------------------------------------
// 1. COLOR CONSTANTS — used by ASM inline writes and OBJ palette
// -----------------------------------------------------------------------------
// BG3 palette layout (ASM writes inline, no binary file):
//   Pal 4 = base map: transparent, floor, wall, brown
//   Pal 6 = enemies:  transparent, floor, wall, red
//   Pal 7 = border:   transparent, frame, fill, frame

const COLOR_TRANSPARENT = bgr555(0, 0, 0);
const COLOR_FLOOR       = bgr555(173, 157, 124);   // $3E75 sandy gold
const COLOR_WALL        = bgr555(58, 50, 42);       // $14C7 dark stone
const COLOR_BROWN       = bgr555(107, 95, 78);      // $258D brown fill
const COLOR_RED         = bgr555(231, 60, 60);       // $1CFC enemy red
const COLOR_GREEN       = bgr555(66, 214, 82);       // $2D4A exit green

const BORDER_FRAME      = bgr555(198, 173, 107);    // warm golden frame line
const BORDER_FILL       = bgr555(16, 16, 24);        // near-black dark fill

// -----------------------------------------------------------------------------
// 2. OBJ PALETTE 7 — 16 colors x 2 bytes = 32 bytes
// -----------------------------------------------------------------------------
// Written to CGRAM shadow at $7F0BE0 (OBJ palette 7 = CGRAM entries 240-255).
// Colors 1-4 are used by the 4 marker sprite tiles.
// Color 1 is the player blink target (toggled between white and transparent).

function generateObjPalette() {
    const buf = Buffer.alloc(32); // 16 colors × 2 bytes, initialized to 0
    buf.writeUInt16LE(COLOR_TRANSPARENT,     0);  // color 0: transparent
    buf.writeUInt16LE(bgr555(255, 255, 255), 2);  // color 1: white (player)
    buf.writeUInt16LE(bgr555(231, 198, 49),  4);  // color 2: gold (chest)
    buf.writeUInt16LE(bgr555(66, 198, 214),  6);  // color 3: cyan (dark space)
    buf.writeUInt16LE(COLOR_GREEN,           8);  // color 4: green (exit)
    // colors 5-15: transparent (already 0)
    return buf;
}

// -----------------------------------------------------------------------------
// 3. OBJ MARKER TILES — 4 tiles x 32 bytes (4bpp 8x8) = 128 bytes
// -----------------------------------------------------------------------------
// Each tile has a 4x4 solid block in the top-left corner; rest is transparent.
// H/V flip bits in the OAM attribute byte select which quadrant the block covers.
// Tile 0 ($EC): color 1 (white/player)   — uploaded to VRAM $4EC0
// Tile 1 ($ED): color 2 (gold/chest)     — uploaded to VRAM $4ED0
// Tile 2 ($EE): color 3 (cyan/dark space) — uploaded to VRAM $4EE0
// Tile 3 ($EF): color 4 (green/exit)     — uploaded to VRAM $4EF0

function encode4bppTile(pixels) {
    const tile = Buffer.alloc(32);
    // 4bpp: first 16 bytes = bp0/bp1 interleaved, last 16 = bp2/bp3 interleaved
    for (let row = 0; row < 8; row++) {
        let bp0 = 0, bp1 = 0, bp2 = 0, bp3 = 0;
        for (let col = 0; col < 8; col++) {
            const c = pixels[row * 8 + col] & 0xF;
            const bit = 7 - col;
            if (c & 1) bp0 |= (1 << bit);
            if (c & 2) bp1 |= (1 << bit);
            if (c & 4) bp2 |= (1 << bit);
            if (c & 8) bp3 |= (1 << bit);
        }
        tile[row * 2 + 0] = bp0;
        tile[row * 2 + 1] = bp1;
        tile[16 + row * 2 + 0] = bp2;
        tile[16 + row * 2 + 1] = bp3;
    }
    return tile;
}

function generateObjMarkerTiles() {
    const tiles = [];
    for (const color of [1, 2, 3, 4]) {
        // 4×4 solid block in TL corner, rest transparent (color 0)
        const pixels = new Array(64).fill(0);
        for (let r = 0; r < 4; r++)
            for (let c = 0; c < 4; c++)
                pixels[r * 8 + c] = color;
        tiles.push(encode4bppTile(pixels));
    }
    return Buffer.concat(tiles);
}

// -----------------------------------------------------------------------------
// 4. SHIMMER GRADIENT TABLE — 29 BGR555 entries = 58 bytes
// -----------------------------------------------------------------------------
// Replicates the original radar border animation gradient.
// Deep blue → golden peak → back. One step per odd frame.
// Written to CGRAM shadow palette 7, color 1 during the hold loop.

function generateShimmerTable() {
    const entries = [
        0x5C82, 0x5CC4, 0x5906, 0x5928, 0x596A,
        0x55AC, 0x55EE, 0x5610, 0x5252, 0x5294,
        0x52D6, 0x4EF8, 0x4F3A, 0x4F7C, 0x4BBF,
        0x4BBF, 0x4B9D, 0x4B5B, 0x4F19, 0x4EF7,
        0x4EB5, 0x5273, 0x5231, 0x520F, 0x55CD,
        0x558B, 0x5549, 0x5927, 0x58E5,
    ];
    const buf = Buffer.alloc(entries.length * 2);
    for (let i = 0; i < entries.length; i++) {
        buf.writeUInt16LE(entries[i], i * 2);
    }
    return buf;
}

// -----------------------------------------------------------------------------
// 5. MAP TILE CHR GENERATION — 76 map tiles + 4 border tiles (2bpp)
// -----------------------------------------------------------------------------

function encode2bppTile(pixels) {
    const tile = Buffer.alloc(16);
    for (let row = 0; row < 8; row++) {
        let bp0 = 0, bp1 = 0;
        for (let col = 0; col < 8; col++) {
            const c = pixels[row * 8 + col] & 3;
            const bit = 7 - col;
            if (c & 1) bp0 |= (1 << bit);
            if (c & 2) bp1 |= (1 << bit);
        }
        tile[row * 2 + 0] = bp0;
        tile[row * 2 + 1] = bp1;
    }
    return tile;
}

function quadTilePixels(tl, tr, bl, br) {
    const p = new Array(64);
    for (let r = 0; r < 4; r++)
        for (let c = 0; c < 4; c++)
            p[r * 8 + c] = tl;
    for (let r = 0; r < 4; r++)
        for (let c = 4; c < 8; c++)
            p[r * 8 + c] = tr;
    for (let r = 4; r < 8; r++)
        for (let c = 0; c < 4; c++)
            p[r * 8 + c] = bl;
    for (let r = 4; r < 8; r++)
        for (let c = 4; c < 8; c++)
            p[r * 8 + c] = br;
    return p;
}

function packQuad(tl, tr, bl, br) {
    return ((tl & 3) << 6) | ((tr & 3) << 4) | ((bl & 3) << 2) | (br & 3);
}

function unpackQuad(b) {
    return [(b >> 6) & 3, (b >> 4) & 3, (b >> 2) & 3, b & 3];
}

function hFlipQuad(tl, tr, bl, br) { return [tr, tl, br, bl]; }
function vFlipQuad(tl, tr, bl, br) { return [bl, br, tl, tr]; }
function hvFlipQuad(tl, tr, bl, br) { return [br, bl, tr, tl]; }

function canonicalize(tl, tr, bl, br) {
    const variants = [
        { q: [tl, tr, bl, br], flip: 0 },
        { q: hFlipQuad(tl, tr, bl, br), flip: 1 },
        { q: vFlipQuad(tl, tr, bl, br), flip: 2 },
        { q: hvFlipQuad(tl, tr, bl, br), flip: 3 },
    ];
    let best = variants[0];
    for (let i = 1; i < 4; i++) {
        const packed = packQuad(...variants[i].q);
        if (packed < packQuad(...best.q)) {
            best = variants[i];
        }
    }
    return best;
}

function generateMapTilesAndEncodeTable() {
    const canonMap = new Map();
    const tilePixels = [];

    for (let packed = 0; packed < 256; packed++) {
        const [tl, tr, bl, br] = unpackQuad(packed);
        const canon = canonicalize(tl, tr, bl, br);
        const canonPacked = packQuad(...canon.q);
        if (!canonMap.has(canonPacked)) {
            const idx = canonMap.size;
            canonMap.set(canonPacked, idx);
            tilePixels.push(quadTilePixels(...canon.q));
        }
    }

    console.log(`Canonical tiles: ${canonMap.size} (expected 76)`);
    if (canonMap.size !== 76) {
        console.warn(`WARNING: Expected 76 canonical tiles, got ${canonMap.size}`);
    }

    const encodeTable = Buffer.alloc(512);

    for (let packed = 0; packed < 256; packed++) {
        const [tl, tr, bl, br] = unpackQuad(packed);
        const canon = canonicalize(tl, tr, bl, br);
        const canonPacked = packQuad(...canon.q);
        const tileIdx = canonMap.get(canonPacked);

        let hFlip = 0, vFlip = 0;
        switch (canon.flip) {
            case 0: break;
            case 1: hFlip = 1; break;
            case 2: vFlip = 1; break;
            case 3: hFlip = 1; vFlip = 1; break;
        }

        const word = (vFlip << 15) | (hFlip << 14) | (1 << 13) | tileIdx;
        encodeTable.writeUInt16LE(word, packed * 2);
    }

    const tileChr = tilePixels.map(px => encode2bppTile(px));
    return { tileChr, encodeTable };
}

// -----------------------------------------------------------------------------
// 6. BORDER TILES — 4 tiles at indices 76-79 (2bpp)
// -----------------------------------------------------------------------------

function generateBorderTiles() {
    const corner = new Array(64).fill(2);
    for (let c = 0; c < 8; c++) corner[0 * 8 + c] = 1;
    for (let r = 1; r < 8; r++) corner[r * 8 + 0] = 1;

    const hEdge = new Array(64).fill(2);
    for (let c = 0; c < 8; c++) hEdge[0 * 8 + c] = 1;

    const vEdge = new Array(64).fill(2);
    for (let r = 0; r < 8; r++) vEdge[r * 8 + 0] = 1;

    const fill = new Array(64).fill(2);

    return [
        encode2bppTile(corner),
        encode2bppTile(hEdge),
        encode2bppTile(vEdge),
        encode2bppTile(fill),
    ];
}

// -----------------------------------------------------------------------------
// Write output files
// -----------------------------------------------------------------------------

const { tileChr, encodeTable } = generateMapTilesAndEncodeTable();
const borderTiles = generateBorderTiles();
const allTiles = Buffer.concat([...tileChr, ...borderTiles]);
const objPalette = generateObjPalette();
const objTiles = generateObjMarkerTiles();
const shimmerTable = generateShimmerTable();

writeFileSync(join(__dirname, 'minimap_v2_tiles.raw.bin'), allTiles);
writeFileSync(join(__dirname, 'minimap_v2_encode.raw.bin'), encodeTable);
writeFileSync(join(__dirname, 'minimap_v2_objpal.pal'), objPalette);
writeFileSync(join(__dirname, 'minimap_v2_objtiles.raw.bin'), objTiles);
writeFileSync(join(__dirname, 'minimap_v2_shimmer.raw.bin'), shimmerTable);

console.log(`minimap_v2_tiles.raw.bin:    ${allTiles.length} bytes (${allTiles.length / 16} tiles x 16 bytes, 2bpp)`);
console.log(`minimap_v2_encode.raw.bin:   ${encodeTable.length} bytes (256 entries x 2 bytes)`);
console.log(`minimap_v2_objpal.pal:       ${objPalette.length} bytes (16 OBJ colors x 2 bytes)`);
console.log(`minimap_v2_objtiles.raw.bin: ${objTiles.length} bytes (4 tiles x 32 bytes, 4bpp)`);
console.log(`minimap_v2_shimmer.raw.bin:  ${shimmerTable.length} bytes (29 gradient entries x 2 bytes)`);

// Print BG3 palette color values for ASM inline reference
console.log(`\nBG3 palette colors (for ASM inline writes):`);
console.log(`  Pal 4 base: $${COLOR_TRANSPARENT.toString(16).padStart(4,'0')}, $${COLOR_FLOOR.toString(16).padStart(4,'0')}, $${COLOR_WALL.toString(16).padStart(4,'0')}, $${COLOR_BROWN.toString(16).padStart(4,'0')}`);
console.log(`  Pal 6 enemy: $${COLOR_TRANSPARENT.toString(16).padStart(4,'0')}, $${COLOR_FLOOR.toString(16).padStart(4,'0')}, $${COLOR_WALL.toString(16).padStart(4,'0')}, $${COLOR_RED.toString(16).padStart(4,'0')}`);
console.log(`  Pal 7 border: $${COLOR_TRANSPARENT.toString(16).padStart(4,'0')}, $${BORDER_FRAME.toString(16).padStart(4,'0')}, $${BORDER_FILL.toString(16).padStart(4,'0')}, $${BORDER_FRAME.toString(16).padStart(4,'0')}`);
