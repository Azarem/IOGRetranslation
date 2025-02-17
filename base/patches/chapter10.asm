;CHAPTER 10


---------------------------------------
?INCLUDE 'gs2C_descent'
---------------------------------------
widestring_0581FF `[TPL:0][TPL:D][NAM:0]: Is this the Incan[N]Gold Ship?![FIN]Oh…?[N]People are around…[END]`

---------------------------------------
?INCLUDE 'gs2C_crew5'
---------------------------------------
widestring_0583E7 `[TPL:1B][TPL:E]Hooray! Hooray! His[N]Majesty, the King, has[N]returned![END][JMP:&widestring_058394+M]`

---------------------------------------
?INCLUDE 'gs2C_crew4'
---------------------------------------
widestring_058394 `[TPL:1B][TPL:D]Ah, Your Majesty![N]You're safe and well…!![FIN][::][TPL:0][TPL:D][NAM:0]: (They're calling ME[N]the King???)[END]`

---------------------------------------
?INCLUDE 'gs2C_crew1'
---------------------------------------
widestring_058260 `[TPL:1B][TPL:F]Your Majesty…! You're[N]safe! With this, we can[N]finally embark to the deep[N]blue sea.[END]`

---------------------------------------
?INCLUDE 'gs2C_crew2'
---------------------------------------
widestring_0582CC `[TPL:1B][TPL:D]This cannot go without[N]congratulations…![FIN][TPL:E]We had been waiting for a[N]long time, but you've[N]come…![END]`

---------------------------------------
?INCLUDE 'gs2C_crew3'
--------------------------------------
widestring_05834D `[TPL:1B][TPL:F]Her Majesty the Queen is[N]in the cabin. Please hurry[N]and show her how lively[N]you look.[END]`

---------------------------------------
?INCLUDE 'gs2E_sleep'
---------------------------------------
widestring_05870A `[TPL:1B][TPL:E]Ah, Your Majesty. You're[N]sightseeing on the ship's[N]interior, right?[FIN]However, Your Majesty must[N]also be tired.[FIN]Once you've visited[N]everywhere, please rest in[N]this bed for a while.[END]`

---------------------------------------
?INCLUDE 'gs2E_crew0'
---------------------------------------
widestring_0587A4 `[TPL:1B][TPL:E]Past this cavern embraced[N]by darkness, we can see a[N]dazzling light…[FIN][TPL:F]So that we could obtain[N]eternal freedom, we[N]departed to an ocean[N]filled in that light.[END]`

---------------------------------------
?INCLUDE 'gs2E_crew3'
---------------------------------------
widestring_0589DB `[TPL:1B][TPL:A]Why did we have to escape?[N]The Incan Empire was our[N]home, and yet…[END]`

---------------------------------------
?INCLUDE 'gs2E_crew2'
---------------------------------------
widestring_058940 `[TPL:1B][TPL:A]Ah, Your Majesty. The[N][NAM:D] [NAM:E] is inside of[N]this box.[FIN]Moreover, it seems that we[N]should be prepared for[N]departure soon.[FIN][TPL:B]What will you do? Will you[N]climb the lookout tower[N]and take a look for[N]yourself?[FIN]You'll be able to watch[N]as we depart.[END]`

---------------------------------------
?INCLUDE 'gs2E_crew1'
---------------------------------------
widestring_05883E `[TPL:1B][TPL:12]Her Majesty, the Queen,[N]has carefully put on the[N]ring that Your Majesty had[N]bestowed upon her[N]previously.[FIN][CLD][TPL:1B][TPL:8]Ah, that's right.[FIN][TPL:B]Your Majesty sent the ring[N]when you and the Queen[N]were driven out by the[N]invaders and separated.[FIN]As for the Queen, she's[N]probably only concerned[N]with how well Your Majesty[N]is doing.[END]`

---------------------------------------
?INCLUDE 'gs2E_queen'
---------------------------------------
widestring_058A30 `[TPL:3][BOR:5][TPL:B]Incan Queen: How wonderful[N]that you've returned safe[N]and well for me, my[N]darling.[FIN]The [NAM:D] [NAM:E] of the[N]wind that you had spoken[N]of had protected me many[N]times until today![FIN]You said it was a stone[N]statue blessed by the[N]gods, right?[FIN][::][TPL:3][BOR:5][TPL:B]I believe it has been[N]placed in a treasure box[N]in the storehouse below;[FIN]please confirm it with[N]your own eyes.[END]`

---------------------------------------
?INCLUDE 'itemget_table_01FD24'
---------------------------------------
widestring_01FEA8 `Found a [NAM:D] [NAM:E]!`

---------------------------------------
?INCLUDE 'gs2C_crow_crew'
---------------------------------------
widestring_0584BC `[TPL:1B][TPL:E]Lookout: King, please look[N]outside. The ship is[N]leaving the cave![END]`

widestring_0584FB `[TPL:1B][TPL:E]Lookout: We've been living[N]in darkness for a long[N]time.[FIN]For us, the light of the[N]gods is in the brightness[N]of this ocean.[FIN]Although these kinds of[N]beautiful things are in[N]the world,[FIN]I wonder why invaders are[N]born who destroy nature?[END]`

widestring_058759 `[TPL:1B][TPL:B]I'm sorry we only have a[N]humble bed like this this[N]to offer; please, take[N]your time and rest.[END]`

widestring_0586CC `[TPL:0][TPL:F][NAM:0]: In an intense state[N]of drowsiness, I had been[N]lured into a deep, deep[N]dream.[END]`

---------------------------------------
?INCLUDE 'gs2A_shira'
---------------------------------------

code_059484 {
    COP [CC] ( #0E )
    COP [BF] ( &widestring_0594B8 )
    COP [BE] ( #02, #02, &code_list_059491 )
}

widestring_0594B8 `[PAU:50][TPL:0][TPL:8][NAM:0]: M-mom…!?[FIN][TPL:2][TPL:9][NAM:0]'s mother, [NAM:8]: [NAM:0][N]Please look at the sky…[FIN]See, isn't that comet out[N]there pretty?[FIN][TPL:B]Hey, about that comet.[N]It arrives at the Earth[N]after many, many years,[N]then goes away again.[FIN]Even when there are people[N]who call it a star that[N]summons misfortune,[FIN]there are also those who[N]call it a star of luck…[FIN][NAM:0].[N]Which do you think it is?[N][PAL:0] Star of misfortune [N] Star of luck[PAL:4]`

widestring_0595B4 `[CLR]Is that how it is… Well,[N]then I'll pray that the[N]misfortune doesn't visit,[N]okay…?[FIN][JMP:&widestring_0595E6+M]`

widestring_0595E6 `[CLR]All right…[N]Then [LU2:71][LU1:D7]happiness[N][LU1:84]slip away….[FIN][::]My dear [NAM:0]. You know,[N]I'll always be watching[N]over you.[END]`

---------------------------------------
?INCLUDE 'gs2D_lily'
---------------------------------------
widestring_058DBB `[TPL:2][TPL:8][NAM:2]: [NAM:0]![FIN][NAM:0]! Get up![END]`

---------------------------------------
?INCLUDE 'gs2D_lance'
---------------------------------------
widestring_05902D `[TPL:4][TPL:A][NAM:4]: Ya were actin'[N]weird, so tha three o' us[N]went sneakin' behind ya.[FIN]Then we ended up at a[N]weird village…[FIN][TPL:2][TPL:B][NAM:2]: Waaait a second.[N]That's where I was born,[N]so how can you call it a[N]weird village…!?[FIN][CLD][TPL:4][TPL:9][NAM:4]: Ain't it weird[N]enough…?[FIN]It's a village ya can't[N]see…[FIN][NAM:0]. Don't go hidin' yer[N]journey from us.[FIN][TPL:A]Ya ain't friends unless ya[N]share the fun times and[N]the hard times.[END]`

widestring_058DDA `[TPL:2][TPL:B][NAM:2]: You were taking[N]too long to come back, so[N]we got a prediction from[N]the Elder.[FIN]He said you were alone,[N]roaming the sea. We were[N]shocked![END]`

---------------------------------------
?INCLUDE 'gs2B_bones'
---------------------------------------
widestring_058BD7 `[TPL:0][TPL:A][NAM:0]: An Incan person was[N]standing here a little bit[N]ago…[END]`

---------------------------------------
?INCLUDE 'gs2B_seth'
---------------------------------------
widestring_05966E `[TPL:5][TPL:E][NAM:5]: A little while ago[N]I found this odd jewel[N]inside the ship.[FIN]Here, I'll give it to you,[N]alright?[FIN][CLD][TPL:C][NAM:0] received a Red Jewel![END]`

widestring_0596C1 `[TPL:5][TPL:F]Now that you mention it,[N]this might be the first[N]time I’ve given something[N]to you.[FIN]Please treasure it.[END]`

---------------------------------------
?INCLUDE 'gs2B_erik'
---------------------------------------
widestring_059240 `[TPL:3][TPL:D][NAM:3]: Wah…![N]You surprised me…!![FIN]Geez, [NAM:0].[N]Don't scare me…![END]`

---------------------------------------
?INCLUDE 'gs2D_kara'
---------------------------------------
widestring_058C21 `[TPL:1][TPL:B][NAM:1]: They died waiting[N]for an Incan King that[N]they couldn’t expect to[N]return…[FIN]In the end, I can't stand[N]that people who were[N]living in peace had their[N]lives shattered…[END]`

---------------------------------------
?INCLUDE 'gs2D_mummy'
---------------------------------------
widestring_058B4F `[TPL:0][TPL:9]The queen's mummy is[N]sleeping quietly.[FIN][TPL:A]A gold ring seemed to be[N]placed on its long,[N]slender finger…[END]`

widestring_058E4A `[TPL:2][TPL:B][NAM:2]: That ring must be[N]from the golden treasures[N]that were said to have[N]been loaded on this boat.[FIN]I wonder if it wasn't[N]outshining the other[N]golden artifacts.[FIN][TPL:1][TPL:B][NAM:1]: Pillagers must[N]have lost their lives[N]searching for treasures[N]like this ring, huh?[FIN]I'm really taking a liking[N]to the ring; it's cute.[N]I'm taking it.[FIN][TPL:2][TPL:B][NAM:2]: Do you have no[N]self-restraint!? After[N]all, it might be cursed…![END]`

widestring_058F44 `[TPL:1][TPL:8][NAM:1]: Wh-what?[END]`

widestring_058C8F `[TPL:1][TPL:8][NAM:1]: What…?[PAL:0][END]`

widestring_058F53 `[TPL:2][TPL:9][NAM:2]: That might be a[N]Leviathan…![FIN][TPL:B]There are huge, ferocious[N]fish in the waters around[N]here that looks like[N]monsters…!![END]`

widestring_05913D `[TPL:4][TPL:8][NAM:4]: Are ya okay…?[END]`

widestring_059157 `[TPL:5][TPL:8]Aaaaaaaaaaaaaaah…![FIN][TPL:4][TPL:B][NAM:4]: That's [NAM:5][N]screamin'…! It's comin'[N]from tha direction of tha[N]deck…![END]`

widestring_0592FF `[TPL:4][TPL:E][NAM:4]: What happened to[N][NAM:5]…?! What was[N]that…!![FIN][TPL:3][TPL:E][DLY:0][NAM:3]: Waaaaaaaaah…[N][NAM:5], he…[N][NAM:5], he…[FIN]A huge fish smashed into[N]the ship and…[N]*sniffle*…[FIN][NAM:5] fell overboard…[N]*Sniffle*…[FIN]Uwaaaaaah! It looked like[N]it ate [NAM:5]…![N]*sniffle* *sniffle*[FIN][TPL:4][TPL:E][NAM:4]: W-what did ya[N]say…?![END]`

widestring_0593DA `[TPL:3][TPL:E][NAM:3]: Waaaaaaah! It's[N]that fish agaaain…![N]It’s going to eat us…![FIN][TPL:4][TPL:E][NAM:4]: If ya have time to[N]cry, then hold on to[N]somethin'…![FIN]Don't let yourself get[N]thrown off…![END]`
