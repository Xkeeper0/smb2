; Level 1-2, Area 1

LevelData_1_2_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Horizontal, 1, 1, LevelMusic_Underground, 0, 2, $0a, $2

	.db $99, $29
	.db $16, $29
	.db $0C, $29
	.db $12, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $01, $04
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $01, $04
ENDIF
	.db $1A, $25
	.db $0C, $21
	.db $0E, $21
	.db $F0, $30
	.db $F1, $F7
	.db $7D, $A8
	.db $1C, $25
	.db $0E, $26
	.db $1D, $05
	.db $3A, $83
	.db $32, $25
	.db $03, $25
	.db $06, $25
	.db $07, $25
	.db $09, $80
	.db $0F, $21
	.db $F0, $30
	.db $F0, $97
	.db $F0, $D0
	.db $F1, $35
	.db $80, $25
	.db $02, $25
	.db $17, $82
	.db $1E, $29
	.db $24, $83
	.db $37, $2D
	.db $F0, $F0
	.db $F1, $1B
	.db $F1, $51
	.db $7C, $14
IFNDEF DISABLE_DOOR_POINTERS
	.db $01, $06
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $01, $06
ENDIF
	.db $F0, $0F
	.db $F1, $4E
	.db $F1, $CA
	.db $FF
