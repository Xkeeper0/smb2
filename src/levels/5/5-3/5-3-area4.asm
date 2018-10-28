; Level 5-3, Area 4

LevelData_5_3_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Horizontal, 0, 1, LevelMusic_Boss, 0, 0, $08, $2

	.db $02, $1F
	.db $67, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $0E, $30
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0E, $30
ENDIF
	.db $1F, $21
	.db $16, $DF
	.db $7A, $1F
	.db $21, $10
	.db $15, $11
	.db $38, $D9
	.db $10, $21
	.db $01, $21
	.db $02, $21
	.db $AD, $10
	.db $63, $D6
	.db $E3, $11
	.db $50, $10
	.db $0D, $11
	.db $3A, $1F
	.db $B4, $10
	.db $C7, $21
	.db $09, $21
	.db $0B, $21
	.db $14, $D9
	.db $98, $E2
	.db $49, $E2
	.db $13, $E3
	.db $0F, $E2
	.db $30, $E1
	.db $A4, $E3
	.db $1A, $D3
	.db $1C, $0F
	.db $38, $10
	.db $0E, $D2
	.db $1F, $0F
	.db $54, $10
	.db $28, $11
	.db $52, $DE
	.db $1A, $0F
	.db $5C, $89
	.db $0D, $89
	.db $0E, $89
	.db $0F, $89
	.db $8A, $81
	.db $0B, $81
	.db $F0, $8D
	.db $F1, $0C
	.db $F5, $0E, $50
	.db $FF
