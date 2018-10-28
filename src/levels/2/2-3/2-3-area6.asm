; Level 2-3, Area 6

LevelData_2_3_Area6:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 5, 2, LevelMusic_Boss, 0, 3, $0a, $5

	.db $8E, $30
	.db $F0, $CD
	.db $F1, $52
	.db $F1, $CD
	.db $E4, $32
	.db $1A, $33
	.db $1C, $83
	.db $0D, $83
	.db $10, $00
	.db $01, $00
	.db $02, $00
	.db $03, $33
	.db $10, $00
	.db $01, $00
	.db $02, $00
	.db $F0, $16
	.db $F0, $6D
	.db $F1, $CA
	.db $FF
