; Level 1-1, Area 4

LevelData_1_1_Area4:
	.db $91, $EA, $22, $11
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
