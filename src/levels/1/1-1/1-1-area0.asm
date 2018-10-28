; Level 1-1, Area 0

LevelData_1_1_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Vertical, 1, 1, LevelMusic_Overworld, 0, 0, $13, $0

	.db $B7, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $00, $00
ENDIF
	.db $56, $10
	.db $1A, $10
	.db $D6, $C2
	.db $29, $10
	.db $75, $C4
	.db $5A, $21
	.db $12, $C9
	.db $75, $C7
	.db $1E, $C1
	.db $3E, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $00, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $00, $20
ENDIF
	.db $20, $CF
	.db $FF
