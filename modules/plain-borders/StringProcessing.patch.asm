?BANK 03

?INCLUDE 'chunk_03BAE1'
?INCLUDE 'templates_01CA95'
?INCLUDE 'SwitchNameDictionary'

!scene_next                     0642
!scene_current                  0644
!advance_button_mask            C080
!default_background             0000
!border_state                   09F8
!default_bg                     0C03
!default_fg                     7FFB
!default_dt                     762F

----------------------------------------------------
;Command for setting current border id

cmd_d9 {
    LDA $0000, Y
    AND #$00FF
    STA $border_state
    INY
    RTS
}

----------------------------------------------------
;Command for using name dictionaries

cmd_dA {
  JSL name_dictionary_command
  RTS
}

----------------------------------------------------

DialogStringCommandTable! [
  &DialogCmd_EndAndWait   ;00
  &DialogCmd_SetPosition   ;01
  &DialogCmd_InsertTemplate   ;02
  &DialogCmd_SetPalette   ;03
  &DialogCmd_InfiniteLoop   ;04
  &DialogCmd_IndirectString   ;05
  &DialogCmd_PrintNumber   ;06
  &DialogCmd_OpenDialogueBox   ;07
  &DialogCmd_ClearDialogueBox   ;08
  &DialogCmd_WaitFrames   ;09
  &DialogCmd_Return   ;0A
  &DialogCmd_NewLine   ;0B
  &DialogCmd_AdvanceCursor   ;0C
  &DialogCmd_InsertRemoteString   ;0D
  &DialogCmd_ClearBox   ;0E
  &DialogCmd_WaitForButton   ;0F
  &DialogCmd_WaitForAnyInput   ;10
  &DialogCmd_JumpToAddress   ;11
  &DialogCmd_SetSfx   ;12
  &DialogCmd_OpenDefaultBox   ;13
  &DialogCmd_SetPaletteColor   ;14
  &DialogCmd_SetFrameDelay   ;15
  &DialogCmd_DictionaryA   ;16
  &DialogCmd_DictionaryB   ;17
  &DialogCmd_PrintRawTiles   ;18
  &cmd_d9
  &cmd_dA
]


----------------------------------------------------
;Entry point for command 7 (setting up dialog borders)

OpenDialogueBox_Body! {
    PHY 
    PHX 
    ;LDA $0B04          --Don't reset print delay
    ;STA $007E 
    ;LDA #$0010         --Don't reset sfx
    ;STA $0996
    STZ $00DC
    STZ $099C
    LDA $097A
    STA $097E
    LDA $097C
    STA $0980
    XBA 
    LSR 
    LSR 
    CLC 
    ADC $097A
    CLC 
    ADC $097A
    STA $099A
    ;STZ $0986  --Don't reset palette offset

    ;LDA $border_state

    ;ASL
    ;TAX
    ;LDA @border_lookup, X
    ;STA $3E
    ;LDA #*border_lookup
    ;STA $40

    LDA #$*DialogueBorderTiles
    STA $40
    LDA #$&DialogueBorderTiles
    STA $3E

    LDA $0982
    ASL 
    STA $18
    PHA 
    LDA $0984
    ASL 
    STA $1C
    LDA $0998
    DEC 
    DEC 
    SEC 
    SBC #$0040
    STA $00
    TAX 
    JSR $&DrawDialogueBorderRow
    PLX 
    PHX 
    STX $18
    JSR $&DrawDialogueBodyRows
    PLY 
    STY $18
    JSR $&DrawDialogueBorderRow
    LDA #$0001
    TSB $09EC
    LDA $scene_current
    AND #$00FF
    CMP #$00FA
    BEQ loc_03E4CB
    JSR $&WaitOneFrame
}

----------------------------------------------------
;Entry point for command 8 (clear dialog) to support border styles

loc_03E59F! {
    STA $7F0200, X
    INX 
    INX 
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
    
    LDA $0B04           --Reset print delay
    STA $007E

    STZ $border_state   --Reset border state
    STZ $0986           --Reset font palette

    LDA $@fx_palette_198040+2  --Also reset font colors
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

    ;PHX 
    ;LDX #$0022
    ;LDA #$675D
    ;STA $7F0A00, X
    ;LDA #$10F2
    ;STA $7F0A02, X
    ;LDA #$0000
    ;STA $7F0A04, X
    ;PLX 

    LDA #$0001
    TSB $09EC
    ;JSR $&WaitOneFrame  --This prevents a flicker due to forced redraw
    LDX $0998
    STX $099A
    STZ $099C
    PLB 
    PLY 
    RTS 
}

------------------------------------

DialogCmd_WaitForButton! {
    LDA #$advance_button_mask
    TSB $0658

  loc_03E6AA!:
    JSR $&WaitOneFrame
    LDA $0656
    AND #$advance_button_mask
    BNE loc_03E6C1
    SEC 
    JSR $&DrawDialogueCursor
    LDA #$0001
    TSB $09EC
    BRA loc_03E6AA
}

---------------------------------------------

DialogCmd_WaitForAnyInput! {
    LDA #$advance_button_mask
    TSB $0658

  loc_03E6D8!:
    JSR $&WaitOneFrame
    LDA $0656
    AND #$advance_button_mask
    BEQ loc_03E6D8
    STA $0658
    RTS 
}