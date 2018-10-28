; Level 3-3, Area 4

LevelData_3_3_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 6, LevelDirection_Vertical, 4, 0, LevelMusic_Underground, 1, 3, $00, $3

	.db $AE, $30
	.db $12, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $33
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $33
ENDIF
	.db $0E, $AE
	.db $2A, $87
	.db $0B, $87
	.db $F0, $94
	.db $F1, $BA
	.db $2C, $31
	.db $1C, $A9
	.db $52, $AF
	.db $04, $A4
	.db $06, $A4
	.db $08, $A4
	.db $0A, $A4
	.db $F0, $D4
	.db $93, $3B
	.db $AA, $31
	.db $3A, $32
	.db $F1, $5A
	.db $3C, $32
	.db $68, $31
	.db $36, $33
	.db $12, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $36
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $36
ENDIF
	.db $F0, $1B
	.db $F0, $98
	.db $F1, $BB
	.db $A6, $31
	.db $48, $31
	.db $36, $33
	.db $F0, $F8
	.db $66, $31
	.db $36, $33
	.db $68, $31
	.db $F0, $3B
	.db $F1, $58
	.db $36, $33
	.db $66, $31
	.db $36, $33
	.db $1A, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $21
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $21
ENDIF
	.db $F0, $9B
	.db $F1, $A0
	.db $FF
