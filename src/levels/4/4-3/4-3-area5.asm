; Level 4-3, Area 5

LevelData_4_3_Area5:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Vertical, 4, 0, LevelMusic_Underground, 0, 2, $00, $1

	.db $56, $32
	.db $34, $36
	.db $27, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $33
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $33
ENDIF
	.db $21, $3D
	.db $F0, $21
	.db $F1, $A0
	.db $FF
