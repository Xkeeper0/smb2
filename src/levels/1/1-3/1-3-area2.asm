; Level 1-3, Area 2

LevelData_1_3_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 6, LevelDirection_Vertical, 4, 0, LevelMusic_Underground, 1, 3, $00, $3

	.db $58, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $02, $10
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $02, $10
ENDIF
	.db $23, $39
	.db $32, $32
	.db $0B, $32
	.db $35, $33
	.db $0A, $30
	.db $1A, $AF
	.db $F0, $54
	.db $34, $31
	.db $0C, $30
	.db $1C, $AC
	.db $12, $31
	.db $34, $31
	.db $32, $31
	.db $34, $31
	.db $F0, $5C
	.db $32, $31
	.db $0C, $30
	.db $34, $37
	.db $62, $37
	.db $18, $A9
	.db $0D, $00
	.db $0E, $00
	.db $1D, $00
	.db $0E, $00
	.db $14, $31
	.db $09, $35
	.db $F0, $14
	.db $6A, $33
	.db $3C, $31
	.db $13, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $02, $08
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $02, $08
ENDIF
	.db $2C, $31
	.db $27, $32
	.db $F1, $5B
	.db $F1, $74
	.db $44, $35
	.db $36, $35
	.db $34, $35
	.db $19, $A6
	.db $27, $31
	.db $0A, $31
	.db $17, $AF
	.db $08, $AD
	.db $F0, $16
	.db $49, $AE
	.db $65, $A9
	.db $0B, $AB
	.db $51, $33
	.db $0C, $32
	.db $12, $AC
	.db $0D, $A8
	.db $F0, $17
	.db $F0, $D4
	.db $63, $31
	.db $14, $A7
	.db $2C, $09
IFNDEF DISABLE_DOOR_POINTERS
	.db $02, $30
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $02, $30
ENDIF
	.db $26, $31
	.db $51, $73
	.db $06, $73
	.db $F1, $18
	.db $F1, $C0
	.db $FF
