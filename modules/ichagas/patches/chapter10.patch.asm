;CHAPTER 10


---------------------------------------
?INCLUDE 'gs2C_descent'
---------------------------------------
widestring_0581FF `[TPL:0][TPL:D][DLY:0][NAM:0]: É esse o lendário[N]Navio Dourado dos Incas?![FIN]Parece que tem alguém por[N]aqui…[END]`

---------------------------------------
?INCLUDE 'gs2C_crew5'
---------------------------------------
widestring_0583E7 `[TPL:1B][TPL:C]Viva! Viva! O Rei voltou![FIN][::][TPL:0][TPL:D][NAM:0]:[N](Como é que é?!)[END]`

---------------------------------------
?INCLUDE 'gs2C_crew4'
---------------------------------------
widestring_058394 `[TPL:1B][TPL:D]Majestade![N]Está são e salvo…!![FIN][::][TPL:0][TPL:E][NAM:0]:[N](Eles acham que[N] EU sou o Rei?!)[END]`

---------------------------------------
?INCLUDE 'gs2C_crew1'
---------------------------------------
widestring_058260 `[TPL:1B][TPL:E]Majestade…! Está a salvo![N]Agora finalmente poderemos[N]zarpar rumo ao mar azul![END]`

---------------------------------------
?INCLUDE 'gs2C_crew2'
---------------------------------------
widestring_0582CC `[TPL:1B][TPL:C]Isso é motivo para festa![FIN][TPL:D]Esperamos tanto tempo pelo[N]seu retorno![END]`

---------------------------------------
?INCLUDE 'gs2C_crew3'
--------------------------------------
widestring_05834D `[TPL:1B][TPL:D]Sua Majestade, a Rainha,[N]está na cabine abaixo.[FIN]Ela ficará feliz em vê-lo[N]bem.[END]`

---------------------------------------
?INCLUDE 'gs2E_sleep'
---------------------------------------
widestring_05870A `[TPL:1B][TPL:9]Ah, Majestade. Vejo que[N]está explorando o navio.[FIN]Mas imagino que também[N]deva estar cansado.[FIN][TPL:A]Depois de conhecer tudo,[N]Fique à vontade para[N]descansar nesta cama.[END]`

---------------------------------------
?INCLUDE 'gs2E_crew0'
---------------------------------------
widestring_0587A4 `[TPL:1B][TPL:E]Ao final dessa caverna[N]escura, fulgura uma luz[N]deslumbrante…[FIN]Quando navegarmos nesse[N]mar de luz, alcançaremos a[N]liberdade eterna.[END]`

---------------------------------------
?INCLUDE 'gs2E_crew3'
---------------------------------------
widestring_0589DB `[TPL:1B][TPL:A]Por que tivemos que fugir?[N]O Império Inca era o nosso[N]lar…[END]`

---------------------------------------
?INCLUDE 'gs2E_crew2'
---------------------------------------
widestring_058940 `[TPL:8]Majestade![FIN][TPL:9]A Estátua Mística está[N]dentro deste baú.[FIN][CLD][::][TPL:9]Estamos nos preparando[N]para zarpar em breve.[FIN]Que tal subir até o cesto[N]da gávea?[FIN][TPL:A]De lá o senhor poderá ter[N]uma visão privilegiada de[N]nossa partida.[END]`

---------------------------------------
?INCLUDE 'gs2E_crew1'
---------------------------------------
widestring_05883E `[TPL:A]A rainha ainda carrega com[N]carinho o anel que recebeu[N]de Vossa Majestade.[FIN][TPL:B]Ela o guarda desde o dia[N]em que vocês se separaram,[N]durante o ataque cruel dos[N]invasores.[FIN][CLD][TPL:9]Desde então, ela só tem[N]pensado em seu retorno…[END]`

---------------------------------------
?INCLUDE 'gs2E_queen'
---------------------------------------
widestring_058A30 `[TPL:3][TPL:A]Rainha Inca: Estou tão[N]feliz em vê-lo bem, meu[N]querido![FIN][CLD][::][TPL:3][TPL:A]Eu trouxe comigo a Estátua[N]Mística do Vento,[N]exatamente como pediu.[FIN]Foi um presente dos[N]deuses, confiado a você[N]por um motivo.[FIN][CLD][TPL:3][TPL:9]Guardei-a com cuidado no[N]baú do depósito.[FIN]Vá até lá… Veja com seus[N]próprios olhos.[END]`

---------------------------------------
?INCLUDE 'itemget_table_01FD24'
---------------------------------------
widestring_01FEA8 `[CLD][TPL:9][DLY:2]Você obteve uma[N]Estátua Mística!`

---------------------------------------
?INCLUDE 'gs2C_crow_crew'
---------------------------------------
widestring_0584BC `[TPL:1B][TPL:D]Vigia: Majestade, olhe![N]Estamos saindo da caverna![END]`

widestring_0584FB `[TPL:1B][TPL:D]Vigia: Depois de tanto[N]tempo vivendo nas trevas,[FIN]ver essa luz sobre o mar[N]é como ver a face de Deus.[FIN][CLD][TPL:C]O mundo é tão bonito…[FIN][TPL:D]Como pode haver invasores[N]que destroem a natureza?[END]`

widestring_058759 `[TPL:1B][TPL:9]Desculpe oferecer uma cama[N]tão simples, majestade.[FIN]Mas por favor, descanse um[N]pouco.[END]`

widestring_0586CC `[TPL:0][TPL:F][DLY:0][NAM:0]: Meu corpo exausto foi[N]cedendo ao sono, enquanto[N]minha mente me arrastava[N]para um sonho profundo…[END]`

---------------------------------------
?INCLUDE 'gs2A_shira'
---------------------------------------

code_059484 {
    COP [CC] ( #0E )
    COP [BF] ( &widestring_0594B8 )
    COP [BE] ( #02, #02, &code_list_059491 )
}

widestring_0594B8 `[PAU:50][TPL:0][TPL:8][NAM:0]: M-mãe…!?[FIN][TPL:2][TPL:9][DLY:0][NAM:8]:[N][NAM:0], olhe para o céu.[FIN][CLD][TPL:2][TPL:8][DLY:0]Aquele cometa não é lindo?[FIN][TPL:A]Ele viaja pelo espaço[N]durante longos séculos[N]até alcançar a Terra…[FIN][CLD][TPL:2][TPL:9][DLY:0]Depois retoma seu caminho,[N]afastando-se novamente.[FIN][TPL:B][DLY:0]Alguns chamam este cometa[N]de Estrela do Azar. Outros[N]o chamam de Estrela da[N]Sorte…[FIN][NAM:0],[N]O que você acha?[N][PAL:0] Estrela do Azar [N] Estrela da Sorte[PAL:4]`

widestring_0595B4 `[CLD][TPL:2][TPL:8]Entendo…[FIN][TPL:2][TPL:9][DLY:0]Então vamos rezar para que[N]nada de mal aconteça…[FIN][JMP:&widestring_0595E6+M]`

widestring_0595E6 `[CLD][TPL:2][TPL:8]Entendo…[FIN][TPL:2][TPL:9][DLY:0]Então vamos rezar para que[N]a sorte nunca vá embora…[FIN][::][TPL:2][TPL:A]Meu querido [NAM:0].[N]Eu estarei sempre[N]olhando por você.[END]`

---------------------------------------
?INCLUDE 'gs2D_lily'
---------------------------------------
widestring_058DBB `[TPL:2][TPL:8][NAM:2]: [NAM:0]![FIN][NAM:0]! Acorda![END]`

---------------------------------------
?INCLUDE 'gs2D_lance'
---------------------------------------
widestring_05902D `[TPL:4][TPL:B][NAM:4]: Cê tava todo estranho[N]nos últimos dias, então a[N]gente te seguiu pra ver[N]o que tava rolando.[FIN][CLD][TPL:4][TPL:9]De repente a gente foi[N]parar numa vila estranha…[FIN][TPL:2][TPL:A][NAM:2]: Ei! Esse é o lugar[N]onde eu nasci! Não fale[N]mal da minha vila![FIN][CLD][TPL:4][TPL:9][NAM:4]: Mas não é bizarro?[N]É um lugar invisível…![FIN][CLD][TPL:2][TPL:9][DLY:0][NAM:2]:[N].........[FIN][CLD][TPL:4][TPL:A][NAM:0], nem vem com essa de[N]querer viajar escondido[N]da gente.[FIN][TPL:A]Amigo de verdade divide[N]tanto as coisas boas[N]quanto as ruins.[END]`

widestring_058DDA `[TPL:2][TPL:B][NAM:2]: Você demorou tanto[N]para voltar que pedimos[N]para o Ancião divinar onde[N]você estava.[FIN][CLD][TPL:2][TPL:A]Ele teve uma visão em que[N]você estava à deriva, bem[N]no meio do oceano![FIN][CLD][TPL:2][TPL:8]Foi um susto danado, viu?[END]`

---------------------------------------
?INCLUDE 'gs2B_bones'
---------------------------------------
widestring_058BD7 `[TPL:0][TPL:A][NAM:0]:[N]Uma pessoa Inca estava[N]aqui agora há pouco…[END]`

---------------------------------------
?INCLUDE 'gs2B_seth'
---------------------------------------
widestring_05966E `[TPL:5][TPL:E][NAM:5]: Encontrei essa[N]joia estranha aqui no[N]navio.[FIN][CLD][TPL:5][TPL:C]Quero que fique com ela.[FIN][CLD][TPL:C]Obteve uma Joia Vermelha![END]`

widestring_0596C1 `[TPL:5][TPL:E]Pensando bem, acho que é a[N]primeira vez que te dou[N]alguma coisa, não é?[FIN][CLD][TPL:5][TPL:C]Cuide bem dela.[END]`

---------------------------------------
?INCLUDE 'gs2B_erik'
---------------------------------------
widestring_059240 `[TPL:3][BOR:2][DLG:8,8][SIZ:4,1]Aaaaaah![FIN][CLD][::][TPL:3][TPL:C][NAM:3]: Meu Deus…!![FIN][TPL:D]Não me assusta[N]assim não, Tim…![END]`

---------------------------------------
?INCLUDE 'gs2D_kara'
---------------------------------------
widestring_058C21 `[TPL:1][TPL:A][NAM:1]: Eles morreram[N]esperando o rei que[N]jamais retornou…[FIN]Eu não suporto que pessoas[N]tão pacíficas tenham suas[N]vidas despedaçadas assim…[END]`

---------------------------------------
?INCLUDE 'gs2D_mummy'
---------------------------------------
widestring_058B4F `[TPL:0][TPL:9]A múmia da rainha repousa[N]em silêncio.[FIN][TPL:A]Há um anel de ouro em um[N]de seus dedos finos e[N]compridos…[END]`

widestring_058E4A `[TPL:2][TPL:B][NAM:2]:[N]De todas as preciosidades[N]que os Incas trouxeram a[N]este navio, este anel[FIN][CLD][TPL:2][TPL:9]devia ser um dos tesouros[N]mais incríveis…[FIN]Imagino que nada brilhava[N]tanto quanto ele na época.[FIN][TPL:1][TPL:B][NAM:1]: É chocante pensar[N]em quantas pessoas[N]perderam a vida em troca[N]de anéis como este.[FIN][CLD][TPL:1][TPL:A]Mas ao mesmo tempo, é[N]impossível não querer ter[N]algo tão extraordinário…[FIN][CLD][TPL:1][TPL:9]É tão fofo…[N][WAI]Vou ficar com ele.[FIN][TPL:2][TPL:A][NAM:2]: Você não tem[N]juízo!? E se ele for[N]amaldiçoado…?![END]`

widestring_058F44 `[TPL:1][TPL:8][NAM:1]: O q-quê?[END]`

widestring_058C8F `[TPL:1][TPL:8][NAM:1]: O que foi isso…?[PAL:0][END]`

widestring_058F53 `[TPL:2][TPL:9][NAM:2]: Pode ser um[N]Leviatã…![FIN][TPL:B]Dizem que nestas águas[N]nadam peixes gigantescos[N]e famintos, verdadeiros[N]monstros…!![END]`

widestring_05913D `[TPL:4][TPL:8][NAM:4]: Você tá bem…?[END]`

widestring_059157 `[TPL:5][TPL:8][DLY:2]Aaaaaaaaaaaaaaah…![FIN][CLD][TPL:4][TPL:9][NAM:4]: É o [NAM:5]…![N]Está vindo do convés…![END]`

widestring_0592FF `[TPL:4][TPL:D][NAM:4]: O que aconteceu com o[N][NAM:5]…?! O que foi isso?![FIN][TPL:3][TPL:D][DLY:1][NAM:3]:[N]O [NAM:5]… O [NAM:5]…[FIN]Um peixe gigante acertou o[N]navio…[FIN]O [NAM:5] caiu no mar…[FIN]Acho que ele[N]foi devorado…![FIN][CLD][TPL:4][TPL:C][NAM:4]: Como é que é…?![END]`

widestring_0593DA `[TPL:3][TPL:D][NAM:3]: Aaaaaaaah![N]É aquele peixe de novo…![FIN][CLD][TPL:3][TPL:D]A gente vai virar[N]sobremesa…![FIN][CLD][TPL:4][TPL:D][NAM:4]: Para de chorar e[N]segura em alguma coisa!![END]`
