;
; Note Lengths
; ============
;
; These are lookup tables used to determine note lengths (in ticks).
;
; There are a few weird values floating around, but it's generally broken into
; groups of 13 note lengths that correspond to a tempo as follows:
;
; $x0: 1/16 note (rounding down)
; $x1: 1/16 note (rounding up)
; $x2: 1/4 note triplet (rounding down)
; $x3: 1/4 note triplet (rounding up)
; $x4: 1/8 note
; $x5: dotted 1/8 note
; $x6: 1/2 note triplet (rounding down)
; $x7: 1/2 note triplet (rounding up)
; $x8: 1/4 note
; $x9: dotted 1/4 note
; $xA: 1/2 note
; $xB: dotted 1/2 note
; $xC: whole note
; $xD: dotted whole note (usually not defined)
; $xE: double note (usually note defined)
; $xF: usually not defined
;
; 14400 is the number of ticks in a minute (4 ticks * 60 fps * 60 seconds), and
; you can work out the tempo by dividing 14400 by the length of a whole note.
;
NoteLengthTable:

; Character Select
; Star
; Crystal
; Game Over
; Boss Beaten
NoteLengthTable_300bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $03, $03, $04, $04, $06, $09, $08, $08, $0C, $12, $18, $24, $30

NoteLengthTable_257bpm: ; rounded
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $03, $04, $05, $04, $07, $0A, $09, $0A, $0E, $15, $1C, $2A, $38
	.db $0B ; junk?

; Title Screen
NoteLengthTable_225bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $04, $04, $05, $06, $08, $0C, $0B, $0A, $10, $18, $20, $30, $40

; Overworld
; Boss
; Wart
; Death
; Subspace
NoteLengthTable_200bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $04, $05, $06, $06, $09, $0D, $0C, $0C, $12, $1B, $24, $36, $48
	.db $0E, $03 ; junk?

NoteLengthTable_180bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $05, $05, $07, $06, $0A, $0F, $0D, $0E, $14, $1E, $28, $3C, $50

NoteLengthTable_164bpm: ; rounded, 163.64 bpm
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $05, $06, $07, $08, $0B, $10, $0F, $0E, $16, $21, $2C, $42, $58
	.db $11 ; junk?

; Bonus Chance
NoteLengthTable_150bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $06, $06, $08, $08, $0C, $12, $10, $10, $18, $24, $30, $48, $60
	.db $02 ; junk?

NoteLengthTable_138bpm: ; rounded, 138.46 bpm
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $06, $07, $09, $08, $0D, $13, $11, $12, $1A, $27, $34, $4E, $68
	.db $14 ; junk?

; Underground
; Ending
NoteLengthTable_129bpm: ; rounded, 128.57
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $07, $07, $09, $0A, $0E, $15, $13, $12, $1C, $2A, $38, $54, $70
	.db $03, $04 ; junk?

NoteLengthTable_120bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $07, $08, $0A, $0A, $0F, $16, $14, $14, $1E, $2D, $3C, $5A, $78
	.db $17 ; junk?

NoteLengthTable_112bpm: ; rounded, 112.5 bpm
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $08, $08, $0B, $0A, $10, $18, $15, $16, $20, $30, $40, $60, $80

NoteLengthTable_106bpm: ; rounded, 105.88 bpm
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $08, $09, $0B, $0C, $11, $19, $15, $16, $22, $33, $44, $60, $88
	.db $1A ; junk?

NoteLengthTable_100bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $09, $09, $0C, $0C, $12, $1B, $18, $18, $24, $36, $48, $6C, $90
