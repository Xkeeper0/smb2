; Level 3-3, Area 6

LevelData_3_3_Area6:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Vertical, 4, 0, LevelMusic_Underground, 1, 3, $00, $3

	.db $54, $2C
	.db $0C, $2C
	.db $57, $32
	.db $14, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $50
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $50
ENDIF
	.db $F0, $41
	.db $F1, $A0
	.db $FF
