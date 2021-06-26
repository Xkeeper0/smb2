; Bank C & Bank D subfile
; ===============
;
; What's inside:
;
;   - Pointer and sprite data for cast roll
;

CastRoll_SpritePointersHi:
	.db >CastRoll_Mario ; DATA XREF: sub_BANKC_84EC+7r
	.db >CastRoll_Luigi
	.db >CastRoll_Princess
	.db >CastRoll_Toad
	.db >CastRoll_Shyguy
	.db >CastRoll_Snifit
	.db >CastRoll_Ninji
	.db >CastRoll_Beezo
	.db >CastRoll_Porcupo
	.db >CastRoll_Tweeter
	.db >CastRoll_BobOmb
	.db >CastRoll_Hoopstar
	.db >CastRoll_Trouter
	.db >CastRoll_Pidgit
	.db >CastRoll_Panser
	.db >CastRoll_Flurry
	.db >CastRoll_Albatoss
	.db >CastRoll_Phanto
	.db >CastRoll_Spark
	.db >CastRoll_Subcon
	.db >CastRoll_Pokey
	.db >CastRoll_Birdo
	.db >CastRoll_Ostro
	.db >CastRoll_Autobomb
	.db >CastRoll_Cobrat
	.db >CastRoll_Mouser
	.db >CastRoll_Fryguy
	.db >CastRoll_Clawglip
	.db >CastRoll_Triclyde
CastRoll_SpritePointersLo:
	.db <CastRoll_Mario
	.db <CastRoll_Luigi
	.db <CastRoll_Princess
	.db <CastRoll_Toad
	.db <CastRoll_Shyguy
	.db <CastRoll_Snifit
	.db <CastRoll_Ninji
	.db <CastRoll_Beezo
	.db <CastRoll_Porcupo
	.db <CastRoll_Tweeter
	.db <CastRoll_BobOmb
	.db <CastRoll_Hoopstar
	.db <CastRoll_Trouter
	.db <CastRoll_Pidgit
	.db <CastRoll_Panser
	.db <CastRoll_Flurry
	.db <CastRoll_Albatoss
	.db <CastRoll_Phanto
	.db <CastRoll_Spark
	.db <CastRoll_Subcon
	.db <CastRoll_Pokey
	.db <CastRoll_Birdo
	.db <CastRoll_Ostro
	.db <CastRoll_Autobomb
	.db <CastRoll_Cobrat
	.db <CastRoll_Mouser
	.db <CastRoll_Fryguy
	.db <CastRoll_Clawglip
	.db <CastRoll_Triclyde
CastRoll_Mario:
	.db $D0, $3E, $00, $30
	.db $D0, $00, $00, $38 ; 4
	.db $D0, $02, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $04, $00, $38 ; $14
	.db $F9, $06, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $24 ; $20
	.db $F9, $E8, $00, $2C ; $24
	.db $F9, $D0, $00, $34 ; $28
	.db $F9, $F2, $00, $3C ; $2C
	.db $F9, $E0, $00, $44 ; $30
	.db $F9, $EC, $00, $4C ; $34
	.db $F9, $3E, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Luigi:
	.db $D0, $3E, $00, $30
	.db $D0, $08, $00, $38 ; 4
	.db $D0, $0A, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $0C, $00, $38 ; $14
	.db $F9, $0E, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $24 ; $20
	.db $F9, $E6, $00, $2C ; $24
	.db $F9, $F8, $00, $34 ; $28
	.db $F9, $E0, $00, $3C ; $2C
	.db $F9, $DC, $00, $44 ; $30
	.db $F9, $E0, $00, $4C ; $34
	.db $F9, $3E, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Princess:
	.db $D0, $3E, $00, $30
	.db $D0, $10, $00, $38 ; 4
	.db $D0, $12, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $14, $00, $38 ; $14
	.db $F9, $16, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $EE, $00, $20 ; $20
	.db $F9, $F2, $00, $28 ; $24
	.db $F9, $E0, $00, $30 ; $28
	.db $F9, $EA, $00, $38 ; $2C
	.db $F9, $D4, $00, $40 ; $30
	.db $F9, $D8, $00, $48 ; $34
	.db $F9, $F4, $00, $50 ; $38
	.db $F9, $F4, $00, $58 ; $3C
CastRoll_Toad:
	.db $D0, $3E, $00, $30 ; DATA XREF: BANKC:8B0Bo
	.db $D0, $18, $00, $38 ; 4
	.db $D0, $1A, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $1C, $00, $38 ; $14
	.db $F9, $1E, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $20 ; $20
	.db $F9, $3E, $00, $28 ; $24
	.db $F9, $F6, $00, $30 ; $28
	.db $F9, $EC, $00, $38 ; $2C
	.db $F9, $D0, $00, $40 ; $30
	.db $F9, $D6, $00, $48 ; $34
	.db $F9, $3E, $00, $50 ; $38
	.db $F9, $3E, $00, $58 ; $3C
CastRoll_Shyguy:
	.db $D0, $3E, 0, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $20, $00, $38 ; $14
	.db $F9, $22, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $20 ; $20
	.db $F9, $F4, $00, $28 ; $24
	.db $F9, $DE, $00, $30 ; $28
	.db $F9, $CC, $00, $38 ; $2C
	.db $F9, $DC, $00, $40 ; $30
	.db $F9, $F8, $00, $48 ; $34
	.db $F9, $CC, $00, $50 ; $38
	.db $F9, $3E, $00, $58 ; $3C
CastRoll_Snifit:
	.db $D0, $3E, 0, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $24, $00, $38 ; $14
	.db $F9, $26, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $20 ; $20
	.db $F9, $F4, $00, $28 ; $24
	.db $F9, $EA, $00, $30 ; $28
	.db $F9, $E0, $00, $38 ; $2C
	.db $F9, $DA, $00, $40 ; $30
	.db $F9, $E0, $00, $48 ; $34
	.db $F9, $F6, $00, $50 ; $38
	.db $F9, $3E, $00, $58 ; $3C
CastRoll_Ninji:
	.db $D0, $3E, $00, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $28, $00, $38 ; $14
	.db $F9, $2A, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $24 ; $20
	.db $F9, $EA, $00, $2C ; $24
	.db $F9, $E0, $00, $34 ; $28
	.db $F9, $EA, $00, $3C ; $2C
	.db $F9, $E2, $00, $44 ; $30
	.db $F9, $E0, $00, $4C ; $34
	.db $F9, $3E, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Beezo:
	.db $D0, $3E, $00, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $2C, $00, $38 ; $14
	.db $F9, $2E, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $24 ; $20
	.db $F9, $D2, $00, $2C ; $24
	.db $F9, $D8, $00, $34 ; $28
	.db $F9, $D8, $00, $3C ; $2C
	.db $F9, $CE, $00, $44 ; $30
	.db $F9, $EC, $00, $4C ; $34
	.db $F9, $3E, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Porcupo:
	.db $D0, $3E, $00, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $30, $00, $38 ; $14
	.db $F9, $32, $00, $40 ; $18
	.db $F9 ; $1C
byte_BANKC_8D5F:
	.db $3E, $00, $48, $F9
	.db $EE, $00, $24, $F9 ; 4
	.db $EC, $00, $2C, $F9 ; 8
	.db $F2, $00, $34, $F9 ; $C
	.db $D4, $00, $3C, $F9 ; $10
	.db $F8, $00, $44, $F9 ; $14
	.db $EE, $00, $4C, $F9 ; $18
	.db $EC, $00, $54, $F9 ; $1C
	.db $3E, $00, $5C ; $20
CastRoll_Tweeter:
	.db $D0, $3E, $00, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $34, $00, $38 ; $14
	.db $F9, $36, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $F6, $00, $24 ; $20
	.db $F9, $FC, $00, $2C ; $24
	.db $F9, $D8, $00, $34 ; $28
	.db $F9, $D8, $00, $3C ; $2C
	.db $F9, $F6, $00, $44 ; $30
	.db $F9, $D8, $00, $4C ; $34
	.db $F9, $F2, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_BobOmb:
	.db $D0, $3E, 0, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $38, $00, $38 ; $14
	.db $F9, $3A, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $D2, $00, $24 ; $20
	.db $F9, $EC, $00, $2C ; $24
	.db $F9, $D2, $00, $34 ; $28
	.db $F9, $3E, $00, $3C ; $2C
	.db $F9, $EC, $00, $44 ; $30
	.db $F9, $E8, $00, $4C ; $34
	.db $F9, $D2, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Hoopstar:
	.db $D0, $3E, $00, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $3C, $00, $38 ; $14
	.db $F9, $3C, $40, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $DE, $00, $20 ; $20
	.db $F9, $EC, $00, $28 ; $24
	.db $F9, $EC, $00, $30 ; $28
	.db $F9, $EE, $00, $38 ; $2C
	.db $F9, $F4, $00, $40 ; $30
	.db $F9, $F6, $00, $48 ; $34
	.db $F9, $D0, $00, $50 ; $38
	.db $F9, $F2, $00, $58 ; $3C
CastRoll_Trouter:
	.db $D0, $3E, $00, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $40, $00, $38 ; $14
	.db $F9, $42, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $F6, $00, $24 ; $20
	.db $F9, $F2, $00, $2C ; $24
	.db $F9, $EC, $00, $34 ; $28
	.db $F9, $F8, $00, $3C ; $2C
	.db $F9, $F6, $00, $44 ; $30
	.db $F9, $D8, $00, $4C ; $34
	.db $F9, $F2, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Pidgit:
	.db $D0, $3E, 0, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $44, $00, $38 ; $14
	.db $F9, $46, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $20 ; $20
	.db $F9, $EE, $00, $28 ; $24
	.db $F9, $E0, $00, $30 ; $28
	.db $F9, $D6, $00, $38 ; $2C
	.db $F9, $DC, $00, $40 ; $30
	.db $F9, $E0, $00, $48 ; $34
	.db $F9, $F6, $00, $50 ; $38
	.db $F9, $3E, $00, $58 ; $3C
CastRoll_Panser:
	.db $D0, $3E, 0, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $48, $00, $38 ; $14
	.db $F9, $4A, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $20 ; $20
	.db $F9, $EE, $00, $28 ; $24
	.db $F9, $D0, $00, $30 ; $28
	.db $F9, $EA, $00, $38 ; $2C
	.db $F9, $F4, $00, $40 ; $30
	.db $F9, $D8, $00, $48 ; $34
	.db $F9, $F2, $00, $50 ; $38
	.db $F9, $3E, $00, $58 ; $3C
CastRoll_Flurry:
	.db $D0, $3E, 0, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $4C, $00, $38 ; $14
	.db $F9, $4E, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $20 ; $20
	.db $F9, $DA, $00, $28 ; $24
	.db $F9, $E6, $00, $30 ; $28
	.db $F9, $F8, $00, $38 ; $2C
	.db $F9, $F2, $00, $40 ; $30
	.db $F9, $F2, $00, $48 ; $34
	.db $F9, $CC, $00, $50 ; $38
	.db $F9, $3E, $00, $58 ; $3C
CastRoll_Albatoss:
	.db $D0, $3E, $00, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $50, $00, $30 ; $10
	.db $F9, $52, $00, $38 ; $14
	.db $F9, $54, $00, $40 ; $18
	.db $F9, $56, $00, $48 ; $1C
	.db $F9, $D0, $00, $20 ; $20
	.db $F9, $E6, $00, $28 ; $24
	.db $F9, $D2, $00, $30 ; $28
	.db $F9, $D0, $00, $38 ; $2C
	.db $F9, $F6, $00, $40 ; $30
	.db $F9, $EC, $00, $48 ; $34
	.db $F9, $F4, $00, $50 ; $38
	.db $F9, $F4, $00, $58 ; $3C
CastRoll_Phanto:
	.db $D0, $3E, 0, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $68, $00, $38 ; $14
	.db $F9, $68, $40, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $20 ; $20
	.db $F9, $EE, $00, $28 ; $24
	.db $F9, $DE, $00, $30 ; $28
	.db $F9, $D0, $00, $38 ; $2C
	.db $F9, $EA, $00, $40 ; $30
	.db $F9, $F6, $00, $48 ; $34
	.db $F9, $EC, $00, $50 ; $38
	.db $F9, $3E, $00, $58 ; $3C
CastRoll_Spark:
	.db $D0, $3E, $00, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $6A, $00, $38 ; $14
	.db $F9, $6A, $40, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $24 ; $20
	.db $F9, $F4, $00, $2C ; $24
	.db $F9, $EE, $00, $34 ; $28
	.db $F9, $D0, $00, $3C ; $2C
	.db $F9, $F2, $00, $44 ; $30
	.db $F9, $E4, $00, $4C ; $34
	.db $F9, $3E, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Subcon:
	.db $D0, $3E, 0, $30
	.db $D0, $3E, $00, $38 ; 4
	.db $D0, $3E, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $6C, $00, $38 ; $14
	.db $F9, $6E, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $24 ; $20
	.db $F9, $F4, $00, $2C ; $24
	.db $F9, $F8, $00, $34 ; $28
	.db $F9, $D2, $00, $3C ; $2C
	.db $F9, $D4, $00, $44 ; $30
	.db $F9, $EC, $00, $4C ; $34
	.db $F9, $EA, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Pokey:
	.db $D0, $3E, $00, $30
	.db $D0, $60, $00, $38 ; 4
	.db $D0, $62, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $64, $00, $38 ; $14
	.db $F9, $66, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $24 ; $20
	.db $F9, $EE, $00, $2C ; $24
	.db $F9, $EC, $00, $34 ; $28
	.db $F9, $E4, $00, $3C ; $2C
	.db $F9, $D8, $00, $44 ; $30
	.db $F9, $CC, $00, $4C ; $34
	.db $F9, $3E, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Birdo:
	.db $D0, $3E, $00, $30
	.db $D0, $70, $00, $38 ; 4
	.db $D0, $72, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $74, $00, $38 ; $14
	.db $F9, $76, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $24 ; $20
	.db $F9, $D2, $00, $2C ; $24
	.db $F9, $E0, $00, $34 ; $28
	.db $F9, $F2, $00, $3C ; $2C
	.db $F9, $D6, $00, $44 ; $30
	.db $F9, $EC, $00, $4C ; $34
	.db $F9, $3E, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Ostro:
	.db $D0, $3E, $00, $30
	.db $D0, $78, $00, $38 ; 4
	.db $D0, $7A, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $7C, $00, $38 ; $14
	.db $F9, $7E, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $24 ; $20
	.db $F9, $EC, $00, $2C ; $24
	.db $F9, $F4, $00, $34 ; $28
	.db $F9, $F6, $00, $3C ; $2C
	.db $F9, $F2, $00, $44 ; $30
	.db $F9, $EC, $00, $4C ; $34
	.db $F9, $3E, $00, $54 ; $38
	.db $F9, $3E, $00, $5C ; $3C
CastRoll_Autobomb:
	.db $D0, $3E, $00, $30
	.db $D0, $80, $00, $38 ; 4
	.db $D0, $82, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $84, $00, $38 ; $14
	.db $F9, $86, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $D0, $00, $20 ; $20
	.db $F9, $F8, $00, $28 ; $24
	.db $F9, $F6, $00, $30 ; $28
	.db $F9, $EC, $00, $38 ; $2C
	.db $F9, $D2, $00, $40 ; $30
	.db $F9, $EC, $00, $48 ; $34
	.db $F9, $E8, $00, $50 ; $38
	.db $F9, $D2, $00, $58 ; $3C
CastRoll_Cobrat:
	.db $D0, $3E, 0, $30
	.db $D0, $58, $00, $38 ; 4
	.db $D0, $5A, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $3E, $00, $30 ; $10
	.db $F9, $5C, $00, $38 ; $14
	.db $F9, $5E, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $20 ; $20
	.db $F9, $D4, $00, $28 ; $24
	.db $F9, $EC, $00, $30 ; $28
	.db $F9, $D2, $00, $38 ; $2C
	.db $F9, $F2, $00, $40 ; $30
	.db $F9, $D0, $00, $48 ; $34
	.db $F9, $F6, $00, $50 ; $38
	.db $F9, $3E, $00, $58 ; $3C
CastRoll_Mouser:
	.db $D0, $88, 0, $30
	.db $D0, $8A, $00, $38 ; 4
	.db $D0, $8C, $00, $40 ; 8
	.db $D0, $3E, $00, $48 ; $C
	.db $F9, $8E, $00, $30 ; $10
	.db $F9, $90, $00, $38 ; $14
	.db $F9, $92, $00, $40 ; $18
	.db $F9, $3E, $00, $48 ; $1C
	.db $F9, $3E, $00, $1C ; $20
	.db $F9, $E8, $00, $24 ; $24
	.db $F9, $EC, $00, $2C ; $28
	.db $F9, $F8, $00, $34 ; $2C
	.db $F9, $F4, $00, $3C ; $30
	.db $F9, $D8, $00, $44 ; $34
	.db $F9, $F2, $00, $4C ; $38
	.db $F9, $3E, $00, $54 ; $3C
CastRoll_Fryguy:
	.db $D0, $AA, 0, $30
	.db $D0, $AC, $00, $38 ; 4
	.db $D0, $AE, $00, $40 ; 8
	.db $D0, $B0, $00, $48 ; $C
	.db $F9, $B2, $00, $30 ; $10
	.db $F9, $B4, $00, $38 ; $14
	.db $F9, $B6, $00, $40 ; $18
	.db $F9, $B8, $00, $48 ; $1C
	.db $F9, $3E, $00, $20 ; $20
	.db $F9, $DA, $00, $28 ; $24
	.db $F9, $F2, $00, $30 ; $28
	.db $F9, $CC, $00, $38 ; $2C
	.db $F9, $DC, $00, $40 ; $30
	.db $F9, $F8, $00, $48 ; $34
	.db $F9, $CC, $00, $50 ; $38
	.db $F9, $3E, $00, $58 ; $3C
CastRoll_Clawglip:
	.db $D0, $BA, $00, $30
	.db $D0, $BC, $00, $38 ; 4
	.db $D0, $BE, $00, $40 ; 8
	.db $D0, $C0, $00, $48 ; $C
	.db $F9, $C2, $00, $30 ; $10
	.db $F9, $C4, $00, $38 ; $14
	.db $F9, $C6, $00, $40 ; $18
	.db $F9, $C8, $00, $48 ; $1C
	.db $F9, $D4, $00, $20 ; $20
	.db $F9, $E6, $00, $28 ; $24
	.db $F9, $D0, $00, $30 ; $28
	.db $F9, $FC, $00, $38 ; $2C
	.db $F9, $DC, $00, $40 ; $30
	.db $F9, $E6, $00, $48 ; $34
	.db $F9, $E0, $00, $50 ; $38
	.db $F9, $EE, $00, $58 ; $3C
CastRoll_Triclyde:
	.db $D0, $94, $00, $30
	.db $D0, $96, $00, $38 ; 4
	.db $D0, $98, $00, $40 ; 8
	.db $D0, $9A, $00, $48 ; $C
	.db $F9, $9C, $00, $30 ; $10
	.db $F9, $9E, $00, $38 ; $14
	.db $F9, $A0, $00, $40 ; $18
	.db $F9, $A2, $00, $48 ; $1C
	.db $F9, $3E, $00, $30 ; $20
	.db $F9, $A4, $00, $38 ; $24
	.db $F9, $A6, $00, $40 ; $28
	.db $F9, $A8, $00, $48 ; $2C
	.db $F9, $3E, $00, $50 ; $30
	.db $F9, $3E, $00, $58 ; $34
	.db $F9, $3E, $00, $60 ; $38
	.db $F9, $3E, $00, $68 ; $3C
CastRoll_TriclydeText:
	.db $D0, $F6, $00, $20
	.db $D0, $F2, $00, $28 ; 4
	.db $D0, $E0, $00, $30 ; 8
	.db $D0, $D4, $00, $38 ; $C
	.db $D0, $E6, $00, $40 ; $10
	.db $D0, $CC, $00, $48 ; $14
	.db $D0, $D6, $00, $50 ; $18
	.db $D0, $D8, $00, $58 ; $1C
CastRoll_Wart:
	.db $D0, $80, $00, $28
	.db $D0, $82, $00, $30 ; 4
	.db $D0, $84, $00, $38 ; 8
	.db $D0, $86, $00, $40 ; $C
	.db $D0, $88, $00, $48 ; $10
	.db $F9, $8A, $00, $28 ; $14
	.db $F9, $8C, $00, $30 ; $18
	.db $F9, $8E, $00, $38 ; $1C
	.db $F9, $90, $00, $40 ; $20
	.db $F9, $92, $00, $48 ; $24
	.db $F9, $94, $00, $28 ; $28
	.db $F9, $96, $00, $30 ; $2C
	.db $F9, $98, $00, $38 ; $30
	.db $F9, $9A, $00, $40 ; $34
	.db $F9, $9C, $00, $48 ; $38
	.db $F9, $C0, $00, $20 ; $3C
	.db $F9, $C0, $00, $20 ; $40
	.db $F9, $FC, $00, $2C ; $44
	.db $F9, $D0, $00, $34 ; $48
	.db $F9, $F2, $00, $3C ; $4C
	.db $F9, $F6, $00, $44 ; $50
	.db $F9, $C0, $00, $50 ; $54
	.db $F9, $C0, $00, $58 ; $58
byte_BANKC_92FE:
	.db $10
	.db $90
	.db $7C
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $12
	.db $90
	.db $7C
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $14
	.db $90
	.db $7C
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $16
	.db $90
	.db $7C
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $16
	.db $90
	.db $18
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $16
	.db $90
	.db $1A
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $16
	.db $90
	.db $1C
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $16
	.db $90
	.db $1E
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $20
	.db $90
	.db $1E
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $24
	.db $90
	.db $1E
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $24
	.db $90
	.db $28
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $24
	.db $90
	.db $2A
	.db $98
	.db $7C
	.db $A0
	.db $7C
	.db $A8
	.db $24
	.db $90
	.db $2A
	.db $98
	.db $2C
	.db $A0
	.db $7C
	.db $A8
	.db $24
	.db $90
	.db $2A
	.db $98
	.db $2E
	.db $A0
	.db $7C
	.db $A8
	.db $24
	.db $90
	.db $30
	.db $98
	.db $32
	.db $A0
	.db $7C
	.db $A8
	.db $24
	.db $90
	.db $30
	.db $98
	.db $34
	.db $A0
	.db $7C
	.db $A8
	.db $24
	.db $90
	.db $30
	.db $98
	.db $36
	.db $A0
	.db $7C
	.db $A8
	.db $24
	.db $90
	.db $30
	.db $98
	.db $36
	.db $A0
	.db $38
	.db $A8
	.db $24
	.db $90
	.db $30
	.db $98
	.db $3A
	.db $A0
	.db $3C
	.db $A8
	.db $24
	.db $90
	.db $30
	.db $98
	.db $3E
	.db $A0
	.db $40
	.db $A8
	.db $24
	.db $90
	.db $30
	.db $98
	.db $3E
	.db $A0
	.db $42
	.db $A8
byte_BANKC_93A6:
	.db $44
	.db $B0
	.db $46
	.db $B8
	.db $7C
	.db $C0
	.db $7C
	.db $C8
	.db $48
	.db $B0
	.db $4A
	.db $B8
	.db $7C
	.db $C0
	.db $7C
	.db $C8
	.db $4C
	.db $B0
	.db $4E
	.db $B8
	.db $7C
	.db $C0
	.db $7C
	.db $C8
	.db $50
	.db $B0
	.db $52
	.db $B8
	.db $7C
	.db $C0
	.db $7C
	.db $C8
	.db $54
	.db $B0
	.db $56
	.db $B8
	.db $7C
	.db $C0
	.db $7C
	.db $C8
	.db $58
	.db $B0
	.db $5A
	.db $B8
	.db $7C
	.db $C0
	.db $7C
	.db $C8
	.db $5C
	.db $B0
	.db $5E
	.db $B8
	.db $7C
	.db $C0
	.db $7C
	.db $C8
	.db $5C
	.db $B0
	.db $60
	.db $B8
	.db $7C
	.db $C0
	.db $7C
	.db $C8
	.db $5C
	.db $B0
	.db $62
	.db $B8
	.db $7C
	.db $C0
	.db $7C
	.db $C8
	.db $5C
	.db $B0
	.db $64
	.db $B8
	.db $66
	.db $C0
	.db $7C
	.db $C8
	.db $5C
	.db $B0
	.db $64
	.db $B8
	.db $68
	.db $C0
	.db $7C
	.db $C8
	.db $5C
	.db $B0
	.db $64
	.db $B8
	.db $6A
	.db $C0
	.db $7C
	.db $C8
	.db $5C
	.db $B0
	.db $64
	.db $B8
	.db $6C
	.db $C0
	.db $6E
	.db $C8
	.db $5C
	.db $B0
	.db $64
	.db $B8
	.db $6C
	.db $C0
	.db $70
	.db $C8
	.db $5C
	.db $B0
	.db $64
	.db $B8
	.db $6C
	.db $C0
	.db $72
	.db $C8
	.db $5C
	.db $B0
	.db $64
	.db $B8
	.db $6C
	.db $C0
	.db $74
	.db $C8
	.db $5C
	.db $B0
	.db $64
	.db $B8
	.db $6C
	.db $C0
	.db $76
	.db $C8
	.db $5C
	.db $B0
	.db $64
	.db $B8
	.db $6C
	.db $C0
	.db $78
	.db $C8
	.db $5C
	.db $B0
	.db $64
	.db $B8
	.db $6C
	.db $C0
	.db $7A
	.db $C8
	.db $60
