; Level 3-3, Area 2

LevelData_3_3_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Horizontal, 4, 0, LevelMusic_Underground, 0, 3, $0a, $3

	.db $55, $01
	.db $0B, $2D
	.db $6C, $09
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $39
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $39
ENDIF
	.db $F0, $5C
	.db $F0, $75
	.db $F1, $1C
	.db $F1, $55
	.db $82, $A8
	.db $22, $05
	.db $55, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $46
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $46
ENDIF
	.db $F1, $9C
	.db $F1, $D5
	.db $AC, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $53
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $53
ENDIF
	.db $0D, $82
	.db $19, $81
	.db $1A, $80
	.db $0B, $80
	.db $0C, $80
	.db $F0, $5C
	.db $F0, $95
	.db $F0, $FC
	.db $F2
	.db $B9, $14
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $13
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $13
ENDIF
	.db $11, $2A
	.db $03, $26
	.db $05, $24
	.db $0C, $28
	.db $F0, $14
	.db $F1, $CA
	.db $FF
