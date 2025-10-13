

!scene_current                  0644
!joypad_mask_std                065A
!player_flags                   09AE
!INIDISP                        2100
!VMADDL                         2116
!_TM                            212C

------------------------------------------------
?INCLUDE 'system_strings'
------------------------------------------------
asciistring_01DA47 |[NHM:4][CUR:90,3]PUSH START BUTTON|
asciistring_01DA5E |[NHM:0][CUR:D4,2]RETRANSLATED[NHM:0][CUR:08,6](C) 1994  QUINTET/ENIX[CUR:48,6]MARIKO OHARA/MOTO HAGIO[CUR:8E,6]YASUHIRO KAWASAKI|

------------------------------------------------
?INCLUDE 'scene_meta'
------------------------------------------------

entry_FC [
  ppu < #25 >
  music < #1F, #00, @bgm_illusion_of_gaia >
  bitmap < #00, #20, #00, @gfx_title, #00 >
  palette < #00, #80, #00, @pal_title >
  tileset < #00, #20, #00, #03, @set_title >
  tilemap < #01, @map_title_main >
  tilemap < #02, @map_title_effect >
  bitmap < #00, #10, #10, @gfx_title_actors, #01 >
  palette < #00, #60, #A0, @pal_title_actors >
  spritemap < #$0254, #00, @spm_title_actors >
]

------------------------------------------------
?INCLUDE 'scene_thinkers'
------------------------------------------------

thinker_0CEB2F [
  thinker < #74, @thinker_00B520 >
  thinker < #00, @thinker_00BCDF >
  thinker < #00, @thinker_00BCB3 >
  thinker < #24, @parallax_thinker >
  ;thinker < #00, @thinker_00BC91 >
]



------------------------------------------------
?INCLUDE 'sFC_actor_0BC924'
------------------------------------------------

e_sFC_actor_0BC924 {
    LDA #$4001
    TSB $09EC
    LDA #$0000
    STA $7F0A00
    COP [50] ( @pal_title, #00, #00, #08 )
    COP [50] ( @palette_1E1D35, #00, #00, #08 )
    COP [A0] ( @code_0BC933, #$0060, #$00B6, #$1800 )
    COP [A0] ( @code_0BC945, #$0080, #$00B6, #$1800 )
    COP [A0] ( @code_0BC957, #$00A0, #$00B6, #$1800 )
    SEP #$20
    LDA #$17
    STA $_TM
    REP #$20
    COP [BD] ( @asciistring_01DA5E )
    COP [BD] ( @asciistring_01DA47 )
    COP [DB] ( #$0B7B )
    COP [CC] ( #F4 )
    LDA #$0804
    STA $064A
    COP [26] ( #8C, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}


code_0BC933 {
    COP [B6] ( #30 )
    COP [9C] ( @code_0BC969, #$1000 )
    COP [C1]
    COP [80] ( #00 )
    COP [89]
    RTL 
}


code_0BC945 {
    COP [B6] ( #30 )
    COP [9C] ( @code_0BC969, #$1000 )
    COP [C1]
    COP [80] ( #01 )
    COP [89]
    RTL 
}


code_0BC957 {
    COP [B6] ( #30 )
    COP [9C] ( @code_0BC969, #$1000 )
    COP [C1]
    COP [80] ( #02 )
    COP [89]
    RTL 
}


code_0BC969 {
    COP [B7] ( #0A )
    COP [B6] ( #30 )
    COP [C1]
    COP [80] ( #03 )
    COP [89]
    RTL 
}


------------------------------------------------
?INCLUDE 'sFC_actor_0BC9AE'
------------------------------------------------
;Immediate start press

e_sFC_actor_0BC9AE {
    BRA e_sFC_actor_0BC9BD
}


