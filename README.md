# Super Mario Bros. 2, The Disassembly
A disassembly of Super Mario Bros. 2, in progress.

This is built for use with ASM6 (https://github.com/freem/asm6f/).
For your convinience, a binary of that is included.

## Building
To build, run

    build

This will generate a few files:

* `smb2.nes`, your ROM
* `comparison.txt`, a byte comparison against the original ROM
* `smb2.lst`, the assembler listing
* `assembler.txt` and `assembler-err.txt`, logs from the assembler
* a bunch of assorted other files

## Assembly
The "source" lives in the `split` directory:

* `prg-x.asm` are the program banks.
* `defs.asm` are some definitions.
* `ram.asm` are definitions and labels for RAM addresses.

The `Super Mario Bros. 2 (USA) 2.asm` file is an auto-generated disassembly
from a certain disassembly tool. If you modify it (for some reason),
you can use `php asm.php` to re-split the disassembly and clean it up.
Note that doing so will *lose all changes* in the split disassembly!

## Whoops
If you goof up and something breaks, `offsetcompare.php` may help;
it uses labels like `unk_byte_ABCD` to check if the code has gotten
shifted or offset in some way (so you can go fix it).

This is what allowed me to temporarily work around...

## Known issues
In some cases, Nintendo originally used code like `LDA $0050`.
However, asm6 recognizes this is a zero-page address, and emits
`LDA $50`, which is a different, shorter instruction.
The disassembly here changes this to `LDA $50; NOP` to keep
code aligned. (Hopefully in the future this can be fixed)
