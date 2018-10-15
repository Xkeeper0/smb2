; Level 3-3, Area 1

LevelData_3_3_Area1:
	.db $80, $E1, $30, $00
	.db $35, $10
	.db $29, $11
	.db $36, $C2
	.db $17, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $01
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $01
ENDIF
	.db $1E, $0F
	.db $8B, $11
	.db $17, $10
	.db $32, $2B
	.db $12, $0F
	.db $10, $0F
	.db $13, $01
	.db $05, $52
	.db $08, $26
	.db $5C, $18
	.db $45, $10
	.db $49, $0F
	.db $72, $18
	.db $08, $18
	.db $96, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $23
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $23
ENDIF
	.db $FF