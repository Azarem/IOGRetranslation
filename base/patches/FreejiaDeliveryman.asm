?BANK 0A


--------------------------------------------
h_actor < #3A, #00, #10 >
--------------------------------------------

frejia_deliveryman_main {
    COP [D0] ( #8D, #00, &frejia_deliveryman_destroy )
    COP [50] ( @pal_sc01_actors, #70, #F0, #10 )
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

-------------------------------------------
?INCLUDE 'scene_meta'
-------------------------------------------

entry_32 [
  ppu < #0E >   ;00
  music < #02, #00, @bgm_lively_city >   ;01
  bitmap < #00, #10, #00, @gfx_fr32_ext_tiles, #00 >   ;02
  bitmap < #00, #10, #10, @gfx_fr32_ext_tiles, #00 >   ;03
  palette < #00, #70, #10, @pal_fr32_ext_tiles >   ;04
  tileset < #00, #20, #00, #01, @set_fr32_ext_main >   ;05
  tilemap < #01, @map_fr32_main >   ;06
  tileset < #00, #20, #00, #02, @set_fr32_ext_effect >   ;07
  tilemap < #02, @map_fr32_effect >   ;08
  label < #0C >   ;09
  bitmap < #00, #10, #10, @gfx_fr32_actors, #01 >   ;0A
  palette < #00, #60, #A0, @pal_fr32_actors >   ;0B
  spritemap < #$1352, #00, @spm_fr32_actors >   ;0C
]

entry_9D [
  ppu < #1F >   ;00
  music < #04, #00, @bgm_ominous_whispers >   ;01
  bitmap < #00, #10, #00, @gfx_fr33_int_main, #00 >   ;02
  palette < #00, #70, #10, @palette_1E50F3 >   ;03
  tileset < #00, #20, #00, #03, @set_1775A4 >   ;04
  tilemap < #01, @map_1D214D >   ;05
  tilemap < #02, @map_1E026F >   ;06
  bitmap < #00, #10, #10, @gfx_fr32_actors, #01 >   ;07
  palette < #00, #60, #A0, @pal_fr32_actors >   ;08
  spritemap < #$1352, #00, @spm_fr32_actors >   ;09
]