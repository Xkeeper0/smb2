;
; Bank 8 & Bank 9
; ===============
;
; What's inside:
;
;   - Level and enemy data pointer tables
;   - Level data
;   - Enemy data
;

; .segment BANK8
; * =  $8000

;
; Table to determine what "total" index a given
; level + area is. Get the starting area from this
; table (based on CurrentLevel) and add the area to it
;
LevelAreaStartIndexes:
      .BYTE $00 ; Level 1-1
      .BYTE $0A ; Level 1-2
      .BYTE $14 ; Level 1-3
      .BYTE $1E ; Level 2-1
      .BYTE $28 ; Level 2-2
      .BYTE $32 ; Level 2-3
      .BYTE $3C ; Level 3-1
      .BYTE $46 ; Level 3-2
      .BYTE $50 ; Level 3-3
      .BYTE $5A ; Level 4-1
      .BYTE $64 ; Level 4-2
      .BYTE $6E ; Level 4-3
      .BYTE $78 ; Level 5-1
      .BYTE $82 ; Level 5-2
      .BYTE $8C ; Level 5-3
      .BYTE $96 ; Level 6-1
      .BYTE $A0 ; Level 6-2
      .BYTE $AA ; Level 6-3
      .BYTE $B4 ; Level 7-1
      .BYTE $BE ; Level 7-2
      .BYTE $C8 ; Level 7-3 (unused)


; Pointers to level data
include "src/levels/level-data-pointers.asm"


; Include level data;
; see src/levels/level-data.asm for level format details
include "src/levels/level-data.asm"


; Pad out any remaining space
; @TODO Should respect PRESERVE_UNUSED_SPACE flag
LevelData_Unused:
      .PAD $A500,$FF


; Pointers to enemy data
include "src/levels/enemy-data-pointers.asm"


; Include enemy data;
; see src/levels/enemy-data.asm for enemy format details
include "src/levels/enemy-data.asm"
