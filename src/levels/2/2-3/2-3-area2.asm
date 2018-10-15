; Level 2-3, Area 2

LevelData_2_3_Area2:
	.db $91, $EA, $10, $19
	.db $8A, $2D
	.db $0D, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $05, $13
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $05, $13
ENDIF
	.db $18, $54
	.db $0B, $21
	.db $F1, $0F
	.db $F2
	.db $90, $26
	.db $01, $52
	.db $F0, $8A
	.db $FF
