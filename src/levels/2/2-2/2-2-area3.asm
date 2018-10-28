; Level 2-2, Area 3

LevelData_2_2_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Vertical, 1, 1, LevelMusic_Underground, 0, 1, $12, $1

	.db $02, $8A
	.db $03, $8A
	.db $04, $8A
	.db $05, $8A
	.db $06, $8A
	.db $07, $8A
	.db $08, $8A
	.db $09, $8A
	.db $62, $12
	.db $77, $80
	.db $07, $29
	.db $F5, $04, $19
	.db $AC, $80
	.db $0C, $29
	.db $54, $80
	.db $04, $29
	.db $F0, $51
	.db $F1, $6D
	.db $3B, $80
	.db $0B, $29
	.db $52, $82
	.db $03, $82
	.db $04, $82
	.db $05, $82
	.db $23, $29
	.db $F1, $6E
	.db $F2
	.db $9A, $83
	.db $0B, $83
	.db $0C, $83
	.db $0D, $83
	.db $0E, $83
	.db $2C, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $04, $50
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $04, $50
ENDIF
	.db $F1, $A0
	.db $FF
