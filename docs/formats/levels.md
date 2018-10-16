# Level Data

Levels are broken down by area. The first four bytes are a level header,
specifying things like palettes, music, size, scrolling, and ground type.
The rest is level objects. Levels are ended by the $FF special object.

Each "page" of level data is 16&times;15 tiles.

Note that area 4 is typically used for the common "jar" room, if there are
any in a given level.


# Level layouts

## Header

Level headers are the first 4 bytes of a level:

* Byte 1: `HxBBBxSS`
  * `H`: horizontal level flag (0 = vertical, 1 = horizontal)
  * `B`: background palette (0-7)
  * `S`: sprite palette (0-3)

* Byte 2: `xxxGGGGG`
  * `G`: ground setting

* Byte 3: `PPPPOOOO`
  * `P`: number of pages minus 1 (0 = 1 page, 1 = 2 pages, etc.)
  * `O`: object type (`xxOO` for `3X-9X`, `OOxx` for `AX-FX`)

* Byte 4: `xxTTTxMM`
  * `T`: ground type
  * `M`: music (0 = overworld, 1 = underground, 2 = boss, 3 = Wart)

`x` are unused bits.

## Objects

* Regular object (2 bytes):
  * `$YX` - position
  * `$TT` - type

* Special objects (1-3 bytes):
  * `$F0 $XX` - changes ground setting (todo: `$XX` = ?)
  * `$F1 $XX` - changes ground setting (todo: `$XX` = ?)
  * `$F2` - skip forward one page
  * `$F3` - skip forward two pages
  * `$F4` - new object layer; next object will be positioned relative to (0, 0) of the first page
  * `$F5 $xx $xx` - area pointer:
    * byte 1: world/level offset,
    * byte 2: `$AP`, where `A` is the area and `P` is the page offset within the area
  * `$F6` - ground type; one parameter for ground type
  * `$F7`-`$FE` - seemingly unused
  * `$FF` - end of the data for the current level; no parameters

* Door pointer (2 bytes):
  * In worlds 1-5, the object immediately following a door acts as an area pointer


## Ground types

@todo

# Enemy layouts

This data is broken down by page (ie. screen), where the first byte indicates
the number of bytes for this page. Each enemy is two bytes, where the first
byte is the enemy ID, and the second byte is `XY` position.

Each "page" of enemy data is 16&times;16 tiles.

Note that this is one tile *GREATER* than level data. Consequently, level and
enemy data becomes increasingly misaligned in vertical areas.

Examples:
* `$01` - an empty page
* `$03 $01 $47` - a page with a single pink shyguy (`$01`) at X=`4`, Y=`7`

In the disassembly, these have been replaced with a macro for readability and
ease of editing:

```assembly
; Page 0
	distTo + ; $03 (1 enemy)
	enemy $3, $8, Enemy_HawkmouthRight

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $9, $4, Enemy_SnifitPink
	enemy $B, $4, Enemy_SnifitPink

+ ; Additional pages here ...
```
The first line of each page is `distTo +`, which automatically fills in the
length of the section. The following lines, if any, are enemies for that page.

The format for enemy placement is `enemy $X, $Y, Enemy_Name`. Each area is
terminated by a `+`, with the section repeating additional `distTo` macros as
needed.
