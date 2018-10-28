; Level 5-3, Area 2

LevelData_5_3_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 4, LevelDirection_Horizontal, 2, 1, LevelMusic_Underground, 0, 2, $0a, $2

	.db $04, $1F
	.db $7E, $D7
	.db $18, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $0E, $33
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0E, $33
ENDIF
	.db $F0, $4C
	.db $7C, $1F
	.db $6A, $21
	.db $18, $DB
	.db $F0, $88
	.db $F1, $2C
	.db $F2
	.db $7D, $32
	.db $12, $D2
	.db $13, $D2
	.db $09, $21
	.db $3E, $24
	.db $F1, $68
	.db $F1, $8D
	.db $C2, $83
	.db $35, $25
	.db $08, $21
	.db $0A, $21
	.db $0C, $21
	.db $0E, $21
	.db $F0, $15
	.db $37, $A5
	.db $F5, $0E, $18
	.db $4A, $00
	.db $1A, $04
	.db $12, $80
	.db $03, $80
	.db $60, $26
	.db $F0, $5A
	.db $F0, $95
	.db $F0, $EE
	.db $F1, $CA
	.db $FF
