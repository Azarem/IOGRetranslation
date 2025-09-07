
-------------------------------------------
?INCLUDE 'chunk_03BAE1'
-------------------------------------------

;Characters >= 0xDC will use the accent table

sub_03E255 {
    PHP 
    PHD 
    PHX 
    LDA #$0000
    TCD 
    LDX $0998

  code_03E25F:
    SEP #$20
    LDA $0000, Y
    CMP #$DC
    BCS do_accent_table
    CMP #$C0
    BCC code_03E27C
    REP #$20
    INY 
    PEA $&code_03E25F-1
    AND #$001F
    ASL 
    PHX 
    TAX 
    LDA $@wide_cmd_table_03E2C3, X
    PLX 
    DEC 
    PHA 
    RTS 
}

code_03E27C {
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
  character_print_stub:
    INX 
    INX 
    STX $0998
    LDA $0654
    BEQ code_03E25F
    LDA $00
    PHA 
    LDA #$0001
    TSB $09EC
    JSR $&code_03E7BA
    PLA 
    CMP #$00AC
    BEQ code_03E25F
    LDA $06F8
    AND #$FF00
    ORA $0996
    STA $06F8
    BRA code_03E25F
}

do_accent_table {
    INY
    SEC
    SBC #$DC
    REP #$20
    AND #$00FF
    ASL
    TAX
    LDA $@accent_table, X
    SEP #$20
    LDX $0998
    STA $7F0200, X
    LDA #$21
    ORA $0987
    STA $7F0201, X
    STA $7F0241, X
    XBA
    STA $7F0240, X
    REP #$20
    BRA character_print_stub
}

accent_table [
    #E090  ;a
    #E190
    #E290
    #E390
    #E490

    #E094  ;e
    #E194
    #E294
    #E494

    #F098  ;i
    #F198
    #F298
    #F398
    
    #E09E  ;o
    #E19E
    #E29E
    #E39E
    #E49E
    
    #F4B5  ;u
    #F5B5
    #F6B5
    #F7B5

    #E550  ;A
    #E650
    #E750
    #E850
    #E950
    
    #EA54  ;E
    #EB54
    #FA54

    #FB58  ;I

    #E55E  ;O
    #E65E
    #E75E
    #E85E
    #E95E

--    #F875  ;U
--    #F975
]
