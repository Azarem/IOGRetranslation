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

--------------------------------------------------------

border_lookup [
    &dlg_borders_03E4CE
    &border_index_1
    &border_index_2
    &border_index_3
    &border_index_4
    &border_index_5
    &border_index_6
    &border_index_7
    &border_index_8
    &border_index_9
    &border_index_A
    &border_index_B
    &border_index_C
    &border_index_D
]

border_index_1 #1320142013601520156013A014A013E0
border_index_2 #1620172016601820186016A017A016E0
border_index_3 #19201A2019601B201B6019A01AA019E0
border_index_4 #A320A420A360A520A560A3A0A4A0A3E0
border_index_5 #A620A720A6601C201C60A6A0A7A0A6E0
border_index_6 #A020A120A060A220A260A0A0A1A0A0E0
border_index_7 #B020B120B060B220B260B0A0B1A0B0E0
border_index_8 #B320B420B360B520B560B3A0B4A0B3E0
border_index_9 #B620B720B660B820B860B6A0B7A0B6E0
border_index_A #B920BA20B960BB20BB60B9A0BAA0B9E0
border_index_B #A920AA20A960AB20AB60A9A0AAA0A9E0
border_index_C #C920CA20C960CB20CB60C9A0CAA0C9E0
border_index_D #C620C720C660C820C860C6A0C7A0C6E0

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

wide_cmd_table_03E2C3 [
  &cmd_c0_03E2F5   ;00
  &cmd_c1_03E30F   ;01
  &cmd_c2_03E335   ;02
  &cmd_c3_03E35B   ;03
  &cmd_c4_03E36B   ;04
  &cmd_c5_03E36F   ;05
  &cmd_c6_03E393   ;06
  &cmd_c7_03E43F   ;07
  &cmd_c8_03E579   ;08
  &cmd_c9_03E5EB   ;09
  &code_03E307   ;0A
  &cmd_cb_03E5F8   ;0B
  &cmd_cc_03E61E   ;0C
  &cmd_cd_03E636   ;0D
  &cmd_ce_03E656   ;0E
  &cmd_cf_03E6A4   ;0F
  &cmd_d0_03E6D2   ;10
  &cmd_d1_03E6E7   ;11
  &cmd_d2_03E6EC   ;12
  &cmd_d3_03E6F7   ;13
  &cmd_d4_03E721   ;14
  &cmd_d5_03E736   ;15
  &cmd_d6_03E743   ;16
  &cmd_d7_03E769   ;17
  &cmd_d8_03E78F   ;18
  &cmd_d9
  &cmd_dA
]


----------------------------------------------------
;Entry point for command 7 (setting up dialog borders)

code_03E453 {
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

    LDA $border_state
    ;AND #$0003
    ASL
    TAX
    LDA @border_lookup, X
    STA $3E
    LDA #*border_lookup
    STA $40

    ;LDA #$*dlg_borders_03E4CE
    ;STA $40
    ;LDA #$&dlg_borders_03E4CE
    ;STA $3E

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
    JSR $&sub_03E4DE
    PLX 
    PHX 
    STX $18
    JSR $&sub_03E505
    PLY 
    STY $18
    JSR $&sub_03E4DE
    LDA #$0001
    TSB $09EC
    LDA $scene_current
    AND #$00FF
    CMP #$00FA
    BEQ code_03E4CB
    JSR $&sub_03E7B2
}

----------------------------------------------------
;Entry point for command 8 (clear dialog) to support border styles

code_03E59F {
    STA $7F0200, X
    INX 
    INX 
    DEC $18
    BPL code_03E59F
    LDA $00
    STA $18
    LDA $099A
    CLC 
    ADC #$0040
    STA $099A
    TAX 
    DEC $1C
    BPL code_03E59C

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
    ;JSR $&sub_03E7B2  --This prevents a flicker due to forced redraw
    LDX $0998
    STX $099A
    STZ $099C
    PLB 
    PLY 
    RTS 
}

------------------------------------

cmd_cf_03E6A4 {
    LDA #$advance_button_mask
    TSB $0658

  code_03E6AA:
    JSR $&sub_03E7B2
    LDA $0656
    AND #$advance_button_mask
    BNE code_03E6C1
    SEC 
    JSR $&sub_03E80C
    LDA #$0001
    TSB $09EC
    BRA code_03E6AA
}

---------------------------------------------

cmd_d0_03E6D2 {
    LDA #$advance_button_mask
    TSB $0658

  code_03E6D8:
    JSR $&sub_03E7B2
    LDA $0656
    AND #$advance_button_mask
    BEQ code_03E6D8
    STA $0658
    RTS 
}