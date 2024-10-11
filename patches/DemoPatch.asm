
?INCLUDE 'sc01_guard'
?INCLUDE 'sc01_sprint_man'
?INCLUDE 'dc2F_adrift'
?INCLUDE 'system_strings'


--------------------------------------------------

widestring_059D42 `[TPL:1C][DLG:5,4][SIZ:B,1][DLY:0]Thank you for playing![DLG:3,A][SIZ:D,6] Tools and ASM:  Kassiven[N]  Translation:  L Thammy[N]  Thanks: ViewifulSlayer[N]--------------------------[N] For latest updates, [ESC:CC,CD,CE,CF][N]  join our Discord!  [ESC:EC,ED,EE,EF][FIN]      This ends the[N]  retranslation content.[N] You may continue playing[N] but some dialog elements[N]    will be incorrect.[N]-♥- -♥-  -♥-  -♥-  -♥- -♥-[FIN][CLD][TPL:1C][DLG:5,4][SIZ:B,1][CLD][PAU:40][TPL:A][TPL:1][LU1:25][N][LU1:67][LU1:A3][LU1:79]to??? [N][LU1:20][LU2:7A]everyone... [FIN]Are you OK?[N][PAL:0] [LU1:6A]I'm OK.[N] I'm [LU1:D3]unsteady.`

;widestring_04923D `[DLY:0][TPL:0][TPL:D]00: Tim[N]This is a test[FIN][TPL:1][TPL:D]01: Karen[N]This is a test[FIN][TPL:2][TPL:D]02: Lillie[N]This is a test[FIN][TPL:3][TPL:D]03: Eric[N]This is a test[FIN][TPL:4][TPL:D]04: Rob[N]This is a test[FIN][TPL:5][TPL:D]05: Morris[N]This is a test[FIN][TPL:6][TPL:D]06: Neil[N]This is a test[FIN][TPL:7][TPL:D]07: Slap[N]This is a test[FIN][TPL:16][TPL:D]16: Default[N]This is a test[FIN][TPL:17][TPL:D]17: Wisp Spirit[N]This is a test[FIN][TPL:18][TPL:D]18: Itory[N]This is a test[FIN][TPL:19][TPL:D]19: Edward Castle[N]This is a test[FIN][TPL:1A][TPL:D]1A: Moon Tribe[N]This is a test[FIN][TPL:1B][TPL:D]1B: Inca[N]This is a test[FIN][TPL:1C][TPL:D]1C: Watermia[N]This is a test[FIN][TPL:1D][TPL:D]1D: Angel Village[N]This is a test[FIN][TPL:1E][TPL:D]1E: ??[N]This is a test[END]`


string_01DA47 |[NHM:4][CUR:1E,4]RETRANSLATED[CUR:D0,4]PUSH█START█BUTTON|

;code_0485A9 {
;    COP [BF] ( &widestring_048612 )
;    COP [CC] ( #27 )
;    RTL 
;}

;widestring_048612 `[DLG:3,6][SIZ:D,1][SFX:10][DLY:0]  Thank you for playing![WAI][N]     This was a demo![WAI][CLD][DLG:2,4][SIZ:E,9][SFX:10][DLY:0] Tools and ASM by: Kassiven[N]  Translation by: L Thammy[N]----------------------------[N] To get the latest news on[N]  retranslation progress,[N]join our discord or forums![N]----------------------------[N]https://discord.gg/kvvDFYcr[N]https://gaiahack.ing[END]`
