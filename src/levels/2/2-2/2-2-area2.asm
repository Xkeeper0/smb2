; Level 2-2, Area 2

LevelData_2_2_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 1, 1, LevelMusic_Underground, 0, 0, $0a, $3

	.db $8B, $28
	.db $0D, $26
	.db $0E, $2D
	.db $0F, $22
	.db $1A, $36
	.db $19, $21
	.db $0A, $36
	.db $19, $38
	.db $18, $3A
	.db $F0, $B7
	.db $F0, $F0
	.db $5D, $02
	.db $1D, $02
	.db $1D, $02
	.db $1D, $02
	.db $3C, $02
	.db $1C, $02
	.db $11, $22
	.db $F0, $97
	.db $F0, $D0
	.db $F1, $4F
	.db $F1, $AE
	.db $F5, $04, $15
	.db $90, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $04, $15
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $04, $15
ENDIF
	.db $24, $29
	.db $33, $25
	.db $04, $25
	.db $05, $25
	.db $37, $27, $F0, $6F
	.db $F0, $D4
	.db $F1, $4A
	.db $FF
