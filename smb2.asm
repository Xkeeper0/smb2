    ; -----------------------------------------
    ; -----------------------------------------
    ;   Super Mario Bros. 2 (USA) disassembly
    ;     https://github.com/xkeeper0/smb2/
    ; -----------------------------------------
    ; -----------------------------------------


    ; -----------------------------------------
    ; Add NES header
    .db "NES", $1a ;identification of the iNES header
    .db 8 ;number of 16KB PRG-ROM pages
    .db 16 ;number of 8KB CHR-ROM pages
    .db $40|0 ;mapper 4 and mirroring
    .dsb 9, $00 ;clear the remaining bytes

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
    ; Add each of the 16 banks ....

	.base $8000
	.include "src/prg-0.asm"

	;.pad $a000, $ff
	.base $A000
	.include "src/prg-1.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "src/prg-2.asm"

	;.pad $a000, $ff
	.base $A000
	.include "src/prg-3.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "src/prg-4.asm"

	;.pad $a000, $ff
	.base $A000
	.include "src/prg-5.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "src/prg-6.asm"

	;.pad $a000, $ff
	.base $A000
	.include "src/prg-7.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "src/prg-8.asm"

	;.pad $a000, $ff
	.base $A000
	.include "src/prg-9.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "src/prg-a.asm"

	;.pad $a000, $ff
	.base $A000
	.include "src/prg-b.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "src/prg-c.asm"

	;.pad $a000, $ff
	.base $A000
	.include "src/prg-d.asm"

	;.pad $c000, $ff
	.base $C000
	.include "src/prg-e.asm"

	;.pad $c000, $ff
	.base $E000
	.include "src/prg-f.asm"


    ; -----------------------------------------
    ; include CHR-ROM
    .incbin "smb2.chr"
