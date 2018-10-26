;
; Macros
; ======
;
;


;
; Pad out unused space used in the original, if needed
;
MACRO unusedSpace padTo with
	IFDEF PRESERVE_UNUSED_SPACE
		.pad padTo, with
	ENDIF
ENDM

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

;
; LevelHeader macro
;
; The order of the parameters is slightly different than how it's encoded, but
; hopefully this order is a little more intuitive?
;
MACRO levelHeader pages, horizontal, bgPalette, spritePalette, music, objectTypeAXFX, objectType3X9X, groundSetting, groundType
	.db horizontal << 7 | bgPalette << 3 | spritePalette
	.db %11100000 | groundSetting
	.db pages << 4 | objectTypeAXFX << 2 | objectType3X9X
	IFNDEF LEVEL_ENGINE_UPGRADES
		.db groundType << 3 | music
	ENDIF
	IFDEF LEVEL_ENGINE_UPGRADES
		.db groundType << 4 | music
	ENDIF
ENDM

MACRO musicPart label
	.db (label - MusicPartPointers)
ENDM

MACRO noteLength label
	.db (label - NoteLengthTable)
ENDM

;
; MusicHeader macro, to replace this:
;	noteLength NoteLengthTable_300bpm
;	.dw MusicDataXXX
;	.db MusicDataXXX_Triangle - MusicDataXXX
;	.db MusicDataXXX_Square1 - MusicDataXXX
;	.db MusicDataXXX_Noise - MusicDataXXX
;	; no noise channel, using $00 from below
;
; Setting "noise" to -1 will suppress output of the final $00,
; in case the music header 'reuses' the note length from the next header
;
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
