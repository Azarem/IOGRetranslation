?INCLUDE 'sFA_diary_menu'
?INCLUDE 'chunk_028000'
?INCLUDE 'chunk_03BAE1'

!APUIO0                         2140

---------------------------------------------

name_dictionary_jp [
    &name_will_jp               ;00
    &name_kara_jp               ;01
    &name_lily_jp               ;02
    &name_erik_jp               ;03
    &name_lance_jp              ;04
    &name_seth_jp               ;05
    &name_lola_jp               ;06
    &name_hamlet_jp             ;07
    &name_shira_jp              ;08
    &name_olman_jp              ;09
    &name_sam_jp                ;0A
    &name_remus_jp              ;0B
    &name_imas_jp               ;0C
    &name_mystic_jp             ;0D
    &name_statue_jp             ;0E
    &name_area_of_darkness_jp   ;0F
    &name_friar_jp              ;10
    &name_freedan_jp            ;11
    &name_freesia_jp            ;12
    &name_euro_jp               ;13
    &name_ramu_jp               ;14
    &name_krook_jp              ;15
]

name_will_jp                `Tim`
name_kara_jp                `Karen`
name_lily_jp                `Lillie`
name_erik_jp                `Eric`
name_lance_jp               `Rob`
name_seth_jp                `Morris`
name_lola_jp                `Laura`
name_hamlet_jp              `Peggy`
name_shira_jp               `Sheila`
name_olman_jp               `Allman`
name_sam_jp                 `Samus`
name_remus_jp               `Remus`
name_imas_jp                `Imus`
name_mystic_jp              `Estátua`
name_statue_jp              `Mística`
name_area_of_darkness_jp    `Espaço Escuro`
name_friar_jp               `Orbe`
name_freedan_jp             `Friedan`
name_freesia_jp             `Freesia`
name_euro_jp                `Metropolis`
name_ramu_jp                `Ra Mu`
name_krook_jp               `Kruk`

---------------------------------------------

name_dictionary_command {
    PHP 
    PHB 
    PHY 
    LDA $0000, Y
    AND #$00FF
    ASL 
    TAY 

    SEP #$20
    LDA #$^name_dictionary_jp
    PHA 
    PLB 
    REP #$20
    LDA $&name_dictionary_jp, Y

    TAY 
    STX $0998
    JSL $@sub_03E255
    LDX $0998
    PLY 
    INY 
    PLB 
    PLP 
    RTL
}

---------------------------------------------
;Always use stereo sound, frees up the flag for dictionaries

sub_0BE673 {
    LDA #$0000
    STA $0B04
    STZ $00EE
    SEP #$20
    LDA #$91
    STA $APUIO0
    REP #$20
    BRA loc_0BE695
}

----------------------------------------------
;Account for name size on scene title

loc_02A197 {
    CMP #$D6
    BEQ loc_02A1A9
    CMP #$D7
    BEQ loc_02A1BE
    CMP #$DA
    BEQ calc_name_size
    INY 
    BRA loc_02A17E
}

loc_02A1A7 {
    PLP 
    RTS 

  calc_name_size:
    INY
    PHB
    PHY

    LDA #$^name_dictionary_jp
    PHA
    PLB
    REP #$20
    LDA [$3E], Y
    AND #$00FF
    ASL 
    CLC 
    ADC #$&name_dictionary_jp
    BRA loc_02A1D1
}

loc_02A1E4 {
    PLY 
    PLB 
    INY 
    JMP loc_02A17E
}