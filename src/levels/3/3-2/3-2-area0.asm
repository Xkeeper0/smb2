; Level 3-2, Area 0

LevelData_3_2_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 2, 0, $0a, $2

	.db $2F, $16
	.db $9C, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $07, $23
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $07, $23
ENDIF
	.db $F0, $82
	.db $F6, $00
	.db $F1, $04
	.db $66, $16
	.db $0D, $16
	.db $2A, $0F
	.db $17, $0F
	.db $53, $A4
	.db $33, $05
	.db $F5, $07, $11
	.db $F0, $62
	.db $44, $16
	.db $1C, $CD
	.db $11, $0F
	.db $16, $0F
	.db $09, $C4
	.db $52, $A4
	.db $32, $05
	.db $F5, $07, $12
	.db $F0, $64
	.db $7C, $0F
	.db $1E, $51
	.db $42, $A4
	.db $32, $05
	.db $F5, $07, $13
	.db $F0, $42
	.db $46, $16
	.db $0B, $16
	.db $31, $0F
	.db $52, $A4
	.db $32, $05
	.db $F5, $07, $14
	.db $F0, $64
	.db $40, $16
	.db $05, $16
	.db $92, $A3
	.db $22, $05
	.db $F5, $07, $15
	.db $F0, $C6
	.db $F2
	.db $2A, $16
	.db $1D, $16
	.db $44, $01
	.db $05, $01
	.db $F0, $04
	.db $F0, $85
	.db $F0, $C4
	.db $F1, $03
	.db $F1, $44
	.db $A3, $16
	.db $0C, $16
	.db $26, $0F
	.db $11, $0F
	.db $0A, $0F
	.db $F1, $83
	.db $F1, $C4
	.db $F2
	.db $25, $16
	.db $17, $16
	.db $3E, $25
	.db $52, $A3
	.db $22, $05
	.db $F5, $07, $17
	.db $57, $26
	.db $09, $22
	.db $0B, $22
	.db $0C, $2B
	.db $16, $C6
	.db $20, $25
	.db $12, $02
	.db $03, $02
	.db $F0, $45
	.db $F0, $82
	.db $F1, $AA
	.db $F6, $02
	.db $FF
