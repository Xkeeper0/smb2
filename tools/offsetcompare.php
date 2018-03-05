<?php

	// This file takes the assembly listing
	// and compares its output to the labels contained within
	// This is useful if you break something and the code gets offset
	// as the jumps in bank F aren't fully labeled yet
	chdir(__DIR__ ."/../");

	$x	= file_get_contents("smb2.lst");
	$m	= [];
	$c	= preg_match_all('/^[0-9a-f]{5}[ \t]+.*:\s?$/im', $x, $m);

	$last	= null;
	$lastv	= null;
	foreach ($m[0] as $l) {
		//print $l ."\n";
		$m2	= [];
		$cc	= preg_match('/^([0-9a-f]{5})\s+(.*?)(([0-9a-f]{4})?):$/i', trim($l), $m2);
		$ox = hexdec($m2[3]);
		$ix	= hexdec($m2[1]);
		$m2[2]	.= $m2[3];
		if ($ix <= 0x8000) continue;
		if ($ox !== 0 && $ox >= 0x8000) {
			$v2	= $ox - $ix;
		} else {
			$v2	= null;
		}

		$cur	= sprintf("%5s  %-20s   %05x  %05x  ". ($v2 === null ? "----" : "%4d") ."\n", $m2[1], $m2[2], $ix, $ox, $v2);
		if ($v2 !== null) {
			if ($v2 !== $lastv) {
				print $last;
				print $cur;
				print "\n";
				$lastv	= $v2;
			} else {
				$last	= $cur;
			}
		}

	}

	print "\n";
