?BANK 02

!joypad_mask_std                065A
!VMADDL                         2116
!MDMAEN                         420B
!DMAP0                          4300
!BBAD0                          4301
!A1T0L                          4302
!A1B0                           4304
!DAS0L                          4305

------------------------------------
?INCLUDE 'dc2F_adrift'
------------------------------------

code_059B3B {
    LDA #$4001
    TSB $09EC
    LDA #$EFF0
    TSB $joypad_mask_std

    LDA #$6000
    STA $VMADDL
    LDA #$&gfx_credits_font+2
    STA $A1T0L
    LDA #$2000
    STA $DAS0L
    SEP #$20
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA #$^gfx_credits_font
    STA $A1B0
    LDA #$01
    STA $MDMAEN
    REP #$20

    COP [3C] ( @code_059BAF )
    TXA 
    TYX 
    TAY 
    LDA $7F000E, X
    ORA #$0800
    STA $7F000E, X
    TXA 
    TYX 
    TAY 
    COP [25] ( #06, #0A )
    COP [80] ( #13 )
    COP [89]
    COP [DA] ( #01 )
    COP [BF] ( &widestring_059D15 )
    COP [BF] ( &widestring_05A467 )
    COP [DA] ( #EF )
    COP [BF] ( &widestring_05A5AB )
    LDA #$0800
    TSB $10
    COP [8D] ( #17 )
    COP [AA] ( #13 )
    COP [CF] ( #$0120 )
    LDA #$0000
    STA $0682
    COP [CE] ( #52 )
    INC $0AA6
    LDA #$0408
    STA $064A
    COP [26] ( #2F, #$0070, #$00A0, #03, #$1100 )
    COP [C1]
    COP [89]
    COP [80] ( #13 )
    COP [89]
    COP [C1]
    RTL 
}

code_059BB7 {

    LDA #$6000
    STA $VMADDL
    LDA #$&gfx_fonts+2
    STA $A1T0L
    LDA #$2000
    STA $DAS0L
    SEP #$20
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA #$^gfx_fonts
    STA $A1B0
    LDA #$01
    STA $MDMAEN
    REP #$20

    COP [25] ( #08, #0B )
    COP [80] ( #12 )
    COP [89]
    COP [DA] ( #01 )
    COP [BF] ( &widestring_059D24 )
    COP [C0] ( &code_059C2E )
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [A0] ( @code_059C44, #$0118, #$0088, #$1800 )
    COP [CA] ( #02 )
    COP [DA] ( #59 )
    COP [A0] ( @code_059C5D, #$FFE8, #$00D8, #$1800 )
    COP [CB]
    COP [DA] ( #3B )
    COP [04] ( #06 )
    COP [BF] ( &widestring_05A6EA )
    COP [D2] ( #02, #01 )
    COP [C3] ( @code_059C04, #$04B0 )
}