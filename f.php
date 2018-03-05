<?php

	$x	= file_get_contents("smb2.lst");
	$m	= [];
	$c	= preg_match_all('/^[0-9a-f]{5}[ \t]+.*:\s?$/im', $x, $m);

	foreach ($m[0] as $l) {
		//print $l ."\n";
		$m2	= [];
		$cc	= preg_match('/^([0-9a-f]{5})\s+(.*?)(([0-9a-f]{4})?):$/i', trim($l), $m2);
		$ox = hexdec($m2[3]);
		$ix	= hexdec($m2[1]);
		$m2[2]	.= $m2[3];
		if ($ox !== 0) {
			$v2	= $ox - $ix;
		} else {
			$v2	= null;
		}
		printf("%5s  %-50s   %05x  %05x  ". ($v2 === null ? "----" : "%4d") ."\n", $m2[1], $m2[2], $ix, $ox, $v2);
	}

	print "\n";
