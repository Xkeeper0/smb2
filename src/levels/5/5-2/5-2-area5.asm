; Level 5-2, Area 5

LevelData_5_2_Area5:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 0, 1, LevelMusic_Boss, 0, 0, $0a, $2

	.db $82, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $0D, $36
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0D, $36
ENDIF
	.db $2A, $67
	.db $2A, $FF
	.db $F0, $6C
	.db $F1, $48
	.db $53, $10
	.db $26, $11
	.db $3E, $6D
	.db $34, $69
	.db $2A, $F3
	.db $F1, $CC
	.db $55, $10
	.db $A0, $F9
	.db $F0, $08
	.db $F1, $4C
	.db $F1, $8A
	.db $F5, $0E, $00
	.db $FF
