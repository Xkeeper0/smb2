; Level 1-3, Area 0

LevelData_1_3_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $01, $0

	.db $00, $8A
	.db $01, $8A
	.db $02, $8A
	.db $2D, $29
	.db $1A, $29
	.db $28, $C5
	.db $2E, $F2
	.db $F1, $C8
	.db $A6, $29
	.db $0E, $10
	.db $13, $29
	.db $21, $C2
	.db $07, $C5
	.db $24, $F2
	.db $0D, $F2
	.db $26, $C7
	.db $20, $C4
	.db $79, $29
	.db $0B, $29
	.db $18, $2B
	.db $11, $22
	.db $02, $26
	.db $03, $DB
	.db $10, $C3
	.db $0E, $C1
	.db $14, $F9
	.db $3E, $C4
	.db $1A, $C3
	.db $10, $C6
	.db $56, $10
	.db $1A, $11
	.db $4C, $D3
	.db $15, $D3
	.db $0D, $C1
	.db $16, $C1
	.db $0F, $F3
	.db $18, $F4
	.db $13, $F2
	.db $64, $10
	.db $28, $D3
	.db $19, $C1
	.db $12, $D3
	.db $0B, $FE
	.db $13, $C1
	.db $15, $F3
	.db $A7, $11
	.db $11, $29
	.db $05, $29
	.db $0B, $21
	.db $0C, $21
	.db $0D, $21
	.db $0E, $21
	.db $0F, $21
	.db $1A, $C6
	.db $60, $C1
	.db $04, $C1
	.db $08, $CA
	.db $80, $2D
	.db $0A, $10
	.db $42, $29
	.db $43, $F9
	.db $F1, $A1
	.db $3E, $18
	.db $23, $11
	.db $18, $10
	.db $16, $29
	.db $24, $22
	.db $06, $21
	.db $08, $22
	.db $13, $D5
	.db $12, $C1
	.db $08, $C1
	.db $24, $26
	.db $06, $22
	.db $2B, $F1
	.db $F1, $68
	.db $F1, $A1
	.db $34, $18
	.db $0A, $18
	.db $9C, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $02, $23
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $02, $23
ENDIF
	.db $98, $10
	.db $55, $C1
	.db $12, $08
	.db $10, $51
	.db $F0, $E8
	.db $FF
