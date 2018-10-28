; Level 1-3, Area 1

LevelData_1_3_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Vertical, 4, 0, LevelMusic_Underground, 0, 3, $00, $3

	.db $55, $2C
	.db $0B, $2C
	.db $33, $2C
	.db $0D, $2C
	.db $16, $34
	.db $27, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $02, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $02, $20
ENDIF
	.db $F0, $54
	.db $F1, $A0
	.db $FF
