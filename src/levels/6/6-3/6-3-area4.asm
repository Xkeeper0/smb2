; Level 6-3, Area 4

LevelData_6_3_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 4, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $08, $0

	.db $24, $10
	.db $28, $0C
	.db $F5, $11, $30
	.db $0E, $11
	.db $90, $E7
	.db $08, $03
	.db $09, $EF
	.db $50, $10
	.db $28, $11
	.db $6C, $3F
	.db $1A, $3E
	.db $1E, $3F
	.db $40, $10
	.db $22, $11
	.db $07, $17
	.db $59, $0B
	.db $F5, $11, $50
	.db $2C, $37
	.db $19, $3C
	.db $1E, $33
	.db $13, $39
	.db $48, $11
	.db $19, $E2
	.db $12, $10
	.db $F2
	.db $2A, $0A
	.db $F5, $11, $10
	.db $20, $E1
	.db $04, $E1
	.db $09, $E2
	.db $4D, $11
	.db $13, $10
	.db $28, $11
	.db $FF
