; Level 4-3, Area 0

LevelData_4_3_Area0:
	levelHeader 0, LevelDirection_Horizontal, 2, 1, LevelMusic_Underground, 0, 2, $0a, $2

	.db $4B, $14
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $11
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $11
ENDIF
	.db $0D, $A8
	.db $F0, $54
	.db $F0, $D3
	.db $F1, $15
	.db $F1, $CA
	.db $FF
