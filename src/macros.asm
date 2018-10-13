;
; Macros
; ======
;
;


; distTo
; Outputs distance (byte) to label
; e.g.:
; .BYTE (+ - $)  is  distTo +
;
MACRO distTo label
      .BYTE (label - $)
ENDM

MACRO enemy x, y, type
      .BYTE type, x << 4 | y
ENDM
