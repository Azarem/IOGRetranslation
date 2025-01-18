?BANK 0A


--------------------------------------------

h_actor < #02, #00, #10 >

--------------------------------------------

frejia_deliveryman_main {
    COP [D0] ( #8D, #00, &frejia_deliveryman_destroy )
    COP [C0] ( &frejia_deliveryman_interact )
    COP [0B]
    COP [C1]
    RTL

  frejia_deliveryman_destroy:
    COP [E0]

  frejia_deliveryman_interact:
    COP [BF] ( &frejia_deliveryman_str_intro )
    COP [BE] ( #03, #01, &frejia_deliveryman_options )
    
  frejia_deliveryman_options [
    &frejia_deliveryman_cancel
    &frejia_deliveryman_cancel
    &frejia_deliveryman_watermia
    &frejia_deliveryman_south_cape
  ]

  frejia_deliveryman_cancel:
    COP [BF] ( &frejia_deliveryman_str_cancel )
    RTL

  frejia_deliveryman_watermia:
    COP [BF] ( &frejia_deliveryman_str_watermia )
    LDA #$000D
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$0254, #$02D4, #00, #29 )
    COP [26] ( #78, #$0160, #$0268, #07, #$4500 )
    RTL 
    
  frejia_deliveryman_south_cape:
    COP [BF] ( &frejia_deliveryman_str_south_cape )
    LDA #$000D
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$0254, #$02D4, #00, #2B )
    COP [26] ( #01, #$00F0, #$02E0, #03, #$4300 )
    RTL 
}

frejia_deliveryman_str_intro      `[TPL:16][TPL:E]I'm the Sky Delivery man.[N]My tame birds can fly you[N]to distant places. [FIN][TPL:F]Where do you want to go?[N][PAL:0] Stay Here[N] Watermia[N] South Cape[PAL:4]`
frejia_deliveryman_str_cancel     `[CLR]Alright. Come back if you[N]change your mind.[END]`
frejia_deliveryman_str_watermia   `[CLR]Come here, birds.[N]We're taking this person[N]to Watermia![END]`
frejia_deliveryman_str_south_cape `[CLR]Come here, birds.[N]We're taking this person[N]to South Cape![END]`
