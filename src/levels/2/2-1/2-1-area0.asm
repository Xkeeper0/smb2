; Level 2-1, Area 0

LevelData_2_1_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $0c, $0

	.db $00, $0E
	.db $14, $11
	.db $12, $10
	.db $1C, $10
	.db $4A, $17
	.db $12, $17
	.db $8A, $10
	.db $27, $17
	.db $E2, $10
	.db $14, $11
	.db $4A, $07
	.db $0F, $D3
	.db $11, $D5
	.db $0E, $D1
	.db $10, $D1
	.db $06, $D1
	.db $0D, $D1
	.db $77, $10
	.db $19, $11
	.db $48, $29
	.db $1C, $D3
	.db $12, $D1
	.db $0B, $D1
	.db $0F, $D1
	.db $13, $D1
	.db $0A, $D1
	.db $B8, $26
	.db $0A, $22
	.db $0B, $2B
	.db $0C, $22
	.db $0D, $22
	.db $17, $36
	.db $14, $07
	.db $08, $34
	.db $17, $36
	.db $10, $D1
	.db $08, $34
	.db $8E, $10
	.db $39, $29
	.db $37, $0F
	.db $0A, $0F
	.db $1D, $D2
	.db $F0, $0C
	.db $F6, $01
	.db $93, $11
	.db $47, $0F
	.db $0F, $37
	.db $1E, $39
	.db $1D, $3B
	.db $F1, $8C
	.db $F6, $00
	.db $89, $10
	.db $10, $29
	.db $05, $29
	.db $1F, $29
	.db $11, $33
	.db $10, $35
	.db $1C, $0F
	.db $F2
	.db $7D, $0F
	.db $F0, $0C
	.db $F6, $01
	.db $F1, $8C
	.db $F6, $00
	.db $A3, $10
	.db $11, $11
	.db $07, $17
	.db $59, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $03, $10
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $03, $10
ENDIF
	.db $FF
