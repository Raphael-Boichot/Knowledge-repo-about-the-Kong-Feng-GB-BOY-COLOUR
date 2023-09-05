# Knowledge repository about the Kong Feng GB BOY COLOUR

The GB Boy Colour is a Chinese Game Boy Color (GBC) clone from brand new parts made by the Kong Feng Company (KF). The model follows the GB Boy, a Game Boy clone. The GB Boy Colour is now apparently discontinued and replaced by a weird GBA form factor clone (that does not play GBA games). The (laughable) consequence is that the GB Boy Colour in the GBC form factor is now more expensive than a legit GBC in 2023. It's been retro faster than the retro. As usual with Chinese repro, there is no available documentation and the origin of the KF main processor is not documented (reverse engineering or just leak of the masks, who knows...).

The GB Boy Colour features a quite deceptive backlite screen. It has a very pronounced blue hue and a butchered stretching / upscaling. It is driven by an unbranded (and undocumented) video chip turning the legit signal from the main chip into a pixel mess fitting the display. Lover of pixel perfect, move on. Apart from that, the KF main processor is perfectly pinout compatible with a GBC ([it can be directly dropped on a GBC motherboard](https://www.reddit.com/r/Gameboy/comments/qhx2gs/i_swapped_the_cpus_of_a_gb_boy_colour_and_gameboy/)) and the GB Boy Colour itself is a 100% compatible GBC-like console. GB printer and serial functions are perfectly working. IR fonctions are however not connected (there is simply no IR LED). GB and GBC regular cartridges are all compatible with the device. Flash cartridges are more or less, due the 5V power board that is a bit weak (the EZ-Flash jr boots with difficulty due to current draw). The size tolerance of the cartridge slot is also a bit off. Inserting and wobbling the cartridge is sometimes necessary to boot a game. But it's generally fine for the price it was sold initially (around 30€). The console is overall better than a non modded GBC regarding ergonomy and was a very appreciable clone before the massive introduction of screen mods. Pads and buttons do not feel as cheap as the ones delivered with GBC replacement shells and do the job honestly. It is reported that the sound has issues but I think the only reason is that the speaker does no mix the stereo signal. It sounds legit for a casual player at least.

The console comes with a 188-in-one internal rom, labelled GBCK003. It contains in real only 66 different games (all arcade classics, and quite decent ones, but GB only) with repeated entries, without any save possibility. It is directly soldered to the motherboard and is quite difficult to remove without damaging the traces. The GB Boy and the GB Boy Colour seems to share the exact same internal rom. The internal rom is activated only when no cartridge is inserted thanks to a small mechanical switch. In case a cartridge is inserted, it pulls high the A15 and CS lines of the rom board, deactivating it.

## The main board showing the switch circuit for activating/deactivating the internal rom
![the GB Boy Colour Board](Pictures/Board.png)

The front board with the internal rom desoldered is rather empty and lot of room is left below the display. The display itself is also quite difficult to remove due to very tight tolerance on the ribbon. I did not find the reference despite markings on the ribbon. Next image shows the wiring diagram of the internal rom to the cartridge slot made with a multimeter. The Audio in and Clock pin of Game Boy are of course not connected, reducing the number of pins from 32 to 30.

## Wiring between the 30 pins internal rom and the 32 pins GB compatible cartridge slot.
![the GB Boy Colour pinout](Pictures/Pinout.png)

Side note, the flash chip (29LV640) is rated for 3.3 only and is directly wired to the +5V of the GB Boy Colour. It ran on my side for dozens of hours, but how many more will it survive ? Mystery...

## Detail of the internal rom pinout (flash chip is a 8MB MX29LV640EBTI)
![the GB Boy Colour pinout](Pictures/Pinout_2.png)

At this point, it is quite "easy" to directly wire the desoldered internal rom to any spare Game Boy cartridge PCB (CS and A15 included). I used a Divastarz PCB for the job, it [died without suffering](https://github.com/Raphael-Boichot/Game-Boy-chips-decapping-project#game-boy-mbc5-mappers) when giving its MBC to Science in a prior project. Wiring it manually pin by pin was a painfull task but at least it works !

## Do you trust in Science ? Now playing the 188 in 1 without the hideous stretching !
![the GB Boy Colour pinout](Pictures/Trust_in_pinout.png)

The rom is quite badly made so the checksum is incorrect (range 0x00014E-0x00014F) and the chip size flag is bad too (offset 0x000148 reports 0x06 for 2MB while it should be 0x08 for 8MB) in the header. The rom can anyway be dumped with FlashGBX and a GBXCart with the following parameters (do not mind the checksum error, the dump will be good): 

![FlashGBX parameters](Pictures/FlashGBX_parameters.png)

The global rom organisation is the following (by increasing offset):

| Data (rom or junk):                  | Size in bytes:          |Starting offset:             |
|----------------------------|-------------------------|-----------------------------|
| **HITEK_MULTI**      | **0x008000** | **0x000000**|
| **Junk data**  | **0x3F8000** | **0x080001**|
| SUPER MARIOLAND  | 0x010000 | 0x400000|
| BUGS BUNNY       | 0x010000 | 0x410000|
| PARASORU HEMBEI  | 0x010000 | 0x420000|
| GO GO TANK       | 0x010000 | 0x430000|
| ALADDIN          | 0x040000 | 0x440000|
| CONTRA           | 0x020000 | 0x480000|
| MARIO & YOSHI    | 0x010000 | 0x4A0000|
| DUCK TALES       | 0x010000 | 0x4B0000|
| PAC-MAN          | 0x010000 | 0x4C0000|
| SIDE POCKET      | 0x010000 | 0x4D0000|
| KID NIKI         | 0x010000 | 0x4E0000|
| YARSREVENGEAYVE  | 0x010000 | 0x4F0000|
| YAKUMAN          | 0x008000 | 0x500000|
| BUBBLE GHOST     | 0x008000 | 0x508000|
| MIGRAIN ACCLAIM  | 0x008000 | 0x510000|
| OTHELLO          | 0x008000 | 0x518000|
| HONG KONG        | 0x008000 | 0x520000|
| KORODICE         | 0x008000 | 0x528000|
| MASTER KARATEKA  | 0x008000 | 0x530000|
| SHISENSYO        | 0x008000 | 0x538000|
| SHANGHAI         | 0x008000 | 0x540000|
| TENNIS           | 0x008000 | 0x548000|
|  - TRUMP  BOY -  | 0x008000 | 0x550000|
| VOLLEY FIRE      | 0x008000 | 0x558000|
| ALLEY WAY        | 0x008000 | 0x560000|
| PITMAN           | 0x008000 | 0x568000|
| SPACE INVADERS   | 0x008000 | 0x570000|
| ASTEROIDS        | 0x008000 | 0x578000|
| BATTLECITY       | 0x008000 | 0x580000|
| BOMB JACK        | 0x008000 | 0x588000|
| BOXXLE           | 0x008000 | 0x590000|
| BOXXLE2          | 0x008000 | 0x598000|
| AMIDA            | 0x008000 | 0x5A0000|
| TETRIS           | 0x008000 | 0x5A8000|
| BRAINBENDER      | 0x008000 | 0x5B0000|
| TIC-TAC-TOE      | 0x008000 | 0x5B8000|
| CASTELIAN        | 0x008000 | 0x5C0000|
| CENTIPEDE        | 0x008000 | 0x5C8000|
| CRYSTAL QUEST    | 0x008000 | 0x5D0000|
| DRAGON SLAYER 1  | 0x008000 | 0x5D8000|
| DROPZONE         | 0x008000 | 0x5E0000|
| DR.MARIO         | 0x008000 | 0x5E8000|
| FLAPPY SPECIAL   | 0x008000 | 0x5F0000|
| FLIPULL          | 0x008000 | 0x5F8000|
| HEIANKYO ALIEN   | 0x008000 | 0x600000|
| HYPERLODERUNNER  | 0x008000 | 0x608000|
| KLAX             | 0x008000 | 0x610000|
| KOI WA KAKEHIKI  | 0x008000 | 0x618000|
| KWIRK            | 0x008000 | 0x620000|
| LOOPZ            | 0x008000 | 0x628000|
| THEGAMEOFHARMONY | 0x008000 | 0x630000|
| MINESWEEPER      | 0x008000 | 0x638000|
| MISSILE COMMAND  | 0x008000 | 0x640000|
| MOTOCROSSMANIACS | 0x008000 | 0x648000|
| NFL FOOTBALL     | 0x008000 | 0x650000|
| PALAMEDES        | 0x008000 | 0x658000|
| PENGUIN LAND     | 0x008000 | 0x660000|
| PIPE DREAM       | 0x008000 | 0x668000|
| POP UP           | 0x010000 | 0x670000|
| QBILLION         | 0x008000 | 0x680000|
| SERPENT          | 0x008000 | 0x688000|
| TESSERAE         | 0x008000 | 0x690000|
| WORLD BOWLING    | 0x008000 | 0x698000|
| DAEDALIAN OPUS   | 0x008000 | 0x6A0000|
| **Junk data**   | **0x058000** | **0x6A8001**|
| TENCHIWOKURAU    | 0x080000 | 0x700000|
| DONKEY KONG      | 0x080000 | 0x780000|

The first part of the rom rom is a giant 4MB partition with lots of stuff. The GB Boy boot rom itself (HITEK_MULTI) contains the "filesystem" and a library of tiles for dealing with the Chinese characters displayed on screen and is limited to the first 32 KB of data. Next is probably data from another project that was stored in memory at some point. It contains SD and FAT system error codes, a list of Atari 2600 games and some chunks or entire A2600 roms. From offset 0x0111D00 to 0x0400000 it contains only 0xFF. This probably easily explains why the checksum is bad...

Next 4 MB is occupied by 66 unique roms, mostly MBC1 and no mapper games, without any particular order of size. The rom structure is quite usual compared to the other 1XX in one or the GB SMART 32M multirom, where roms are placed at offset multiple of their own size. There is however a bug in the process: DAEDALIAN OPUS is supposed to be a 32 KB rom but its "slot" is in fact 393 KB long (the rom is followed by 0x00 until TENCHIWOKURAU). I do not know the purpose of this (apart from fixing alignement issue for the next game) as the space could have been occupied by 11 other 32 KB games instead of being blank, the number of entries of the menu being largely sufficient. The 4MB upper part of the rom could theoretically handle 128x32 KB games. I do not understand how the menu entries are connected to rom offsets for the moment, but as the rom is not supported by any emulator, nor the GBCK003 by any flasher, I postpone any further research on this rom as I cannot test my hypotheses.

## The most unique and janky cartmod ever
![cleanest cartmod](Pictures/Clean_mod.jpg)
