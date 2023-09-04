# Knowledge repository about the Kong Feng GB BOY COLOUR
## All that I found by tearing down the Kong Feng GB BOY COLOUR

The GB Boy Colour is a Chinese Game Boy Color clone from brand new parts made by the Kong Feng Company. The model follows the GB Boy, a Game Boy clone. It is now apparently discontinued since 2022. The (laughable) consequence is that the clone is now more expensive than an orginal GBC.

It features a quite hideous backlite screen. Hideous due to a pronounced blue hue and a very bad stretching/upscaling. Lover of pixel perfect screens, move on. Apart from that, the processor is perfectly pinout compatible with a GBC (it can be directly dropped on a GBC motherboard) and the GB Boy Colour itself is a perfectly functionnal GBC-like console. GB printer and serial functions are perfectly working. IR fonctions are not. Cartridges are all compatible knowing the fact that the 5V power board is a bit weak (the EZ-Flash jr boots with difficulty due to current draw) and that the size tolerance of the cartridge slot is off. Inserting and wobbling the cartridge is sometimes necessary to boot a game. But it's generally fine.

The console comes with a 188-in-one internal rom, labelled GBCK003. It contains in real only 66 different games (all classics). It is directly soldered to the motherboard and is quite difficult to remove without damaging the traces. The internal rom in functional only without any cartridge inserted thanks to a small mechanical switch. In case a cartridge is inserted, it pulls high the A15 and CS lines of the rom board, deactivating it.

## The main board with insert showing the switch circuit for activating/deactivating the internal rom
![the GB Boy Colour Board](Pictures/Board.png)

The board with the internal rom desoldered is rather empty and lot of room is lefet below the display. The display itself is also quite difficult to remove to to very tight tolerance on cables. Next image shows the wiring diagram from the internal rom to the Cartridge slot. The Audio in and Clock pin of Game Boy are not connected.

## Wiring between the 30 pins internal rom and the 32 pins GB compatible cartridge slot.
![the GB Boy Colour pinout](Pictures/Pinout.png)

Side note, the flash chip is rated for 3.3 only and is directly wired to the +5V of the GB Boy Colour. It ran on my side for dozens of hours, but how many more will it survive ?

## Detail of the internal rom pinout (flash chip is a 8MB MX29LV640EBTI)
![the GB Boy Colour pinout](Pictures/Pinout_2.png)

At this point, it is quite "easy" to directly wire the desoldered internal rom to any Game Boy PCB (CS and A15 included) from my own PCB graveyard and see what happens (it was a Divastarz cartridge in the past, it died without suffering). Wiring it manually pin by pin was in fact quite an excruciating pain but it was for science. Well, and of course it works !

## Do you trust in Science ? Now playing the 188 in 1 without the hideous stretching !
![the GB Boy Colour pinout](Pictures/Trust_in_pinout.png)

The rom is quite badly made so the checksum is incorrect (range 0x00014E-0x00014F) and the chip size flag is bad too (offset 0x000148 reports 0x06 for 2MB while it should be 0x08 for 8MB) in the header. The rom can anyway be dumped with FlashGBX and a GBXCart with the following parameters (do not mind the checksum error, the dump will be good): 

![FlashGBX parameters](Pictures/FlashGBX_parameters.png)

The global rom organisation is the following (by increasing offset):
- Rom name: HITEK_MULTI      | Size in bytes: 0x400000 | Starting offset: 0x000000
- Rom name: SUPER MARIOLAND  | Size in bytes: 0x010000 | Starting offset: 0x400000
- Rom name: BUGS BUNNY       - Size in bytes: 0x010000 - Starting offset: 0x410000
- Rom name: PARASORU HEMBEI  - Size in bytes: 0x010000 - Starting offset: 0x420000
- Rom name: GO GO TANK       - Size in bytes: 0x010000 - Starting offset: 0x430000
- Rom name: ALADDIN          - Size in bytes: 0x040000 - Starting offset: 0x440000
- Rom name: CONTRA           - Size in bytes: 0x020000 - Starting offset: 0x480000
- Rom name: MARIO & YOSHI    - Size in bytes: 0x010000 - Starting offset: 0x4A0000
- Rom name: DUCK TALES       - Size in bytes: 0x010000 - Starting offset: 0x4B0000
- Rom name: PAC-MAN          - Size in bytes: 0x010000 - Starting offset: 0x4C0000
- Rom name: SIDE POCKET      - Size in bytes: 0x010000 - Starting offset: 0x4D0000
- Rom name: KID NIKI         - Size in bytes: 0x010000 - Starting offset: 0x4E0000
- Rom name: YARSREVENGEAYVE  - Size in bytes: 0x010000 - Starting offset: 0x4F0000
- Rom name: YAKUMAN          - Size in bytes: 0x008000 - Starting offset: 0x500000
- Rom name: BUBBLE GHOST     - Size in bytes: 0x008000 - Starting offset: 0x508000
- Rom name: MIGRAIN ACCLAIM  - Size in bytes: 0x008000 - Starting offset: 0x510000
- Rom name: OTHELLO          - Size in bytes: 0x008000 - Starting offset: 0x518000
- Rom name: HONG KONG        - Size in bytes: 0x008000 - Starting offset: 0x520000
- Rom name: KORODICE         - Size in bytes: 0x008000 - Starting offset: 0x528000
- Rom name: MASTER KARATEKA  - Size in bytes: 0x008000 - Starting offset: 0x530000
- Rom name: SHISENSYO        - Size in bytes: 0x008000 - Starting offset: 0x538000
- Rom name: SHANGHAI         - Size in bytes: 0x008000 - Starting offset: 0x540000
- Rom name: TENNIS           - Size in bytes: 0x008000 - Starting offset: 0x548000
- Rom name:  - TRUMP  BOY -  - Size in bytes: 0x008000 - Starting offset: 0x550000
- Rom name: VOLLEY FIRE      - Size in bytes: 0x008000 - Starting offset: 0x558000
- Rom name: ALLEY WAY        - Size in bytes: 0x008000 - Starting offset: 0x560000
- Rom name: PITMAN           - Size in bytes: 0x008000 - Starting offset: 0x568000
- Rom name: SPACE INVADERS   - Size in bytes: 0x008000 - Starting offset: 0x570000
- Rom name: ASTEROIDS        - Size in bytes: 0x008000 - Starting offset: 0x578000
- Rom name: BATTLECITY       - Size in bytes: 0x008000 - Starting offset: 0x580000
- Rom name: BOMB JACK        - Size in bytes: 0x008000 - Starting offset: 0x588000
- Rom name: BOXXLE           - Size in bytes: 0x008000 - Starting offset: 0x590000
- Rom name: BOXXLE2          - Size in bytes: 0x008000 - Starting offset: 0x598000
- Rom name: AMIDA            - Size in bytes: 0x008000 - Starting offset: 0x5A0000
- Rom name: TETRIS           - Size in bytes: 0x008000 - Starting offset: 0x5A8000
- Rom name: BRAINBENDER      - Size in bytes: 0x008000 - Starting offset: 0x5B0000
- Rom name: TIC-TAC-TOE      - Size in bytes: 0x008000 - Starting offset: 0x5B8000
- Rom name: CASTELIAN        - Size in bytes: 0x008000 - Starting offset: 0x5C0000
- Rom name: CENTIPEDE        - Size in bytes: 0x008000 - Starting offset: 0x5C8000
- Rom name: CRYSTAL QUEST    - Size in bytes: 0x008000 - Starting offset: 0x5D0000
- Rom name: DRAGON SLAYER 1  - Size in bytes: 0x008000 - Starting offset: 0x5D8000
- Rom name: DROPZONE         - Size in bytes: 0x008000 - Starting offset: 0x5E0000
- Rom name: DR.MARIO         - Size in bytes: 0x008000 - Starting offset: 0x5E8000
- Rom name: FLAPPY SPECIAL   - Size in bytes: 0x008000 - Starting offset: 0x5F0000
- Rom name: FLIPULL          - Size in bytes: 0x008000 - Starting offset: 0x5F8000
- Rom name: HEIANKYO ALIEN   - Size in bytes: 0x008000 - Starting offset: 0x600000
- Rom name: HYPERLODERUNNER  - Size in bytes: 0x008000 - Starting offset: 0x608000
- Rom name: KLAX             - Size in bytes: 0x008000 - Starting offset: 0x610000
- Rom name: KOI WA KAKEHIKI  - Size in bytes: 0x008000 - Starting offset: 0x618000
- Rom name: KWIRK            - Size in bytes: 0x008000 - Starting offset: 0x620000
- Rom name: LOOPZ            - Size in bytes: 0x008000 - Starting offset: 0x628000
- Rom name: THEGAMEOFHARMONY - Size in bytes: 0x008000 - Starting offset: 0x630000
- Rom name: MINESWEEPER      - Size in bytes: 0x008000 - Starting offset: 0x638000
- Rom name: MISSILE COMMAND  - Size in bytes: 0x008000 - Starting offset: 0x640000
- Rom name: MOTOCROSSMANIACS - Size in bytes: 0x008000 - Starting offset: 0x648000
- Rom name: NFL FOOTBALL     - Size in bytes: 0x008000 - Starting offset: 0x650000
- Rom name: PALAMEDES        - Size in bytes: 0x008000 - Starting offset: 0x658000
- Rom name: PENGUIN LAND     - Size in bytes: 0x008000 - Starting offset: 0x660000
- Rom name: PIPE DREAM       - Size in bytes: 0x008000 - Starting offset: 0x668000
- Rom name: POP UP           - Size in bytes: 0x010000 - Starting offset: 0x670000
- Rom name: QBILLION         - Size in bytes: 0x008000 - Starting offset: 0x680000
- Rom name: SERPENT          - Size in bytes: 0x008000 - Starting offset: 0x688000
- Rom name: TESSERAE         - Size in bytes: 0x008000 - Starting offset: 0x690000
- Rom name: WORLD BOWLING    - Size in bytes: 0x008000 - Starting offset: 0x698000
- Rom name: DAEDALIAN OPUS   - Size in bytes: 0x060000 - Starting offset: 0x6A0000
- Rom name: TENCHIWOKURAU    - Size in bytes: 0x080000 - Starting offset: 0x700000
- Rom name: DONKEY KONG      - Size in bytes: 0x080000 - Starting offset: 0x780000

The first rom is a giant 4MB partition containing the 'filesystem', a library of tile for dealing with the Chinese characters displayed on screen and lots of compilation data. Next 4 MB is occupied by 66 unique roms, mostly MBC1 and no mapper games, without any particular order of size. This rom structure is very unusual compared to the other 1XX in one or the GB SMART 32M multirom, where roms are packed more efficiently at offset multiple of their own size. I do not know at the moment if the GBCK003 can be flashed back with a custom rom.

## Most clean Cartmod ever
![cleanest cartmod](Pictures/Clean_mod.jpg)
