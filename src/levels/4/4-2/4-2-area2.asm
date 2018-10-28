; Level 4-2, Area 2

LevelData_4_2_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $16, $5

	.db $4C, $10
	.db $1E, $11
	.db $49, $26
	.db $0A, $21
	.db $0B, $21
	.db $18, $B5
	.db $0F, $2B
	.db $19, $2E
	.db $78, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0A, $19
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0A, $19
ENDIF
	.db $26, $E4
	.db $1F, $34
	.db $42, $BD
	.db $15, $2E
	.db $67, $29
	.db $0B, $29
	.db $2A, $32
	.db $20, $33
	.db $45, $B4
	.db $0D, $B4
	.db $16, $2E
	.db $0E, $2E
	.db $63, $29
	.db $22, $33
	.db $3B, $52
	.db $16, $52
	.db $0B, $F2
	.db $16, $F2
	.db $9D, $29
	.db $12, $26
	.db $10, $F2
	.db $14, $30
	.db $14, $31
	.db $15, $31
	.db $27, $31
	.db $0B, $B4
	.db $1C, $2E
	.db $56, $29
	.db $12, $10
	.db $0E, $10
	.db $18, $11
	.db $19, $34
	.db $54, $B6
	.db $25, $2E
	.db $6F, $11
	.db $1B, $29
	.db $0C, $10
	.db $70, $B4
	.db $09, $B5
	.db $11, $2E
	.db $0A, $2E
	.db $65, $34
	.db $2C, $33
	.db $52, $B8
	.db $25, $2E
	.db $80, $3F
	.db $43, $08
	.db $18, $B5
	.db $12, $F3
	.db $19, $2E
	.db $75, $10
	.db $2C, $10
	.db $18, $23
	.db $F5, $0A, $30
	.db $0B, $11
	.db $10, $31
	.db $07, $42
	.db $15, $46
	.db $15, $F6
	.db $FF
