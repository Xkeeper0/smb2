; Level 3-1, Area 3

LevelData_3_1_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 5, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 3, $08, $2

	.db $56, $10
	.db $2A, $11
	.db $2E, $10
	.db $12, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $06, $43
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $06, $43
ENDIF
	.db $17, $11
	.db $10, $E4
	.db $08, $10
	.db $1C, $10
	.db $7C, $00
	.db $1C, $E2
	.db $27, $0C
	.db $F5, $06, $10
	.db $1F, $E2
	.db $2F, $00
	.db $10, $E6
	.db $07, $03
	.db $08, $EA
	.db $60, $E2
	.db $26, $E2
	.db $12, $2B
	.db $26, $26
	.db $07, $22
	.db $0D, $E2
	.db $16, $C1
	.db $20, $00
	.db $01, $00
	.db $0A, $E3
	.db $79, $E3
	.db $22, $00
	.db $10, $E3
	.db $07, $E3
	.db $36, $E2
	.db $34, $C1
	.db $0A, $E2
	.db $50, $2D
	.db $29, $A8
	.db $18, $21
	.db $19, $05
	.db $31, $21
	.db $3D, $26
	.db $0E, $21
	.db $0F, $21
	.db $F0, $0C
	.db $F0, $4B
	.db $F0, $95
	.db $F2
	.db $4E, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $06, $40
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $06, $40
ENDIF
	.db $80, $21
	.db $01, $21
	.db $02, $21
	.db $F0, $8B
	.db $F1, $28
	.db $F1, $8B
	.db $F1, $CA
	.db $FF
