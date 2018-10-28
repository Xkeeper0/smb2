; Level 4-2, Area 3

LevelData_4_2_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $08, $6

	.db $28, $10
	.db $1C, $11
	.db $52, $39
	.db $F1, $87
	.db $A6, $10
	.db $53, $0F
	.db $12, $29
	.db $0D, $26
	.db $3E, $7F
	.db $F0, $4C
	.db $F1, $CD
	.db $C3, $29
	.db $06, $29
	.db $09, $29
	.db $0C, $29
	.db $3E, $77
	.db $F0, $33
	.db $BE, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $0A, $40
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0A, $40
ENDIF
	.db $18, $2D
	.db $F0, $5B
	.db $F0, $D1
	.db $F1, $CA
	.db $FF
