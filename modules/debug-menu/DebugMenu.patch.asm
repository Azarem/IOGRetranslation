; Debug Menu — GlobalInputHandler patch.
;
; Replaces GlobalInputHandler to hook the debug menu into:
; 1. Input-locked pause path (bit 3 set): debug menu replaces 'PAUSE'
; 2. Normal radar path: L/R buttons switch from radar to debug menu
;
; The replacement preserves all original guard conditions, Select/Y
; handling, and radar display. Only the Start button paths are modified.

?INCLUDE 'debug_menu_core'
?INCLUDE 'inventory_overlay'
?INCLUDE 'item_use_system'
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

---------------------------------------------

; When the dungeon-map module is active, its DungeonMap.patch.asm owns
; GlobalInputHandler! and calls into DebugMenuPauseHandler via ?IF.
; Skip this override to avoid duplicate label conflicts.
?IF 'DungeonMap'
?ELSE

GlobalInputHandler! {
    PHP 
    REP #$20

    ; === GUARD CONDITIONS (unchanged from original) ===

    LDA $sceneNext
    AND #$00FF
    BNE gi_exit
    LDA $playerFlags
    BIT #$0200
    BNE gi_exit
    JSL $@music_actors.IsMusicPlaying
    BCS gi_exit

    ; Start button — highest priority (bypasses run/ability guard)
    LDA $joypadCurrent
    BIT #$1000
    BNE gi_start_pressed

    ; Run/ability guard for Select and Y
    LDA $playerFlags
    BIT #$2800
    BNE gi_exit

    ; Select → inventory
    LDA $joypadCurrent
    BIT #$2000
    BNE gi_select

    ; Y → item use
    BIT #$4000
    BEQ gi_exit
    JMP $&item_use_system.ItemUseDispatch

  gi_exit:
    PLP 
    RTL 

    ; === SELECT HANDLER (unchanged) ===

  gi_select:
    LDA #$2000
    TSB $joypadHeld
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@inventory_overlay.OpenInventoryScreen
    JSL $@vblank_joypad.EnableNmiOnly
    LDA #$6000
    TSB $joypadHeld
    PLP 
    RTL 

    ; === START HANDLER (modified for debug menu) ===

  gi_start_pressed:
    LDA #$1000
    TSB $joypadHeld
    LDX #$0000
    LDA $playerFlags
    BIT #$0008
    BNE gi_debug_menu

    ; Normal mode: radar minimap
    JSR $&radar_map_screen.RadarScreenSetup
    SEP #$20
    BRA gi_hold_setup

    ; Input-locked mode: debug menu replaces PAUSE screen
  gi_debug_menu:
    JSL $@debug_menu_core.debug_menu_core
    JMP $&gi_cleanup_16

    ; === RADAR HOLD-TO-VIEW LOOP (with L/R debug menu hook) ===

  gi_hold_setup:
    ; Ensure Start is detectable during radar display.
    ; Some game states leave bits in joypadMaskStd that include Start,
    ; which causes VBlankWaitAndJoypad to strip it from joypadCurrent.
    REP #$20
    LDA #$1000
    TRB $joypadMaskStd
    SEP #$20
    LDX #$0000
    PHX 

  gi_hold_loop:
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly
    JSR $&radar_map_screen.RadarBorderAnimate

    ; Check L/R for debug menu switch
    REP #$20
    LDA $joypadCurrent
    BIT #$0030
    BNE gi_radar_to_debug
    SEP #$20

    ; Original Start release check
    LDA $0657
    BIT #$10
    BEQ gi_hold_loop
    PLX 
    LDA #$10
    TSB $0659
    BRA gi_cleanup_16

    ; L/R pressed: switch from radar to debug menu
  gi_radar_to_debug:
    SEP #$20
    PLX 
    LDA #$30
    TSB $0658
    REP #$20
    JSL $@debug_menu_core.debug_menu_core

    ; === CLEANUP (shared by all exit paths) ===

  gi_cleanup_16:
    JSL $@vram_buffer_clear.ClearVramBufferPartial
    SEP #$20

  gi_cleanup_8:
    LDA #$0F
    STA $INIDISP
    LDA #$01
    TSB $displayModeFlags
    JSL $@system_core.UpdateFrameDialogue
    PLP 
    RTL 
}
?ENDIF
