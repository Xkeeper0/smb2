MusicDataStar:
MusicDataStar_Square2:
	.db $98
	.db $48
	.db $48
	.db $48
	.db $94
	.db $7E
	.db $48
	.db $7E
	.db $99
	.db $48
	.db $98
	.db $48
	.db $48
	.db $46
	.db $46
	.db $46
	.db $94
	.db $7E
	.db $46
	.db $7E
	.db $99
	.db $46
	.db $98
	.db $46
	.db $46
	.db $00

MusicDataStar_Square1:
	.db $98
	.db $3A
	.db $3A
	.db $3A
	.db $94
	.db $34
	.db $98
	.db $3A
	.db $3A
	.db $94
	.db $34
	.db $3A
	.db $34
	.db $98
	.db $3A
	.db $38
	.db $38
	.db $38
	.db $94
	.db $30
	.db $98
	.db $38
	.db $38
	.db $94
	.db $30
	.db $38
	.db $30
	.db $98
	.db $38

MusicDataStar_Triangle:
	.db $9A
	.db $34
	.db $99
	.db $42
	.db $4C
	.db $98
	.db $7E
	.db $42
	.db $4C
	.db $9A
	.db $30
	.db $99
	.db $3E
	.db $48
	.db $98
	.db $7E
	.db $3E
	.db $48

MusicDataStar_DPCM:
IFNDEF EXPAND_MUSIC
	.db $94, $01
	.db $98, $10
	.db $94, $10, $10, $10, $01, $01
	.db $00
ELSE
	.db $94, $02
	.db $98, $06
	.db $94, $06, $06, $06, $02, $02
	.db $00
ENDIF
