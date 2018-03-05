	.inesprg 8  ; 16x 16KB PRG code (32 banks of 8KB)
	.ineschr 16  ; 16x  8KB CHR data (128 banks of 1KB)
	.inesmap 4   ; mapper 4 = MMC3, 8KB PRG, 1/2KB CHR bank swapping
	.inesmir 0   ; background mirroring

	.include "split/defs.asm"

	.zp
	.org $0000
	.include "split/zp.asm"

	.data
	.org $0100
	.include "split/ram.asm"

	.code
	.bank 0
	.org $8000
	.include "split/prg-0.asm"

	.bank 1
	.org $A000
	.include "split/prg-1.asm"

	.bank 2
	.org $8000
	.include "split/prg-2.asm"

	.bank 3
	.org $A000
	.include "split/prg-3.asm"

	.bank 4
	.org $8000
	.include "split/prg-4.asm"

	.bank 5
	.org $A000
	.include "split/prg-5.asm"

	.bank 6
	.org $8000
	.include "split/prg-6.asm"

	.bank 7
	.org $A000
	.include "split/prg-7.asm"

	.bank 8
	.org $8000
	.include "split/prg-8.asm"

	.bank 9
	.org $A000
	.include "split/prg-9.asm"

	.bank 10
	.org $8000
	.include "split/prg-a.asm"

	.bank 11
	.org $A000
	.include "split/prg-b.asm"

	.bank 12
	.org $8000
	.include "split/prg-c.asm"

	.bank 13
	.org $A000
	.include "split/prg-d.asm"

	.bank 14
	.org $C000
	.include "split/prg-e.asm"

	.bank 15
	.org $E000
	.include "split/prg-f.asm"
