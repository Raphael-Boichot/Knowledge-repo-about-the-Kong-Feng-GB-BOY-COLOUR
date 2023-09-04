# Knowledge repository about the Kong Feng GB BOY COLOUR
## All that I found by tearing down the Kong Feng GB BOY COLOUR

The GB Boy Colour is a Chinese Game Boy Color clone from brand new parts made by the Kong Feng Company. The model follows the GB Boy, a Game Boy clone. It is now apparently discontinued since 2022. The (laughable) consequence is that the clone is now more expensive than an orginal GBC.

It features a quite hideous backlite screen. Hideous due to a pronounced blue hue and a very bad stretching/upscaling. Lover of pixel perfect screens, move on. Apart from that, the processor is perfectly pinout compatible with a GBC (it can be directly dropped on a GBC motherboard) and the GB Boy Colour itself is a perfectly functionnal GBC-like console. GB printer and serial functions are perfectly working. IR fonctions are not. Cartridges are all compatible knowing the fact that the 5V power board is a bit weak (the EZ-Flash jr boots with difficulty due to current draw) and that the size tolerance of the cartridge slot is off. Inserting and wobbling the cartridge is sometimes necessary to boot a game. But it's generally fine.

The console comes with a 188-in-one internal rom. It contains in real only 66 different games (all classics). It is directly soldered to the motherboard and is quite difficult to remove without damaging the traces. The internal rom in functional only without any cartridge inserted thanks to a small mechanical switch. In case a cartridge is inserted, it pulls high the A15 and CS lines of the rom board, deactivating it.

## The main board with insert showing the switch circuit for activating/deactivating the internal rom
![the GB Boy Colour Board](Pictures/Board.png)

The board with the internal rom desoldered is rather empty and lot of room is lefet below the display. The display itself is also quite difficult to remove to to very tight tolerance on cables. Next image shows the wiring diagram from the internal rom to the Cartridge slot. The Audio in and Clock pin of Game Boy are not connected.

## Wiring between the 30 pins internal rom anf the 32 pins GB compatible cartridge slot.
![the GB Boy Colour pinout](Pictures/Pinout.png)

## Detail of the internal rom pinout
![the GB Boy Colour pinout](Pictures/Pinout_2.png)

At this point, it is quite easy to wire the desoldered internal rom to any
