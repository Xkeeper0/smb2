; Level 3-3, Area 5

LevelData_3_3_Area5:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Vertical, 4, 0, LevelMusic_Underground, 1, 3, $00, $3

	.db $A0, $37
	.db $1B, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $60
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $60
ENDIF
	.db $27, $38
	.db $F0, $9E
	.db $F0, $F3
	.db $F1, $5E
	.db $F1, $D3
	.db $26, $04
	.db $10, $37
	.db $37, $38
	.db $26, $04
	.db $10, $37
	.db $37, $38
	.db $26, $04
	.db $10, $37
	.db $F0, $3E
	.db $F0, $B3
	.db $F0, $FE
	.db $F1, $73
	.db $F1, $BE
	.db $37, $38
	.db $26, $04
	.db $10, $37
	.db $37, $38
	.db $26, $04
	.db $10, $37
	.db $37, $38
	.db $F0, $53
	.db $F0, $9E
	.db $F1, $13
	.db $F1, $5E
	.db $F1, $D3
	.db $26, $04
	.db $10, $37
	.db $37, $38
	.db $26, $04
	.db $10, $37
	.db $43, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $22
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $22
ENDIF
	.db $F0, $3E
	.db $F0, $B3
	.db $F0, $FE
	.db $F1, $59
	.db $F1, $A0
	.db $FF
