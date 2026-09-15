; =============================================================================
; Widescreen Patch for Illusion of Gaia
; =============================================================================
;
; Enables bsnes-hd widescreen support (384x224, 16:9 at 1:1 pixel ratio).
; Requires bsnes-hd emulator with matching .bso configuration file.
;
; Strategy: always-on widescreen (BSO b1B1) with ROM-side tilemap management.
; The game detects camera window width and handles two cases:
;   - Multi-screen rooms: camera offset ensures 64px of valid map data on
;     both margins. No blank tiles needed during gameplay.
;   - Single-screen rooms: camera stays at cameraOffsetX. CameraFullRefresh
;     blanks nametable columns outside the map with $0000 tiles.
;
; This follows the wide-snes approach (VitorVilela7/wide-snes) adapted for
; IOG's camera window system.
;
; =============================================================================

?INCLUDE 'camera_scroll_controller'
?INCLUDE 'camera_tilemap'
?INCLUDE 'sprite_composition'

; --- Widescreen Constants ---
; 64 extra pixels per side = 384px total (256 + 128)
; 384x224 = exact 16:9 at 1:1 pixel aspect ratio

!WS_EXTRA                       0040
!WS_RIGHT_EDGE                  0140
!WS_MULTI_WIDTH                 0180
!WS_CULL_WIDTH                  0180
!WS_OAM_BIAS                    0040
!WS_OAM_CULL                    01D0
!WS_OAM_UNBIAS                  0050
!WS_PREFETCH_RIGHT              0140
!WS_PREFETCH_LEFT               FFC0
!WS_RIGHT_MARGIN_THRESH         00C1

; =============================================================================
; CAMERA BOUNDS OVERRIDE — camera_scroll_controller
; =============================================================================
; Detects whether the current camera window is multi-screen or single-screen.
;
; Multi-screen (cameraBoundsX - cameraOffsetX >= 384):
;   Camera minimum = cameraOffsetX + 64, maximum = cameraBoundsX - 320.
;   This guarantees both widescreen margins always have valid map data.
;
; Single-screen (cameraBoundsX - cameraOffsetX < 384):
;   Camera fixed at cameraOffsetX. The room is centered by bsnes-hd, and
;   CameraFullRefresh blanks the margin nametable columns.

code_00EAF0! {
    LDA #$1000
    TSB $12
    COP [SetEntryContinue]
    LDA $layerPriorityFlag
    BIT #$0200
    BEQ ws_cam_active
    RTL 

  ws_cam_active:
    PHD 
    LDA $playerActorDp
    TCD 
    LDA $14
    SEC 
    SBC #$0008
    STA $playerXPos
    LSR 
    LSR 
    LSR 
    LSR 
    STA $playerXTile
    LDA $16
    SEC 
    SBC #$0010
    STA $playerYPos
    LSR 
    LSR 
    LSR 
    LSR 
    STA $playerYTile
    LDA $playerFlags
    BIT #$0100
    BNE ws_cam_delta

    ; --- X axis: detect single-screen vs multi-screen ---
    LDA $cameraBoundsX
    SEC 
    SBC $cameraOffsetX
    CMP #$WS_MULTI_WIDTH      ; camera window >= 384px?
    BCS ws_cam_x_multi

    ; --- SINGLE-SCREEN: fix camera at cameraOffsetX ---
    LDA $cameraOffsetX
    BRA ws_cam_xset

  ws_cam_x_multi:
    ; --- MULTI-SCREEN: camera with widescreen offsets ---
    LDA $14
    SEC 
    SBC #$0080                ; proposed = playerX - 128
    BMI ws_cam_xmin           ; negative → clamp to minimum

    ; Check against effective minimum (cameraOffsetX + WS_EXTRA)
    STA $cameraTargetX        ; temp store proposed
    LDA $cameraOffsetX
    CLC 
    ADC #$WS_EXTRA            ; effective min = cameraOffsetX + 64
    CMP $cameraTargetX        ; effective min vs proposed
    BEQ ws_cam_xright
    BPL ws_cam_xmin           ; proposed < effective min → clamp
    
  ws_cam_xright:
    ; Proposed >= minimum. Check right edge.
    LDA $cameraTargetX        ; reload proposed
    CLC 
    ADC #$WS_RIGHT_EDGE       ; + 320 = widescreen right edge
    CMP $cameraBoundsX
    BMI ws_cam_xedge          ; within bounds
    LDA $cameraBoundsX
    BRA ws_cam_xedge

  ws_cam_xmin:
    LDA $cameraOffsetX
    CLC 
    ADC #$WS_EXTRA            ; min scroll = cameraOffsetX + 64
    BRA ws_cam_xset

  ws_cam_xedge:
    SEC 
    SBC #$WS_RIGHT_EDGE       ; - 320 = convert right edge back to scroll

  ws_cam_xset:
    STA $cameraTargetX

    ; --- Y axis camera targeting (unchanged) ---
    LDA $16
    SEC 
    SBC #$0080
    BMI ws_cam_ymin
    CMP $cameraOffsetY
    BMI ws_cam_ymin
    CLC 
    ADC #$0100
    CMP $cameraBoundsY
    BMI ws_cam_yedge
    LDA $cameraBoundsY
    BRA ws_cam_yedge

  ws_cam_ymin:
    LDA $cameraOffsetY
    BRA ws_cam_yset

  ws_cam_yedge:
    SEC 
    SBC #$0100

  ws_cam_yset:
    STA $cameraTargetY

  ws_cam_delta:
    LDA $cameraTargetX
    SEC 
    SBC $bg1ScrollH
    STA $effectDeltaX
    LDA $cameraTargetY
    SEC 
    SBC $bg2ScrollH
    STA $effectDeltaY
    PLD 
    RTL 
}

; =============================================================================
; FULL TILEMAP REFRESH — CameraFullRefresh
; =============================================================================
; On scene load, populates the entire 512px nametable. Starts 64px earlier
; than the scroll position to fill the widescreen left margin with valid data.
;
; For each column: checks if the position is within the map data range
; [0, mapBoundsX). If outside, calls BlankScrollColumn to write $0000 tiles.
; This handles both single-screen rooms (most columns blank) and multi-screen
; rooms at map edges.
;
; The loop advances $18 by 16 without wrapping. The VRAM column address
; computation naturally wraps via AND masking, so every nametable column
; gets exactly one write.

CameraFullRefresh! {
    PHP 
    REP #$20

    ; --- Clamp cameraTargetX within map bounds ---
    LDA $cameraTargetX, X
    CMP $mapBoundsX, X
    BCC ws_cfr_xok
    LDA $mapBoundsX, X
    DEC 
    STA $00
    LDA $cameraTargetX, X
    AND $00
    STA $cameraTargetX, X

  ws_cfr_xok:
    STA $bg1ScrollH, X
    AND #$FFF0
    STA $18

    ; --- Start 64px earlier to fill widescreen left margin ---
    LDA $bg1ScrollH, X
    SEC 
    SBC #$WS_EXTRA
    BCS ws_cfr_adj_ok
    LDA #$0000

  ws_cfr_adj_ok:
    AND #$FFF0
    STA $18

    ; --- Clamp cameraTargetY within map bounds ---
  ws_cfr_y:
    LDA $cameraTargetY, X
    BMI ws_cfr_yok
    CMP $mapBoundsY, X
    BCC ws_cfr_yok
    LDA $mapBoundsY, X
    DEC 
    STA $00
    LDA $cameraTargetY, X
    AND $00
    STA $cameraTargetY, X

  ws_cfr_yok:
    STA $bg2ScrollH, X
    AND #$FFF0
    STA $1C

    ; --- DMA setup ---
    SEP #$20
    LDA #$81
    STA $VMAIN
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA #$7E
    STA $A1B0
    REP #$20
    LDA #$0020               ; 32 column iterations

  ws_cfr_loop:
    PHA 

    ; --- Bounds check: is $18 within valid map data? ---
    LDA $18
    CMP $mapBoundsX, X        ; position >= map width?
    BCS ws_cfr_blank          ; yes → fill with blank tiles

    ; --- Render valid map column ---
    JSR $&RenderScrollRow
    BRA ws_cfr_dma

  ws_cfr_blank:
    ; --- Fill column with blank ($0000) tiles ---
    JSR $&BlankScrollColumn

  ws_cfr_dma:
    ; --- DMA staging buffer to VRAM ---
    PHX 
    LDA $06B2, X
    TAX 
    LDA $7E0000, X
    TAY 
    JSR $&DmaHorizontalStrip
    PLX 

    ; --- Advance $18 by 16 (no wrapping — blank columns advance linearly) ---
    LDA $18
    CLC 
    ADC #$0010
    STA $18

    PLA 
    DEC 
    BNE ws_cfr_loop

    ; --- Clear dirty staging flags ---
    LDA #$0000
    STA $tilemapStaging
    STA $7E3288
    STA $7E3184
    STA $7E330C
    JSL $@system_init.UploadCgramPalette
    PLP 
    RTL 
}

; =============================================================================
; BLANK SCROLL COLUMN — BlankScrollColumn
; =============================================================================
; Fills a nametable column's staging buffer with blank ($0000) tiles.
; Computes the VRAM column address from $18 (same math as RenderScrollRow)
; and zeros the tile data. Used for widescreen margin columns outside the map.
;
; Input: X = layer (0 or 2), $18 = column pixel X position
; Output: staging buffer at $06B2+X filled with VRAM address and blank tiles
; Preserves: X (layer index)

BlankScrollColumn {
    PHX                        ; save layer index

    ; --- Compute VRAM column address from $18 ---
    LDA $06B2, X               ; staging buffer base for this layer
    PHA                        ; save staging ptr on stack
    LDA $18
    LSR 
    LSR 
    LSR 
    AND #$003E                 ; column index × 2 (0-62)
    BIT #$0020                 ; bit 5: left or right nametable half?
    BNE ws_bsc_right

    ; --- Left nametable half ---
    CLC 
    ADC $06BA, X               ; + VRAM tilemap base
    PLX                        ; X = staging buffer pointer
    STA $0000, X               ; store VRAM addr for half A
    INC 
    STA $0042, X               ; store VRAM addr for half B (adjacent column)
    BRA ws_bsc_fill

  ws_bsc_right:
    ; --- Right nametable half ---
    AND #$001E
    CLC 
    ADC $06BA, X               ; + VRAM tilemap base
    CLC 
    ADC #$0400                 ; + $400 for right nametable half
    PLX                        ; X = staging buffer pointer
    STA $0000, X               ; store VRAM addr for half A
    INC 
    STA $0042, X               ; store VRAM addr for half B

  ws_bsc_fill:
    ; --- Zero 128 bytes of tile data (64 per half) ---
    ; Half A: staging+$02 to staging+$41 (32 words)
    ; Half B: staging+$44 to staging+$83 (32 words)
    LDA #$0000
    LDY #$0020                 ; 32 iterations
  ws_bsc_loop:
    STA $0002, X               ; half A tile word
    STA $0044, X               ; half B tile word
    INX 
    INX 
    DEY 
    BNE ws_bsc_loop

    PLX                        ; restore layer index
    RTS 
}

; =============================================================================
; TILEMAP PRE-FETCH — UpdateScrollColumn
; =============================================================================
; Overrides the per-frame column pre-fetch to use widescreen-edge offsets.
;
; Original offsets (+256 right, +0 left) pre-fetch at the 256px viewport edges.
; With 384px widescreen, columns in the 64px margins beyond those edges become
; stale after scrolling. The fix: pre-fetch at the WIDESCREEN edges instead
; (+320 right, -64 left). This ensures the entire 384px visible area has
; up-to-date tile data as the camera scrolls.
;
; Over a full right+left scroll sweep, all 32 nametable columns get refreshed.
; During one-directional scrolling, any un-refreshed columns remain in the
; off-screen nametable buffer (128px past the widescreen edge).
;
; Bounds check: if the pre-fetch position exceeds mapBoundsX (or wraps
; negative), the column is filled with blank tiles via BlankScrollColumn.

UpdateScrollColumn! {
    LDA #$WS_PREFETCH_LEFT     ; -64 ($FFC0) for leftward scroll
    LDY $scrollDeltaXClamped, X
    BMI ws_usc_offset
    LDA #$WS_PREFETCH_RIGHT    ; +320 ($0140) for rightward scroll

  ws_usc_offset:
    CLC 
    ADC $bg1ScrollH, X         ; column = scroll + offset
    STA $18
    LDA $bg2ScrollH, X
    STA $1C

    ; --- Bounds check: is column within valid map range? ---
    LDA $18
    BMI ws_usc_blank           ; negative (unsigned overflow from -64) → blank
    CMP $mapBoundsX, X         ; >= map width?
    BCS ws_usc_blank           ; yes → blank fill

    ; --- Normal rendering ---
    JSR $&RenderScrollRow
    RTS 

  ws_usc_blank:
    ; --- Blank fill for out-of-bounds column ---
    JSR $&BlankScrollColumn
    RTS 
}

; =============================================================================
; ROW PRE-FETCH — UpdateScrollRow
; =============================================================================
; Widescreen-aware row pre-fetch. RenderScrollColumn covers 2 map pages
; (512px). With 384px widescreen, the viewport can span 3 pages:
;
;   Left margin issue:  scroll_low in [$00, $3F] AND scroll >= $100
;     Page P-1 needed for left margin, but render covers P, P+1.
;
;   Right margin issue: scroll_low in [$C1, $FF]
;     Page P+2 needed for right margin, but render covers P, P+1.
;
;   No issue:           scroll_low in [$40, $C0] (or scroll < $100)
;     Both margins fit within 2 rendered pages.
;
; Fix: double render + merge. Render the row twice with different page
; selections, save the correct margin entries from one render, then
; patch them into the other render's staging buffer.
;
; Left margin: shifted render ($18=scroll-64) → save slot 0 entries 12-15
;              original render ($18=scroll)    → restore to slot 1 entries 12-15
;
; Right margin: shifted render ($18=scroll+64) → save slot 1 entries 0-3
;               original render ($18=scroll)   → restore to slot 0 entries 0-3

UpdateScrollRow! {
    LDA $bg1ScrollH, X
    STA $18

    ; --- Y axis setup (shared by all paths) ---
    LDA #$FFF0                 ; default = −16 (top edge for upward scroll)
    LDY $scrollDeltaYClamped, X
    BMI ws_usr_yoffset
    LDA #$00E0                 ; scrolling down: +224 for bottom screen edge

  ws_usr_yoffset:
    CLC 
    ADC $bg2ScrollH, X

  ws_usr_ywrap:
    STA $1C
    CMP $mapBoundsY, X
    BCC ws_usr_ready
    SEC 
    SBC $mapBoundsY, X
    BRA ws_usr_ywrap

  ws_usr_ready:
    ; --- Determine which case applies ---
    LDA $bg1ScrollH, X
    AND #$00FF
    CMP #$WS_EXTRA             ; low byte < 64?
    BCS ws_usr_not_left        ; >= 64 → check right margin

    ; Low byte [0, 63] → possible left margin issue
    LDA $bg1ScrollH, X
    CMP #$0100
    BCC ws_usr_simple          ; page 0 → no crossing possible
    BRL ws_usr_double_left     ; page 1+ → left margin fix (long branch)

  ws_usr_not_left:
    CMP #$WS_RIGHT_MARGIN_THRESH ; low byte >= 193?
    BCC ws_usr_simple          ; [64, 192] → simple path
    BRL ws_usr_double_right    ; [193, 255] → right margin fix (long branch)

  ws_usr_simple:
    ; === SIMPLE PATH (single render covers both margins) ===
    JSR $&RenderScrollColumn
    RTS

  ; =================================================================
  ; LEFT MARGIN DOUBLE RENDER
  ; =================================================================
  ; Shifted render ($18 = scroll-64): slot 0 has page P-1 (left margin).
  ; Original render ($18 = scroll):   slot 1 overwrites left margin with
  ;   wrong page P+1 data. Save entries 12-15 from shifted slot 0 and
  ;   patch into original slot 1.

  ws_usr_double_left:
    PHB 
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    REP #$20

    ; Render 1: shifted (covers left margin page P-1)
    LDA $bg1ScrollH, X
    SEC 
    SBC #$WS_EXTRA
    STA $18
    JSR $&RenderScrollColumn

    ; Save entries 12-15 from slot 0
    STX $00
    LDA $06B6, X
    TAX 
    LDA $0032, X
    PHA 
    LDA $0034, X
    PHA 
    LDA $0036, X
    PHA 
    LDA $0038, X
    PHA 
    LDA $003A, X
    PHA 
    LDA $003C, X
    PHA 
    LDA $003E, X
    PHA 
    LDA $0040, X
    PHA 
    LDA $0072, X
    PHA 
    LDA $0074, X
    PHA 
    LDA $0076, X
    PHA 
    LDA $0078, X
    PHA 
    LDA $007A, X
    PHA 
    LDA $007C, X
    PHA 
    LDA $007E, X
    PHA 
    LDA $0080, X
    PHA 
    LDX $00

    ; Render 2: original (covers right margin page P+1)
    LDA $bg1ScrollH, X
    STA $18
    JSR $&RenderScrollColumn

    ; Restore entries 12-15 into slot 1
    STX $00
    LDA $06B6, X
    CLC 
    ADC #$0082
    TAX 
    PLA 
    STA $0080, X
    PLA 
    STA $007E, X
    PLA 
    STA $007C, X
    PLA 
    STA $007A, X
    PLA 
    STA $0078, X
    PLA 
    STA $0076, X
    PLA 
    STA $0074, X
    PLA 
    STA $0072, X
    PLA 
    STA $0040, X
    PLA 
    STA $003E, X
    PLA 
    STA $003C, X
    PLA 
    STA $003A, X
    PLA 
    STA $0038, X
    PLA 
    STA $0036, X
    PLA 
    STA $0034, X
    PLA 
    STA $0032, X
    LDX $00

    PLB 
    RTS 

  ; =================================================================
  ; RIGHT MARGIN DOUBLE RENDER
  ; =================================================================
  ; Shifted render ($18 = scroll+64): slot 1 has page P+2 (right margin).
  ; Original render ($18 = scroll):   slot 0 overwrites right margin with
  ;   wrong page P data. Save entries 0-3 from shifted slot 1 and
  ;   patch into original slot 0.

  ws_usr_double_right:
    PHB 
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    REP #$20

    ; Render 1: shifted (covers right margin page P+2)
    LDA $bg1ScrollH, X
    CLC 
    ADC #$WS_EXTRA
    STA $18
    JSR $&RenderScrollColumn

    ; Save entries 0-3 from slot 1 (second pass = page P+2)
    STX $00
    LDA $06B6, X
    CLC 
    ADC #$0082
    TAX 
    LDA $0002, X
    PHA 
    LDA $0004, X
    PHA 
    LDA $0006, X
    PHA 
    LDA $0008, X
    PHA 
    LDA $000A, X
    PHA 
    LDA $000C, X
    PHA 
    LDA $000E, X
    PHA 
    LDA $0010, X
    PHA 
    LDA $0042, X
    PHA 
    LDA $0044, X
    PHA 
    LDA $0046, X
    PHA 
    LDA $0048, X
    PHA 
    LDA $004A, X
    PHA 
    LDA $004C, X
    PHA 
    LDA $004E, X
    PHA 
    LDA $0050, X
    PHA 
    LDX $00

    ; Render 2: original (covers left margin page P)
    LDA $bg1ScrollH, X
    STA $18
    JSR $&RenderScrollColumn

    ; Restore entries 0-3 into slot 0 (first pass)
    STX $00
    LDA $06B6, X
    TAX 
    PLA 
    STA $0050, X
    PLA 
    STA $004E, X
    PLA 
    STA $004C, X
    PLA 
    STA $004A, X
    PLA 
    STA $0048, X
    PLA 
    STA $0046, X
    PLA 
    STA $0044, X
    PLA 
    STA $0042, X
    PLA 
    STA $0010, X
    PLA 
    STA $000E, X
    PLA 
    STA $000C, X
    PLA 
    STA $000A, X
    PLA 
    STA $0008, X
    PLA 
    STA $0006, X
    PLA 
    STA $0004, X
    PLA 
    STA $0002, X
    LDX $00

    PLB 
    RTS 
}
; =============================================================================
; Extends the on-screen X range from [0, 256) to [-64, 320) by biasing the
; screen-relative coordinate by +64 and comparing against 384 (widescreen width).
;
; Original: screenX = actorX - originX - scroll; on-screen if [0, 256)
; Patched:  biasedX = screenX + 64; on-screen if biasedX in [0, 384)

loc_03C610! {
    LDA $14               ; actorX
    SEC 
    SBC $18               ; - originX
    SEC 
    SBC $bg1ScrollH       ; = screenX relative to scroll origin
    CLC 
    ADC #$WS_EXTRA        ; + 64 = bias to widescreen coordinate space
    CMP #$WS_CULL_WIDTH   ; 384 = widescreen width
    BCC loc_03C631        ; biasedX in [0, 384) → on screen
    BMI loc_03C623        ; biasedX < 0 → actor left of widescreen, check right edge
    JMP $&SortActors_OffScreen
}

loc_03C623! {
    LDA $14               ; actorX
    CLC 
    ADC $1C               ; + actor width
    SEC 
    SBC $bg1ScrollH       ; = right edge screenX
    CLC 
    ADC #$WS_EXTRA        ; + 64 = bias to widescreen coordinate space
    CMP #$WS_CULL_WIDTH   ; 384 = widescreen width
    BCS SortActors_OffScreen ; right edge also off widescreen → fully off screen
}

; =============================================================================
; SUB-SPRITE OAM CLIPPING — DecomposeActorMetasprites
; =============================================================================
; The per-sub-sprite X bounds check clips individual tiles at CMP #$0110 (272px).
; $18 = actorScreenX + 16 (origin margin). The original SBC #$000F with C=0
; subtracts 16 (removing the margin) before storing the OAM X value.
;
; For widescreen: bias +64 to handle negative screen X from the left margin,
; then compare against 464 (384 + 16 + 64). After the check, SEC + SBC #$50
; removes BOTH the +64 bias AND the +16 origin margin (net -80), matching the
; original's net -16 subtraction.

loc_03C8DE! {
    AND #$00FF
    CLC 
    ADC $18
    CLC 
    ADC #$WS_OAM_BIAS     ; +64 bias for signed widescreen range check
    CMP #$WS_OAM_CULL     ; 464 = 384 + 16 + 64
    BCS loc_03C920
    SEC 
    SBC #$WS_OAM_UNBIAS   ; SEC;SBC #$50 = subtract 80 (64 bias + 16 origin margin)
    SEP #$20
    STA $0422, Y
    XBA 
    LSR 
    ROR $00
    LDA $0000, X
    LSR 
    ROR $00
    DEC $0E
    BNE loc_03C909
    LDA $00
    STA ($06)
    INC $06
    LDA #$04
    STA $0E
}

; =============================================================================
; SUB-SPRITE OAM CLIPPING — DecomposePlayerSprites
; =============================================================================
; Same fix as actor metasprites: +64 bias, CMP 464, then SEC;SBC #$50 removes
; the bias AND origin margin to produce the correct OAM X value.

loc_03C9BB! {
    AND #$00FF
    CLC 
    ADC $18
    CLC 
    ADC #$WS_OAM_BIAS
    CMP #$WS_OAM_CULL
    BCS PlayerSprite_OffScreen
    SEC 
    SBC #$WS_OAM_UNBIAS
    SEP #$20
    STA $0422, Y
    XBA 
    LSR 
    ROR $00
    LDA $0000, X
    LSR 
    ROR $00
    DEC $0E
    BNE loc_03C9E6
    LDA $00
    STA ($06)
    INC $06
    LDA #$04
    STA $0E
}

; =============================================================================
; SUB-SPRITE OAM CLIPPING — RenderComposeBuffer
; =============================================================================
; Compose buffer sprites compute screen X as bufferX − bg1ScrollH (no origin
; margin). Bias +64 to handle negative widescreen X, compare against 464
; (384 + 16 tolerance + 64 bias). After the check, SEC + SBC #$40 removes
; ONLY the bias (no origin margin to remove for compose buffer sprites).

loc_03C79E! {
    LDA $7F3102, X
    SEC 
    SBC $bg2ScrollH
    CMP #$00F0
    BCS loc_03C7E8
    STA $0423, Y
    LDA $7F3104, X
    STA $0424, Y
    LDA $oamComposeBuffer, X
    SEC 
    SBC $bg1ScrollH
    CLC 
    ADC #$WS_OAM_BIAS     ; +64 bias for widescreen left margin
    CMP #$WS_OAM_CULL     ; 464 = 384 + 16 tolerance + 64 bias
    BCS loc_03C7E8
    SEC 
    SBC #$WS_OAM_BIAS     ; SEC;SBC #$40 = subtract 64 (bias only, no margin)
    SEP #$20
    STA $0422, Y
    XBA 
    LSR 
    ROR $00
    CLC 
    ROR $00
    DEC $0E
    BNE loc_03C7DC
    LDA $00
    STA ($06)
    INC $06
    LDA #$04
    STA $0E
}
