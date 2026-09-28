; =============================================================================
; DisplayPresetShadow — SceneCmd_ConfigDisplay hook
; =============================================================================
;
; Replaces SceneCmd_ConfigDisplay with a version that saves the 4 display
; register values (TM, TS, CGWSEL, CGADSUB) to WRAM shadow variables.
; These are write-only PPU registers with no engine shadow copies.
;
; The dungeon map overlay reads these shadows to compute blended color math
; values that add BG3 transparency while preserving the scene's existing
; blend configuration, and restores the originals on teardown.
;
; Only 4 STA instructions are added vs. the original function.

?INCLUDE 'scene_script'
?INCLUDE 'display_preset_table'

!TM                             212C
!TMW                            212E
!TS                             212D
!TSW                            212F
!CGWSEL                         2130
!CGADSUB                        2131
!BG1SC                          2107
!BG2SC                          2108
!BGMODE                         2105
!sceneDisplayTM                 7F515E
!sceneDisplayTS                 7F515F
!sceneDisplayCGWSEL             7F5160
!sceneDisplayCGADSUB            7F5161

---------------------------------------------

SceneCmd_ConfigDisplay! {
    JSR $&ReadScriptByte
    PHY
    REP #$20
    AND #$00FF
    ASL
    TAX
    LDA $@display_preset_table, X
    SEC
    SBC #$&display_preset_table
    TAX
    SEP #$20

    LDA $@display_preset_table, X
    STA $TM
    STA $TMW
    STA $sceneDisplayTM           ; shadow: save TM
    LDA $@display_preset_table+1, X
    STA $TS
    STA $TSW
    STA $sceneDisplayTS           ; shadow: save TS
    LDA $@display_preset_table+2, X
    STA $CGWSEL
    STA $sceneDisplayCGWSEL       ; shadow: save CGWSEL
    LDA $@display_preset_table+3, X
    STA $CGADSUB
    STA $sceneDisplayCGADSUB      ; shadow: save CGADSUB

    LDA $@display_preset_table+4, X
    AND #$30
    STA $06F1
    LDA $@display_preset_table+4, X
    STZ $06A3
    STZ $06A5
    LDY #$2000
    ROR
    BCC ccd_no_06a2
    STY $06A2

  ccd_no_06a2:
    ROR
    BCC ccd_no_06a4
    STY $06A4

  ccd_no_06a4:
    ROR
    ROR
    ROR
    ROR
    ROR
    LDY #$00E0
    BCC ccd_std_height
    LDY #$0100

  ccd_std_height:
    STY $06EC
    ROR
    BCS ccd_skip_06a5
    LDA #$01
    TSB $06A5

  ccd_skip_06a5:
    REP #$20
    LDA $06A2
    CMP $06A6
    BEQ ccd_a2_match
    STZ $0679

  ccd_a2_match:
    STA $06A6
    LDA $06A4
    CMP $06A8
    BEQ ccd_a4_match
    STZ $067C

  ccd_a4_match:
    STA $06A8
    SEP #$20
    LDA $@display_preset_table+5, X
    STA $layerPriorityFlag
    BMI ccd_swap_bg
    LDA $layerPriorityFlag
    AND #$03
    CLC
    ADC #$10
    STA $BG1SC
    LDA $layerPriorityFlag
    LSR
    LSR
    AND #$03
    CLC
    ADC #$18
    STA $BG2SC
    BRA ccd_bgmode

  ccd_swap_bg:
    LDA $layerPriorityFlag
    AND #$03
    CLC
    ADC #$18
    STA $BG1SC
    LDA $layerPriorityFlag
    LSR
    LSR
    AND #$03
    CLC
    ADC #$10
    STA $BG2SC

  ccd_bgmode:
    LDA $@display_preset_table+6, X
    STA $BGMODE
    LDA $@display_preset_table+7, X
    PHA
    AND #$1F
    STA $scrollModeFlags
    BIT #$08
    BEQ ccd_no_066e
    STZ $066E

  ccd_no_066e:
    LDA #$40
    TRB $09ED
    PLA
    BPL ccd_no_09ed
    LDA #$40
    TSB $09ED

  ccd_no_09ed:
    LDA $@display_preset_table+8, X
    LDA $@display_preset_table+9, X
    PLY
    RTS
}
