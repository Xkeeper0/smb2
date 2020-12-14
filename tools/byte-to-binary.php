<?php

	$in = <<<'E'
	.db $00,$00,$00,$24 ; $1F


E;

	$out = preg_replace_callback('/\$([0-9A-F]{2})/si', "reformat_byte", $in);

	print $out;
	print "\n";


	function reformat_byte($s) {
		return sprintf("%%%08b", hexdec($s[1]));
	}
