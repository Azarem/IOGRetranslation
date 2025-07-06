;CHAPTER 22

-------------------------------------
?INCLUDE 'av69_lance'
-------------------------------------
widestring_06BAFA `[TPL:6][TPL:9]Neil: I guess we've[N]finally arrived.[FIN][TPL:A]I think we were walking in[N]the undersea tunnel for[N]about a month in the end…[FIN][TPL:4][TPL:A][NAM:4]: Huh? There's a[N]bulletin board.[END]`

widestring_06BB50 `[TPL:4][TPL:B][NAM:4]: Let's see here.[N]Fallen angel clan?[N]Travelers, please use[N]this room?[FIN][TPL:6][TPL:B]Neil: So the people living[N]in this place are called[N]the fallen angel clan…[FIN]Neil: I guess they put up[N]that sign because they[N]don't want to meet people[N]themselves.[FIN]Before anything else,[N]shall we try to get some[N]rest in that room…?[END]`

-------------------------------------
?INCLUDE 'av69_lily'
-------------------------------------
widestring_06C224 `[TPL:2][TPL:8][NAM:2]: [NAM:0]. Let's go…[END]`

-------------------------------------
?INCLUDE 'av69_kara'
-------------------------------------
widestring_06C3B1 `[TPL:1][TPL:9][NAM:1]: What is this[N]"[NAM:0], let's goˮ…![FIN]You too, [NAM:0]![N]You're flirting.[FIN][TPL:A]I'm going sightseeing[N]alone! Don't come with[N]me…!![END]`

widestring_06C23C `[TPL:2][TPL:9][NAM:2]: What is she so[N]touchy about…[FIN][TPL:4][TPL:A][NAM:4]: Geez, always tha[N]fickle little lady. Leave[N]her alone, I guess.[END]`

-------------------------------------
?INCLUDE 'av69_signs'
-------------------------------------
widestring_06BA36 `[TPL:1D][BOR:1][TPL:E]        Travelers:[N]   Please use this room[N]    Fallen Angel Clan[END]`

widestring_06BA6B `[TPL:1D][BOR:1][TPL:D]Entrance to fallen[N]angel's town[END]`

-------------------------------------
?INCLUDE 'av6A_lance'
-------------------------------------
widestring_06BC5C `[TPL:4][TPL:A][NAM:4]: [NAM:0]. Tha thing is,[N]I've got somethin' to[N]discuss with ya…[FIN]I hate to say it, but it[N]seems like I've developed[N]feelin's for [NAM:2]…[FIN][TPL:B]Even when I dream, I only[N]dream o' her… Before I[N]knew it, she had caught[N]my eye.[FIN]Ya think that's not like[N]me, right?[N][PAL:0] Yeah…[N] That isn't true`

widestring_06BD1A `[CLR][TPL:0][TPL:B][NAM:0]: That's right. I've[N]never thought that you'd[N]be saying things like[N]that.[FIN]`

widestring_06BD4A `[CLR][TPL:0][TPL:B][NAM:0]: But you've spent a[N]lot of time together by[N]now.[FIN]It wouldn't be unnatural[N]even to be in love with[N]her.[FIN][TPL:4][TPL:B][NAM:4]: Speakin' o' that.[N]It seems like [NAM:2]'s[N]fifteenth birthday is[N]comin' up soon.[FIN]I want to tell her my[N]feelin's with a present[N]then, but what do ya think[N]I should go with?[FIN][PAL:0] A pretty bouquet[N] A wonderful necklace[N] A tender kiss[PAL:4]`

widestring_06BE1F `[CLR][TPL:0][TPL:B][NAM:0]: I don't think[N]there's a girl out there[N]who wouldn't be happy to[N]get a bouquet of flowers.[FIN][TPL:4][TPL:B][NAM:4]: I guess that's[N]expected.[FIN][TPL:12]Well, I think I can try[N]to communicate a love[N]confession through tha'[N]language of flowers;[N]rosebuds.[FIN][CLD][JMP:&widestring_06BF7C]`

widestring_06BE85 `[CLR][TPL:0][TPL:B][NAM:0]: Of course, shouldn't[N]it be something that she[N]regularly wears?[FIN]Because whenever she sees[N]it, she'll think about how[N][NAM:4] is doing.[FIN][TPL:4][NAM:4]: Ah, I get it.[FIN][TPL:B]Well then, I'll try[N]searching for pretty[N]stones or something like[N]that and making a necklace.[FIN][JMP:&widestring_06BF7C]`

widestring_06BF0A `[CLR][TPL:0][TPL:B][NAM:0]: If you truly like[N]her there's nothing else[N]but this, right?[FIN][TPL:4][TPL:B][NAM:4]: I feel like doing[N]that all of a sudden would[N]be too bold, but if you[N]say so, should I try it…?[FIN][JMP:&widestring_06BF7C]`

widestring_06BF7C `[TPL:4][TPL:B][NAM:4]: Thanks fer lending[N]me yer advice.[FIN]I'll try to think of it[N]in my own way. Good[N]friends are nice to have,[N]ain't they.[END]`

code_06BC19 {
    COP [D0] ( #74, #01, &code_06BC57 )
    COP [CC] ( #74 )
    COP [BF] ( &widestring_06BC5C )
    COP [BE] ( #02, #02, &code_list_06BC2C )
}

-------------------------------------
?INCLUDE 'av6A_lily'
-------------------------------------
widestring_06C2BD `[TPL:2][TPL:B][NAM:2]: The people that[N]call themselves the fallen[N]angel clan live in a[N]gloomy place like this.[FIN]It seems depressing…[END]`

-------------------------------------
?INCLUDE 'av6A_erik'
-------------------------------------
widestring_06C52F `[TPL:3][TPL:9][NAM:3]: Sunlight is[N]iiincredibly bright.[FIN][TPL:A]Even though I've always[N]had it around, I hadn't[N]noticed.[END]`

-------------------------------------
?INCLUDE 'av6A_neil'
-------------------------------------
widestring_06C0D2 `[TPL:6][TPL:B]Neil: I had been thinking,[N]mustn't the fallen angel[N]clan be the descendants[N]of the Mu people?[END]`

-------------------------------------
?INCLUDE 'av6B_villagers1'
-------------------------------------
widestring_06C799 `[TPL:1D][TPL:9]This is the fallen angels'[N]village.[FIN][TPL:A]Our bodies are weak; we'd[N]die even if we were in the[N]sunlight for too long.[END]`
widestring_06C7EF `[TPL:1D][TPL:9]This is the fallen angels'[N]village.[FIN][TPL:A]Our bodies are weak; we'd[N]die even if we were in the[N]sunlight for too long.[END]`
widestring_06C845 `[TPL:1D][TPL:9]This is the fallen angels'[N]village.[FIN][TPL:A]Our bodies are weak; we'd[N]die even if we were in the[N]sunlight for too long.[END]`
widestring_06C9BF `[TPL:1D][TPL:9]This is the fallen angels'[N]village.[FIN][TPL:A]Our bodies are weak; we'd[N]die even if we were in the[N]sunlight for too long.[END]`

-------------------------------------
?INCLUDE 'av6B_villagers3'
-------------------------------------
widestring_06CBEE `[TPL:1D][TPL:9]There are stories that say[N]we evolved from humans.[END]`

-------------------------------------
?INCLUDE 'av6B_villagers2'
-------------------------------------
widestring_06CB5E `[TPL:1D][TPL:9]A short time ago, a human[N]girl came here.[FIN]Her name was [NAM:1] or[N]something like that.[FIN][TPL:A]It seems that she went to[N]the studio of the artist,[N]Ishtar.[FIN]His paintings are praised[N]for their beauty, you[N]know?[END]`

widestring_06CC22 `[TPL:1D][TPL:A]I'll teach you the route[N]to the studio, so remember[N]it, alright?[FIN]First of all,[N]follow the wind.[FIN][TPL:B]You'll understand if you[N]look at which direction[N]the flames of the torches[N]are bending in.[FIN]You can hear the sound of[N]a waterfall where the[N]strong wind storms through[N]the dark passage.[FIN]Subsequently, please[N]examine the area where[N]the waterfall's sound is[N]the loudest.[FIN]Ishtar's studio is beyond[N]there. Be careful,[N]alright?[END]`

-------------------------------------
?INCLUDE 'av6C_villagers4'
-------------------------------------
widestring_06CA5C `[TPL:1D][TPL:A]This is something called[N]"danceˮ; a way that humans[N]amuse themselves.[END]`

-------------------------------------
?INCLUDE 'av6C_villagers5'
-------------------------------------
widestring_06CD9A `[TPL:1D][TPL:A]We want to get closer to[N]human emotions, so we[N]dance like this every day.[FIN]Even so, nothing changes…[END]`

widestring_06CA71 `[TPL:1D][TPL:A]The picture attached to[N]that wall was painted by[N]an artist called Ishtar.[FIN]However, the models for[N]his pictures go missing[N]afterward…[END]`

widestring_06CDD4 `[TPL:1D][TPL:B]Though we lack emotions,[N]Ishtar draws us[N]overflowing with human[N]kindness.[FIN][TPL:12]There is no end to the[N]people who want Ishtar to[N]draw them even though they[N]don't know what will[N]happen to them afterward.[END]`

widestring_06CE56 `[TPL:1D][TPL:A]The person who was my[N]dance partner is now[N]inside of that painting.[END]`

-------------------------------------
?INCLUDE 'av6B_ocean_ache'
-------------------------------------
widestring_06C714 `[TPL:1D][TPL:A]We don't know from what[N]era we started living[N]here.[FIN]But our chests hurt for[N]some reason when we see[N]the ocean.[END]`

widestring_06CB07 `[TPL:1D][TPL:8]We have no emotions…[FIN][TPL:9]We never laugh or cry from[N]the day we are born.[FIN]In our lives,[N]every day is the same…[END]`

-------------------------------------
?INCLUDE 'av6B_musician'
-------------------------------------
widestring_06D0C6 `[TPL:1D][TPL:A]Woman playing the harp:[N]Music is the greatest[N]medicine for the soul.[FIN][TPL:B]No matter what disease you[N]face, you will become well[N]if you hear a wonderful[N]composition.[END]`

-------------------------------------
?INCLUDE 'jeweler_gem'
-------------------------------------

widestring_08D459 `[CLR]Whoops, the number of[N]jewels you've collected[N]have passed 20, haven't[N]they…![FIN]Going by the list, I'll[N]give you Psycho Power.[FIN]This is a mysterious,[N]otherworldly power that I[N]will award you from my[N]soul.[FIN]It seems like the Psycho[N]Dash's attack power rose.[FIN]`

;Psycho Slider / Performs a sliding attack. Can pass through narrow passages.

widestring_06C981 `[TPL:1D][TPL:E]I'm a sculptor. Before I[N]die, I intend to make a[N]thousand of these statues…[END]`

-------------------------------------
?INCLUDE 'av6C_only_sleeping'
-------------------------------------
widestring_06D063 `[TPL:0][TPL:A][NAM:0]: They have no[N]consciousness, as if their[N]soul had been removed…[END]`

widestring_06C8B0 `[TPL:1D][TPL:F]Do you know the painter,[N]Ishtar?[N][PAL:0] Yes[N] No[PAL:4]`

widestring_06C8DC `[CLR]In that case, you should[N]listen a little more to[N]what everyone has to say.[END]`

widestring_06C8F7 `[CLR]The studio of Ishtar, the[N]painter, is on the other[N]side of this door.[FIN][TPL:10]But there are creatures[N]with nothing but hatred[N]and a desire for[N]destruction which are[N]roaming beyond this point.[FIN][CLD][TPL:1D][TPL:E]If you say you still want[N]to go despite that, you[N]may open the door.[END]`

