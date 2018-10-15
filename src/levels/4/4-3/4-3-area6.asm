; Level 4-3, Area 6

LevelData_4_3_Area6:
	.db $A0, $EA, $10, $1A
	.db $62, $3D
	.db $46, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $18
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $18
ENDIF
	.db $22, $3D
	.db $F0, $50
	.db $90, $34
	.db $51, $42
	.db $10, $34
	.db $F0, $B7
	.db $F0, $EF
	.db $F1, $2E
	.db $F1, $6F
	.db $F1, $97
	.db $F1, $CA
	.db $F5, $0B, $70
	.db $FF
