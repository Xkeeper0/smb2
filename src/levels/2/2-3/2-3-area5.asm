; Level 2-3, Area 5

LevelData_2_3_Area5:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 6, LevelDirection_Horizontal, 1, 1, LevelMusic_Boss, 0, 2, $0a, $3

	.db $43, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $05, $33
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $05, $33
ENDIF
	.db $2C, $35
	.db $1C, $35
	.db $1C, $35
	.db $1C, $35
	.db $0D, $29
	.db $F0, $4E
	.db $F1, $8F
	.db $C2, $3F
	.db $12, $3F
	.db $12, $3F
	.db $0B, $29
	.db $12, $3F
	.db $10, $3F
	.db $03, $29
	.db $10, $3F
	.db $10, $3F
	.db $08, $29
	.db $F0, $1C
	.db $62, $29
	.db $2F, $34
	.db $1F, $34
	.db $1F, $34
	.db $1E, $36
	.db $1D, $38
	.db $1C, $3A
	.db $1B, $3C
	.db $1A, $3E
	.db $F0, $0F
	.db $F0, $4E
	.db $F0, $CF
	.db $F1, $0D
	.db $F2
	.db $F1, $CC
	.db $F2, $73
	.db $0F, $06
	.db $07, $11
	.db $0F, $F1
	.db $2D, $F2
	.db $A0, $07
	.db $06, $07
	.db $22, $42
	.db $F0, $10
	.db $F2
	.db $F0, $CF
	.db $F1, $4A
	.db $F5, $05, $60
	.db $FF
