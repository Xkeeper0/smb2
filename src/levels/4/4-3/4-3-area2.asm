; Level 4-3, Area 2

LevelData_4_3_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 6, LevelDirection_Vertical, 4, 0, LevelMusic_Underground, 0, 0, $00, $1

	.db $44, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $41
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $41
ENDIF
	.db $21, $34
	.db $0A, $34
	.db $27, $31
	.db $31, $35
	.db $08, $36
	.db $21, $33
	.db $06, $32
	.db $0A, $34
	.db $F0, $54
	.db $24, $3A
	.db $31, $3A
	.db $25, $35
	.db $2B, $33
	.db $37, $33
	.db $34, $34
	.db $31, $34
	.db $08, $36
	.db $2A, $34
	.db $11, $32
	.db $1C, $32
	.db $12, $33
	.db $23, $34
	.db $31, $39
	.db $2C, $32
	.db $39, $32
	.db $34, $32
	.db $31, $33
	.db $0B, $33
	.db $37, $31
	.db $0D, $31
	.db $21, $78
	.db $1D, $31
	.db $F1, $BA
	.db $F1, $D4
	.db $36, $35
	.db $31, $3A
	.db $34, $3A
	.db $31, $33
	.db $33, $33
	.db $1D, $31
	.db $25, $33
	.db $0C, $32
	.db $38, $33
	.db $35, $33
	.db $33, $32
	.db $0D, $31
	.db $21, $36
	.db $2A, $32
	.db $35, $32
	.db $0C, $31
	.db $23, $32
	.db $21, $31
	.db $09, $33
	.db $14, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0B, $16
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0B, $16
ENDIF
	.db $66, $78
	.db $F1, $3B
	.db $F1, $C0
	.db $FF
