; Level 4-3, Area 3

LevelData_4_3_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 6, LevelDirection_Vertical, 4, 0, LevelMusic_Underground, 0, 2, $00, $1

	.db $37, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $42
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $42
ENDIF
	.db $26, $33
	.db $44, $3A
	.db $31, $78
	.db $F0, $41
	.db $F1, $BA
	.db $F1, $C1
	.db $5A, $74
	.db $37, $29
	.db $99, $29
	.db $F0, $77
	.db $68, $29
	.db $D9, $29
	.db $88, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $50
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $50
ENDIF
	.db $12, $29
	.db $15, $35
	.db $F0, $D3
	.db $20, $35
	.db $0A, $35
	.db $45, $35
	.db $32, $3B
	.db $41, $3A
	.db $F0, $21
	.db $44, $3A
	.db $41, $3A
	.db $34, $3A
	.db $31, $3A
	.db $3C, $32
	.db $38, $33
	.db $34, $33
	.db $31, $32
	.db $16, $09
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $17
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $17
ENDIF
	.db $0B, $33
	.db $21, $38
	.db $F1, $7A
	.db $F1, $C0
	.db $FF
