ILLUSION OF GAIA: RETRANSLATED v1.21</br>
-
Copyright 2024-2025 by GaiaLabs</br>
https://github.com/Azarem/IOGRetranslation</br>
https://github.com/Azarem/GaiaLabs</br>

TABLE OF CONTENTS

1.) What is This Patch?</br>
2.) Application Instructions</br>
3.) MSU Instructions</br>
4.) What's New?</br>
5.) About the Project</br>
6.) Special Thanks</br>

-----------------------
1.) What is This Patch?
-----------------------
What started out as a project to create a baserom for editing Illusion of Gaia expanded into a retranslation. Which then expaneded into something of a remaster. It's now growing into kind of a definitive edition? While the game can be played to completion with all new additions as-is, the retranslation script will not be considered complete until Patch 2.0. That said, new features are regularly released in patch updates and bug testing is welcome. Please enjoy and feel free to follow the journey and join the discussion in the GaiaLabs Discord: https://discord.gg/y6pWtyD5


----------------------------
2.) Application Instructions
----------------------------

This is a BPS patch for Illusion of Gaia which adds a multitude of features, including a new translation that is in the process of being revised. In addition, the patch decompresses all the assets in the game, while providing an expanded ROM with available space. As a result, loading times are extremely fast! A handful of ASM patches are used to modify the loading process to support faster screen transitions by completely bypassing the decompression steps. In addition to the new script and higher-quality music, several other additions and improvements have been made to the original localization which can be read about in section 2, appropriately titled "MSU Instructions".

--------------------

To use this patch, download FLIPS, Beat, or use the Online Rom Patcher:</br>

FLIPS - https://www.romhacking.net/utilities/1040/</br>
Beat - https://www.romhacking.net/utilities/893/</br>
Online Patcher - https://romhackheaven.com/RomPatcher.js-2.9.1/</br>
Alternate 1 - https://www.romhacking.net/patch/</br>
Alternate 2 - https://www.marcrobledo.com/RomPatcher.js/

ROM / ISO Information:</br>
Database match: Illusion of Gaia (USA)</br>
Database: No-Intro: Super Nintendo Entertainment System (v. 20210222-050638)</br>
File/ROM SHA-1: 38DE0C84DD2BC3BDFC0A3D7AB0220C79B70887C3</br>
File/ROM CRC32: 1C3848C0


---------------------
3.) MSU Instructions:
---------------------

1.) Download one of the music packs from here: https://www.zeldix.net/t1604-illusion-of-gaiatime-gaia-trilogy-ii

2.) Extract the PCM files into the same folder as your "Illusion of Gaia Retranslated" ROM.

3.) Rename the PCM files to match the ROM filename. Ex: if your ROM is named GaiaLabs.smc, your PCM files will be named "GaiaLabs-{number}.pcm", where {number} is the track number in the original name. You want to keep that part.

5.) Make sure you have an empty MSU file to match your ROM: "GaiaLabs.msu"

6.) Use any modern emulator and enjoy the full music experience.

For further documentation and assistance, please see the following link:
https://www.zeldix.net/t1607-msu1-getting-started-guide


---------------
4.) What's New?
---------------

**Patch Notes (v1.21)**
-
☄ Added a new boot logo designed by _andwhyisit_.</br>
☄ An item counter has been added to the sprites for stackable items on the inventory screen.</br>
☄ Added an original sprite for the Sky Deliveryman, designed by _Azure Mage_.</br>
☄ The Flower in Edward Castle's Dungeon has been given new dialogue after the flute has been played.</br>
☄ After completing the Diamond Mines, an optional shortcut back to Freesia has been implemented.</br>
☄ Lillie's text window color scheme has been altered to enhance readability.</br>
☄ Additional names have been added to the credits sequence.</br>
☄ Fixed: Freesia/Freejia name switching in overworld.</br>
☄ Fixed: English map name-spacing bug.</br>
☄ Fixed: A few missing lines of text have been filled in.</br>
☄ Additional suggestions from the Discord channel have been implemented.</br>

**Patch Notes (v1.2)**
-
☄ Restored backgrounds from Japanese version in Edward Castle, Itory Village, The Moon Tribe Camp, and The Great Wall of China. Animations have also been restored to the backgrounds.</br>
☄ Restored animated title sequence from the Japanese version, localized the logo, and adjusted text. Three versions of the patch are now available: Enhanced (JP Title with NA Logo), Hybrid (JP Title with NA Logo with JP design elements), and Original (Vanilla). We are also considering variants for Illusion of Time's title screen.</br>
☄ An error which was also present in the original NA release, wherein the player could skip a power-up in the Diamond Mine by sprinting up a ramp with specific timing.</br>
☄ An error in which the game would sometimes soft-lock or display other unusual behavior when leaving Dark Space/Area of Darkness.</br>
☄ An error in which MSU1 was not working on SD2SNES.</br>
☄ The Sky Deliveryman now offers routes to South Cape, Freejia, and Watermia. Preliminary work has started for end-game dialogue upon return via Sky Deliveryman, but the new lines are unfortunately not included in this patch.</br>
☄ South Cape NPCs now have templates for additional dialogue when revisited via Sky Deliveryman.</br>
☄ Updates to Chapter 1, including fully revised prologue text.</br>
☄ Enhanced the quality of the font used in the prologue and overworld.</br>
☄ Number of Stackable Items Held Now Represented by a numeral.</br>
☄ Most [WAI] commands have been removed from the code to enhance text readability.</br>
☄ Fixes for Chapter 26.</br>
☄ Additions to the Name Dictionary.</br>
☄ Package folders reorganized.</br>
☄ Minor changes, bug fixes, and adjustments.</br>

While we've added a roster of improvements and changes, care was taken to offer options to the player in how they would like to enjoy this beloved classic. We hope that these new options will help you find a playstyle that you most enjoy!</br>

**Patch Notes (v1.1)**
-
☄ Title screen has been re-implemented from the prototype.</br>
☄ Original mountain background in Edward Castle has been re-implemented, though the animation has yet to be replaced (coming soon).</br>
☄ Fixes to music playing at improper times.</br>
☄ Map titles and their boxes auto center and size. It's done in intervals of two, so text may have a space before or after.</br>
☄ Handful of item names have been translated (ItemStrings.asm). This is what's seen when the menu opens up.</br>
☄ Also updated location/scene titles now that longer names are possible.</br>
☄ Various bug fixes.</br>

**Patch Notes (v1.0)**
-
☄ New Translation by L Thammy!</br>
☄ When starting a game, the options menu now offers the choice between the North American localized names (Will, Lance, Seth, etc.) or original Japanese ones (Tim, Rob, Morris, etc.). This option replaced the choice between Stereo and Mono. Stereo is now enabled by default.</br>
☄ Unique borders were designed to better represent the personalities and cultures of the story's characters. The original white border remains in-game, usually being used to describe actions that are occurring.</br>
☄ Now there's a Sprint Button! You can also still sprint using a double-press on the D-pad. This can definitely be considered an accessibility option for those who struggle with or dislike the original method. It also makes Illusion of Gaia play a bit more like its successor, Terranigma.</br>
☄ Dialogue has been made harder to accidentally skip through. Several button inputs that allowed text to advance were disabled to make this possible.</br>
☄ Asset decompression allows scenes to load MUCH faster.</br>
☄ MSU compatibility is included. Instructions for its use can be found in section 2 of this document.</br>
☄ Sky Deliveryman has been added back into the endgame. Aside from the ability to return to earlier locations in the game, nothing about those areas has been changed at this time.</br>

---------------------
5.) About the Project
---------------------

In September of 1994, Illusion of Gaia made its North American debut. The story by Japanese sci-fi writer Mariko Ouhara was notable for being much darker than the other RPGs Nintendo was allowing at the time. Despite a softening of the themes, the plot she weaved went to dark and intriguing places and left players with much to think about. Unfortunately, the localization was also often incomprehensible, with transitions between first and third person narrative that were difficult to follow.

Many years later in early 2020, ResetEra forum member L Thammy would spend roughly two months translating the game that has been so special for all of us and shared the experience with the internet. Through ResetEra's forums and an accompanying series of subtitled YouTube videos, he attempted and succeeded in retranslating Gaia Gensouki. The assistance of fellow forum-users made the process a collaborative endeavor and gave us a more accurate translation. The thread and videos are still worth reading/viewing, should you be interested in the actual translation process! As of this writing, both can still be found online.

At some point, a spreadsheet was created to compile all of the screenshots, transcription, raw transliteration, revised translation, and contextual comments. L Thammy expressed approval if anyone was willing to use the translation for a patch, but one would not be produced for a little over four years.

The GaiaLabs tool set for Illusion of Gaia ROM hacking hit the scene and its realization finally became possible. Much like L Thammy's Let's Play, Azarem's personal project would be noticed by others with a love for the game and evolve into a collaborative effort that expanded in scope. It took a long time to get here, but the full depth of Mariko Ouhara's "Gaia Gensouki" can be experienced in "Illusion of Gaia Retranslated."

-----------------------

The GaiaLabs Toolset and further documentation about its uses can be found at: https://github.com/Azarem/GaiaLabs.

Let's Play on ResetEra Forums (with Translation Notes):
https://www.resetera.com/threads/lets-play-illusion-of-gaia-but-in-japanese-gaia-gensouki-retranslation-attempt.171584/

Let's Play Video (with Subtitles):
https://www.youtube.com/playlist?list=PLoqdJOVga77Bp2FnXfnrf8KhPoVuF1Xeh


------------------
6.) Special Thanks
------------------
**This section is outdated, but we will update it in the near future!**

Firstly, to L Thammy, who graciously allowed us to use his translation as part of the project.

Also, to CDude, who has been an active participant in the streams, contributing to creative choices and bug fixes along the way.

To the staff of Quintet, manga creator Moto Hagio, and sci-fi/fantasy author Mariko Ouharaor, whose passion and talent made all of this possible in the first place.

Even to Robert L. Jerauld and the Enix USA staff!

Sometimes, we may poke fun at the original translation, but those working in localization at the time often had insufficient resources and were working on tight deadlines. Jerauld reported in a 2014 interview with Heidi Kemps at Gaming Moe, that he "wanted the story to feel natural, the characters to resonate with people, to feel familiar." Considering the love people have shown for Illusion of Gaia, I'd say they did something right!
