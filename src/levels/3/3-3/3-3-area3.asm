; Level 3-3, Area 3

LevelData_3_3_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Vertical, 4, 0, LevelMusic_Underground, 0, 3, $00, $3

	.db $15, $AB
	.db $18, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $70
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $70
ENDIF
	.db $26, $80
	.db $07, $80
	.db $08, $80
	.db $09, $80
	.db $0A, $80
	.db $F0, $35
	.db $C4, $31
	.db $36, $33
	.db $3A, $32
	.db $34, $29
	.db $16, $33
	.db $33, $32
	.db $36, $33
	.db $3A, $33
	.db $36, $33
	.db $42, $34
	.db $12, $30
	.db $03, $29
	.db $05, $29
	.db $06, $30
	.db $0D, $29
	.db $12, $30
	.db $F0, $14
	.db $12, $30
	.db $04, $28
	.db $09, $32
	.db $12, $34
	.db $1A, $29
	.db $16, $29
	.db $0C, $84
	.db $0D, $84
	.db $28, $83
	.db $09, $83
	.db $24, $81
	.db $05, $81
	.db $42, $38
	.db $0D, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $40
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $40
ENDIF
	.db $0E, $A8
	.db $2E, $05
	.db $F1, $B7
	.db $87, $2C
	.db $69, $AF
	.db $F0, $54
	.db $F1, $D6
	.db $76, $AE
	.db $99, $A5
	.db $F0, $57
	.db $83, $00
	.db $0C, $00
	.db $17, $31
	.db $16, $33
	.db $15, $35
	.db $16, $33
	.db $1D, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $43
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $43
ENDIF
	.db $3D, $AC
	.db $F0, $56
	.db $F0, $94
	.db $F1, $B6
	.db $F1, $D5
	.db $16, $33
	.db $45, $35
	.db $15, $30
	.db $0A, $30
	.db $15, $30
	.db $0A, $30
	.db $15, $35
	.db $46, $33
	.db $38, $82
	.db $11, $A9
	.db $07, $80
	.db $09, $80
	.db $3B, $84
	.db $29, $80
	.db $0A, $80
	.db $0C, $80
	.db $0D, $80
	.db $37, $84
	.db $25, $80
	.db $06, $80
	.db $08, $80
	.db $09, $80
	.db $32, $31
	.db $F0, $14
	.db $3C, $82
	.db $1B, $80
	.db $0D, $80
	.db $3D, $31
	.db $3C, $82
	.db $1B, $80
	.db $0D, $80
	.db $23, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $20
ENDIF
	.db $F0, $1A
	.db $F1, $74
	.db $F1, $A0
	.db $FF
