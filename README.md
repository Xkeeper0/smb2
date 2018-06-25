# Super Mario Bros. 2, Discombobulated
![Logo](tools/logo.png "Logo")\
A disassembly of Super Mario Bros. 2.

This is designed for use with [asm6f](https://github.com/freem/asm6f/).
For your convinience, a binary of that is included.

## Building

### Windows
Open a command prompt window and run:

    build

This will optionally also compare the ROM built against the original, if you
place the original ROM in the `tools/` folder. The batch file will output
instructions to this effect.

You can start the batch file from Explorer, but the window will auto-close,
so you will have to check the output yourself.

### Linux, etc
You will need to build your own copy of `asm6f`.

    asm6f smb2.asm -n -L bin/smb2.nes > bin/assembler.log 2> bin/assembler-err.log

### Output
The build process will generate a few files:

* `bin/smb2.nes`, your ROM.
* `bin/smb2.lst`, the assembler listing. Use this to see how the code assembled.
* `bin/assembler.txt` and `bin/assembler-err.txt`, logs from the assembler
* `bin/smb2.*.nl`, name-listing files for FCEUX's debugger.
* Some other cruft, probably

By default, the build script will create a byte-for-byte copy of the game.

(If you want to make sure, check the SHA-256. It should be `47ba60fad332fdea5ae44b7979fe1ee78de1d316ee027fea2ad5fe3c0d86f25a`!)

You can edit `config.asm` to change some build options; see that file for details.

## Assembly
The "source" lives in the `src` directory:

* `prg-x-x.asm` are the program banks. They are grouped in pairs, as that is how SMB2 loads them. If you want to change this, you will need to split them apart again.
* `defs.asm` are some definitions.
* `ram.asm` are definitions and labels for RAM addresses.

The `tools/Super Mario Bros. 2 (USA) 2.asm` file is an auto-generated disassembly
from a certain disassembly tool. If you modify it (for some reason),
you can use `php tools/asm.php` to re-split the disassembly and clean it up.
Note that doing so will *lose all changes* you might have made in the split disassembly!

If you want to build the *Rev A* version of the game that fixes a soft-lock bug
involving the Fryguy boss, you should check out the `rev-a` branch. This will eventually
be incorporated into the main branch, but for now it is separate.

## Contributing
Right now, most of the work is being done in a different tool. Unfortunately, that
tool is not very usable in a collaborative way. However, you can open issues or
pull requests that describe data or suggest fixes, and I will implement them.

At some point in the future, once most of the memory addresses and routines are
mostly named, we will start using the split disassembly exclusively and from there
typical pull requests will be preferred.

## See Also
* [Data Crystal's SMB2 page](http://datacrystal.romhacking.net/wiki/Super_Mario_Bros._2)
* [CaptainSouthbird's SMB3 disassembly](https://github.com/Drakim/smb3) and [Drakim's asm6f version](https://github.com/Drakim/smb3)
* [Our Discord server](https://discord.gg/TsWMMeV)
