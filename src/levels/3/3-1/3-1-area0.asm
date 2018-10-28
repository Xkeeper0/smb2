; Level 3-1, Area 0

LevelData_3_1_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $0a, $2

	.db $13, $10
	.db $14, $11
	.db $1A, $16
	.db $0B, $16
	.db $F0, $42
	.db $EA, $C2
	.db $16, $C1
	.db $18, $F1
	.db $0C, $C3
	.db $14, $C4
	.db $0D, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $06, $16
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $06, $16
ENDIF
	.db $F1, $28
	.db $F1, $42
	.db $FF
