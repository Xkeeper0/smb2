; To disable these, comment the defining line out.
; (Changing the assignment to 0 won't work.)

; Compatibility with the original.
; This forces use of absolute addressing instead of zero-page
; when Nintendo used it.
COMPATIBILITY = 1

; Preserve unused space.
; Empty areas in the ROM will continue to be padded, even if you
; add code around them. (The padding should automatically shrink,
; if needed, hopefully)
PRESERVE_UNUSED_SPACE = 1
