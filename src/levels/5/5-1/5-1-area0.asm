; Level 5-1, Area 0

LevelData_5_1_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 0, 1, LevelMusic_Overworld, 0, 0, $02, $0

	.db $00, $86
	.db $01, $86
	.db $02, $86
	.db $1B, $10
	.db $25, $16
	.db $1C, $C5
	.db $E8, $16
	.db $4A, $C8
	.db $3C, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $0C, $10
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0C, $10
ENDIF
	.db $2B, $82
	.db $0C, $82
	.db $0D, $82
	.db $0E, $82
	.db $0F, $82
	.db $F1, $48
	.db $41, $10
	.db $0E, $10
	.db $13, $11
	.db $53, $C8
	.db $50, $82
	.db $01, $82
	.db $04, $82
	.db $05, $82
	.db $06, $82
	.db $09, $82
	.db $0A, $82
	.db $0B, $82
	.db $0C, $82
	.db $0D, $82
	.db $F4
	.db $F2, $3C
	.db $16, $F2
	.db $37, $16
	.db $FF
