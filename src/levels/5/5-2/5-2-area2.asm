; Level 5-2, Area 2

LevelData_5_2_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Vertical, 0, 1, LevelMusic_Overworld, 0, 0, $13, $5

	.db $0F, $85
	.db $48, $0C
	.db $4E, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $0D, $30
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0D, $30
ENDIF
	.db $29, $E2
	.db $0C, $84
	.db $0D, $84
	.db $32, $10
	.db $F0, $DE
	.db $24, $11
	.db $2F, $85
	.db $1A, $10
	.db $52, $E1
	.db $F0, $53
	.db $F1, $1E
	.db $78, $0D
	.db $1D, $8C
	.db $23, $10
	.db $24, $11
	.db $39, $10
	.db $0C, $83
	.db $12, $E1
	.db $55, $E1
	.db $52, $10
	.db $6A, $10
	.db $25, $11
	.db $10, $E7
	.db $08, $03
	.db $09, $E4
	.db $F5, $0D, $19
	.db $F4
	.db $46, $0C
	.db $F3
	.db $06, $0D
	.db $FF
