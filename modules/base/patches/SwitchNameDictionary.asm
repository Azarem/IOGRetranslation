?INCLUDE 'sFA_diary_menu'
?INCLUDE 'chunk_028000'
?INCLUDE 'chunk_03BAE1'

!APUIO0                         2140

---------------------------------------------

name_dictionary_en [
    &name_will_en         ;00
    &name_kara_en         ;01
    &name_lily_en         ;02
    &name_erik_en         ;03
    &name_lance_en        ;04
    &name_seth_en         ;05
    &name_lola_en         ;06
    &name_hamlet_en       ;07
    &name_shira_en        ;08
    &name_olman_en        ;09
    &name_sam_en          ;0A
    &name_remus_en        ;0B
    &name_imas_en         ;0C
    &name_mystic_en       ;0D
    &name_statue_en       ;0E
    &name_dark_space_en   ;0F
    &name_friar_en        ;10
    &name_freedan_en      ;11
    &name_freejia_en      ;12
    &name_euro_en         ;13
    &name_rama_en         ;14
    &name_kruk_en         ;15
    &name_jackal_en       ;16
]

name_will_en          `Will`
name_kara_en          `Kara`
name_lily_en          `Lilly`
name_erik_en          `Erik`
name_lance_en         `Lance`
name_seth_en          `Seth`
name_lola_en          `Lola`
name_hamlet_en        `Hamlet`
name_shira_en         `Shira`
name_olman_en         `Olman`
name_sam_en           `Sam`
name_remus_en         `Remus`
name_imas_en          `Imas`
name_mystic_en        `Mystic`
name_statue_en        `Statue`
name_dark_space_en    `Dark Space`
name_friar_en         `Friar`
name_freedan_en       `Freedan`
name_freejia_en       `Freejia`
name_euro_en          `City of`
name_rama_en          `Rama`
name_kruk_en          `Kruk`
name_jackal_en        `Jackal`

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
    &name_jackal_jp             ;16
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
name_sam_jp                 `Sahmuus`
name_remus_jp               `Rehmuus`
name_imas_jp                `Ihmuus`
name_mystic_jp              `Mystery`
name_statue_jp              `Doll`
name_area_of_darkness_jp    `Area of Darkness`
name_friar_jp               `Fryer`
name_freedan_jp             `Friedan`
name_freesia_jp             `Freesia`
name_euro_jp                `Metropolis`
name_ramu_jp                `Ra Mu`
name_krook_jp               `Krook`
name_jackal_jp              `Black Panther`

---------------------------------------------

name_dictionary_command {
    PHP 
    PHB 
    PHY 
    LDA $0000, Y
    AND #$00FF
    ASL 
    TAY 

    LDA $0B24
    BNE do_en_name

  do_jp_name:
    SEP #$20
    LDA #$^name_dictionary_jp
    PHA 
    PLB 
    REP #$20
    LDA $&name_dictionary_jp, Y
    BRA do_name_end

  do_en_name:
    SEP #$20
    LDA #$^name_dictionary_en
    PHA 
    PLB 
    REP #$20
    LDA $&name_dictionary_en, Y

  do_name_end:
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

widestring_0BF3F4 `[DLG:6,A][SIZ:A,4]Start Journey[N]Erase Trip Diary[N]Copy Trip Diary[N]Change Options`

widestring_0BF476 `[DLG:2,8][SIZ:E,7]Change Options[N][JMP:&widestring_0BF437+M]`

widestring_0BF538 `[DLG:6,8][SIZ:A,8][SKP:2]Change Options[N]End Changes[N]Names[N][LU2:2]Type[N][SKP:5]   :Attack/Talk[N][SKP:5]   :Item/Cancel[N][SKP:5]   :Item Menu[N][SKP:5]   :Sprint`

widestring_0BF5AD `[DLG:6,8][SIZ:A,8]Arrangement  OK?[N]Start Journey[N]Names[N][LU2:2]Type[N][SKP:5]   :Attack/Talk[N][SKP:5]   :Item/Cancel[N][SKP:5]   :Item Menu[N][SKP:5]   :Sprint`

widestring_0BF625 `[DLG:D,C][SFX:0][ADR:&table_0BF667,D90]`

widestring_0BF66B `Japanese`

widestring_0BF672 `English `


---------------------------------------------
;Always use stereo sound, frees up the flag for dictionaries

sub_0BE673 {
    LDA #$0000
    STA $0B04
    STZ $00EE
    ;LDA $0B24
    ;BNE code_0BE68C
    SEP #$20
    LDA #$91
    STA $APUIO0
    REP #$20
    BRA code_0BE695
}

----------------------------------------------
;Account for name size on scene title

code_02A197 {
    CMP #$D6
    BEQ code_02A1A9
    CMP #$D7
    BEQ code_02A1BE
    CMP #$DA
    BEQ calc_name_size
    INY 
    BRA code_02A17E
}

code_02A1A7 {
    PLP 
    RTS 

  calc_name_size:
    INY
    PHB
    PHY

    LDA $0B24
    BNE do_en_size

    LDA #$^name_dictionary_jp
    PHA
    PLB
    REP #$20
    LDA [$3E], Y
    AND #$00FF
    ASL 
    CLC 
    ADC #$&name_dictionary_jp
    BRA code_02A1D1

  do_en_size:
    LDA #$^name_dictionary_en
    PHA
    PLB
    REP #$20
    LDA [$3E], Y
    AND #$00FF
    ASL 
    CLC 
    ADC #$&name_dictionary_en
    BRA code_02A1D1
}

code_02A1E4 {
    PLY 
    PLB 
    INY 
    JMP code_02A17E
}