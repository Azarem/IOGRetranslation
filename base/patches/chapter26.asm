;CHAPTER 26


-------------------------------------
?INCLUDE 'wa79_kara'
-------------------------------------
widestring_07A811 `[TPL:1][TPL:A][NAM:1]: That thing that[N]they call a [NAM:15] is a[N]weird animal, isn't it…?[END]`

-------------------------------------
?INCLUDE 'wa79_erik'
-------------------------------------
widestring_07A4C8 `[TPL:3][TPL:9][NAM:3]: There's a full moon[N]tonight.[FIN][TPL:B]I'm getting the sense that[N]towns always seem to take[N]a different form when[N]things like this happen.[END]`

-------------------------------------
?INCLUDE 'wa79_neil'
-------------------------------------
widestring_07A255 `[TPL:6][TPL:A]Neil: A vast desert stands[N]before us if we go to the[N]west from here.[FIN][TPL:B]It isn't possible to cross[N]it on foot. You need to[N]have something like a[N][NAM:15].[FIN]Now, I wonder how we can[N]get a hold of some[N][NAM:15]s…[END]`

-------------------------------------
?INCLUDE 'wa79_lily'
-------------------------------------
widestring_07AA34 `[TPL:2][TPL:A][NAM:2]: It'd be nice if[N][NAM:4]'s father could get[N]well quickly, wouldn't it?[END]`

-------------------------------------
?INCLUDE 'wa79_lance'
-------------------------------------
widestring_07ADA9 `[TPL:4][TPL:9][NAM:4]: I gave tha medicine[N]to my old man just now.[FIN]I think he'll slowly[N]recover after this…[END]`

-------------------------------------
?INCLUDE 'wa78_moving_woman'
-------------------------------------
widestring_07846A `[TPL:1C][TPL:F]Woman: A girl wearing pink[N]clothes was making a wish[N]atop the lotus leaf over[N]there just now.[END]`

;I'm now looking after 28 Red Jewels from you.

-------------------------------------
?INCLUDE 'wa78_glass_game'
-------------------------------------
widestring_0796A9 `[TPL:1C][TPL:F]This is where we meet for[N]Russian glass.[N]Are you participating?[WAI][N][PAL:0] Yes[N] No[PAL:4]`

widestring_0796DE `[CLR]Alright, in that case, go[N]home. Then forget[N]everything you saw here.[END]`

widestring_079704 `[CLR]What, you’re betting your[N]young life on Russian[N]glass…?![FIN]This isn't a game.[N]You're betting your life.[FIN]I'll ask you one more[N]time. You really won't[N]regret this?[WAI][N][PAL:0] Yes[N] No[PAL:4]`

widestring_07977A `[CLR]Very well. The one[N]standing there is the[N]opponent you're competing[N]against.[FIN]He's a veteran of this[N]game. I've never seen a[N]human being with luck[N]like his.[FIN]Alright. You may ask him[N]about the rules.[END]`

widestring_0797E6 `[TPL:1C][TPL:D]Another young life will be[N]reduced to ashes tonight…[END]`

widestring_079610 `[TPL:1C][TPL:E]There is no other game as[N]exciting as this. I'm[N]shaking.[END]`

widestring_0795B9 `[TPL:1C][TPL:E]How can you bet your life[N]like this? You're still[N]young.[END]`

widestring_079835 `[TPL:1C][TPL:D]You have courage, don't[N]you?[END]`

widestring_07986C `[TPL:1C][TPL:F]It seems that your[N]opponent has earned a lot[N]of money through this[N]game.[FIN]I wonder what in the[N]world he's using it for…[END]`

widestring_0792F7 `[TPL:24][TPL:F]Competitor: Humph… You[N]haven't even experienced[N]life yet, and you still[N]dare to come here?[FIN]The rules are simple. One[N]of these five glasses has[N]poison placed into it.[FIN]We take turns drinking[N]them. Whoever is left[N]alive in the end is the[N]winner.[FIN]Well, I'll start…![END]`

widestring_0793B6 `[TPL:24][TPL:D]Competitor:[N]Raaaaaaaaagh…!![FIN][CLD][TPL:E][SFX:0]The competitor drained the[N]contents of the glass in[N]one gulp…[END]`

widestring_079922 `[TPL:0][TPL:E][NAM:0]: Oh? The drink in the[N]glass looks as though it's[N]dyed with blood…[FIN]Is this because of the[N]power that is dwelling[N]inside my body too…?[FIN][TPL:F]Drink the contents of the[N]glass?[N][PAL:0] Yes[N] No[PAL:4]`

code_079AAC {
    COP [D0] ( #0F, #00, &code_079AD2 )
    COP [BF] ( &widestring_079922 )
    COP [BE] ( #02, #02, &code_list_079ABC )
}

widestring_079992 `[CLR][NAM:0]: I'll skip this[N]glass…[END]`

widestring_0799AF `[CLR][NAM:0]: My body[N]is getting numb…[END]`

widestring_0798E8 `[CLD][TPL:0][TPL:E][NAM:0]: I closed my eyes and[N]drained the glass in one[N]gulp![END]`

widestring_079401 `[TPL:24][TPL:E]Competitor: Humph…! You're[N]damn lucky… I guess it's[N]my turn next.[END]`

widestring_079422 `[TPL:24][TPL:E]Competitor: Hey, it's[N]your turn! Don't lose your[N]nerve and run away![END]`

widestring_07944D `[TPL:24][TPL:D]Competitor: This is the[N]one remaining glass…[WAI][CLD][PAU:3C][TPL:1C][TPL:D][DLY:2]Spectator: It's okay now…[N]This boy won…[FIN][DLY:0]Spectator: That's right![N]Stop it already…!![FIN][TPL:24][TPL:F][DLY:3]Contestant: No…[PAU:1E] I have no[N]intention of being left in[N]shame with my tail between[N]my legs…[FIN][CLD][TPL:D][SFX:0][DLY:2]The man took the glass in[N]hand…[END]`

widestring_079520 `[TPL:1C][TPL:E]Spectator: Put that down[N]and come over here…! It's[N]already your loss…!![FIN]You don't need to be in a[N]hurry to die…![FIN][CLD][TPL:F][SFX:0][DLY:3]The man, not listening to[N]the spectators, quickly[N]downed the contents of the[N]glass![END]`

-------------------------------------
?INCLUDE 'wa7D_glass_opponent'
-------------------------------------
widestring_078E2D `[TPL:1C][TPL:F]Woman: You must be the[N]gentleman who was[N]competing in Russian[N]glass, right?[FIN]My husband said that he[N]had found a good job[N]so I shouldn't worry;[FIN]I never expected that it[N]would be something like[N]that…[FIN]This is my husband's will.[N]"To my opponentˮ is[N]written on the cover.[N]Please read it.[FIN]With that, there are four[N][NAM:15]s outside of my[N]house; please use them.[END]`

-------------------------------------
?INCLUDE 'wa78_women'
-------------------------------------
widestring_078B3B `[TPL:1C][TPL:D]Woman: We don't need money[N]at all…[FIN][TPL:F]But they say that true[N]luck is being together[N]someone you care about,[N]don't they?[END]`

-------------------------------------
?INCLUDE 'chunk_038000'
-------------------------------------
widestring_039696 `[TPL:D]Gently opened and read[N]the will.[FIN][TPL:24][BOR:1][TPL:E] [N]      To my Opponent[N] [FIN][DLG:3,B][SIZ:D,7]Even when I've died, I[N]want you not to mourn. And[N]I want you to not feel[N]down. I was knocking on[N]heaven's door even if it[N]wasn't Russian glass that[N]killed me.[FIN]When I was diagnosed with[N]an incurable illness half[N]a year ago, I was thinking[N]that I should put all of[N]my effort into earning[N]money until death comes[N]for me.[FIN]I thought that I shouldn't[N]cause problems for my wife[N]and still unseen child[N]after my death, after all.[N]However, the money I[N]earned brought unhappiness[N]to others.[FIN]I think I'll end it this[N]time… If I am defeated in[N]this match, I want to[N]share some of my property[N]with you that has bravery.[N]Please adore my four[N]favourite [NAM:15]s.[END]`

-------------------------------------
?INCLUDE 'wa78_prize_kruk'
-------------------------------------
widestring_079B30 `[TPL:0][TPL:E]I guess these are the[N][NAM:15]s that they said they[N]were giving me…[FIN]I have to inform everyone[N]right away.[END]`

widestring_07A833 `[TPL:1][TPL:A][NAM:1]: They say Neil[N]wasn't born in any old[N]house.[FIN]His family runs a trading[N]company from their mansion[N]in the town of Euro.[END]`

widestring_07A506 `[TPL:3][TPL:A][NAM:3]: Why do we have to[N]part with [NAM:4] and [NAM:2][N]now…?[END]`

widestring_07ADEA `[TPL:4][TPL:A][NAM:4]: It's my bad fer[N]everything, but I'm[N]remainin' here.[FIN]I guess I can't just dump[N]that old man of mine.[FIN]After that… [PAU:78]Uh, I guess[N]I'm feelin' shy or[N]somethin'…[FIN]The thing is, I'm goin'[N]out with [NAM:2].[FIN][TPL:B]These feelin's ain't fer[N]play, of course. I want us[N]ta be together fer a[N]while.[FIN]And [NAM:2] says that she[N]wants ta stay together[N]too.[FIN]It was fun goin' out on a[N]journey with everyone. I[N]pray that yer journey is[N]successful.[END]`

widestring_07AA5E `[TPL:2][TPL:9][NAM:2]: I'm also remaining[N]in this town.[FIN]As for the reason…[N]Well, ask [NAM:4].[END]`

widestring_07A2BE `[TPL:6][TPL:A]Neil: You're saying you[N]were given [NAM:15]s!? That[N]kind of expensive thing…?[FIN]Why are you looking at me[N]with those sort of[N]lonely-seeming eyes…?[FIN]Well, I won't dig deeply[N]into the reason.[FIN][TPL:B]With that being said. I[N]thought we'd end up going[N]to the town called Euro to[N]the west, but…[FIN][NAM:4] and [NAM:2] say[N]they're staying in this[N]town. Well, listen to the[N]reason from those two.[END]`

widestring_07A366 `[TPL:6][TPL:12]Neil: I think that the[N]moment where a boy and a[N]girl develop feelings for[N]each other is wonderful[N]and magical.[FIN][CLD][TPL:6][TPL:A]I want to believe that[N]we'll never forget this[N]feeling.[FIN]Anyway. My parents' house[N]is in Euro, isn't it?[FIN]I think we'll familiarize[N]ourselves with [NAM:0]'s power[N]somehow if we go there.[FIN]Alright, let's head out to[N]Euro…!![END]`

