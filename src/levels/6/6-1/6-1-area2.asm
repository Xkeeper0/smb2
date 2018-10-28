; Level 6-1, Area 2

LevelData_6_1_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 1, 1, LevelMusic_Boss, 0, 0, $0a, $3

	.db $83, $13
	.db $F5, $0F, $13
	.db $F0, $51
	.db $B7, $83
	.db $26, $81
	.db $25, $32
	.db $12, $00
	.db $03, $00
	.db $04, $00
	.db $05, $32
	.db $F0, $0C
	.db $F2
	.db $F0, $0F
	.db $F0, $6A
	.db $F5, $10, $00
	.db $FF
