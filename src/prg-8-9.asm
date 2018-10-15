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

;
; Table to determine what "total" index a given
; level + area is. Get the starting area from this
; table (based on CurrentLevel) and add the area to it
;
LevelAreaStartIndexes:
	.db $00 ; Level 1-1
	.db $0A ; Level 1-2
	.db $14 ; Level 1-3
	.db $1E ; Level 2-1
	.db $28 ; Level 2-2
	.db $32 ; Level 2-3
	.db $3C ; Level 3-1
	.db $46 ; Level 3-2
	.db $50 ; Level 3-3
	.db $5A ; Level 4-1
	.db $64 ; Level 4-2
	.db $6E ; Level 4-3
	.db $78 ; Level 5-1
	.db $82 ; Level 5-2
	.db $8C ; Level 5-3
	.db $96 ; Level 6-1
	.db $A0 ; Level 6-2
	.db $AA ; Level 6-3
	.db $B4 ; Level 7-1
	.db $BE ; Level 7-2
	.db $C8 ; Level 7-3 (unused)


; Pointers to level data
include "src/levels/level-data-pointers.asm"


; Include level data;
; see src/levels/level-data.asm for level format details
include "src/levels/level-data.asm"


; Pad out any remaining space
; @TODO Verify that this is OK if unused space is reclaimed
LevelData_Unused:
unusedSpace $A500,$FF


; Pointers to enemy data
include "src/levels/enemy-data-pointers.asm"


; Include enemy data;
; see src/levels/enemy-data.asm for enemy format details
include "src/levels/enemy-data.asm"
