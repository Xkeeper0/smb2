; Level 2-2, Area 5

LevelData_2_2_Area5:
	.db $89, $EA, $22, $1A
	.db $43, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $04, $33
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $04, $33
ENDIF
	.db $F0, $4E
	.db $F1, $4F
	.db $F1, $BC
	.db $F2
	.db $64, $4E
	.db $64, $00
	.db $07, $00
	.db $08, $00
	.db $F0, $13
	.db $F0, $8D
	.db $70, $46
	.db $10, $42
	.db $F0, $88, $F0, $EC
	.db $F1, $2B
	.db $F1, $8A
	.db $F5, $05, $00
	.db $FF
