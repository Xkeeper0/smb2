; -----------------------------------------
; -----------------------------------------
;   Super Mario Bros. 2 (USA) disassembly
;     https://github.com/xkeeper0/smb2/
; -----------------------------------------
; -----------------------------------------

.include "config.asm"

; -----------------------------------------
; Add NES header
      .db "NES", $1a ; identification of the iNES header
      .db 8 ; number of 16KB PRG-ROM pages
      .db 16 ; number of 8KB CHR-ROM pages

IFNDEF MMC5
      .db $40 ; mapper and mirroring
      .dsb 9, $00 ; clear the remaining bytes
ENDIF

IFDEF MMC5
      .db $52 ; mapper and mirroring
      .dsb 3, $00
      .db $70 ; RAM size
      .dsb 5, $00 ; clear the remaining bytes
ENDIF

; -----------------------------------------
; Add definitions
.enum $0000
.include "src/defs.asm"
.ende

; Add RAM definitions
.enum $0000
.include "src/ram.asm"
.ende

; -----------------------------------------
; Add each of the 16 banks.
; In SMB2, banks are swapped in pairs.
; The game was clearly designed originally to use the MMC1 mapper,
; and very minimal changes were made to make that work.
; These banks are still TECHNICALLY two different banks,
; but due to this little hack a lot of data runs between
; bank boundaries, and it's easier to keep together
; You should split these again if you plan on making any
; really huge modifications...

; ----------------------------------------
; Banks 0 and 1. Basically potpourri.
; Lots of crap everywhere.
; Title screen and some other stuff too.
.base $8000
.include "src/prg-0-1.asm"
.pad $c000, $ff

; ----------------------------------------
; Banks 2 and 3. Enemy/object code.
.base $8000
.include "src/prg-2-3.asm"
.pad $c000, $ff

; ----------------------------------------
; Banks 4 and 5. Music engine and song data.
.base $8000
.include "src/prg-4-5.asm"
.pad $c000, $ff

; ----------------------------------------
; Bank 6 and 7. Level handling ode, I think.
; Hmm, I wonder how this actually works when
; dealing with the fact the level data is
; in another bank...
; Bank 7 is completely empty.
.base $8000
.include "src/prg-6-7.asm"
.pad $c000, $ff

; ----------------------------------------
; Bank 8 and 9. Entirely level data.
; Some more unused space as usual.
.base $8000
.include "src/prg-8-9.asm"
.pad $c000, $ff

; ----------------------------------------
; Banks A and B. Mostly bonus chance,
; character stats, and some PPU commands.
; Lots of empty space here too
.base $8000
.include "src/prg-a-b.asm"
.pad $c000, $ff

; ----------------------------------------
; Banks C and D. The first half is
; a lot of data for the credits.
; The second half is totally empty.
.base $8000
.include "src/prg-c-d.asm"
.org $c000, $ff

; ----------------------------------------
; Banks E and F. Fixed at $C000-FFFF.
; Important things like NMI and often-used
; routines.
; Bank E also contains PCM data for the
; drums and samples.
.base $c000    ; Technically not needed but consistent
.include "src/prg-e-f.asm"


; -----------------------------------------
; include CHR-ROM
.incbin "smb2.chr"
