

!camera_bounds_y                06DC
!player_actor                   09AA
!VMADDL                         2116
!M7SEL                          211A
!CGWSEL                         2130
!CGADSUB                        2131
!COLDATA                        2132
!MDMAEN                         420B
!DMAP0                          4300
!BBAD0                          4301
!A1T0L                          4302
!A1B0                           4304
!DAS0L                          4305

prologue_accent_map {
  #8041
  #8241
  #8441
  #8641
  #8801
  #8A01
  #8C49
  #8E49
  #9049
  #9201
  #4494
  #961D
  #9809
  #9A09
  #9C11
  #9E2B
  
  #8151
  #8351
  #8551
  #875F
  #895D
  #8B5D
  #8D5D
  #8F5D
  #915F
  #936B
  #956B
  #976B
  #991D
  #9B1D
  #049D
  #9F01
}

prologue_stamp {
    BRK #$60
    PHB
    PHD
    SEP #$20
    PHA
    PLB
    REP #$20
    
    LDA #$0000
    TCD             --Set base D address to 0
    STX $00
    STX $02         --Store X/Y positions to temp variables
    LDX #$0000      --Set sprite X-offset to 0

    STA $7F0BE0
    STA $7F0BE2
    STA $7F0BE4
    STA $7F0BE6

    SEP #$20
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    REP #$20
    LDA #$5000
    STA $VMADDL
    STZ $08
    STZ $22
    STZ $00DA
    STZ $0D70
    LDA #$2F00
    STA $04         --Prepare base sprite flags and tile

  loc_09B060:
    PHX
    LDX #$0000
    REP #$20

  loc_09B065:
    LDA #$0000
    STA $7EE000, X
    STA $7EE002, X
    STA $7EE004, X
    STA $7EE006, X
    STA $7EE008, X
    STA $7EE00A, X
    STA $7EE00C, X
    STA $7EE00E, X
    TXA 
    CLC 
    ADC #$0010
    TAX 
    CPX #$0800
    BCC loc_09B065
    LDA #$E000
    STA $3E
    SEP #$20
    LDA #$7E
    STA $40
    STA $44         --Prepare source addresses to $7EE000
    PLX
    BRA loc_09B0AF

  code_09B0A2:
    LDA $22
    CMP #$20
    BNE loc_09B0AF
    STZ $22
    JSR $&do_dma_transfer
    BRA loc_09B060

  loc_09B0AF:
    PEA $&code_09B0A2-1
    LDA $0000, Y
    INY 
    CMP #$E0
    BCS do_accent_map
    CMP #$C0
    BCS do_command
    CMP #$57
    BEQ do_space
    JSR $&do_character
    RTS 

  do_space:
    REP #$20
    JSR conditional_increment_map
    SEP #$20
    RTS

  space_next:
    STA $3E

  space_end:
    SEP #$20
    RTS
    
  do_accent_map:
    JSR proc_accent_map
    SEP #$20
    RTS

  do_command:
    CMP #$CA
    BEQ do_command_end
    CMP #$CB
    BEQ do_command_newline
    RTS

  do_command_newline:
    REP #$20
    JSR conditional_increment_map
    LDA $00
    CLC
    ADC #$1000
    STA $00
    STA $02
    SEP #$20
    RTS 

  do_command_end:
    JSR $&do_dma_transfer
    REP #$20
    ASL $00DA
    ASL $00DA
    PLA 
    PLA 
    TCD
    PLB
    RTL
}

do_character {
    PHA 
    AND #$07
    STA $10
    PLA
    AND #$F0
    LSR
    ORA $10
    XBA

    LDA #$^gfx_stamped_font
    STA $64

    XBA 
    REP #$20
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    ASL 
    CLC
    ADC #$&gfx_stamped_font
    STA $62
    JSR $&print_character
    SEP #$20
    RTS 
}

print_character {
    PHY 
    LDY #$0000
    LDA $3E
    STA $42
    
    LDA #$0001
    STA $0E
    
  print_outer_loop:
    LDA #$0007
    STA $10

  print_inner_loop:
    LDA [$62], Y
    STA [$42], Y
    INY 
    INY 
    DEC $10
    BPL print_inner_loop
    LDA $42
    CLC 
    ADC #$01F0
    STA $42
    DEC $0E
    BPL print_outer_loop
    
    JSR write_sprite
    JSR increment_map
    PLY 
    RTS 
}

proc_accent_map {
    PHX
    PHY
    XBA
    LDA #$^gfx_stamped_font
    STA $64
    XBA
    REP #$20
    AND #$001F
    ASL
    TAX
    LDA $3E
    STA $42
    LDA #$0001
    STA $0E

  accent_outer:
    LDA $@prologue_accent_map, X
    INX
    AND #$00FF
    ASL 
    ASL
    ASL
    ASL
    CLC
    ADC #$&gfx_stamped_font
    STA $62

    LDY #$0000
    
   accent_inner:
    LDA [$62], Y
    STA [$42], Y
    INY 
    INY 
    CPY #$0010
    BNE accent_inner

    LDA $42
    CLC
    ADC #$0200
    STA $42

    DEC $0E
    BPL accent_outer

    PLY
    PLX

    JSR write_sprite
    JSR increment_map
    
    RTS
}

do_dma_transfer {
    REP #$20
    LDA #$E000
    STA $A1T0L
    LDA #$0800
    STA $DAS0L
    SEP #$20
    LDA #$7E
    STA $A1B0
    LDA #$01
    STA $MDMAEN
    RTS 
}

conditional_increment_map {
    LDA $0D70
    BIT #$0001
    BEQ increment_end

  increment_map:
    LDA $3E
    CLC 
    ADC #$0020
    BIT #$0200
    BEQ increment_next
    CLC

    ADC #$0200

  increment_next:
    STA $3E
    INC $0D70
    INC $22

  increment_end:
    LDA $02
    CLC
    ADC #$0008
    STA $02  --Increment X position
    RTS 
}

write_sprite {
    LDA $0D70
    BIT #$0001
    BNE sprite_end
    
    LDA $04
    STA $7F0602, X
    INC
    INC
    BIT #$0010
    BEQ sprite_next
    CLC
    ADC #$0010

  sprite_next:
    STA $04

    LDA $02
    STA $7F0600, X

    INC $00DA
    INX 
    INX 
    INX 
    INX 

  sprite_end:
    RTS
}


------------------------------
?INCLUDE 'pr8C_prologue1'
------------------------------
e_pr8C_prologue1 {
    LDA #$0800
    STA $064A
    COP [D0] ( #F4, #00, &code_0BCAAF )
    PHX
    LDA #$*spritestring_0BD044
    LDY #$spritestring_0BD044
    LDX #$2028
    JSL $@prologue_stamp
    PLX
    LDA $00DA
    STA $14
    LDA #$0058
    STA $00DA
    COP [A0] ( @code_0BCAB1, #$016E, #$03E8, #$1800 )
    COP [DA] ( #00 )
    COP [A0] ( @code_0BCAB1, #$0166, #$041A, #$1800 )
    COP [DA] ( #02 )
    COP [A0] ( @code_0BCAB1, #$01A4, #$03F0, #$1800 )
    COP [DA] ( #00 )
    COP [A0] ( @code_0BCAB1, #$01A0, #$040C, #$1800 )
    COP [DA] ( #04 )
    COP [A0] ( @code_0BCAB1, #$01D2, #$03FC, #$1800 )
    SEP #$20
    STZ $M7SEL
    REP #$20
    COP [3C] ( @code_03A985 )
    TXA 
    TYX 
    TAY 
    LDA #$0804
    STA $7F000E, X
    TXA 
    TYX 
    TAY 
    COP [9A] ( @code_0BCABF, #$2800 )
    --COP [A0] ( @code_0BCF8F, #$0038, #$0030, #$2000 )
    --LDA #$&spritestring_0BD044
    --STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [DB] ( #$01DF )
    COP [3C] ( @e_pr_thinker_0BD039 )
    COP [DA] ( #77 )
    --COP [A0] ( @code_0BCF8F, #$003C, #$0020, #$2000 )
    --LDA #$&spritestring_0BD06D
    --STA $0026, Y
    BRK #$44
    PHX
    LDA $00DA
    CLC
    ADC #$0600
    TAX
    LDY #$0600
    LDA $14
    SEC
    SBC $00DA
    PHA
    DEC
    PHB
    MVN #$7F, #$7F
    PLB
    PLA
    STA $00DA
    LSR
    LSR
    TAY
    LDX #$0000

  height_top:
    LDA $7F0600, X
    SEC
    SBC #$2010
    STA $7F0600, X
    INX
    INX
    INX
    INX
    DEY
    BNE height_top

    PLX

    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [C1]
    RTL 
}

--spritestring_0BD044 ~àáâãÀÁèéêÂçÕÉÊÍÚ[N]ìíîªòóôõ°ùúûÓÔÇÃ~

spritestring_0BD06D ~~

------------------------------
?INCLUDE 'pr8D_prologue2'
------------------------------
e_pr8D_prologue2 {
    SEP #$20
    STZ $M7SEL
    REP #$20
    COP [50] ( @pal_prologue_legends, #00, #00, #20 )
    COP [D1] ( #$017C, #01, &code_0BCB8A )
    COP [CD] ( #$017C )
    COP [9A] ( @code_0BCC2B, #$2800 )
    --COP [A0] ( @code_0BCF8F, #$0020, #$0050, #$2000 )
    --LDA #$&spritestring_0BD0B2
    --STA $0026, Y
    PHX
    LDA #$*spritestring_0BD0B2
    LDY #$spritestring_0BD0B2
    LDX #$5020
    JSL $@prologue_stamp
    PLX
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [E0]
}

code_0BCB8A {
    COP [D1] ( #$017D, #01, &code_0BCBB4 )
    COP [CD] ( #$017D )
    COP [9A] ( @code_0BCC5B, #$2800 )
    --COP [A0] ( @code_0BCF8F, #$0064, #$0058, #$2000 )
    --LDA #$&spritestring_0BD0E3
    --STA $0026, Y
    PHX
    LDA #$*spritestring_0BD0E3
    LDY #$spritestring_0BD0E3
    LDX #$5864
    JSL $@prologue_stamp
    PLX
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [E0]
}

code_0BCBB4 {
    COP [D1] ( #$017E, #01, &code_0BCBDE )
    COP [CD] ( #$017E )
    COP [9A] ( @code_0BCC85, #$2800 )
    --COP [A0] ( @code_0BCF8F, #$0038, #$007C, #$2000 )
    --LDA #$&spritestring_0BD11C
    --STA $0026, Y
    PHX
    LDA #$*spritestring_0BD11C
    LDY #$spritestring_0BD11C
    LDX #$7C28
    JSL $@prologue_stamp
    PLX
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [E0]
}

code_0BCBDE {
    COP [D1] ( #$017F, #01, &code_0BCC08 )
    COP [CD] ( #$017F )
    COP [9A] ( @code_0BCCAE, #$2800 )
    --COP [A0] ( @code_0BCF8F, #$0040, #$0020, #$2000 )
    --LDA #$&spritestring_0BD144
    --STA $0026, Y
    PHX
    LDA #$*spritestring_0BD144
    LDY #$spritestring_0BD144
    LDX #$2038
    JSL $@prologue_stamp
    PLX
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [E0]
}

code_0BCC08 {
    COP [9A] ( @code_0BCCD7, #$2800 )
    COP [CF] ( #$017C )
    --COP [A0] ( @code_0BCF8F, #$0038, #$0050, #$2000 )
    --LDA #$&spritestring_0BD189
    --STA $0026, Y
    PHX
    LDA #$*spritestring_0BD189
    LDY #$spritestring_0BD189
    LDX #$5018
    JSL $@prologue_stamp
    PLX
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [E0]
}


------------------------------
?INCLUDE 'pr8E_prologue3'
------------------------------
e_pr8E_prologue3 {
    LDA #$4001
    TSB $09EC
    COP [50] ( @pal_prologue_missing, #00, #00, #20 )
    PHX
    LDA #$*spritestring_0BD1CA
    LDY #$spritestring_0BD1CA
    LDX #$481C
    JSL $@prologue_stamp
    PLX
    LDA $00DA
    STA $14
    STZ $00DA
    LDA #$0A00
    STA $064A
    LDA #$0220
    STA $camera_bounds_y
    SEP #$20
    LDA #$81
    STA $CGADSUB
    LDA #$EF
    STA $COLDATA
    REP #$20
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    AND #$FFF7
    STA $0010, Y
    COP [9C] ( @code_0BCE05, #$2800 )
    COP [C1]
    LDY $player_actor
    LDA $0016, Y
    INC 
    STA $0016, Y
    CMP #$01A0
    BEQ loc_0BCD9E
    RTL 

  loc_0BCDBA:
    SEP #$20
    LDA #$82
    STA $CGWSEL
    LDA #$10
    STA $CGADSUB
    LDA #$E0
    STA $COLDATA
    REP #$20
    LDA $14
    STA $00DA
    --COP [A0] ( @code_0BCF8F, #$003C, #$0048, #$2000 )
    --LDA #$&spritestring_0BD1CA
    --STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [DB] ( #$010D )
    COP [3C] ( @e_pr_thinker_0BD039 )
    COP [DA] ( #59 )
    LDA #$0404
    STA $064A
    COP [26] ( #8F, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}


------------------------------
?INCLUDE 'pr8F_prologue4'
------------------------------
e_pr8F_prologue4 {
    LDA #$4001
    TSB $09EC
    COP [50] ( @pal_prologue_mishap, #00, #00, #20 )
    --COP [A0] ( @code_0BCF8F, #$0020, #$0020, #$2000 )
    --LDA #$&spritestring_0BD222
    --STA $0026, Y
    PHX
    LDA #$*spritestring_0BD222
    LDY #$spritestring_0BD222
    LDX #$2020
    JSL $@prologue_stamp
    PLX
    LDA $00DA
    STA $14
    COP [DA] ( #$01 )
    LDA $14
    STA $00DA
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [DB] ( #$010D )
    COP [3C] ( @e_pr_thinker_0BD039 )
    COP [DA] ( #59 )
    LDA #$0804
    STA $064A
    COP [26] ( #8C, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}

------------------------------
?INCLUDE 'pr8C_prologue5'
------------------------------
e_pr8C_prologue5 {
    COP [D0] ( #F4, #01, &code_0BCEBB )
    --COP [A0] ( @code_0BCF8F, #$0038, #$0038, #$2000 )
    --LDA #$&spritestring_0BD272
    --STA $0026, Y
    PHX
    LDA #$*spritestring_0BD272
    LDY #$spritestring_0BD272
    LDX #$3028
    JSL $@prologue_stamp
    PLX
    COP [3C] ( @e_pr_thinker_0BD031 )
    SEP #$20
    STZ $M7SEL
    REP #$20
    COP [3C] ( @code_03A985 )
    TXA 
    TYX 
    TAY 
    LDA #$0804
    STA $7F000E, X
    TXA 
    TYX 
    TAY 
    COP [9A] ( @code_0BCEBD, #$2800 )
    COP [C1]
    RTL 
}