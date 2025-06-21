
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
  bitmap < #00, #20, #00, @bmp_16D82C, #00 >   ;01
  bitmap < #00, #20, #00, @gfx_fonts, #02 >   ;02
  palette < #00, #80, #00, @palette_1E1C35 >   ;02
  tileset < #00, #20, #00, #01, @set_1B640F >   ;03
  tileset < #00, #20, #00, #02, @set_1D2389 >   ;04
  tilemap < #01, @map_1D70AC >   ;05
  tilemap < #02, @map_1F37FC >   ;06
]

;Make the comet scene load the credits font (no borders)
entry_E5 [
  ppu < #25 >   ;00
  music < #0E, #00, @bgm_longing_for_the_past >   ;01
  bitmap < #00, #20, #00, @bmp_0D16E7, #00 >   ;02
  bitmap < #00, #20, #00, @gfx_credits_font, #02 >   ;02
  palette < #00, #80, #00, @palette_1E1D35 >   ;03
  tileset < #00, #20, #00, #03, @set_157ADC >   ;04
  tilemap < #01, @map_1F3021 >   ;05
  tilemap < #02, @map_17FF9E >   ;06
  jump < #22 >   ;07
]