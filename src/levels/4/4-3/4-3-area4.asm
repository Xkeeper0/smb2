; Level 4-3, Area 4

LevelData_4_3_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 2, $08, $3

	.db $5D, $E2
	.db $4F, $E1
	.db $91, $41
	.db $04, $41
	.db $07, $41
	.db $0A, $41
	.db $0D, $41
	.db $12, $18
	.db $08, $18
	.db $5B, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $20
ENDIF
	.db $1F, $26
	.db $13, $6C
	.db $6F, $2D
	.db $12, $41
	.db $05, $41
	.db $08, $41
	.db $0B, $41
	.db $0E, $41
	.db $13, $18
	.db $09, $18
	.db $58, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $30
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $30
ENDIF
	.db $11, $22
	.db $10, $6C
	.db $FF
