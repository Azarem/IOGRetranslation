#!/usr/bin/env node
// =============================================================================
// Walkable World Map — Asset Generator
// =============================================================================
// Generates:
//   1. walkable_map_collision_lut.bin  — 32 bytes (256 bits, 1 per metatile)
//   2. walkable_map_metatile_map.bin   — 4096 bytes (64x64 metatile index grid)
//
// Collision LUT: bit=1 means BLOCKED (impassable), bit=0 means PASSABLE.
// Byte N contains bits for metatile indices N*8..N*8+7 (LSB = lowest index).
//
// Classification uses the tileset block bit (bit 9 of each 16-bit entry).
// If no block bits are authored yet, falls back to auto-detection:
//   - Palette 3 metatiles → border frame → BLOCKED
//   - All-zero tile indices → empty/void → BLOCKED
//   - Everything else → PASSABLE
//
// After painting block bits in Gaia Mapper, re-run to pick up authored data.
//
// Run:  node gen-walkable-map-assets.mjs
//       node gen-walkable-map-assets.mjs --baserom ../../path/to/iog-baserom

import { readFileSync, writeFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

// ---------------------------------------------------------------------------
// Resolve baserom path (default: sibling gaia-iog-baserom)
// ---------------------------------------------------------------------------
const args = process.argv.slice(2);
let baseromDir;
const baseromFlagIdx = args.indexOf('--baserom');
if (baseromFlagIdx !== -1 && args[baseromFlagIdx + 1]) {
    baseromDir = args[baseromFlagIdx + 1];
} else {
    baseromDir = join(__dirname, '..', '..', '..', '..', 'gaia-iog-baserom');
}

const tilesetPath = join(baseromDir, 'extracted', 'system', 'world_map', 'set_overworld.set');
const tilemapPath = join(baseromDir, 'extracted', 'system', 'world_map', 'map_overworld_main.map');

// ---------------------------------------------------------------------------
// 1. Read source files
// ---------------------------------------------------------------------------
const tilesetData = readFileSync(tilesetPath);
const tilemapData = readFileSync(tilemapPath);

const TILESET_ENTRIES = 1024;   // 256 metatiles × 4 quads
const METATILE_COUNT = 256;
const MAP_HEADER_SIZE = 2;      // width, height bytes
const MAP_W = 64;
const MAP_H = 64;
const MAP_SIZE = MAP_W * MAP_H; // 4096

console.log(`Tileset: ${tilesetPath} (${tilesetData.length} bytes)`);
console.log(`Tilemap: ${tilemapPath} (${tilemapData.length} bytes)`);

if (tilesetData.length !== 2048) {
    throw new Error(`Unexpected tileset size: ${tilesetData.length} (expected 2048)`);
}
if (tilemapData.length !== MAP_HEADER_SIZE + MAP_SIZE) {
    throw new Error(`Unexpected tilemap size: ${tilemapData.length} (expected ${MAP_HEADER_SIZE + MAP_SIZE})`);
}

// ---------------------------------------------------------------------------
// 2. Decode tileset — check for authored block bits
// ---------------------------------------------------------------------------
let authoredBlockCount = 0;
const metatileBlocked = new Uint8Array(METATILE_COUNT); // 0 = passable, 1 = blocked

for (let mt = 0; mt < METATILE_COUNT; mt++) {
    for (let q = 0; q < 4; q++) {
        const byteOff = (mt * 4 + q) * 2;
        const word = tilesetData[byteOff] | (tilesetData[byteOff + 1] << 8);
        if (word & 0x0200) { // block bit
            metatileBlocked[mt] = 1;
            authoredBlockCount++;
            break;
        }
    }
}

if (authoredBlockCount > 0) {
    console.log(`Found ${authoredBlockCount} metatiles with authored block bits — using tileset data.`);
} else {
    console.log('No authored block bits found — using auto-detection fallback.');

    // Auto-detect: classify by palette and tile content
    for (let mt = 0; mt < METATILE_COUNT; mt++) {
        const tileIds = [];
        const palettes = [];

        for (let q = 0; q < 4; q++) {
            const byteOff = (mt * 4 + q) * 2;
            const word = tilesetData[byteOff] | (tilesetData[byteOff + 1] << 8);
            tileIds.push(word & 0x01FF);
            palettes.push((word >> 10) & 7);
        }

        const dominantPal = palettes.sort((a, b) =>
            palettes.filter(v => v === b).length - palettes.filter(v => v === a).length
        )[0];

        const allZeroTiles = tileIds.every(t => t === 0);

        // Border frame (palette 3) or empty void (all tile-index 0)
        if (dominantPal === 3 || allZeroTiles) {
            metatileBlocked[mt] = 1;
        }
    }

    const autoBlocked = Array.from(metatileBlocked).filter(b => b).length;
    console.log(`  Auto-blocked ${autoBlocked} metatiles (frame + empty).`);
}

// ---------------------------------------------------------------------------
// 3. Pack collision LUT — 32 bytes, 256 bits
// ---------------------------------------------------------------------------
const collisionLut = new Uint8Array(32);
for (let mt = 0; mt < METATILE_COUNT; mt++) {
    if (metatileBlocked[mt]) {
        collisionLut[mt >> 3] |= (1 << (mt & 7));
    }
}

const lutPath = join(__dirname, 'walkable_map_collision_lut.raw.bin');
writeFileSync(lutPath, collisionLut);
console.log(`Wrote ${lutPath} (${collisionLut.length} bytes)`);

// ---------------------------------------------------------------------------
// 4. Extract metatile map (strip 2-byte header)
// ---------------------------------------------------------------------------
const mapGrid = tilemapData.slice(MAP_HEADER_SIZE, MAP_HEADER_SIZE + MAP_SIZE);
const mapPath = join(__dirname, 'walkable_map_metatile_map.raw.bin');
writeFileSync(mapPath, mapGrid);
console.log(`Wrote ${mapPath} (${mapGrid.length} bytes)`);

// ---------------------------------------------------------------------------
// 5. Summary
// ---------------------------------------------------------------------------
let blockedCells = 0;
for (let i = 0; i < MAP_SIZE; i++) {
    if (metatileBlocked[mapGrid[i]]) blockedCells++;
}
const pct = ((blockedCells / MAP_SIZE) * 100).toFixed(1);
console.log(`\nCollision summary: ${blockedCells} / ${MAP_SIZE} cells blocked (${pct}%)`);
console.log('Blocked metatile indices:', Array.from(metatileBlocked)
    .map((b, i) => b ? `0x${i.toString(16).toUpperCase().padStart(2, '0')}` : null)
    .filter(Boolean)
    .join(', '));
