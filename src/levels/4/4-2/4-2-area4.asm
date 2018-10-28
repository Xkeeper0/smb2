; Level 4-2, Area 4

LevelData_4_2_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 2, 1, LevelMusic_Boss, 0, 0, $0a, $6

	.db $81, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $0A, $33
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0A, $33
ENDIF
	.db $F0, $4C
	.db $F0, $AB
	.db $F1, $E8
	.db $F2
	.db $A3, $3B
	.db $F0, $0D
	.db $F0, $48
	.db $F0, $70
	.db $F1, $F7
	.db $F2
	.db $F0, $30
	.db $F0, $77
	.db $F0, $8F
	.db $F1, $10
	.db $F1, $8A
	.db $F5, $0B, $00
	.db $FF
