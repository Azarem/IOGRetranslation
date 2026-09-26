; =============================================================================
; Minimap V2 Core — 4x4 compact tilemap minimap for Illusion of Gaia
; =============================================================================
;
; Three JSL-callable entry points (cross-bank safe):
;   MinimapScreenSetup  — upload tiles, write palettes, build arrays, display
;   MinimapScrollUpdate — re-encode viewport after D-pad scroll
;   MinimapTeardown     — restore CGRAM shadow and display state
;
; Uses the engine's own display pipeline:
;   - Adhoc DMA ($7F0C03-$7F0C09) for tile CHR upload
;   - Staging buffer ($7F0200) for BG3 tilemap
;   - displayModeFlags bit 0 for NMI-driven VRAM flush
;   - CGRAM shadow ($7F0A00) for palette (auto-uploaded every NMI)
;
; Tiles uploaded to VRAM $6800 (tile index 256+) to coexist with font CHR.
; Tile offset $0100 is added to encode table entries at runtime.
;
; Hybrid BG3 + OBJ sprite rendering:
;   BG3 markers: enemies (red, pal 6)
;   OBJ markers: player (white), chests (gold), dark spaces (cyan), exits (green)
;   "Transparent window" technique: BG3 cells at sprite marker positions are
;   cleared to color 0 (transparent). OBJ sprites at priority 3 show through
;   the transparent BG3 pixels, floating above the BG1/BG2 game world.
;   Mode 1 BG3 priority order: 3H > S3 > 1H > 2H > ... (BGMODE bit 3 = 1)
;
; BG3 palette placement (avoids BG1 scene and HUD conflicts):
;   Pal 4 ($7F0A20) = base map: transparent, floor, wall, brown
;   Pal 6 ($7F0A30) = enemies: transparent, floor, wall, red
;   Pal 7 ($7F0A38) = border: transparent, frame, fill, frame
;   Pals 0,1,2,5 = HUD-reserved (never touched)
;   Pal 3 = skipped (BG1 pal 0 colors 12-15 used by scene)
;
; Pre-built collision map architecture:
;   MinimapScreenSetup pre-classifies the entire room's collision layer
;   into prePackedMap ($7F4000) once. On each scroll, ExtractViewport
;   copies the viewport window from the pre-built map to the viewport-
;   relative packedColorArray (stride 32) via fast MVN row copies.
;   This supports rooms of any size — no 32×32 packed array cap.
;
; Compose buffer ($7F3100) sprite injection:
;   Stamp functions write 6-byte entries (worldX, worldY, tileAttr) to the
;   engine's OAM compose buffer. ComposeAllSprites (called from hold loop)
;   processes these into OAM. Actor list head ($0056) is zeroed during display
;   so only compose buffer sprites survive into OAM.
;
; DP persistent ($B4-$CE, safe during hold loop):
;   $B4 = viewportX (metatiles, always even)
;   $B6 = viewportY (metatiles, always even)
;   $B8 = room_width      $BA = room_height (metatiles)
;   $BC = max_vp_x         $BE = max_vp_y
;   $C0 = prebuildStride (packed cells per row in prePackedMap)
;   $C4 = visible_cols     $C6 = visible_rows
;   $C8 = offset_x         $CA = offset_y (centering padding in tiles)
;   $CC = fill_word (tilemap word for opaque dark fill)
;   $CE = compose buffer write cursor (byte offset into $7F3100)
;
; Engine DP save/restore:
;   RenderMinimapContent saves and restores engine low DP ($00-$94, 149 bytes)
;   via MVN to !savedLowDP before/after the collision/marker subroutines.
;   This is required because marker functions use scratch DPs that overlap
;   persistent engine state:
;     $80-$82 = collision tile map long pointer (tile_collision_physics)
;     $30/$34 = SPC transfer handshake counter (spc_transfer)
;     $36     = frame parity counter (system_core NMI handler)
;   Without this, the collision pointer is corrupted and all actor movement
;   freezes after the minimap closes.
;
; WRAM layout:
;   $7F3400-$7F37FF = packedColorArray (1024 bytes, viewport-relative)
;   $7F3800-$7F3BFF = paletteArray (1024 bytes, viewport-relative)
;   $7F3C00-$7F3C3F = savedCGRAM (64 bytes, CGRAM shadow backup)
;   $7F3C40-$7F3C5B = savedDPState (28 bytes, engine DP $B2-$CD backup)
;   $7F3C5C-$7F3CF0 = savedLowDP (149 bytes, engine DP $00-$94 backup)
;   $7F3D00-$7F3D01 = savedActorHead (2 bytes, backup of $0056)
;   $7F3D02-$7F3D21 = savedObjPal7 (32 bytes, backup of OBJ palette 7)
;   $7F4000-$7F7FFF = prePackedMap (up to 16KB, pre-classified collision data)
;
;   Arrays at $7F3400-$7F3FFF are in the safe zone between OAM compose buffer
;   and VRAM cache ring. The prePackedMap at $7F4000 uses the VRAM cache ring
;   area, which is safe during gameplay pause (no scene loading occurs).
;
; Pre-built collision architecture:
;   MinimapScreenSetup calls PreBuildPackedMap once to classify the entire
;   room's collision layer ($7FC000) and pack results into prePackedMap.
;   On each scroll, ExtractViewport copies the viewport window from the
;   pre-built map to packedColorArray with row-by-row MVN (~5K cycles
;   instead of ~2.4M cycles for full BuildViewportCollision).
; =============================================================================

?INCLUDE 'flag_helpers'
?INCLUDE 'radar_icons_001C00'
?INCLUDE 'scene_barrier_chest_table'
?INCLUDE 'scene_warps'
?INCLUDE 'sprite_composition'
?INCLUDE 'vblank_joypad'
?INCLUDE 'vram_buffer_clear'

; --- Engine state ---
!sceneCurrent                   0644
!sceneBarrierIdx                0646
!mapRowStrideL0                 0693
!mapPageRows                    0697
!playerXTile                    09A6
!playerYTile                    09A8
!playerActor                    09AA
!displayModeFlags               09EC
!actorListHead                  0056
!extendedFlags                  7F002A
!bg1ScrollH                     068C
!bg2ScrollH                     068E

; --- Adhoc DMA registers ---
!adhocVramDma                   7F0C03

; --- Hardware multiply (long addresses for bank-safe access) ---
!L_WRMPYA                       804202
!L_WRMPYB                       804203
!L_RDMPYL                       804216

; --- WRAM areas ---
!cgramShadow                    7F0A00
!collisionLayer                 7FC000
!oamComposeBuffer               7F3100
; Safe WRAM: $7F3400-$7F3FFF (between OAM compose buffer and VRAM cache ring)
!packedColorArray               7F3400
!paletteArray                   7F3800
!savedCGRAM                     7F3C00
!savedDPState                   7F3C40
!savedLowDP                     7F3C5C
!savedActorHead                 7F3D00
!savedObjPal7                   7F3D02
; Pre-built packed collision map (in VRAM cache ring — safe during gameplay pause)
!prePackedMap                   7F4000

; --- Engine staging buffer (BG3 tilemap, DMA'd by NMI) ---
!stagingBuffer                  7F0200

; --- Sorted actor render list (cleared to skip actor sprites) ---
!sortedRenderList               0C00

; --- Tile offset: CHR uploaded to VRAM $6800 = tile index 256 ---
!TILE_OFFSET                    0100
!VRAM_TILE_DEST                 6800

; --- OBJ marker tile VRAM destinations ---
; OBSEL=$02 → OBJ base at VRAM $4000, size mode 0 (8×8/16×16).
; 4 tiles in 2 pairs at non-contiguous VRAM to avoid equipped icon at $4FD0:
;   Tiles $EE-$EF at $4000 + $EE*$10 = $4EE0 (player + chest, 64 bytes)
;   Tiles $FE-$FF at $4000 + $FE*$10 = $4FE0 (dark space + exit, 64 bytes)
!OBJ_VRAM_DEST_A                4EE0
!OBJ_VRAM_DEST_B                4FE0
!OBJ_PAIR_SIZE                  0040

; --- Radar border tile system ---
; Tiles from radar_icons_001C00 at VRAM $7700 = tile $2E0 (BG3 base $6000).
; Border tiles use BG3 palette 3 (= BG1 pal 0 colors 12-15, scene-colored).
; Attribute base: priority 1, palette 3 = $2C00.
!RADAR_ICONS_VRAM               7700
!RADAR_ICONS_SIZE               0200

; --- Layout: band at row 4, interior rows 5-25, bottom band at row 26 ---
; ClearVramBufferPartial clears from $0140 (row 5). Row 4 cleared manually.
; Fill covers rows 4-26. Columns 0 and 31 cleared to transparent after fill.
!BORDER_START_OFF               0100
!INTERIOR_COLS                  001C
!INTERIOR_ROWS                  0015

; --- Scroll step (metatiles per D-pad press, must be even) ---
!SCROLL_STEP                    0002

; --- Palette bit constants (pre-shifted for tilemap bits 12-10) ---
; Only palettes 4, 6, 7 are used — palettes 0-3, 5 are reserved.
!PAL_BASE                       1000
!PAL_ENEMY                      1800
!PAL_BORDER                     1C00

; --- OBJ marker tile+attr constants ---
; Format: attr_high_byte : tile_index
; Attr: priority 3 ($30), OBJ palette 7 ($0E), name table 0 ($00) → $3E
; Tile indices: $EE = player, $EF = chest, $FE = dark space, $FF = exit
!MARKER_PLAYER                  3EEE
!MARKER_CHEST                   3EEF
!MARKER_DARK                    3EFE
!MARKER_EXIT                    3EFF

; --- OBJ palette 7 CGRAM shadow address ---
; OBJ palettes start at CGRAM byte $100. Palette 7 = $100 + 7*32 = $1E0.
; Full address: $7F0A00 + $1E0 = $7F0BE0.
!objPal7Shadow                  7F0BE0

---------------------------------------------
; =============================================================================
; MinimapScreenSetup — JSL entry, RTL return
; =============================================================================

MinimapScreenSetup {
    ; --- Save CGRAM shadow (64 bytes, BG3 palettes) ---
    PHB
    REP #$20
    LDX #$0A00
    LDY #$3C00
    LDA #$003F
    MVN #$7F, #$7F
    PLB

    ; --- Save OBJ palette 7 (32 bytes at $7F0BE0) ---
    PHB
    REP #$20
    LDX #$0BE0
    LDY #$3D02
    LDA #$001F
    MVN #$7F, #$7F
    PLB

    ; --- Save engine DP state ($B2-$CD, 28 bytes) ---
    PHB
    REP #$20
    LDX #$00B2
    LDY #$3C40
    LDA #$001B
    MVN #$7F, #$00
    PLB

    ; --- Save actor list head and cull actors ---
    REP #$20
    LDA $actorListHead
    STA $savedActorHead
    STZ $actorListHead

    ; --- Wait for any pending adhoc DMA ---
  mss_wait1:
    REP #$20
    LDA $7F0C07
    BEQ mss_dma_clear
    SEP #$20
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly
    BRA mss_wait1

  mss_dma_clear:
    ; --- Queue adhoc DMA: BG3 tile CHR → VRAM $6800 (1280 bytes) ---
    ; Write size BEFORE dest — $7F0C07 is the trigger; writing it arms the DMA.
    ; If NMI fires after $7F0C07, the size must already be correct.
    REP #$20
    LDA #$&minimap_v2_tiles
    STA $adhocVramDma
    LDA #$*minimap_v2_tiles
    STA $7F0C05
    LDA #$0500
    STA $7F0C09
    LDA #$VRAM_TILE_DEST
    STA $7F0C07

    ; --- Wait for BG3 tile DMA to complete ---
  mss_wait2:
    REP #$20
    LDA $7F0C07
    BEQ mss_bg3tiles_done
    SEP #$20
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly
    BRA mss_wait2

  mss_bg3tiles_done:
    ; --- Queue adhoc DMA: OBJ tiles pair A → VRAM $4EE0 (64 bytes, tiles $EE-$EF) ---
    ; Write size BEFORE dest to prevent NMI race (stale size from BG3 DMA = $0500!)
    REP #$20
    LDA #$&minimap_v2_objtiles
    STA $adhocVramDma
    LDA #$*minimap_v2_objtiles
    STA $7F0C05
    LDA #$OBJ_PAIR_SIZE
    STA $7F0C09
    LDA #$OBJ_VRAM_DEST_A
    STA $7F0C07

    ; --- Wait for pair A DMA to complete ---
  mss_wait3:
    REP #$20
    LDA $7F0C07
    BEQ mss_pairA_done
    SEP #$20
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly
    BRA mss_wait3

  mss_pairA_done:
    ; --- Queue adhoc DMA: OBJ tiles pair B → VRAM $4FE0 (64 bytes, tiles $FE-$FF) ---
    ; Write size BEFORE dest to prevent NMI race (stale size from pair A = $0040, same)
    REP #$20
    LDA #$&minimap_v2_objtiles+40
    STA $adhocVramDma
    LDA #$*minimap_v2_objtiles
    STA $7F0C05
    LDA #$OBJ_PAIR_SIZE
    STA $7F0C09
    LDA #$OBJ_VRAM_DEST_B
    STA $7F0C07

    ; --- Wait for pair B DMA to complete ---
  mss_wait4:
    REP #$20
    LDA $7F0C07
    BEQ mss_objtiles_done
    SEP #$20
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly
    BRA mss_wait4

  mss_objtiles_done:
    ; --- Queue adhoc DMA: radar border icons → VRAM $7700 (512 bytes) ---
    ; Write size BEFORE dest to prevent NMI race
    REP #$20
    LDA #$&radar_icons_001C00
    STA $adhocVramDma
    LDA #$*radar_icons_001C00
    STA $7F0C05
    LDA #$RADAR_ICONS_SIZE
    STA $7F0C09
    LDA #$RADAR_ICONS_VRAM
    STA $7F0C07

    ; --- Wait for radar icons DMA to complete ---
  mss_wait5:
    REP #$20
    LDA $7F0C07
    BEQ mss_radar_done
    SEP #$20
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly
    BRA mss_wait5

  mss_radar_done:
    ; --- Write BG3 palette 4 to CGRAM shadow (8 bytes at $7F0A20) ---
    ; Pal 4 = base map: transparent, floor, wall, brown
    REP #$20
    LDA #$0000
    STA $7F0A20
    LDA #$3E75
    STA $7F0A22
    LDA #$14C7
    STA $7F0A24
    LDA #$258D
    STA $7F0A26

    ; --- Write BG3 palette 6 to CGRAM shadow (8 bytes at $7F0A30) ---
    ; Pal 6 = enemies: transparent, floor, wall, red
    LDA #$0000
    STA $7F0A30
    LDA #$3E75
    STA $7F0A32
    LDA #$14C7
    STA $7F0A34
    LDA #$1CFC
    STA $7F0A36

    ; --- Write BG3 palette 7 to CGRAM shadow (8 bytes at $7F0A38) ---
    ; Pal 7 = border: transparent, frame, fill, frame
    LDA #$0000
    STA $7F0A38
    LDA #$36B8
    STA $7F0A3A
    LDA #$0C42
    STA $7F0A3C
    LDA #$36B8
    STA $7F0A3E

    ; --- Write OBJ palette 7 to CGRAM shadow (32 bytes at $7F0BE0) ---
    PHB
    REP #$20
    LDX #$&minimap_v2_objpal
    LDY #$0BE0
    LDA #$001F
    MVN #$7F, #$^minimap_v2_objpal
    PLB

    ; --- Clear staging buffer (rows 5+) ---
    JSL $@vram_buffer_clear.ClearVramBufferPartial

    ; --- Clear row 4 for crown ornament ($0100-$013F) ---
    REP #$20
    LDA #$0000
    LDX #$0100
  mss_clr4:
    STA $stagingBuffer, X
    INX
    INX
    CPX #$0140
    BNE mss_clr4

    ; --- Prevent unwanted ExecuteVramDma during hold loop ---
    REP #$20
    STZ $B2

    ; --- Compute room dimensions ---
    SEP #$20
    LDA $mapRowStrideL0
    REP #$20
    AND #$00FF
    ASL
    ASL
    ASL
    ASL
    STA $B8

    SEP #$20
    LDA $mapPageRows
    REP #$20
    AND #$00FF
    ASL
    ASL
    ASL
    ASL
    STA $BA

    ; --- Visible cols/rows = min(ceil(room/2), interior) ---
    LDA $B8
    INC
    LSR
    CMP #$INTERIOR_COLS
    BCC mss_vc_ok
    LDA #$INTERIOR_COLS
  mss_vc_ok:
    STA $C4

    LDA $BA
    INC
    LSR
    CMP #$INTERIOR_ROWS
    BCC mss_vr_ok
    LDA #$INTERIOR_ROWS
  mss_vr_ok:
    STA $C6

    ; --- Centering offsets (tiles of padding inside border) ---
    LDA #$INTERIOR_COLS
    SEC
    SBC $C4
    LSR
    STA $C8

    LDA #$INTERIOR_ROWS
    SEC
    SBC $C6
    LSR
    STA $CA

    ; --- Max viewport position (metatiles) ---
    LDA $C4
    ASL
    STA $08
    LDA $B8
    SEC
    SBC $08
    BPL mss_mvx_ok
    LDA #$0000
  mss_mvx_ok:
    STA $BC

    LDA $C6
    ASL
    STA $08
    LDA $BA
    SEC
    SBC $08
    BPL mss_mvy_ok
    LDA #$0000
  mss_mvy_ok:
    STA $BE

    ; --- Initial viewport centered on player ---
    LDA $BC
    BEQ mss_vpx_zero
    LDA $playerXTile
    SEC
    SBC $C4
    BPL mss_vpx_lo
    LDA #$0000
  mss_vpx_lo:
    AND #$FFFE
    CMP $BC
    BCC mss_vpx_ok
    LDA $BC
    AND #$FFFE
  mss_vpx_ok:
    STA $B4
    BRA mss_vpy
  mss_vpx_zero:
    STZ $B4

  mss_vpy:
    LDA $BE
    BEQ mss_vpy_zero
    LDA $playerYTile
    SEC
    SBC $C6
    BPL mss_vpy_lo
    LDA #$0000
  mss_vpy_lo:
    AND #$FFFE
    CMP $BE
    BCC mss_vpy_ok
    LDA $BE
    AND #$FFFE
  mss_vpy_ok:
    STA $B6
    BRA mss_build
  mss_vpy_zero:
    STZ $B6

  mss_build:
    ; --- Compute fill word (border palette 7) ---
    ; Encode table entry $AA = all quadrants color 2 (solid wall/dark fill)
    LDX #$0154
    LDA $@minimap_v2_encode, X
    CLC
    ADC #$TILE_OFFSET
    ORA #$PAL_BORDER
    STA $CC

    ; --- Pre-build packed collision map for entire room ---
    JSR $&PreBuildPackedMap

    JSR $&DrawBorder
    JSR $&RenderMinimapContent

    ; --- Trigger staging buffer DMA on next NMI ---
    SEP #$20
    LDA #$01
    TSB $displayModeFlags

    LDX #$0000
    RTL
}

---------------------------------------------
; =============================================================================
; MinimapScrollUpdate — JSL entry, RTL return
; =============================================================================

MinimapScrollUpdate {
    REP #$20
    JSR $&RenderMinimapContent
    SEP #$20
    LDA #$01
    TSB $displayModeFlags
    RTL
}

---------------------------------------------
; =============================================================================
; MinimapTeardown — JSL entry, RTL return
; =============================================================================

MinimapTeardown {
    PHB
    REP #$20

    ; --- Restore CGRAM shadow (64 bytes, BG3 palettes) ---
    LDX #$3C00
    LDY #$0A00
    LDA #$003F
    MVN #$7F, #$7F

    ; --- Restore OBJ palette 7 (32 bytes) ---
    LDX #$3D02
    LDY #$0BE0
    LDA #$001F
    MVN #$7F, #$7F

    ; --- Restore engine DP state ($B2-$CD, 28 bytes) ---
    LDX #$3C40
    LDY #$00B2
    LDA #$001B
    MVN #$00, #$7F
    PLB

    ; --- Restore actor list head ---
    REP #$20
    LDA $savedActorHead
    STA $actorListHead

    RTL
}

---------------------------------------------
; =============================================================================
; RenderMinimapContent — rebuild the visible minimap content
; =============================================================================
; Called from both MinimapScreenSetup and MinimapScrollUpdate.
; Extracts viewport from pre-built collision map, stamps markers,
; encodes to staging buffer, and builds compose buffer for OBJ markers.
;
; paletteArray must be cleared to palette 4 (base map) so non-marker cells
; use the correct BG3 palette. Compose buffer cursor ($CE) is reset and
; entries are written by the transparent stamp functions.

RenderMinimapContent {
    REP #$20

    ; --- Clear palette array to palette 3 (base map default) ---
    LDA #$0404
    LDX #$0000
  rmc_clear:
    STA $paletteArray, X
    INX
    INX
    CPX #$0400
    BNE rmc_clear

    ; --- Reset compose buffer cursor ---
    STZ $CE

    ; --- Save engine low DP ($00-$94, 149 bytes) ---
    PHB
    REP #$20
    LDX #$0000
    LDY #$3C5C
    LDA #$0094
    MVN #$7F, #$00
    PLB

    JSR $&ExtractViewport
    JSR $&StampDarkSpaceMarkers
    JSR $&StampChestMarkers
    JSR $&StampWarpMarkers
    JSR $&StampEnemyMarkers
    JSR $&StampPlayerMarker
    JSR $&EncodeViewport

    ; --- Write compose buffer terminator ---
    REP #$20
    LDX $CE
    LDA #$FFFF
    STA $oamComposeBuffer, X

    ; --- Restore engine low DP ($00-$94) ---
    PHB
    REP #$20
    LDX #$3C5C
    LDY #$0000
    LDA #$0094
    MVN #$00, #$7F
    PLB

    RTS
}

---------------------------------------------
; =============================================================================
; PreBuildPackedMap — one-time: classify + pack entire room collision
; =============================================================================
; (unchanged from previous version)

PreBuildPackedMap {
    REP #$20

    LDA $B8
    INC
    LSR
    STA $C0

    LDA $BA
    INC
    LSR
    STA $08
    SEP #$20
    LDA $08
    STA $L_WRMPYA
    LDA $C0
    STA $L_WRMPYB
    NOP
    NOP
    NOP
    NOP
    REP #$20
    LDA $L_RDMPYL
    INC
    AND #$FFFE
    STA $20
    LDA #$0000
    TAX
  pbpm_clear:
    STA $prePackedMap, X
    INX
    INX
    CPX $20
    BCC pbpm_clear

    LDA #$0000
    STA $0C
    STA $04
    STA $0A

  pbpm_row:
    LDA $04
    AND #$0001
    BNE pbpm_row_odd
    LDA $0A
    STA $08
    LDA #$0000
    STA $10
    LDA #$0004
    STA $12
    BRA pbpm_col_init
  pbpm_row_odd:
    LDA $0A
    STA $08
    LDA #$0008
    STA $10
    LDA #$000C
    STA $12

  pbpm_col_init:
    LDA #$0000
    STA $0E
    STA $06

  pbpm_col:
    LDA $0C
    CLC
    ADC $0E
    TAX

    SEP #$20
    LDA $collisionLayer, X

    BIT #$F0
    BNE pbpm_wall
    CMP #$0E
    BCS pbpm_wall
    LDA #$01
    BRA pbpm_got
  pbpm_wall:
    LDA #$02
  pbpm_got:
    REP #$20
    AND #$00FF
    STA $14

    LDA $06
    AND #$0001
    BNE pbpm_odd_x
    LDA $10
    BRA pbpm_combine
  pbpm_odd_x:
    LDA $12
  pbpm_combine:
    CLC
    ADC $14
    TAX

    SEP #$20
    LDA $@QuadColorTable, X
    LDX $08
    ORA $prePackedMap, X
    STA $prePackedMap, X
    REP #$20

    INC $0E
    LDA $06
    INC
    STA $06

    LDA $0E
    AND #$000F
    BNE pbpm_no_pcross
    LDA $0E
    CLC
    ADC #$00F0
    STA $0E
  pbpm_no_pcross:

    LDA $06
    AND #$0001
    BNE pbpm_no_arr_adv
    INC $08
  pbpm_no_arr_adv:

    LDA $06
    CMP $B8
    BCC pbpm_col

    SEP #$20
    LDA $0C
    CLC
    ADC #$10
    STA $0C
    BCC pbpm_no_ycross
    LDA $0C+1
    CLC
    ADC $mapRowStrideL0
    STA $0C+1
  pbpm_no_ycross:
    REP #$20

    LDA $04
    AND #$0001
    BEQ pbpm_no_row_adv
    LDA $0A
    CLC
    ADC $C0
    STA $0A
  pbpm_no_row_adv:

    INC $04
    LDA $04
    CMP $BA
    BCS pbpm_done
    JMP $&pbpm_row

  pbpm_done:
    RTS
}

---------------------------------------------
; =============================================================================
; ExtractViewport — copy viewport window from prePackedMap to packedColorArray
; =============================================================================

ExtractViewport {
    REP #$20

    LDA $C4
    ASL
    STA $16
    LDA $C6
    ASL
    STA $18

    SEP #$20
    LDA $B6
    LSR
    STA $L_WRMPYA
    LDA $C0
    STA $L_WRMPYB
    NOP
    NOP
    NOP
    NOP
    REP #$20
    LDA $L_RDMPYL
    STA $08
    LDA $B4
    AND #$00FF
    LSR
    CLC
    ADC $08
    STA $08

    LDA $C0
    AND #$00FF
    STA $0A

    LDA #$0000
    STA $0C

    LDA $C6
    STA $0E

    LDA $C4
    STA $10

  xv_row:
    PHB
    REP #$20
    LDA $08
    CLC
    ADC #$4000
    TAX
    LDA $0C
    CLC
    ADC #$3400
    TAY
    LDA $10
    DEC
    MVN #$7F, #$7F
    PLB

    LDA $08
    CLC
    ADC $0A
    STA $08

    LDA $0C
    CLC
    ADC #$0020
    STA $0C

    DEC $0E
    BNE xv_row

    RTS
}

---------------------------------------------
; =============================================================================
; QuadColorTable — shifted color values per quadrant
; =============================================================================

QuadColorTable [
  #$00 #$40 #$80 #$C0
  #$00 #$10 #$20 #$30
  #$00 #$04 #$08 #$0C
  #$00 #$01 #$02 #$03
]

---------------------------------------------
QuadMaskTable [
  #$3F
  #$CF
  #$F3
  #$FC
]

QuadSetTable [
  #$C0
  #$30
  #$0C
  #$03
]

---------------------------------------------
; =============================================================================
; QuadFlipTable — OAM flip bits per quadrant for compose buffer sprites
; =============================================================================
; Maps quadrant index (0=TL, 1=TR, 2=BL, 3=BR) to OAM V/H flip bits.
; Sprite tile has a 4x4 block in the TL corner; flips place it in other quadrants.

QuadFlipTable [
  #$0000
  #$4000
  #$8000
  #$C000
]

---------------------------------------------
; =============================================================================
; StampQuadrant — set one quadrant to color 3 and record palette (BG3 markers)
; =============================================================================
; Input: $00 = metaX, $02 = metaY (16-bit absolute), $04 = palette bits
; Scratch: $20-$2A.

StampQuadrant {
    REP #$20

    LDA $00
    SEC
    SBC $B4
    BMI sq_done
    CMP $16
    BCS sq_done
    STA $20

    LDA $02
    SEC
    SBC $B6
    BMI sq_done
    CMP $18
    BCS sq_done
    STA $22

    LDA $22
    LSR
    ASL
    ASL
    ASL
    ASL
    ASL
    STA $24
    LDA $20
    LSR
    CLC
    ADC $24
    STA $24

    LDA $20
    AND #$0001
    STA $26
    LDA $22
    AND #$0001
    ASL
    ORA $26
    STA $26

    TAX
    SEP #$20
    LDA $@QuadMaskTable, X
    STA $28
    LDA $@QuadSetTable, X
    STA $2A

    LDX $24
    LDA $packedColorArray, X
    AND $28
    ORA $2A
    STA $packedColorArray, X

    REP #$20
    LDA $04
    XBA
    LSR
    LSR
    AND #$0007
    SEP #$20
    LDX $24
    STA $paletteArray, X

  sq_done:
    REP #$20
    RTS
}

---------------------------------------------
; =============================================================================
; StampQuadrantTransparent — clear BG3 quadrant + write compose buffer entry
; =============================================================================
; Input: $00 = metaX, $02 = metaY (16-bit absolute), $04 = tile+attr base word
; Writes color 0 (transparent) to the BG3 packed array quadrant so OBJ sprites
; at S3 priority show through the transparent BG3 pixel.
; Writes a 6-byte compose buffer entry with world coordinates + tile+attr.
; Scratch: $20-$2C.

StampQuadrantTransparent {
    REP #$20

    ; --- Bounds check (same as StampQuadrant) ---
    LDA $00
    SEC
    SBC $B4
    BMI sqt_bail
    CMP $16
    BCS sqt_bail
    STA $20

    LDA $02
    SEC
    SBC $B6
    BMI sqt_bail
    CMP $18
    BCS sqt_bail
    STA $22
    BRA sqt_in_bounds

  sqt_bail:
    RTS

  sqt_in_bounds:
    ; --- Packed array index ---
    LDA $22
    LSR
    ASL
    ASL
    ASL
    ASL
    ASL
    STA $24
    LDA $20
    LSR
    CLC
    ADC $24
    STA $24

    ; --- Quadrant from parity ---
    LDA $20
    AND #$0001
    STA $26
    LDA $22
    AND #$0001
    ASL
    ORA $26
    STA $26

    ; --- Clear BG3 quadrant to color 0 (transparent) ---
    TAX
    SEP #$20
    LDA $@QuadMaskTable, X
    LDX $24
    AND $packedColorArray, X
    STA $packedColorArray, X
    REP #$20

    ; --- Compute world X for compose buffer ---
    ; screenX = (vpRelX/2 + offset_x + 2) × 8
    ; worldX = screenX + bg1ScrollH
    LDA $20
    LSR
    CLC
    ADC $C8
    INC
    INC
    ASL
    ASL
    ASL
    CLC
    ADC $bg1ScrollH
    STA $28

    ; --- Compute world Y for compose buffer ---
    ; screenY = (vpRelY/2 + offset_y + 5) × 8 - 1
    ; worldY = screenY + bg2ScrollH
    ; The -1 aligns the sprite pixel with the BG3 cell (sprites render 1px low)
    LDA $22
    LSR
    CLC
    ADC $CA
    CLC
    ADC #$0005
    ASL
    ASL
    ASL
    DEC
    CLC
    ADC $bg2ScrollH
    STA $2A

    ; --- Tile+attr with quadrant flip ---
    PHX
    LDA $26
    ASL
    TAX
    LDA $@QuadFlipTable, X
    ORA $04
    STA $2C
    PLX

    ; --- Write to compose buffer ---
    LDX $CE
    LDA $28
    STA $oamComposeBuffer, X
    LDA $2A
    STA $7F3102, X
    LDA $2C
    STA $7F3104, X

    ; --- Advance compose buffer cursor ---
    TXA
    CLC
    ADC #$0006
    STA $CE

    RTS
}

---------------------------------------------
; =============================================================================
; StampWarpMarkers — mark scene warp trigger rectangles (OBJ sprites, green)
; =============================================================================

StampWarpMarkers {
    REP #$20
    LDX $sceneBarrierIdx
    LDA $@scene_warps, X
    STA $80
    SEP #$20
    LDA #$^scene_warps
    STA $82
    REP #$20
    LDA #$0000
    STA $40

  swm_std:
    LDY $40
    SEP #$20
    LDA [$80], Y
    CMP #$FF
    BEQ swm_std_end
    REP #$20
    AND #$00FF
    STA $30
    INY
    SEP #$20
    LDA [$80], Y
    REP #$20
    AND #$00FF
    STA $32
    INY
    SEP #$20
    LDA [$80], Y
    REP #$20
    AND #$00FF
    STA $34
    INY
    SEP #$20
    LDA [$80], Y
    REP #$20
    AND #$00FF
    STA $36
    LDA #$MARKER_EXIT
    STA $38
    LDA $40
    CLC
    ADC #$000C
    STA $40
    JSR $&StampWarpRect
    BRA swm_std

  swm_std_end:
    REP #$20
    INC $40

  swm_ext:
    LDY $40
    SEP #$20
    LDA [$80], Y
    CMP #$FF
    BEQ swm_done
    REP #$20
    AND #$00FF
    STA $30
    INY
    SEP #$20
    LDA [$80], Y
    REP #$20
    AND #$00FF
    STA $32
    INY
    SEP #$20
    LDA [$80], Y
    REP #$20
    AND #$00FF
    STA $34
    INY
    SEP #$20
    LDA [$80], Y
    REP #$20
    AND #$00FF
    STA $36
    LDA #$MARKER_EXIT
    STA $38
    LDA $40
    CLC
    ADC #$000D
    STA $40
    JSR $&StampWarpRect
    BRA swm_ext

  swm_done:
    REP #$20
    RTS
}

---------------------------------------------

StampWarpRect {
    REP #$20
    LDA #$0000
    STA $12

  swr_row:
    LDA #$0000
    STA $10

  swr_col:
    LDA $30
    CLC
    ADC $10
    STA $00

    LDA $32
    CLC
    ADC $12
    STA $02

    LDA $38
    STA $04

    JSR $&StampQuadrantTransparent

    INC $10
    LDA $10
    CMP $34
    BCC swr_col

    INC $12
    LDA $12
    CMP $36
    BCC swr_row

    RTS
}

---------------------------------------------
; =============================================================================
; StampChestMarkers — sprite markers for unvisited chests (OBJ, gold)
; =============================================================================

StampChestMarkers {
    REP #$20
    LDX $sceneBarrierIdx
    LDA $@scene_barrier_chest_table, X
    SEC
    SBC #$&scene_barrier_chest_table
    STA $40

  scm_loop:
    SEP #$20
    LDX $40
    LDA $@scene_barrier_chest_table, X
    BMI scm_done

    LDA $@scene_barrier_chest_table+3, X
    REP #$20
    AND #$007F
    JSL $@flag_helpers.TestEventFlag_0200
    BCS scm_next

    SEP #$20
    LDX $40
    LDA $@scene_barrier_chest_table, X
    REP #$20
    AND #$00FF
    STA $00

    SEP #$20
    LDX $40
    LDA $@scene_barrier_chest_table+1, X
    REP #$20
    AND #$00FF
    STA $02

    LDA #$MARKER_CHEST
    STA $04
    JSR $&StampQuadrantTransparent

  scm_next:
    REP #$20
    LDA $40
    CLC
    ADC #$0004
    STA $40
    BRA scm_loop

  scm_done:
    REP #$20
    RTS
}

---------------------------------------------
; =============================================================================
; StampDarkSpaceMarkers — sprite markers for dark spaces (OBJ, cyan)
; =============================================================================

StampDarkSpaceMarkers {
    REP #$20
    LDA $actorListHead
    BNE sdm_has_actors
    ; Actor list was culled — use saved head for iteration
    LDA $savedActorHead
  sdm_has_actors:
    BEQ sdm_done
    STA $40

  sdm_loop:
    LDA $40
    CMP $playerActor
    BEQ sdm_next

    LDX $40
    LDA $extendedFlags, X
    BIT #$0200
    BEQ sdm_next

    LDA $0014, X
    LSR
    LSR
    LSR
    LSR
    STA $00

    LDA $0016, X
    SEC
    SBC #$0010
    BPL sdm_y_ok
    LDA #$0000
  sdm_y_ok:
    LSR
    LSR
    LSR
    LSR
    STA $02

    LDA #$MARKER_DARK
    STA $04
    JSR $&StampQuadrantTransparent

  sdm_next:
    REP #$20
    LDX $40
    LDA $0006, X
    BEQ sdm_done
    STA $40
    JMP $&sdm_loop

  sdm_done:
    RTS
}

---------------------------------------------
; =============================================================================
; StampEnemyMarkers — BG3 markers for enemies (palette 4, red)
; =============================================================================

StampEnemyMarkers {
    REP #$20
    LDA $actorListHead
    BNE sem_has_actors
    LDA $savedActorHead
  sem_has_actors:
    BEQ sem_done
    STA $40

  sem_loop:
    LDA $40
    CMP $playerActor
    BEQ sem_next

    LDX $40
    LDA $extendedFlags, X
    BIT #$0100
    BEQ sem_next

    LDA $0014, X
    LSR
    LSR
    LSR
    LSR
    STA $00

    LDA $0016, X
    SEC
    SBC #$0010
    BPL sem_y_ok
    LDA #$0000
  sem_y_ok:
    LSR
    LSR
    LSR
    LSR
    STA $02

    LDA #$PAL_ENEMY
    STA $04
    JSR $&StampQuadrant

  sem_next:
    REP #$20
    LDX $40
    LDA $0006, X
    BEQ sem_done
    STA $40
    JMP $&sem_loop

  sem_done:
    RTS
}

---------------------------------------------
; =============================================================================
; StampPlayerMarker — sprite marker for player position (OBJ, white)
; =============================================================================

StampPlayerMarker {
    REP #$20
    LDA $playerXTile
    STA $00
    LDA $playerYTile
    STA $02
    LDA #$MARKER_PLAYER
    STA $04
    JSR $&StampQuadrantTransparent
    RTS
}

---------------------------------------------
; =============================================================================
; DrawBorder — draw radar-style border to staging buffer
; =============================================================================
; Uses radar icon tiles ($2E0-$2FF at VRAM $7700) with BG3 palette 3
; (scene-colored via BG1 pal 0 colors 12-15). Interior fill uses palette 7.
; Crown at row 4, top band at row 5, side edges rows 6-26, bottom band row 27.
; Border frame: columns 1-30 (columns 0 and 31 = empty gap).

DrawBorder {
    REP #$20

    ; --- Fill rows 4-26 with dark fill tile (palette 7) ---
    LDA $CC
    LDX #$BORDER_START_OFF
  db_fill:
    STA $stagingBuffer, X
    INX
    INX
    CPX #$06C0
    BNE db_fill

    ; --- Draw top band at row 4 (columns 1-30) ---
    ; $0E = source table index, $10 = dest buffer offset
    STZ $0E
    LDA #$0102
    STA $10
  db_top:
    LDX $0E
    LDA $@RadarTopBand, X
    LDX $10
    STA $stagingBuffer, X
    INC $0E
    INC $0E
    INC $10
    INC $10
    LDA $0E
    CMP #$003C
    BNE db_top

    ; --- Draw side edges (rows 5-25) ---
    ; X = row start at column 1 ($0142 = row 5, col 1)
    ; Column 30 = X + $3A (29 tiles × 2 bytes)
    LDX #$0142
  db_sides:
    LDA #$2EE3
    STA $stagingBuffer, X
    PHX
    TXA
    CLC
    ADC #$003A
    TAX
    LDA #$6EE3
    STA $stagingBuffer, X
    PLX
    TXA
    CLC
    ADC #$0040
    TAX
    CPX #$0682
    BCS db_sides_done
    LDA #$AEE3
    STA $stagingBuffer, X
    PHX
    TXA
    CLC
    ADC #$003A
    TAX
    LDA #$EEE3
    STA $stagingBuffer, X
    PLX
    TXA
    CLC
    ADC #$0040
    TAX
    CPX #$0682
    BCC db_sides
  db_sides_done:

    ; --- Draw bottom band at row 26 (columns 1-30, V-flipped top) ---
    STZ $0E
    LDA #$0682
    STA $10
  db_bot:
    LDX $0E
    LDA $@RadarTopBand, X
    ORA #$8000
    LDX $10
    STA $stagingBuffer, X
    INC $0E
    INC $0E
    INC $10
    INC $10
    LDA $0E
    CMP #$003C
    BNE db_bot

    ; --- Clear exterior: columns 0 and 31 to transparent (rows 4-26) ---
    LDX #$0100
  db_ext:
    LDA #$0000
    STA $stagingBuffer, X
    PHX
    TXA
    CLC
    ADC #$003E
    TAX
    LDA #$0000
    STA $stagingBuffer, X
    PLX
    TXA
    CLC
    ADC #$0040
    TAX
    CPX #$06C0
    BCC db_ext

    RTS
}

; --- Top band tile data (30 words = columns 1-30) ---
; Palette 3, priority 1: attr=$2C00, H-flip=$6C00
; Pattern: 2E1 corner, 2E2/2E2-H fill, centered ornament 2F1-2F7, fill, 2E1-H corner
RadarTopBand [
  #$2EE1   ; col 1:  2E1  (left corner)
  #$2EE2   ; col 2:  2E2  (fill)
  #$6EE2   ; col 3:  2E2H (fill)
  #$2EE2   ; col 4:  2E2  (fill)
  #$6EE2   ; col 5:  2E2H (fill)
  #$2EE2   ; col 6:  2E2  (fill)
  #$6EE2   ; col 7:  2E2H (fill)
  #$2EE2   ; col 8:  2E2  (fill)
  #$6EE2   ; col 9:  2E2H (fill)
  #$2EF1   ; col 10: 2F1  (ornament start)
  #$2EF2   ; col 11: 2F2
  #$2EE2   ; col 12: 2E2
  #$2EF3   ; col 13: 2F3
  #$2EF4   ; col 14: 2F4
  #$2EF5   ; col 15: 2F5
  #$2EF7   ; col 16: 2F7  (ornament center)
  #$6EF5   ; col 17: 2F5H
  #$6EF4   ; col 18: 2F4H
  #$6EF3   ; col 19: 2F3H
  #$6EE2   ; col 20: 2E2H
  #$6EF2   ; col 21: 2F2H
  #$6EF1   ; col 22: 2F1H (ornament end)
  #$2EE2   ; col 23: 2E2  (fill)
  #$6EE2   ; col 24: 2E2H (fill)
  #$2EE2   ; col 25: 2E2  (fill)
  #$6EE2   ; col 26: 2E2H (fill)
  #$2EE2   ; col 27: 2E2  (fill)
  #$6EE2   ; col 28: 2E2H (fill)
  #$2EE2   ; col 29: 2E2  (fill)
  #$6EE1   ; col 30: 2E1H (right corner)
]

---------------------------------------------
; =============================================================================
; EncodeViewport — viewport-relative packed array → staging buffer interior
; =============================================================================
; (unchanged)

EncodeViewport {
    REP #$20

    LDA $C8
    INC
    INC
    ASL
    STA $10

    LDA $CA
    CLC
    ADC #$0005
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    STA $0C

    LDA #$0000
    STA $08
    STA $04

  ev_row:
    LDA #$0000
    STA $06

    LDA $0C
    CLC
    ADC $10
    STA $0E

  ev_col:
    LDA $06
    CLC
    ADC $08
    TAX

    SEP #$20
    LDA $packedColorArray, X
    STA $12
    LDA $paletteArray, X
    REP #$20

    AND #$00FF
    XBA
    ASL
    ASL
    STA $14

    LDA $12
    AND #$00FF
    ASL
    TAX
    LDA $@minimap_v2_encode, X
    CLC
    ADC #$TILE_OFFSET
    ORA $14

    LDX $0E
    STA $stagingBuffer, X

    LDA $0E
    CLC
    ADC #$0002
    STA $0E

    INC $06
    LDA $06
    CMP $C4
    BCC ev_col

    LDA $08
    CLC
    ADC #$0020
    STA $08

    LDA $0C
    CLC
    ADC #$0040
    STA $0C

    INC $04
    LDA $04
    CMP $C6
    BCS ev_done
    JMP $&ev_row

  ev_done:
    RTS
}
