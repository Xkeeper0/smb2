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
