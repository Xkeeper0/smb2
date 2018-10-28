; Level 1-1, Area 2

LevelData_1_1_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 2, $00, $0

	.db $79, $16
	.db $10, $C2
	.db $07, $16
	.db $31, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $00, $03
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $00, $03
ENDIF
	.db $15, $21
	.db $08, $22
	.db $0F, $22
	.db $8A, $2B
	.db $0B, $52
	.db $0E, $26
	.db $10, $10
	.db $0A, $C5
	.db $63, $21
	.db $60, $0C
	.db $44, $29
	.db $3E, $0F
	.db $14, $0F
	.db $09, $01
	.db $19, $0F
	.db $78, $51
	.db $17, $DC
	.db $15, $C2
	.db $14, $22
	.db $10, $29
	.db $03, $C2
	.db $18, $FA
	.db $15, $C3
	.db $21, $22
	.db $F0, $C8
	.db $5A, $10
	.db $1E, $10
	.db $33, $C2
	.db $16, $F9
	.db $B8, $27
	.db $0A, $01
	.db $17, $C3
	.db $11, $22
	.db $0F, $29
	.db $10, $C2
	.db $17, $C5
	.db $33, $22
	.db $07, $C6
	.db $11, $C3
	.db $1F, $25
	.db $F0, $E0
	.db $8D, $21
	.db $0F, $27
	.db $43, $C1
	.db $06, $29
	.db $0A, $29
	.db $31, $24
	.db $06, $21
	.db $0A, $51
	.db $51, $CF
	.db $06, $F3
	.db $30, $22
	.db $75, $D5
	.db $51, $CB
	.db $28, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $00, $32
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $00, $32
ENDIF
	.db $1E, $26
	.db $1A, $CD
	.db $9F, $C0
	.db $50, $21
	.db $01, $21
	.db $03, $2D
	.db $08, $54
	.db $0D, $12
	.db $F5, $00, $13
	.db $18, $C6
	.db $F4
	.db $F3
	.db $F3
	.db $DF, $C6
	.db $F3
	.db $6D, $C8
	.db $F2
	.db $6A, $CF
	.db $5E, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $00, $41
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $00, $41
ENDIF
	.db $F4
	.db $F3
	.db $F3
	.db $F3
	.db $2E, $16
	.db $FF
