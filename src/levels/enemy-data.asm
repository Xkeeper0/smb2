;
; Enemy Data
; ==========
;
; This data is broken down by page (ie. screen), where the first byte indicates
; the number of bytes for this page. Each enemy is two bytes, where the first
; byte is the enemy, and the second byte is XY position.
;
; Each "page" of enemy data is 16x16 tiles.
;
; Note that this is one tile GREATER than level data. Consequently, level and
; enemy data becomes increasingly misaligned in vertical areas.
;
; Examples:
;   $01 - an empty page
;   $03,$01,$47 - a page with a single pink shyguy ($01) at X=4, Y=7
;

; -------------------------------
; World 1

; World 1-1
include "src/levels/1/1-1/1-1-area0-enemies.asm"
include "src/levels/1/1-1/1-1-area1-enemies.asm"
include "src/levels/1/1-1/1-1-area2-enemies.asm"
include "src/levels/1/1-1/1-1-area3-enemies.asm"
include "src/levels/1/1-1/1-1-area4-enemies.asm"
include "src/levels/1/1-1/1-1-area5-enemies.asm"

; World 1-2
include "src/levels/1/1-2/1-2-area0-enemies.asm"
include "src/levels/1/1-2/1-2-area1-enemies.asm"
include "src/levels/1/1-2/1-2-area2-enemies.asm"
include "src/levels/1/1-2/1-2-area3-enemies.asm"
include "src/levels/1/1-2/1-2-area4-enemies.asm"
include "src/levels/1/1-2/1-2-area5-enemies.asm"

; World 1-3
include "src/levels/1/1-3/1-3-area0-enemies.asm"
include "src/levels/1/1-3/1-3-area1-enemies.asm"
include "src/levels/1/1-3/1-3-area2-enemies.asm"
include "src/levels/1/1-3/1-3-area3-enemies.asm"
include "src/levels/1/1-3/1-3-area4-enemies.asm"
; -------------------------------


; -------------------------------
; World 2

; World 2-1
include "src/levels/2/2-1/2-1-area0-enemies.asm"
include "src/levels/2/2-1/2-1-area1-enemies.asm"
include "src/levels/2/2-1/2-1-area2-enemies.asm"
include "src/levels/2/2-1/2-1-area4-enemies.asm"

; World 2-2
include "src/levels/2/2-2/2-2-area0-enemies.asm"
include "src/levels/2/2-2/2-2-area1-enemies.asm"
include "src/levels/2/2-2/2-2-area2-enemies.asm"
include "src/levels/2/2-2/2-2-area3-enemies.asm"
include "src/levels/2/2-2/2-2-area4-enemies.asm"
include "src/levels/2/2-2/2-2-area5-enemies.asm"

; World 2-3
include "src/levels/2/2-3/2-3-area0-enemies.asm"
include "src/levels/2/2-3/2-3-area1-enemies.asm"
include "src/levels/2/2-3/2-3-area2-enemies.asm"
include "src/levels/2/2-3/2-3-area3-enemies.asm"
include "src/levels/2/2-3/2-3-area4-enemies.asm"
include "src/levels/2/2-3/2-3-area5-enemies.asm"
include "src/levels/2/2-3/2-3-area6-enemies.asm"
include "src/levels/2/2-3/2-3-area7-enemies.asm"
; -------------------------------


; -------------------------------
; World 3

; World 3-1
include "src/levels/3/3-1/3-1-area0-enemies.asm"
include "src/levels/3/3-1/3-1-area1-enemies.asm"
include "src/levels/3/3-1/3-1-area2-enemies.asm"
include "src/levels/3/3-1/3-1-area3-enemies.asm"
include "src/levels/3/3-1/3-1-area4-enemies.asm"

; World 3-2
include "src/levels/3/3-2/3-2-area0-enemies.asm"
include "src/levels/3/3-2/3-2-area1-enemies.asm"
include "src/levels/3/3-2/3-2-area2-enemies.asm"
include "src/levels/3/3-2/3-2-area3-enemies.asm"

; World 3-3
include "src/levels/3/3-3/3-3-area0-enemies.asm"
include "src/levels/3/3-3/3-3-area1-enemies.asm"
include "src/levels/3/3-3/3-3-area2-enemies.asm"
include "src/levels/3/3-3/3-3-area3-enemies.asm"
include "src/levels/3/3-3/3-3-area4-enemies.asm"
include "src/levels/3/3-3/3-3-area5-enemies.asm"
include "src/levels/3/3-3/3-3-area6-enemies.asm"
include "src/levels/3/3-3/3-3-area7-enemies.asm"
include "src/levels/3/3-3/3-3-area8-enemies.asm"
; -------------------------------


; -------------------------------
; World 4

; World 4-1
include "src/levels/4/4-1/4-1-area0-enemies.asm"
include "src/levels/4/4-1/4-1-area1-enemies.asm"
include "src/levels/4/4-1/4-1-area2-enemies.asm"

; World 4-2
include "src/levels/4/4-2/4-2-area0-enemies.asm"
include "src/levels/4/4-2/4-2-area1-enemies.asm"
include "src/levels/4/4-2/4-2-area2-enemies.asm"
include "src/levels/4/4-2/4-2-area3-enemies.asm"
include "src/levels/4/4-2/4-2-area4-enemies.asm"

; World 4-3
include "src/levels/4/4-3/4-3-area0-enemies.asm"
include "src/levels/4/4-3/4-3-area1-enemies.asm"
include "src/levels/4/4-3/4-3-area2-enemies.asm"
include "src/levels/4/4-3/4-3-area3-enemies.asm"
include "src/levels/4/4-3/4-3-area4-enemies.asm"
include "src/levels/4/4-3/4-3-area5-enemies.asm"
include "src/levels/4/4-3/4-3-area6-enemies.asm"
include "src/levels/4/4-3/4-3-area7-enemies.asm"
include "src/levels/4/4-3/4-3-area8-enemies.asm"
include "src/levels/4/4-3/4-3-area9-enemies.asm"
; -------------------------------


; -------------------------------
; World 5

; World 5-1
include "src/levels/5/5-1/5-1-area0-enemies.asm"
include "src/levels/5/5-1/5-1-area1-enemies.asm"
include "src/levels/5/5-1/5-1-area2-enemies.asm"

; World 5-2
include "src/levels/5/5-2/5-2-area0-enemies.asm"
include "src/levels/5/5-2/5-2-area1-enemies.asm"
include "src/levels/5/5-2/5-2-area2-enemies.asm"
include "src/levels/5/5-2/5-2-area3-enemies.asm"
include "src/levels/5/5-2/5-2-area4-enemies.asm"
include "src/levels/5/5-2/5-2-area5-enemies.asm"

; World 5-3
include "src/levels/5/5-3/5-3-area0-enemies.asm"
include "src/levels/5/5-3/5-3-area1-enemies.asm"
include "src/levels/5/5-3/5-3-area2-enemies.asm"
include "src/levels/5/5-3/5-3-area3-enemies.asm"
include "src/levels/5/5-3/5-3-area4-enemies.asm"
include "src/levels/5/5-3/5-3-area5-enemies.asm"
; -------------------------------


; -------------------------------
; World 6

; World 6-1
include "src/levels/6/6-1/6-1-area0-enemies.asm"
include "src/levels/6/6-1/6-1-area1-enemies.asm"
include "src/levels/6/6-1/6-1-area2-enemies.asm"
include "src/levels/6/6-1/6-1-area3-enemies.asm"
include "src/levels/6/6-1/6-1-area4-enemies.asm"
include "src/levels/6/6-1/6-1-area5-enemies.asm"
include "src/levels/6/6-1/6-1-area6-enemies.asm"

; World 6-2
include "src/levels/6/6-2/6-2-area0-enemies.asm"
include "src/levels/6/6-2/6-2-area1-enemies.asm"
include "src/levels/6/6-2/6-2-area2-enemies.asm"

; World 6-3
include "src/levels/6/6-3/6-3-area0-enemies.asm"
include "src/levels/6/6-3/6-3-area1-enemies.asm"
include "src/levels/6/6-3/6-3-area2-enemies.asm"
include "src/levels/6/6-3/6-3-area3-enemies.asm"
include "src/levels/6/6-3/6-3-area4-enemies.asm"
include "src/levels/6/6-3/6-3-area5-enemies.asm"
include "src/levels/6/6-3/6-3-area6-enemies.asm"
; -------------------------------


; -------------------------------
; World 7

; World 7-1
include "src/levels/7/7-1/7-1-area0-enemies.asm"
include "src/levels/7/7-1/7-1-area1-enemies.asm"
include "src/levels/7/7-1/7-1-area2-enemies.asm"
include "src/levels/7/7-1/7-1-area3-enemies.asm"
include "src/levels/7/7-1/7-1-area4-enemies.asm"
include "src/levels/7/7-1/7-1-area5-enemies.asm"

; World 7-2
include "src/levels/7/7-2/7-2-area0-enemies.asm"
include "src/levels/7/7-2/7-2-area1-enemies.asm"
include "src/levels/7/7-2/7-2-area2-enemies.asm"
include "src/levels/7/7-2/7-2-area3-enemies.asm"
include "src/levels/7/7-2/7-2-area4-enemies.asm"
include "src/levels/7/7-2/7-2-area5-enemies.asm"
include "src/levels/7/7-2/7-2-area6-enemies.asm"
include "src/levels/7/7-2/7-2-area7-enemies.asm"
include "src/levels/7/7-2/7-2-area8-enemies.asm"
include "src/levels/7/7-2/7-2-area9-enemies.asm"

; World 7-3
include "src/levels/7/7-3/7-3-area0-enemies.asm"
include "src/levels/7/7-3/7-3-area1-enemies.asm"
include "src/levels/7/7-3/7-3-area2-enemies.asm"
include "src/levels/7/7-3/7-3-area3-enemies.asm"
include "src/levels/7/7-3/7-3-area4-enemies.asm"
