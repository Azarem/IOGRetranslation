
------------------------------------
?INCLUDE 'FreejiaDeliveryman'
------------------------------------
frejia_deliveryman_str_intro      `[TPL:16][TPL:F]Eu sou o Entregador Alado.[N]Meus pássaros treinados[N]podem te levar para terras[N]distantes.[FIN][TPL:F]Para onde quer ir?[N][PAL:0] Ficar Aqui[N] Termágua[N] Cabo do Sul[PAL:4]`
frejia_deliveryman_str_cancel     `[CLD][TPL:D]Tudo bem. Volte se mudar[N]de ideia.[END]`
frejia_deliveryman_str_watermia   `[CLD][TPL:E]Venham, meus pássaros![N]Vamos levar esse rapaz[N]para Termágua![END]`
frejia_deliveryman_str_south_cape `[CLR][CLD][TPL:E]Venham, meus pássaros![N]Vamos levar esse rapaz[N]para Cabo do Sul![END]`

------------------------------------
?INCLUDE 'dm47_sam'
------------------------------------
?IF 'FreejiaShortcut'
  ------------------------------------
  ?INCLUDE 'FreejiaShortcut'
  ------------------------------------
  shortcut_cancel_str `[CLD][TPL:5][TPL:D]Eu nunca vou me esquecer[N]do que você fez por nós.[END]`
  shortcut_accept_str `[CLD][TPL:5][TPL:E]Certo, fique perto de mim[N]e chegaremos lá num piscar[N]de olhos.[END]`

  widestring_05D48E `[TPL:5][TPL:E][NAM:A]: Eu conheço uma[N]passagem secreta que leva[N]até Freesia.[FIN]Quer pegar esse atalho?[N][PAL:0] Ficar[N] Ir à Freesia[PAL:4]`
?ELSE
  widestring_05D48E `[TPL:5][TPL:E][NAM:A]: Eu conheço uma[N]passagem secreta que leva[N]até Freesia.[FIN]Quer pegar esse atalho?[N][PAL:0] Ficar[N] Ir à Freesia[PAL:4]`
?ENDIF


------------------------------------
?INCLUDE 'NewGamePlus'
------------------------------------
diary_ngp_str     `[DLG:6,A][SIZ:A,5]Iniciar Jornada[N]Apagar Diário[N]Copiar Diário[N]Opções[N]Novo Jogo +`

------------------------------------
?INCLUDE 'SouthCapeDeliveryman'
------------------------------------
skyd_str_intro    `[TPL:16][TPL:F]Eu sou o Entregador Alado.[N]Meus pássaros treinados[N]podem te levar para[N] terras distantes.[FIN][TPL:F]Para onde quer ir?[N][PAL:0] Ficar aqui[N] Termágua[N] Frésia[PAL:4]`
skyd_str_cancel   `[CLD][TPL:D]Tudo bem. Volte se mudar[N]de ideia.[END]`
skyd_str_watermia `[CLD][TPL:E]Venham, meus pássaros![N]Vamos levar esse rapaz[N]para Termágua![END]`
skyd_str_freejia  `[CLD][TPL:E]Venham, meus pássaros![N]Vamos levar esse rapaz[N]para Frésia![END]`

------------------------------------
?INCLUDE 'WatermiaDeliveryman'
------------------------------------
watermia_greeting_str   `[TPL:16][TPL:F]Eu sou o Entregador Alado.[N]Meus pássaros treinados[N]podem te levar para[N] terras distantes.[FIN][TPL:F]Para onde quer ir?[N][PAL:0] Ficar aqui[N] Cabo do Sul[N] Frésia[PAL:4]`
watermia_cancel_str     `[CLD][TPL:D]Tudo bem. Volte se mudar[N]de ideia.[END]`
watermia_south_cape_str `[CLD][TPL:E]Venham, meus pássaros![N]Vamos levar esse rapaz[N]para Cabo do Sul![END]`
watermia_freejia_str    `[CLD][TPL:E]Venham, meus pássaros![N]Vamos levar esse rapaz[N]para Frésia![END]`

------------------------------------
?INCLUDE 'ThankfulFlower'
------------------------------------
thankful_flower_str `[TPL:18][TPL:D]Que melodia encantadora![N]Adorei![END]`

------------------------------------
?INCLUDE 'sFA_diary_menu'
------------------------------------
widestring_0BF3F4 `[DLG:6,A][SIZ:A,4]Iniciar Jornada[N]Apagar Diário[N]Copiar Diário[N]Opções`
widestring_0BF437 `[DLG:2,8][SIZ:E,7]Em qual Diário?[N][::] Diário 1 - [ADR:&strings_0BF706,D74][N][N] Diário 2 - [ADR:&strings_0BF706,D76][N][N] Diário 3 - [ADR:&strings_0BF706,D78]`
widestring_0BF476 `[DLG:2,8][SIZ:E,7]Qual Diário?[N][JMP:&widestring_0BF437+M]`
widestring_0BF48C `[DLG:2,8][SIZ:E,7]Copiar qual Diário?[N][JMP:&widestring_0BF437+M]`
widestring_0BF4A7 `[DLG:2,8][SIZ:E,7]Apagar qual Diário?[N][JMP:&widestring_0BF437+M]`
widestring_0BF4C3 `[DLG:2,C][::][SKP:2]PV[SKP:1][BCD:2,D9A][SKP:2]ATQ[SKP:1][BCD:2,D9C][SKP:2]DEF[SKP:1][BCD:2,D9E]`
widestring_0BF4EA `[DLG:2,10][::][SKP:2]PV[SKP:1][BCD:2,D9A][SKP:2]ATQ[SKP:1][BCD:2,D9C][SKP:2]DEF[SKP:1][BCD:2,D9E]`
widestring_0BF511 `[DLG:2,14][::][SKP:2]PV[SKP:1][BCD:2,D9A][SKP:2]ATQ[SKP:1][BCD:2,D9C][SKP:2]DEF[SKP:1][BCD:2,D9E]`
widestring_0BF538 `[DLG:6,8][SIZ:A,8]Opções[N]Salvar Mudanças[N]Nomes[N]Esquema de Botões[N][SKP:5]   :Atacar/Falar[N][SKP:5]   :Item/Cancelar[N][SKP:5]   :Inventário[N][SKP:5]   :Correr`
widestring_0BF5AD `[DLG:6,8][SIZ:A,8]Configuração OK?[N]Iniciar Jornada[N]Nomes[N]Esquema de Botões[N][SKP:5]   :Atacar/Falar[N][SKP:5]   :Item/Cancelar[N][SKP:5]   :Inventário[N][SKP:5]   :Correr`
widestring_0BF625 `[DLG:D,C][SFX:0][ADR:&table_0BF667,D90]`
widestring_0BF630 `[DLG:11,E][SFX:0][ADR:&table_0BF63B,D8E]`
widestring_0BF63F `1[DLG:8,10]A[DLG:8,12]B[DLG:8,14]SEL[DLG:8,16]Y`
widestring_0BF653 `2[DLG:8,10]B[DLG:8,12]Y[DLG:8,14]SEL[DLG:8,16]A`
widestring_0BF66B `Japoneses`
widestring_0BF672 `Americanos`
widestring_0BF679 `[DLG:4,15][SIZ:C,2][DLY:FF]O Diário não está vazio[N]Apagar e Selecionar[FIN][CLD]`
widestring_0BF6A4 `[DLG:4,A][ADR:&table_0BF6AD,D94]`
widestring_0BF6B3 `[DLG:4,8][SIZ:D,5][ADR:&table_0BF6D9,D94][N][N]Apagar Diário? [N] Não [N] Sim `
widestring_0BF6DF `Diário 1: [ADR:&strings_0BF706,D74]`
widestring_0BF6EC `Diário 2: [ADR:&strings_0BF706,D76]`
widestring_0BF6F9 `Diário 3: [ADR:&strings_0BF706,D78]`
widestring_0BF630 `[DLG:18,E][SFX:0][ADR:&table_0BF63B,D8E]`

?IF 'AngkorShortcut'

  ?INCLUDE 'awBF_spirit_guide'

  code_089B1F {
      LDA #$FFF0
      TRB $joypad_mask_std
      COP [DA] ( #F0 )
      COP [BF] ( &angkor_shortcut_str )
      COP [BE] ( #02, #01, &angkor_shortcut_options )
      RTL
  }

  ?INCLUDE 'AngkorShortcut'

angkor_shortcut_str `[TPL:17][TPL:C]Uma voz ecoa…[FIN][TPL:D]É um longo caminho de[N]volta…[FIN][TPL:E]Deixa-me conduzi-lo…[N][PAL:0] Não[N] Sim[PAL:4]`
angkor_shortcut_accept_str `[CLD][TPL:17][TPL:C]Fecha teus olhos…[END]`

?ENDIF

?IF 'KressShortcut'

  ?INCLUDE 'KressShortcut'

shortcut_interact {
    COP [BF] ( &kress_shortcut_str )
    COP [BE] ( #02, #01, &kress_shortcut_options )
    RTL 
}
  
  kress_shortcut_str `[TPL:17][TPL:E]Espírito: Te elevastes até[N]aqui por tua própria[N]força… Impressionante.[FIN][TPL:E]Deixa-me guiá-lo de volta.[N][PAL:0] Não[N] Sim[PAL:4]`

  kress_shortcut_cancel_str `[CLD][TPL:17][TPL:D]Estarei aqui caso[N]mude de ideia.[END]`
  kress_shortcut_accept_str `[CLD][TPL:17][TPL:C]Fecha teus olhos…[END]`

?ENDIF

----------------------------------------
?INCLUDE 'ExpandedOverworldRoutes'
?INCLUDE 'overworld_options'
----------------------------------------

euro_full_option_str `[DLG:2,14][SIZ:E,3][SFX:0] Voltar       Dao[N] Termágua    Aldeia Ind.[N] Mt. Ceres   (Para onde ir?)`
