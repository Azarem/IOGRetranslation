# Dungeon Map — Technical Reference

## Overview

The dungeon map uses **BG3 in Mode 1** (2bpp, 4 colors per palette, 8 palettes)
as a **live gameplay overlay**. The map auto-scrolls to follow the player.
Gameplay continues normally while the map is active — actors move, sprites
animate, collision works. Toggle on/off with Start.

The tilemap is generated at runtime from the collision layer at `$7FC000`.
Each game metatile maps to one 8×8 BG3 tile. Smooth scrolling via
BG3HOFS/BG3VOFS registers (no re-DMA needed).

## Architecture

```
dungeon_map_core    — JSL: build tilemap, DMA, set color math, return to game
dungeon_map_scroll  — JSL: per-frame BG3 scroll update (called from GlobalInputHandler)
dungeon_map_dismiss — JSL: restore all PPU/CGRAM state, clear map
```

The key design: `dungeon_map_core` does NOT loop. It builds the map, sets up
color math for transparency, and returns. The game's main loop continues.
Each frame, `GlobalInputHandler` calls `dungeon_map_scroll` to update BG3
scroll registers based on the player's current position.

### State Flow

```
Start pressed → dungeon_map_core (init only, returns)
   ↓
Game loop continues normally
   ↓  each frame
GlobalInputHandler checks mapOverlayActive ($7F5175)
   ↓  if active
dungeon_map_scroll (BG3HOFS/BG3VOFS update)
   ↓
Start pressed → dungeon_map_dismiss (restore + return)
Scene transition → auto-dismiss
```

## Tilemap Mode — 64×64 (BG3SC=$7B)

Always uses **64×64 tilemap mode** with BG3SC=`$7B` (base $7800).
Rooms ≤ 64 tiles in either dimension are fully visible, centered in the
tilemap. Rooms > 64 tiles use a **player-centered viewport** — the 64×64
area around the player is shown, anything beyond is clipped.

**Viewport centering** (for rooms > 64 tiles):
```
viewport_col = clamp(playerXTile - 32, 0, room_width - 64)
viewport_row = clamp(playerYTile - 32, 0, room_height - 64)
```

**VRAM nametable layout** (4 × 32×32 screens, 4096 words total):

| Screen | Columns | Rows | VRAM range |
|--------|---------|------|------------|
| SC0 | 0–31 | 0–31 | $7800–$7BFF |
| SC1 | 32–63 | 0–31 | $7C00–$7FFF |
| SC2 | 0–31 | 32–63 | $8000–$83FF |
| SC3 | 32–63 | 32–63 | $8400–$87FF |

VRAM $8000–$87FF is confirmed free: sprites at $4000–$5FFF (OBSEL=$02),
BG1/BG2 tiles at $2000 (BG12NBA=$22), BG3/BG4 CHR at $6000 (BG34NBA=$06).

Restored to original 32×32 mode (`$78`) on teardown.

## Tile CHR — VRAM $7700 (144 bytes)

**NOT $6000** — BG34NBA=$06 means BG3 CHR base is $6000 where font tiles live.
We use $7700 (same region as original radar icons). Tile indices offset by
`($7700 - $6000) / 8 = $02E0`.

9 reusable tiles × 16 bytes/tile:

| Index | Offset | Name       | Pattern                          |
|-------|--------|------------|----------------------------------|
| 0     | $02E0  | OOB        | Checkerboard dither (wall + shadow) — darker than walls |
| 1     | $02E1  | Floor      | Light base with sparse shadow grain dots |
| 2     | $02E2  | Wall       | Dark with shadow mortar lines (brick pattern) |
| 3     | $02E3  | Stairs     | Light base with diagonal step treads |
| 4     | $02E4  | Enemy      | Light base with filled circle (6px diameter) |
| 5     | $02E5  | Chest      | Light base with box outline + clasp |
| 6     | $02E6  | Dark Space | Light base with 4-pointed sparkle star |
| 7     | $02E7  | Player     | Light base with thick cross/plus |
| 8     | $02E8  | Exit       | Light base with 4-directional arrows |

## Tilemap — VRAM $7800–$87FF (4096 words)

Each entry is a 16-bit word:

```
Bit 15:    V-flip
Bit 14:    H-flip
Bit 13:    Priority (always 1 — BG3 above BG1/BG2)
Bit 12-10: Palette (0–7)
Bit 9-0:   Tile index ($02E0–$02E8)
```

Small rooms are centered within the tilemap using offset variables.
Unused cells are filled with tile 0 (OOB) + palette 0.

## CGRAM Palettes (64 bytes)

8 palettes × 4 colors. All share colors 0–2; color 3 varies:

| Palette | Color 0 | Color 1 | Color 2 | Color 3 | Use |
|---------|---------|---------|---------|---------|-----|
| 0 | transparent | floor (sand) | wall (dark stone) | **shadow** (mid-brown) | Base map tiles (texture) |
| 1 | transparent | floor | wall | **red** | Enemy marker |
| 2 | transparent | floor | wall | **gold** | Chest marker |
| 3 | transparent | floor | wall | **cyan** | Dark space marker |
| 4 | transparent | floor | wall | **white** | Player marker |
| 5 | transparent | floor | wall | **green** | Exit marker |
| 6 | transparent | floor | wall | **slate blue** | Stairs/ramp marker |
| 7 | transparent | floor | wall | **light gray** | Legend/border |

### CGRAM Palette Overlap Warning

In Mode 1, BG3 2bpp palettes 0–7 use CGRAM entries 0–31, which overlap
with BG1/BG2 4bpp palettes 0–1. Writing map palettes modifies the first
32 CGRAM entries, which may alter the game scene's colors for tiles using
those palettes. This is a hardware constraint of the SNES.

## BG3 Rendering — Live Transparent Overlay

### Why BG3 Goes on the Sub Screen

In Mode 1 with BGMODE bit 3 set (IoG's configuration), BG3 priority=1 renders
at the **absolute highest priority** — above all sprites and all other BG layers:

```
 1. BG3 priority=1  ← covers EVERYTHING
 2. OBJ priority 3  (sprites)
 3. BG1 priority 1
 4. BG2 priority 1
    ...
```

If BG3 is on the main screen, its opaque pixels occlude sprites entirely.
Color math blends the topmost main-screen pixel with the sub screen, but
cannot make lower-priority sprites "show through" a higher-priority BG3.

**Solution**: Remove BG3 from the main screen and place it on the sub screen
only. The main screen renders BG1+BG2+OBJ normally (sprites visible). Color
math blends the main screen with the sub-screen BG3 map, excluding OBJ so
sprites stay at full brightness.

### Color Math Computation

```
new_TM      = scene_TM & ~$04   (remove BG3 from main screen)
new_TS      = $04                (BG3 only on sub screen)
new_CGWSEL  = $02                (sub screen is color math source)
new_CGADSUB = $43                (half-add BG1 + BG2, NOT OBJ)
```

Effects per pixel:
- **BG1/BG2 topmost** (game backgrounds): `(game + sub_screen) / 2` → blended with map
- **OBJ topmost** (sprites): NOT in CGADSUB → **full brightness, no blend**
- **BG3 transparent areas**: sub screen = backdrop (black) → game dims to ~50%
- **BG3 opaque areas**: sub screen = map color → game tinted with map color

The uniform dimming creates a "map mode" visual — game backgrounds dim while
sprites pop out at full brightness.

### CGADSUB Bit Layout ($2131)

```
Bit 7: Subtract    Bit 3: BG4
Bit 6: Half        Bit 2: BG3 ← $04
Bit 5: Backdrop    Bit 1: BG2
Bit 4: OBJ         Bit 0: BG1
```

`$44` = half + BG3. Confirmed by `display_preset_0181E4` (preset #27).

### Display Preset Shadow Hook

`DisplayPresetShadow.patch.asm` replaces `SceneCmd_ConfigDisplay` to save
4 write-only PPU register values to WRAM:

| Register | PPU | Shadow WRAM | Purpose |
|----------|-----|-------------|---------|
| TM | $212C | $7F5176 | Main screen layer designation |
| TS | $212D | $7F5177 | Sub screen layer designation |
| CGWSEL | $2130 | $7F5178 | Color math source control |
| CGADSUB | $2131 | $7F5179 | Color math add/subtract select |

These are read during init to compute blended values, and during teardown
to restore the scene's exact configuration.

### Restore on Teardown

Teardown writes the shadow values directly to PPU registers:
```asm
LDA $sceneDisplayTM    → STA $TM, STA $TMW
LDA $sceneDisplayTS    → STA $TS, STA $TSW
LDA $sceneDisplayCGWSEL → STA $CGWSEL
LDA $sceneDisplayCGADSUB → STA $CGADSUB
```

This avoids the impossible task of scanning the display preset table
(multiple entries share bytes 4–9 but differ in bytes 0–3).

## HDMA — Not Disabled

For the live overlay, **HDMA is left running**. The game's HDMA effects
(parallax, gradients, window masking) continue normally. The NMI handler
re-enables HDMA from `$66` every frame as usual.

If any HDMA channel targets BG3HOFS/BG3VOFS, the map scroll would be
overridden per-scanline. This is uncommon in IoG scenes (BG3 is the text
layer, rarely targeted by HDMA).

## Persistent WRAM State

DP $B0–$DF is used during init for room geometry computation, then **restored
to engine values** before returning. Map state that must persist across frames
is copied to WRAM:

| Address | Size | Name | Content |
|---------|------|------|---------|
| $7F5175 | 1 | mapOverlayActive | Map active flag (0/1) |
| $7F5176 | 1 | sceneDisplayTM | Scene TM shadow (from patch) |
| $7F5177 | 1 | sceneDisplayTS | Scene TS shadow |
| $7F5178 | 1 | sceneDisplayCGWSEL | Scene CGWSEL shadow |
| $7F5179 | 1 | sceneDisplayCGADSUB | Scene CGADSUB shadow |
| $7F5180 | 2 | mapViewportCol | Starting room column |
| $7F5182 | 2 | mapViewportRow | Starting room row |
| $7F5184 | 2 | mapOffsetX | Tilemap centering X |
| $7F5186 | 2 | mapOffsetY | Tilemap centering Y |
| $7F5188 | 2 | mapMaxScrollX | Max horizontal scroll (pixels) |
| $7F518A | 2 | mapMaxScrollY | Max vertical scroll (pixels) |
| $7F518C | 2 | mapBuildWidth | Clamped build width |
| $7F518E | 2 | mapBuildHeight | Clamped build height |

The per-frame scroll update (`DungeonMapComputeScroll`) reads these WRAM
values + the player's live tile position to compute BG3 scroll.

## Collision → Tile Mapping

Source: collision layer at `$7FC000`. Each byte has high nibble (COP dynamic
overlay) and low nibble (base map type).

**High nibble nonzero → Wall** (COP-painted barriers: doors, gates, etc.)

Low nibble classification:

| Type | Value | Tile | Palette | Meaning |
|------|-------|------|---------|---------|
| Passable | $00 | Floor | 0 | Empty space |
| Passable | $01 | Floor | 0 | Variant (down-left special) |
| Interactive | $02 | Floor | 0 | Pushable objects |
| Slope E | $03 | Stairs | 6 | Slope ascending east |
| Ramp entry | $05 | Stairs | 6 | Semi-solid / ramp entry |
| Wall S | $06 | Wall | 0 | South-facing directional wall |
| Ladder | $07 | Stairs | 6 | Ladder / climbable |
| Stairs | $08 | Stairs | 6 | Staircase |
| Wall N | $09 | Wall | 0 | North-facing directional wall |
| Ramp | $0A | Stairs | 6 | Ramp / passable slope |
| Slope W | $0C | Stairs | 6 | Slope ascending west |
| Solid | $0E+ | Wall | 0 | Full block |
| OOB | $0F | OOB | 0 | Out of bounds / solid |

All other unrecognized types fall through to Floor.

## Entity Stamping

Entities overwrite tilemap entries at their tile positions.

| Entity | Tile | Palette | Detection method |
|--------|------|---------|-----------------|
| Exit | $02E8 | 5 (green) | `scene_warps[$0646]` — standard (12-byte) + extended (13-byte) warp rectangles |
| Chest | $02E5 | 2 (gold) | `scene_barrier_chest_table[$0646]` + `TestEventFlag_0200` |
| Dark Space | $02E6 | 3 (cyan) | `extendedFlags` ($7F002A,X) bit 9 ($0200) — dark space actors only |
| Enemy | $02E4 | 1 (red) | `extendedFlags` ($7F002A,X) bit 8 ($0100) — enemy spawn |
| Player | $02E7 | 4 (white) | `playerXTile` ($09A6) / `playerYTile` ($09A8) |

Stamp order (later entries overlay earlier):
1. **Exits** — from `scene_warps` table
2. **Chests** — from `scene_barrier_chest_table`
3. **Dark Spaces** — from actor list (bit 9 = $0200)
4. **Enemies** — from actor list (bit 8 = $0100)
5. **Player** — stamped last (always visible)

### Actor Y Coordinate Adjustment

Actor pixel Y (`$0016,X`) is the **center-bottom** reference point (feet).
The engine computes `playerYTile = (pixelY - $10) >> 4` — subtracting 16
(hitbox height) gives the tile the body occupies.

Enemy stamp applies the same adjustment: `(actorY - $10) >> 4`.

## DP Variable Map ($B0–$DF, saved/restored)

Used during init only. Copied to persistent WRAM before DP restore.

| Address | Name | Description |
|---------|------|-------------|
| $C4 | room_width | Room width in metatiles |
| $C6 | room_height | Room height in metatiles |
| $C8 | max_scroll_x | Max horizontal scroll (pixels) |
| $CA | max_scroll_y | Max vertical scroll (pixels) |
| $CE | tilemap_offset_x | Column offset for centering |
| $D0 | tilemap_offset_y | Row offset for centering |
| $D2 | viewport_col | Starting room column |
| $D4 | viewport_row | Starting room row |
| $D6 | build_width | Clamped build width (max 64) |
| $D8 | build_height | Clamped build height (max 64) |

## Scrolling

BG3HOFS ($2111) and BG3VOFS ($2112) provide smooth pixel-level panning.
The visible area is 256×224 pixels (32×28 tiles).

Per-frame auto-scroll (centers on player):
```
scroll_x = clamp((playerXTile - viewport_col + offset_x) × 8 − 128, 0, max_scroll_x)
scroll_y = clamp((playerYTile - viewport_row + offset_y) × 8 − 112, 0, max_scroll_y)
```

## Saved/Restored State

| Item | Save location | Size | Restore method |
|------|---------------|------|----------------|
| CGRAM shadow | $7F5100 | 64 bytes | Copy back to $7F0A00 + HW CGRAM |
| Engine DP ($B0–$DF) | $7F5140 | 48 bytes | Copy back to DP (within init, before return) |
| Collision pointer ($80–$82) | $7F5170 | 3 bytes | Copy back to $80–$82 (within init) |
| Color math (TM/TS/CGWSEL/CGADSUB) | $7F5176–$7F5179 | 4 bytes | Written by DisplayPresetShadow hook; restored on teardown |
| BG3SC | (hardcoded $78) | 1 byte | Written directly on teardown |
| BG3 scroll | (zeroed) | 4 bytes | STZ to BG3HOFS/BG3VOFS |
| Font CHR + HUD | — | — | ClearVramBufferPartial + UpdateFrameDialogue |

### Collision pointer ($80–$82)

The engine's `tile_collision_physics.asm` reads collision data via `LDA [$80], Y`
every frame. `StampWarpMarkers` reuses $80–$82 as a long pointer to `scene_warps`
data. Without save/restore, the engine would use the scene_warps address for
collision reads after the map closes → crash.

## Collision Map Offset Format

The collision layer at `$7FC000` uses a **packed page:sub offset** format,
matching the engine's `CalcTileMapOffset` in `tile_collision_physics.asm`.

### Packed offset structure

```
Full offset (16-bit) = page_byte << 8 | sub_byte

page_byte = (Y_tile >> 4) × mapRowStrideL0 + (X_tile >> 4)
sub_byte  = (Y_tile & $0F) × 16 + (X_tile & $0F)
```

Each 256-byte **page** contains one metatile's 16×16 sub-tile grid.
Within a page, rows (Y_sub) advance by +16 and columns (X_sub) advance by +1.
Pages are arranged in row-major order: `page = Y_meta × stride + X_meta`.

### Incremental advances

| Direction | Operation | Boundary handling |
|-----------|-----------|-------------------|
| Right (+X) | Low nibble += 1 | If wraps to 0: page++ and low byte += $F0 |
| Down (+Y) | Low byte += $10 | If carry: page += mapRowStrideL0 |

## Room Dimension Source

```
room_width  = mapRowStrideL0 ($0693) × 16 metatiles
room_height = mapPageRows    ($0697) × 16 metatiles
```
