; Level 1-2, Area 2

LevelData_1_2_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 0, 0, LevelMusic_Boss, 0, 0, $00, $0

	.db $00, $8C
	.db $01, $8C
	.db $02, $8C
	.db $03, $8C
	.db $28, $10
	.db $1B, $11
	.db $53, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $01, $07
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $01, $07
ENDIF
	.db $1F, $16
	.db $14, $82
	.db $05, $82
	.db $0D, $16
	.db $79, $11
	.db $16, $10
	.db $36, $16
	.db $31, $16
	.db $04, $48
	.db $13, $82
	.db $04, $82
	.db $05, $82
	.db $06, $82
	.db $07, $82
	.db $08, $82
	.db $09, $82
	.db $0A, $82
	.db $0B, $82
	.db $0C, $82
	.db $F2
	.db $F0, $01
	.db $F6, $02
	.db $F0, $59
	.db $F0, $8A
	.db $F5, $02, $00
	.db $FF
