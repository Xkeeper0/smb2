@echo off

rem "If you modified Super Mario Bros 2 (USA).asm", run "php tools/asm.php"
rem One way to do this is "php tools\asm.php && build"
rem (if your setup isn't bad you can also just put it here...)

echo Assembling...
tools\asm6f.exe smb2.asm -n -c -d_COMPATIBILITY_ -L bin\smb2.nes > bin\assembler.log 2> bin\assembler-err.log
if %ERRORLEVEL% neq 0 goto buildfail
move /y smb2.lst bin > nul
move /y smb2.cdl bin > nul
echo Done.
echo.

SET ROM="tools\Super Mario Bros. 2 (USA).nes"
if exist %ROM% (
	fc /b bin\smb2.nes "tools\Super Mario Bros. 2 (USA).nes" > nul
	if ERRORLEVEL 1 goto builddifferent
	goto buildsame

) else (
	echo If you want to compare against the original ROM
	echo to check for possible build errors, please place
	echo   Super Mario Bros. 2 (USA^).nes
	echo into the tools directory.
)
goto end

:buildfail
echo The build seems to have failed somehow.
echo Check bin/assembler-err.log for details.
goto end

:buildsame
echo Your built ROM and the original are the same.
goto end

:builddifferent
echo Your built ROM and the original differ.
echo If this is intentional, don't worry about it.
goto end


:end
echo on
