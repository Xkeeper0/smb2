; Level 1-2, Area 0

LevelData_1_2_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 7, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $0a, $2

	.db $8E, $C3
	.db $3B, $C1
	.db $F0, $CD
	.db $F1, $48
	.db $DD, $10
	.db $13, $C2
	.db $EB, $10
	.db $10, $11
	.db $06, $10
	.db $0E, $11
	.db $2E, $C1
	.db $7F, $29
	.db $5D, $16
	.db $0E, $16
	.db $2A, $07
	.db $0F, $06
	.db $F5, $01, $30
	.db $18, $26
	.db $0C, $2B
	.db $12, $C2
	.db $F0, $E0
	.db $F6, $00
	.db $43, $10
	.db $15, $11
	.db $1A, $CD
	.db $35, $16
	.db $31, $16
	.db $08, $29
	.db $1D, $09
IFNDEF DISABLE_DOOR_POINTERS
	.db $01, $10
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $01, $10
ENDIF
	.db $10, $22
	.db $02, $51
	.db $40, $29
	.db $0B, $10
	.db $1C, $11
	.db $12, $26
	.db $18, $CC
	.db $F0, $08
	.db $F1, $C2
	.db $F2
	.db $3C, $16
	.db $1D, $16
	.db $13, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $01, $13
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $01, $13
ENDIF
	.db $15, $56
	.db $0E, $51
	.db $9C, $8C
	.db $0D, $8C
	.db $0E, $8C
	.db $0F, $8C
	.db $27, $10
	.db $15, $11
	.db $4A, $16
	.db $14, $16
	.db $0C, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $01, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $01, $20
ENDIF
	.db $26, $16
	.db $09, $82
	.db $0A, $82
	.db $0B, $82
	.db $F0, $00
	.db $FF
