
------------------------------------
?INCLUDE 'dm47_sam'
------------------------------------

code_05D2BB {
    COP [BF] ( &widestring_05D48E )
    COP [BE] ( #02, #01, &shortcut_options )
    RTL 
}

shortcut_options [
    &shortcut_cancel
    &shortcut_cancel
    &shortcut_accept
]

shortcut_cancel {
    COP [BF] ( &shortcut_cancel_str )
    RTL
}

shortcut_accept {
    COP [BF] ( &shortcut_accept_str )
    LDA #$0000
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$0334, #$0334, #00, #0B )
    COP [26] ( #39, #$0048, #$01C0, #00, #$2210 )
    RTL 
}

widestring_05D48E `[TPL:5][TPL:E][NAM:A]: Hey, I know of a[N]secret passage that will[N]take you to [NAM:12][FIN]Take the shortcut?[N][PAL:0] Stay[N] Go to [NAM:12][PAL:4]`

shortcut_cancel_str `[CLR]I won't forget you for my[N]entire life. Be careful[N]out there.[END]`
shortcut_accept_str `[CLR]Alright, stay close to me[N]and we'll be there in no[N]time.[END]`