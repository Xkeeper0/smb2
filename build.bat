rem "If you modified Super Mario Bros 2 (USA).asm", run "php asm.php"
rem One way to do this is "php asm.php && build"
rem (if your setup isn't bad you can also just put it here...)

echo off
echo Assembling...
asm6.exe smb2.asm -L > assembler.log 2> assembler-err.log
echo Comparing between original ROM and the assembled ROM
fc /b smb2.nes "Super Mario Bros. 2 (USA).nes" > comparison.txt
echo Comparing against reference assembly
echo If you see differences here, you changed something
fc comparison.txt comparison-ref.txt

echo on
