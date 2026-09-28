; =============================================================================
; Dungeon Map Core — BG3 overlay hold-loop map display
; =============================================================================
;
; Displays a BG3 tilemap map overlay with the original radar border when the
; player presses Start in a combat zone. The game pauses during display but
; the game world (BG1/BG2/OBJ sprites) remains visible through transparent
; edges around the map.
;
; Architecture:
;   DungeonMapScreenSetup  — JSL: upload tiles, build map, draw border, display
;   DungeonMapScrollUpdate — JSL: re-extract window after D-pad scroll
;   DungeonMapTeardown     — JSL: restore CGRAM + DP, adhoc DMA font restore
;
; Screen layout (radar border):
;   Row 0:            transparent ($0000, game world visible)
;   Row 1:            radar top band (crown ornament, palette 3)
;   Rows 2-25:        map content (28×24 interior)
;   Row 26:           radar bottom band (V-flipped, palette 3)
;   Rows 27+:         transparent ($0000, game world visible)
;   Cols 0, 31:       transparent ($0000, game world visible)
;   Cols 1, 30:       radar side edges (palette 3)
;   Cols 2-29:        map content
;
; Overlay mode (game world visible):
;   - TM/TS are NOT modified (BG1/BG2/OBJ stay enabled)
;   - Actor list is NOT culled (sprites keep rendering)
;   - BG3 palettes 4-7 are overwritten (safe slots)
;   - Palette 3 (scene-colored) used by radar border, not modified
;   - BG3 priority 1 renders above all sprites and BG1/BG2
;
; WRAM tilemap buffer ($7F6000):
;   Linear row-major layout, stride = 64 words (128 bytes per row).
;   Up to 64×64 metatiles. Pre-cleared to OOB, then terrain + markers stamped.
;   Room content centered via offset: (28-room_width)/2, (24-room_height)/2.
;
; Tile CHR at VRAM $6800 (4 terrain tiles × 16 bytes = 64 bytes):
;   $100: OOB    $101: Floor    $102: Wall    $103: Stairs
;   Terrain tiles use colors 0-2 only (transparent/floor/wall).
;   Color 3 is reserved for marker accents.
;
; Marker tiles (existing VRAM, no upload needed):
;   Radar icon $2E5: player marker (at VRAM $7700 via radar icons)
;   Radar icon $2E7: enemy marker
;   Radar icon $2E6: chest/exit markers
;   Font tile $0D: dark space marker (base font at VRAM $6000)
;
; Palette layout (BG3 pals 1-7):
;   Pal 1 ($7F0A08): transparent, floor, wall, white  — player (blinks)
;   Pal 2 ($7F0A10): transparent, floor, wall, green  — exit/warp
;   Pal 3:           scene-colored (used by radar border, not modified)
;   Pal 4 ($7F0A20): transparent, floor, wall, texture — terrain
;   Pal 5 ($7F0A28): transparent, floor, wall, red    — enemy
;   Pal 6 ($7F0A30): transparent, floor, wall, gold   — chest
;   Pal 7 ($7F0A38): transparent, floor, wall, cyan   — dark space + shimmer
;   Pal 0: untouched (HUD)
;
; DP variable allocation ($B2-$CD, saved/restored by setup/teardown):
;   $B4: viewport_col       $BC: max_viewport_col
;   $B6: viewport_row       $BE: max_viewport_row
;   $B8: room_width          $C0: center_offset_x (in buffer)
;   $BA: room_height         $C2: center_offset_y (in buffer)
;   $C4: visible_cols        $CC: OOB fill word
;   $C6: visible_rows
; =============================================================================

?INCLUDE 'flag_helpers'
?INCLUDE 'gfx_fonts'
?INCLUDE 'radar_icons_001C00'
?INCLUDE 'scene_barrier_chest_table'
?INCLUDE 'scene_lifecycle'
?INCLUDE 'scene_warps'
?INCLUDE 'system_core'
?INCLUDE 'vblank_joypad'
?INCLUDE 'vram_buffer_clear'

; --- Engine state ---
!sceneCurrent                   0644
!sceneBarrierIdx                0646
!actorListHead                  0056
!mapRowStrideL0                 0693
!mapPageRows                    0697
!playerXTile                    09A6
!playerYTile                    09A8
!playerActor                    09AA
!displayModeFlags               09EC
!extendedFlags                  7F002A
!cachedPrevMaxHp                0ACC
!cachedPrevHp                   0AD0

; --- PPU registers ---
!INIDISP                        2100
!BG3HOFS                        2111
!BG3VOFS                        2112

; --- Staging buffer and adhoc DMA ---
!stagingBuffer                  7F0200
!adhocVramDma                   7F0C03
!cgramShadow                    7F0A00
!stagedDmaCount                 00B2

; --- Collision layer ---
!collisionLayer                 7FC000

; --- WRAM saved state ---
; Layout (no overlaps):
;   $5100-$5137: savedCGRAM      (56 bytes, palettes 1-7)
;   $5140-$515B: savedDP         (28 bytes, $B2-$CD)
;   $515C-$515D: savedActorHead  (2 bytes, snapshot for stamp iteration)
;   $5200-$5294: savedLowDP      (149 bytes, $00-$94)
!savedCGRAM                     7F5100
!savedDP                        7F5140
!savedActorHead                 7F515C
!savedLowDP                     7F5200

; --- Tilemap build buffer (linear, 64-wide stride) ---
!tilemapBuffer                  7F6000

; --- VRAM destinations ---
!VRAM_TILE_DEST                 6800
!TILE_CHR_SIZE                  0050
!RADAR_ICONS_VRAM               7700
!RADAR_ICONS_SIZE               0200

; --- Tile index constants (BG3 base $6000, tiles at $6800 = index $100) ---
!TILE_OOB                       0100
!TILE_FLOOR                     0101
!TILE_WALL                      0102
!TILE_STAIRS                    0103
!TILE_EXIT                      0104

; --- Palette attribute bits (priority 1 + palette, pre-shifted for tilemap) ---
!PAL1                           2400
!PAL2                           2800
!PAL4                           3000
!PAL5                           3400
!PAL6                           3800
!PAL7                           3C00

; --- Marker tilemap words (tile index + priority + palette) ---
; Player: radar icon $2E5, palette 1 (white accent, blinks)
!MARKER_PLAYER                  26E5
; Enemy: radar icon $2E7, palette 5 (red accent)
!MARKER_ENEMY                   36E7
; Chest: radar icon $2E6, palette 6 (gold accent)
!MARKER_CHEST                   3AE6
; Dark space: font tile $0D, palette 7 (cyan accent)
!MARKER_DARKSPACE               3C0D
; Exit/warp: generated tile $104, palette 2 (green accent)
!MARKER_EXIT                    2904

; --- Layout constants ---
!INTERIOR_COLS                  001C
!INTERIOR_ROWS                  0018
!SCROLL_STEP                    0002
!BORDER_START_OFF               0040

---------------------------------------------
; =============================================================================
; DungeonMapScreenSetup — JSL entry, RTL return
; =============================================================================

DungeonMapScreenSetup {
    ; --- Save CGRAM shadow palettes 1-7 (56 bytes at $7F0A08) ---
    PHB
    REP #$20
    LDX #$0A08
    LDY #$5100
    LDA #$0037
    MVN #$7F, #$7F
    PLB

    ; --- Save engine DP state ($B2-$CD, 28 bytes) ---
    PHB
    REP #$20
    LDX #$00B2
    LDY #$5140
    LDA #$001B
    MVN #$7F, #$00
    PLB

    ; --- Snapshot actor list head for stamp iteration ---
    ; Actor list is NOT zeroed — sprites continue rendering.
    REP #$20
    LDA $actorListHead
    STA $savedActorHead

    ; --- Write palettes to CGRAM shadow (applied by next NMI) ---

    ; Pal 1 = player: transparent, wall, white (blink target), floor
    REP #$20
    LDA #$0000
    STA $7F0A08
    LDA #$14C7
    STA $7F0A0A
    LDA #$7FFF
    STA $7F0A0C
    LDA #$3E75
    STA $7F0A0E

    ; Pal 2 = exit/warp: transparent, floor, wall, green
    LDA #$0000
    STA $7F0A10
    LDA #$3E75
    STA $7F0A12
    LDA #$14C7
    STA $7F0A14
    LDA #$1EC8
    STA $7F0A16

    ; Pal 4 = terrain: transparent, floor, wall, texture (mid-brown)
    LDA #$0000
    STA $7F0A20
    LDA #$3E75
    STA $7F0A22
    LDA #$14C7
    STA $7F0A24
    LDA #$258D
    STA $7F0A26

    ; Pal 5 = enemy: transparent, accent, red, floor
    LDA #$0000
    STA $7F0A28
    LDA #$042B
    STA $7F0A2A
    LDA #$1CFC
    STA $7F0A2C
    LDA #$3E75
    STA $7F0A2E

    ; Pal 6 = chest: transparent, floor, wall, gold
    LDA #$0000
    STA $7F0A30
    LDA #$3E75
    STA $7F0A32
    LDA #$14C7
    STA $7F0A34
    LDA #$12DB
    STA $7F0A36

    ; Pal 7 = dark space + shimmer: transparent, shimmer, cyan, floor
    LDA #$0000
    STA $7F0A38
    LDA #$14C7
    STA $7F0A3A
    LDA #$6B08
    STA $7F0A3C
    LDA #$3E75
    STA $7F0A3E

    ; --- Wait for any pending adhoc DMA ---
  dms_wait1:
    REP #$20
    LDA $7F0C07
    BEQ dms_dma_clear
    SEP #$20
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly
    BRA dms_wait1

  dms_dma_clear:
    ; --- Prevent unwanted ExecuteVramDma during hold loop ---
    REP #$20
    STZ $B2

    ; --- Set BG3 scroll to 0 (fixed map position) ---
    SEP #$20
    STZ $BG3HOFS
    STZ $BG3HOFS
    STZ $BG3VOFS
    STZ $BG3VOFS

    ; --- Clear staging buffer to hide HUD ---
    JSL $@vram_buffer_clear.ClearVramBufferFull

    ; --- Queue terrain tile adhoc DMA (fires this NMI with the flush) ---
    REP #$20
    LDA #$&minimap_tiles
    STA $adhocVramDma
    LDA #$*minimap_tiles
    STA $7F0C05
    LDA #$TILE_CHR_SIZE
    STA $7F0C09
    LDA #$VRAM_TILE_DEST
    STA $7F0C07

    ; --- Flush zeroed buffer + palettes + terrain DMA in one NMI ---
    ; HUD disappears, palettes take effect, terrain tiles upload.
    ; No screen blank — tile CHR at $6800+ invisible until tilemap references them.
    SEP #$20
    LDA #$01
    TSB $displayModeFlags
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly

    ; --- Queue radar icons adhoc DMA ---
    REP #$20
    LDA #$&radar_icons_001C00
    STA $adhocVramDma
    LDA #$*radar_icons_001C00
    STA $7F0C05
    LDA #$RADAR_ICONS_SIZE
    STA $7F0C09
    LDA #$RADAR_ICONS_VRAM
    STA $7F0C07

    ; --- Wait for radar icons DMA ---
  dms_wait_radar:
    REP #$20
    LDA $7F0C07
    BEQ dms_radar_done
    SEP #$20
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly
    BRA dms_wait_radar

  dms_radar_done:
    ; --- Compute room dimensions ---
    SEP #$20
    LDA $mapRowStrideL0
    REP #$20
    AND #$00FF
    ASL
    ASL
    ASL
    ASL
    STA $B8               ; room_width (metatiles)

    SEP #$20
    LDA $mapPageRows
    REP #$20
    AND #$00FF
    ASL
    ASL
    ASL
    ASL
    STA $BA               ; room_height (metatiles)

    ; --- Visible cols/rows = min(room_dim, interior_size) ---
    LDA $B8
    CMP #$INTERIOR_COLS
    BCC dms_vc_ok
    LDA #$INTERIOR_COLS
  dms_vc_ok:
    STA $C4               ; visible_cols

    LDA $BA
    CMP #$INTERIOR_ROWS
    BCC dms_vr_ok
    LDA #$INTERIOR_ROWS
  dms_vr_ok:
    STA $C6               ; visible_rows

    ; --- Centering offsets (tile padding in buffer for small rooms) ---
    LDA #$INTERIOR_COLS
    SEC
    SBC $C4
    LSR
    STA $C0               ; center_offset_x

    LDA #$INTERIOR_ROWS
    SEC
    SBC $C6
    LSR
    STA $C2               ; center_offset_y

    ; --- Max viewport position (metatiles) ---
    LDA $B8
    SEC
    SBC $C4
    BPL dms_mvx_ok
    LDA #$0000
  dms_mvx_ok:
    STA $BC               ; max_viewport_col

    LDA $BA
    SEC
    SBC $C6
    BPL dms_mvy_ok
    LDA #$0000
  dms_mvy_ok:
    STA $BE               ; max_viewport_row

    ; --- Initial viewport centered on player ---
    LDA $BC
    BEQ dms_vpx_zero
    LDA $C4
    LSR
    STA $08
    LDA $playerXTile
    SEC
    SBC $08
    BPL dms_vpx_lo
    LDA #$0000
  dms_vpx_lo:
    AND #$FFFE
    CMP $BC
    BCC dms_vpx_ok
    LDA $BC
    AND #$FFFE
  dms_vpx_ok:
    STA $B4
    BRA dms_vpy
  dms_vpx_zero:
    STZ $B4

  dms_vpy:
    LDA $BE
    BEQ dms_vpy_zero
    LDA $C6
    LSR
    STA $08
    LDA $playerYTile
    SEC
    SBC $08
    BPL dms_vpy_lo
    LDA #$0000
  dms_vpy_lo:
    AND #$FFFE
    CMP $BE
    BCC dms_vpy_ok
    LDA $BE
    AND #$FFFE
  dms_vpy_ok:
    STA $B6
    BRA dms_build
  dms_vpy_zero:
    STZ $B6

  dms_build:
    ; --- Compute OOB fill word ---
    LDA #$TILE_OOB
    ORA #$PAL4
    STA $CC

    ; --- Save engine low DP ($00-$94, 149 bytes) for build phase ---
    PHB
    REP #$20
    LDX #$0000
    LDY #$5200
    LDA #$0094
    MVN #$7F, #$00
    PLB

    ; --- Clear WRAM tilemap buffer to OOB ---
    REP #$20
    LDA $CC
    LDX #$0000
  dms_clear_buf:
    STA $tilemapBuffer, X
    INX
    INX
    CPX #$2000
    BNE dms_clear_buf

    ; --- Build tilemap + stamp markers ---
    JSR $&BuildCollisionTilemap
    JSR $&StampWarpMarkers
    JSR $&StampChestMarkers
    JSR $&StampDarkSpaceMarkers
    JSR $&StampEnemyMarkers
    JSR $&StampPlayerMarker

    ; --- Restore engine low DP ($00-$94) ---
    PHB
    REP #$20
    LDX #$5200
    LDY #$0000
    LDA #$0094
    MVN #$00, #$7F
    PLB

    ; --- Draw border and extract first viewport ---
    JSR $&DrawBorder
    JSR $&ExtractWindow

    ; --- Flush map content to screen (map appears!) ---
    SEP #$20
    LDA #$01
    TSB $displayModeFlags
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly

    LDX #$0000
    RTL
}

---------------------------------------------
; =============================================================================
; DungeonMapScrollUpdate — JSL entry, RTL return
; =============================================================================

DungeonMapScrollUpdate {
    REP #$20
    JSR $&ExtractWindow

    SEP #$20
    LDA #$01
    TSB $displayModeFlags

    RTL
}

---------------------------------------------
; =============================================================================
; DungeonMapTeardown — JSL entry, RTL return
; =============================================================================

DungeonMapTeardown {
    ; --- Restore CGRAM shadow palettes 1-7 (56 bytes) ---
    PHB
    REP #$20
    LDX #$5100
    LDY #$0A08
    LDA #$0037
    MVN #$7F, #$7F

    ; --- Restore engine DP state ($B2-$CD, 28 bytes) ---
    LDX #$5140
    LDY #$00B2
    LDA #$001B
    MVN #$00, #$7F
    PLB

    ; --- Clear BG3 scroll (engine recomputes on next frame) ---
    SEP #$20
    STZ $BG3HOFS
    STZ $BG3HOFS
    STZ $BG3VOFS
    STZ $BG3VOFS

    ; --- Clear staging buffer rows 1-4 ($0040-$013F, crown + map rows) ---
    ; ClearVramBufferPartial only clears from $0140, leaving these rows.
    REP #$20
    LDA #$0000
    LDX #$0040
  dmt_clr4:
    STA $stagingBuffer, X
    INX
    INX
    CPX #$0140
    BNE dmt_clr4

    ; --- Restore HUD tilemap to staging buffer rows 0-4 ---
    ; LoadHudTilemap writes the status bar frame/background tiles.
    ; ClearVramBufferPartial (called by common teardown) preserves rows 0-4.
    SEP #$20
    JSL $@scene_lifecycle.LoadHudTilemap

    ; --- Clear HP cache to force UpdateHUD stat redraw ---
    ; UpdateHUD dirty-checks these; zeroing forces it to see a "change"
    ; and redraw HP/gems on the next frame.
    REP #$20
    LDA #$0000
    STA $09CC
    STA $09CE
    STA $cachedPrevHp
    STA $cachedPrevMaxHp

    ; --- Queue adhoc DMA: restore font tiles at VRAM $6800 ---
    ; Source: gfx_fonts + 2 (header) + $1000 (byte offset to VRAM $6800).
    ; Write size BEFORE trigger to prevent NMI race.
    LDA #$&gfx_fonts+1002
    STA $adhocVramDma
    LDA #$*gfx_fonts
    STA $7F0C05
    LDA #$TILE_CHR_SIZE
    STA $7F0C09
    LDA #$VRAM_TILE_DEST
    STA $7F0C07

    RTL
}

---------------------------------------------
; =============================================================================
; DrawBorder — radar-style border to staging buffer
; =============================================================================
; Uses radar icon tiles ($2E0-$2FF at VRAM $7700) with BG3 palette 3
; (scene-colored via BG1 pal 0 colors 12-15).
; Crown at row 1, side edges rows 2-25, bottom band at row 26.
; Columns 0 and 31 = transparent (game world visible).

DrawBorder {
    REP #$20

    ; --- Fill rows 1-26 with OOB fill tile ---
    LDA $CC
    LDX #$BORDER_START_OFF
  db_fill:
    STA $stagingBuffer, X
    INX
    INX
    CPX #$06C0
    BNE db_fill

    ; --- Draw top band at row 1 (columns 1-30) ---
    STZ $0E
    LDA #$0042
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

    ; --- Draw side edges (rows 2-25) ---
    LDX #$0082
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

    ; --- Clear exterior: columns 0 and 31 to transparent (rows 1-26) ---
    LDX #$0040
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
; ExtractWindow — copy visible tilemap from WRAM buffer → staging buffer
; =============================================================================
; Reads 28×24 tiles from tilemapBuffer at (viewport_col, viewport_row).
; Writes to staging buffer interior (cols 2-29, rows 2-25).

ExtractWindow {
    PHB
    REP #$20

    ; --- Compute source start (absolute address in bank $7F) ---
    ; X = $6000 + viewport_row × 128 + viewport_col × 2
    LDA $B6               ; viewport_row
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL                    ; × 128
    STA $00
    LDA $B4               ; viewport_col
    ASL                    ; × 2
    CLC
    ADC $00
    CLC
    ADC #$6000             ; tilemapBuffer base in bank $7F
    TAX

    ; --- Destination start (absolute address in bank $7F) ---
    ; Y = $0200 + row 2 × 64 + col 2 × 2 = $0200 + $0080 + $0004 = $0284
    LDY #$0284

    ; --- Row counter ---
    LDA #$INTERIOR_ROWS
    STA $04

  ew_row:
    ; Copy 28 words (56 bytes) per row
    LDA #$0037             ; 56 bytes - 1
    MVN #$7F, #$7F

    ; Advance source: +128 stride - 56 copied = +72
    TXA
    CLC
    ADC #$0048
    TAX

    ; Advance dest: +64 stride - 56 copied = +8
    TYA
    CLC
    ADC #$0008
    TAY

    DEC $04
    BNE ew_row

    PLB
    RTS
}

---------------------------------------------
; =============================================================================
; BuildCollisionTilemap — read collision layer, write terrain tiles to buffer
; =============================================================================
; Builds the ENTIRE room from origin (0,0) into the WRAM buffer.
; Buffer offset = (row + center_y) × 128 + (col + center_x) × 2.
; Terrain tiles use palette 4. Color 3 reserved for markers.

BuildCollisionTilemap {
    REP #$20

    ; --- Start from room origin (0,0) ---
    LDA #$0000
    STA $14               ; coll_col_init (unused, kept for clarity)
    STA $10               ; current_room_X = 0
    STA $0C               ; coll_row_base = 0

    ; --- Pre-compute buffer row base from center_offset_y ---
    LDA $C2
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL                    ; × 128
    STA $08                ; buf_row_base

    LDA #$0000
    STA $04                ; meta_row counter

  bct_row_loop:
    LDA #$0000
    STA $06                ; meta_col counter
    STA $0E                ; coll_col_cur = 0 (reset per row)
    STA $10                ; current_room_X = 0 (reset per row)

  bct_col_loop:
    ; --- Compute buffer offset ---
    LDA $06
    CLC
    ADC $C0
    ASL
    CLC
    ADC $08
    STA $0A

    ; --- Read collision byte ---
    LDA $0C
    CLC
    ADC $0E
    TAX
    CPX #$4000
    BCC bct_in_bounds
    JMP $&bct_oob
  bct_in_bounds:

    SEP #$20
    LDA $collisionLayer, X

    BIT #$F0
    BNE bct_write_wall

    AND #$0F

    REP #$20
    AND #$00FF
    BEQ bct_write_floor
    CMP #$000F
    BEQ bct_write_oob
    CMP #$000E
    BCS bct_write_wall
    CMP #$0009
    BEQ bct_write_wall
    CMP #$0006
    BEQ bct_write_wall
    CMP #$0007
    BEQ bct_write_stairs
    CMP #$0008
    BEQ bct_write_stairs
    CMP #$0003
    BEQ bct_write_stairs
    CMP #$0005
    BEQ bct_write_stairs
    CMP #$000A
    BEQ bct_write_stairs
    CMP #$000C
    BEQ bct_write_stairs

  bct_write_floor:
    LDA #$TILE_FLOOR
    ORA #$PAL4
    BRA bct_write

  bct_write_stairs:
    LDA #$TILE_STAIRS
    ORA #$PAL4
    BRA bct_write

  bct_write_wall:
    REP #$20
    LDA #$TILE_WALL
    ORA #$PAL4
    BRA bct_write

  bct_write_oob:
    LDA #$TILE_OOB
    ORA #$PAL4
    BRA bct_write

  bct_oob:
    REP #$20
    LDA #$TILE_OOB
    ORA #$PAL4

  bct_write:
    LDX $0A
    STA $tilemapBuffer, X

    ; --- Advance to next column ---
    REP #$20
    INC $06
    INC $0E
    INC $10
    LDA $10
    AND #$000F
    BNE bct_no_cross
    LDA $0E
    CLC
    ADC #$00F0
    STA $0E
  bct_no_cross:

    LDA $06
    CMP $B8                ; room_width
    BCS bct_col_done
    JMP $&bct_col_loop
  bct_col_done:

    ; --- Advance to next row ---
    SEP #$20
    LDA $0C
    CLC
    ADC #$10
    STA $0C
    BCC bct_row_no_ycross
    LDA $0C+1
    CLC
    ADC $mapRowStrideL0
    STA $0C+1
  bct_row_no_ycross:
    REP #$20

    LDA $08
    CLC
    ADC #$0080
    STA $08

    INC $04
    LDA $04
    CMP $BA                ; room_height
    BCS bct_row_done
    JMP $&bct_row_loop
  bct_row_done:

    RTS
}

---------------------------------------------
; =============================================================================
; StampWarpMarkers — mark scene warp rectangles in tilemap buffer
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
    STA $14

  swm_std_loop:
    LDY $14
    SEP #$20
    LDA [$80], Y
    CMP #$FF
    BEQ swm_std_done
    STA $00
    INY
    LDA [$80], Y
    STA $02
    INY
    LDA [$80], Y
    STA $04
    INY
    LDA [$80], Y
    STA $06
    REP #$20
    LDA $14
    CLC
    ADC #$000C
    STA $14
    JSR $&StampWarpRect
    BRA swm_std_loop

  swm_std_done:
    REP #$20
    INC $14

  swm_ext_loop:
    LDY $14
    SEP #$20
    LDA [$80], Y
    CMP #$FF
    BEQ swm_done
    STA $00
    INY
    LDA [$80], Y
    STA $02
    INY
    LDA [$80], Y
    STA $04
    INY
    LDA [$80], Y
    STA $06
    REP #$20
    LDA $14
    CLC
    ADC #$000D
    STA $14
    JSR $&StampWarpRect
    BRA swm_ext_loop

  swm_done:
    REP #$20
    RTS
}

---------------------------------------------

StampWarpRect {
    REP #$20
    LDA #$0000
    STA $0C

  swr_row:
    LDA #$0000
    STA $0A

  swr_col:
    LDA $00
    AND #$00FF
    CLC
    ADC $0A
    CMP $B8
    BCS swr_next_col
    STA $0E

    LDA $02
    AND #$00FF
    CLC
    ADC $0C
    CMP $BA
    BCS swr_next_col

    CLC
    ADC $C2
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    STA $08
    LDA $0E
    CLC
    ADC $C0
    ASL
    CLC
    ADC $08
    TAX

    LDA #$MARKER_EXIT
    STA $tilemapBuffer, X

  swr_next_col:
    REP #$20
    INC $0A
    LDA $04
    AND #$00FF
    CMP $0A
    BNE swr_col

    INC $0C
    LDA $06
    AND #$00FF
    CMP $0C
    BNE swr_row

    RTS
}

---------------------------------------------
; =============================================================================
; StampChestMarkers — mark unvisited chests in tilemap buffer
; =============================================================================

StampChestMarkers {
    REP #$20
    LDX $sceneBarrierIdx
    LDA $@scene_barrier_chest_table, X
    SEC
    SBC #$&scene_barrier_chest_table
    STA $18

  scm_loop:
    SEP #$20
    LDX $18
    LDA $@scene_barrier_chest_table, X
    BMI scm_done

    LDA $@scene_barrier_chest_table+3, X
    REP #$20
    AND #$007F
    JSL $@flag_helpers.TestEventFlag_0200
    BCS scm_next

    SEP #$20
    LDX $18
    LDA $@scene_barrier_chest_table, X
    STA $00
    LDA $@scene_barrier_chest_table+1, X
    STA $02

    REP #$20
    LDA $00
    AND #$00FF
    CMP $B8
    BCS scm_next
    STA $00

    LDA $02
    AND #$00FF
    CMP $BA
    BCS scm_next

    CLC
    ADC $C2
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    STA $08
    LDA $00
    CLC
    ADC $C0
    ASL
    CLC
    ADC $08
    TAX

    LDA #$MARKER_CHEST
    STA $tilemapBuffer, X

  scm_next:
    REP #$20
    LDA $18
    CLC
    ADC #$0004
    STA $18
    BRA scm_loop

  scm_done:
    REP #$20
    RTS
}

---------------------------------------------
; =============================================================================
; StampDarkSpaceMarkers — mark dark space actors in tilemap buffer
; =============================================================================

StampDarkSpaceMarkers {
    REP #$20
    LDA $savedActorHead
    BEQ sdm_done
    STA $1A

  sdm_loop:
    LDA $1A
    CMP $playerActor
    BEQ sdm_next

    LDX $1A
    LDA $extendedFlags, X
    BIT #$0200
    BEQ sdm_next

    LDA $0014, X
    LSR
    LSR
    LSR
    LSR
    CMP $B8
    BCS sdm_next
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
    CMP $BA
    BCS sdm_next

    CLC
    ADC $C2
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    STA $08
    LDA $00
    CLC
    ADC $C0
    ASL
    CLC
    ADC $08
    TAX

    LDA #$MARKER_DARKSPACE
    STA $tilemapBuffer, X

  sdm_next:
    LDX $1A
    LDA $0006, X
    BEQ sdm_done
    STA $1A
    JMP $&sdm_loop

  sdm_done:
    RTS
}

---------------------------------------------
; =============================================================================
; StampEnemyMarkers — mark enemy actors in tilemap buffer
; =============================================================================

StampEnemyMarkers {
    REP #$20
    LDA $savedActorHead
    BEQ sem_done
    STA $1A

  sem_loop:
    LDA $1A
    CMP $playerActor
    BEQ sem_next

    LDX $1A
    LDA $extendedFlags, X
    BIT #$0100
    BEQ sem_next

    LDA $0014, X
    LSR
    LSR
    LSR
    LSR
    CMP $B8
    BCS sem_next
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
    CMP $BA
    BCS sem_next

    CLC
    ADC $C2
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    STA $08
    LDA $00
    CLC
    ADC $C0
    ASL
    CLC
    ADC $08
    TAX

    LDA #$MARKER_ENEMY
    STA $tilemapBuffer, X

  sem_next:
    LDX $1A
    LDA $0006, X
    BEQ sem_done
    STA $1A
    JMP $&sem_loop

  sem_done:
    RTS
}

---------------------------------------------
; =============================================================================
; StampPlayerMarker — mark player position in tilemap buffer
; =============================================================================

StampPlayerMarker {
    REP #$20

    LDA $playerXTile
    CMP $B8
    BCS spm_done
    STA $00

    LDA $playerYTile
    CMP $BA
    BCS spm_done

    CLC
    ADC $C2
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    STA $08
    LDA $00
    CLC
    ADC $C0
    ASL
    CLC
    ADC $08
    TAX

    LDA #$MARKER_PLAYER
    STA $tilemapBuffer, X

  spm_done:
    RTS
}
