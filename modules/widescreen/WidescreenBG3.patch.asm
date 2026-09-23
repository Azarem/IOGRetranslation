; =============================================================================
; BG3 Widescreen — Illusion of Gaia
; =============================================================================
;
; Extends BG3 (HUD/dialog layer) to 384px for bsnes-hd widescreen.
;
; Architecture:
;   BG3SC=$79 → 64×32 tilemap (512px, VRAM $7800+$7C00)
;   BG3HOFS=64 → centers original 256px content; c1 BSO extends ±64px
;   Two staging buffers, each 2048 bytes with $40 (32-col) row stride:
;     Left:  $7F0200 → DMA → VRAM $7800 (tilemap columns 0–31)
;     Right: $7F3200 → DMA → VRAM $7C00 (tilemap columns 32–63)
;
; Dialog rendering writes sequentially via STA $7F0200,X. The left buffer
; covers X in [$0000,$07FF] and the right buffer covers X in [$3000,$37FF]
; (since $7F0200+$3000 = $7F3200). When a row write crosses column 31,
; the code adds $2FC0 to X to jump from the left buffer's next-row start
; into the right buffer's same-row start.
;
; With HOFS=64, the visible 384px maps to tilemap columns 0–47:
;   Columns 0–31:  left buffer  (HUD + dialog center)
;   Columns 32–47: right buffer (dialog border extension)
;
; Text content crosses from the left buffer into the right buffer when a
; line exceeds 31 characters. Border, fill, clear, and scroll operations
; all use a boundary check after each INX;INX to redirect X into the
; right buffer when it wraps past column 31.
;
; Requires: BSO config c0 → c1 (BG3 widescreen always on)
; =============================================================================

?INCLUDE 'camera_tilemap'
?INCLUDE 'DialogStringRenderer'
?INCLUDE 'vram_buffer_clear'
?INCLUDE 'scene_lifecycle'

; PPU registers not in camera_tilemap includes
!BG3SC                          2109
!BG3HOFS                        2111

; Offset from left staging base ($7F0200) to right staging base ($7F3200)
!WS_BG3_RIGHT_OFS               3000

; When X wraps past column 31 to the next left-buffer row ($+40),
; add this to jump into the same row of the right buffer instead.
; Delta = $3000 − $40 = $2FC0.
!WS_BG3_WRAP_DELTA              2FC0

; Full-width dialog: 23 columns (23×2 + 2 borders = 48 tiles = 384px)
!WS_BG3_DIALOG_COLS             0017

; =============================================================================
; SPRITE/BG3 VRAM DMA — SpriteVramDma override
; =============================================================================
; Every V-Blank:
;   - BG3SC=$79 (64×32 tilemap)
;   - BG3HOFS=64 (centers original content; c1 BSO extends ±64px)
;
; Bit 0 (full upload): DMA left buffer → $7800, DMA right buffer → $7C00.
; Bits 4–5 (partial): unchanged (writes to $7840 within left half only).

SpriteVramDma! {
    ; Maintain BG3SC=$79 (64×32 tilemap) and BG3HOFS=64 every V-Blank.
    ; HOFS=64 centers the original 32-col content (columns 8–39) in the
    ; 384px widescreen viewport. bsnes-hd c1 extends ±64px from HOFS,
    ; making columns 0–47 visible. ClearSceneState writes BG3SC=$78 and
    ; BG3HOFS=0 during scene init, so we reinforce both here.
    LDA #$79
    STA $BG3SC
    LDA #$40
    STA $BG3HOFS          ; Write-twice: low byte = $40
    LDA #$00
    STA $BG3HOFS          ; Write-twice: high byte = $00

    ; Suppress if $09ED bit 7 set
    LDA $09ED
    BPL ws_spr_active
    RTL 

  ws_spr_active:
    LDA $displayModeFlags
    BIT #$31
    BNE ws_spr_dispatch
    RTL 

  ws_spr_dispatch:
    BIT #$01
    BEQ ws_spr_partial

    ; =================================================================
    ; FULL TILEMAP UPLOAD (bit 0) — two DMA transfers
    ; =================================================================

    ; Shared DMA channel 0 setup
    LDA #$31
    TRB $displayModeFlags
    LDA #$80
    STA $VMAIN
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA #$7F
    STA $A1B0

    ; Left half: $7F0200 → VRAM $7800
    LDX #$0800
    STX $DAS0L
    LDX #$7800
    STX $VMADDL
    LDX #$0200
    STX $A1T0L
    LDA #$01
    STA $MDMAEN

    ; Right half: $7F3200 → VRAM $7C00
    LDX #$0800
    STX $DAS0L
    LDX #$7C00
    STX $VMADDL
    LDX #$3200
    STX $A1T0L
    LDA #$01
    STA $MDMAEN
    RTL 

    ; =================================================================
    ; PARTIAL UPDATE (bits 4–5) — unchanged
    ; =================================================================

  ws_spr_partial:
    LDA $displayModeFlags
    BIT #$20
    BNE ws_spr_ext
    LDX #$0140
    STX $DAS0L
    BRA ws_spr_partial_dma

  ws_spr_ext:
    AND #$DF
    STA $displayModeFlags
    LDX #$0140
    STX $DAS0L

  ws_spr_partial_dma:
    LDX #$7840
    STX $VMADDL
    LDX #$0280
    STX $A1T0L
    LDA #$31
    TRB $displayModeFlags
    LDA #$80
    STA $VMAIN
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA #$7F
    STA $A1B0
    LDA #$01
    STA $MDMAEN
    RTL 
}

; =============================================================================
; VRAM BUFFER CLEAR — clears both left and right staging buffers
; =============================================================================

ClearVramBufferFull! {
    PHX 
    PHP 
    REP #$20
    LDA #$0000
    TAX 
  ws_clr_full_loop:
    STA $7F0200, X
    STA $7F3200, X
    INX 
    INX 
    CPX #$0800
    BNE ws_clr_full_loop
    PLP 
    PLX 
    RTL 
}

ClearVramBufferPartial! {
    PHX 
    PHP 
    REP #$20
    LDA #$0000
    LDX #$0140
  ws_clr_part_loop:
    STA $7F0200, X
    STA $7F3200, X
    INX 
    INX 
    CPX #$0800
    BNE ws_clr_part_loop
    PLP 
    PLX 
    RTL 
}

; =============================================================================
; BORDER ROW — boundary-aware tile writing
; =============================================================================
; Writes left corner + $18 middle tiles + right corner, crossing from the
; left staging buffer into the right buffer when the row hits column 32.
;
; The boundary check: after each INX;INX, if (X AND $003F) == 0, the write
; just crossed into the next row of the LEFT buffer. Add $2FC0 to redirect
; to the same row in the RIGHT buffer. This fires at most once per row.

DrawDialogueBorderRow! {
    LDA [$3E]
    STA $7F0200, X
    INX 
    INX 
    JSR $&ws_check_boundary
    INC $3E
    INC $3E
    LDA [$3E]

  ws_border_mid:
    STA $7F0200, X
    INX 
    INX 
    JSR $&ws_check_boundary
    DEC $18
    BNE ws_border_mid

    INC $3E
    INC $3E
    LDA [$3E]
    STA $7F0200, X
    INC $3E
    INC $3E
    RTS 
}

; =============================================================================
; BODY ROWS — boundary-aware fill writing
; =============================================================================
; For each body row: advance $00 by $40 (next tile row in left buffer),
; draw left border + blank fill ($2040) + right border. The fill loop
; uses the same boundary check as the border row.
;
; After each row completes (X is in right buffer), the next iteration
; reloads X from $00 (which stays in the left buffer). The right-buffer
; X is naturally discarded.

DrawDialogueBodyRows! {
    PHY 
    LDY #$0002

  ws_body_row:
    LDA $00
    CLC 
    ADC #$0040
    STA $00
    TAX 
    LDA [$3E]
    STA $7F0200, X
    INX 
    INX 
    JSR $&ws_check_boundary
    LDA $18
    STA $EC
    LDA #$2040

  ws_body_fill:
    STA $7F0200, X
    INX 
    INX 
    PHA 
    JSR $&ws_check_boundary
    PLA 
    DEC $EC
    BNE ws_body_fill

    LDA [$3E], Y
    STA $7F0200, X
    DEC $1C
    BNE ws_body_row

    ; --- Optional prompt row (worldReadyFlag) ---
    LDA $00
    CLC 
    ADC #$0040
    STA $00
    TAX 
    LDA $00EE
    BNE ws_body_skip_prompt
    LDA $worldReadyFlag
    AND #$00FF
    BEQ ws_body_skip_prompt

    LDA [$3E]
    STA $7F0200, X
    INX 
    INX 
    JSR $&ws_check_boundary
    LDA #$2040

  ws_prompt_fill:
    STA $7F0200, X
    INX 
    INX 
    PHA 
    JSR $&ws_check_boundary
    PLA 
    DEC $18
    BNE ws_prompt_fill

    LDA [$3E], Y
    STA $7F0200, X

    ; Advance past prompt row for subsequent operations
    LDA $00
    CLC 
    ADC #$0040
    STA $00
    TAX 

  ws_body_skip_prompt:
    INC $3E
    INC $3E
    INC $3E
    INC $3E
    PLY 
    RTS 
}

; =============================================================================
; BOUNDARY CHECK — shared subroutine
; =============================================================================
; After INX;INX, check if X just wrapped past column 31 into the next row
; of the left buffer. If so, add $2FC0 to redirect into the right buffer
; at the same row. Preserves A.
;
; Detection: (X AND $003F) == 0 means X is at the start of a new left-buffer
; row. If X < $3000 (still in left range), this is a boundary crossing.
; If X >= $3000 (already in right range), it's a genuine next-row wrap in the
; right buffer — but this never occurs for our dialog widths (max 16 right tiles).

ws_check_boundary {
    PHA 
    TXA 
    AND #$003F
    BNE ws_cb_done
    CPX #$WS_BG3_RIGHT_OFS
    BCS ws_cb_done
    TXA 
    CLC 
    ADC #$WS_BG3_WRAP_DELTA
    TAX 
  ws_cb_done:
    PLA 
    RTS 
}

; =============================================================================
; CHARACTER RENDERING — DialogStringRenderer override
; =============================================================================
; The main character loop. After writing each character tile to $7F0200,X
; and $7F0240,X, the boundary check redirects X into the right buffer
; when it crosses column 31. A is immediately reloaded after the check
; (worldReadyFlag or next char), so no PHA/PLA needed.

DialogStringRenderer! {
    PHP 
    PHD 
    PHX 
    LDA #$0000
    TCD 
    LDX $0998

  ws_charloop:
    SEP #$20
    LDA $0000, Y
    CMP #$C0
    BCC ws_char_tile
    REP #$20
    INY 
    PEA $&ws_charloop-1
    AND #$001F
    ASL 
    PHX 
    TAX 
    LDA $@DialogStringCommandTable, X
    PLX 
    DEC 
    PHA 
    RTS 

  ws_char_tile:
    REP #$20
    AND #$00FF
    INY 
    STA $00
    ORA $0986
    ORA #$2100
    LDX $0998
    STA $7F0200, X
    CLC 
    ADC #$0010
    STA $7F0240, X
    INX 
    INX 
    TXA 
    AND #$003F
    BNE ws_char_no_wrap
    CPX #$WS_BG3_RIGHT_OFS
    BCS ws_char_no_wrap
    TXA 
    CLC 
    ADC #$WS_BG3_WRAP_DELTA
    TAX 
  ws_char_no_wrap:
    STX $0998
    LDA $worldReadyFlag
    BEQ ws_charloop
    LDA $00
    PHA 
    LDA #$0001
    TSB $displayModeFlags
    JSR $&WaitNFrames_PerChar
    PLA 
    CMP #$00AC
    BEQ ws_charloop
    LDA $sfxQueueCh1
    AND #$FF00
    ORA $0996
    STA $sfxQueueCh1
    BRA ws_charloop
}

; =============================================================================
; CLEAR BOX INTERIOR — DialogCmd_ClearBox override (command $CE)
; =============================================================================
; Fills interior with $2040 blank tiles across both buffers. Each text row
; reloads X from $02 (always left buffer), so the right-buffer X from the
; previous row is naturally discarded.

DialogCmd_ClearBox! {
    LDA $0998
    LDA $0982
    ASL 
    DEC 
    STA $00
    STA $18
    LDA $0984
    DEC 
    STA $1C
    LDA $099A
    STA $02
    TAX 

  ws_clrbox_outer:
    LDA #$2040

  ws_clrbox_inner:
    STA $7F0200, X
    STA $7F0240, X
    INX 
    INX 
    PHA 
    TXA 
    AND #$003F
    BNE ws_clrbox_no_wrap
    CPX #$WS_BG3_RIGHT_OFS
    BCS ws_clrbox_no_wrap
    TXA 
    CLC 
    ADC #$WS_BG3_WRAP_DELTA
    TAX 
  ws_clrbox_no_wrap:
    PLA 
    DEC $18
    BPL ws_clrbox_inner
    LDA $00
    STA $18
    LDA $02
    CLC 
    ADC #$0080
    STA $02
    TAX 
    DEC $1C
    BPL ws_clrbox_outer
    LDA $099A
    STA $0998
    TAX 
    STZ $099C
    LDA #$0001
    TSB $displayModeFlags
    JSR $&WaitOneFrame
    RTS 
}

; =============================================================================
; SCROLL DIALOGUE UP — ScrollDialogueUp override
; =============================================================================
; Copies each tile row upward. The boundary check ensures tiles in the
; right buffer are also scrolled. A is reloaded from $7F0240,X each
; iteration, so no PHA/PLA needed.

ScrollDialogueUp! {
    LDA $099A
    STA $00
    TAX 
    LDA $0984
    ASL 
    DEC 
    STA $1C

  ws_scroll_outer:
    LDA $0982
    ASL 
    DEC 
    STA $18

  ws_scroll_inner:
    LDA $7F0240, X
    STA $7F0200, X
    INX 
    INX 
    TXA 
    AND #$003F
    BNE ws_scroll_no_wrap
    CPX #$WS_BG3_RIGHT_OFS
    BCS ws_scroll_no_wrap
    TXA 
    CLC 
    ADC #$WS_BG3_WRAP_DELTA
    TAX 
  ws_scroll_no_wrap:
    DEC $18
    BPL ws_scroll_inner
    LDA $00
    CLC 
    ADC #$0040
    STA $00
    TAX 
    DEC $1C
    BPL ws_scroll_outer
    LDA #$0001
    TSB $displayModeFlags
    RTS 
}

; =============================================================================
; DRAW DIALOGUE CURSOR — DrawDialogueCursor override
; =============================================================================
; Computes the caret position and applies boundary check so it renders
; in the right buffer when the box is wider than 32 columns.

DrawDialogueCursor! {
    PHP 
    ; Compute column = width + col_origin
    LDA $0982
    CLC 
    ADC $097E
    STA $00               ; $00 = column (for right-buffer check later)

    ; Original position formula: X = ((height*2 + row_origin) * 32 + column) * 2
    LDA $0984
    ASL 
    CLC 
    ADC $0980
    ASL 
    ASL 
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $00               ; + column
    ASL 
    TAX 

    ; If column >= 32, the formula overflowed into the next left-buffer row.
    ; Correct by adding $2FC0 to redirect X into the right buffer same row.
    LDA $00
    CMP #$0020
    BCC ws_cursor_no_wrap
    TXA 
    CLC 
    ADC #$WS_BG3_WRAP_DELTA
    TAX 
  ws_cursor_no_wrap:
    PLP 
    BCC ws_cursor_erase
    LDA $36
    BIT #$000F
    BNE ws_cursor_tick
    INC $0994

  ws_cursor_tick:
    LDA $0994
    BIT #$0001
    BEQ ws_cursor_erase
    LDA #$2091
    PHA 
    BRA ws_cursor_write

  ws_cursor_erase:
    LDA #$2040
    PHA 

  ws_cursor_write:
    PLA 
    STA $7F0200, X
    RTS 
}

; =============================================================================
; CLEAR DIALOGUE BOX — loc_03E59F override (inner loop + post-loop reset)
; =============================================================================
; Overrides the retranslation's loc_03E59F! to add boundary awareness
; while preserving the border state / palette / SFX reset logic.

!border_state                   09F8

loc_03E59F! {
    STA $7F0200, X
    INX 
    INX 
    PHA 
    TXA 
    AND #$003F
    BNE ws_cld_no_wrap
    CPX #$WS_BG3_RIGHT_OFS
    BCS ws_cld_no_wrap
    TXA 
    CLC 
    ADC #$WS_BG3_WRAP_DELTA
    TAX 
  ws_cld_no_wrap:
    PLA 
    DEC $18
    BPL loc_03E59F
    LDA $00
    STA $18
    LDA $099A
    CLC 
    ADC #$0040
    STA $099A
    TAX 
    DEC $1C
    BPL loc_03E59C

    LDA #$0010
    STA $0996

    LDA $0B04
    STA $007E

    STZ $border_state
    STZ $0986

    LDA $@fx_palette_198040+2
    STA $7F0A02
    LDA $@fx_palette_198040+4
    STA $7F0A04
    LDA $@fx_palette_198040+6
    STA $7F0A06
    LDA $@fx_palette_198040+22
    STA $7F0A22
    LDA $@fx_palette_198040+24
    STA $7F0A24
    LDA $@fx_palette_198040+26
    STA $7F0A26

    LDA #$0001
    TSB $displayModeFlags
    LDX $0998
    STX $099A
    STZ $099C
    PLB 
    PLY 
    RTS 
}

; =============================================================================
; WIDER DIALOG BOX — DialogCmd_OpenDialogueBox override (command $C7)
; =============================================================================
; Widescreen behavior:
;   Width >= 11: force to 23 cols at column 1 (48 tiles = 384px border).
;   Width < 11: keep original (small popups unchanged).
;
; Jumps to OpenDialogueBox_Body (retranslation override) which handles
; border style lookup. All border logic is preserved — DrawDialogueBorderRow
; and DrawDialogueBodyRows handle the two-buffer boundary automatically.

DialogCmd_OpenDialogueBox! {
    LDA $0000, Y
    AND #$00FF
    STA $0982
    LDA $0001, Y
    AND #$00FF
    STA $0984
    INY 
    INY 

    ; Widescreen: widen standard dialog boxes
    ;LDA $0982
    ;CMP #$000B
    BRA ws_dlg_keep

    ; Full-width dialog: 23 cols at column 1
    LDA #$WS_BG3_DIALOG_COLS
    STA $0982
    LDA #$0001
    STA $097A
    LDA $097C
    XBA 
    LSR 
    LSR 
    CLC 
    ADC $097A
    CLC 
    ADC $097A
    TAX 
    STA $0998

  ws_dlg_keep:
    JMP $&OpenDialogueBox_Body
}

; =============================================================================
; WIDER DEFAULT DIALOG BOX — DialogCmd_OpenDefaultBox override (command $D3)
; =============================================================================

DialogCmd_OpenDefaultBox! {
    LDA #$WS_BG3_DIALOG_COLS
    STA $0982
    LDA #$0004
    STA $0984
    LDA #$0001
    STA $097A
    LDA #$0011
    STA $097C
    XBA 
    LSR 
    LSR 
    CLC 
    ADC $097A
    CLC 
    ADC $097A
    TAX 
    STA $0998
    JMP $&OpenDialogueBox_Body
}
