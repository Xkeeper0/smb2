; Level 1-3, Area 1

LevelData_1_3_Area1:
	.db $20, $E0, $03, $19
	.db $55, $2C
	.db $0B, $2C
	.db $33, $2C
	.db $0D, $2C
	.db $16, $34
	.db $27, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $02, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $02, $20
ENDIF
	.db $F0, $54
	.db $F1, $A0
	.db $FF
