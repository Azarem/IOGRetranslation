;CHAPTER 22

-------------------------------------
?INCLUDE 'av69_lance'
-------------------------------------
widestring_06BAFA `[TPL:6][TPL:9][DLY:1]Neil:[N]Finalmente... Chegamos.[FIN][TPL:A]Acho que passamos quase um[N]mês inteiro dentro daquele[N]túnel…[FIN][CLD][TPL:4][TPL:9][NAM:4][DLY:0]: Olha só…[N]Tem uma placa aqui.[END]`

widestring_06BB50 `[TPL:4][TPL:9][DLY:0][NAM:4]:[N]Vamos ver o que diz…[FIN][CLD][TPL:4][TPL:9]Viajantes,[N]Por favor, usem esta sala.[FIN][TPL:4]Assinado:[N]Tribo dos Anjos Caídos…[FIN][CLD][TPL:3][TPL:8]Como é que é?![FIN][TPL:6][TPL:A]Neil:[N]Então é aqui que a Tribo[N]dos Anjos Caídos vive…[FIN][CLD][TPL:6][TPL:B]Ouvi dizer que eles evitam[N]contato com estrangeiros…[N]Talvez por isso colocaram[N]essa placa.[FIN][CLD][TPL:6][TPL:A]De qualquer modo, vamos[N]aproveitar a sala e[N]descansar um pouco.[END]`

-------------------------------------
?INCLUDE 'av69_lily'
-------------------------------------
widestring_06C224 `[TPL:2][TPL:9][NAM:2]:[N]Vamos, Tim.[END]`

-------------------------------------
?INCLUDE 'av69_kara'
-------------------------------------
widestring_06C3B1 `[TPL:1][TPL:9][NAM:1]: "Vamos, Timˮ?![N]Que história é essa?![FIN]E olha só pra você, Tim![N]Todo bobo![FIN][TPL:9]Vou dar uma volta sozinha![N]E nem pensem em me seguir![END]`

widestring_06C23C `[TPL:2][TPL:9][NAM:2]: Que mosquito[N]mordeu ela agora…?[FIN][TPL:4][TPL:9][NAM:4]: Deixa ela… Deve ser[N]só mais uma fase…[END]`

-------------------------------------
?INCLUDE 'av69_signs'
-------------------------------------
widestring_06BA36 `[TPL:1D][BOR:1][TPL:F]Viajantes,[N]Por favor, usem esta sala.[N][N]   -Tribo dos Anjos Caídos[END]`

widestring_06BA6B `[TPL:1D][BOR:1][TPL:D]Entrada para a[N]Vila dos Anjos Caídos[END]`

-------------------------------------
?INCLUDE 'av6A_lance'
-------------------------------------
widestring_06BC5C `[TPL:4][TPL:A][NAM:4]:[N]Tim, preciso te pedir um[N]conselho, cara.[FIN]É meio difícil dizer, mas…[N]Acho que tô apaixonado[N]pela Lillie.[FIN][TPL:B]Até nos meus sonhos ela[N]aparece, tá ligado?[N]E quando menos percebo, tô[N]olhando pra ela de novo.[FIN]Esse tipo de coisa não[N]combina comigo, né?[N][PAL:0] É…[N] Nada a ver, cara.`

widestring_06BD1A `[CLD][TPL:0][TPL:A][NAM:0]: É, cara… Eu realmente[N]nunca imaginei ouvir isso[N]de você.[FIN]`

widestring_06BD4A `[CLR][TPL:0][TPL:A][NAM:0]: Mas depois de tanto[N]tempo juntos, não é nada[N]estranho se apaixonar.[FIN][CLD][TPL:4][TPL:9][NAM:4]: O aniversário de 15[N]anos da Lily tá chegando…[FIN][TPL:A]Quero aproveitar pra dar[N]um presente… E contar o[N]que sinto por ela…[FIN][CLD][TPL:4][TPL:9]Se fosse você no meu[N]lugar, o que daria?[FIN][TPL:A][PAL:0] Um lindo buquê de flores[N] Um colar bonito[N] Um beijo doce`

widestring_06BE1F `[CLD][TPL:0][TPL:A][NAM:0]: Acho que não existe[N]garota que não fique feliz[N]com um buquê de flores.[FIN][CLD][TPL:4][TPL:9][NAM:4]: Verdade. Então talvez[N]eu mande umas rosas.[FIN][TPL:A]Dizem que significam[N]“declaração de amor” na[N]linguagem das flores.[FIN][CLD][JMP:&widestring_06BF7C]`

widestring_06BE85 `[CLD][TPL:0][TPL:A][NAM:0]: Acho que seria melhor[N]algo que ela pudesse usar,[N]tipo um colar.[FIN]Assim, sempre que olhar[N]pra ele, vai se lembrar[N]de você.[FIN][TPL:4]Rob: Boa. Vou procurar[N]umas pedras bonitas e[N]montar um colar pra ela.[FIN][JMP:&widestring_06BF7C]`
;TODO!!

widestring_06BF0A `[CLD][TPL:0][TPL:A][NAM:0]:[N]Se você gosta mesmo dela,[N]só tem um jeito, né?[FIN][TPL:B][TPL:4]Rob: Acho que é meio[N]ousado demais, mas se[N]você acha que vale a pena…[N]Vou tentar.[FIN][JMP:&widestring_06BF7C]`
;TODO!!

widestring_06BF7C `[CLD][TPL:4][TPL:9][NAM:4]:[N]Valeu pelo papo, Tim.[FIN][TPL:A]Vou pensar melhor nisso.[N]Nada melhor do que ter um[N]amigo de verdade.[END]`

code_06BC19 {
    COP [D0] ( #74, #01, &code_06BC57 )
    COP [CC] ( #74 )
    COP [BF] ( &widestring_06BC5C )
    COP [BE] ( #02, #02, &code_list_06BC2C )
}

-------------------------------------
?INCLUDE 'av6A_lily'
-------------------------------------
widestring_06C2BD `[TPL:2][TPL:A][NAM:2]: Então é aqui que[N]os Anjos Caídos vivem…[N]Num lugar tão escuro…[FIN][CLD][TPL:2][TPL:8]É tão deprimente…[END]`

-------------------------------------
?INCLUDE 'av6A_erik'
-------------------------------------
widestring_06C52F `[TPL:3][TPL:A][NAM:3]:[N]A luz do sol[N]é tão intensa…[FIN][CLD][TPL:3][TPL:9]Engraçado. A gente vê ela[N]todo dia e nem nota.[END]`

-------------------------------------
?INCLUDE 'av6A_neil'
-------------------------------------
widestring_06C0D2 `[TPL:6][TPL:B]Neil:[N]Eu acredito que os Anjos[N]Caídos sejam descendentes[N]do povo de Mu.[END]`

-------------------------------------
?INCLUDE 'av6B_villagers1'
-------------------------------------
widestring_06C799 `[TPL:1D][TPL:9]Essa é a Vila dos Anjos[N]Caídos.[FIN][TPL:B]Nossos corpos são frágeis;[N]Até a luz do sol pode nos[N]matar se nos tocar por[N]muito tempo.[END]`
widestring_06C7EF `[TPL:1D][TPL:9]Essa é a Vila dos Anjos[N]Caídos.[FIN][TPL:B]Nossos corpos são frágeis;[N]Até a luz do sol pode nos[N]matar se nos tocar por[N]muito tempo.[END]`
widestring_06C845 `[TPL:1D][TPL:9]Essa é a Vila dos Anjos[N]Caídos.[FIN][TPL:B]Nossos corpos são frágeis;[N]Até a luz do sol pode nos[N]matar se nos tocar por[N]muito tempo.[END]`
widestring_06C9BF `[TPL:1D][TPL:9]Essa é a Vila dos Anjos[N]Caídos.[FIN][TPL:B]Nossos corpos são frágeis;[N]Até a luz do sol pode nos[N]matar se nos tocar por[N]muito tempo.[END]`

-------------------------------------
?INCLUDE 'av6B_villagers3'
-------------------------------------
widestring_06CBEE `[TPL:1D][TPL:A]Há quem diga que somos a[N]próxima etapa da evolução[N]humana.[END]`

-------------------------------------
?INCLUDE 'av6B_villagers2'
-------------------------------------
widestring_06CB5E `[TPL:1D][TPL:A]Uma garota humana chamada[N]Karen esteve aqui agora há[N]pouco.[FIN][TPL:B]O pintor Ishtar ficou[N]encantado com a beleza[N]dela e a levou para o[N]seu ateliê.[END]`

widestring_06CC22 `[TPL:1D][TPL:A]Vou te ensinar o caminho[N]para o ateliê de Ishtar,[N]preste atenção.[FIN][TPL:A]Primeiro, siga o vento,[N]observando a direção em[N]que as tochas se inclinam.[FIN]Passe pelo corredor escuro[N]e pelos ventos fortes até[N]ouvir uma cachoeira.[FIN]Onde o barulho da água for[N]mais intenso, é lá que[N]deve procurar.[END]`

-------------------------------------
?INCLUDE 'av6C_villagers4'
-------------------------------------
widestring_06CA5C `[TPL:1D][TPL:A]Chamam isso de “dança”.[N]É uma das diversões dos[N]humanos.[END]`

-------------------------------------
?INCLUDE 'av6C_villagers5'
-------------------------------------
widestring_06CD9A `[TPL:1D][TPL:9]Dançamos todos os dias[N]tentando sentir algo.[FIN]Alegria, tristeza...[N]Qualquer coisa humana.[FIN][CLD][TPL:8]Mas tudo continua vazio…[END]`

widestring_06CA71 `[TPL:1D][TPL:9]Aquele quadro foi pintado[N]por Ishtar.[FIN]Dizem que todos que posam[N]para ele desaparecem…[END]`

widestring_06CDD4 `[TPL:1D][TPL:A]Ishtar nos retrata com[N]traços cheios de[N]humanidade.[FIN][TPL:B]Mesmo sem saber o que pode[N]lhes acontecer, muitas[N]ainda imploram para serem[N]pintadas.[END]`

widestring_06CE56 `[TPL:1D][TPL:9]Minha parceira de dança tá[N]dentro daquela pintura.[END]`

-------------------------------------
?INCLUDE 'av6B_ocean_ache'
-------------------------------------
widestring_06C714 `[TPL:1D][TPL:9]Ninguém sabe há quanto[N]tempo vivemos aqui.[FIN][TPL:A]Só sei que toda vez que[N]olho para o mar, sinto um[N]aperto no coração…[END]`

widestring_06CB07 `[TPL:1D][TPL:8]Nós não temos emoções…[FIN][TPL:A]Desde o dia em que nasci,[N]nunca sorri, nem derramei[N]uma lágrima.[FIN][CLD][TPL:9]Só existo.[N]Um dia depois do outro…[END]`

-------------------------------------
?INCLUDE 'av6B_musician'
-------------------------------------
widestring_06D0C6 `[TPL:1D][TPL:A]Harpista:[N]A música é o remédio da[N]alma.[FIN][CLD][TPL:9]Uma bela melodia cura[N]qualquer enfermidade.[END]`

-------------------------------------
?INCLUDE 'jeweler_gem'
-------------------------------------

widestring_08D459 `[CLD][TPL:D]Minha Nossa! Você coletou[N]vinte Joias Vermelhas![FIN]Pela minha lista, você faz[N]jus ao Poder Psíquico.[FIN][TPL:E]Esse é um poder misterioso[N]que flui do fundo da minha[N]alma…[FIN][CLD][TPL:D]O poder do Impulso Psíquico[N]de Tim aumentou.[FIN]`

widestring_06C981 `[TPL:1D][TPL:E]Sou escultora. Pretendo[N]fazer mil estátuas antes[N]de morrer…[END]`

-------------------------------------
?INCLUDE 'av6C_only_sleeping'
-------------------------------------
widestring_06D063 `[TPL:0][TPL:A][NAM:0]: Ela tá inconsciente,[N]como se tivesse perdido a[N]alma…[END]`

widestring_06C8B0 `[TPL:1D][TPL:F]Já ouviu falar do pintor[N]Ishtar?[N][PAL:0] Sim[N] Não[PAL:4]`

widestring_06C8DC `[CLD][TPL:E]Nesse caso, ouça mais um[N]pouco o que as pessoas[N]têm a dizer.[END]`

widestring_06C8F7 `[CLD][TPL:D]O ateliê de Ishtar fica do[N]outro lado desta porta.[FIN][TPL:E]Mas além daqui há seres[N]movidos apenas por ódio[N]e destruição.[FIN][CLD][TPL:1D][TPL:D]Se ainda quiser ir,[N]então abra a porta.[END]`

