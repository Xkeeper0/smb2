; Level 4-3, Area 6

LevelData_4_3_Area6:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 4, 0, LevelMusic_Boss, 0, 0, $0a, $3

	.db $62, $3D
	.db $46, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $18
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $18
ENDIF
	.db $22, $3D
	.db $F0, $50
	.db $90, $34
	.db $51, $42
	.db $10, $34
	.db $F0, $B7
	.db $F0, $EF
	.db $F1, $2E
	.db $F1, $6F
	.db $F1, $97
	.db $F1, $CA
	.db $F5, $0B, $70
	.db $FF
