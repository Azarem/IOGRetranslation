# Apocalypse Gaia — Unused Mode 7 Boss Restoration

Wires the unused Mode 7 boss at ROM `$09AA6E` into scene `$EB` as a playable standalone encounter. The boss is the largest unused code block in the Illusion of Gaia ROM (~1,900 lines), featuring orbital attack patterns, HP tracking, three phase transitions, projectile spawning, and camera control.

## Module Files

| File | Purpose |
|------|---------|
| `ApocalypseGaia.patch.asm` | Main patch: scene meta, thinkers, table overrides, tile loader, P3 transition |
| `apocalypse_gaia.sprite.asm` | Custom spritemap (67 animation sets, $00–$42) |
| `generate_ag_sprites.cjs` | Node script to generate spritemap from tile layout |

## Scene Configuration

Scene `$EB` reuses the Babel Tower space backdrop from scene `$E7` (ending spaceflight).

### Display Preset $0C

```
display-preset < #15, #02, #02, #31, #64, #05, #09, #04, #00, #00 >
```

| Byte | Register | Value | Meaning |
|------|----------|-------|---------|
| 0 | TM / TMW | `$15` | BG1 + BG3 + OBJ on main screen |
| 1 | TS / TSW | `$02` | BG2 on sub screen |
| 2 | CGWSEL | `$02` | Sub screen for color math, always enabled |
| 3 | CGADSUB | `$31` | Color **addition** on BG1, OBJ (palettes 0-3), backdrop |
| 4 | Bitfield | `$64` | Layer priority/size flags; bits 4-5 = `$20` → `$06F1` |
| 5 | Scroll | `$05` | Scroll mode config |
| 6 | BGMODE | `$09` | Mode 1, BG3 16×16 tiles |
| 7 | Flags | `$04` | scrollModeFlags |

This preset is shared with all guardian fights (scenes F2–F6) and scene E7.

### Scene Meta

```asm
scene_meta_00EB [
  display-mode < #0C >
  bitmap < #00, #10, #00, @gfx_ending_combined, #00 >   ; BG1 CHR → VRAM $2000
  palette < #00, #70, #10, @pal_babel_spaceflight >       ; BG palettes
  tileset < #00, #20, #00, #01, @set_babel_darklair_effect >
  tilemap < #01, @map_babel_spaceflight >                 ; BG1 map (starfield)
  bitmap < #00, #10, #10, @gfx_ending_combined, #00 >   ; BG2 CHR → VRAM $3000
  tileset < #00, #20, #00, #02, @set_babel_darklair_effect >
  tilemap < #02, @map_babel_darklair_effect >              ; BG2 map (dark lair effect)
  palette < #00, #70, #90, @palette_1E6273 >              ; OBJ palettes (includes palette 3)
  spritemap < #$0900, #00, @apocalypse_gaia >             ; Boss spritemap ($0900 = 2304 bytes)
]
```

### Thinker List

```asm
thinker_spawn_ag_boss [
  thinker-spawn < #00, @sine_hdma_ending_wave >     ; HDMA wavy BG2 scroll (register $0F = BG2VOFS)
  thinker-spawn < #71, @ambient_palette_cycler >     ; Palette cycling effect
  thinker-spawn < #00, @global_ambient_dispatcher >  ; Global ambient effect coordination
]
```

### Actor Spawns

```asm
scene_event_0CE3CD! [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >
  actor-spawn < #08, #07, #00, @ag_tile_loader >           ; DMA boss tiles to OBJ VRAM
  enemy-spawn < #08, #07, #00, @actor_09AA6E, #54, #00, #00 >  ; Boss actor
]
```

## VRAM Layout

```
$0000-$1FFF  (unused in this scene)
$2000-$2FFF  BG1 CHR (gfx_ending_combined, bitmap flags $00)
$3000-$3FFF  BG2 CHR (gfx_ending_combined, bitmap flags $10)
$4000-$43FF  Player character tiles (DmaPlayerTilesToVram, 4 passes)
$4400-$4FFF  Boss Phase 1/2 tiles (ag_tile_loader → AdhocVramDma)
$5000-$5FFF  (available; Phase 3 uses VRAM $4000-$4BFF)
$6000-$6FFF  Font tiles (gfx_fonts, BG3 character base)
```

**OBSEL** (`$2101`) = `$02`: OBJ base at VRAM `$4000`, name select gap `$1000`.
- Name table 0: tiles at `$4000 + tile×$10` (tiles `$000-$0FF`)
- Name table 1: tiles at `$5000 + tile×$10` (tiles `$100-$1FF`)

Boss tiles start at tile `$40` (VRAM `$4400`), using name table 0.

## Sprite Priority — The EOR System

This was the hardest problem to solve. The boss sprites appeared in Mesen2's OAM/sprite viewer but were invisible on the game screen.

### How the Engine Handles OBJ Priority

The sprite composition engine (`DecomposeActorMetasprites` in `sprite_composition.asm`) **EORs** spritemap tile attributes with the actor's field `$0E`:

```asm
LDA $000E, X          ; Actor's attribute field → $04
STA $04
...
LDA $0005, X          ; Tile attribute word from spritemap
EOR $04               ; XOR with actor's $0E
ORA $02               ; OR with iframe palette
STA $0424, Y          ; → OAM tile/attribute word
```

The EOR serves multiple purposes:
- **H-mirror**: Bit 14 of `$0E` toggles the horizontal flip bit in tile attributes, enabling sprite mirroring
- **Priority**: Bits 13-12 of `$0E` toggle the OAM priority bits

This means the **rendered OAM priority** = `spritemap_priority XOR actor_$0E_priority`.

### How Actor $0E Gets Its Priority

During actor initialization (`InitActorFromSceneData`), field `$0E` is set via:

```asm
AND #$00F6            ; Mask spawn byte 2
XBA                   ; Swap bytes
ORA $06F0             ; OR with display preset base priority
STA $000E, X
```

The word at `$06F0` comes from the display preset. Specifically, `$06F1` (the high byte) is set from display preset byte 4:

```asm
LDA display_preset+4  ; Byte 4 of preset
AND #$30              ; Extract bits 4-5 only
STA $06F1             ; → high byte of $06F0 word
```

For display preset `$0C`, byte 4 = `$64`:
- `$64 AND $30 = $20` → `$06F1 = $20`
- Word `$06F0 = $2000` → **base priority 2**

### The Priority Cancellation Bug

With our enemy-spawn byte 2 = `$00`:
- Actor `$0E` = `$0000 OR $2000` = `$2000` (priority 2)

If the spritemap also has priority bits set, the EOR **cancels them out**:

| Spritemap Attr | Actor $0E | EOR Result | OAM Priority | Visible? |
|---------------|-----------|------------|--------------|----------|
| `$26xx` (pri 2) | `$2000` | `$06xx` (pri 0) | OBJ.0 — lowest of all | ❌ Behind everything |
| `$36xx` (pri 3) | `$2000` | `$16xx` (pri 1) | OBJ.1 — below BG1.0 | ❌ Behind BG1 |
| `$16xx` (pri 1) | `$2000` | `$36xx` (pri 3) | OBJ.3 — above BG1.1 | ✅ Visible! |
| `$06xx` (pri 0) | `$2000` | `$26xx` (pri 2) | OBJ.2 — above BG1.0 | ✅ Mostly visible |

### Mode 1 BG3 Priority Order (BGMODE bit 3 set)

```
Priority 1 (highest): BG3 tiles with priority 1
Priority 2:           OBJ priority 3        ← we need to be HERE
Priority 3:           BG1 tiles with priority 1
Priority 4:           BG2 tiles with priority 1
Priority 5:           OBJ priority 2
Priority 6:           BG1 tiles with priority 0
Priority 7:           BG2 tiles with priority 0
Priority 8:           OBJ priority 1        ← $36xx landed here (invisible behind BG1)
Priority 9:           BG3 tiles with priority 0
Priority 10 (lowest): OBJ priority 0        ← $26xx landed here (invisible behind everything)
```

### The Fix

Set spritemap tile attributes to `$16xx` (priority 1 in the spritemap). The engine's EOR produces:
- `$16 XOR $20 = $36` → OAM priority 3 → **above all BG layers**

For future Phase 3 tiles (name table 1): use `$17xx` → `$17 XOR $20 = $37` → priority 3 + name table 1.

### Why the Game's Bosses Work

The game's guardian fights (Castoth, etc.) explicitly call `COP [SetSpritePriority] ( #30 )` early in their code, which overwrites `$0E`'s priority bits to `$3000` via `SetOamPriority`:

```asm
SetOamPriority:
    LDA #$3000
    TRB $0E               ; Clear priority bits
    LDA [$0A] → #$30      ; Read COP operand
    XBA → $3000
    TSB $0E               ; Set priority 3
```

Then their spritemaps use priority 0 (`$06xx` / `$07xx`):
- `$06xx XOR $3000 = $36xx` → OAM priority 3 ✓

Our boss (`actor_09AA6E`) never calls `SetSpritePriority`, so `$0E` keeps the display preset default `$2000`. We compensate by encoding the inverse priority in the spritemap.

## Tile Loading

Boss tiles cannot use the scene meta `bitmap` command because `SceneCmd_LoadBgTiles` writes to **BG VRAM** (`$2000`/`$3000`), not OBJ VRAM. Instead, a helper actor DMAs raw tile data directly:

```asm
ag_tile_loader [
  actor-def < #00, #00, #00, {
    COP [AdhocVramDma] ( @gfx_ag_sprites, #$4400, #$0800 )
    COP [AdhocVramDma] ( @gfx_ag_sprites+800, #$4800, #$0800 )
    COP [AdhocVramDma] ( @gfx_ag_sprites+1000, #$4C00, #$0800 )
    COP [Die]
  } >
]
```

**Key details:**
- `COP [AdhocVramDma]` properly yields between transfers (checks `$7F0C07` busy flag, rewinds COP PC if busy, sets `extendedFlags` bit 0, polls completion on subsequent calls)
- The 3 transfers ($4400, $4800, $4C00) execute across 3-4 frames
- Player tiles at `$4000-$43FF` are untouched (no overlap)
- NMI DMA exclusivity: `displayModeFlags` bit 3 routes to either `DmaPlayerTilesToVram` OR `DmaAdhocVramBlock`, never both in the same frame

## Spritemap Format

The spritemap (`apocalypse_gaia.sprite.asm`) defines 69 animation sets (`$00`-`$44`).

### Tile Attribute Encoding

```
$16xx — Phase 1/2 (name table 0)
  $16 = 0001 0110
  V=0, H=0, OO=01 (spritemap priority 1), PPP=011 (palette 3), N=0

$17xx — Phase 3 (name table 1, when implemented)
  $17 = 0001 0111
  V=0, H=0, OO=01 (spritemap priority 1), PPP=011 (palette 3), N=1
```

After EOR with actor `$0E` = `$2000`:
- `$16 XOR $20 = $36` → OAM: priority 3, palette 3, name table 0
- `$17 XOR $20 = $37` → OAM: priority 3, palette 3, name table 1

### Tile Ranges

| Phase | Tiles | VRAM Range | Name Table | Source |
|-------|-------|------------|------------|--------|
| 1/2 | `$40-$8F` | `$4400-$48FF` | 0 | `gfx_ag_sprites` |
| 3 | `$00-$5F` | `$4000-$4BFF` | 0 | `gfx_ag_phase3` (overwrites P1/2 + player) |

### Projectile & Effect Tile Groups

| Tiles | Group(s) | Description |
|-------|----------|-------------|
| `$74-$75` | `ag_grp_bubble` | Bubble / floating bomb (8×8) |
| `$76-$77` | `ag_grp_beam` | Beam particle (8×8) |
| `$78-$7B` | `ag_grp_nuke` | Nuke / expanded bomb (16×16) |
| `$7C-$7D` | `ag_grp_nuke_piece` | Nuke fragment (8×8) |
| `$7E-$7F` | `ag_grp_fire_obj` | Fire projectile (8×8) |
| `$80-$83` | `ag_grp_deadbit_fire` | Dead bit fire anim (16×16) |
| `$84-$87` | `ag_grp_core_extra` | Core extra animation (16×16) |
| `$88-$89` | `ag_grp_bubble_death` | Bubble pop frame 1 (8×8) |
| `$8A-$8B` | `ag_grp_bubble_pop`, `ag_grp_bubble_debris` | Bubble pop frame 2, debris scatter (8×8 × 2 parts) |
| `$8C-$8F` | `ag_grp_floor_beam` | Floor beam / wide beam impact (16×16) |

### Custom Animation Sets (added for restoration)

| Index | Name | Frames | Usage |
|-------|------|--------|-------|
| `#10` | Explosion sparkle A | deadbit_fire → nuke → nuke_piece | Replaces `spriteset_enemies #07` in explosions |
| `#1D` | Explosion sparkle B | nuke_piece → fire_obj → nuke_piece | Replaces `spriteset_enemies #01` in explosions |
| `#31` | Death explosion | deadbit_fire → nuke → nuke_piece → fire_obj | Replaces `spriteset_enemies #02` for bomb/arm death |
| `#43` | Bubble death pop | bubble_death → bubble_pop → bubble_debris | Floating bomb burst before #31 explosion |
| `#44` | Floor beam effect | beam → floor_beam | Beam particle expanding to wide impact |

## Phase Transitions

### Phase 1 → Phase 2 (P2 approach)

The brain actor (`code_09B5C7`) manages the boss approach:
- Decrements boss Y by 2 per frame: `368 → 112` over ~129 frames (~2.15 seconds)
- Updates camera delta via `code_09B9CC` to scroll all children
- Corrects overshoot when crossing target Y

### Phase 2 → Phase 3 (death callback)

`code_09ABF5!` (overridden in patch) fires when the Phase 2 body is killed:
- Spawns palette animation (`code_09B9C5`)
- Waits for children to clear (`$26` countdown)
- DMAs Phase 3 tiles to VRAM `$4000-$4BFF` via 3× `AdhocVramDma`
- Spawns Phase 3 actor (`code_09AC55`)

## Boss Actor Hierarchy

```
actor_09AA6E (main boss)
├── code_09B5C7 (brain — approach, camera control, oscillation)
├── code_09B6FC (palette fade thinker)
├── code_09B719 (lightning palette effect)
├── code_09B747 (background star spawner)
├── code_09B30E (left arm — SetDeathCallback → code_09B3C6)
├── code_09B36A (right arm — mirrored)
├── code_09B586 (left shoulder mount — fires code_09B7A8 projectiles)
└── code_09B57F (right shoulder mount — mirrored)
```

Phase 3 spawns:
```
code_09AC55 (Phase 3 main body)
├── code_09ADB3 (left appendage cluster)
│   ├── code_09AE52 (orbital attacker)
│   ├── code_09B2AE (midpoint tracker)
│   └── code_09B28D ×3 (chain segments)
└── code_09ADEB (right appendage cluster, mirrored)
```

## Color Math

Display preset $0C uses **additive color math**:
- `CGADSUB = $31`: Addition applied to BG1, OBJ palettes 0-3, backdrop
- `CGWSEL = $02`: Sub screen (BG2) is the blend source
- Result: `Main_pixel + BG2_pixel` per scanline

This creates a luminous overlay effect where BG2's dark lair pattern adds color to BG1's starfield and the boss sprites. The HDMA thinker (`sine_hdma_ending_wave`) adds per-scanline vertical scroll variation to BG2, creating the characteristic wavy distortion.

## Spriteset Inheritance — Packed Spritemaps in WRAM

The packed spritemap system uses `&` (short) pointers rebased to `$4000`, matching the WRAM destination address `$7E:4000`. This is a critical distinction from ROM-based spritesets.

### How it works

1. **Scene load**: `spritemap < #$0800, #00, @apocalypse_gaia >` triggers `SpritemapPatch`, which strips the 2-byte compression header and copies raw spriteset data to `$7E:4000`
2. **Actor init**: `InitActorFromSceneData` sets `spritesetPtr=$4000`, `bank=$7E` for all non-player scene-spawned actors
3. **Child inheritance**: Every spawn COP handler (`SpawnAfterFlags`, `SpawnBeforeMarked`, `SpawnAfterOffsetMarked`, `SpawnListAppend`, etc.) calls `CopyActorState`, which copies `spritesetPtr`, `metaspritePtr`, and the bank byte (`$7F0008`) from parent to child
4. **Pointer resolution**: When the engine reads animation data, it follows `&` pointers from the spriteset. Since the spriteset base is `$4000` and the `&` pointers are `$4000`-relative, all reads go to the correct WRAM location with bank `$7E`

### What NOT to do

**Do NOT use `SetMetasprite(@packed_spritemap)` in scripts.** This points actors at the ROM copy where:
- The `&` pointers are still `$4000`-relative but the data lives at a ROM address
- With a ROM bank byte, the engine reads `$4000`-offset data from the wrong bank
- Result: garbage metaspritePtr → `DecomposeActorMetasprites` reads a zero sub-sprite count → `DEC` wraps to `$FFFF` → 65,535 off-screen iterations → ~26.5M cycles per frame

**Do NOT use `SetMetasprite(@packed_spritemap+2)` either.** Skipping the compression header still points at ROM data with `$4000`-relative pointers. The scripts halt because the animation state machine reads garbage frame data.

### Correct approach for packed spritemaps

- **Scene-spawned actors**: Automatically get `$4000/$7E` from `InitActorFromSceneData` — no action needed
- **Children of scene-spawned actors**: Inherit `$4000/$7E` via `CopyActorState` — no action needed
- **Explosion/effect actors that originally call `SetMetasprite(@spriteset_enemies)`**: Remove the `SetMetasprite` call (they inherit the correct spriteset from their parent) and remap animation indices to the boss spriteset

### Contrast with ROM-based spritesets

ROM spritesets like `spriteset_enemies` have `&` pointers relative to their ROM address. `SetMetasprite(@spriteset_enemies)` works because the bank byte matches the ROM bank and the `&` pointers resolve within that bank. This is the normal pattern for actors in regular scenes.

## Known Issues / TODO

- **Placeholder graphics**: All tile CHR is generated by `generate_ag_sprites.cjs` as colored geometric shapes. Real pixel art is needed.
- **Phase 3 visual testing**: The P2→P3 DMA transition has not been verified at runtime yet.
- **Sound verification**: Boss uses PlaySoundCh1 IDs #06, #15, #1D, #1E, #1F, #20, #21, #23, #29 — need to confirm these are valid.
- **Mode 7 tilemap writes**: Boss code writes to `$7EE000` (mode7Tilemap) which has no visual effect in Mode 1.

## Diagnostic History

The invisible-sprite bug was tracked through systematic elimination:

| Hypothesis | Status | Finding |
|-----------|--------|---------|
| Compression header mismatch | ❌ Ruled out | `SpritemapPatch.patch.asm` handles all spritemap types correctly |
| VRAM overlap BG↔OBJ | ❌ Ruled out | BG at `$2000-$3FFF`, OBJ at `$4000+` — no conflict |
| Palette empty | ❌ Ruled out | `palette_1E6273` has valid non-zero colors at OBJ palette 3 |
| Name table mismatch | ❌ Ruled out | N=0 correct for VRAM `$4400+` (name table 0 region) |
| DMA timing / overlap | ❌ Ruled out | COP [AdhocVramDma] yields properly; player tiles don't overlap |
| OBJ not on main screen | ❌ Ruled out | TM=`$15` includes OBJ bit |
| Color math hiding sprites | ❌ Ruled out | Addition can only brighten, not make invisible |
| HDMA effects | ❌ Ruled out | `sine_hdma_ending_wave` only targets BG2VOFS, no effect on OBJ |
| Priority too low ($26xx) | ❌ Partial | $26xx EOR $2000 = $06xx = priority 0 (below everything) |
| Priority 3 in spritemap ($36xx) | ❌ Still broken | $36xx EOR $2000 = $16xx = priority 1 (below BG1) |
| **EOR priority cancellation** | ✅ Root cause | Actor $0E base priority $2000 XORs with spritemap priority |
| **Fix: $16xx in spritemap** | ✅ Works | $16xx EOR $2000 = $36xx = OAM priority 3 (above BG1) |

**Key diagnostic clue**: Hiding BG1 in Mesen2's layer toggle made sprites appear — proving they were rendered but behind BG1 in the priority order.

### DecomposeActorMetasprites Performance Catastrophe

After priority was fixed, killing arm bits caused a catastrophic performance drop — Mesen2 profiler showed `DecomposeActorMetasprites` consuming 75.87% of CPU time (26.5M cycles in a single call).

| Hypothesis | Status | Finding |
|-----------|--------|---------|
| `SetMetasprite(@apocalypse_gaia)` — point at ROM | ❌ Wrong | ROM data has `$4000`-relative `&` pointers → garbage reads with ROM bank |
| `SetMetasprite(@apocalypse_gaia+2)` — skip header | ❌ Wrong | Same problem — `&` pointers are still `$4000`-relative, don't resolve in ROM bank |
| Explosion actors calling `SetMetasprite(@spriteset_enemies)` | ❌ Wrong approach | Switches to enemies ROM spriteset (wrong tiles); removing the call lets them keep inherited `$7E:$4000` |
| **Root cause: packed spritemap `&` pointers are `$4000`-relative** | ✅ | Actors must use `spritesetPtr=$4000, bank=$7E` (set by `InitActorFromSceneData`, inherited by children via `CopyActorState`) |
| **Fix: remove all `SetMetasprite` overrides** | ✅ | Let the inheritance chain provide the correct `$7E:$4000` spriteset to all actors |

**Key mechanism**: The off-screen culling path in `DecomposeActorMetasprites` (`loc_03C920`) bypasses the OAM cap check (`CPY #$0200`). When a garbage metaspritePtr produces a sub-sprite count of 0, `DEC $10` wraps to `$FFFF` → 65,535 iterations × ~400 cycles = 26.2M cycles with no safety exit.
