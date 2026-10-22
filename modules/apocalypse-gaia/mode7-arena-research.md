# Mode 7 Arena Research — Apocalypse Gaia Phase 3

Research into implementing a Mode 7 rotating floor for the Phase 3 arena.

---

## Critical Discovery: The Boss Is NOT Currently Mode 7

Despite the source file being named `unused_mode7_boss.asm`, the boss fight runs in **Mode 1** (BGMODE `$09`), not Mode 7.

### Evidence

**Display preset `#$0C`** (used by scene `$EB` and all guardian fights `$F2`–`$F6`):

```
display-preset < #15, #02, #02, #31, #64, #05, #09, #04, #00, #00 >
                                                   ^^^^
                                                   Byte 6 = BGMODE
```

BGMODE `$09` = `0000_1001`:
- Bits 0–2: Mode **1** (not 7)
- Bit 3: BG3 priority bit set (Mode 1 special)

**scrollModeFlags** = `$04` (byte 7 of the preset). Bit 3 (`$08`) is **clear** — the VBlank Mode 7 matrix upload path is disabled. The engine does NOT write M7A–M7D or M7X/M7Y registers for this scene.

**No M7 register writes in the boss code**: grepping the entire `unused_mode7_boss.asm` for `$211A`–`$2120` or `M7SEL`/`M7A`/`M7B`/`M7C`/`M7D`/`M7X`/`M7Y` produces zero matches. The boss code never touches any Mode 7 hardware register.

**The `!mode7Tilemap` variable at `$7EE000`** is just a WRAM buffer label. The P2→P3 transition DMAs from it to VRAM `$5000`–`$5FFF`, which in Mode 1 is the OBJ name table 1 region — not Mode 7 tilemap area.

### What the "Mode 7" Label Actually Means

The developers likely **planned** a Mode 7 phase but never implemented it:
- The `$7EE000` buffer was meant to hold a Mode 7 tilemap
- The orbital cannon mechanics (8-directional targeting, sine/cosine positioning) would look dramatic against a rotating floor
- The `Mode7PerspectiveUpdate` thinker already existed and could have been spawned
- The transition DMA would have been redirected to Mode 7 VRAM (`$0000`–`$3FFF`)

The boss was abandoned before Mode 7 was wired in.

### Scenes That Actually Use Mode 7

Only two display presets set BGMODE to `$07`:

| Preset Index | BGMODE | scrollModeFlags | Used By |
|:---:|:---:|:---:|---|
| `#$19` | `$07` | `$1C` (bit 3 set) | World map (`$FE`), Sky Garden crash (`$59`), Angkor Wat vision (`$C0`) |
| `#$2D` | `$07` | `$1C` (bit 3 set) | Prologue prophecy (`$8C`), Prologue legends (`$8D`) |

---

## Question 1: Mode 7 Available Layers

In Mode 7, only **BG1** and **OBJ** (sprites) are available. BG2/BG3/BG4 do not exist in standard Mode 7.

### Standard Mode 7

| Layer | Status | Notes |
|-------|--------|-------|
| **BG1** | ✅ Transformed | 128×128 tilemap, 256 tiles at 8bpp, rotation/scaling via M7A–M7D |
| **BG2** | ❌ Does not exist | (unless EXTBG is enabled) |
| **BG3** | ❌ Does not exist | **No HUD/dialog layer** |
| **BG4** | ❌ Does not exist | |
| **OBJ** | ✅ Fully available | 128 sprites, normal priority/palette rules |

### Mode 7 EXTBG (via `SETINI` bit 6)

EXTBG reactivates BG2 as a **duplicate of BG1** split into two priority layers. The high bit of each tile pixel acts as a priority bit:

- BG2 low-priority: behind all sprites
- BG2 high-priority: in front of some sprites

BG2 in EXTBG is **NOT independently transformed or scrolled** — it's the same Mode 7 plane with priority splitting. Color depth drops to 7bpp (128 colors instead of 256).

Source: `gaia-knowledge/corpus/nesdev/backgrounds.md` §Mode 7 and §EXTBG.

### Mode 7 VRAM Layout

Mode 7 takes over the **first 32KB of VRAM** (word addresses `$0000`–`$3FFF`):

- **Even bytes**: 128×128 = 16,384 tilemap entries (1 byte per tile index)
- **Odd bytes**: 256 tiles × 64 bytes = 16,384 bytes of 8bpp tile character data

The upper 32KB (word addresses `$4000`–`$7FFF`) remains available for **OBJ tiles**. With `OBSEL=$02`, sprite tiles start at `$4000` — completely separate from Mode 7. **No VRAM conflict with existing boss sprites.**

### HUD Impact

IoG's HUD (HP bar, status) uses BG3, which **doesn't exist in Mode 7**. Options:

1. **Disable HUD** during Phase 3 — set `hudDisableFlag` bit 6 (`$09ED`)
2. **HDMA mode split** — Mode 7 for the arena portion, switch BGMODE mid-scanline via HDMA for a HUD strip at the bottom
3. **Sprite-based HP** — render HP as OBJ sprites instead of BG3 tiles

---

## Question 2: Billboarding & Perspective Techniques

### IoG's Proven Mode 7 Thinker

The engine includes `Mode7PerspectiveUpdate` at `$03A985`, used by **4 shipped scenes**:

| Scene | Description |
|-------|-------------|
| `$FE` — World Map | Rotating overworld surface |
| `$8C` — Prologue Prophecy | Vision sequence |
| `$59` — Sky Garden Crash | Plummet cutscene |
| `$C0` — Angkor Wat Vision | Future vision |

Source: `gaia-iog-baserom/extracted/thinkers/mode7_perspective.asm`

### How the Perspective Effect Works

The thinker computes a **per-scanline 2×2 rotation matrix** using SNES hardware dividers and delivers it via HDMA:

| HDMA Table | PPU Register | Matrix Entry |
|------------|:---:|---|
| `$7E7000` (672 bytes) | M7A (`$211B`) | cos θ / scale |
| `$7E7800` (672 bytes) | M7B (`$211C`) | sin θ / scale |
| `$7E8000` (672 bytes) | M7C (`$211D`) | −sin θ / scale |
| `$7E7000` (reused) | M7D (`$211E`) | cos θ / scale (= M7A for pure rotation) |

Each entry is 3 bytes: 1-byte scanline count (`$01`) + 2-byte data value.

### The Divisor-Accumulator Aliasing Trick

The perspective foreshortening is created through a clever memory aliasing:

```
Memory layout after NormalizeDivisor:
$00 = 0          ; accumulator high byte
$01 = 0          ; accumulator low byte (shares with divisor pair)
$02 = scale      ; divisor / accumulator high byte
$03 = 0          ; scale high byte (zeroed by normalization)
$04-$05 = rotation increment (16-bit)
```

Each scanline executes (in 16-bit mode):

```asm
LDA $04           ; 16-bit rotation increment
CLC
ADC $01           ; add to 16-bit accumulator at $01-$02
STA $01           ; MODIFIES $02 (the divisor) via high-byte addition!
```

The high byte of the increment directly adds to `$02` per scanline, making the **divisor grow linearly**. Larger divisor → smaller cos/scale and sin/scale → more zoomed out. Top scanlines (small divisor) are close; bottom scanlines (large divisor) are far. This is the perspective.

### Actor-Controlled Parameters

The thinker is driven by three actor fields, modifiable at runtime:

| Field | Role | Default |
|-------|------|---------|
| `$B6` | Rotation angle (per-scanline increment) | `$0000` |
| `$B8` | Base scale (perspective distance) | `$0400` |
| `$BC` | Perspective rotation index (0–511, into sine/cosine tables) | `$0000` |

### "Billboarding" for a Boss Arena

Mario Kart-style billboarding:
- **BG1** = the transformed ground plane (arena floor)
- **OBJ sprites** = everything ON the plane (player, boss, projectiles)
- Sprites don't rotate with the plane — they "face the camera"

This maps directly to the boss fight:
- The arena floor (cosmic/comet surface) is Mode 7 BG1
- Player, boss core, cannons, projectiles are OBJ sprites
- The floor rotates/scales beneath them
- Sprites naturally "billboard" because OBJ rendering is independent of Mode 7

### Dynamic Arena Effects (via actor field manipulation)

The Brain actor could drive Mode 7 parameters per-frame:

| Effect | Implementation |
|--------|---------------|
| Slow rotation | `INC $BC` on the thinker every N frames |
| Damage pulse | Spike `$B8` (scale) on boss hit, decay over ~30 frames |
| Nuke wobble | Brief `$B6` acceleration on impact |
| Phase escalation | Increase rotation speed as boss HP drops |

---

## Question 3: Mixing Mode 7 with Sprites and Hitboxes

**Yes — the IoG combat engine is entirely sprite-to-sprite and completely independent of BG mode.**

### Combat Collision Is Render-List Based

The collision system (`combat_collision.asm`) iterates the **actor render list** (`$0C00`), not the BG tilemap:

> "The system uses the actor render list ($0C00, word-sized entries) as its iteration source — only actors in the render list are candidates for collision."

Source: `gaia-iog-baserom/extracted/system/engine/combat_collision.asm`, lines 7–8.

### Two Independent Hitbox Types

| Hitbox | Source | Fields | Used For |
|--------|--------|--------|----------|
| **Attack** (player weapon) | Metasprite header | `$0004`–`$0007` (X off, X width, Y off, Y height) | Player-attacks-enemy overlap test |
| **Passive/defense** (actor body) | Actor RAM | `$0020`–`$0023` (signed offsets from position) | Enemy-hits-player and PlayerAttackHitTest |

Both use **AABB rectangle overlap testing**. Neither touches `[$80]` (the tile collision map pointer).

### Tile Collision IS Affected — But Irrelevant

The **tile collision system** (`tile_collision_physics.asm`) reads collision data via `LDA [$80], Y`, which depends on the BG tilemap format. In Mode 7, the tilemap is a completely different format (128×128 single-byte entries vs. Mode 1's 32×32 two-byte entries), so tile collision reads would return garbage.

**This doesn't matter for a boss arena:**
- Tile collision handles wall/floor physics (preventing walking through walls)
- Boss arenas are open — no walls, no tile obstacles
- The guardian fight scenes already work without meaningful tile collision
- Solution: point `$80`–`$82` at a zeroed collision buffer (all passable) or don't change it (the scene's collision map is already loaded and will just mean "open space")

### What Changes for Mode 7

| System | Mode 1 (Current) | Mode 7 (Proposed) | Change Needed? |
|--------|:-:|:-:|:-:|
| Combat collision | Render list AABB | Render list AABB | **None** |
| Sprite rendering | OBJ layer | OBJ layer | **None** |
| Tile collision | `[$80], Y` tilemap | Not applicable | Clear collision pointer (or ignore) |
| Camera/scroll | Mode 1 scroll regs | M7HOFS/M7VOFS + thinker | Set `scrollModeFlags` bit 3 |
| BG rendering | Mode 1 tilemaps | Mode 7 tilemap | Different VRAM layout |
| HUD (BG3) | Works | **BG3 doesn't exist** | Disable or HDMA split |

---

## Question 4: Hitbox Without Visible Sprite

**Yes, with one constraint:** the actor must be in the **render list** (`$0C00`) to be collision-tested.

### The Render List Gate

`SortActorsByDepth` builds the render list and **excludes**:
- Off-screen actors (X/Y bounds culling against camera)
- Actors with `$10` bit `$2000` (hidden flag)

```asm
; sprite_composition.asm, SortActorsByDepth:
LDA $10
BIT #$2000            ; $2000: hidden — skip without creating buffer entry
BNE loc_03C687        ; → not added to render list
```

**An actor hidden via `$2000` will NOT be collision-tested**, because it won't appear in the render list that `RunCombatCollision` iterates.

### Creating an Invisible Hitbox Actor

**Option A — Y-Clipped Metasprite (Recommended)**

Create a metasprite with 1 sub-sprite where the Y coordinate is `$F0` or higher. The sprite compositor clips at Y=`$F0`, so the sprite is never rendered but the actor appears in the render list and has valid hitbox data.

```asm
; A "null" sprite group — 1 sub-sprite at Y=$F0 (clipped, invisible)
; but the metasprite header still has valid hitbox fields
ag_grp_invisible_hitbox [
  sprite-group < 01 >     ; MUST be ≥ 1 (0 wraps to 65535 iterations!)
  sprite-part < #00, #00, #00, #F0, #F0, #00, #00 >
]
```

Stage with `COP [StageSprAndHitbox]` which calls `UpdateActorAnimation` to populate `$0020`–`$0023` from the metasprite header. Actor is in the render list but produces no visible pixels.

**Option B — Manual Hitbox Fields**

Write to `$0020`–`$0023` directly without going through the metasprite system:

```asm
; Set custom hitbox bounds (signed 8-bit offsets from actor position)
SEP #$20
LDA #$F0              ; X offset (negative = left of center)
STA $0020, X
LDA #$20              ; X width
STA $0021, X
LDA #$F0              ; Y offset
STA $0022, X
LDA #$20              ; Y height
STA $0023, X
REP #$20
```

The actor still needs a staged metasprite (to avoid compositor issues) but the hitbox values are independent of it.

**Option C — Off-Screen Sprite Position**

Use a normal metasprite but position the sprite sub-sprites off-screen while the hitbox (which uses **actor** position, not sprite position) covers the desired area.

### Why 0 Sub-Sprites Is Catastrophic

The sub-sprite loop in `DecomposeActorMetasprites` uses `DEC $10; BNE`. If the sub-sprite count is 0, `DEC` wraps to `$FFFF` → 65,535 iterations → ~26.5M wasted cycles. Always use at least 1 sub-sprite (Y-clipped if invisible).

---

## IoG's Mode 7 Infrastructure

### VBlank Shadow Register Upload

When `scrollModeFlags` bit 3 (`$08`) is set, the VBlank handler uploads Mode 7 matrix registers from WRAM shadow locations:

```asm
; vblank_joypad.asm:
LDA $scrollModeFlags
BIT #$08              ; Mode 7 active?
BEQ skip_m7_upload
LDA $C2 : STA $M7A   ; M7A low byte
LDA $C3 : STA $M7A   ; M7A high byte (write-twice register)
LDA $C4 : STA $M7B   ; M7B low
LDA $C5 : STA $M7B   ; M7B high
LDA $C6 : STA $M7C   ; M7C low
LDA $C7 : STA $M7C   ; M7C high
LDA $C8 : STA $M7D   ; M7D low
LDA $C9 : STA $M7D   ; M7D high
LDA $CA : STA $M7X   ; M7X low
LDA $CB : AND #$1F : STA $M7X  ; M7X high (13-bit signed)
LDA $CC : STA $M7Y   ; M7Y low
LDA $CD : AND #$1F : STA $M7Y  ; M7Y high (13-bit signed)
```

Source: `gaia-iog-baserom/extracted/system/engine/vblank_joypad.asm`, line 112.

This path sets static (constant per frame) matrix values. The `Mode7PerspectiveUpdate` HDMA tables **override** these values on a per-scanline basis during active display.

### Mode7PerspectiveInit — Thinker Setup

```asm
; mode7_perspective.asm:
Mode7PerspectiveInit [
  thinker-def < #04, #08, {
    SEP #$20
    LDA #$80              ; M7SEL = $80: repeat character 0 outside playfield
    STA $M7SEL
    REP #$20
    LDA #$FFFF            ; Config flags
    STA $7F0B22
    LDA #$FFFF
    STA $7F0B24
    ; ... load initial position, set camera, init scale/rotation ...
    LDA #$0400            ; Base scale = $0400
    STA $00B8
  } >
]
```

### Spawning the Thinker (Existing Pattern)

Both `GardenCrashCutscene` and `FutureVisionCutscene` spawn the Mode 7 thinker the same way:

```asm
SEP #$20
STZ $M7SEL            ; M7SEL = $00 (or $80 for wrap)
REP #$20
LDA #$01
STA $TS               ; Enable BG1 on sub screen (for color math)
LDA #$01
STA $CGADSUB          ; Color addition on BG1
LDA #$82
STA $CGWSEL           ; Sub-screen backdrop enabled
COP [SpawnThinker] ( @mode7_perspective.Mode7PerspectiveUpdate )
; Store $0804 to spawned thinker's animScratch2 for TypeD dispatch priority
LDA #$0804
STA $7F000E, Y        ; Y = spawned thinker slot
```

### HDMA Channel Budget

The Mode 7 thinker uses 4 HDMA channels (M7A/B/C/D via COP `QueueDma`). The SNES has 8 HDMA channels total.

Current scene `$EB` uses:
- 1 channel: `sine_hdma_ending_wave` → BG2VOFS (register `$0F`)

During Phase 3, BG2 doesn't exist in Mode 7. The BG2 shimmer HDMA would be disabled, **freeing** 1 channel. 4 Mode 7 channels + remaining effects fit comfortably.

### Unused Alternate Thinker

`mode7_perspective_unused.asm` at `$03AB88`–`$03AD77` is a dead-code alternate implementation. **Do not use** — it lacks `NormalizeDivisor` (divisors > 255 would truncate) and uses fewer NOP delays (may read hardware divide results too early).

---

## Mode 7 Perspective Thinker — Performance Analysis

### Current Cost: 448 Hardware Divides Per Frame

Each of 224 scanlines performs 2 hardware divides:
1. `|cos| ÷ scale_n` → M7A table entry
2. `|sin| ÷ scale_n` → M7B table entry (negated copy → M7C)

The SNES 16÷8 hardware divider (`WRDIVL`/`WRDIVB` → `RDDIVL`) has a **16-cycle latency**. The 8×8 hardware multiplier (`WRMPYA`/`WRMPYB` → `RDMPYL`) has an **8-cycle latency**.

### Inner Loop Cycle Analysis

The inner loop per scanline (Quadrant 1 example):

```asm
LDY $02               ; ~4c  — load divisor (changes per scanline!)
LDA $18               ; ~4c  — |cos| (constant)
STA $WRDIVL           ; ~5c  — set dividend
STY $WRDIVB           ; ~5c  — set divisor, TRIGGERS 16-cycle divide
NOP ×6                ; ~12c — *** WASTED: only 4c of useful work available ***
INX                   ; ~2c  — advance table pointer (useful but trivial)
INX                   ; ~2c
LDA $RDDIVL           ; ~5c  — read cos/scale result
STA $7E6FFF, X        ; ~6c  — write to M7A table
LDA $1C               ; ~4c  — |sin| (constant)
STA $WRDIVL           ; ~5c  — set dividend
STY $WRDIVB           ; ~5c  — TRIGGERS 16-cycle divide
INX                   ; ~2c  — useful filler
LDA $04               ; ~4c  — rotation increment
CLC                   ; ~2c
ADC $01               ; ~4c  — accumulate (modifies divisor $02!)
STA $01               ; ~4c  — store back (~16c of useful work fills the wait)
LDA $RDDIVL           ; ~5c  — read sin/scale result
STA $7E77FE, X        ; ~6c  — write to M7B table
EOR #$FFFF            ; ~3c  — negate
INC                   ; ~2c
STA $7E7FFE, X        ; ~6c  — write to M7C table
BCS overflow          ; ~2c  — check accumulator overflow
DEC $0E               ; ~5c  — loop counter
BNE loop              ; ~3c
```

**Wasted cycles**: The first divide has ~12 cycles of NOPs because only ~4 cycles of useful work (2× `INX`) exist to fill the 16-cycle window. The second divide is well-utilized (~16 cycles of accumulator math fills the wait).

**Total wasted: ~12 cycles × 224 scanlines ≈ 2,700 cycles per frame** just on NOP stalls.

### Estimated Total Cost

The full thinker (init + 224-iteration quadrant loop + HDMA queue) costs approximately **8,000–10,000 CPU cycles per frame**. At ~59,600 cycles/frame (3.58 MHz ÷ 60 fps), this is **~15% of total CPU time**.

### PPU Multiply Cannot Be Used

The PPU multiplier (M7A × last-M7B-write → `$2134`–`$2136`) is **immediate** (no delay), but **cannot be used during active display** when HDMA is writing to M7A/M7B:

> "If an interrupt or HDMA transfer writes to a BG1 offset register or Mode7 Matrix in-between the two M7A writes the internal M7A value will be corrupted and MPY outputs the wrong value."

Source: `gaia-knowledge/corpus/nesdev/ppu-registers.md`, §MPYL.

The thinker runs during the game loop (active display period) while HDMA is actively writing M7 registers. The CPU multiply registers (`$4202`–`$4217`) are unaffected by HDMA and are always safe.

---

## Optimization Strategies

### Strategy 1: Half-Resolution + Interpolation (Best ROI)

Compute every **2nd scanline** (112 iterations × 2 divides = **224 divides**) and linearly interpolate the gaps.

Since we compute `f(n) = C / (S₀ + nΔ)` (a smooth 1/x curve), linear interpolation error is O(Δ²) — sub-pixel, completely invisible.

```asm
; Phase 1: Compute even scanlines (X steps by 6 instead of 3)
; Phase 2: Fill odd scanlines
InterpolateLoop:
  LDA table_A[n-1]    ; previous entry
  CLC
  ADC table_A[n+1]    ; next entry
  ROR                  ; (a + b) / 2 via ROR (preserves sign)
  STA table_A[n]       ; interpolated entry
  ; repeat for tables B and C
```

**Savings**: ~50% fewer divides. Net ~2,200 cycle savings after accounting for interpolation cost.

### Strategy 2: Reciprocal Table + CPU Multiply

Replace `cos ÷ scale` with `cos × reciprocal[scale]`. Precompute a 256-entry reciprocal table (512 bytes ROM):

```
reciprocal[n] = floor(65536 / n)
```

**Problem**: cos/sin are 16-bit, reciprocal is up to 16-bit. A full 16×16 multiply needs 4 partial 8×8 products (4 × 8 cycles = 32 cycles latency) = same total latency as 2 divides (2 × 16 cycles). **No net latency improvement.**

**Minor benefit**: 8-cycle multiply windows are easier to fill than 16-cycle divide windows, eliminating ~4 wasted cycles per scanline. Marginal gain (~900 cycles) for 512 bytes of ROM + added complexity.

### Strategy 3: Variable Precision

Near scanlines change rapidly (need full precision). Far scanlines are nearly constant (can skip):

| Region | Scanlines | Resolution | Divides |
|--------|:-:|:-:|:-:|
| Near (bottom) | 64 | Every scanline | 128 |
| Middle | 96 | Every 2nd | 96 |
| Far (top) | 64 | Every 4th | 32 |
| **Total** | 224 | | **256** (43% reduction) |

Interpolation fills the gaps. Error is smallest where resolution is lowest (far scanlines), making this perceptually lossless.

### Strategy 4: Flat Rotation (No HDMA, No Divides)

For a top-down boss arena, full perspective may not be needed. A **constant rotation matrix** (same values for all scanlines) creates a flat rotating disc:

```asm
; Once per frame, in the Brain actor:
SEP #$20
LDA cos_lo  : STA $C2    ; M7A shadow
LDA cos_hi  : STA $C3
LDA sin_lo  : STA $C4    ; M7B shadow
LDA sin_hi  : STA $C5
LDA nsin_lo : STA $C6    ; M7C shadow = -sin
LDA nsin_hi : STA $C7
LDA cos_lo  : STA $C8    ; M7D shadow = cos
LDA cos_hi  : STA $C9
LDA cx_lo   : STA $CA    ; M7X center
LDA cx_hi   : STA $CB
LDA cy_lo   : STA $CC    ; M7Y center
LDA cy_hi   : STA $CD
REP #$20
```

The VBlank handler uploads these to M7A–M7Y when `scrollModeFlags` bit 3 is set.

**Cost**: Zero hardware divides. Zero HDMA channels. ~30 cycles per frame.

**Trade-off**: No perspective foreshortening — the floor looks flat, not like a 3D plane receding into the distance. For a boss viewed from directly above, this may be the **correct visual**.

### Strategy 5: Two-Frame Split (Amortized)

Compute first half on even frames, second half on odd frames. Double-buffer HDMA tables (like `IrisCircleEffect`):

**Cost**: 224 divides per frame (50%). Uses ~4KB extra WRAM for double-buffering.

**Trade-off**: 1 frame of visual latency on rotation changes (invisible for slow rotation).

### Strategy 6: Pipelined Loop (Micro-Optimization)

Restructure the inner loop to start the **next** scanline's first divide while processing the current scanline's second result:

```
Current: [div1 → wait 16c → read] → [div2 → wait 16c → read] → next
Pipelined: [read div1 from prev] → [start div2] → [useful work] → [read div2] → [start div1 for next] → [loop overhead fills wait]
```

This moves the 6-NOP stall to the loop tail where branch/counter work fills the gap naturally.

**Savings**: ~10–12 cycles per scanline × 224 ≈ 2,500 cycles. Pure win with no quality loss.

### Comparison Table

| Strategy | Divides/Frame | Est. Cycles | % of Frame | Complexity | Quality Loss |
|----------|:---:|:---:|:---:|:---:|:---:|
| Original thinker | 448 | ~10,000 | ~15% | — | — |
| Half-res + interpolation | 224 | ~5,500 | ~9% | Low | Negligible |
| Variable precision | 256 | ~6,000 | ~10% | Medium | Negligible |
| Half-res + 2-frame split | 112 | ~3,500 | ~6% | Low | 1-frame latency |
| Pipelined loop | 448 | ~7,500 | ~12% | Low | None |
| Half-res + pipelined | 224 | ~4,500 | ~7% | Low | Negligible |
| Flat rotation (no HDMA) | 0 | ~30 | ~0.05% | Trivial | No perspective |

---

## Implementation Options for Phase 3

### Option A: Simple — Flat Rotation (Recommended Starting Point)

If a top-down rotating disc is sufficient:
- Switch BGMODE to `$07` at P2→P3 transition
- Set `scrollModeFlags` bit 3
- Write rotation matrix to VBlank shadow registers (`$C2`–`$CD`) from the Brain actor each frame
- **Zero** hardware divides, **zero** HDMA channels
- Trivial to implement and test

### Option B: Medium — Half-Resolution Perspective

If the full "Mario Kart floor" look is desired:
- Spawn `Mode7PerspectiveUpdate` thinker with params `$0804`
- Modify the quadrant handlers to compute every 2nd scanline + interpolate
- Or write a new simplified thinker using the half-resolution approach
- **224** divides per frame, **4** HDMA channels
- ~50–60% of original CPU cost

### Option C: Full — Original Thinker Unmodified

Use `Mode7PerspectiveUpdate` as-is (proven in 4 shipped scenes):
- **448** divides per frame, **4** HDMA channels
- ~15% of CPU time
- Phase 3 has only ~14 actors (lowest of any phase), providing headroom
- No new code needed — just spawn the existing thinker

### P2→P3 Transition Sequence

At the P2→P3 transition (`code_09ABF5!`), after existing palette/wait logic:

```asm
; 1. Lock joypad
LDA #$FFFC
TSB $joypadMaskStd

; 2. Switch to Mode 7
SEP #$20
LDA #$07
STA $BGMODE           ; BGMODE = Mode 7
LDA #$80
STA $M7SEL            ; Repeat character 0 outside playfield
REP #$20

; 3. Set scrollModeFlags bit 3 (enable VBlank M7 upload)
LDA $scrollModeFlags
ORA #$08
STA $scrollModeFlags

; 4. DMA Mode 7 tileset + tilemap to VRAM $0000-$3FFF
;    (replaces current DMA to $5000-$5FFF)
COP [AdhocVramDma] ( @m7_arena_tiles, #$0000, #$4000 )
; ... or split across multiple transfers ...

; 5. Disable HUD
LDA #$40
TSB $hudDisableFlag

; 6. Disable BG2 HDMA shimmer (BG2 doesn't exist in Mode 7)
; (implementation depends on thinker kill mechanism)

; 7. Spawn Mode 7 thinker (Option B/C only)
COP [SpawnThinker] ( @mode7_perspective.Mode7PerspectiveUpdate )
LDA #$0804
STA $7F000E, Y

; 8. Initialize rotation parameters
LDA #$0300            ; Scale
STA $00B8, Y
STZ $00B6, Y          ; Rotation angle
STZ $00BC, Y          ; Perspective index

; 9. Update screen designation for Mode 7 color math
LDA #$01
STA $TM               ; BG1 only on main screen (OBJ added elsewhere)
STA $CGADSUB          ; Color addition on BG1

; 10. Unlock joypad
LDA #$FFFC
TRB $joypadMaskStd
```

### Resource Requirements

| Resource | Mode 7 Cost | Available |
|----------|-------------|-----------|
| HDMA channels | 4 (Options B/C) or 0 (Option A) | 8 total; 7 free after disabling BG2 shimmer |
| VRAM | 32KB for Mode 7 tilemap+tiles | First 32KB repurposed (BG1/BG2 tiles no longer needed) |
| WRAM | 3 × 672 bytes for HDMA tables (Options B/C) | `$7E7000`/`$7E7800`/`$7E8000` — same buffers the thinker already uses |
| ROM | Mode 7 tile art + tilemap (~2–4 KB compressed) | Available in unmapped bank tails |
| CPU per frame | 0 (Option A) to ~10,000 cycles (Option C) | Phase 3 has fewest actors (~14), providing ~15% headroom |

---

## Raster Mode Split — Three-Band Rendering

Instead of a full-screen Mode 7 (losing BG3 HUD and BG1/BG2 effects), use **HDMA to change BGMODE mid-frame**, splitting the screen into three horizontal bands rendered in different PPU modes. This preserves all layer types simultaneously.

### Band Layout

| Band | Scanlines | Height | PPU Mode | Active Layers | Purpose |
|------|:-:|:-:|:-:|---|---|
| Top | 0–23 | 3 tiles (24 px) | Mode 1 BG3-pri | BG3 + OBJ | Status bar / boss name |
| Middle | 24–159 | 17 tiles (136 px) | Mode 7 | BG1 + OBJ | Rotating arena floor + sprites |
| Bottom | 160–223 | 8 tiles (64 px) | Mode 1 standard | BG1 + BG2 + OBJ | Background effect / horizon |

OBJ sprites render across **all three regions** — the PPU evaluates OBJ independently of BG mode. Boss sprites, player, and projectiles appear above backgrounds in every band.

### How the BGMODE Switch Works

HDMA can write to BGMODE (`$2105`) between scanlines, and the PPU switches rendering mode **immediately** for the next scanline. The Mode 7 perspective thinker already drives HDMA for M7A–M7D, so the concept is proven infrastructure.

### The Global BG Register Trick

**Key insight**: Mode 7 rendering **ignores** `BG1SC`, `BG2SC`, and `BG12NBA` entirely — it always reads from the interleaved format at `$0000`–`$3FFF` regardless of what those registers say. In the top band, BG1/BG2 are disabled via TM, so those registers are irrelevant there too.

This means `BG1SC`, `BG2SC`, and `BG12NBA` can be set **globally once** (during scene init or P2→P3 transition) to point at the bottom band's data. They are only meaningful during the 64 scanlines where Mode 1 BG1/BG2 are actually rendering.

**No HDMA channels needed for tilemap/CHR base switching.**

### HDMA Channel Budget — Only 6 Channels

| Channel | Register | HDMA Mode | Table Size | Purpose |
|:-:|:-:|:-:|:-:|---|
| 1 | BGMODE (`$2105`) | 0 (1 byte) | ~12 bytes | Switch Mode 1 → Mode 7 → Mode 1 |
| 2 | TM (`$212C`) | 0 (1 byte) | ~12 bytes | Enable/disable layers per region |
| 3 | M7A (`$211B`) | 2 (write-twice) | ~420 bytes | cos/scale per scanline (middle band only) |
| 4 | M7B (`$211C`) | 2 (write-twice) | ~420 bytes | sin/scale per scanline |
| 5 | M7C (`$211D`) | 2 (write-twice) | ~420 bytes | −sin/scale per scanline |
| 6 | M7D (`$211E`) | 2 (write-twice) | ~420 bytes | cos/scale per scanline (reuses M7A data) |

**2 channels remain free** for other effects (palette cycling, window masking, etc.).

#### Mode 3 Pairing Optimization

M7A+M7B are at consecutive addresses (`$211B`–`$211C`). HDMA Mode 3 writes 4 bytes to 2 consecutive registers, each written twice — perfect for write-twice M7 registers:

```
Mode 3 write pattern for base register $211B:
  Byte 0 → $211B (M7A low)
  Byte 1 → $211B (M7A high)
  Byte 2 → $211C (M7B low)
  Byte 3 → $211C (M7B high)
```

Similarly, M7C+M7D (`$211D`–`$211E`) can be paired. This reduces Mode 7 from **4 channels to 2**, yielding a total of **4 channels used, 4 free**. Requires a custom thinker that interleaves A/B and C/D values in the HDMA tables (5 bytes per entry: 1 count + 4 data, vs. current 3 bytes: 1 count + 2 data).

### HDMA Table Contents

#### BGMODE Table (static)

```asm
; HDMA Mode 0 → $2105 (BGMODE)
; $09 = Mode 1 with BG3 priority, $07 = Mode 7, $01 = Mode 1 standard
db 24, $09       ; 24 scanlines: Mode 1, BG3 priority (top band)
db 127, $07      ; 127 scanlines: Mode 7 (middle band, part 1)
db 9, $07        ; 9 more scanlines: Mode 7 (127+9=136, middle band complete)
db 64, $01       ; 64 scanlines: Mode 1, standard priority (bottom band)
db $00           ; end
```

Split at 127+9 because HDMA count byte maximum is 127 (bit 7 = indirect flag).

Bottom band uses `$01` (Mode 1 without BG3 priority) instead of `$09` because BG3 is not displayed there. This gives standard Mode 1 priority ordering where OBJ.3 is above all BG layers.

#### TM Table (static)

```asm
; HDMA Mode 0 → $212C (TM — main screen layer enable)
; Bit layout: ...O4321 (OBJ=bit4, BG4-BG1=bits3-0)
db 24, $14       ; top: BG3 + OBJ          ($14 = 0001_0100)
db 127, $11      ; middle: BG1 + OBJ       ($11 = 0001_0001)
db 9, $11        ; middle continued         (127+9=136)
db 64, $13       ; bottom: BG1 + BG2 + OBJ ($13 = 0001_0011)
db $00           ; end
```

#### M7 Tables (per-frame, generated by thinker)

The thinker generates per-scanline M7 values for only the **136 middle-band scanlines** — a built-in 39% reduction from the original 224-line computation. Header and footer entries pad the non-Mode-7 regions with don't-care values:

```asm
; M7A HDMA table example — Mode 2 (write-twice) → $211B
db 24            ; 24 scanlines: don't-care (top band, Mode 1)
dw $0100         ; identity value (harmless, Mode 7 not active)
; --- 136 per-scanline perspective entries (middle band) ---
db 1 : dw cos_scale_0    ; scanline 24 (first Mode 7 line)
db 1 : dw cos_scale_1    ; scanline 25
; ... 136 total entries ...
db 64            ; 64 scanlines: don't-care (bottom band, Mode 1)
dw $0100         ; identity value
db $00           ; end
```

### VRAM Layout

Mode 7 occupies the lower 32KB (word `$0000`–`$3FFF`). All Mode 1 BG data must reside in the upper 32KB.

```
Word Address   Byte Size   Contents
─────────────  ─────────   ────────────────────────────────────────
$0000–$3FFF    32,768      Mode 7 interleaved tilemap + 8bpp tiles
                           (128×128 map + 256 tiles)
$4000–$4FFF     8,192      OBJ tiles: player ($4200+) + boss ($4400+)
$5000–$5FFF     8,192      Bottom band BG1/BG2 CHR (shared or split)
$6000–$6FFF     8,192      BG3 font CHR (top band text/HUD)
$7000–$77FF     4,096      Bottom band BG1 tilemap (32×32)
$7800–$7BFF     2,048      BG3 tilemap (top band, existing location)
$7C00–$7FFF     2,048      Bottom band BG2 tilemap (32×32)
```

**OBJ VRAM ($4000–$4FFF)**: With OBSEL=`$02`, sprite name table 0 starts at word `$4000`. Boss sprites use tiles `$40`–`$8F` (word `$4400`–`$48FF`). Name table 1 at word `$5000` is mostly unused — reclaimed for BG1/BG2 CHR.

**BG12NBA for the bottom band**: `BG12NBA` nibble × `$1000` gives the word address for character data. Nibble `$5` → word `$5000`. If BG1 and BG2 share the same CHR region: `BG12NBA = $55`. If separate: BG1 at `$5000` (nibble 5), BG2 at `$7000` (nibble 7) → `BG12NBA = $75`, but this conflicts with the BG1 tilemap at `$7000`. Shared CHR (`$55`) is recommended.

### Global Register Settings (set once at scene init or P2→P3 transition)

```asm
; BG1/BG2 CHR base — only read during bottom band's Mode 1 scanlines
LDA #$55
STA $210B             ; BG12NBA: BG1 CHR at $5000, BG2 CHR at $5000

; BG1 tilemap — only read during bottom band
LDA #$1C
STA $2107             ; BG1SC: tilemap at word $7000, 32×32 (size=00)

; BG2 tilemap — only read during bottom band
LDA #$1F
STA $2108             ; BG2SC: tilemap at word $7C00, 32×32

; BG3 tilemap — only read during top band
LDA #$1E
STA $2109             ; BG3SC: tilemap at word $7800, 32×32

; BG3 CHR base — only read during top band
LDA #$60
STA $210C             ; BG34NBA: BG3 CHR at word $6000
```

### Sprite Priority Across Regions

The boss sprites use OAM priority 3 (after EOR with actor `$0E`). Priority behavior per region:

| Region | PPU Mode | OBJ.3 Priority Position | Sprites Above BGs? |
|--------|:-:|---|:-:|
| Top (BG3) | Mode 1 BG3-pri (`$09`) | Below BG3.1 tiles, above everything else | ⚠ Below BG3 high-priority tiles |
| Middle (Mode 7) | Mode 7 (`$07`) | Above BG1 | ✅ |
| Bottom (BG1+BG2) | Mode 1 standard (`$01`) | Above BG1.1 and BG2.1 | ✅ |

**Top band detail**: In Mode 1 with BG3 priority (`BGMODE=$09`), tiles with the BG3 priority bit set render **above** OBJ.3. To get sprites above BG3 in the top band, use BG3 tiles with priority bit 0. To use the top band as a solid frame that clips sprites behind it, use BG3 tiles with priority bit 1.

**Bottom band detail**: With `BGMODE=$01` (no BG3 priority), and BG3 disabled in TM for this region, the effective ordering is: OBJ.3 > BG1.1 > OBJ.2 > BG2.1 > BG1.0 > OBJ.1 > BG2.0 > OBJ.0. Sprites at OAM priority 3 are above everything.

### Color Math Considerations

Current scene `$EB` uses additive color math (`CGADSUB=$31`, `CGWSEL=$02` = sub-screen addend). In the three-band split:

| Region | Sub-Screen Content | Color Math Effect |
|--------|---|---|
| Top (BG3 only) | No sub-screen layers rendering → transparent | Addition of zero = main screen unchanged |
| Middle (Mode 7 BG1 only) | No BG2 on sub-screen | Addition of zero = main screen unchanged |
| Bottom (BG1+BG2) | BG2 on sub-screen (if `TS` includes BG2) | BG2 pixels add color to BG1 ✅ |

To enable color math blending in the bottom band, set `TS` (`$212D`) globally to include BG2. In the top/middle bands, BG2 isn't rendering, so the sub-screen has no pixels to add — the math produces the main-screen pixel unchanged. No HDMA needed for `TS`.

If no color math is desired: set `CGWSEL=$00` (fixed color addend) with `COLDATA=$00` (black). Addition of zero is identity.

### BG1 Scroll Register Aliasing

⚠ **`BG1HOFS` (`$210D`) is aliased with `M7HOFS` in Mode 7.** Both are the same register. Writing BG1 horizontal scroll for Mode 1 also writes the Mode 7 horizontal offset. This is a hardware alias, not a software issue.

In the three-band split, the Mode 7 center and Mode 1 bottom share the same scroll register. The Mode 7 thinker manages M7HOFS/M7VOFS via the VBlank shadow registers (`$CA`–`$CD` = M7X/M7Y). The bottom band BG1 scroll would read whatever value was last written. If the bottom band needs independent BG1 scrolling, an additional HDMA channel on `$210D` would be required at the Mode 7→Mode 1 boundary. (With only 6 channels used, this fits within the 8-channel budget.)

### Performance Savings

The modified thinker only computes **136 scanlines** instead of 224:

| Metric | Full-Screen Mode 7 | Three-Band Mode 7 | Savings |
|--------|:-:|:-:|:-:|
| Hardware divides per frame | 448 | 272 | **39%** |
| Estimated CPU cycles | ~10,000 | ~6,100 | ~3,900 cycles |
| HDMA table entries | 224 per table | 136 per table + headers | ~37% smaller tables |

Combined with half-resolution interpolation (Strategy 1), the three-band approach would use only **136 divides per frame** — a **70% reduction** from the original full-screen thinker.

### Feasibility Summary

| Aspect | Feasible? | Notes |
|--------|:-:|---|
| Three-region BGMODE split via HDMA | ✅ | Standard SNES technique, proven in commercial titles |
| VRAM coexistence (M7 + M1 layers) | ✅ | Mode 7 in lower 32KB, all Mode 1 data in upper 32KB |
| HDMA channel count | ✅ | 6 used (or 4 with Mode 3 pairing), 2–4 free |
| Global BG register trick | ✅ | No HDMA for BG1SC/BG2SC/BG12NBA — they're ignored in M7 and top band |
| Sprites above backgrounds | ✅ | OBJ.3 above all BGs (except BG3.1 in top band, controllable via tile priority) |
| Combat collision | ✅ | Render-list AABB, completely BG-mode-independent |
| Perspective compute savings | ✅ | 136 scanlines vs 224 = 39% fewer divides, stackable with other optimizations |
| Bottom band BG1+BG2 | ✅ | Needs dedicated CHR + tilemaps at non-conflicting VRAM addresses ($5000+) |
| Color math across regions | ✅ | Sub-screen BG2 is no-op where BG2 isn't rendering (top/middle), active in bottom |
| BG1 scroll aliasing with M7HOFS | ⚠️ | May need 1 extra HDMA channel if bottom band BG1 needs independent scroll |

---

## Reference: IoG Engine Mode 7 Registers

### scrollModeFlags (`$06EF`)

| Bit | Mask | When Set |
|:---:|:---:|---|
| 0 | `$01` | Dual-layer mode (reload layer 1 map) |
| 2 | `$04` | Camera following state clear trigger |
| **3** | **`$08`** | **Mode 7 active**: VBlank uploads M7A–M7Y from shadow regs; `CameraSmoothScroll` uses direct mode; `ClearSceneState` uses `RenderPaletteTiles` instead of `CameraFullRefresh` |
| 4 | `$10` | Additional scroll config |

### VBlank Shadow Registers

| Address | PPU Register | Write Style |
|:---:|:---:|---|
| `$C2`–`$C3` | M7A (`$211B`) | Write twice (low, high) |
| `$C4`–`$C5` | M7B (`$211C`) | Write twice |
| `$C6`–`$C7` | M7C (`$211D`) | Write twice |
| `$C8`–`$C9` | M7D (`$211E`) | Write twice |
| `$CA`–`$CB` | M7X (`$211F`) | Write twice, high masked to 5 bits |
| `$CC`–`$CD` | M7Y (`$2120`) | Write twice, high masked to 5 bits |

### M7SEL (`$211A`)

```
Bit 7 (R): 0 = tilemap wraps, 1 = non-tilemap fill beyond boundaries
Bit 6 (F): 0 = transparent outside, 1 = fill with character 0
Bit 1 (Y): Flip screen vertically
Bit 0 (X): Flip screen horizontally
```

Typical boss arena value: `$80` (fill with tile 0 outside playfield, no flip).

### Sine/Cosine Tables (for flat rotation Option A)

The engine has 512-entry signed word tables in bank `$01`:

| Table | Address | Content |
|-------|---------|---------|
| `sine_table_16bit` | `$01C595` | 512 × 2 bytes = 1024 bytes |
| `cosine_table_16bit` | `$01C695` | 512 × 2 bytes = 1024 bytes |

Indexed by `(angle AND $01FF) × 2`. One full rotation = 512 steps ≈ 0.7° per step.

---

## See Also

- `gaia-knowledge/corpus/games/iog/project-docs/mode7-and-cutscenes.md` — Full docs on Mode7PerspectiveUpdate, IrisCircleEffect, cutscene actors
- `gaia-knowledge/corpus/games/iog/project-docs/unused-mode7-boss-analysis.md` — Original boss analysis, Phase 3 feasibility study, enhancement proposals
- `gaia-iog-baserom/extracted/thinkers/mode7_perspective.asm` — Active thinker source
- `gaia-iog-baserom/extracted/unused/mode7_perspective_unused.asm` — Dead alternate implementation
- `gaia-iog-baserom/extracted/system/engine/vblank_joypad.asm` — VBlank M7 shadow upload
- `gaia-iog-baserom/extracted/system/engine/combat_collision.asm` — Render-list-based collision
- `gaia-iog-baserom/extracted/system/engine/sprite_composition.asm` — SortActorsByDepth, $2000 hidden flag
- `gaia-iog-baserom/extracted/system/engine/scene_script.asm` — SceneCmd_ConfigDisplay, display preset application
- `gaia-iog-baserom/extracted/tables/display_preset_table.asm` — All 47 display presets
- `gaia-knowledge/corpus/nesdev/backgrounds.md` — Mode 7, EXTBG, VRAM layout
- `gaia-knowledge/corpus/nesdev/ppu-registers.md` — M7SEL, M7A–M7D, M7X/M7Y, BGMODE, BG12NBA, BG1SC–BG4SC
