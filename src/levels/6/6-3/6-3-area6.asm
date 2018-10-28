; Level 6-3, Area 6

LevelData_6_3_Area6:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 5, 2, LevelMusic_Boss, 0, 3, $18, $5

	.db $F0, $50
	.db $F0, $CD
	.db $F1, $0C
	.db $F1, $4F
	.db $F1, $8E
	.db $F2
	.db $8B, $81
	.db $15, $32
	.db $32, $00
	.db $03, $00
	.db $04, $00
	.db $05, $00
	.db $06, $00
	.db $07, $00
	.db $08, $00
	.db $F0, $50
	.db $F1, $37
	.db $F1, $6F
	.db $F1, $97
	.db $F1, $CA
	.db $FF
