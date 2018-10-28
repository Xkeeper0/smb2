; Level 1-1, Area 5

LevelData_1_1_Area5:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 4, LevelDirection_Horizontal, 0, 0, LevelMusic_Boss, 0, 0, $08, $2

	.db $7C, $10
	.db $18, $0C
	.db $F5, $00, $10
	.db $12, $10
	.db $15, $11
	.db $30, $E7
	.db $08, $03
	.db $09, $E6
	.db $9C, $10
	.db $1F, $11
	.db $50, $E7
	.db $0A, $91
	.db $F1, $60
	.db $7E, $10
	.db $43, $48
	.db $F5, $01, $00
	.db $F0, $4C
	.db $F1, $EB
	.db $F2
	.db $F0, $2A
	.db $F2
	.db $24, $83
	.db $25, $81
	.db $4B, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $00, $30
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $00, $30
ENDIF
	.db $F0, $8B
	.db $F1, $8C
	.db $F1, $CA
	.db $FF
