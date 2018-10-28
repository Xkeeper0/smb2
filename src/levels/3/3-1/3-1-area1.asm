; Level 3-1, Area 1

LevelData_3_1_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Vertical, 0, 0, LevelMusic_Overworld, 0, 0, $13, $1

	.db $6C, $10
	.db $52, $10
	.db $18, $12
	.db $F5, $06, $31
	.db $C3, $10
	.db $46, $10
	.db $9C, $10
	.db $34, $10
	.db $70, $FF
	.db $B4, $E2
	.db $F0, $6C
	.db $34, $E2
	.db $38, $E1
	.db $3A, $E1
	.db $3C, $E2
	.db $3A, $E1
	.db $38, $E1
	.db $35, $E1
	.db $32, $E3
	.db $37, $E1
	.db $37, $E4
	.db $3B, $E2
	.db $10, $C2
	.db $2B, $E2
	.db $20, $C3
	.db $1B, $E2
	.db $20, $C4
	.db $12, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $06, $01
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $06, $01
ENDIF
	.db $08, $E3
	.db $F1, $91
	.db $F2
	.db $F1, $8A
	.db $F3
	.db $76, $C1
	.db $27, $C2
	.db $18, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $06, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $06, $20
ENDIF
	.db $F1, $8B
	.db $F1, $AB
	.db $F6, $07
	.db $FF
