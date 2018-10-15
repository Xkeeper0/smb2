; Level 3-3, Area 0

LevelData_3_3_Area0:
	.db $91, $EA, $10, $11
	.db $F0, $94
	.db $F2
	.db $48, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $10
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $10
ENDIF
	.db $54, $83
	.db $13, $82
	.db $F0, $50
	.db $F0, $AE
	.db $F1, $8A
	.db $FF
