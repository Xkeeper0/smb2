; Level 7-1, Area 5

LevelData_7_1_Area5:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Horizontal, 4, 1, LevelMusic_Underground, 0, 0, $0a, $0

	.db $4C, $00
	.db $21, $2D
	.db $02, $21
	.db $03, $21
	.db $04, $21
	.db $05, $21
	.db $06, $26
	.db $07, $51
	.db $11, $38
	.db $3A, $32
	.db $17, $0A
	.db $F5, $12, $16
	.db $F0, $3C
	.db $F1, $EA
	.db $FF
