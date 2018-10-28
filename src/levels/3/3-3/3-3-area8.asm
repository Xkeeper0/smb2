; Level 3-3, Area 8

LevelData_3_3_Area8:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 5, 2, LevelMusic_Boss, 1, 3, $18, $4

	.db $6E, $A4
	.db $F0, $5C
	.db $F0, $DD
	.db $F1, $5C
	.db $F1, $D9
	.db $F2
	.db $65, $A4
	.db $2A, $33
	.db $F0, $DC
	.db $F1, $F8
	.db $FF
