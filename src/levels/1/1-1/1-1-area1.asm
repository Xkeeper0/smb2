; Level 1-1, Area 1

LevelData_1_1_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Vertical, 0, 0, LevelMusic_Overworld, 0, 0, $13, $0

	.db $F5, $00, $50
	.db $34, $E1
	.db $19, $E2
	.db $B5, $12
	.db $0A, $12
	.db $17, $12
	.db $16, $E5
	.db $32, $E1
	.db $26, $E3
	.db $57, $E5
	.db $38, $C2
	.db $27, $22
	.db $0C, $E2
	.db $17, $C1
	.db $11, $E2
	.db $16, $22
	.db $16, $C3
	.db $2B, $21
	.db $18, $C4
	.db $37, $C2
	.db $36, $C7
	.db $12, $E2
	.db $35, $C8
	.db $3B, $C3
	.db $24, $22
	.db $12, $0C
	.db $F5, $00, $29
	.db $04, $C4
	.db $30, $E1
	.db $02, $03
	.db $03, $EC
	.db $F4
	.db $07, $0D
	.db $45, $0D
	.db $1A, $0D
	.db $26, $E3
	.db $BA, $0C
	.db $FF
