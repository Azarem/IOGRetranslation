#!/usr/bin/env node
// =============================================================================
// Walkable World Map — Collision Map Generator
// =============================================================================
// Combines the overworld tileset (set_overworld.set) with the overworld
// tilemap (map_overworld_main.map) to produce a nibble-packed collision map.
//
// Output:
//   walkable_map_collision.raw.bin — 2048 bytes (64x64 grid, nibble-packed)
//
// Each nibble is a 4-bit block mask for one metatile cell:
//   bit 0 = TL quad blocked (top-left 8x8)
//   bit 1 = TR quad blocked (top-right 8x8)
//   bit 2 = BL quad blocked (bottom-left 8x8)
//   bit 3 = BR quad blocked (bottom-right 8x8)
//
// Packing: even columns → low nibble, odd columns → high nibble.
// Each row of 64 cells → 32 bytes.  64 rows → 2048 bytes.
//
// The tilemap file uses a **block-ordered** layout: 4x4 blocks of 16x16
// metatile cells (256 bytes per block, arranged block-row-major). This
// script converts from block-order to flat row-major during generation.
//
// Block flags come from bit 9 (0x0200) of each tileset quad word, which
// is the same flag authored via Gaia Mapper's block overlay.
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

// The tileset in baserom/ has authored block flags (painted in Gaia Mapper).
// The extracted/ copy has none — extraction pulls unmodified ROM data.
const tilesetPath = join(baseromDir, 'baserom', 'set_overworld.set');
const tilemapPath = join(baseromDir, 'extracted', 'system', 'world_map', 'map_overworld_main.map');

// ---------------------------------------------------------------------------
// Read and validate source files
// ---------------------------------------------------------------------------
const METATILE_COUNT = 256;
const MAP_HEADER_SIZE = 2;      // width (blocks), height (blocks)
const BLOCKS_W = 4;             // 4 blocks wide
const BLOCKS_H = 4;             // 4 blocks tall
const BLOCK_CELLS = 16;         // 16x16 metatiles per block
const MAP_W = BLOCKS_W * BLOCK_CELLS; // 64
const MAP_H = BLOCKS_H * BLOCK_CELLS; // 64
const MAP_DATA_SIZE = BLOCKS_W * BLOCKS_H * 256; // 4096

const tilesetData = readFileSync(tilesetPath);
const tilemapData = readFileSync(tilemapPath);

console.log(`Tileset: ${tilesetPath} (${tilesetData.length} bytes)`);
console.log(`Tilemap: ${tilemapPath} (${tilemapData.length} bytes)`);

if (tilesetData.length !== 2048) {
    throw new Error(`Unexpected tileset size: ${tilesetData.length} (expected 2048)`);
}
if (tilemapData.length !== MAP_HEADER_SIZE + MAP_DATA_SIZE) {
    throw new Error(`Unexpected tilemap size: ${tilemapData.length} (expected ${MAP_HEADER_SIZE + MAP_DATA_SIZE})`);
}

const mapWidth = tilemapData[0];
const mapHeight = tilemapData[1];
if (mapWidth !== BLOCKS_W || mapHeight !== BLOCKS_H) {
    throw new Error(`Unexpected map dimensions: ${mapWidth}x${mapHeight} (expected ${BLOCKS_W}x${BLOCKS_H})`);
}

// ---------------------------------------------------------------------------
// Build per-metatile 4-bit block masks from the tileset
// ---------------------------------------------------------------------------
const metatileBlockMask = new Uint8Array(METATILE_COUNT);

for (let mt = 0; mt < METATILE_COUNT; mt++) {
    let mask = 0;
    for (let q = 0; q < 4; q++) {
        const byteOff = (mt * 4 + q) * 2;
        const word = tilesetData[byteOff] | (tilesetData[byteOff + 1] << 8);
        if (word & 0x0200) {
            mask |= (1 << q);
        }
    }
    metatileBlockMask[mt] = mask;
}

const blockedMetatiles = Array.from(metatileBlockMask).filter(m => m !== 0).length;
console.log(`\nTileset: ${blockedMetatiles} / ${METATILE_COUNT} metatiles have at least one blocked quad`);

// ---------------------------------------------------------------------------
// Build nibble-packed collision map (flat row-major, from block-ordered tilemap)
// ---------------------------------------------------------------------------
// The tilemap is block-ordered:
//   block(bx, by) starts at offset (by * BLOCKS_W + bx) * 256
//   cell(cx, cy) within block at offset cy * 16 + cx
//
// We convert to flat row-major and pack two cells per byte:
//   even col → low nibble, odd col → high nibble
//   byte_offset = row * 32 + col / 2
const PACKED_SIZE = (MAP_W * MAP_H) >> 1; // 2048
const collisionMap = new Uint8Array(PACKED_SIZE);

let totalBlocked = 0;
let fullyBlocked = 0;
let partialBlocked = 0;

for (let row = 0; row < MAP_H; row++) {
    for (let col = 0; col < MAP_W; col++) {
        const blockX = (col >> 4);
        const blockY = (row >> 4);
        const cellX = col & 0x0F;
        const cellY = row & 0x0F;
        const tilemapOffset = (blockY * BLOCKS_W + blockX) * 256 + cellY * BLOCK_CELLS + cellX;

        const metatileId = tilemapData[MAP_HEADER_SIZE + tilemapOffset];
        const mask = metatileBlockMask[metatileId];

        if (mask === 0x0F) fullyBlocked++;
        else if (mask !== 0) partialBlocked++;
        if (mask !== 0) totalBlocked++;

        const byteOffset = row * 32 + (col >> 1);
        if (col & 1) {
            collisionMap[byteOffset] |= (mask << 4);
        } else {
            collisionMap[byteOffset] |= mask;
        }
    }
}

console.log(`Collision map: ${totalBlocked} / ${MAP_W * MAP_H} cells have blocked quads (${((totalBlocked / (MAP_W * MAP_H)) * 100).toFixed(1)}%)`);
console.log(`  Fully blocked (all 4 quads): ${fullyBlocked}`);
console.log(`  Partially blocked: ${partialBlocked}`);
console.log(`  Fully passable: ${MAP_W * MAP_H - totalBlocked}`);

// ---------------------------------------------------------------------------
// Write output
// ---------------------------------------------------------------------------
const outPath = join(__dirname, 'walkable_map_collision.raw.bin');
writeFileSync(outPath, collisionMap);
console.log(`\nWrote ${outPath} (${collisionMap.length} bytes)`);
