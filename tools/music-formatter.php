<?php

	$in	= <<<'E'
	.db $E4
	.db $6E
	.db $E8
	.db $6A
	.db $E4
	.db $64
	.db $E8
	.db $5E
	.db $E4
	.db $56
	.db $E8
	.db $52
	.db $E4
	.db $4C
	.db $E8
	.db $46
	.db $E4
	.db $3E
	.db $E8
	.db $3C
	.db $E4
	.db $3A
	.db $34
	.db $2E
	.db $E8
	.db $26
	.db $7E
	.db $3E
	.db $E8
	.db $56
	.db $7E
	.db $E9
	.db $3E
	.db $00
E;

	$inA	= explode("\n", $in);
	foreach ($inA as $line) {
		$line	= str_replace('.db $', '', trim($line));
		$val	= hexdec($line);

		printf("%02X = ", $val);
		if ($val == 0x00) {
			// Ramp or end of segment
			print "End (Sq2) / Ramp (Sq1) / Mute (Tri) / Repeat (Noise/DPCM)";

		} elseif ($val <= 0x7D) {
			// Note On
			if ($val & 0x01) {
				die("Unexpected note value ". sprintf("%02X", $val) ."\n");
			}
			$midi	= (($val >> 1) + 36);
			printf("Note: %d (%s)", $midi, midiToName($midi));

		} elseif ($val == 0x7E) {
			// Rest
			print "Rest";

		} elseif ($val <= 0xFE) {
			// Instrument/Note Length change
			$ins	= ($val & 0xF0) >> 4;
			$len	= ($val & 0x0F);
			printf("                  I: %X  L: %X", $ins, $len);

		} elseif ($val == 0xFF) {
			// Bend
			print "Bend start (Square only)";

		} else {
			// how the fuck
			die("not sure how we got here ". sprintf("%02X", $val) ."\n");

		}
		print "\n";
	}



	function midiToName($num) {
		$num	-= 12;
		$names	= ['C', 'Cs', 'D', 'Ds', 'E', 'F', 'Fs', 'G', 'Gs', 'A', 'As', 'B', ];
		$oct	= floor($num / 12);
		$note	= $num % 12;
		return sprintf("%s%d", $names[$note], $oct);
	}
