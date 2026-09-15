
------------------------------------------
?INCLUDE 'world_map_options'
------------------------------------------

world_map_options! [
  &code_03B44F   ;00
  &code_03B451   ;01
  &code_03B47D   ;02
  &code_03B4A8   ;03
  &code_03B4CC   ;04
  &code_03B4F0   ;05
  &code_03B51A   ;06
  &code_03B53F   ;07
  &code_03B563   ;08
  &code_03B587   ;09
  &code_03B5A1   ;0A
  &code_03B5C7   ;0B
  &code_03B5F2   ;0C
  &code_03B62A   ;0D
  &code_03B650   ;0E
  &code_03B697   ;0F
  &code_03B6BD   ;10
  &code_03B6F3   ;11
  &code_03B719   ;12
  &code_03B73F   ;13
  &code_03B778   ;14
  &code_03B7A5   ;15
  &code_03B7B5   ;16
  &code_03B7E2   ;17
  &code_03B81A   ;18
  &code_03B843   ;19
  &code_03B88C   ;1A
  &code_03B8D6   ;1B
  &euro_full_options   ;1C
  &code_03B8EC   ;1D
  &code_03B8F2   ;1E
  &code_03B8F8   ;1F
  &code_03B8FE   ;20
  &code_03B904   ;21
  &code_03B90A   ;22
  &code_03B910   ;23
  &code_03B916   ;24
  &code_03B91C   ;25
  &code_03B922   ;26
]

-----------------
;Dao to Euro
-----------------

code_03B7E2! {
    COP [BF] ( &dialogstring_03B7F6 )
    COP [BE] ( #42, #01, &code_list_03B7EE )
    COP [C5]
}

code_list_03B7EE! [
  &code_03BAC5   ;00
  &code_03BAC5   ;01
  &dao_euro_trip
  &code_03BAB1   ;03
  &code_03BAA1   ;02
]

dao_euro_trip {
    COP [67] ( #00, #26 )
}


dao_euro_warp {
    COP [26] ( #91, #$03D0, #$0430, #06, #$5400 )
    COP [C5]
}

dialogstring_03B7F6! `[TPL:11][SFX:0] Quit        Pyramid[N] Euro City   Natives' Vil.`

-----------------
;Euro to Dao
-----------------

euro_full_options {
    COP [BF] ( &euro_full_option_str )
    COP [BE] ( #53, #00, &euro_full_option_list )
    COP [C5]
}


euro_full_option_list [
  &code_03BA1F   ;00
  &code_03BA1F   ;01
  &code_03BA2B   ;02
  &code_03BA41   ;03
  &euro_dao_trip 
  &code_03BA61   ;04
]

euro_dao_trip {
    COP [67] ( #00, #27 )
}

euro_dao_warp {
    COP [26] ( #C3, #$0010, #$00E0, #07, #$2300 )
    COP [C5]
}

euro_full_option_str `[DLG:2,14][SIZ:E,3][SFX:0] Quit        Dao[N] Watermia    Natives' Vil.[N] Mt.Temple   (Where to?)`

------------------------------------------
?INCLUDE 'overworld_exit'
------------------------------------------

code_00CC56! {
    COP [D0] ( #B6, #01, &euro_dao_option_switch )
    COP [D0] ( #AC, #01, &code_00CC82 )
    COP [D0] ( #9F, #01, &code_00CC72 )
    LDA #$0000
    STA $0D60
    COP [66] ( #$01D4, #$0134, #0F )
    JMP $&code_00CAC1
}

euro_dao_option_switch {
    LDA #$0000
    STA $0D60
    COP [66] ( #$01D4, #$0134, #1C )
    JMP $&code_00CAC1
}

-----------------------
;Itory to South Cape
-----------------------

code_03B51A! {
    COP [BF] ( &dialogstring_03B52C )
    COP [BE] ( #32, #01, &code_list_03B526 )
    COP [C5]
}


code_list_03B526! [
  &code_03B999
  &code_03B999
  &code_03B9A5
  &code_03B985
]

dialogstring_03B52C! `[TPL:11][SFX:0] Quit        South Cape[N] Inca Ruins`


------------------------------------------
?INCLUDE 'world_map_routes'
------------------------------------------
;New routes

world_map_routes! [
  &route_step_03ADC3   ;00
  &route_step_03ADC3   ;01
  &route_step_03ADD8   ;02
  &route_step_03ADF1   ;03
  &route_step_03AE06   ;04
  &route_step_03AE23   ;05
  &route_step_03AE38   ;06
  &route_step_03AE5D   ;07
  &route_step_03AE76   ;08
  &route_step_03AE9B   ;09
  &route_step_03AEA0   ;0A
  &route_step_03AEBD   ;0B
  &route_step_03AEDA   ;0C
  &route_step_03AEEB   ;0D
  &route_step_03AF10   ;0E
  &route_step_03AF2D   ;0F
  &route_step_03AF42   ;10
  &route_step_03AF5F   ;11
  &route_step_03AF9C   ;12
  &route_step_03AFBD   ;13
  &route_step_03AFCE   ;14
  &route_step_03AFEB   ;15
  &route_step_03B00C   ;16
  &route_step_03B02D   ;17
  &route_step_03B046   ;18
  &route_step_03B063   ;19
  &route_step_03B080   ;1A
  &route_step_03B09D   ;1B
  &route_step_03B0AE   ;1C
  &route_step_03B0C7   ;1D
  &route_step_03B0E0   ;1E
  &route_step_03B0F5   ;1F
  &route_step_03B10E   ;20
  &route_step_03B12F   ;21
  &route_step_03B154   ;22
  &route_step_03B17D   ;23
  &route_step_03B19E   ;24
  &route_step_03B1BF   ;25
  &dao_euro_sequence   ;26
  &euro_dao_sequence   ;27
  &watermia_freejia_sequence  ;28
  &freejia_watermia_sequence  ;29
  &south_cape_freejia_sequence ;2A
  &freejia_south_cape_sequence ;2B
]

dao_euro_sequence [
  route-step < #00, #00, #02, #80 >
  route-step < #01, #00, #00, #C0 >
  route-step < #00, #00, #02, #40 >
  route-step < #01, #01, #00, #20 >
  route-step < #00, #00, #01, #40 >
  route-step < #01, #00, #00, #5E >
  route-step < #00, #00, #01, #80 >
]

euro_dao_sequence [
  route-step < #00, #00, #01, #80 >
  route-step < #02, #00, #00, #5E >
  route-step < #00, #00, #02, #40 >
  route-step < #02, #02, #00, #20 >
  route-step < #00, #00, #01, #40 >
  route-step < #02, #00, #00, #C0 >
  route-step < #00, #00, #02, #80 >
]

watermia_freejia_sequence [
  route-step < #00, #00, #03, #80 >
  route-step < #00, #01, #00, #30 >
  route-step < #00, #00, #02, #28 >
  route-step < #02, #03, #00, #80 >
  route-step < #00, #00, #04, #6C >
]

freejia_watermia_sequence [
  route-step < #00, #00, #02, #28 >
  route-step < #01, #04, #00, #80 >
  route-step < #00, #00, #01, #28 >
  route-step < #00, #02, #00, #2C >
]

south_cape_freejia_sequence [
  route-step < #00, #00, #02, #58 >
  route-step < #03, #02, #00, #BF >
  route-step < #00, #00, #01, #58 >
  route-step < #00, #02, #00, #12 >
]

freejia_south_cape_sequence [
  route-step < #00, #00, #03, #80 >
  route-step < #00, #01, #00, #12 >
  route-step < #00, #00, #02, #58 >
  route-step < #04, #01, #00, #BF >
  route-step < #00, #00, #04, #54 >
]