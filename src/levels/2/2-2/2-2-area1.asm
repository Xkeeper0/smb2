; Level 2-2, Area 1

LevelData_2_2_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $0a, $3

	.db $2D, $10
	.db $1B, $11
	.db $56, $16
	.db $0D, $16
	.db $32, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $04, $01
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $04, $01
ENDIF
	.db $F0, $6D
	.db $F0, $8D
	.db $F6, $00
	.db $7C, $10
	.db $8F, $0F
	.db $11, $D1
	.db $0C, $0F
	.db $F0, $8D
	.db $F6, $01
	.db $5A, $10
	.db $26, $11
	.db $33, $29
	.db $10, $29
	.db $22, $0F
	.db $0F, $07
	.db $F0, $8D
	.db $F6, $00
	.db $74, $10
	.db $45, $29
	.db $09, $29
	.db $34, $26
	.db $08, $21
	.db $0C, $21
	.db $0D, $2B
	.db $F0, $0C
	.db $AC, $0F
	.db $17, $0F
	.db $19, $0F
	.db $13, $07
	.db $04, $97
	.db $30, $07
	.db $F0, $0D
	.db $F0, $A2
	.db $F6, $01
	.db $68, $10
	.db $41, $07
	.db $3F, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $04, $22
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $04, $22
ENDIF
	.db $F0, $A2
	.db $F6, $02
	.db $F1, $C2
	.db $F6, $03
	.db $F2
	.db $7E, $07
	.db $15, $07
	.db $0A, $07
	.db $F0, $0C
	.db $F5, $04, $22
	.db $F6, $00
	.db $83, $11
	.db $10, $10
	.db $4D, $0F
	.db $15, $07
	.db $09, $07
	.db $12, $07
	.db $86, $11
	.db $12, $10
	.db $4A, $37
	.db $19, $39
	.db $18, $3B
	.db $17, $3D
	.db $9D, $0C
	.db $F5, $04, $30
	.db $4A, $87
	.db $0B, $87
	.db $0C, $87
	.db $0D, $03
	.db $0E, $87
	.db $0F, $87
	.db $7D, $03
	.db $F1, $48
	.db $FF
