?BANK 03

------------------------------------------------
?INCLUDE 'world_map_names'
------------------------------------------------

world_map_names! [
  map-label < #01, &spritestring_03B244, &spritestring_03B244 >   ;00
  map-label < #06, &spritestring_03B24F, &spritestring_03B24F >   ;01
  map-label < #0A, &spritestring_03B25A, &spritestring_03B25A >   ;02
  map-label < #15, &spritestring_03B26A, &spritestring_03B26A >   ;03
  map-label < #17, &spritestring_03B278, &spritestring_03B278 >   ;04
  map-label < #1A, &spritestring_03B286, &spritestring_03B286 >   ;05
  map-label < #1C, &spritestring_03B296, &spritestring_03B296 >   ;06
  map-label < #30, &spritestring_03B2A1, &spritestring_03B2A1 >   ;07
  map-label < #31, &spritestring_03B2AF, &spritestring_03B2AF >   ;08
  map-label < #32, &spritestring_03B2BD, &spritestring_03B2C5 >   ;09
  map-label < #39, &spritestring_03B2BD, &spritestring_03B2C5 >   ;0A
  map-label < #3E, &spritestring_03B2CD, &spritestring_03B2CD >   ;0B
  map-label < #47, &spritestring_03B2CD, &spritestring_03B2CD >   ;0B
  map-label < #49, &spritestring_03B2DA, &spritestring_03B2DA >   ;0C
  map-label < #4B, &spritestring_03B2E9, &spritestring_03B2E9 >   ;0D
  map-label < #67, &spritestring_03B2F8, &spritestring_03B2F8 >   ;0E
  map-label < #68, &spritestring_03B2FB, &spritestring_03B2FB >   ;0F
  map-label < #69, &spritestring_03B308, &spritestring_03B308 >   ;10
  map-label < #6A, &spritestring_03B316, &spritestring_03B316 >   ;11
  map-label < #78, &spritestring_03B324, &spritestring_03B324 >   ;12
  map-label < #79, &spritestring_03B32D, &spritestring_03B32D >   ;13
  map-label < #82, &spritestring_03B336, &spritestring_03B336 >   ;14
  map-label < #91, &spritestring_03B341, &spritestring_03B341 >   ;15
  map-label < #95, &spritestring_03B34E, &spritestring_03B34E >   ;16
  map-label < #96, &spritestring_03B35B, &spritestring_03B35B >   ;17
  map-label < #9F, &spritestring_03B368, &spritestring_03B368 >   ;18
  map-label < #A0, &spritestring_03B372, &spritestring_03B372 >   ;19
  map-label < #AC, &spritestring_03B37C, &spritestring_03B37C >   ;1A
  map-label < #AD, &spritestring_03B38D, &spritestring_03B38D >   ;1B
  map-label < #AE, &spritestring_03B39E, &spritestring_03B39E >   ;1C
  map-label < #B0, &spritestring_03B3AF, &spritestring_03B3AF >   ;1D
  map-label < #C3, &spritestring_03B3B9, &spritestring_03B3B9 >   ;1E
  map-label < #C4, &spritestring_03B3CC, &spritestring_03B3CC >   ;1F
  map-label < #C5, &spritestring_03B3CC, &spritestring_03B3CC >   ;20
  map-label < #C8, &spritestring_03B3CC, &spritestring_03B3CC >   ;21
  map-label < #CC, &spritestring_03B3DF, &spritestring_03B3DF >   ;22
  map-label < #DC, &spritestring_03B3E7, &spritestring_03B3E7 >   ;23
  map-label < #DE, &spritestring_03B3F2, &spritestring_03B3F2 >   ;24
]

spritestring_03B244! ~South Cape~

spritestring_03B24F! ~South Cape~

spritestring_03B25A! ~Edward's Castle~

spritestring_03B26A! ~Itory Village~

spritestring_03B278! ~Itory Village~

spritestring_03B286! ~Moon Tribe Camp~

spritestring_03B296! ~Inca Ruins~

spritestring_03B2A1! ~Diamond Coast~

spritestring_03B2AF! ~Diamond Coast~

spritestring_03B2BD! ~Freesia~

spritestring_03B2C5! ~Freejia~

spritestring_03B2CD! ~Diamond Mine~

spritestring_03B2DA! ~Neil's Cottage~

spritestring_03B2E9! ~Nazca Painting~

spritestring_03B2F8! ~Mu~

spritestring_03B2FB! ~Seaside Cave~

spritestring_03B308! ~Angel Village~

spritestring_03B316! ~Angel Village~

spritestring_03B324! ~Watermia~

spritestring_03B32D! ~Watermia~

spritestring_03B336! ~Great Wall~

spritestring_03B341! ~City of Euro~

spritestring_03B34E! ~City of Euro~

spritestring_03B35B! ~City of Euro~

spritestring_03B368! ~Mt.Temple~

spritestring_03B372! ~Mt.Temple~

spritestring_03B37C! ~Natives' Village~

spritestring_03B38D! ~Natives' Village~

spritestring_03B39E! ~Natives' Village~

spritestring_03B3AF! ~Angkor Wat~

spritestring_03B3B9! ~Desert Village Dao~

spritestring_03B3CC! ~Desert Village Dao~

spritestring_03B3DF! ~Pyramid~

spritestring_03B3E7! ~Over Babel~

spritestring_03B3F2! ~Tower of Babel~



---------------------------------------------
?INCLUDE 'sFE_actor_03A2F1'
---------------------------------------------

LookupMapName! {
    PHP 
    PHX 
    LDX #$0000
    SEP #$20
    PHB 
    LDA #$^world_map_names
    PHA 
    PLB 

  loc_03A69E!:
    LDA $&world_map_names, X
    BEQ loc_03A6B6
    CMP $0000
    BEQ loc_03A6AD
    INX 
    INX 
    INX 
    INX 
    INX 
    BRA loc_03A69E

  loc_03A6AD!:
    REP #$20
    LDA $0B24
    BEQ do_name_en
    LDY $&world_map_names+3, X
    BRA do_name_next

  do_name_en:
    LDY $&world_map_names+1, X
    
  do_name_next:
    PLB 
    PLX 
    PLP 
    RTS 
}
