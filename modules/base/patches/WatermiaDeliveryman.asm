

--------------------------------------------
h_actor < #3A, #00, #10 >
--------------------------------------------

watermia_skyd_main {
    COP [C0] ( &watermia_skyd_interact )
    COP [0B]
    COP [C1]
    RTL
}

watermia_skyd_interact {
    COP [BF] ( &watermia_greeting_str )
    COP [BE] ( #03, #01, &watermia_skyd_options )
}

watermia_skyd_options [
  &watermia_skyd_cancel
  &watermia_skyd_cancel
  &watermia_skyd_south_cape
  &watermia_skyd_freejia
]

watermia_skyd_cancel {
    COP [BF] ( &watermia_cancel_str )
    RTL 
}

watermia_skyd_south_cape {
    COP [BF] ( &watermia_south_cape_str )
    LDA #$000D
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$02D4, #$01A4, #00, #22 )
    COP [26] ( #01, #$00F0, #$02E0, #03, #$4300 )
    RTL 
}

watermia_skyd_freejia {
    COP [BF] ( &watermia_freejia_str )
    LDA #$000D
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$02D4, #$01A4, #00, #28 )
    COP [26] ( #32, #$0160, #$01D0, #07, #$4500 )
    RTL 
}


watermia_greeting_str   `[TPL:16][TPL:E]I'm the Sky Delivery man.[N]My tame birds can fly you[N]to distant places. [FIN][TPL:F]Where do you want to go?[N][PAL:0] Stay Here[N] South Cape[N] [NAM:12][PAL:4]`
watermia_cancel_str     `[CLR]Alright. Come back if you[N]change your mind.[END]`
watermia_south_cape_str `[CLR]Come here, birds.[N]We're taking this person[N]to South Cape![END]`
watermia_freejia_str    `[CLR]Come here, birds.[N]We're taking this person[N]to [NAM:12]![END]`

--------------------------------------
?INCLUDE 'scene_meta'
--------------------------------------

entry_78 [
  ppu < #1A >   ;00
  music < #02, #00, @bgm_lively_city >   ;01
  bitmap < #00, #10, #00, @bmp_1DBD9F, #00 >   ;02
  branch < #96, #2A >   ;03
  palette < #00, #70, #10, @palette_1E4C93 >   ;04
  jump < #2B >   ;05
  label < #2A >   ;06
  palette < #00, #70, #10, @palette_1E4D73 >   ;07
  label < #2B >   ;08
  tileset < #00, #20, #00, #03, @set_184704 >   ;09
  tilemap < #01, @map_15118E >   ;0A
  bitmap < #00, #10, #10, @bmp_1DBD9F, #00 >   ;0B
  tilemap < #02, @map_1C44E4 >   ;0C
  label < #26 >   ;0D
  bitmap < #00, #10, #10, @gfx_wa78_actors, #01 >   ;0E
  palette < #00, #60, #A0, @pal_wa78_actors >   ;0F
  spritemap < #$1886, #00, @spm_wa78_actors >   ;10
]
