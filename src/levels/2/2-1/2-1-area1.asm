; Level 2-1, Area 1

LevelData_2_1_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Vertical, 1, 1, LevelMusic_Underground, 0, 1, $16, $1

	.db $66, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $03, $09
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $03, $09
ENDIF
	.db $7D, $29
	.db $F0, $55
	.db $F1, $1C
	.db $F1, $4D
	.db $83, $29
	.db $F2
	.db $72, $29
	.db $1D, $29
	.db $32, $A3
	.db $32, $05
	.db $F1, $C0
	.db $12, $AA
	.db $AC, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $03, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $03, $20
ENDIF
	.db $F0, $F4
	.db $F1, $98
	.db $F1, $A0
	.db $FF
