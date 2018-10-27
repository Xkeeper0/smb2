;
; Level Data
; ==========
;
; Levels are broken down by area. The first four bytes are a level header,
; specifying things like palettes, music, size, scrolling, and ground type.
; The rest is level objects. Levels are ended by the $FF special object.
;
; Each "page" of level data is 16x15 tiles.
;
; Level header (4 bytes):
;
;   Byte 1: HxBBBxSS
;   H: horizontal level flag (0 = vertical, 1 = horizontal)
;   B: background palette (0-7)
;   S: sprite palette (0-3)
;
;   Byte 2: xxxGGGGG
;   G: ground setting (0-31)
;
;   Byte 3: PPPPOOOO
;   P: number of pages minus 1 (0 = 1 page, 1 = 2 pages, etc.)
;   O: object type (xxOO for 3X-9X, OOxx for AX-FX)
;
;   Byte 4: xxTTTxMM
;   T: ground type (0-7)
;   M: music (0 = overworld, 1 = underground, 2 = boss, 3 = Wart)
;
; Regular object (2 bytes):
;   $YX - position
;   $TT - type
;
; Special objects (1-3 bytes):
;   $F0 - ground setting; byte 1: oooGGGGG, where o is offset and G is ground setting
;   $F1 - ground setting; byte 1: oooGGGGG, where o+8 is offset and G is ground setting
;   $F2 - skip forward one page; no parameters
;   $F3 - skip forward two pages; no parameters
;   $F4 - new object layer; next object will be positioned relative to (0, 0) of the first page; no parameters
;   $F5 - area pointer; byte 1: world/level offset, byte 2: $AP, where A is the area and P is the page offset within the area
;   $F6 - ground type; byte 1: ground type
;   $F7-$FE - seemingly unused
;   $FF - end of the data for the current level; no parameters
;
; Door pointer (2 bytes):
;   In worlds 1-5, the object immediately following a door acts as an area pointer
;

; -------------------------------
; World 1

; World 1-1
include "src/levels/1/1-1/1-1-area0.asm"
include "src/levels/1/1-1/1-1-area1.asm"
include "src/levels/1/1-1/1-1-area2.asm"
include "src/levels/1/1-1/1-1-area3.asm"
include "src/levels/1/1-1/1-1-area4.asm"
include "src/levels/1/1-1/1-1-area5.asm"

; World 1-2
include "src/levels/1/1-2/1-2-area0.asm"
include "src/levels/1/1-2/1-2-area1.asm"
include "src/levels/1/1-2/1-2-area2.asm"
include "src/levels/1/1-2/1-2-area3.asm"
include "src/levels/1/1-2/1-2-area4.asm"

; World 1-3
include "src/levels/1/1-3/1-3-area0.asm"
include "src/levels/1/1-3/1-3-area1.asm"
include "src/levels/1/1-3/1-3-area2.asm"
include "src/levels/1/1-3/1-3-area3.asm"
include "src/levels/1/1-3/1-3-area4.asm"
; -------------------------------


; -------------------------------
; World 2

; World 2-1
include "src/levels/2/2-1/2-1-area0.asm"
include "src/levels/2/2-1/2-1-area1.asm"
include "src/levels/2/2-1/2-1-area2.asm"
include "src/levels/2/2-1/2-1-area4.asm"

; World 2-2
include "src/levels/2/2-2/2-2-area0.asm"
include "src/levels/2/2-2/2-2-area1.asm"
include "src/levels/2/2-2/2-2-area2.asm"
include "src/levels/2/2-2/2-2-area3.asm"
include "src/levels/2/2-2/2-2-area4.asm"
include "src/levels/2/2-2/2-2-area5.asm"

; World 2-3
include "src/levels/2/2-3/2-3-area0.asm"
include "src/levels/2/2-3/2-3-area1.asm"
include "src/levels/2/2-3/2-3-area2.asm"
include "src/levels/2/2-3/2-3-area3.asm"
include "src/levels/2/2-3/2-3-area4.asm"
include "src/levels/2/2-3/2-3-area5.asm"
include "src/levels/2/2-3/2-3-area6.asm"
include "src/levels/2/2-3/2-3-area7.asm"
; -------------------------------


; -------------------------------
; World 3

; World 3-1
include "src/levels/3/3-1/3-1-area0.asm"
include "src/levels/3/3-1/3-1-area1.asm"
include "src/levels/3/3-1/3-1-area2.asm"
include "src/levels/3/3-1/3-1-area3.asm"
include "src/levels/3/3-1/3-1-area4.asm"

; World 3-2
include "src/levels/3/3-2/3-2-area0.asm"
include "src/levels/3/3-2/3-2-area1.asm"
include "src/levels/3/3-2/3-2-area2.asm"

; World 3-3
include "src/levels/3/3-3/3-3-area0.asm"
include "src/levels/3/3-3/3-3-area1.asm"
include "src/levels/3/3-3/3-3-area2.asm"
include "src/levels/3/3-3/3-3-area3.asm"
include "src/levels/3/3-3/3-3-area4.asm"
include "src/levels/3/3-3/3-3-area5.asm"
include "src/levels/3/3-3/3-3-area6.asm"
include "src/levels/3/3-3/3-3-area7.asm"
include "src/levels/3/3-3/3-3-area8.asm"
; -------------------------------


; -------------------------------
; World 4

; World 4-1
include "src/levels/4/4-1/4-1-area0.asm"
include "src/levels/4/4-1/4-1-area1.asm"

; World 4-2
include "src/levels/4/4-2/4-2-area0.asm"
include "src/levels/4/4-2/4-2-area1.asm"
include "src/levels/4/4-2/4-2-area2.asm"
include "src/levels/4/4-2/4-2-area3.asm"
include "src/levels/4/4-2/4-2-area4.asm"

; World 4-3
include "src/levels/4/4-3/4-3-area0.asm"
include "src/levels/4/4-3/4-3-area1.asm"
include "src/levels/4/4-3/4-3-area2.asm"
include "src/levels/4/4-3/4-3-area3.asm"
include "src/levels/4/4-3/4-3-area4.asm"
include "src/levels/4/4-3/4-3-area5.asm"
include "src/levels/4/4-3/4-3-area6.asm"
include "src/levels/4/4-3/4-3-area7.asm"
; -------------------------------


; -------------------------------
; World 5

; World 5-1
include "src/levels/5/5-1/5-1-area0.asm"
include "src/levels/5/5-1/5-1-area1.asm"
include "src/levels/5/5-1/5-1-area2.asm"

; World 5-2
include "src/levels/5/5-2/5-2-area0.asm"
include "src/levels/5/5-2/5-2-area1.asm"
include "src/levels/5/5-2/5-2-area2.asm"
include "src/levels/5/5-2/5-2-area3.asm"
include "src/levels/5/5-2/5-2-area4.asm"
include "src/levels/5/5-2/5-2-area5.asm"

; World 5-3
include "src/levels/5/5-3/5-3-area0.asm"
include "src/levels/5/5-3/5-3-area1.asm"
include "src/levels/5/5-3/5-3-area2.asm"
include "src/levels/5/5-3/5-3-area3.asm"
include "src/levels/5/5-3/5-3-area4.asm"
include "src/levels/5/5-3/5-3-area5.asm"
; -------------------------------


; -------------------------------
; World 6

; World 6-1
include "src/levels/6/6-1/6-1-area0.asm"
include "src/levels/6/6-1/6-1-area1.asm"
include "src/levels/6/6-1/6-1-area2.asm"
include "src/levels/6/6-1/6-1-area3.asm"
include "src/levels/6/6-1/6-1-area4.asm"
include "src/levels/6/6-1/6-1-area5.asm"
include "src/levels/6/6-1/6-1-area6.asm"

; World 6-2
include "src/levels/6/6-2/6-2-area0.asm"
include "src/levels/6/6-2/6-2-area1.asm"
include "src/levels/6/6-2/6-2-area2.asm"

; World 6-3
include "src/levels/6/6-3/6-3-area0.asm"
include "src/levels/6/6-3/6-3-area1.asm"
include "src/levels/6/6-3/6-3-area2.asm"
include "src/levels/6/6-3/6-3-area3.asm"
include "src/levels/6/6-3/6-3-area4.asm"
include "src/levels/6/6-3/6-3-area5.asm"
include "src/levels/6/6-3/6-3-area6.asm"
; -------------------------------


; -------------------------------
; World 7

; World 7-1
include "src/levels/7/7-1/7-1-area0.asm"
include "src/levels/7/7-1/7-1-area1.asm"
include "src/levels/7/7-1/7-1-area2.asm"
include "src/levels/7/7-1/7-1-area3.asm"
include "src/levels/7/7-1/7-1-area4.asm"
include "src/levels/7/7-1/7-1-area5.asm"

; World 7-2
include "src/levels/7/7-2/7-2-area0.asm"
include "src/levels/7/7-2/7-2-area1.asm"
include "src/levels/7/7-2/7-2-area2.asm"
include "src/levels/7/7-2/7-2-area3.asm"
include "src/levels/7/7-2/7-2-area4.asm"
include "src/levels/7/7-2/7-2-area5.asm"
include "src/levels/7/7-2/7-2-area6.asm"
include "src/levels/7/7-2/7-2-area7.asm"
include "src/levels/7/7-2/7-2-area8.asm"
include "src/levels/7/7-2/7-2-area9.asm"

; World 7-3
include "src/levels/7/7-3/7-3-area0.asm"
; -------------------------------
