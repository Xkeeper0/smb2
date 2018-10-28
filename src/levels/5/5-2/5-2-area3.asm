; Level 5-2, Area 3

LevelData_5_2_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 6, LevelDirection_Vertical, 0, 1, LevelMusic_Underground, 0, 0, $15, $5

	.db $14, $10
	.db $2C, $11
	.db $11, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $0D, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0D, $20
ENDIF
	.db $22, $6B
	.db $07, $01
	.db $36, $10
	.db $29, $11
	.db $32, $70
	.db $0D, $70
	.db $12, $8E
	.db $0D, $8E
	.db $E3, $70
	.db $0C, $70
	.db $2B, $70
	.db $1B, $83
	.db $4B, $8F
	.db $17, $70
	.db $17, $86
	.db $18, $70
	.db $18, $87
	.db $04, $70
	.db $14, $81
	.db $3A, $70
	.db $F0, $16
	.db $1A, $89
	.db $74, $70
	.db $0B, $82
	.db $14, $81
	.db $15, $70
	.db $36, $70
	.db $16, $85
	.db $F1, $57
	.db $99, $70
	.db $19, $88
	.db $48, $70
	.db $18, $83
	.db $F2
	.db $F0, $96
	.db $F0, $D5
	.db $F1, $14
	.db $F2
	.db $3E, $70
	.db $1E, $85
	.db $2D, $81
	.db $2D, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $0D, $50
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0D, $50
ENDIF
	.db $11, $70
	.db $14, $60
	.db $07, $60
	.db $0A, $60
	.db $24, $F7
	.db $F1, $56
	.db $FF
