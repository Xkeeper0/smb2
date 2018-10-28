; Level 3-1, Area 4

LevelData_3_1_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Horizontal, 2, 1, LevelMusic_Boss, 0, 2, $0a, $2

	.db $41, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $06, $35
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $06, $35
ENDIF
	.db $F0, $2E
	.db $F2
	.db $67, $36
	.db $3D, $00
	.db $1D, $00
	.db $14, $35
	.db $10, $31
	.db $F0, $08
	.db $F1, $59
	.db $F1, $CA
	.db $F5, $07, $00
	.db $F3
	.db $26, $83
	.db $20, $81
	.db $0D, $14
IFNDEF DISABLE_DOOR_POINTERS
	.db $06, $30
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $06, $30
ENDIF
	.db $18, $25
	.db $09, $25
	.db $F0, $0B
	.db $F0, $4E
	.db $F1, $EA
	.db $FF
