; Level 7-1, Area 3

LevelData_7_1_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Vertical, 0, 0, LevelMusic_Overworld, 0, 0, $13, $0

	.db $64, $A6
	.db $0A, $A6
	.db $22, $E1
	.db $04, $05
	.db $05, $E4
	.db $0A, $05
	.db $0B, $E1
	.db $37, $AA
	.db $21, $E5
	.db $07, $05
	.db $08, $E5
	.db $66, $AB
	.db $08, $AB
	.db $14, $AA
	.db $0A, $AA
	.db $21, $E2
	.db $0B, $E2
	.db $80, $EF
	.db $76, $00
	.db $07, $00
	.db $08, $00
	.db $09, $00
	.db $12, $A7
	.db $05, $00
	.db $0A, $00
	.db $15, $00
	.db $0A, $00
	.db $10, $E1
	.db $02, $05
	.db $03, $EC
	.db $85, $00
	.db $0A, $00
	.db $0C, $00
	.db $10, $EF
	.db $30, $EF
	.db $3A, $E3
	.db $13, $A3
	.db $F5, $12, $23
	.db $20, $E2
	.db $03, $05
	.db $04, $EB
	.db $F4
	.db $35, $C4
	.db $23, $0F
	.db $0B, $0F
	.db $17, $0A
	.db $F5, $12, $40
	.db $C2, $0F
	.db $0C, $0F
	.db $FF
