; Level 3-3, Area 6

LevelData_3_3_Area6:
	.db $20, $E0, $07, $19
	.db $54, $2C
	.db $0C, $2C
	.db $57, $32
	.db $14, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $50
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $50
ENDIF
	.db $F0, $41
	.db $F1, $A0
	.db $FF
