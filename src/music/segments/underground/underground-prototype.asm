MusicDataUndergroundBeta1:
MusicDataUndergroundBeta2:
MusicDataUndergroundBeta1_Square2:
MusicDataUndergroundBeta2_Square2:
	.db $DC
	.db $7E
	.db $7E
	.db $7E
	.db $7E
	.db $D4
	.db $18
	.db $30
	.db $12
	.db $2A
	.db $14
	.db $2C
	.db $D8
	.db $7E
	.db $DC
	.db $7E
	.db $D4
	.db $18
	.db $30
	.db $12
	.db $2A
	.db $14
	.db $2C
	.db $D8
	.db $7E
	.db $DC
	.db $7E
	.db $D4
	.db $0A
	.db $22
	.db $04
	.db $1C
	.db $06
	.db $1E
	.db $D8
	.db $7E
	.db $DC
	.db $7E
	.db $D4
	.db $0A
	.db $22
	.db $04
	.db $1C
	.db $06
	.db $1E
	.db $DC
	.db $7E
	.db $D2
	.db $1E
	.db $1C
	.db $1A
	.db $D8
	.db $18
	.db $1E
	.db $1C
	.db $10
	.db $0E
	.db $1A
	.db $D2
	.db $18
	.db $24
	.db $22
	.db $20
	.db $2C
	.db $2A
	.db $D6
	.db $28
	.db $1E
	.db $16
	.db $14
	.db $12
	.db $10
	.db $DC
	.db $7E
	.db $00

MusicDataUndergroundBeta1_Square1:
MusicDataUndergroundBeta2_Square1:
MusicDataUndergroundBeta1_Triangle:
MusicDataUndergroundBeta2_Triangle:
	.db $8C
	.db $7E
	.db $7E
	.db $7E
	.db $7E
	.db $84
	.db $30
	.db $48
	.db $2A
	.db $42
	.db $2C
	.db $44
	.db $88
	.db $7E
	.db $8C
	.db $7E
	.db $84
	.db $30
	.db $48
	.db $2A
	.db $42
	.db $2C
	.db $44
	.db $88
	.db $7E
	.db $8C
	.db $7E
	.db $84
	.db $22
	.db $3A
	.db $1C
	.db $34
	.db $1E
	.db $36
	.db $88
	.db $7E
	.db $8C
	.db $7E
	.db $84
	.db $22
	.db $3A
	.db $1C
	.db $34
	.db $1E
	.db $36
	.db $8C
	.db $7E
	.db $82
	.db $36
	.db $34
	.db $32
	.db $88
	.db $30
	.db $36
	.db $34
	.db $28
	.db $26
	.db $32
	.db $82
	.db $30
	.db $3C
	.db $3A
	.db $38
	.db $44
	.db $42
	.db $86
	.db $40
	.db $36
	.db $2E
	.db $2C
	.db $2A
	.db $28
	.db $8C
	.db $7E

MusicDataUndergroundBeta1_DPCM:
IFNDEF EXPAND_MUSIC
	.db $8A, $01, $10
	.db $84, $01, $01
	.db $88, $01
	.db $8A, $10
	.db $8A, $01
	.db $89, $10
	.db $88, $01, $01
	.db $84, $01
	.db $88, $10
	.db $84, $10, $10
	.db $00
ELSE
	.db $8A, $02, $06
	.db $84, $02, $02
	.db $88, $02
	.db $8A, $06
	.db $8A, $02
	.db $89, $06
	.db $88, $02, $02
	.db $84, $02
	.db $88, $06
	.db $84, $06, $06
	.db $00
ENDIF

MusicDataUndergroundBeta2_DPCM:
IFNDEF EXPAND_MUSIC
	.db $88, $01, $10
	.db $84, $01, $01
	.db $88, $10
	.db $84, $01, $01, $10
	.db $88, $01
	.db $84, $01
	.db $88, $10
	.db $00
ELSE
	.db $88, $02, $06
	.db $84, $02, $01
	.db $88, $06
	.db $84, $02, $02, $06
	.db $88, $02
	.db $84, $02
	.db $88, $06
	.db $00
ENDIF

MusicDataUndergroundBeta1_Noise:
	.db $8A
	.db $01
	.db $10
	.db $01
	.db $10
	.db $01
	.db $10
	.db $01
	.db $88
	.db $10
	.db $84
	.db $10
	.db $10
	.db $00

MusicDataUndergroundBeta2_Noise:
	.db $84
	.db $02
	.db $02
	.db $10
	.db $02
	.db $00
