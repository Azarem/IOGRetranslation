

!scene_current                  0644
!joypad_mask_std                065A
!player_flags                   09AE
!INIDISP                        2100
!VMADDL                         2116
!_TM                            212C

------------------------------------------------
?INCLUDE 'system_strings'
------------------------------------------------
consolestring_01DA47! |[NHM:4][CUR:50,4]PUSH START BUTTON|
;string_01DA5E |[NHM:4][CUR:55,3]RETRANSLATED|
consolestring_01DA5E! |[NHM:0][CUR:9C,3]RETRANSLATED[NHM:0][CUR:08,6](C) 1994  QUINTET/ENIX[CUR:48,6]MARIKO OHARA/MOTO HAGIO[CUR:8E,6]YASUHIRO KAWASAKI|

------------------------------------------------
?INCLUDE 'scene_meta'
------------------------------------------------

scene_meta_00FC! [
  display-mode < #25 >
  music < #1F, #00, @bgm_illusion_of_gaia >
  bitmap < #00, #20, #00, @gfx_title, #00 >
  palette < #00, #80, #00, @pal_title >
  tileset < #00, #20, #00, #03, @set_title >
  tilemap < #01, @map_title >
  tilemap < #02, @map_title_effect >
  bitmap < #00, #10, #10, @gfx_title_actors, #01 >
  palette < #00, #60, #A0, @pal_title_actors >
  spritemap < #$04F4, #00, @spm_title_actors >
]

------------------------------------------------
?INCLUDE 'scene_thinkers'
------------------------------------------------

thinker_spawn_0CEB2F+ [
  thinker-spawn < #74, @ambient_palette_cycler >
  thinker-spawn < #00, @ending_comet_dma_setup >
  thinker-spawn < #00, @ending_comet_sine_hdma >
  thinker-spawn < #24, @parallax_thinker >
]

------------------------------------------------
?INCLUDE 'sFC_actor_0BC924'
------------------------------------------------

TitleIntroInit! {
    LDA #$4001
    TSB $09EC
    LDA #$0000
    STA $7F0A00
    COP [50] ( @pal_title, #00, #00, #08 )
    COP [50] ( @pal_ending_comet, #00, #00, #08 )
    COP [A0] ( @code_0BC933, #$0060, #$00B6, #$1800 )
    COP [A0] ( @code_0BC945, #$0080, #$00B6, #$1800 )
    COP [A0] ( @code_0BC957, #$00A0, #$00B6, #$1800 )
    COP [A0] ( @code_0BC988, #$0080, #$0048, #$1800 )
    COP [A0] ( @title_sprite, #$0080, #$0048, #$2000 )
    SEP #$20
    LDA #$17
    STA $_TM
    REP #$20
    LDA #$0804
    STA $064A
    COP [DA] ( #B3 )
    COP [BD] ( @consolestring_01DA5E )
    COP [DA] ( #77 )
    COP [BD] ( @consolestring_01DA47 )
    COP [DB] ( #$09D3 )
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

code_0BC988! {
    COP [B6] ( #20 )
    COP [84] ( #04, #F0 )
    COP [8A]
    COP [85] ( #04, #3A, #02 )
    COP [8A]
    COP [DA] ( #3B )
    ;SEP #$20    
    ;LDA #$16
    ;STA $_TM
    ;REP #$20
    COP [C1]
    ;COP [80] ( #04 )
    ;COP [89]
    RTL 
}

title_sprite {
    COP [80] ( #05 )
    COP [DA] ( #A8 )
    LDA #$0000
    STA $7F0BC2
    STA $7F0BC4
    STA $7F0BC6
    STA $7F0BC8
    STA $7F0BCA
    STA $7F0BCC
    STA $7F0BCE
    STA $7F0BD0
    STA $7F0BD2
    STA $7F0BD4
    STA $7F0BD6
    STA $7F0BD8
    STA $7F0BDA
    STA $7F0BDC
    STA $7F0BDE
    COP [B6] ( #30 )
    LDA #$1800
    STA $10
    COP [3C] ( @title_thinker )
    COP [C1]
    COP [80] ( #05 )
    COP [89]
    RTL 
}

title_thinker {
    COP [37] ( #80 )
    COP [39]
    COP [3D]
    RTL 
}

------------------------------------------------
?INCLUDE 'sFC_actor_0BC9AE'
------------------------------------------------
;Immediate start press

TitleStartDelayedInit! {
    BRA TitleStartPollInit
}

------------------------------------------------
?INCLUDE 'palette_bundles'
------------------------------------------------

palette_bundles+ [
  &panim01062747
]

panim01062747 [
  palette-bundle < #01, &panim01062747_frame00, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame01, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame02, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame03, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame04, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame05, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame06, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame07, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame08, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame09, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame0A, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame0B, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame0C, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame0D, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame0E, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame0F, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame10, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame11, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame12, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame13, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame14, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame15, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame16, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame17, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame18, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame19, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame1A, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame1B, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame1C, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame1D, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame1E, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame1F, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame20, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame21, #E1, #1D, #00 >
  palette-bundle < #01, &panim01062747_frame22, #E1, #1D, #00 >
]

panim01062747_frame00 [
  #$0000
  #$0000
  #$0001
  #$0001
  #$0000
  #$0000
  #$0000
  #$0021
  #$0000
  #$0021
  #$0001
  #$0021
  #$0000
  #$0021
  #$0421
]

panim01062747_frame01 [
  #$0001
  #$0021
  #$0022
  #$0022
  #$0001
  #$0000
  #$0001
  #$0042
  #$0000
  #$0442
  #$0022
  #$0442
  #$0000
  #$0442
  #$0842
]

panim01062747_frame02 [
  #$0022
  #$0022
  #$0043
  #$0022
  #$0021
  #$0001
  #$0001
  #$0463
  #$0000
  #$0464
  #$0043
  #$0864
  #$0000
  #$0863
  #$0C84
]

panim01062747_frame03 [
  #$0022
  #$0043
  #$0464
  #$0043
  #$0022
  #$0021
  #$0022
  #$0484
  #$0001
  #$0885
  #$0464
  #$0CA5
  #$0000
  #$0884
  #$10A5
]

panim01062747_frame04 [
  #$0043
  #$0064
  #$0465
  #$0064
  #$0042
  #$0022
  #$0022
  #$0485
  #$0021
  #$08A6
  #$0484
  #$10C6
  #$0421
  #$0C85
  #$14C6
]

panim01062747_frame05 [
  #$0044
  #$0064
  #$0486
  #$0065
  #$0043
  #$0022
  #$0022
  #$08A7
  #$0021
  #$08E7
  #$0485
  #$10E7
  #$0421
  #$10A6
  #$18E8
]

panim01062747_frame06 [
  #$0064
  #$0485
  #$04A7
  #$0486
  #$0043
  #$0022
  #$0043
  #$08C8
  #$0422
  #$0D08
  #$08A6
  #$1509
  #$0421
  #$10C7
  #$1D29
]

panim01062747_frame07 [
  #$0065
  #$0486
  #$04A8
  #$0487
  #$0064
  #$0023
  #$0043
  #$08E9
  #$0422
  #$0D29
  #$08C7
  #$192A
  #$0421
  #$14E8
  #$214A
]

panim01062747_frame08 [
  #$0065
  #$04A6
  #$08C9
  #$04A8
  #$0064
  #$0043
  #$0044
  #$090A
  #$0422
  #$114B
  #$08C8
  #$194B
  #$0421
  #$1509
  #$256B
]

panim01062747_frame09 [
  #$0086
  #$04A7
  #$08CA
  #$04A8
  #$0065
  #$0043
  #$0044
  #$0D2B
  #$0422
  #$116C
  #$08E9
  #$1D6C
  #$0421
  #$192A
  #$298C
]

panim01062747_frame0A [
  #$0487
  #$04C8
  #$08EB
  #$04C9
  #$0085
  #$0444
  #$0065
  #$0D4C
  #$0443
  #$158D
  #$0D0A
  #$218D
  #$0842
  #$1D4B
  #$2DAE
]

panim01062747_frame0B [
  #$0487
  #$04C8
  #$090B
  #$04CA
  #$0085
  #$0444
  #$0065
  #$0D4C
  #$0443
  #$158E
  #$0D0A
  #$21AE
  #$0842
  #$1D4C
  #$31CF
]

panim01062747_frame0C [
  #$04A8
  #$04C9
  #$090C
  #$04CA
  #$0086
  #$0444
  #$0065
  #$116D
  #$0443
  #$15AE
  #$0D2B
  #$25CF
  #$0842
  #$216D
  #$35F0
]

panim01062747_frame0D [
  #$04A8
  #$04E9
  #$0D2D
  #$04EB
  #$0086
  #$0464
  #$0066
  #$118E
  #$0443
  #$19CF
  #$0D2C
  #$25F0
  #$0842
  #$218E
  #$3A11
]

panim01062747_frame0E [
  #$04A9
  #$04EA
  #$0D2E
  #$04EC
  #$00A7
  #$0465
  #$0066
  #$118F
  #$0443
  #$19F0
  #$0D4C
  #$2A11
  #$0842
  #$258E
  #$3A32
]

panim01062747_frame0F [
  #$04C9
  #$090A
  #$0D4E
  #$090C
  #$00A7
  #$0465
  #$0086
  #$11B0
  #$0844
  #$1A11
  #$114D
  #$2A12
  #$0842
  #$25AF
  #$3E52
]

panim01062747_frame10 [
  #$04C9
  #$090B
  #$0D4F
  #$090D
  #$00A7
  #$0465
  #$0087
  #$11D0
  #$0844
  #$1E12
  #$116E
  #$2E33
  #$0842
  #$25D0
  #$4273
]

panim01062747_frame11 [
  #$04CA
  #$090B
  #$0D70
  #$090D
  #$00A8
  #$0465
  #$0087
  #$15D1
  #$0844
  #$1E33
  #$116E
  #$2E53
  #$0842
  #$29D0
  #$4274
]

panim01062747_frame12 [
  #$04CA
  #$092C
  #$0D70
  #$092E
  #$00C8
  #$0466
  #$0087
  #$15F2
  #$0864
  #$1E53
  #$118F
  #$3274
  #$0C63
  #$29F1
  #$4695
]

panim01062747_frame13 [
  #$04EB
  #$092C
  #$0D71
  #$092F
  #$00C8
  #$0466
  #$0087
  #$15F2
  #$0864
  #$1E54
  #$118F
  #$3275
  #$0C63
  #$2DF2
  #$4AB6
]

panim01062747_frame14 [
  #$04EB
  #$092D
  #$1191
  #$092F
  #$00C8
  #$0486
  #$0088
  #$1613
  #$0864
  #$2275
  #$11B0
  #$3696
  #$0C63
  #$2E12
  #$4AD6
]

panim01062747_frame15 [
  #$04EB
  #$094D
  #$1192
  #$094F
  #$00C9
  #$0486
  #$00A8
  #$1614
  #$0865
  #$2295
  #$15B0
  #$3696
  #$0C63
  #$2E13
  #$4ED7
]

panim01062747_frame16 [
  #$04EC
  #$094D
  #$1193
  #$0950
  #$00C9
  #$0486
  #$00A8
  #$1A34
  #$0865
  #$2296
  #$15B1
  #$36B7
  #$0C63
  #$3233
  #$4EF8
]

panim01062747_frame17 [
  #$050C
  #$094E
  #$11B3
  #$0950
  #$00E9
  #$0487
  #$00A8
  #$1A35
  #$0865
  #$22B7
  #$15D1
  #$3AD7
  #$0C63
  #$3234
  #$52F8
]

panim01062747_frame18 [
  #$050C
  #$094E
  #$11B3
  #$0951
  #$00E9
  #$0487
  #$00A9
  #$1A55
  #$0865
  #$26B7
  #$15D2
  #$3AD8
  #$0C63
  #$3254
  #$5319
]

panim01062747_frame19 [
  #$050C
  #$096E
  #$11B4
  #$0971
  #$00EA
  #$0487
  #$00A9
  #$1A56
  #$0865
  #$26D8
  #$15D2
  #$3AF8
  #$0C63
  #$3255
  #$5719
]

panim01062747_frame1A [
  #$050D
  #$096F
  #$11D4
  #$0971
  #$00EA
  #$0487
  #$00A9
  #$1A56
  #$0865
  #$26D8
  #$15F2
  #$3EF9
  #$0C63
  #$3655
  #$573A
]

panim01062747_frame1B [
  #$050D
  #$096F
  #$11D5
  #$0972
  #$00EA
  #$0487
  #$00A9
  #$1A76
  #$0865
  #$26D8
  #$15F3
  #$3EF9
  #$0C63
  #$3675
  #$573A
]

panim01062747_frame1C [
  #$050D
  #$096F
  #$11D5
  #$0972
  #$04EA
  #$0487
  #$04A9
  #$1A77
  #$0865
  #$26F9
  #$15F3
  #$3F1A
  #$0C63
  #$3676
  #$5B5B
]

panim01062747_frame1D [
  #$050D
  #$096F
  #$11D5
  #$0972
  #$04EA
  #$0487
  #$04A9
  #$1A77
  #$0865
  #$26F9
  #$15F3
  #$3F1A
  #$0C63
  #$3676
  #$5B5B
]

panim01062747_frame1E [
  #$052D
  #$096F
  #$15D5
  #$0972
  #$04EA
  #$04A7
  #$04A9
  #$1A77
  #$0865
  #$26F9
  #$15F3
  #$3F1A
  #$0C63
  #$3676
  #$5B5B
]

panim01062747_frame1F [
  #$092E
  #$0990
  #$15F6
  #$0993
  #$050B
  #$08A8
  #$04CA
  #$1E98
  #$0866
  #$2B1A
  #$1A14
  #$433B
  #$0C63
  #$3A97
  #$5F7C
]

panim01062747_frame20 [
  #$092E
  #$0D90
  #$15F6
  #$0D93
  #$050B
  #$08A8
  #$04CA
  #$1E98
  #$0C86
  #$2B1A
  #$1A14
  #$433B
  #$1084
  #$3A97
  #$5F7C
]

panim01062747_frame21 [
  #$092E
  #$0D90
  #$15F6
  #$0D93
  #$050B
  #$08A8
  #$04CA
  #$1E98
  #$0C86
  #$2B1A
  #$1A14
  #$433B
  #$1084
  #$3A97
  #$5F7C
]

panim01062747_frame22 [
  #$092E
  #$0D90
  #$15F6
  #$0D93
  #$050B
  #$08A8
  #$04CA
  #$1E98
  #$0C86
  #$2B1A
  #$1A14
  #$433B
  #$1084
  #$3A97
  #$5F7C
]

