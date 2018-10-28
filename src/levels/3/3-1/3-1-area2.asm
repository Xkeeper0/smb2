; Level 3-1, Area 2

LevelData_3_1_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 1, 1, LevelMusic_Underground, 0, 0, $0a, $2

	.db $87, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $06, $19
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $06, $19
ENDIF
	.db $F0, $D1
	.db $F2
	.db $94, $5E
	.db $0D, $26
	.db $F2
	.db $BB, $08
	.db $0D, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $06, $16
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $06, $16
ENDIF
	.db $F1, $10
	.db $F1, $CA
	.db $FF
