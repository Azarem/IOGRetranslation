
!scene_next                     0642

overworld_stamp_main {
    PHP 
    REP #$20
    PHD 
    LDA #$0000
    TCD 
    STZ $0D70
    LDX #$0000

  loc_02800E:
    LDA #$0000
    STA $7EA000, X
    STA $7EA002, X
    STA $7EA004, X
    STA $7EA006, X
    STA $7EA008, X
    STA $7EA00A, X
    STA $7EA00C, X
    STA $7EA00E, X
    TXA 
    CLC 
    ADC #$0010
    TAX 
    CPX #$0800
    BCC loc_02800E
    STZ $08
    SEP #$20
    LDX #$A000
    STX $3E
    LDA #$7E
    STA $40
    STA $44

  overworld_stamp_top:
    PEA #$&overworld_stamp_top-1
    LDA $0000, Y
    INY 
    CMP #$E0
    BCS overworld_stamp_accent
    CMP #$C0
    BCS overworld_stamp_command
    JSR $&do_character
    RTS 

  overworld_stamp_accent:
    JSR $&proc_accent_map
    SEP #$20
    RTS

  overworld_stamp_command:

  overworld_stamp_end:
    REP #$20
    PLA 
    PLA 
    TCD 
    TAX 
    PLP 
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
    LDA $@PrologueStamp, X
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

    JSR increment_map
    
    RTS
}

increment_map {
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
    RTS 
}

--------------------------------------
?INCLUDE 'sFE_actor_03A2F1'
--------------------------------------

  loc_03A3A4:
    LDA $0D6F
    AND #$00FF
    STA $0000
    JSR $&sub_03A692
    COP [4F] ( $7EA000, #$5000, #$0800 )
    COP [9A] ( @code_03A246, #$3001 )
    COP [63] ( #00, #07, #00 )
    COP [CA] ( #5D )
    COP [64]
    LDA $00B6
    CLC 
    ADC $7F002E, X
    STA $00B6
    INC $00B8
    COP [CB]
    LDA #$0000
    STA $7F002E, X
    LDA #$2000
    TRB $10
    LDY #$0000
    
  loc_03A60B:
    STZ $0D5A
    STZ $0D58
    LDA $0D6E
    AND #$00FF
    STA $0000
    JSR $&sub_03A692
    COP [4F] ( $7EA000, #$5000, #$0800 )
    COP [9C] ( @code_03A246, #$1001 )
    COP [DA] ( #3B )
    COP [C1]
    LDA $00B6
    SEC 
    SBC #$0010
    BMI loc_03A644
    STA $00B6
    LDA $0660
    BIT #$1000
    BNE loc_03A5DB
    RTL 

    
code_03A246 {
    LDA #$2000
    TRB $10
    COP [88] ( @table_0EE000 )
    LDA #$0020
    SEC 
    SBC $0D70
    ASL 
    ASL 
    CLC 
    ADC $06BE
    STA $14
    LDA $06C2
    CLC 
    ADC #$0048
    STA $16
    COP [80] ( #34 )
    COP [89]
    RTL 
}


  loc_03A450:
    LDA $24
    STA $7F0012, X
    COP [CA] ( #02 )
    COP [C1]
    COP [89]
    COP [CB]
    COP [A8]
    COP [99] ( @func_03A52F )
    BRA loc_03A497
    
  loc_03A644:
    LDA #$0000
    STA $00B6
    COP [C2]
    COP [A9]
    LDA #$0800
    TSB $10
    COP [63] ( #00, #06, #00 )
    LDA #$0406
    STA $064A
    LDA $0D6E
    AND #$00FF
    STA $scene_next
    LDA $0D6C
    STA $0652
    JSR $&sub_03A681
    COP [C1]
    COP [64]
    LDA $7F002E, X
    CLC 
    ADC $00B8
    STA $00B8
    RTL 

  loc_03A6AD:
    REP #$20
    LDY $&overworld_names+1, X
    JSL $@overworld_stamp_main
    PLB 
    PLX 
    PLP 
    RTS 

------------------------------------
?INCLUDE 'table_0EE000'
------------------------------------
  
sprite_group_0EF317 [
  sprite_group < #01, #FF, #10, #00, #F8, #F0, #01, #01, #F8, #07, #F8, #07, #10, [
    sprite_part < #01, #00, #F0, #00, #00, #$0300 >   ;00
    sprite_part < #01, #10, #E0, #00, #00, #$0302 >   ;01
    sprite_part < #01, #20, #D0, #00, #00, #$0304 >   ;02
    sprite_part < #01, #40, #B0, #00, #00, #$0308 >   ;03
    sprite_part < #01, #30, #C0, #00, #00, #$0306 >   ;04
    sprite_part < #01, #50, #A0, #00, #00, #$030A >   ;05
    sprite_part < #01, #60, #90, #00, #00, #$030C >   ;06
    sprite_part < #01, #70, #80, #00, #00, #$030E >   ;07
    sprite_part < #01, #80, #70, #00, #00, #$0320 >   ;08
    sprite_part < #01, #90, #60, #00, #00, #$0322 >   ;09
    sprite_part < #01, #A0, #50, #00, #00, #$0324 >   ;0A
    sprite_part < #01, #B0, #40, #00, #00, #$0326 >   ;0B
    sprite_part < #01, #C0, #30, #00, #00, #$0328 >   ;0C
    sprite_part < #01, #D0, #20, #00, #00, #$032A >   ;0D
    sprite_part < #01, #E0, #10, #00, #00, #$032C >   ;0E
    sprite_part < #01, #F0, #00, #00, #00, #$032E >   ;0F
  ] >   ;00
]