MusicDataUnderground:
MusicDataUnderground_Square2:
	.db $A4
	.db $0A
	.db $18
	.db $22
	.db $84
	.db $40
	.db $7E
	.db $89
	.db $42
	.db $A4
	.db $0A
	.db $18
	.db $22
	.db $84
	.db $40
	.db $7E
	.db $89
	.db $3E
	.db $B8
	.db $7E
	.db $B9
	.db $48
	.db $44
	.db $B8
	.db $3A
	.db $B9
	.db $40
	.db $B8
	.db $44
	.db $B4
	.db $36
	.db $B8
	.db $3A
	.db $B9
	.db $30
	.db $B9
	.db $34
	.db $BB
	.db $36
	.db $B8
	.db $7E
	.db $00

MusicDataUnderground_Square1:
	.db $B4
	.db $0A
	.db $18
	.db $22
	.db $84
	.db $36
	.db $7E
	.db $89
	.db $38
	.db $B4
	.db $0A
	.db $18
	.db $22
	.db $84
	.db $36
	.db $7E
	.db $89
	.db $34
	.db $B8
	.db $7E
	.db $B9
	.db $3A
	.db $36
	.db $B8
	.db $30
	.db $B9
	.db $36
	.db $B8
	.db $3A
	.db $B4
	.db $2C
	.db $B8
	.db $30
	.db $B9
	.db $22
	.db $B9
	.db $26
	.db $BB
	.db $28
	.db $B8
	.db $7E

MusicDataUnderground_Triangle:
	.db $84
	.db $22
	.db $30
	.db $3A
	.db $42
	.db $7E
	.db $44
	.db $3A
	.db $30
	.db $22
	.db $30
	.db $3A
	.db $42
	.db $7E
	.db $40
	.db $3A
	.db $30
	.db $22
	.db $30
	.db $3A
	.db $30
	.db $7E
	.db $40
	.db $3A
	.db $30
	.db $22
	.db $30
	.db $3A
	.db $30
	.db $7E
	.db $40
	.db $3A
	.db $30
	.db $22
	.db $30
	.db $3A
	.db $30
	.db $7E
	.db $40
	.db $3A
	.db $30
	.db $22
	.db $30
	.db $3A
	.db $30
	.db $7E
	.db $40
	.db $3A
	.db $30

MusicDataUnderground_DPCM:
IFNDEF EXPAND_MUSIC
	.db $85, $01
	.db $8D, $10
	.db $8E, $10
	.db $84, $10
	.db $88, $10
	.db $84, $01, $01, $01
	.db $00
ELSE
	.db $85, $02
	.db $8D, $06
	.db $8E, $06
	.db $84, $06
	.db $88, $06
	.db $84, $02, $02, $02
	.db $00
ENDIF
