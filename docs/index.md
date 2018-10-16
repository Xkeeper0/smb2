This is the GitHub repository for the *Super Mario Bros. 2* (USA) disassembly
project.

Instructions for how to download and reassemble the game are in the
[repository readme file](https://github.com/Xkeeper0/smb2).

This site will primarily work on detailing some of the innards of how the game
works, as well as some other stuff.

We have a [Discord](https://discord.gg/TsWMMeV) you can join if you'd like to
talk about or assist in disassembling and documenting the game, as well.

--------------------------------------------------------------------------------

## Contents

* **Program ROM banks**
  * [PRG0 and PRG1](#prg0-and-prg1): Title screens, controls, player/enemy handling.
  * [PRG2 and PRG3](#prg2-and-prg3): Enemy initialization and logic
  * [PRG4 and PRG5](#prg4-and-prg5): Music and sound engine
  * [PRG6 and PRG7](#prg6-and-prg7): World palettes, level handling code
  * [PRG8 and PRG9](#prg8-and-prg9): Pointers and data for level layouts and enemies
  * [PRGA and PRGB](#prga-and-prgb): Level title cards, Bonus Chance background, character select stuff
  * [PRGC and PRGD](#prgc-and-prgd): Mario's asleep ending and cast roll
  * [PRGE and PRGF](#prge-and-prgf): Fixed-bank potpourri, basically important stuff


* **Data formats**
  * [Level data](formats/levels)
    * [Headers](formats/levels#header)
    * [Objects](formats/levels#objects)
    * [Ground types](formats/levels#ground-types)
    * [Enemies](formats/levels#enemy-layouts)
  * PPU buffers
  * Music
  * etc...

--------------------------------------------------------------------------------

# Program ROM banks

*Super Mario Bros. 2* uses the [MMC3 mapper](https://wiki.nesdev.com/w/index.php/MMC3)
and technically supports 16 &times; 8K banks, but the game was programmed in a
way that they're treated more like 8 &times; 16K banks (swapped in pairs of two).

Technically you (or Nintendo, really) could have used the full capabilities of
the MMC3 mapper and swapped them in 8K sections, but the game was originally
converted from the FDS *Doki Doki Panic*;
[the prototype of the conversion](https://tcrf.net/Proto:Super_Mario_Bros._2_(NES%29))
uses the [MMC1 mapper](https://wiki.nesdev.com/w/index.php/MMC1), which only
supported 16K banks.

A handful of banks in *Super Mario Bros. 2* are completely or nearly empty,
offering plenty of potential space for new code, levels, or features.


## PRG0 and PRG1

Brief overview of stuff in these two banks, before splitting into details below.


### Title screen

A few light details on how the title screen works, with a link to a section on
how the game's *PPU write commands* work


### Player controls

Some more text about how this works


### Player state handling

Some text about this, too


### Enemy handling

And more here


### Points of interest

If you've read the SMB3 disassembly notes, you know *exactly* what goes here


## Work in progress

This document is, of course, nowhere near done, so... check back later!
