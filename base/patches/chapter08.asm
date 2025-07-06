;CHAPTER 8


------------------------------
?INCLUDE 'it1A_lily'
------------------------------
widestring_04F53C `[TPL:2][TPL:A][NAM:2]: Alright, we've[N]arrived. This is the moon[N]race's habitat.[END]`

widestring_04F7C1 `[TPL:2][TPL:A][NAM:2]: Wait a second! We[N]came here because we had[N]an objective, didn't we?[FIN]We can't just go back all[N]of a sudden.[END]`

widestring_04F7F7 `[TPL:0][TPL:A][NAM:0]: (I can't go back[N]without obtaining the[N]Incan Figure, can I...)[END]`

widestring_04F860 `[TPL:2][TPL:A][NAM:2]: You're loitering;[N]talk to the moon race,[N]then do that.[END]`

------------------------------
?INCLUDE 'it1A_moon_tribe'
------------------------------
widestring_09D1FC `[TPL:1A][TPL:E]Mysterious voice: Gooood[N]evening, gooood evening…[N]Goooing on a stroll?[FIN][TPL:0][TPL:E][NAM:0]: Who's there?![FIN][TPL:1A][TPL:E]Mysterious voice: Above,[N]above. This body is[N]lighter than air.[FIN][TPL:0][TPL:E][NAM:0]: What are you?![FIN][TPL:1A][TPL:F]Mysterious voice:[N]Try to guess.[WAI][N] Cotton candy's relative[N] Bird-human[N] Soul of a dead person…`

widestring_09D2D0 `[CLR]Mysterious voice:[N]Bzzzzzzzzzt… Wrong…[FIN]The truth is, we are the[N]moon race. Also known as[N]shadows.[END]`

widestring_09D388 `[TPL:1A][TPL:E]Moon race: The comet is[N]the destroyer of[N]everything.[FIN]That light causes all[N]living things to transform[N]… it isn't good light.[FIN][TPL:F]It's the remains of that[N]weapon from a distant,[N]ancient, terrible,[N]terrible war.[FIN][TPL:0][TPL:F][NAM:0]: The world becomes[N]terrible?[FIN][TPL:1A][TPL:F]Moon race: Exactly right.[N]You're clever, but you're[N]still young, boy.[END]`

widestring_09D30F `[TPL:1A][TPL:E]Moon race: There are[N]always shadows in the[N]place that light is in.[FIN][TPL:F]Us that were transformed[N]by being completely[N]showered once by the[N]comet's light…[FIN]Since then, we are beings[N]that can quietly live in[N]a world without light.[END]`

code_09D1DD {
    COP [BF] ( &widestring_09D462 )
    COP [BE] ( #02, #02, &code_list_09D1E7 )
}

widestring_09D462 `[TPL:1A][TPL:D]Moon race: Our one[N]companion was stolen.[FIN][TPL:F]Do you not know where to[N]go?[N][PAL:0] Yes[N] No`

widestring_09D4AD `[CLR][PAL:4]Moon race: We may come[N]to chase you later.[N]Mweheheheheheheh…[END]`

widestring_09D4DC `[TPL:1A][TPL:E]Of the comet's approach[N]every 800 years, this is[N]the 4th time.[FIN][TPL:F]The Power of Darkness[N]becomes stronger based on[N]the degree to which that[N]power showers…[FIN]What in the world will be[N]born from the light this[N]time…[END]`

widestring_09D574 `[TPL:1A][TPL:E]Moon race: We continue to[N]live in an eternity that[N]surpasses time…[FIN][TPL:F]We also came to securely[N]see with our eyes the form[N]of the Incan kingdom[N]falling into ruin.[FIN]The Incan idol is sleeping[N]in the cave under here…[FIN]Since we've come to like[N]you, we gladly offer it to[N]you.[FIN]Anyhow, please go to the[N]cave. Mweheheheheheheh…[END]`

widestring_04F575 `[TPL:2][TPL:9][NAM:2]: Well, I'll be[N]waiting here, alright?[END]`

------------------------------
?INCLUDE 'it1B_trial'
------------------------------
widestring_04F941 `[TPL:1A][DLG:3,4][SIZ:D,6]Moon race: The things in[N]here are the fruits of the[N]transformation of[N]organisms that have been[N]showered with the comet's[N]light.[FIN][CLD][TPL:1A][TPL:B]Already, they are[N]miserable beings with[N]nothing but hatred and a[N]destructive heart.[FIN][TPL:12]If you can exterminate[N]these monsters within 20[N]seconds, we'll give you[N]the Incan idol.[N]Mweheheheheheheh…[END]`

widestring_04FA25 `[TPL:1A][TPL:F]Race of the Moon: With[N]that, we can't ive you[N]Incan idol, can we?[N]Mweheheheheheheh…[END]`

widestring_04FA65 `[TPL:1A][TPL:E]Moon race: Oh my, what a[N]splendid boy.[N]Mweheheheheheheh…[FIN]With that, we'll give you[N]the Incan idol.[END]`

widestring_04F591 `[TPL:2][TPL:9][NAM:2]: How did it go?[FIN] …From your face, it looks[N]it was no good, huh?[FIN]Don't be discouraged;[N]keep at it one more time.[END]`

widestring_04F5EA `[TPL:2][TPL:A][NAM:2]: Ah, that figure[N]is…! [NAM:0], you're[N]incredible, iiincredible![FIN]With this, that means[N]we've collected two[N]figures, right?[FIN][TPL:B]Do you plan to go to the[N]Incan ruins?[N][PAL:0] Yes[N] No[PAL:4]`

widestring_04F68F `[TPL:0][TPL:B][NAM:0]: Yeah. Because I was[N]told to by my dad…[FIN]I'm a little scared to[N]fight with monsters that[N]have been showered with[N]the comet's light.[FIN]But if Dad is alive,[N]because I want to meet him[N]I'll even brave the[N]danger.[FIN]I feel like I won't[N]understand without seeing[N]my parents…[FIN][CLD][TPL:2][TPL:9][NAM:2]: After all, you're[N]a boy, huh…[FIN]I understand. Alright,[N]let's head to the ruins.[FIN][CLD][TPL:9]So the two headed to the[N]Incan ruins.[END]`

widestring_04F653 `[CLR][NAM:2]: That's a lie. I[N]know it. Even if you say[N]those words, [NAM:0] plans to[N]go, don't you?[FIN]`

------------------------------
?INCLUDE 'ir1C_lily'
------------------------------
widestring_09CAE5 `[TPL:2][TPL:E][NAM:2]: Here is the[N]entrance of the Incan[N]ruins.[FIN]Those that are called the[N]"Incaˮ were also[N]widespread, right?[FIN]They say that the mystery[N]of Inca legend is hidden[N]here.[FIN]I had heard this kind of[N]story from the elder when[N]I was little, but…[FIN][TPL:10]It seems that at one time,[N]when the Inca were raided,[N]they were going to abandon[N]their motherland in search[N]of new land.[FIN][CLD][TPL:2][TPL:F]The Incan people were said[N]to have boarded a giant[N]ship built with the most[N]valuable golden craftwork,[FIN]which stole the invaders'[N]glance.[FIN]But, you know, they say[N]that there is no remaining[N]record of that boat's[N]departure…[FIN]That ship is probably the[N]gold ship sleeping to the[N]Inca.[FIN]I imagine that the elder[N]hasn't told this legend to[N]anyone outside the Itory[N]clan until now.[FIN]It seems like the elder is[N]doing something to [NAM:0]…[END]`

------------------------------
?INCLUDE 'ir1C_kara'
------------------------------
widestring_09CF19 `[TPL:1][TPL:A][NAM:1]: You two are awful,[N]leaving me behind like[N]that![END]`

widestring_09CCD0 `[TPL:2][TPL:A][NAM:2]: Why are YOU in[N]this kind of place…![N]Isn't it dangerous!?[FIN][TPL:1][TPL:A][NAM:1]: I heard about this[N]place from Ms. [NAM:6] and[N]waited for hours…![FIN]Still, I thought you had[N]left me behind and went on[N]ahead.[FIN]At least I had been told[N]roughly where you were[N]going![FIN]With that, [NAM:0], you're[N]searching for something[N]in the ruins, right?[FIN][TPL:B]With [NAM:0] doing his best,[N]I can't be the only one[N]leisurely eating meals and[N]the like at the village.[FIN]I'm waiting here for [NAM:0][N]to come back.[FIN][TPL:2][TPL:B][NAM:2]: Good grief.[N]This little lady…[FIN]I understand. I'll also[N]wait along with you.[N]That's okay, right?[END]`

widestring_09CE01 `[TPL:2][TPL:9][NAM:2]: [NAM:0]. Remember the[N]elder's words well.[FIN][TPL:12]"In the cliff of Larai in[N]the ruin's underground,[N]offer the Incan god to the[N]place where the god's[N]breath cannot reach.[FIN][CLD][TPL:2][TPL:B]The wind in the valley[N]shall guide that person to[N]the origin of the gold[N]shipˮ is the words,[FIN]Have you diligently[N]memorized it?[END]`

widestring_09CF59 `[TPL:1][TPL:A][NAM:1]: What are you doing?[N]Did you find what you're[N]looking for? Persevere.[END]`
