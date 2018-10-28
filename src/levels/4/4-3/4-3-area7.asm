; Level 4-3, Area 7

LevelData_4_3_Area7:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Vertical, 5, 2, LevelMusic_Boss, 3, 3, $15, $2

	.db $54, $32
	.db $09, $32
	.db $07, $00
	.db $08, $00
	.db $43, $31
	.db $0B, $31
	.db $32, $40
	.db $07, $00
	.db $08, $00
	.db $09, $00
	.db $0D, $40
	.db $F0, $35
	.db $F6, $04
	.db $F0, $53
	.db $F0, $D5
	.db $F6, $02
	.db $F0, $F5
	.db $F6, $04
	.db $F1, $13
	.db $F1, $95
	.db $F6, $05
	.db $F1, $A0
	.db $F6, $02
	.db $F1, $C0
	.db $F6, $04
	.db $FF
