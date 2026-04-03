;CHAPTER 26


-------------------------------------
?INCLUDE 'wa79_kara'
-------------------------------------
widestring_07A811 `[TPL:1][TPL:A][NAM:1]:[N]Esse tal de Kruk é um[N]animal engraçado, né?[END]`

-------------------------------------
?INCLUDE 'wa79_erik'
-------------------------------------
widestring_07A4C8 `[TPL:3][TPL:9][NAM:3]:[N]Hoje é noite de lua cheia.[FIN][CLD][TPL:3][TPL:8]A Vila tá diferente…[END]`

-------------------------------------
?INCLUDE 'wa79_neil'
-------------------------------------
widestring_07A255 `[TPL:6][TPL:9]Neil: A oeste daqui tem um[N]grande deserto.[FIN]É impossível atravessá-lo[N]a pé sem um Kruk…[END]`

-------------------------------------
?INCLUDE 'wa79_lily'
-------------------------------------
widestring_07AA34 `[TPL:2][TPL:A][NAM:2]:[N]Espero que o pai do Rob[N]se recupere logo.[END]`

-------------------------------------
?INCLUDE 'wa79_lance'
-------------------------------------
widestring_07ADA9 `[TPL:4][TPL:A][NAM:4]: Rob:[N]Acabei de dar o remédio[N]pro meu velho.[FIN][CLD][TPL:4][TPL:9]Ele deve melhorar aos[N]poucos agora…[END]`

-------------------------------------
?INCLUDE 'wa78_moving_woman'
-------------------------------------
widestring_07846A `[TPL:1C][TPL:F]Uma menina de vestido rosa[N]estava fazendo um pedido[N]numa folha de lótus agora[N]há pouco.[END]`

-------------------------------------
?INCLUDE 'wa78_glass_game'
-------------------------------------
widestring_0796A9 `[TPL:1C][TPL:D]Seja bem-vindo ao maior[N]jogo de todos os tempos.[FIN][TPL:F]Esse é o Clube do Copo[N]Russo. Veio participar?[N][PAL:0] Sim[N] Não[PAL:4]`

widestring_0796DE `[CLD][TPL:E]Então some daqui e fecha[N]esse bico! Você não viu[N]nada![END]`
;TODO!!

widestring_079704 `[CLD][TPL:D]Tem certeza que quer[N]participar?![FIN][TPL:E]Isso aqui não é um jogo[N]qualquer. Sua vida tá na[N]linha.[FIN][TPL:F]Vou perguntar de novo:[N]quer mesmo participar?[WAI][N][PAL:0] Sim[N] Não[PAL:4]`

widestring_07977A `[CLD][TPL:D]Muito bem. Seu adversário[N]está logo ali.[FIN][TPL:E]Ele é um veterano nesse[N]jogo. Nunca vi ninguém[N]mais sortudo.[FIN][CLD][TPL:D]Vá em frente. Pergunte a[N]ele sobre as regras.[END]`

widestring_0797E6 `[TPL:1C][TPL:D]Lá se vai mais uma vida[N]jovem essa noite…[END]`

widestring_079610 `[TPL:1C][TPL:E]Não existe nenhum jogo[N]mais emocionante do que[N]esse. Estou eufórica!![END]`

widestring_0795B9 `[TPL:1C][TPL:E]Você ainda é jovem. Não[N]deveria arriscar a vida[N]assim…[END]`

widestring_079835 `[TPL:1C][TPL:C]Você tem coragem, moleque.[END]`

widestring_07986C `[TPL:1C][TPL:D]O seu adversário já ganhou[N]muito dinheiro nesse jogo.[FIN][TPL:E]Fico me perguntando o que[N]será que ele faz com esse[N]dinheiro todo…[END]`

widestring_0792F7 `[TPL:24][TPL:E]Adversário: Hmmm… Mais um[N]tolo veio desperdiçar a[N]própria vida?[FIN]A regra é clara: Há cinco[N]copos, e um deles contém[N]veneno.[FIN]A cada rodada, o jogador[N]da vez escolhe um copo e[N]bebe o seu conteúdo.[FIN][CLD][TPL:24][TPL:D]Quem permanecer vivo no[N]final é o vencedor.[FIN][CLD][TPL:24][TPL:C]Muito bem, eu começo![END]`

widestring_0793B6 `[TPL:24][TPL:D]Adversário:[N]BANZAAAII!![FIN][CLD][TPL:D][SFX:0]Seu adversário virou o[N]copo num só gole![END]`

widestring_079922 `[TPL:0][TPL:E][NAM:0]: Espera…[N]A bebida no copo parece…[N]Manchada de sangue…[FIN]Seria esse mais um dos[N]poderes que despertaram[N]dentro de mim…?[FIN][CLD][TPL:F]Beber o conteúdo do copo?[N][N][PAL:0] Sim[N] Não[PAL:4]`

code_079AAC {
    COP [D0] ( #0F, #00, &code_079AD2 )
    COP [BF] ( &widestring_079922 )
    COP [BE] ( #02, #02, &code_list_079ABC )
}

widestring_079992 `[CLD][TPL:0][TPL:D][NAM:0]:[N]Melhor pular esse copo…[END]`

widestring_0799AF `[CLD][TPL:0][TPL:E][NAM:0][DLY:5]:[N]Meu corpo está ficando…[N]Dormente…[END]`
;TODO!!

widestring_0798E8 `[CLD][TPL:0][TPL:E][NAM:0]:[N]Fechei os olhos e[N]tomei tudo em um só gole![END]`

widestring_079401 `[TPL:24][TPL:D]Adversário:[N]Você é sortudo… Minha vez![END]`

widestring_079422 `[TPL:24][TPL:E]Adversário:[N]Sua vez, moleque! Não vai[N]amarelar agora, hein![END]`

widestring_07944D `[TPL:24][TPL:D]Adversário:[N]Esse é o último copo…[WAI][CLD][PAU:3C][TPL:1C][TPL:D][DLY:2]Espectador:[N]Já chega… O menino venceu…[FIN][DLY:0]Espectador:[N]Isso mesmo! Chega, cara![FIN][TPL:24][TPL:E][DLY:3]Adversário:[N]Não...[PAU:1E] Eu sou o campeão...[N]Não vou ser desonrado...[FIN][CLD][TPL:C][SFX:0][DLY:2]O Homem segura o copo...[END]`

widestring_079520 `[TPL:1C][TPL:E]Espectador: Pare!![N]Você já perdeu o jogo,[N]não precisa peder a vida![FIN][CLD][TPL:E][SFX:0][DLY:3]Ignorando a torcida, o[N]homem bebe o líquido[N]mortal em um só gole.[END]`

-------------------------------------
?INCLUDE 'wa7D_glass_opponent'
-------------------------------------
widestring_078E2D `[TPL:1C][TPL:E]Mulher:[N]Então é você o oponente[N]dele no Copo Russo…[FIN][TPL:F]Meu marido disse que tinha[N]encontrado um bom emprego…[N]Nunca imaginei que seria[N]algo assim.[FIN][CLD][TPL:E]Ele deixou uma carta.[N]"Para o meu oponenteˮ,[N]ela diz.[FIN][CLD][TPL:C]Por favor, fique com ela.[FIN][TPL:E]Além disso, tem 4 Kruks do[N]lado de fora da casa.[N]Cuide bem deles.[END]`

-------------------------------------
?INCLUDE 'wa78_women'
-------------------------------------
widestring_078B3B `[TPL:1C][TPL:D]Mulher: Eu não preciso de[N]dinheiro.[FIN][TPL:E]A felicidade verdadeira é[N]estar junto de quem você[N]ama.[END]`

-------------------------------------
?INCLUDE 'chunk_038000'
-------------------------------------
widestring_039696 `[TPL:C]Tim abre a carta.[FIN][TPL:24][BOR:1][TPL:E] [N]    Para o meu Oponente[N][FIN][TPL:F]Mesmo na morte, não chore[N]por mim. Independentemente[N]do Copo Russo, Meus dias[N]já estavam contados.[FIN]Cerca de seis meses atrás,[N]fui diagnosticado com uma[N]doença incurável.[FIN]Decidi juntar o máximo de[N]dinheiro possível, para[N]que minha esposa e filho[N]nunca passem necessidade.[FIN]Contudo, o dinheiro que[N]ganhei veio às custas da[N]desgraça alheia.[FIN]Acho que essa é a última[N]vez que faço algo assim…[FIN]Se eu for derrotado nesse[N]jogo, quero compartilhar[N]um pouco da minha fortuna[N]com você, bravo oponente.[FIN]Cuide bem dos meus quatro[N]amados Kruks.[END]`

-------------------------------------
?INCLUDE 'wa78_prize_kruk'
-------------------------------------
widestring_079B30 `[TPL:0][TPL:E]Tim:[N]Esses são os Kruks[N]que eu ganhei…[FIN][CLD][TPL:0][TPL:D]Preciso dar a notícia pro[N]pessoal.[END]`

widestring_07A833 `[TPL:1][TPL:B][NAM:1]:[N]Você sabia que a família[N]do Neil tem uma empresa[N]na cidade de Euro?[END]`

widestring_07A506 `[TPL:3][TPL:A][NAM:3]: Não acredito que a[N]gente vai se despedir do[N]Rob e da Lillie…[END]`

widestring_07ADEA `[TPL:4][TPL:A]Rob:[N]Foi mal, pessoal… Mas vou[N]ter que ficar por aqui.[FIN]Não posso seguir viagem e[N]deixar meu pai sozinho[N]aqui, naquele estado.[FIN][CLD][TPL:4][TPL:9]E tem mais uma coisa. É[N]vergonhoso de falar, mas…[FIN]Eu e a Lillie estamos[N]namorando.[FIN][TPL:A]Claro que não é nada feito[N]por impulso. Eu quero[N]ficar com ela pra sempre.[FIN][CLD][TPL:4][TPL:9]E a Lillie também decidiu[N]ficar aqui comigo.[FIN]Foi incrível viajar com[N]vocês.[FIN]Tim… espero de verdade[N]que sua jornada dê certo.[END]`

widestring_07AA5E `[TPL:2][TPL:9][NAM:2]: Eu também decidi[N]ficar aqui na Vila.[FIN]O motivo… Pode perguntar[N]pro Rob.[END]`

widestring_07A2BE `[TPL:6][TPL:A]Neil: Espera… Você ganhou[N]4 Kruks!? Mas eles são[N]caríssimos![FIN][CLD][TPL:6][TPL:9]E por que essa cara tão[N]triste…?[FIN][CLD][TPL:0][TPL:9][DLY:2]Tim:[N]............[FIN][CLD][TPL:6][TPL:9]Bom, melhor não insistir[N]no assunto.[FIN][TPL:A]Nosso próximo destino é a[N]cidade de Euro, a oeste[N]daqui.[FIN]O Rob e a Lillie vão ficar[N]aqui em Termágua. Pergunte[N]a eles o motivo.[END]`
;TODO!!

widestring_07A366 `[TPL:6][TPL:B]Neil: Eu acho que quando[N]um garoto e uma garota se[N]apaixonam, é um momento[N]mágico.[FIN][CLD][TPL:6][TPL:A]É um sentimento que a[N]gente quer guardar pra[N]sempre e nunca esquecer.[FIN][CLD][TPL:6][TPL:9]Enfim. Meus pais moram na[N]cidade de Euro.[FIN][TPL:A]Se a gente for até lá,[N]acho que isso pode ajudar[N]você de alguma maneira.[FIN][CLD][TPL:6][TPL:9]Então é isso.[N]Vamos para Euro!![END]`

