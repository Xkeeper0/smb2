; Level 4-3, Area 5

LevelData_4_3_Area5:
	.db $20, $E0, $02, $09
	.db $56, $32
	.db $34, $36
	.db $27, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $33
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $33
ENDIF
	.db $21, $3D
	.db $F0, $21
	.db $F1, $A0
	.db $FF