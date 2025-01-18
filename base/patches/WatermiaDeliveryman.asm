

------------------------------------------
?INCLUDE 'wa78_men'
------------------------------------------


code_078569 {
    COP [BF] ( &widestring_0786C1 )
    COP [BE] ( #03, #01, &code_list_078573 )
}


code_list_078573 [
  &code_078579   ;00
  &code_078579   ;01
  &code_07857E   ;02
  &watermia_deliveryman_freejia
]

code_078579 {
    COP [BF] ( &widestring_078724 )
    RTL 
}


code_07857E {
    COP [BF] ( &widestring_078741 )
    LDA #$000D
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$02D4, #$01A4, #00, #22 )
    COP [26] ( #01, #$00F0, #$02E0, #03, #$4300 )
    RTL 
}

watermia_deliveryman_freejia {
    COP [BF] ( &watermia_freejia_str )
    LDA #$000D
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$02D4, #$01A4, #00, #28 )
    COP [26] ( #32, #$0160, #$01D0, #07, #$4500 )
    RTL 
}


widestring_0786C1       `[TPL:16][TPL:E]I'm the Sky Delivery man.[N]My tame birds can fly you[N]to distant places. [FIN][TPL:F]Where do you want to go?[N][PAL:0] Stay Here[N] South Cape[N] Freejia[PAL:4]`
widestring_078724       `[CLR]Alright. Come back if you[N]change your mind.[END]`
widestring_078741       `[CLR]Come here, birds.[N]We're taking this person[N]to South Cape![END]`
watermia_freejia_str    `[CLR]Come here, birds.[N]We're taking this person[N]to Freejia![END]`
