
?INCLUDE 'awBF_spirit_guide'

!joypad_mask_std                065A

code_089B1F {
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [DA] ( #F0 )
    COP [BF] ( &angkor_shortcut_str )
    COP [BE] ( #02, #02, &angkor_shortcut_options )
    RTL
}

angkor_shortcut_main {

}

angkor_shortcut_options [
    &angkor_shortcut_cancel
    &angkor_shortcut_cancel
    &angkor_shortcut_accept
]

angkor_shortcut_cancel {
    COP [E0]
    RTL
}

angkor_shortcut_accept {
    COP [BF] ( &angkor_shortcut_accept_str )
    STZ $066D
    STZ $0670
    LDA #$0404
    STA $064A
    LDA #$0202
    STA $0648
    COP [26] ( #B0, #$01F8, #$04C0, #80, #$5400 )
    RTL
}

angkor_shortcut_str `[TPL:17][TPL:C]A voice whispers…[FIN][TPL:F]It's a long way back…[N]Let me take you there…[N][PAL:0] No[N] Yes[PAL:4]`
angkor_shortcut_accept_str `[CLD][TPL:17][TPL:C]Close your eyes…[END]`
