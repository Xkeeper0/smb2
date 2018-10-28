; Level 3-2, Area 2

LevelData_3_2_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Horizontal, 2, 1, LevelMusic_Boss, 0, 0, $0a, $2

	.db $83, $00
	.db $04, $00
	.db $05, $00
	.db $06, $00
	.db $07, $00
	.db $08, $49
	.db $F0, $7C
	.db $D8, $47
	.db $F0, $55
	.db $F1, $1C
	.db $F5, $08, $00
	.db $F2
	.db $F0, $0E
	.db $F2
	.db $43, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $07, $00
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $07, $00
ENDIF
	.db $F0, $CA
	.db $FF
