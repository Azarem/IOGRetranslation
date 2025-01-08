

------------------------------------------
?INCLUDE 'overworld_scripts'
------------------------------------------

-----------------
;Dao to Euro
-----------------

code_03B7E2 {
    COP [BF] ( &widestring_03B7F6 )
    COP [BE] ( #42, #01, &code_list_03B7EE )
    COP [C5]
}


code_list_03B7EE [
  &code_03BAC5   ;00
  &code_03BAC5   ;01
  &dao_euro_trip
  &code_03BAA1   ;02
  &code_03BAB1   ;03
]

dao_euro_trip {
    COP [67] ( #00, #26 )
}


dao_euro_warp {
    COP [26] ( #91, #$03D0, #$0430, #06, #$5400 )
    COP [C5]
}

widestring_03B7F6 `[TPL:11][SFX:0] [LU1:42]       [LU1:3F][N] Euro City   Natives' Vil.`

-----------------
;Euro to Dao
-----------------

code_03B88C {
    COP [BF] ( &widestring_03B8A2 )
    COP [BE] ( #53, #00, &code_list_03B898 )
    COP [C5]
}


code_list_03B898 [
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

widestring_03B8A2 `[DLG:2,14][SIZ:E,3][SFX:0] Quit        Dao[N] Watermia    Natives' Vill.[N] Mt.Temple   (Where to?)`



------------------------------------------
?INCLUDE 'table_03AD77'
------------------------------------------
;New routes

table_03AD77 [
  &unk2_03ADC3   ;00
  &unk2_03ADC3   ;01
  &unk2_03ADD8   ;02
  &unk2_03ADF1   ;03
  &unk2_03AE06   ;04
  &unk2_03AE23   ;05
  &unk2_03AE38   ;06
  &unk2_03AE5D   ;07
  &unk2_03AE76   ;08
  &unk2_03AE9B   ;09
  &unk2_03AEA0   ;0A
  &unk2_03AEBD   ;0B
  &unk2_03AEDA   ;0C
  &unk2_03AEEB   ;0D
  &unk2_03AF10   ;0E
  &unk2_03AF2D   ;0F
  &unk2_03AF42   ;10
  &unk2_03AF5F   ;11
  &unk2_03AF9C   ;12
  &unk2_03AFBD   ;13
  &unk2_03AFCE   ;14
  &unk2_03AFEB   ;15
  &unk2_03B00C   ;16
  &unk2_03B02D   ;17
  &unk2_03B046   ;18
  &unk2_03B063   ;19
  &unk2_03B080   ;1A
  &unk2_03B09D   ;1B
  &unk2_03B0AE   ;1C
  &unk2_03B0C7   ;1D
  &unk2_03B0E0   ;1E
  &unk2_03B0F5   ;1F
  &unk2_03B10E   ;20
  &unk2_03B12F   ;21
  &unk2_03B154   ;22
  &unk2_03B17D   ;23
  &unk2_03B19E   ;24
  &unk2_03B1BF   ;25
  &dao_euro_sequence   ;26
  &euro_dao_sequence   ;27
  &watermia_freejia_sequence  ;28
  &freejia_watermia_sequence  ;29
  &south_cape_freejia_sequence ;2A
  &freejia_south_cape_sequence ;2B
]

dao_euro_sequence [
  motion < #00, #00, #02, #80 >
  motion < #01, #00, #00, #C0 >
  motion < #00, #00, #02, #40 >
  motion < #01, #01, #00, #20 >
  motion < #00, #00, #01, #40 >
  motion < #01, #00, #00, #5E >
  motion < #00, #00, #01, #80 >
]

euro_dao_sequence [
  motion < #00, #00, #01, #80 >
  motion < #02, #00, #00, #5E >
  motion < #00, #00, #02, #40 >
  motion < #02, #02, #00, #20 >
  motion < #00, #00, #01, #40 >
  motion < #02, #00, #00, #C0 >
  motion < #00, #00, #02, #80 >
]

watermia_freejia_sequence [
  motion < #00, #00, #03, #80 >
  motion < #00, #01, #00, #30 >
  motion < #00, #00, #02, #28 >
  motion < #02, #03, #00, #80 >
  motion < #00, #00, #04, #6C >
]

freejia_watermia_sequence [
  motion < #00, #00, #02, #28 >
  motion < #01, #04, #00, #80 >
  motion < #00, #00, #01, #28 >
  motion < #00, #02, #00, #2C >
]

south_cape_freejia_sequence [
  motion < #00, #00, #02, #58 >
  motion < #03, #02, #00, #BF >
  motion < #00, #00, #01, #58 >
  motion < #00, #02, #00, #12 >
]

freejia_south_cape_sequence [
  motion < #00, #00, #03, #80 >
  motion < #00, #01, #00, #12 >
  motion < #00, #00, #02, #58 >
  motion < #04, #01, #00, #BF >
  motion < #00, #00, #04, #54 >
]