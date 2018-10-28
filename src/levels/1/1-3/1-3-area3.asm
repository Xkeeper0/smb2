; Level 1-3, Area 3

LevelData_1_3_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 5, LevelDirection_Horizontal, 4, 0, LevelMusic_Underground, 1, 3, $0a, $3

	.db $39, $29
	.db $13, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $02, $26
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $02, $26
ENDIF
	.db $6B, $32
	.db $28, $77
	.db $F0, $4B
	.db $F1, $0D
	.db $7F, $30
	.db $16, $31
	.db $0A, $32
	.db $23, $31
	.db $0F, $30
	.db $20, $31
	.db $1F, $30
	.db $F0, $08
	.db $90, $66
	.db $07, $31
	.db $17, $31
	.db $09, $66
	.db $20, $66
	.db $07, $30
	.db $08, $01
	.db $17, $31
	.db $09, $66
	.db $20, $66
	.db $07, $31
	.db $17, $31
	.db $09, $66
	.db $80, $29
	.db $10, $30
	.db $0A, $29
	.db $20, $29
	.db $10, $30
	.db $09, $82
	.db $0A, $82
	.db $0B, $82
	.db $0E, $82
	.db $0F, $82
	.db $20, $29
	.db $10, $30
	.db $F0, $4D
	.db $F0, $A8
	.db $F0, $CC
	.db $F1, $08
	.db $93, $29
	.db $32, $81
	.db $03, $81
	.db $06, $81
	.db $F0, $B0
	.db $F1, $0F
	.db $F0, $31
	.db $F2
	.db $99, $42
	.db $F1, $0F
	.db $F1, $CA
	.db $F5, $02, $40
	.db $FF
