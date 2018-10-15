; Level 2-2, Area 0

LevelData_2_2_Area0:
	.db $89, $EA, $10, $19
	.db $8E, $81
	.db $0F, $81
	.db $F0, $B0
	.db $F1, $6F
	.db $BD, $14
IFNDEF DISABLE_DOOR_POINTERS
	.db $04, $10
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $04, $10
ENDIF
	.db $40, $81
	.db $F0, $2E
	.db $F1, $CA
	.db $FF
