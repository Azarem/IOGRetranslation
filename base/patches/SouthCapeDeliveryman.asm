?BANK 0A


--------------------------------------------
h_actor < #42, #00, #10 >
--------------------------------------------

skyd_main {
    COP [D0] ( #8D, #00, &skyd_destroy )
    COP [C0] ( &skyd_interact )
    COP [0B]
    COP [C1]
    RTL

  skyd_destroy:
    COP [E0]

  skyd_interact:
    COP [BF] ( &skyd_str_intro )
    COP [BE] ( #03, #01, &skyd_options )
    
  skyd_options [
    &skyd_cancel
    &skyd_cancel
    &skyd_watermia
    &skyd_freejia
  ]

  skyd_cancel:
    COP [BF] ( &skyd_str_cancel )
    RTL

  skyd_watermia:
    COP [BF] ( &skyd_str_watermia )
    LDA #$000D
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$00D4, #$03A4, #00, #23 )
    COP [26] ( #78, #$0160, #$0268, #07, #$4500 )
    RTL 
    
  skyd_freejia:
    COP [BF] ( &skyd_str_freejia )
    LDA #$000D
    STA $0D60
    LDA #$0404
    STA $064A
    COP [65] ( #$00D4, #$03A4, #00, #2A )
    COP [26] ( #32, #$0160, #$01D0, #07, #$4500 )
    RTL 
}

skyd_str_intro    `[TPL:16][TPL:E]I'm the Sky Delivery man.[N]My tame birds can fly you[N]to distant places. [FIN][TPL:F]Where do you want to go?[N][PAL:0] Stay Here[N] Watermia[N] [NAM:12][PAL:4]`
skyd_str_cancel   `[CLR]Alright. Come back if you[N]change your mind.[END]`
skyd_str_watermia `[CLR]Come here, birds.[N]We're taking this person[N]to Watermia![END]`
skyd_str_freejia  `[CLR]Come here, birds.[N]We're taking this person[N]to [NAM:12]![END]`

-----------------------------------------------
?INCLUDE 'scene_meta'
-----------------------------------------------

entry_01 [
  ppu < #03 >   ;00
  music < #1C, #00, @bgm_lively_city_by_the_sea >   ;01
  bitmap < #00, #10, #00, @gfx_sc01_ext_main, #00 >   ;02
  bitmap < #00, #10, #10, @gfx_sc01_ext_effect, #00 >   ;03
  palette < #00, #70, #10, @palette_1E2C33 >   ;04
  tileset < #00, #20, #00, #01, @set_sc01_ext >   ;05
  tileset < #00, #20, #00, #02, @set_sc01_effect_misc >   ;06
  tilemap < #01, @map_sc01_main >   ;07
  tilemap < #02, @map_sc01_effect >   ;08
  label < #3E >   ;09
  bitmap < #00, #10, #10, @gfx_sc01_actors, #01 >   ;0A
  palette < #20, #80, #A0, @pal_sc01_actors >   ;0B
  spritemap < #$18B5, #00, @spm_sc01_actors >   ;0C
]

