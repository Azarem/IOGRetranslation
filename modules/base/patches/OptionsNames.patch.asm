; =============================================================================
; Names setting for the inventory Options tab
; =============================================================================
;
; Registers the Names setting with the baserom options menu registry (record
; format documented at the top of baserom/options-menu/options_menu_core.asm).
;
;   Storage:  $0B24 bit 0 (the existing name dictionary flag, 1 = English)
;   Choices:  English, Japanese. The record XORs the stored bit with 1 so that
;             choice 0 (English) corresponds to a stored 1.
;   Temp:     $0BE0
;
; Placed at the very start of the list so Names is the first setting shown.

?INCLUDE 'sFA_diary_menu'
?INCLUDE 'system_strings'

!diary_new_game_names           0D90

---------------------------------------------

NamesChoices [
  &names_english
  &names_japanese
]

names_english  |English|
names_japanese |Japanese|

optstr_names |[PAL:0]Names[N] [PAL:14][TBL:@NamesChoices,BE0][PAL:0]|
optstr_names_desc |[PAL:0][POS:96,5]Character and place[DBL]names in dialogue:[DBL]English or Japanese.|

---------------------------------------------
; Registration

InventoryOptionSetups+= [
  @optstr_names           ;+00 render
  @optstr_names_desc      ;+03 desc
  #$0BE0                  ;+06 temp
  #$0B24                  ;+08 store
  #$0000                  ;+0A shift
  #$0001                  ;+0C mask
  #$0001                  ;+0E xor (stored 1 = English = choice 0)
  #$0002                  ;+10 count
  #$0000                  ;+12 load   (packed bits)
  #$0000                  ;+14 change
  #$0000                  ;+16 commit (packed bits)
]

---------------------------------------------
; New game arrangement screen: names default to English (index 1 in the diary's
; Japanese/English table). The block is otherwise identical to the original.

loc_0BE433! {
    LDA $0D92
    STA $0D94
    LDA #$FFFF
    STA $0D92
    LDA #$0000
    STA $0D8E
    LDA #$0001
    STA $diary_new_game_names
    JSR $&DiaryMenuClearVram
    COP [PrintDialogStringAlt] ( &dialogstring_0BF5AD )
    COP [PrintDialogStringAlt] ( &dialogstring_0BF625 )
    COP [PrintDialogStringAlt] ( &dialogstring_0BF630 )
    COP [RunBg3Script] ( @system_strings.consolestring_01EADC )
    LDA #$0000
    STA $0D98
}
