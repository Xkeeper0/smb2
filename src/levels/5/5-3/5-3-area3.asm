; Level 5-3, Area 3

LevelData_5_3_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 6, LevelDirection_Vertical, 3, 0, LevelMusic_Underground, 0, 1, $00, $2

	.db $68, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $0E, $40
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0E, $40
ENDIF
	.db $28, $33
	.db $12, $31
	.db $24, $31
	.db $26, $31
	.db $F0, $8A
	.db $F0, $B3
	.db $F1, $2A
	.db $F1, $D3
	.db $29, $31
	.db $2C, $31
	.db $12, $31
	.db $25, $31
	.db $27, $32
	.db $22, $32
	.db $0C, $31
	.db $35, $31
	.db $28, $32
	.db $F0, $4A
	.db $F0, $D3
	.db $F1, $2A
	.db $F1, $B3
	.db $2C, $31
	.db $12, $32
	.db $25, $32
	.db $38, $32
	.db $3B, $32
	.db $14, $34
	.db $F0, $2A
	.db $F0, $F3
	.db $F1, $4A
	.db $4C, $00
	.db $0D, $00
	.db $1A, $33
	.db $33, $31
	.db $26, $81
	.db $07, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $0E, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0E, $20
ENDIF
	.db $23, $32
	.db $23, $32
	.db $33, $32
	.db $0A, $33
	.db $0D, $00
	.db $16, $85
	.db $07, $85
	.db $F0, $99
	.db $F0, $CA
	.db $F1, $0B
	.db $F1, $D5
	.db $23, $32
	.db $1B, $32
	.db $23, $31
	.db $28, $04
	.db $14, $38
	.db $0D, $00
	.db $33, $31
	.db $1A, $00
	.db $0B, $32
	.db $23, $31
	.db $F1, $0B
	.db $33, $31
	.db $06, $86
	.db $07, $86
	.db $08, $34
	.db $0D, $00
	.db $33, $31
	.db $1B, $32
	.db $23, $31
	.db $28, $04
	.db $14, $39
	.db $0B, $00
	.db $32, $00
	.db $12, $00
	.db $F0, $2A
	.db $12, $00
	.db $16, $33
	.db $F0, $36
	.db $F0, $80
	.db $FF
