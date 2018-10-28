; Level 2-3, Area 1

LevelData_2_3_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $0c, $0

	.db $00, $89
	.db $01, $89
	.db $02, $89
	.db $03, $89
	.db $25, $29
	.db $1C, $29
	.db $18, $2B
	.db $16, $C4
	.db $2B, $21
	.db $1A, $C2
	.db $95, $11
	.db $08, $10
	.db $66, $A6
	.db $F5, $05, $00
	.db $12, $32
	.db $09, $32
	.db $0D, $26
	.db $0E, $21
	.db $0F, $21
	.db $14, $31
	.db $06, $05
	.db $07, $32
	.db $14, $31
	.db $07, $32
	.db $14, $31
	.db $07, $32
	.db $14, $31
	.db $07, $32
	.db $14, $31
	.db $06, $05
	.db $07, $32
	.db $53, $29
	.db $31, $0F
	.db $0F, $29
	.db $23, $21
	.db $05, $21
	.db $71, $C2
	.db $1E, $29
	.db $02, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $05, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $05, $20
ENDIF
	.db $16, $22
	.db $09, $22
	.db $11, $C2
	.db $05, $C3
	.db $09, $C2
	.db $0E, $C3
	.db $DD, $11
	.db $5D, $0F
	.db $C3, $29
	.db $39, $0F
	.db $13, $0F
	.db $0E, $0F
	.db $F1, $4C
	.db $F6, $01
	.db $F1, $CC
	.db $F6, $00
	.db $90, $10
	.db $0E, $10
	.db $12, $11
	.db $52, $0F
	.db $06, $0F
	.db $0A, $0F
	.db $1E, $D1
	.db $F0, $6C
	.db $F6, $01
	.db $F0, $CC
	.db $F6, $00
	.db $86, $11
	.db $31, $29
	.db $08, $29
	.db $43, $D2
	.db $0A, $D1
	.db $F0, $0C
	.db $F6, $02
	.db $F0, $6C
	.db $F6, $00
	.db $F0, $CC
	.db $F6, $02
	.db $F1, $4C
	.db $F6, $00
	.db $84, $10
	.db $52, $0F
	.db $0E, $0F
	.db $C8, $17
	.db $47, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $05, $30
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $05, $30
ENDIF
	.db $F4
	.db $26, $16
	.db $09, $16
	.db $FF
