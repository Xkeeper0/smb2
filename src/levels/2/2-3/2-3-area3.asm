; Level 2-3, Area 3

LevelData_2_3_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 6, LevelDirection_Vertical, 1, 1, LevelMusic_Underground, 0, 1, $01, $1

	.db $68, $14
IFNDEF DISABLE_DOOR_POINTERS
	.db $05, $19
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $05, $19
ENDIF
	.db $5C, $31
	.db $13, $31
	.db $F0, $35
	.db $F1, $1C
	.db $6B, $29
	.db $9D, $29
	.db $A8, $28
	.db $3A, $34
	.db $F0, $75
	.db $F1, $1C
	.db $F1, $75
	.db $82, $2C
	.db $06, $2C
	.db $09, $2C
	.db $0D, $2C
	.db $24, $2C
	.db $0B, $2C
	.db $5C, $09
IFNDEF DISABLE_DOOR_POINTERS
	.db $05, $50
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $05, $50
ENDIF
	.db $F1, $33
	.db $F1, $92
	.db $BB, $29
	.db $54, $29
	.db $F0, $6F
	.db $92, $29
	.db $5D, $29
	.db $F0, $0D
	.db $B6, $83
	.db $07, $83
	.db $08, $83
	.db $09, $83
	.db $28, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $05, $70
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $05, $70
ENDIF
	.db $1B, $29
	.db $F0, $0E
	.db $F0, $CD
	.db $F1, $4E
	.db $F1, $A0
	.db $FF
