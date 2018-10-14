;
; Macros
; ======
;
;


; distTo
; Outputs distance (byte) to label
; e.g.:
; .db (+ - $)  is  distTo +
;
MACRO distTo label
	.db (label - $)
ENDM

MACRO enemy x, y, type
	.db type, x << 4 | y
ENDM

MACRO musicPart label
	.db (label - MusicPartPointers)
ENDM

MACRO noteLength label
	.db (label - NoteLengthTable)
ENDM

MACRO musicHeader noteLengthLabel, square2, triangle, square1, noise
	noteLength noteLengthLabel
	.dw square2
	IF triangle = 0
		.db $00
	ELSE
		.db (triangle - square2)
	ENDIF
	IF square1 = 0
		.db $00
	ELSE
		.db (square1 - square2)
	ENDIF
	IF noise = 0
		.db $00
	ELSEIF noise > 0
		.db (noise - square2)
	ENDIF
ENDM
