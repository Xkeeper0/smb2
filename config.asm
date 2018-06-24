; To disable these, comment the defining line out.
; (Changing the assignment to 0 won't work.)

; Compatibility with the original.
; This forces use of absolute addressing instead of zero-page
; when Nintendo used it.
; Note that if you use this, you should probably use
; PRESERVE_FREE_SPACE, too.
COMPATIBILITY = 1

; Preserve unused space.
; Empty areas in the ROM will continue to be padded, even if you
; add code around them. (The padding should automatically shrink,
; if needed, hopefully)
; Turning this off will "squish" most banks and move free space
; within them to the end, making it easier to add your own code.
; ...but it might also cause problems if data gets relocated
; when it isn't properly pointed to.
PRESERVE_UNUSED_SPACE = 1

; Include debugging tools
; DEBUG = 1
