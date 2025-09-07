?BANK 03

------------------------------------------------
?INCLUDE 'overworld_names'
------------------------------------------------

overworld_names [
  map_name < #01, &spritestring_03B244, &spritestring_03B244 >   ;00
  map_name < #06, &spritestring_03B24F, &spritestring_03B24F >   ;01
  map_name < #0A, &spritestring_03B25A, &spritestring_03B25A >   ;02
  map_name < #15, &spritestring_03B26A, &spritestring_03B26A >   ;03
  map_name < #17, &spritestring_03B278, &spritestring_03B278 >   ;04
  map_name < #1A, &spritestring_03B286, &spritestring_03B286 >   ;05
  map_name < #1C, &spritestring_03B296, &spritestring_03B296 >   ;06
  map_name < #30, &spritestring_03B2A1, &spritestring_03B2A1 >   ;07
  map_name < #31, &spritestring_03B2AF, &spritestring_03B2AF >   ;08
  map_name < #32, &spritestring_03B2BD, &spritestring_03B2C5 >   ;09
  map_name < #39, &spritestring_03B2BD, &spritestring_03B2C5 >   ;0A
  map_name < #3E, &spritestring_03B2CD, &spritestring_03B2CD >   ;0B
  map_name < #47, &spritestring_03B2CD, &spritestring_03B2CD >   ;0B
  map_name < #49, &spritestring_03B2DA, &spritestring_03B2DA >   ;0C
  map_name < #4B, &spritestring_03B2E9, &spritestring_03B2E9 >   ;0D
  map_name < #67, &spritestring_03B2F8, &spritestring_03B2F8 >   ;0E
  map_name < #68, &spritestring_03B2FB, &spritestring_03B2FB >   ;0F
  map_name < #69, &spritestring_03B308, &spritestring_03B308 >   ;10
  map_name < #6A, &spritestring_03B316, &spritestring_03B316 >   ;11
  map_name < #78, &spritestring_03B324, &spritestring_03B324 >   ;12
  map_name < #79, &spritestring_03B32D, &spritestring_03B32D >   ;13
  map_name < #82, &spritestring_03B336, &spritestring_03B336 >   ;14
  map_name < #91, &spritestring_03B341, &spritestring_03B341 >   ;15
  map_name < #95, &spritestring_03B34E, &spritestring_03B34E >   ;16
  map_name < #96, &spritestring_03B35B, &spritestring_03B35B >   ;17
  map_name < #9F, &spritestring_03B368, &spritestring_03B368 >   ;18
  map_name < #A0, &spritestring_03B372, &spritestring_03B372 >   ;19
  map_name < #AC, &spritestring_03B37C, &spritestring_03B37C >   ;1A
  map_name < #AD, &spritestring_03B38D, &spritestring_03B38D >   ;1B
  map_name < #AE, &spritestring_03B39E, &spritestring_03B39E >   ;1C
  map_name < #B0, &spritestring_03B3AF, &spritestring_03B3AF >   ;1D
  map_name < #C3, &spritestring_03B3B9, &spritestring_03B3B9 >   ;1E
  map_name < #C4, &spritestring_03B3CC, &spritestring_03B3CC >   ;1F
  map_name < #C5, &spritestring_03B3CC, &spritestring_03B3CC >   ;20
  map_name < #C8, &spritestring_03B3CC, &spritestring_03B3CC >   ;21
  map_name < #CC, &spritestring_03B3DF, &spritestring_03B3DF >   ;22
  map_name < #DC, &spritestring_03B3E7, &spritestring_03B3E7 >   ;23
  map_name < #DE, &spritestring_03B3F2, &spritestring_03B3F2 >   ;24
]

spritestring_03B244 ~South Cape~

spritestring_03B24F ~South Cape~

spritestring_03B25A ~Edward's Castle~

spritestring_03B26A ~Itory Village~

spritestring_03B278 ~Itory Village~

spritestring_03B286 ~Moon Tribe Camp~

spritestring_03B296 ~Inca Ruins~

spritestring_03B2A1 ~Diamond Coast~

spritestring_03B2AF ~Diamond Coast~

spritestring_03B2BD ~Freesia~

spritestring_03B2C5 ~Freejia~

spritestring_03B2CD ~Diamond Mine~

spritestring_03B2DA ~Neil's Cottage~

spritestring_03B2E9 ~Nazca Painting~

spritestring_03B2F8 ~Mu~

spritestring_03B2FB ~Seaside Cave~

spritestring_03B308 ~Angel Village~

spritestring_03B316 ~Angel Village~

spritestring_03B324 ~Watermia~

spritestring_03B32D ~Watermia~

spritestring_03B336 ~Great Wall~

spritestring_03B341 ~City of Euro~

spritestring_03B34E ~City of Euro~

spritestring_03B35B ~City of Euro~

spritestring_03B368 ~Mt.Temple~

spritestring_03B372 ~Mt.Temple~

spritestring_03B37C ~Natives' Village~

spritestring_03B38D ~Natives' Village~

spritestring_03B39E ~Natives' Village~

spritestring_03B3AF ~Angkor Wat~

spritestring_03B3B9 ~Desert Village Dao~

spritestring_03B3CC ~Desert Village Dao~

spritestring_03B3DF ~Pyramid~

spritestring_03B3E7 ~Over Babel~

spritestring_03B3F2 ~Tower of Babel~



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
