
!joypad_mask_std                065A
!_TM                            212C
!_TS                            212D
!CGWSEL                         2130
!CGADSUB                        2131

------------------------------------
?INCLUDE 's89_new_babel'
------------------------------------
;Do not change the blending modes for this scene (89)

e_s89_new_babel {
    LDA #$FFF0
    TSB $joypad_mask_std
    LDA #$4001
    TSB $09EC
    ;SEP #$20   
    ;LDA #$11
    ;STA $_TM
    ;LDA #$04
    ;STA $_TS
    ;LDA #$82
    ;STA $CGWSEL
    ;LDA #$01
    ;STA $CGADSUB
    ;REP #$20
    COP [DB] ( #$00EF )
    COP [BF] ( &widestring_0BE075 )
    COP [DB] ( #$01DF )
    COP [05] ( #14 )
    COP [DA] ( #B3 )
    LDA #$0404
    STA $064A
    COP [26] ( #F7, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}

------------------------------------
?INCLUDE 'scene_meta'
------------------------------------

;Make the map scene load original fonts for BG3
entry_90 [
  ppu < #1D >   ;00
  bitmap < #00, #20, #00, @gfx_ending_world, #00 >   ;01
  bitmap < #00, #20, #00, @gfx_fonts, #02 >   ;02
  palette < #00, #80, #00, @pal_ending_world >   ;02
  tileset < #00, #20, #00, #01, @set_ending_world >   ;03
  tileset < #00, #20, #00, #02, @set_ending_world_effect >   ;04
  tilemap < #01, @map_ending_world >   ;05
  tilemap < #02, @map_ending_world_effect >   ;06
]

;Make the comet scene load the credits font (no borders)
entry_E5 [
  ppu < #25 >   ;00
  music < #0E, #00, @bgm_longing_for_the_past >   ;01
  bitmap < #00, #20, #00, @gfx_ending_comet, #00 >   ;02
  bitmap < #00, #20, #00, @gfx_credits_font, #02 >   ;02
  palette < #00, #80, #00, @pal_ending_comet >   ;03
  tileset < #00, #20, #00, #03, @set_ending_comet >   ;04
  tilemap < #01, @map_ending_comet >   ;05
  tilemap < #02, @map_ending_comet_effect >   ;06
  jump < #22 >   ;07
]