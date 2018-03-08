@echo off

rem "If you modified Super Mario Bros 2 (USA).asm", run "php asm.php"
rem One way to do this is "php tools\asm.php && build"
rem (if your setup isn't bad you can also just put it here...)

echo Assembling...
tools\asm6.exe smb2.asm -d_COMPATIBILITY_ -L smb2.nes > assembler.log 2> assembler-err.log
echo Done.
echo.
SET ROM="tools\Super Mario Bros. 2 (USA).nes"
if exist %ROM% (
	fc /b smb2.nes "tools\Super Mario Bros. 2 (USA).nes" > comparison.txt
	echo Comparing against reference assembly
	echo If you see differences here, you changed something.
	echo.
	fc comparison.txt tools\comparison-ref.txt
) else (
	echo If you want to compare against the original ROM
	echo to check for possible build errors, please place
	echo   Super Mario Bros. 2 (USA^).nes
	echo into the tools directory.
)

echo on
