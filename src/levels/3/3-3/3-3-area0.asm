; Level 3-3, Area 0

LevelData_3_3_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 2, 1, LevelMusic_Underground, 0, 0, $0a, $2

	.db $F0, $94
	.db $F2
	.db $48, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $10
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $10
ENDIF
	.db $54, $83
	.db $13, $82
	.db $F0, $50
	.db $F0, $AE
	.db $F1, $8A
	.db $FF
