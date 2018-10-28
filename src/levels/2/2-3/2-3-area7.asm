; Level 2-3, Area 7

LevelData_2_3_Area7:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Vertical, 1, 1, LevelMusic_Underground, 0, 3, $00, $2

	.db $32, $2C
	.db $0D, $2C
	.db $22, $2C
	.db $0D, $2C
	.db $22, $2C
	.db $0D, $2C
	.db $15, $35
	.db $27, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $05, $36
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $05, $36
ENDIF
	.db $F0, $41
	.db $F1, $80
	.db $FF
