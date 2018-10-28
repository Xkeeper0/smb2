; Level 1-1, Area 4

LevelData_1_1_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 2, 1, LevelMusic_Underground, 0, 2, $0a, $2

	.db $03, $F3
	.db $97, $12
	.db $F5, $00, $31
	.db $34, $80
	.db $05, $80
	.db $0E, $21
	.db $0F, $21
	.db $F0, $EC
	.db $F1, $0F
	.db $F1, $50
	.db $E1, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $00, $27
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $00, $27
ENDIF
	.db $F0, $8A
	.db $FF
