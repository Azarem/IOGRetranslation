; =============================================================================
; Minimap V2 — GlobalInputHandler patch
; =============================================================================
; Replaces the original GlobalInputHandler. Structure mirrors the original
; exactly: guard conditions, Start/Select/Y dispatch, hold-to-view loop,
; and teardown. The radar JSR is replaced with JSL MinimapScreenSetup.
;
; Hold loop features:
;   - D-pad viewport scrolling
;   - Player blink (OBJ palette 7 color 1 toggle)
;   - Border shimmer animation (BG3 palette 7 color 1 gradient cycle)
;   - ComposeAllSprites called each frame for OBJ sprite markers
;   - Actor render list cleared ($0C00) to suppress actor sprites

?INCLUDE 'minimap_v2_core'
?INCLUDE 'debug_menu_handler'
?INCLUDE 'inventory_overlay'
?INCLUDE 'item_use_system'
?INCLUDE 'music_actors'
?INCLUDE 'radar_map_screen'
?INCLUDE 'sprite_composition'
?INCLUDE 'system_core'
?INCLUDE 'system_strings'
?INCLUDE 'vblank_joypad'
?INCLUDE 'vram_buffer_clear'

!sceneNext                      0642
!joypadCurrent                  0656
!joypadHeld                     0658
!joypadMaskStd                  065A
!playerFlags                    09AE
!displayModeFlags               09EC
!INIDISP                        2100
!cgramShadow                    7F0A00
!sortedRenderList               0C00

---------------------------------------------

GlobalInputHandler! {
    PHP
    REP #$20

    ; === GUARD CONDITIONS (identical to original) ===
    LDA $sceneNext
    AND #$00FF
    BNE gih_exit
    LDA $playerFlags
    BIT #$0200
    BNE gih_exit
    JSL $@music_actors.IsMusicPlaying
    BCS gih_exit

    LDA $joypadCurrent
    BIT #$1000
    BNE gih_start

    LDA $playerFlags
    BIT #$2800
    BNE gih_exit

    LDA $joypadCurrent
    BIT #$2000
    BNE gih_select
    BIT #$4000
    BEQ gih_exit
    JMP $&item_use_system.ItemUseDispatch

  gih_exit:
    PLP
    RTL

    ; === SELECT → inventory (identical to original) ===
  gih_select:
    LDA #$2000
    TSB $joypadHeld
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@inventory_overlay.OpenInventoryScreen
    JSL $@vblank_joypad.EnableNmiOnly
    LDA #$6000
    TSB $joypadHeld
    PLP
    RTL

    ; === START pressed ===
  gih_start:
    LDA #$1000
    TSB $joypadHeld
    LDX #$0000
    LDA $playerFlags
    BIT #$0008
    BNE gih_pause_mode

    ; --- Normal mode: minimap setup ---
    JSL $@minimap_v2_core.MinimapScreenSetup
    SEP #$20
    BRA gih_hold_loop

    ; === Input-locked mode: PAUSE text (identical to original) ===
  gih_pause_mode:
?IF 'DebugMenu'
    JSL $@debug_menu_handler.DebugMenuPauseHandler
    PLP
    RTL
?ELSE
    COP [RunBg3Script] ( @system_strings.consolestring_01EAC6 )
    LDA #$8000
    TRB $displayModeFlags
    SEP #$20
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly
    LDA #$09
    STA $INIDISP
?ENDIF

    ; === Hold-to-view loop ===
    ; Common loop for both minimap and pause mode.
    ; Minimap mode has D-pad scroll + OBJ sprites; pause mode ignores D-pad.
  gih_hold_loop:
    REP #$20
    LDA #$1000
    TRB $joypadMaskStd
    SEP #$20
    LDX #$0000
    PHX
    PHX

  gih_loop_top:
    ; --- Build OBJ sprite markers from compose buffer (minimap mode) ---
    REP #$20
    LDA $playerFlags
    BIT #$0008
    BNE gih_skip_sprites

    ; Clear sorted actor render list so only compose buffer sprites survive
    STZ $sortedRenderList
    JSL $@sprite_composition.ComposeAllSprites

  gih_skip_sprites:
    SEP #$20
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly

    ; --- Check Start release → exit ---
    LDA $0657
    BIT #$10
    BEQ gih_no_exit
    JMP $&gih_loop_exit
  gih_no_exit:

    ; --- Check if we are in minimap mode (playerFlags bit 3 clear) ---
    REP #$20
    LDA $playerFlags
    BIT #$0008
    BNE gih_pause_loop_bra

    ; --- D-pad scroll (minimap mode only) ---
    LDA $joypadCurrent
    STA $10

    BIT #$0800
    BEQ gih_no_up
    LDA $B6
    SEC
    SBC #$0002
    BPL gih_up_ok
    LDA #$0000
  gih_up_ok:
    AND #$FFFE
    STA $B6
    BRA gih_do_scroll

  gih_no_up:
    LDA $10
    BIT #$0400
    BEQ gih_no_down
    LDA $B6
    CLC
    ADC #$0002
    CMP $BE
    BCC gih_down_ok
    LDA $BE
  gih_down_ok:
    AND #$FFFE
    STA $B6
    BRA gih_do_scroll

  gih_no_down:
    LDA $10
    BIT #$0200
    BEQ gih_no_left
    LDA $B4
    SEC
    SBC #$0002
    BPL gih_left_ok
    LDA #$0000
  gih_left_ok:
    AND #$FFFE
    STA $B4
    BRA gih_do_scroll

  gih_no_left:
    LDA $10
    BIT #$0100
    BEQ gih_blink
    LDA $B4
    CLC
    ADC #$0002
    CMP $BC
    BCC gih_right_ok
    LDA $BC
  gih_right_ok:
    AND #$FFFE
    STA $B4

  gih_do_scroll:
    JSL $@minimap_v2_core.MinimapScrollUpdate
    SEP #$20
    BRA gih_blink

  gih_pause_loop_bra:
    SEP #$20

    ; --- Player blink + border shimmer (minimap mode only) ---
  gih_blink:
    REP #$20
    LDA $playerFlags
    BIT #$0008
    BNE gih_pause_anim
    SEP #$20

    ; Toggle OBJ palette 7 color 1 (player sprite marker) every 16 frames
    ; CGRAM shadow address: $7F0A00 + $1E0 + 2 = $7F0BE2
    LDA $01, S
    INC
    STA $01, S
    AND #$10
    BNE gih_blink_on

    ; OFF phase: transparent (color 0)
    REP #$20
    LDA #$0000
    STA $7F0BE2
    SEP #$20
    BRA gih_shimmer

  gih_blink_on:
    ; ON phase: restore original white ($7FFF = BGR555 white)
    REP #$20
    LDA #$7FFF
    STA $7F0BE2
    SEP #$20

    ; --- Border shimmer animation ---
    ; Cycles palette 7 color 1 through a 29-entry gradient at half frame rate.
    ; CGRAM shadow address: $7F0A00 + $38 + 2 = $7F0A3A (pal 7, color 1)
  gih_shimmer:
    LDA $0036
    LSR
    BCC gih_loop_top_jmp

    REP #$20
    LDA $03, S
    INC
    CMP #$001D
    BCC gih_shim_ok
    LDA #$0000
  gih_shim_ok:
    STA $03, S
    ASL
    TAX
    LDA $@minimap_v2_shimmer, X
    STA $7F0A3A
    SEP #$20

  gih_loop_top_jmp:
    JMP $&gih_loop_top

    ; --- Pause mode: radar border animation (identical to original) ---
  gih_pause_anim:
    SEP #$20
    JSR $&radar_map_screen.RadarBorderAnimate
    JMP $&gih_loop_top

    ; === Exit hold loop ===
  gih_loop_exit:
    PLX
    PLX

    ; --- Check if minimap mode → run minimap teardown ---
    REP #$20
    LDA $playerFlags
    BIT #$0008
    BNE gih_common_teardown
    JSL $@minimap_v2_core.MinimapTeardown

    ; === Common teardown (matches original) ===
  gih_common_teardown:
    SEP #$20
    LDA #$10
    TSB $0659
    JSL $@vram_buffer_clear.ClearVramBufferPartial
    LDA #$0F
    STA $INIDISP
    LDA #$01
    TSB $displayModeFlags
    JSL $@system_core.UpdateFrameDialogue
    PLP
    RTL
}
