;CHAPTER 8


------------------------------
?INCLUDE 'it1A_lily'
------------------------------
widestring_04F53C `[TPL:2][TPL:A][NAM:2]: Pronto, chegamos.[N]Essa é a morada da[N]tribo da lua.[END]`

widestring_04F7C1 `[TPL:B][TPL:2][LU1:2A]Espera aí! A gente[N]veio até aqui por um[N]motivo, lembra? Não dá pra[N]simplesmente ir embora![END]`
;TODO!!!!

widestring_04F7F7 `[DLG:3,6][SIZ:D,3][TPL:0][NAM:0]: [N](Não posso sair sem a[N] Estátua Inca…)[PAL:0][END]`
;TODO!!!!

widestring_04F860 `[TPL:9][TPL:2][NAM:2]: Nada de sair[N]explorando por aí.[FIN]Vamos falar com a Tribo[N]da Lua primeiro.[END]`

------------------------------
?INCLUDE 'it1A_moon_tribe'
------------------------------
widestring_09D1FC `[TPL:1A][TPL:D][DLY:0]Voz Misteriosa: Boooa[N]noiteee, booooa noiteee...[FIN]Saíram pra dar[N]uma voltinha?[FIN][CLD][TPL:0][TPL:C][NAM:0]: Quem tá aí?![FIN][TPL:1A][TPL:E][DLY:0]Voz Misteriosa: Olhe para[N]cima. Nossos corpos são[N]mais leves que o ar.[FIN][CLD][TPL:0][TPL:C][NAM:0]: O que... vocês são?![FIN][TPL:1A][TPL:F]Voz Misteriosa: Adivinhe…[WAI][N] Parente do Algodão Doce[N] Homem-Pássaro[N] Alma de um morto…`

widestring_09D2D0 `[CLR][CLD][TPL:D]Voz Misteriosa:[N]Errrrrooooou…[FIN][TPL:E][DLY:0]Nós somos a Tribo da Lua.[N]Alguns também nos chamam[N]de Sombras…[END]`

widestring_09D388 `[TPL:1A][TPL:D][DLY:0]Sombra: O cometa é um[N]agente da destruição.[FIN][TPL:E]Sua luz distorce todas as[N]formas de vida… É uma luz[N]maldita.[FIN][CLD][TPL:D][DLY:0]Muito tempo atrás, houve[N]uma guerra terrível.[FIN][TPL:F]O cometa é um vestígio[N]esquecido de uma arma[N]usada nesse tempo[N]ancestral…[FIN][CLD][TPL:0][TPL:D][NAM:0]: O mundo está em[N]perigo?[FIN][TPL:1A][TPL:E]Sombra: Exatamente. Você é[N]esperto, garoto… Mas ainda[N]tem muito o que aprender…[END]`

widestring_09D30F `[TPL:1A][TPL:D][DLY:0]Sombra: Onde há luz,[N]há sempre sombra.[FIN][TPL:E]Bastou um único banho na[N]luz do cometa…[N]E mudamos para sempre.[FIN][CLD][TPL:D][DLY:0]Desde então, vivemos em[N]silêncio…[FIN][CLD][TPL:C][DLY:0]Em um mundo sem luz.[END]`

code_09D1DD {
    COP [BF] ( &widestring_09D462 )
    COP [BE] ( #02, #02, &code_list_09D1E7 )
}

widestring_09D462 `[TPL:1A][TPL:D][DLY:0]Sombra: Um dos nossos foi…[N]levado.[FIN][CLD][TPL:E]Sabe para onde ele foi?[N][PAL:0] Sim[N] Não`

widestring_09D4AD `[CLR][CLD][TPL:D][DLY:0]Sombra: Talvez ele esteja[N]atrás de você…[FIN][CLD][TPL:C][DLY:0]Mwahahahahaha…[END]`

widestring_09D4DC `[TPL:1A][TPL:E][DLY:0]Sombra: O cometa se[N]aproxima a cada 800 anos.[N]Esta é a quarta vez.[FIN][TPL:E]Quanto mais sua luz nos[N]toca, mais cresce o Poder[N]das Sombras…[FIN][CLD][TPL:D][DLY:0]Quem sabe o que nascerá[N]desta vez…?[END]`

widestring_09D574 `[TPL:1A][TPL:E][DLY:0]Sombra: Nós transcendemos[N]o tempo. Vivemos eterna-[N]-mente…[FIN][TPL:E]Vimos com nossos próprios[N]olhos a queda do Império[N]Inca…[FIN]Há uma Estátua Inca[N]repousando na caverna[N]abaixo…[FIN][CLD][TPL:D][DLY:0]Se desejar, ela pode ser[N]sua…[FIN]Vá dar uma olhadinha lá[N]embaixo…[FIN][CLD][TPL:C][DLY:0]Mwahahahahaha…[END]`

widestring_04F575 `[TPL:2][TPL:9][NAM:2]: Eu vou te esperar[N]aqui, tá?[END]`

------------------------------
?INCLUDE 'it1B_trial'
------------------------------
widestring_04F941 `[TPL:1A][TPL:B][DLY:0]Sombra: Nesta caverna[N]estão os resquícios de[N]criaturas banhadas pela[N]luz do cometa.[FIN][CLD][TPL:1A][TPL:B][DLY:0]Seres tristes… Que já não[N]carregam nada além de um[N]coração consumido por ódio[N]e destruição.[FIN][TPL:B]Se conseguir derrotá-los[N]em menos de 20 segundos,[N]pode ficar com a Estátua[N]Inca.[FIN][CLD][TPL:8][DLY:0]Mwahahahahaha…[END]`

widestring_04FA25 `[TPL:1A][TPL:E]Sombra: Nesse caso, nada[N]feito. Sem estátua pra[N]você. Mwahahahahaha…[END]`
;TODO!!!

widestring_04FA65 `[TPL:1A][TPL:E]Sombra: Ora, ora… Que[N]garotinho impressionante.[N]Mwahahahahaha…[FIN][CLD][TPL:D]Muito bem, pode ficar com[N]a Estátua Inca.[END]`

widestring_04F591 `[TPL:2][TPL:9][NAM:2]:[N]O que houve?[FIN]…Pelo seu rosto, acho que[N]não deu certo, né…?[FIN]Não desanima! Tenta de[N]novo e dá o seu melhor![END]`
;TODO!!!

widestring_04F5EA `[TPL:2][TPL:A][NAM:2]: Uau! Então essa é[N]a estátua! [NAM:0], você é[N]incrível![FIN][CLD][TPL:9][TPL:2]Com essa, você reuniu as[N]duas estátuas, certo?[FIN][TPL:B]Está pensando em ir às[N]ruínas Incas?[N][PAL:0] Sim[N] Não`

widestring_04F68F `[CLD][TPL:0][TPL:9][NAM:0]: Sim… Meu pai me[N]chamou.[FIN][TPL:A]É assustador enfrentar[N]criaturas atingidas pela[N]luz do cometa…[FIN]Mas se ele estiver vivo,[N]preciso encontrá-lo, mesmo[N]que eu corra perigo.[FIN]Ninguém entende esse[N]sentimento sem ter perdido[N]os pais…[FIN][CLD][TPL:8][TPL:2][NAM:2]: Ai, meninos…[FIN][TPL:9]Tá bom. Vamos às ruínas[N]incas.[FIN][CLD][TPL:A]E assim, os dois partiram[N]rumo às ruínas do antigo[N]Império Inca…[END]`

widestring_04F653 `[CLR][CLD][TPL:A][TPL:2]Ah, qual é… Eu te conheço,[N]sabia? Mesmo dizendo que[N]não vai... você vai sim.[FIN]`
;TODO!!!!

------------------------------
?INCLUDE 'ir1C_lily'
------------------------------
widestring_09CAE5 `[TPL:2][TPL:D][NAM:2]: É aqui… A entrada[N]das ruínas incas.[FIN][TPL:E]Os incas viviam em muitas[N]partes, mas dizem que é[N]bem aqui, neste lugar,[FIN]que o enigma da antiga[N]lenda inca está escondido.[FIN]Quando eu era bem pequena,[N]ouvi uma história do[N]ancião…[FIN][TPL:E]Dizem que, certa vez, os[N]incas foram atacados e[N]então tomaram uma decisão:[FIN]abandonar sua terra natal[N]e partir em busca de um[N]novo lar.[FIN][CLD][TPL:2][TPL:F]Em segredo, os incas[N]construíram um navio[N]colossal, feito do mais[N]puro ouro…[FIN][CLD][TPL:2][TPL:D]E embarcaram nele com seus[N]tesouros mais preciosos…[FIN][CLD][TPL:E][TPL:2]Mas… Não há registro de[N]que esse navio tenha algum[N]dia zarpado…[FIN][TPL:F]Talvez esse tal “Navio de[N]Ouro”, que dizem estar nas[N]ruínas incas, seja o mesmo[N]daquela história.[FIN][CLD][TPL:E][TPL:2]O ancião nunca contou essa[N]lenda a ninguém de fora do[N]clã Itory. Nunca.[FIN][CLD][TPL:D][TPL:2]O que será que ele espera[N]de você, [NAM:0]…?[END]`

------------------------------
?INCLUDE 'ir1C_kara'
------------------------------
widestring_09CF19 `[TPL:1][TPL:9][NAM:1]: Isso foi cruel,[N]sabiam?![FIN][TPL:A]Iam continuar andando[N]assim, me deixando pra[N]trás?![END]`

widestring_09CCD0 `[TPL:2][TPL:A][NAM:2]: O que você tá[N]fazendo num lugar perigoso[N]como esse?![FIN][CLD][TPL:1][TPL:9][NAM:1]: A vovó [NAM:6] me[N]contou sobre as ruínas.[FIN]Estou esperando por vocês[N]aqui há horas…![FIN]Achei que tinham me[N]deixado de lado de vez…[FIN]Pelo menos podiam ter dito[N]pra onde iam![FIN][TPL:A]Além disso… [NAM:0], você está[N]procurando alguma coisa[N]aqui nas ruínas, não é?[FIN][TPL:A]Se o [NAM:0] tá aqui, se[N]esforçando tanto…[N]não dá pra eu ficar na[FIN]vila, comendo sossegada[N]como se nada estivesse[N]acontecendo.[FIN][CLD][TPL:1][TPL:9]Eu vou esperar ele voltar.[N]Aqui mesmo.[FIN][TPL:2][TPL:9][NAM:2]: Ai, ai… Que menina[N]mimada…[FIN][TPL:A]Tá bom, vai. Eu também vou[N]ficar aqui com você. Tá[N]bom assim?[END]`

widestring_09CE01 `[TPL:2][TPL:9][NAM:2]: [NAM:0], lembre-se das[N]palavras do Ancião.[FIN][TPL:9]"No Penhasco Larai, sob as[N]ruínas...[FIN]Repouse as duas estátuas[N]divinas...[FIN]Onde o sopro sagrado não[N]alcança.[FIN]E o vento o guiará com[N]esperança,[FIN]Ao tão sonhado...[WAI][N]Navio Dourado...ˮ[FIN]Gravou bem o que ele[N]falou?[END]`

widestring_09CF59 `[TPL:1][TPL:E][NAM:1]: O que você tá[N]fazendo? Encontrou o que[N]estava procurando? Força![END]`
