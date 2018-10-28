; Level 4-3, Area 1

LevelData_4_3_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 1, $01, $0

	.db $00, $8A
	.db $2A, $10
	.db $1D, $11
	.db $14, $2B
	.db $14, $0F
	.db $33, $0F
	.db $05, $0F
	.db $AA, $CB
	.db $27, $21
	.db $16, $C8
	.db $12, $26
	.db $04, $21
	.db $11, $C6
	.db $14, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $00
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $00
ENDIF
	.db $AC, $10
	.db $F1, $16
	.db $F6, $05
	.db $E0, $11
	.db $25, $10
	.db $D4, $10
	.db $0C, $10
	.db $18, $11
	.db $F2
	.db $57, $51
	.db $0A, $50
	.db $16, $F4
	.db $14, $51
	.db $14, $F1
	.db $13, $50
	.db $12, $F1
	.db $0E, $64
	.db $53, $18
	.db $09, $18
	.db $8B, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $26
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $26
ENDIF
	.db $23, $69
	.db $F0, $68
	.db $F1, $F6
	.db $54, $18
	.db $0A, $18
	.db $89, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $36
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $36
ENDIF
	.db $28, $6C
	.db $F0, $88
	.db $55, $18
	.db $0B, $18
	.db $89, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $60
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $60
ENDIF
	.db $25, $6B
	.db $F0, $16
	.db $F0, $A8
	.db $51, $18
	.db $A1, $62
	.db $F0, $D6
	.db $FF
