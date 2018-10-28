; Level 1-1, Area 3

LevelData_1_1_Area3:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 2, 1, LevelMusic_Underground, 0, 2, $0a, $2

	.db $47, $A8
	.db $19, $25
	.db $0B, $25
	.db $16, $83
	.db $24, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $00, $54
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $00, $54
ENDIF
	.db $13, $25
	.db $F0, $71
	.db $F0, $FC
	.db $F0, $0E
	.db $F1, $8F
	.db $F1, $B1
	.db $F1, $F4
	.db $64, $F3
	.db $98, $0C
	.db $F5, $00, $40
	.db $48, $03
	.db $18, $03
	.db $C7, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $00, $28
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $00, $28
ENDIF
	.db $F0, $B2
	.db $F1, $4A
	.db $FF
