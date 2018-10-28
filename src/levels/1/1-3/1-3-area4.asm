; Level 1-3, Area 4

LevelData_1_3_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 5, 2, LevelMusic_Boss, 1, 2, $18, $4

	.db $6E, $25
	.db $0F, $25
	.db $1E, $32
	.db $3F, $25
	.db $F0, $50
	.db $F0, $BD
	.db $F1, $5B
	.db $F1, $9A
	.db $B0, $25
	.db $04, $84
	.db $33, $81
	.db $0A, $33
	.db $11, $25
	.db $05, $80
	.db $F0, $99
	.db $F0, $DC
	.db $F1, $F8
	.db $FF
