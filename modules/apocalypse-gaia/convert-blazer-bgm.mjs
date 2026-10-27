#!/usr/bin/env node
/**
 * convert-blazer-bgm.mjs — Convert Soul Blazer BGM to IoG SPC format
 *
 * Same N-SPC engine, different ARAM layout and BRR sample library.
 * Remaps addresses, relocates sequence pointers, builds IoG-format
 * instrument definitions, DIR entries, slot table, and BRR footer
 * using IoG's ROM bank $C5 sub-blocks.
 *
 * Usage: node convert-blazer-bgm.mjs [input.bgm] [output.bgm]
 */

import { readFileSync, writeFileSync } from 'fs';
import { resolve } from 'path';

// ── Helpers ────────────────────────────────────────────────

function readU16(buf, off) { return buf[off] | (buf[off + 1] << 8); }
function writeU16(buf, off, v) { buf[off] = v & 0xFF; buf[off + 1] = (v >> 8) & 0xFF; }
function hex(v) { return '$' + v.toString(16).toUpperCase().padStart(4, '0'); }

// ── IoG sample library ─────────────────────────────────────
//
// Every instrument sample in IoG ROM bank $C5, keyed by sample ID.
// The ID is both the ROM $C5 sub-block index (what the BGM footer loads)
// and the number used in IoG's sample-catalog.md.
//
//   size    — BRR bytes (== sub-block size)
//   loop    — loop point offset from sample start (== size for one-shots)
//   pitch   — IoG-tuned instrument pitch multiplier for this sample
//   adsr1/2 — IoG-tuned DSP envelope for this sample
//
// Loop offsets were read from the DIR tables of the shipped IoG BGMs.

const IOG_SAMPLES = {
  0x0E: { name: 'Electric guitar 1', size: 4842, loop: 1152, pitch: 0x0DA0, adsr1: 0xFF, adsr2: 0xE0 },
  0x0F: { name: 'Strings 1', size: 6588, loop: 9, pitch: 0x0490, adsr1: 0xFB, adsr2: 0xE0 },
  0x10: { name: 'Flute 1', size: 1449, loop: 1413, pitch: 0x03F0, adsr1: 0xFF, adsr2: 0x88 },
  0x11: { name: 'Glockenspiel', size: 702, loop: 666, pitch: 0x03F0, adsr1: 0xFF, adsr2: 0x8E },
  0x12: { name: 'Snare 1', size: 990, loop: 990, pitch: 0x0550, adsr1: 0xFF, adsr2: 0xE0 },
  0x13: { name: 'Jingle bell', size: 5067, loop: 5067, pitch: 0x05B0, adsr1: 0xFF, adsr2: 0xE0 },
  0x14: { name: 'Acoustic guitar 1', size: 2052, loop: 1935, pitch: 0x0D00, adsr1: 0xFF, adsr2: 0x70 },
  0x15: { name: 'Pan flute', size: 2871, loop: 2790, pitch: 0x08F0, adsr1: 0xF8, adsr2: 0x8A },
  0x16: { name: 'Woodblock 1', size: 1971, loop: 1971, pitch: 0x07A0, adsr1: 0xFF, adsr2: 0xE0 },
  0x17: { name: 'Bongo', size: 1971, loop: 1971, pitch: 0x07A0, adsr1: 0xFF, adsr2: 0xE0 },
  0x18: { name: 'Chirp 1', size: 1863, loop: 1863, pitch: 0x02A0, adsr1: 0xFF, adsr2: 0xE0 },
  0x19: { name: 'Chirp 2', size: 1863, loop: 1863, pitch: 0x0280, adsr1: 0xFF, adsr2: 0xE0 },
  0x1A: { name: 'Choir 1', size: 5148, loop: 9, pitch: 0x02F0, adsr1: 0xF8, adsr2: 0xE0 },
  0x1B: { name: 'Pizzicato strings 1', size: 1134, loop: 1089, pitch: 0x04F0, adsr1: 0xBF, adsr2: 0x6C },
  0x1C: { name: 'Strings 2', size: 4257, loop: 927, pitch: 0x08F0, adsr1: 0xF9, adsr2: 0xE0 },
  0x1D: { name: 'Tom-tom 1', size: 5625, loop: 5625, pitch: 0x03D0, adsr1: 0xFF, adsr2: 0xF1 },
  0x1E: { name: 'Synth brass 1', size: 1926, loop: 1890, pitch: 0x03F0, adsr1: 0xFF, adsr2: 0xA8 },
  0x1F: { name: 'Horn 1', size: 1557, loop: 1395, pitch: 0x0470, adsr1: 0xFF, adsr2: 0xA8 },
  0x20: { name: 'Strings 3', size: 7830, loop: 414, pitch: 0x0470, adsr1: 0xFC, adsr2: 0xE0 },
  0x21: { name: 'Trumpet 1', size: 1098, loop: 1071, pitch: 0x02F0, adsr1: 0xAF, adsr2: 0x88 },
  0x22: { name: 'Piccolo', size: 1251, loop: 1215, pitch: 0x03F0, adsr1: 0xF8, adsr2: 0xA8 },
  0x23: { name: 'Muted trumpet 1', size: 1071, loop: 1017, pitch: 0x05F0, adsr1: 0xFC, adsr2: 0xAA },
  0x24: { name: 'Orchestra hit 1', size: 3348, loop: 3348, pitch: 0x0280, adsr1: 0xFF, adsr2: 0xE0 },
  0x25: { name: 'Koto', size: 1035, loop: 954, pitch: 0x0470, adsr1: 0xCF, adsr2: 0x52 },
  0x26: { name: 'Orchestra hit 2', size: 2817, loop: 2817, pitch: 0x01F0, adsr1: 0xFF, adsr2: 0xE0 },
  0x27: { name: 'Choir 2', size: 11961, loop: 9, pitch: 0x0350, adsr1: 0xF9, adsr2: 0xA8 },
  0x28: { name: 'Electric piano', size: 2394, loop: 2358, pitch: 0x03F0, adsr1: 0xFF, adsr2: 0x8C },
  0x29: { name: 'Trumpet 2', size: 1125, loop: 1098, pitch: 0x02F0, adsr1: 0xAF, adsr2: 0x88 },
  0x2A: { name: 'Piano', size: 3537, loop: 3456, pitch: 0x0470, adsr1: 0xFF, adsr2: 0x8C },
  0x2B: { name: 'Bass', size: 1179, loop: 954, pitch: 0x1900, adsr1: 0x9F, adsr2: 0x68 },
  0x2C: { name: 'Acoustic guitar 2', size: 3600, loop: 1557, pitch: 0x0900, adsr1: 0xAF, adsr2: 0x4C },
  0x2D: { name: 'Cymbal 1', size: 8442, loop: 8442, pitch: 0x03D0, adsr1: 0xFF, adsr2: 0x8D },
  0x2E: { name: 'Electric guitar 2', size: 4257, loop: 927, pitch: 0x08F0, adsr1: 0xF9, adsr2: 0xE0 },
  0x2F: { name: 'Tom-tom 2', size: 5625, loop: 5625, pitch: 0x03D0, adsr1: 0xFF, adsr2: 0xF1 },
  0x30: { name: 'Cymbal 2', size: 8442, loop: 8442, pitch: 0x03D0, adsr1: 0xFF, adsr2: 0x8D },
  0x31: { name: 'Snare 2', size: 990, loop: 990, pitch: 0x0550, adsr1: 0xFF, adsr2: 0xE0 },
  0x32: { name: 'Horn 2', size: 1557, loop: 1395, pitch: 0x0470, adsr1: 0xFF, adsr2: 0xA8 },
  0x33: { name: 'Synth brass 2', size: 1926, loop: 1890, pitch: 0x03F0, adsr1: 0xFF, adsr2: 0xA8 },
  0x34: { name: 'Muted Trumpet 2', size: 1071, loop: 1017, pitch: 0x05F0, adsr1: 0xFC, adsr2: 0xAB },
  0x35: { name: 'Strings 4', size: 7830, loop: 414, pitch: 0x0470, adsr1: 0xFC, adsr2: 0xE0 },
  0x36: { name: 'Pizzicato strings 2', size: 1134, loop: 1089, pitch: 0x04F0, adsr1: 0xBF, adsr2: 0x6C },
  0x37: { name: 'Flute 2', size: 1449, loop: 1413, pitch: 0x03F0, adsr1: 0xFF, adsr2: 0x88 },
  0x38: { name: 'Choir 3', size: 5004, loop: 3654, pitch: 0x0470, adsr1: 0xFF, adsr2: 0xCA },
  0x39: { name: 'Woodblock 2', size: 621, loop: 621, pitch: 0x07A0, adsr1: 0xFF, adsr2: 0xFE },
  0x3A: { name: 'Waterdrop', size: 1413, loop: 1413, pitch: 0x03D0, adsr1: 0xFF, adsr2: 0xE0 },
  0x3B: { name: 'Squawk', size: 2538, loop: 2538, pitch: 0x0240, adsr1: 0xFF, adsr2: 0xE0 },
};

// ── Instrument mapping (EDIT THIS) ─────────────────────────
//
// One entry per Blazer instrument, in Blazer order. The array index is the
// value the song's $E0 (set instrument) command uses, and — for the two
// percussion hits — the index `$5F + (note − $CA)` with $5F = 6 (set by the
// song's $FA 6), so:
//
//   index 0–5   melodic instruments ($E0 0 … $E0 5)
//   index 6     percussion byte $CA  (ch4 only)
//   index 7     percussion byte $CB  (ch4 + ch5, the main beat)
//
// Every entry gets its OWN SRCN ($0E + index) and its own instrument
// definition; nothing is shared between entries.
//
//   iog     — IoG sample ID from IOG_SAMPLES above
//   pitch   — (optional) override IoG's tuned instrument pitch
//   adsr1/2 — (optional) override IoG's tuned envelope
//
// How the Blazer instruments are actually used in this song
// (derived from the sequence data, not guessed):
//
//   0  ch0/ch6, G#2–C4   melody lead                          → French horn
//   1  (never played)
//   2  ch0/ch6, F#2–C#4  brief tonal voice (21 notes)
//   3  ch2 C1–F2 bass line, ch0/ch6 C#3–C#4 (128 notes)      → bass
//   4  ch1/ch7, C#3–C#5  sustained, slow-attack voice (192)  → string pad
//   5  ch3, E2–C4        short accent stabs (35 notes)
//   6  ch4  $CA ×122     low thump (pure low tone, ~30 ms)    → kick / low drum
//   7  ch5  $CB ×430     noisy hit (main beat)                → snare

//11 10 1d 14 1f 12 18 19
const INSTRUMENT_MAP3 = [
  /* 0 lead         */ { iog: 0x1F },  // Horn 1 (French horn)
  /* 1 (unused)     */ { iog: 0x14 },  // Acoustic guitar 1
  /* 2 tonal voice  */ { iog: 0x10 },  // Flute 1
  /* 3 bass         */ { iog: 0x2B },  // Bass
  /* 4 string pad   */ { iog: 0x1C },  // Strings 2
  /* 5 accent stab  */ { iog: 0x1B },  // Pizzicato strings 1
  /* 6 kick         */ { iog: 0x1D },  // Tom-tom 1
  /* 7 snare        */ { iog: 0x12 },  // Snare 1
];

//1f 14 11 0f 18 19 1a
const INSTRUMENT_MAP = [
  { iog: 0x1C },  // Strings 2
  { iog: 0x2B },  // Acoustic guitar 1
  { iog: 0x1F },  // Flute 1
  { iog: 0x32 },  // Bass
  { iog: 0x1D },  // Strings 2
  { iog: 0x12 },  // Pizzicato strings 1
  { iog: 0x1E },  // Tom-tom 1
  //{ iog: 0x12 },  // Snare 1
];

const SRCN_BASE = 0x0E;  // first non-SFX SRCN (SFX owns $00–$0D)

// BRR must stay below the highest sample end used by any shipped IoG BGM
// (great_pyramid, $BE54); above that lies the echo buffer.
const ARAM_BRR_LIMIT = 0xBE54;

// ── N-SPC opcode parameter counts ──────────────────────────

const PARAM_COUNTS = new Map([
  [0xE0, 1], [0xE1, 1], [0xE2, 2], [0xE3, 3], [0xE4, 0],
  [0xE5, 1], [0xE6, 2], [0xE7, 1], [0xE8, 2], [0xE9, 1],
  [0xEA, 1], [0xEB, 3], [0xEC, 0], [0xED, 1], [0xEE, 2],
  [0xEF, 3], [0xF0, 1], [0xF1, 3], [0xF2, 3], [0xF3, 0],
  [0xF4, 1], [0xF5, 3], [0xF6, 0], [0xF7, 3], [0xF8, 3],
  [0xF9, 3], [0xFA, 1],
]);

// ── ARAM layout constants ──────────────────────────────────

const IOG_SEQ_BASE   = 0x5532;   // Standard sequence base — preserves SFX data at $1400
const IOG_INST_BASE  = 0x1200;   // Instrument definition array base
const IOG_DIR_BASE   = 0x1000;   // Sample directory base (DSP DIR register = $10)
const IOG_DV_ADDR    = 0x1300;   // Duration/velocity table
const IOG_SONG_PTR   = 0x0FFC;   // Song base pointer
const IOG_SAMP_END   = 0x0FFE;   // Sample end pointer
const IOG_SLOT_ADDR  = 0x0FE0;   // Slot table base

const BLAZER_SEQ_BASE = 0x1000;  // Where Blazer puts sequence data

// ── Sequence pointer relocation ────────────────────────────

function relocateSequenceData(seqBuf, oldBase, newBase) {
  const delta = newBase - oldBase;
  const out = Buffer.from(seqBuf);
  const blockEnd = oldBase + seqBuf.length;
  const isInBlock = a => a >= oldBase && a < blockEnd;
  const toOff = a => a - oldBase;

  function adj(off) {
    const v = readU16(out, off);
    if (v === 0 || v === 0x00FF || !isInBlock(v)) return v;
    writeU16(out, off, v + delta);
    return v + delta;
  }

  // Song pointer table (first 2 bytes → phrase list)
  adj(0);
  const phraseOff = toOff(readU16(seqBuf, 0));

  // Phrase list → pattern pointers
  const patterns = new Set();
  let pos = phraseOff;
  while (pos + 2 <= seqBuf.length) {
    const raw = readU16(seqBuf, pos);
    if (raw === 0) { pos += 2; break; }
    if (raw === 0x00FF) { pos += 2; adj(pos); pos += 2; continue; }
    adj(pos); patterns.add(raw); pos += 2;
  }

  // Patterns → channel pointers
  const channels = new Set();
  for (const pa of patterns) {
    const po = toOff(pa);
    if (po + 16 > seqBuf.length) continue;
    for (let ch = 0; ch < 8; ch++) {
      const raw = readU16(seqBuf, po + ch * 2);
      if (raw === 0) continue;
      adj(po + ch * 2); channels.add(raw);
    }
  }

  // Channel data — $F8/$F9 address operands
  const visited = new Set();
  const queue = [...channels];
  while (queue.length) {
    const addr = queue.pop();
    if (visited.has(addr)) continue;
    visited.add(addr);
    let off = toOff(addr);
    while (off < seqBuf.length) {
      const b = seqBuf[off];
      if (b === 0) break;
      if (b <= 0xDF) { off++; continue; }
      if (b > 0xFA) { off++; continue; }
      const p = PARAM_COUNTS.get(b); off++;
      if ((b === 0xF8 || b === 0xF9) && off + 2 <= seqBuf.length) {
        const raw = readU16(seqBuf, off);
        if (isInBlock(raw)) {
          writeU16(out, off, raw + delta);
          if (b === 0xF8 && !visited.has(raw)) queue.push(raw);
        }
        off += 3;
      } else { off += p; }
    }
  }
  return out;
}

// ── Main ───────────────────────────────────────────────────

const h2 = v => '$' + v.toString(16).toUpperCase().padStart(2, '0');

function block(target, payload) {
  const hdr = Buffer.alloc(4);
  writeU16(hdr, 0, payload.length);
  writeU16(hdr, 2, target);
  return Buffer.concat([hdr, payload]);
}

function u16Buf(v) { const b = Buffer.alloc(2); writeU16(b, 0, v); return b; }

function main() {
  const args = process.argv.slice(2);
  const inputPath = args[0] || resolve(import.meta.dirname, 'music_0C0000.bgm');
  const outputPath = args[1] || inputPath.replace('.bgm', '_iog.bgm');

  const data = readFileSync(inputPath);
  let offset = 0;
  let seqPayload = null, seqOldTarget = 0, dvPayload = null;
  const blazerInstruments = [];  // Original Blazer instrument bytes

  console.log('=== Blazer → IoG BGM conversion ===\n');

  // ── Pass 1: read Blazer blocks ──

  while (offset + 4 <= data.length) {
    const size = readU16(data, offset);
    const target = readU16(data, offset + 2);
    if (size === 0) { offset += 4; break; }
    const payload = Buffer.from(data.subarray(offset + 4, offset + 4 + size));

    if (target >= 0x2E00 && target < 0x2F00 && size >= 6) {
      for (let i = 0; i < Math.floor(size / 6); i++) {
        blazerInstruments.push(payload.subarray(i * 6, (i + 1) * 6));
      }
      console.log(`  Source instruments: ${blazerInstruments.length} (${size}B at ${hex(target)})`);
    }
    if (target === 0x2F00) {
      dvPayload = payload;
      console.log(`  DV table: ${size}B → ${hex(IOG_DV_ADDR)}`);
    }
    if (target >= 0x0800 && target < 0x2C00 && target !== 0x0FFD && size > 100) {
      seqPayload = payload;
      seqOldTarget = target;
      console.log(`  Sequence: ${size}B at ${hex(target)}`);
    }
    // Blazer DIR / sample end / instruments are rebuilt below for IoG.
    offset += 4 + size;
  }

  if (!seqPayload) { console.error('ERROR: No sequence data found in Blazer BGM'); process.exit(1); }
  if (!dvPayload) { console.error('ERROR: No DV table found in Blazer BGM'); process.exit(1); }

  const instCount = INSTRUMENT_MAP.length;
  if (blazerInstruments.length !== instCount) {
    console.error(`ERROR: INSTRUMENT_MAP has ${instCount} entries but the Blazer song defines ${blazerInstruments.length}`);
    process.exit(1);
  }
  for (const [i, m] of INSTRUMENT_MAP.entries()) {
    if (!IOG_SAMPLES[m.iog]) { console.error(`ERROR: instrument ${i}: unknown IoG sample ${h2(m.iog)}`); process.exit(1); }
  }

  // ── BRR ARAM layout ──
  // BRR sub-blocks are loaded back-to-back from the terminator target, in
  // footer order. Each distinct IoG sample is loaded once.

  const termTarget = IOG_SEQ_BASE + seqPayload.length;
  const loadOrder = [];                 // IoG sample IDs in footer order
  for (const m of INSTRUMENT_MAP) if (!loadOrder.includes(m.iog)) loadOrder.push(m.iog);

  const sampleAram = new Map();         // IoG sample ID → ARAM start
  let aramCursor = termTarget;
  for (const id of loadOrder) {
    sampleAram.set(id, aramCursor);
    aramCursor += IOG_SAMPLES[id].size;
  }
  const sampleEndAddr = aramCursor;
  if (sampleEndAddr > ARAM_BRR_LIMIT) {
    console.error(`ERROR: BRR data ends at ${hex(sampleEndAddr)}, past the safe limit ${hex(ARAM_BRR_LIMIT)}`);
    process.exit(1);
  }

  console.log(`\n  BRR layout from ${hex(termTarget)}:`);
  for (const id of loadOrder) {
    const s = IOG_SAMPLES[id], a = sampleAram.get(id);
    console.log(`    sub-block ${h2(id)} ${s.name.padEnd(20)} ${String(s.size).padStart(5)}B → ARAM ${hex(a)}–${hex(a + s.size - 1)}`);
  }
  console.log(`    Sample end: ${hex(sampleEndAddr)}  (limit ${hex(ARAM_BRR_LIMIT)})`);

  // ── Instrument definitions, DIR, slot table ──
  // Instrument i → SRCN = SRCN_BASE + i. The slot table maps $E0 param i to
  // that SRCN; the engine reads the definition at $1200 + SRCN*6 and writes
  // byte 0 (the same SRCN) to the DSP, which indexes DIR[SRCN].

  const instBuf = Buffer.alloc(instCount * 6);
  const dirBuf = Buffer.alloc(instCount * 4);
  const slotBuf = Buffer.alloc(instCount);

  console.log(`\n  Instruments (${instCount}):`);
  for (let i = 0; i < instCount; i++) {
    const m = INSTRUMENT_MAP[i];
    const s = IOG_SAMPLES[m.iog];
    const blazer = blazerInstruments[i];
    const srcn = SRCN_BASE + i;
    const pitch = m.pitch ?? s.pitch;
    const adsr1 = m.adsr1 ?? s.adsr1;
    const adsr2 = m.adsr2 ?? s.adsr2;

    instBuf[i * 6 + 0] = srcn;
    instBuf[i * 6 + 1] = adsr1;
    instBuf[i * 6 + 2] = adsr2;
    instBuf[i * 6 + 3] = blazer[3];            // GAIN (unused while ADSR1 bit 7 set)
    instBuf[i * 6 + 4] = (pitch >> 8) & 0xFF;
    instBuf[i * 6 + 5] = pitch & 0xFF;

    const aram = sampleAram.get(m.iog);
    writeU16(dirBuf, i * 4, aram);
    writeU16(dirBuf, i * 4 + 2, aram + s.loop);

    slotBuf[i] = srcn;

    console.log(`    [${i}] SRCN ${h2(srcn)} ← IoG ${h2(m.iog)} ${s.name.padEnd(20)} pitch=${hex(pitch)} ADSR=${h2(adsr1)}/${h2(adsr2)}   (Blazer was SRCN ${h2(blazer[0])} pitch=${hex((blazer[4] << 8) | blazer[5])} ADSR=${h2(blazer[1])}/${h2(blazer[2])})`);
  }

  const instTarget = IOG_INST_BASE + SRCN_BASE * 6;
  const dirTarget = IOG_DIR_BASE + SRCN_BASE * 4;

  console.log(`\n  INST at ${hex(instTarget)} (${instBuf.length}B), DIR at ${hex(dirTarget)} (${dirBuf.length}B), slot table at ${hex(IOG_SLOT_ADDR)}`);
  for (let i = 0; i < instCount; i++) {
    console.log(`    DIR[${h2(SRCN_BASE + i)}]: start=${hex(readU16(dirBuf, i * 4))} loop=${hex(readU16(dirBuf, i * 4 + 2))}`);
  }

  // ── Relocated sequence ──

  const relocated = relocateSequenceData(seqPayload, seqOldTarget, IOG_SEQ_BASE);
  console.log(`\n  Sequence: ${relocated.length}B → ${hex(IOG_SEQ_BASE)}`);

  // ── Footer (IoG SpcBlockTransfer Phase 2) ──
  // [u8 count] [u8 ROM $C5 sub-block index × count]

  const footer = Buffer.from([loadOrder.length, ...loadOrder]);

  // ── Assemble in the same block order as shipped IoG BGMs ──
  // INST → DV → SEQ → DIR → $0FFC → $0FFE → $0FE0 → terminator → footer
  // $0FFC = song base (engine adds +2 to skip the song pointer table entry).

  const out = Buffer.concat([
    block(instTarget, instBuf),
    block(IOG_DV_ADDR, dvPayload),
    block(IOG_SEQ_BASE, relocated),
    block(dirTarget, dirBuf),
    block(IOG_SONG_PTR, u16Buf(IOG_SEQ_BASE)),
    block(IOG_SAMP_END, u16Buf(sampleEndAddr)),
    block(IOG_SLOT_ADDR, slotBuf),
    Buffer.from([0, 0, termTarget & 0xFF, termTarget >> 8]),
    footer,
  ]);

  writeFileSync(outputPath, out);

  console.log(`  $0FFC song base → ${hex(IOG_SEQ_BASE)}   $0FFE sample end → ${hex(sampleEndAddr)}`);
  console.log(`  $0FE0 slot table: [${[...slotBuf].map(h2).join(', ')}]`);
  console.log(`  TERM target: ${hex(termTarget)}   Footer: count=${footer[0]} [${[...footer.subarray(1)].map(h2).join(', ')}]`);
  console.log(`\n  ${data.length}B → ${out.length}B  ✓\n`);
}

main();
