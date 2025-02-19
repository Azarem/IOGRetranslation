?BANK 03

------------------------------------------------
?INCLUDE 'overworld_names'
------------------------------------------------

overworld_names [
  map_name < #01, &charstring_03B244, &charstring_03B244 >   ;00
  map_name < #06, &charstring_03B24F, &charstring_03B24F >   ;01
  map_name < #0A, &charstring_03B25A, &charstring_03B25A >   ;02
  map_name < #15, &charstring_03B26A, &charstring_03B26A >   ;03
  map_name < #17, &charstring_03B278, &charstring_03B278 >   ;04
  map_name < #1A, &charstring_03B286, &charstring_03B286 >   ;05
  map_name < #1C, &charstring_03B296, &charstring_03B296 >   ;06
  map_name < #30, &charstring_03B2A1, &charstring_03B2A1 >   ;07
  map_name < #31, &charstring_03B2AF, &charstring_03B2AF >   ;08
  map_name < #32, &charstring_03B2BD, &charstring_03B2C5 >   ;09
  map_name < #39, &charstring_03B2BD, &charstring_03B2C5 >   ;0A
  map_name < #3E, &charstring_03B2CD, &charstring_03B2CD >   ;0B
  map_name < #47, &charstring_03B2CD, &charstring_03B2CD >   ;0B
  map_name < #49, &charstring_03B2DA, &charstring_03B2DA >   ;0C
  map_name < #4B, &charstring_03B2E9, &charstring_03B2E9 >   ;0D
  map_name < #67, &charstring_03B2F8, &charstring_03B2F8 >   ;0E
  map_name < #68, &charstring_03B2FB, &charstring_03B2FB >   ;0F
  map_name < #69, &charstring_03B308, &charstring_03B308 >   ;10
  map_name < #6A, &charstring_03B316, &charstring_03B316 >   ;11
  map_name < #78, &charstring_03B324, &charstring_03B324 >   ;12
  map_name < #79, &charstring_03B32D, &charstring_03B32D >   ;13
  map_name < #82, &charstring_03B336, &charstring_03B336 >   ;14
  map_name < #91, &charstring_03B341, &charstring_03B341 >   ;15
  map_name < #95, &charstring_03B34E, &charstring_03B34E >   ;16
  map_name < #96, &charstring_03B35B, &charstring_03B35B >   ;17
  map_name < #9F, &charstring_03B368, &charstring_03B368 >   ;18
  map_name < #A0, &charstring_03B372, &charstring_03B372 >   ;19
  map_name < #AC, &charstring_03B37C, &charstring_03B37C >   ;1A
  map_name < #AD, &charstring_03B38D, &charstring_03B38D >   ;1B
  map_name < #AE, &charstring_03B39E, &charstring_03B39E >   ;1C
  map_name < #B0, &charstring_03B3AF, &charstring_03B3AF >   ;1D
  map_name < #C3, &charstring_03B3B9, &charstring_03B3B9 >   ;1E
  map_name < #C4, &charstring_03B3CC, &charstring_03B3CC >   ;1F
  map_name < #C5, &charstring_03B3CC, &charstring_03B3CC >   ;20
  map_name < #C8, &charstring_03B3CC, &charstring_03B3CC >   ;21
  map_name < #CC, &charstring_03B3DF, &charstring_03B3DF >   ;22
  map_name < #DC, &charstring_03B3E7, &charstring_03B3E7 >   ;23
  map_name < #DE, &charstring_03B3F2, &charstring_03B3F2 >   ;24
]

charstring_03B244 ~South Cape~

charstring_03B24F ~South Cape~

charstring_03B25A ~Edward's Castle~

charstring_03B26A ~Itory Village~

charstring_03B278 ~Itory Village~

charstring_03B286 ~Moon Tribe Camp~

charstring_03B296 ~Inca Ruins~

charstring_03B2A1 ~Diamond Coast~

charstring_03B2AF ~Diamond Coast~

charstring_03B2BD ~Freesia~

charstring_03B2C5 ~Freejia~

charstring_03B2CD ~Diamond Mine~

charstring_03B2DA ~Neil's Cottage~

charstring_03B2E9 ~Nazca Painting~

charstring_03B2F8 ~Mu~

charstring_03B2FB ~Seaside Cave~

charstring_03B308 ~Angel Village~

charstring_03B316 ~Angel Village~

charstring_03B324 ~Watermia~

charstring_03B32D ~Watermia~

charstring_03B336 ~Great Wall~

charstring_03B341 ~City of Euro~

charstring_03B34E ~City of Euro~

charstring_03B35B ~City of Euro~

charstring_03B368 ~Mt.Temple~

charstring_03B372 ~Mt.Temple~

charstring_03B37C ~Natives' Village~

charstring_03B38D ~Natives' Village~

charstring_03B39E ~Natives' Village~

charstring_03B3AF ~Angkor Wat~

charstring_03B3B9 ~Desert Village Dao~

charstring_03B3CC ~Desert Village Dao~

charstring_03B3DF ~Pyramid~

charstring_03B3E7 ~Over Babel~

charstring_03B3F2 ~Tower of Babel~



---------------------------------------------
?INCLUDE 'sFE_actor_03A2F1'
---------------------------------------------

sub_03A692 {
    PHP 
    PHX 
    LDX #$0000
    SEP #$20
    PHB 
    LDA #$^overworld_names
    PHA 
    PLB 

  code_03A69E:
    LDA $&overworld_names, X
    BEQ code_03A6B6
    CMP $0000
    BEQ code_03A6AD
    INX 
    INX 
    INX 
    INX 
    INX 
    BRA code_03A69E
}


code_03A6AD {
    REP #$20
    LDA $0B24
    BEQ do_name_en
    LDY $&overworld_names+3, X
    BRA do_name_next
  do_name_en:
    LDY $&overworld_names+1, X
  do_name_next:
    PLB 
    PLX 
    PLP 
    RTS 
}
