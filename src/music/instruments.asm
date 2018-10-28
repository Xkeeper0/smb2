;
; Instrument Sound Data
; =====================
;
; Each "instrument" is a lookup table of duty/volume/envelope values that are
; read backwards from the end
;
; The normal version of an instrument is 64 bytes
; The shorter version of an instrument is 23 bytes
;
InstrumentSoundData:

; Long square
; 50% duty cycle (square) with slight decay
InstrumentDVE_80: ; $A18D
	.db $90, $95, $95, $95, $95, $95, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96
	.db $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96
	.db $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96
	.db $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $97, $97, $97, $97, $98, $98

; Long square
; 50% duty cycle (square) with slight decay
InstrumentDVE_80_Short: ; $A1CD
	.db $90, $92, $94, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96
	.db $96, $97, $97, $97, $97, $98, $98

; Short square
; 25% duty cycle with pronounced decay
InstrumentDVE_90_E0: ; $A1E4
	.db $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51
	.db $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51
	.db $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51
	.db $51, $51, $51, $51, $51, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5A, $5B

; Short square
; 25% duty cycle with pronounced decay
InstrumentDVE_90_E0_Short: ; $A224
	.db $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $52, $53, $54
	.db $55, $56, $57, $58, $59, $5A, $5B

; Electric Piano
; 12.5% duty cycle with pronounced decay
InstrumentDVE_A0: ; $A23B
	.db $10, $11, $11, $11, $12, $12, $12, $13, $13, $14, $14, $14, $14, $15, $15, $15
	.db $15, $16, $16, $16, $17, $17, $17, $17, $17, $17, $17, $18, $18, $18, $18, $18
	.db $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18
	.db $18, $18, $18, $18, $18, $18, $18, $18, $19, $19, $19, $1A, $1A, $1B, $1B, $1C

; Electric Piano
; 12.5% duty cycle with pronounced decay
InstrumentDVE_A0_Short: ; $A27B
	.db $10, $11, $12, $13, $14, $15, $16, $17, $17, $18, $18, $18, $18, $18, $18, $18
	.db $19, $19, $19, $1A, $1A, $1B, $1B, $1C

; Organ
; 25% duty cycle with slight decay
InstrumentDVE_B0: ; $A293
	.db $51, $52, $52, $52, $52, $53, $53, $53, $53, $53, $53, $53, $54, $54, $54, $54
	.db $54, $54, $54, $54, $54, $55, $55, $55, $55, $55, $55, $56, $56, $56, $56, $56
	.db $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56, $56
	.db $56, $56, $56, $56, $56, $56, $56, $55, $55, $56, $56, $56, $56, $56, $56, $56

; Organ
; 25% duty cycle with slight decay
InstrumentDVE_B0_Short: ; $A2D3
	.db $51, $52, $52, $52, $52, $53, $53, $53, $53, $53, $53, $53, $54, $54, $54, $54
	.db $54, $54, $54, $55, $55, $56, $56

; Strings
; 25% duty cycle with slow attack
InstrumentDVE_C0_Short: ; $A2EA
	.db $51, $52, $53, $54, $54, $55, $56, $56, $57, $58, $59, $5A, $5B, $5B, $5B, $5B
	.db $5B, $5A, $59, $58, $56, $55, $55

; Strings
; 25% duty cycle with slow attack
InstrumentDVE_C0: ; $A301
	.db $51, $52, $52, $51, $52, $52, $52, $53, $53, $53, $53, $53, $53, $54, $54, $54
	.db $54, $54, $54, $55, $55, $55, $55, $55, $56, $56, $56, $57, $57, $57, $57, $57
	.db $58, $58, $58, $58, $58, $58, $58, $58, $58, $58, $59, $59, $59, $59, $5A, $5A
	.db $5A, $5A, $5A, $5B, $5B, $5B, $5B, $5B, $5B, $5B, $5A, $59, $58, $56, $55, $55

; Pluck
; 50% to -25% to 12.5% to 12.5% duty cycle with pronounced decay
InstrumentDVE_D0: ; $A341
	.db $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50
	.db $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51
	.db $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51
	.db $51, $51, $51, $51, $51, $51, $52, $53, $54, $55, $56, $57, $58, $19, $DA, $9B

; Pluck
; 50% to -25% to 12.5% to 12.5% duty cycle with pronounced decay
InstrumentDVE_D0_Short: ; $A381
	.db $50, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $51, $52, $53, $54
	.db $55, $56, $57, $58, $19, $DA, $9B

IFNDEF PROTOTYPE_INSTRUMENTS
; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0_Short: ; $A398
	.db $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $51, $51, $51, $51
	.db $52, $52, $52, $53, $53, $54, $55

; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0: ; $A3AF
	.db $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50
	.db $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50
	.db $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50, $50
	.db $50, $50, $50, $50, $50, $51, $51, $51, $51, $52, $52, $52, $53, $53, $54, $55

ENDIF
IFDEF PROTOTYPE_INSTRUMENTS
; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0_Short:
	.db $54, $54, $55, $56, $56, $57, $58, $59, $5A, $5B, $5B, $5B, $5B, $5B, $5B, $5B
	.db $5B, $5B, $5B, $5D

; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0:
	.db $51, $51, $51, $51, $52, $52, $52, $53, $53, $53, $53, $53, $53, $54, $54, $54
	.db $54, $54, $54, $55, $55, $55, $55, $55, $56, $56, $56, $57, $57, $57, $57, $57
	.db $58, $58, $58, $58, $58, $58, $58, $58, $58, $58, $59, $59, $59, $59, $5A, $5A
	.db $5A, $5A, $5A, $5B, $5B, $5B, $5B, $5B, $5B, $5B, $5B, $5B, $5C, $5C, $5C, $5D

ENDIF
