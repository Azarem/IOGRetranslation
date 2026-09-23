; Debug Menu — callable wrapper for use by other modules.
;
; Provides a JSL-callable entry point that runs the debug menu and
; performs the standard cleanup (VRAM clear, brightness restore,
; frame dialogue update). Designed for modules that override
; GlobalInputHandler and want to invoke the debug menu in the
; input-locked (pause) path.
;
; Entry: JSL $@debug_menu_handler.DebugMenuPauseHandler (16-bit A)
; Exit:  RTL — caller should PLP + RTL to return from GlobalInputHandler.

?INCLUDE 'debug_menu_core'
?INCLUDE 'vram_buffer_clear'
?INCLUDE 'system_core'

!displayModeFlags               09EC
!INIDISP                        2100

---------------------------------------------

DebugMenuPauseHandler {
    JSL $@debug_menu_core.debug_menu_core
    JSL $@vram_buffer_clear.ClearVramBufferPartial
    SEP #$20
    LDA #$0F
    STA $INIDISP
    LDA #$01
    TSB $displayModeFlags
    JSL $@system_core.UpdateFrameDialogue
    RTL
}
