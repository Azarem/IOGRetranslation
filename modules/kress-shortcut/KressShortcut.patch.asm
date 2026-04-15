
!player_flags                   09AE

h_actor < #00, #00, #10 >

kress_shortcut_main {
    LDA #$2000
    TSB $10
    COP [C1]
    COP [D1] ( #223, #01, &kress_shortcut_enable )
    RTL 
}

kress_shortcut_enable {
    LDA #$2000
    TRB $10
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [0B]
    COP [C0] ( &shortcut_interact )
    COP [C1]
    COP [C1]
    COP [89]
    RTL
}

shortcut_interact {
    COP [BF] ( &kress_shortcut_str )
    COP [BE] ( #02, #02, &kress_shortcut_options )
    RTL 
}

kress_shortcut_options [
    &kress_shortcut_cancel
    &kress_shortcut_cancel
    &kress_shortcut_accept
]

kress_shortcut_cancel {
    COP [BF] ( &kress_shortcut_cancel_str )
    RTL
}

kress_shortcut_accept {
    COP [BF] ( &kress_shortcut_accept_str )
    STZ $066D
    STZ $0670
    LDA #$0404
    STA $064A
    LDA #$0202
    STA $0648
    COP [26] ( #A0, #$02C8, #$01B0, #86, #$2300 )
    RTL
}

kress_shortcut_str `[TPL:17][TPL:F]Spirit: Whew, I'm[N]impressed you made it all[N]the way up here on your[N]own.[FIN]Would you like me to take[N]you to the bottom?[N][PAL:0] No[N] Yes[PAL:4]`

kress_shortcut_cancel_str `[CLD][TPL:17][TPL:D]Let me know if you change[N]your mind.[END]`
kress_shortcut_accept_str `[CLD][TPL:17][TPL:C]Close your eyes…[END]`

------------------------------
?INCLUDE 'scene_actors'
------------------------------
event_def_0CCA02 [
  event_def < [
    actor < #05, #0A, #02, @h_player_character >
    actor < #00, #00, #00, @h_actor_00EAED >
    actor < #DF, #DF, #00, @head_00E94D >
    actor < #03, #32, #00, @KressShortcut >
  ], `` >   ;00
]
