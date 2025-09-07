?BANK 09

!joypad_mask_std                065A
!BG3SC                          2109
!W12SEL                         2123
!_TM                            212C
!_TS                            212D
!CGWSEL                         2130
!CGADSUB                        2131
!COLDATA                        2132

ext_credits_0  `[PAL:0][DLG:4C,1]   Retranslation[N][N]      Credits[END]`
ext_credits_1  `[PAL:0][DLG:4C,1]   Tools and ASM[N][N][PAL:8]      Kassiven[END]`
ext_credits_2  `[PAL:0][DLG:4C,1] Base Translation[N][N][PAL:8]     L. Thammy[END]`
ext_credits_3  `[PAL:0][DLG:4C,1]     Revisions[N][N][PAL:8]  ViewtifulSlayer[END]`
ext_credits_4  `[PAL:0][DLG:4C,1]      Graphics[N][N][PAL:8]     Azure Mage[END]`
ext_credits_5  `[PAL:0][DLG:4C,1] GaiaLabs Boot Logo[N][N][PAL:8]     andwhyisit[END]`

----------------------------------------------
?INCLUDE 'sF7_credits'
----------------------------------------------


code_09E9D8 {
    COP [69] ( #$01F4 )
    LDA #$&credits_09ECBF
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09ECE7
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09ED10
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09ED3C
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09ED68
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09ED96
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EDC3
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EDF1
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EE2D
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EE7D
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EEAA
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EEF7
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EF22
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EF75
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EFB1
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09EFFB
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F038
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F073
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F0B2
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F0F2
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F12C
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F18A
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F1C8
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F1F2
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F220
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F248
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F273
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F2A9
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&ext_credits_0
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&ext_credits_1
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&ext_credits_2
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&ext_credits_3
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&ext_credits_4
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&ext_credits_5
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    LDA #$&credits_09F2FA
    STA $26
    COP [C8] ( &code_09EB64 )
    COP [DA] ( #4A )
    SEP #$20
    LDA #$79
    STA $BG3SC
    REP #$20
    LDY #$&credits_09F315
    JSR $&sub_09EC23
    COP [4F] ( $7F0200, #$7800, #$0800 )
    SEP #$20
    LDA #$14
    ORA $09F6
    STA $_TM
    LDA #$00
    STA $_TS
    REP #$20
    COP [C1]
    RTL 
}

---------------------------------------------------------
;Override wait timer

code_09EBDB {
    COP [CB]
    COP [DB] ( #$01C5 )
    SEP #$20
    LDA #$7A
    STA $BG3SC
    REP #$20
    COP [CA] ( #80 )
    LDA $0720
    CLC 
    ADC #$0001
    STA $0720
    COP [CB]
    SEP #$20
    LDA #$10
    ORA $09F6
    STA $_TM
    REP #$20
    LDA #$0000
    STA $0720
    PHX 
    LDX #$0400
}

