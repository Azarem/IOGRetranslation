#!/usr/bin/env node
//
// gen-warp-tables.mjs — Generate warp-prep tables for the debug menu.
//
// Parses scene_warps.asm (reverse-maps incoming warps per destination scene)
// and debug_man.asm (developer-intended spawn points as overrides).
// Outputs ASM word tables: warp_x_table, warp_y_table, warp_dir_table,
// warp_cam_table — parallel to scene_id_table in debug_menu_tables.asm.
//
// Usage:  node gen-warp-tables.mjs
// Output: stdout (paste into debug_menu_tables.asm)

import { readFileSync } from 'fs';
import { resolve, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

const groupsPath   = resolve(__dirname, '../../../../gaia-iog-baserom/db-us/groups.json');
const warpsPath    = resolve(__dirname, '../../../../gaia-iog-baserom/extracted/tables/scene_warps.asm');
const debugManPath = resolve(__dirname, '../../../../gaia-iog-baserom/extracted/actors/debug_man.asm');

// ---------------------------------------------------------------------------
// 1. Read groups.json and build the ordered entry list (same as scene_id_table)
// ---------------------------------------------------------------------------

const groups = JSON.parse(readFileSync(groupsPath, 'utf8'));

// Build the ordered list: [ { sceneId, description, isHeader }, ... ]
const entries = [];
for (const [groupKey, group] of Object.entries(groups)) {
  // Section header
  entries.push({ sceneId: 0, description: `-- ${group.scenes ? Object.values(group.scenes)[0]?.description?.split(' - ')[0] || groupKey : groupKey} --`, isHeader: true, groupKey });
  // Actually, use the group key formatted as a header
  // Re-derive group name from the key
  const groupName = groupKey.replace(/_/g, ' ').replace(/\b\w/g, c => c.toUpperCase());
  entries[entries.length - 1].description = `-- ${groupName} --`;

  if (group.scenes) {
    for (const [sceneKey, scene] of Object.entries(group.scenes)) {
      entries.push({ sceneId: scene.id, description: scene.description, isHeader: false });
    }
  }
}

console.error(`Total entries: ${entries.length}`);

// ---------------------------------------------------------------------------
// 2. Parse scene_warps.asm — extract all scene-warp entries to build reverse map
// ---------------------------------------------------------------------------

const warpsAsm = readFileSync(warpsPath, 'utf8');

// Regex for: scene-warp < #trigL, #trigT, #trigW, #trigH, #destScene, #$destX, #$destY, #facing, #$camera >
const sceneWarpRe = /scene-warp\s*<\s*#([0-9A-Fa-f]+),\s*#([0-9A-Fa-f]+),\s*#([0-9A-Fa-f]+),\s*#([0-9A-Fa-f]+),\s*#([0-9A-Fa-f]+),\s*#\$([0-9A-Fa-f]+),\s*#\$([0-9A-Fa-f]+),\s*#([0-9A-Fa-f]+),\s*#\$([0-9A-Fa-f]+)\s*>/gi;

// reverseMap: sceneId → { x, y, dir, cam }  (first hit wins)
const reverseMap = new Map();

let m;
while ((m = sceneWarpRe.exec(warpsAsm)) !== null) {
  const destScene = parseInt(m[5], 16);
  if (destScene === 0) continue; // skip null warps
  if (reverseMap.has(destScene)) continue; // first hit wins

  reverseMap.set(destScene, {
    x:   parseInt(m[6], 16),
    y:   parseInt(m[7], 16),
    dir: parseInt(m[8], 16),
    cam: parseInt(m[9], 16),
  });
}

console.error(`Reverse-mapped ${reverseMap.size} destination scenes from scene_warps.asm`);

// ---------------------------------------------------------------------------
// 3. Parse debug_man.asm — QueueMapChange overrides (preferred spawn points)
// ---------------------------------------------------------------------------

const debugManAsm = readFileSync(debugManPath, 'utf8');

// Regex for: COP [QueueMapChange] ( #scene, #$x, #$y, #dir, #$cam )
const qmcRe = /COP\s*\[QueueMapChange\]\s*\(\s*#([0-9A-Fa-f]+),\s*#\$([0-9A-Fa-f]+),\s*#\$([0-9A-Fa-f]+),\s*#([0-9A-Fa-f]+),\s*#\$([0-9A-Fa-f]+)\s*\)/gi;

const overrides = new Map();

while ((m = qmcRe.exec(debugManAsm)) !== null) {
  const destScene = parseInt(m[1], 16);
  const x   = parseInt(m[2], 16);
  const y   = parseInt(m[3], 16);
  const dir = parseInt(m[4], 16);
  const cam = parseInt(m[5], 16);
  if (x === 0 && y === 0) continue;
  if (!overrides.has(destScene)) {
    overrides.set(destScene, { x, y, dir, cam });
  }
}

console.error(`Override spawn points from debug_man.asm: ${overrides.size}`);

// ---------------------------------------------------------------------------
// 3b. Scan ALL extracted ASM for QueueMapChange — secondary gap-fill source
// ---------------------------------------------------------------------------

import { readdirSync, statSync } from 'fs';

function walkDir(dir) {
  const results = [];
  for (const name of readdirSync(dir)) {
    const full = resolve(dir, name);
    const st = statSync(full);
    if (st.isDirectory()) results.push(...walkDir(full));
    else if (name.endsWith('.asm')) results.push(full);
  }
  return results;
}

const extractedRoot = resolve(__dirname, '../../../../gaia-iog-baserom/extracted');
const allAsmFiles = walkDir(extractedRoot);
const scriptWarps = new Map();

for (const file of allAsmFiles) {
  if (file === debugManPath) continue; // already processed
  const content = readFileSync(file, 'utf8');
  const re = /COP\s*\[QueueMapChange\]\s*\(\s*#([0-9A-Fa-f]+),\s*#\$([0-9A-Fa-f]+),\s*#\$([0-9A-Fa-f]+),\s*#([0-9A-Fa-f]+),\s*#\$([0-9A-Fa-f]+)\s*\)/gi;
  let sm;
  while ((sm = re.exec(content)) !== null) {
    const destScene = parseInt(sm[1], 16);
    const x   = parseInt(sm[2], 16);
    const y   = parseInt(sm[3], 16);
    const dir = parseInt(sm[4], 16);
    const cam = parseInt(sm[5], 16);
    if (x === 0 && y === 0) continue;
    if (!scriptWarps.has(destScene)) {
      scriptWarps.set(destScene, { x, y, dir, cam });
    }
  }
}

console.error(`Script QueueMapChange gap-fill: ${scriptWarps.size} scenes`);

// ---------------------------------------------------------------------------
// 4. Merge: overrides → reverseMap → defaults
// ---------------------------------------------------------------------------

const defaultWarp = { x: 0x0080, y: 0x0080, dir: 0, cam: 0x1100 };

function getWarp(sceneId) {
  if (sceneId === 0) return { x: 0, y: 0, dir: 0, cam: 0 }; // section header
  if (overrides.has(sceneId)) return overrides.get(sceneId);   // debug_man
  if (reverseMap.has(sceneId)) return reverseMap.get(sceneId); // scene_warps
  if (scriptWarps.has(sceneId)) return scriptWarps.get(sceneId); // QueueMapChange scripts
  return defaultWarp;
}

// ---------------------------------------------------------------------------
// 5. Output ASM tables
// ---------------------------------------------------------------------------

function hex4(v) { return v.toString(16).toUpperCase().padStart(4, '0'); }
function hex2(v) { return v.toString(16).toUpperCase().padStart(2, '0'); }

const lines = [];

lines.push('---------------------------------------------');
lines.push('; Warp prep tables — parallel to scene_id_table.');
lines.push('; One word per entry. Section headers ($0000) have zeroed data.');
lines.push(';');
lines.push('; Sources (priority order):');
lines.push(';   1. debug_man.asm QueueMapChange overrides (developer spawn points)');
lines.push(';   2. scene_warps.asm reverse-mapped incoming warps (first hit)');
lines.push(';   3. Default fallback ($0080, $0080, $00, $1100)');
lines.push(';');
lines.push('; Written to QueueMapChange WRAM registers before scene transition:');
lines.push(';   $064C = spawnX    (warp_x_table)');
lines.push(';   $064E = spawnY    (warp_y_table)');
lines.push(';   $0650 = direction (warp_dir_table) — low byte only, bit 7 clear');
lines.push(';   $0652 = camera    (warp_cam_table)');
lines.push('');

// Emit each table
const tableNames = ['warp_x_table', 'warp_y_table', 'warp_dir_table', 'warp_cam_table'];
const fieldKeys  = ['x', 'y', 'dir', 'cam'];

for (let t = 0; t < 4; t++) {
  lines.push(`${tableNames[t]} [`);
  for (let i = 0; i < entries.length; i++) {
    const e = entries[i];
    const w = getWarp(e.sceneId);
    let val = w[fieldKeys[t]];
    // direction: mask off bit 7 (save-restore flag) and ensure word-sized
    if (fieldKeys[t] === 'dir') val = val & 0x7F;
    const idx = i.toString(16).toUpperCase().padStart(2, '0');
    const src = e.isHeader ? 'header'
      : overrides.has(e.sceneId) ? 'debug_man'
      : reverseMap.has(e.sceneId) ? 'warp'
      : scriptWarps.has(e.sceneId) ? 'script'
      : 'default';
    lines.push(`  #$${hex4(val)}   ; ${idx} - ${e.description} [${src}]`);
  }
  lines.push(']');
  lines.push('');
}

process.stdout.write(lines.join('\n') + '\n');
