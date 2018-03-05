<?php

	$asm	= file_get_contents("Super Mario Bros. 2 (USA) 2.asm");
	$asm	= str_replace("\r\n", "\n", $asm);

	// Remove some of the generic crap from the assembly
	$count	= 0;
	// Remove ; '?' useless ASCII crap
	$asm	= preg_replace('/\s*; \'.\'.*$/im', '', $asm, -1, $count);
	printf("Removed single-byte ascii comments: %d\n", $count);

	// Remove 'code/data used at ....' comments
	$asm	= preg_replace('/[ \t]*; (code|data) used at .000/im', '', $asm, -1, $count);
	printf("Removed code/data used at comments: %d\n", $count);

	// Remove cross references
	$asm	= preg_replace('/\s*; [^;] XREF: .*$/im', '', $asm, -1, $count);
	printf("Removed XREFs: %d\n", $count);

	// Remove more cross references
	$asm	= preg_replace('/\s*; [^;]*(|).*$/im', '', $asm, -1, $count);
	printf("Removed XREFs again: %d\n", $count);

	// Remove more ; ? useless ASCII crap
	$asm	= preg_replace('/(\.BYTE [^\s]*)\s; [^0-9]\s*$/im', '\1', $asm, -1, $count);
	printf("Removed single-byte ascii again: %d\n", $count);

	// Trim lines
	$asm	= preg_replace('/^[ \t]+$/im', '', $asm, -1, $count);
	printf("Trimmed whitespace: %d\n", $count);

	// Remove excessive extra lines
	$asm	= preg_replace("/(\n){3,}/i", "\n\n", $asm, -1, $count);
	printf("Removed excessive extra lines: %d\n", $count);

	// Change binary numbers
	$asm	= preg_replace("/(\s+)([01]+)b/im", '\1%\2', $asm, -1, $count);
	printf("Change binary definitions: %d\n", $count);

	// Fix HIGH8/LOW8 functions
	$asm	= preg_replace('/high8\(([^)]+)\)/im', '>\1', $asm, -1, $count);
	printf("Fix high8() functions: %d\n", $count);
	$asm	= preg_replace('/low8\(([^)]+)\)/im', '<\1', $asm, -1, $count);
	printf("Fix low8() functions: %d\n", $count);

	// Fix "* = $8000" directives
	$asm	= preg_replace('/^(\s+\*\s+=\s+\$.000\s*$)/im', '; \1', $asm, -1, $count);
	printf("Fix * = \$8000 directives: %d\n", $count);

	// Remove .END
	$asm	= preg_replace('/^\s*\.END\s*/im', '; End', $asm, -1, $count);
	printf("Fix .END: %d\n", $count);

	// Handle Magic NOPs
	$asm	= preg_replace('/\s*;\s+NOPfix\s*/im', "\nNOP ; @TODO fix abs-to-zp\n", $asm, -1, $count);
	printf("NOP hotfixes: %d\n", $count);

	// Fix dumb assembler not knowing how to use zero page properly
	//$asm	= preg_replace('/(STY\s+)([^,]+,\s*X\s*)/im', '\1<\2', $asm, -1, $count);
	//printf("Fix STY zp thing: %d\n", $count);

	// Output intermediary file for now
	file_put_contents("fart.asm", $asm);

	// Split disassembly into different segments
	$split	= explode("; Segment type:\tPure code", $asm);
	printf("Segment count: %d\n", count($split));

	$segments	= [];
	foreach($split as $n => $s) {
		if ($n === 0) {
			$segments['defs']	= $s;
		} elseif ($n === 1) {
			$segments['ram']	= $s;
		} else {
			$segments[sprintf("prg-%x", $n - 2)]	= $s;
		}
	}

	print "\n";

	// Remove 'uninited & unexplored' crap
	$segments['ram']	= preg_replace('/;\s+0\s+\.BYTE\s+uninited\s+&\s+unexplored/im', '.BYTE 0', $segments['ram'], -1, $count);
	printf("Removed 'uninited & unexplored': %d\n", $count);
	// Remove '(uninited)' crap
	$segments['ram']	= preg_replace('/;\s+\(uninited\)[ \t]*(;?)/im', '\1', $segments['ram'], -1, $count);
	printf("Removed 'uninited & unexplored': %d\n", $count);

	// Change RAM definitions from .BYTE 0,0 to .ds 2 for words
	$segments['ram']	= preg_replace('/\.BYTE\s+0,0/im', '.ds 2', $segments['ram'], -1, $count);
	printf("Updated RAM word definitions: %d\n", $count);

	// Change RAM definitions from .BYTE 0 to .ds 1
	$segments['ram']	= preg_replace('/\.BYTE\s+0/im', '.ds 1', $segments['ram'], -1, $count);
	printf("Updated RAM byte definitions: %d\n", $count);

	// Move definitions to their own line
	$segments['ram']	= preg_replace('/^([A-Za-z0-9_]+):(.+)$/im', "\\1:\n\t  \\2", $segments['ram'], -1, $count);
	printf("Newline definitions: %d\n", $count);
	/*
	/*
	*/

	$c	= 0;
	$test	= explode("\n", $segments['ram']);
	$prevlabel	= "";
	foreach ($test as $n => &$line) {
		$line2	= trim($line);
		$v		= explode(" ", $line2);
		if ($v[0] === ".ds") {
		if ($c < 0x800 /*|| $c >= 0x6000*/) {
				$linet	= sprintf("%-30s ; \$%04x", $line, $c);
				$line	= $linet;
			} else {
				if (preg_match('/^[A-Za-z0-9_]+:$/im', trim($test[$n - 1]))) {
					$test[$n - 1]	= substr(trim($test[$n - 1]), 0, -1) ." = ". sprintf('$%04x', $c);
					$line		= "";
				} else {
					$line	= sprintf('; $%04x', $c);
					$line		= "";
				}
				if (false && $c === 0x5fff) {
					$line	= '.org $6000';
				}
			}
			$c	= $c += intval($v[1]);
		}
	}
	$segments['ram']	= implode("\n", $test);
	// Remove excessive extra lines
	$segments['ram']	= preg_replace("/\n\n+/i", "\n\n", $segments['ram'], -1, $count);
	printf("Removed excessive extra lines again: %d\n", $count);

	// Switch to .dsb
	$segments['ram']	= preg_replace('/\.ds/im', '.dsb', $segments['ram'], -1, $count);
	printf("Switch from .ds to .dsb: %d\n", $count);


	// Remove colons from enums
	$segments['defs']	= preg_replace('/^([A-Za-z0-9_]+):\s+=(.+)$/im', "\\1 = \\2", $segments['defs'], -1, $count);
	printf("Fix enums: %d\n", $count);




	print "\n";
	// Write segments to files
	foreach ($segments as $seg => $data) {
		file_put_contents("split/$seg.asm", str_replace("\n", "\r\n", $data));
		print "Dumped split/$seg.asm\n";

	}
