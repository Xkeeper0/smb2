; Level 7-2, Area 3

LevelData_7_2_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Horizontal, 4, 1, LevelMusic_Underground, 1, 0, $0a, $0

	.db $5C, $40
	.db $1C, $A4
	.db $25, $0A
	.db $F5, $13, $63
	.db $24, $33
	.db $F0, $50
	.db $80, $4F
	.db $10, $A7
	.db $05, $A7
	.db $0C, $A7
	.db $80, $4F
	.db $60, $4F
	.db $10, $4F
	.db $10, $A5
	.db $35, $35
	.db $13, $0A
	.db $F5, $13, $29
	.db $20, $4F
	.db $10, $4F
	.db $90, $A3
	.db $28, $0A
	.db $F5, $13, $69
	.db $F0, $11
	.db $F1, $4A
	.db $FF
