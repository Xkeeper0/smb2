    .db "NES", $1a ;identification of the iNES header
    .db 8 ;number of 16KB PRG-ROM pages
    .db 16 ;number of 8KB CHR-ROM pages
    .db $40|0 ;mapper 4 and mirroring
    .dsb 9, $00 ;clear the remaining bytes

	.enum $0000
	.include "split/defs.asm"
	.ende

	.enum $0000
	.include "split/ram.asm"
	.ende

	.base $8000
	.include "split/prg-0.asm"

	;.pad $a000, $ff
	.base $A000
	.include "split/prg-1.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "split/prg-2.asm"

	;.pad $a000, $ff
	.base $A000
	.include "split/prg-3.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "split/prg-4.asm"

	;.pad $a000, $ff
	.base $A000
	.include "split/prg-5.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "split/prg-6.asm"

	;.pad $a000, $ff
	.base $A000
	.include "split/prg-7.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "split/prg-8.asm"

	;.pad $a000, $ff
	.base $A000
	.include "split/prg-9.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "split/prg-a.asm"

	;.pad $a000, $ff
	.base $A000
	.include "split/prg-b.asm"

	;.pad $bfff, $ff
	.base $8000
	.include "split/prg-c.asm"

	;.pad $a000, $ff
	.base $A000
	.include "split/prg-d.asm"

	;.pad $c000, $ff
	.base $C000
	.include "split/prg-e.asm"

	;.pad $c000, $ff
	.base $E000
	.include "split/prg-f.asm"
