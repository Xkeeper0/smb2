; Level 2-1, Area 2

LevelData_2_1_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 2, 1, LevelMusic_Boss, 0, 0, $0a, $3

	.db $97, $80
	.db $23, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $03, $13
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $03, $13
ENDIF
	.db $F0, $4D
	.db $F0, $CC
	.db $F1, $02
	.db $F2
	.db $F0, $48
	.db $F0, $8C
	.db $F2
	.db $84, $86
	.db $05, $86
	.db $F0, $48
	.db $F1, $0B
	.db $F1, $CA
	.db $F5, $04, $00
	.db $FF
