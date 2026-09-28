#!/usr/bin/env node
// =============================================================================
// Dungeon Map — Asset Generator (Overlay mode)
// =============================================================================
// Generates:
//   1. minimap_tiles.raw.bin   — 5 tiles × 16 bytes = 80 bytes (2bpp)
//   2. minimap_shimmer.raw.bin — 29 × 2-byte BGR555 gradient entries = 58 bytes
//
// All terrain and exit tiles use 3 non-transparent colors (1, 2, 3):
//   Color 0: transparent
//   Color 1: floor (light sand)   — base terrain fill
//   Color 2: wall  (dark stone)   — structural/contrast
//   Color 3: texture (mid-brown)  — grain, mortar, step edges (terrain pal 4)
//            OR accent (green)    — arrows (exit pal 2)
//
// Other marker icons come from existing VRAM:
//   - Radar icons ($2E5, $2E6, $2E7) — player, chest, enemy
//   - Font tile $0D — dark space
//
// Run: node gen-minimap-assets.mjs

import { writeFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

// -----------------------------------------------------------------------------
// 2bpp tile encoder
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

function solidTile(color) {
    return new Array(64).fill(color);
}

// -----------------------------------------------------------------------------
// Terrain tiles — 3 non-transparent colors (floor, wall, texture)
// On palette 4: color 1 = floor, color 2 = wall, color 3 = mid-brown texture
// -----------------------------------------------------------------------------

// Tile 0 ($100): OOB — checkerboard of colors 1 and 2
// Visually distinct from both floor and wall; marks void areas
function tileOOB() {
    const p = new Array(64);
    for (let r = 0; r < 8; r++)
        for (let c = 0; c < 8; c++)
            p[r * 8 + c] = ((r + c) & 1) ? 2 : 1;
    return p;
}

// Tile 1 ($101): Floor — color 1 base with color 3 grain + color 2 dark specks
// Natural-looking sand/stone ground with subtle texture variation
function tileFloor() {
    const p = solidTile(1);
    // Color 3 grain dots (mid-brown, subtle texture)
    p[1 * 8 + 3] = 3;
    p[3 * 8 + 6] = 3;
    p[5 * 8 + 1] = 3;
    p[7 * 8 + 5] = 3;
    // Color 2 dark specks (sparse, adds depth)
    p[2 * 8 + 5] = 2;
    p[6 * 8 + 2] = 2;
    return p;
}

// Tile 2 ($102): Wall — color 2 base with color 3 mortar + color 1 highlights
// Brick pattern with light mortar lines and occasional highlight chips
function tileWall() {
    const p = solidTile(2);
    // Color 3 mortar lines (mid-brown, horizontal)
    for (let c = 0; c < 8; c++) {
        p[0 * 8 + c] = 3;
        p[4 * 8 + c] = 3;
    }
    // Color 3 mortar joints (vertical, staggered for brick pattern)
    p[1 * 8 + 3] = 3;
    p[2 * 8 + 3] = 3;
    p[3 * 8 + 3] = 3;
    p[5 * 8 + 7] = 3;
    p[6 * 8 + 7] = 3;
    p[7 * 8 + 7] = 3;
    // Color 1 highlight chips (light, sparse — catches the eye)
    p[2 * 8 + 1] = 1;
    p[6 * 8 + 5] = 1;
    return p;
}

// Tile 3 ($103): Stairs — color 1 base with color 2 risers + color 3 tread edges
// Diagonal staircase with three distinct visual layers
function tileStairs() {
    const p = solidTile(1);
    // Color 2 step risers (dark vertical faces of each step)
    for (let i = 0; i < 8; i++) {
        const step = 7 - i;
        p[i * 8 + step] = 2;
    }
    // Color 3 tread edges (mid-brown horizontal treads)
    for (let c = 5; c < 7; c++) p[1 * 8 + c] = 3;
    for (let c = 3; c < 7; c++) p[3 * 8 + c] = 3;
    for (let c = 1; c < 7; c++) p[5 * 8 + c] = 3;
    for (let c = 0; c < 8; c++) p[7 * 8 + c] = 3;
    return p;
}

// -----------------------------------------------------------------------------
// Exit/Warp tile — 3 non-transparent colors (floor, wall, accent)
// On palette 2: color 1 = floor, color 2 = wall, color 3 = green accent
// -----------------------------------------------------------------------------

// Tile 4 ($104): Exit/Warp — outward arrows with wall-colored inner ring
// Floor background, wall ring for structure, green arrows pointing out
function tileExit() {
    const p = solidTile(1);

    // Color 2 inner ring (wall — structural frame between arrows)
    for (let c = 2; c <= 5; c++) { p[2 * 8 + c] = 2; p[5 * 8 + c] = 2; }
    for (let r = 3; r <= 4; r++) { p[r * 8 + 2] = 2; p[r * 8 + 5] = 2; }

    // Color 3 outward arrows (green accent)
    // Up arrow
    p[0 * 8 + 3] = 3; p[0 * 8 + 4] = 3;
    p[1 * 8 + 2] = 3; p[1 * 8 + 3] = 3; p[1 * 8 + 4] = 3; p[1 * 8 + 5] = 3;
    // Down arrow
    p[7 * 8 + 3] = 3; p[7 * 8 + 4] = 3;
    p[6 * 8 + 2] = 3; p[6 * 8 + 3] = 3; p[6 * 8 + 4] = 3; p[6 * 8 + 5] = 3;
    // Left arrow
    p[3 * 8 + 0] = 3; p[4 * 8 + 0] = 3;
    p[2 * 8 + 1] = 3; p[3 * 8 + 1] = 3; p[4 * 8 + 1] = 3; p[5 * 8 + 1] = 3;
    // Right arrow
    p[3 * 8 + 7] = 3; p[4 * 8 + 7] = 3;
    p[2 * 8 + 6] = 3; p[3 * 8 + 6] = 3; p[4 * 8 + 6] = 3; p[5 * 8 + 6] = 3;

    return p;
}

function generateTiles() {
    const tiles = [
        encode2bppTile(tileOOB()),      // $100: OOB
        encode2bppTile(tileFloor()),    // $101: Floor (3-color textured)
        encode2bppTile(tileWall()),     // $102: Wall (3-color brick)
        encode2bppTile(tileStairs()),   // $103: Stairs (3-color diagonal)
        encode2bppTile(tileExit()),     // $104: Exit/Warp (3-color arrows)
    ];
    return Buffer.concat(tiles);
}

// -----------------------------------------------------------------------------
// Shimmer table — 29 BGR555 gradient entries for palette animation
// -----------------------------------------------------------------------------
// Cycles palette 7 color 1 through a warm gold → cool blue gradient.

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
// Write output files
// -----------------------------------------------------------------------------

const tiles = generateTiles();
const shimmerTable = generateShimmerTable();

writeFileSync(join(__dirname, 'minimap_tiles.raw.bin'), tiles);
writeFileSync(join(__dirname, 'minimap_shimmer.raw.bin'), shimmerTable);

console.log(`minimap_tiles.raw.bin:   ${tiles.length} bytes (${tiles.length / 16} tiles × 16 bytes/tile)`);
console.log(`minimap_shimmer.raw.bin: ${shimmerTable.length} bytes (29 gradient entries × 2 bytes)`);
