# Super Mario Bros. 2, The Disassembly
A disassembly of Super Mario Bros. 2, in progress.

This is built for use with ASM6 (https://github.com/freem/asm6f/).
For your convinience, a binary of that is included.

To build, run

    build

This will generate a few files:

* `smb2.nes`, your ROM
* `comparison.txt`, a byte comparison against the original ROM
* `smb2.lst`, the assembler listing
* `assembler.txt` and `assembler-err.txt`, logs from the assembler
* a bunch of assorted other files

The "source" lives in the `split` directory:

* `prg-x.asm` are the program banks.
* `defs.asm` are some definitions.
* `ram.asm` are definitions and labels for RAM addresses.

The `Super Mario Bros. 2 (USA) 2.asm` file is an auto-generated disassembly
from a certain disassembly tool. If you modify it (for some reason),
you can use `php asm.php` to re-split the disassembly and clean it up.
Note that doing so will *lose all changes* in the split disassembly!
