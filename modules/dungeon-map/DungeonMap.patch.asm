; =============================================================================
; Dungeon Map — GlobalInputHandler patch (windowed hold-loop mode)
; =============================================================================
; Replaces the original GlobalInputHandler. Structure mirrors MinimapV2:
; guard conditions, Start/Select/Y dispatch, hold-to-view loop, teardown.
;
; Uses ?IF 'DebugMenu' to add L/R → debug menu in the hold-to-view loop.
;
; Hold loop features:
;   - D-pad viewport scrolling
;   - Player blink (BG3 palette 4 color 3 toggle)
;   - Border shimmer animation (BG3 palette 7 color 1 gradient cycle)
;   - Full-screen BG3-only display (no OBJ sprites needed)

?INCLUDE 'dungeon_map_core'
?INCLUDE 'debug_menu_handler'
?INCLUDE 'inventory_overlay'
?INCLUDE 'item_use_system'
?INCLUDE 'minimap_shimmer'
?INCLUDE 'music_actors'
?INCLUDE 'radar_map_screen'
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

!SCROLL_STEP                    0002

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

    ; --- Normal mode: dungeon map setup ---
    JSL $@dungeon_map_core.DungeonMapScreenSetup
    SEP #$20
    BRA gih_hold_loop

    ; === Input-locked mode: PAUSE text (identical to original) ===
  gih_pause_mode:
?IF 'DebugMenu'
    JSL $@debug_menu_handler.DebugMenuHandler
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
    ; Common loop for both dungeon map and pause mode.
    ; Dungeon map mode has D-pad scroll + blink + shimmer.
  gih_hold_loop:
    REP #$20
    LDA #$1000
    TRB $joypadMaskStd
    SEP #$20
    LDX #$0000
    PHX                    ; blink counter
    PHX                    ; shimmer counter

  gih_loop_top:
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

?IF 'DebugMenu'
    ; L/R → switch to debug menu (from map or PAUSE)
    REP #$20
    LDA $joypadCurrent
    BIT #$0030
    BEQ $05
    JMP gih_to_debug_menu
?ENDIF

    ; --- Check if we are in dungeon map mode (playerFlags bit 3 clear) ---
    REP #$20
    LDA $playerFlags
    BIT #$0008
    BNE gih_pause_loop_bra

    ; --- D-pad scroll (dungeon map mode only) ---
    LDA $joypadCurrent
    STA $10

    BIT #$0800
    BEQ gih_no_up
    LDA $B6
    SEC
    SBC #$SCROLL_STEP
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
    ADC #$SCROLL_STEP
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
    SBC #$SCROLL_STEP
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
    ADC #$SCROLL_STEP
    CMP $BC
    BCC gih_right_ok
    LDA $BC
  gih_right_ok:
    AND #$FFFE
    STA $B4

  gih_do_scroll:
    JSL $@dungeon_map_core.DungeonMapScrollUpdate
    SEP #$20
    BRA gih_blink

  gih_pause_loop_bra:
    SEP #$20

    ; --- Player blink (dungeon map mode only) ---
    ; Toggle palette 1 color 3 (player marker accent) every 16 frames.
    ; CGRAM shadow for pal 1 color 3: $7F0A00 + $08 + $06 = $7F0A0E
  gih_blink:
    REP #$20
    LDA $playerFlags
    BIT #$0008
    BNE gih_pause_anim
    SEP #$20

    LDA $01, S
    INC
    STA $01, S
    AND #$10
    BNE gih_blink_on

    ; OFF phase: black (invisible against floor)
    REP #$20
    LDA #$0000
    STA $7F0A0C
    SEP #$20
    BRA gih_shimmer

  gih_blink_on:
    ; ON phase: white ($7FFF)
    REP #$20
    LDA #$7FFF
    STA $7F0A0C
    SEP #$20

    ; --- Border shimmer animation ---
    ; Cycles palette 7 color 1 through a 29-entry gradient at half frame rate.
    ; CGRAM shadow for pal 7 color 1: $7F0A00 + $38 + $02 = $7F0A3A
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
    LDA $@minimap_shimmer, X
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
    PLX                    ; pop shimmer counter
    PLX                    ; pop blink counter

    ; --- Check if dungeon map mode → run teardown ---
    REP #$20
    LDA $playerFlags
    BIT #$0008
    BNE gih_common_teardown
    JSL $@dungeon_map_core.DungeonMapTeardown

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

?IF 'DebugMenu'
    ; L/R → debug menu from hold loop (map or PAUSE)
  gih_to_debug_menu:
    SEP #$20
    PLX                    ; pop shimmer counter
    PLX                    ; pop blink counter
    LDA #$30
    TSB $0658              ; consume L/R buttons
    ; Check if dungeon map mode → teardown before entering debug menu
    REP #$20
    LDA $playerFlags
    BIT #$0008
    BNE gih_debug_skip_teardown
    JSL $@dungeon_map_core.DungeonMapTeardown
  gih_debug_skip_teardown:
    JSL $@debug_menu_handler.DebugMenuHandler
    PLP
    RTL
?ENDIF
}
