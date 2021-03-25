;
; Bank 6 & Bank 7
; ===============
;
; What's inside:
;
;   - Level palettes
;   - Groundset data
;   - Object tiles
;   - Level handling code
;
; -----
;

;
; ## Level palettes
;
; Each world has several sets of background and sprite palettes, which are set per area in the level
; header. Subspace is defined separately in each world, but they all use the same colors!
;

;
; #### Palette pointers
;
WorldBackgroundPalettePointersLo:
	.db <World1BackgroundPalettes
	.db <World2BackgroundPalettes
	.db <World3BackgroundPalettes
	.db <World4BackgroundPalettes
	.db <World5BackgroundPalettes
	.db <World6BackgroundPalettes
	.db <World7BackgroundPalettes

WorldSpritePalettePointersLo:
	.db <World1SpritePalettes
	.db <World2SpritePalettes
	.db <World3SpritePalettes
	.db <World4SpritePalettes
	.db <World5SpritePalettes
	.db <World6SpritePalettes
	.db <World7SpritePalettes

WorldBackgroundPalettePointersHi:
	.db >World1BackgroundPalettes
	.db >World2BackgroundPalettes
	.db >World3BackgroundPalettes
	.db >World4BackgroundPalettes
	.db >World5BackgroundPalettes
	.db >World6BackgroundPalettes
	.db >World7BackgroundPalettes

WorldSpritePalettePointersHi:
	.db >World1SpritePalettes
	.db >World2SpritePalettes
	.db >World3SpritePalettes
	.db >World4SpritePalettes
	.db >World5SpritePalettes
	.db >World6SpritePalettes
	.db >World7SpritePalettes

; #### World 1
;
World1BackgroundPalettes:
	; Day
	.db $21, $30, $12, $0F ; $00
	.db $21, $30, $16, $0F ; $04
	.db $21, $27, $17, $0F ; $08
	.db $21, $29, $1A, $0F ; $0C
	; Night
	.db $0F, $30, $12, $01 ; $10
	.db $0F, $30, $16, $02 ; $14
	.db $0F, $27, $17, $08 ; $18
	.db $0F, $29, $1A, $0A ; $1C
	; Underground
	.db $0F, $2C, $1C, $0C ; $20
	.db $0F, $30, $16, $02 ; $24
	.db $0F, $27, $17, $08 ; $28
	.db $0F, $2A, $1A, $0A ; $2C
	; Jar
	.db $07, $30, $27, $0F ; $30
	.db $07, $30, $16, $0F ; $34
	.db $07, $27, $17, $0F ; $38
	.db $07, $31, $21, $0F ; $3C
	; Castle
	.db $03, $2C, $1C, $0F ; $40
	.db $03, $30, $16, $0F ; $44
	.db $03, $3C, $1C, $0F ; $48
	.db $03, $25, $15, $05 ; $4C
	; Boss
	.db $0C, $30, $06, $0F ; $50
	.db $0C, $30, $16, $0F ; $54
	.db $0C, $30, $16, $0F ; $58
	.db $0C, $30, $26, $0F ; $5C
	; Subspace
	.db $01, $0F, $0F, $0F ; $60
	.db $01, $0F, $0F, $0F ; $64
	.db $01, $0F, $0F, $0F ; $68
	.db $01, $0F, $0F, $0F ; $6C

World1SpritePalettes:
	; Overworld
	.db $FF, $30, $16, $0F ; $00
	.db $FF, $38, $10, $0F ; $04
	.db $FF, $30, $25, $0F ; $08
	; Underground
	.db $FF, $30, $16, $02 ; $0C
	.db $FF, $38, $10, $02 ; $10
	.db $FF, $30, $25, $02 ; $14
	; Boss
	.db $FF, $30, $16, $0F ; $18
	.db $FF, $30, $10, $0F ; $1C
	.db $FF, $25, $10, $0F ; $20
IFDEF EXPAND_TABLES
	unusedSpace World1SpritePalettes + $30, $FF
ENDIF

;
; #### World 2
;
World2BackgroundPalettes:
	; Day
	.db $11, $30, $2A, $0F ; $00
	.db $11, $30, $16, $0F ; $04
	.db $11, $28, $18, $0F ; $08
	.db $11, $17, $07, $0F ; $0C
	; Night (unused?)
	.db $0F, $30, $2A, $0A ; $10
	.db $0F, $30, $16, $02 ; $14
	.db $0F, $28, $18, $08 ; $18
	.db $0F, $17, $07, $08 ; $1C
	; Underground
	.db $0F, $2A, $1A, $0A ; $20
	.db $0F, $30, $16, $02 ; $24
	.db $0F, $28, $18, $08 ; $28
	.db $0F, $27, $17, $07 ; $2C
	; Jar
	.db $07, $30, $27, $0F ; $30
	.db $07, $30, $16, $0F ; $34
	.db $07, $28, $17, $0F ; $38
	.db $07, $31, $11, $0F ; $3C;
	; Castle (unused)
	.db $0C, $2A, $1A, $0F ; $40
	.db $0C, $30, $16, $0F ; $44
	.db $0C, $17, $07, $0F ; $48
	.db $0C, $25, $15, $0F ; $4C
	; Boss
	.db $0C, $30, $1A, $0F ; $50
	.db $0C, $30, $16, $0F ; $54
	.db $0C, $30, $2A, $0F ; $58
	.db $0C, $30, $3A, $0F ; $5C
	; Subspace
	.db $01, $0F, $0F, $0F ; $60
	.db $01, $0F, $0F, $0F ; $64
	.db $01, $0F, $0F, $0F ; $68
	.db $01, $0F, $0F, $0F ; $6C

World2SpritePalettes:
	; Overworld
	.db $FF, $30, $16, $0F ; $00
	.db $FF, $38, $2A, $0F ; $04
	.db $FF, $30, $25, $0F ; $08
	; Underground
	.db $FF, $30, $16, $02 ; $0C
	.db $FF, $38, $2A, $02 ; $10
	.db $FF, $30, $25, $02 ; $14
	; Boss
	.db $FF, $30, $16, $0F ; $18
	.db $FF, $30, $10, $0F ; $1C
	.db $FF, $30, $23, $0F ; $20
IFDEF EXPAND_TABLES
	unusedSpace World2SpritePalettes + $30, $FF
ENDIF

;
; #### World 3
;
World3BackgroundPalettes:
	; Day
	.db $22, $30, $12, $0F ; $00
	.db $22, $30, $16, $0F ; $04
	.db $22, $27, $17, $0F ; $08
	.db $22, $29, $1A, $0F ; $0C
	; Night (unused)
	.db $0F, $30, $12, $01 ; $10
	.db $0F, $30, $16, $02 ; $14
	.db $0F, $27, $17, $08 ; $18
	.db $0F, $29, $1A, $04 ; $1C
	; Underground
	.db $0F, $30, $1C, $0C ; $20
	.db $0F, $30, $16, $02 ; $24
	.db $0F, $27, $17, $08 ; $28
	.db $0F, $26, $16, $06 ; $2C
	; Jar
	.db $07, $30, $27, $0F ; $30
	.db $07, $30, $16, $0F ; $34
	.db $07, $27, $17, $0F ; $38
	.db $07, $31, $31, $0F ; $3C
	; Castle
	.db $03, $31, $21, $0F ; $40
	.db $03, $30, $16, $0F ; $44
	.db $03, $3C, $1C, $0F ; $48
	.db $03, $2A, $1A, $0F ; $4C
	; Boss
	.db $0C, $30, $11, $0F ; $50
	.db $0C, $30, $16, $0F ; $54
	.db $0C, $30, $21, $0F ; $58
	.db $0C, $30, $31, $0F ; $5C
	; Subspace
	.db $01, $0F, $0F, $0F ; $60
	.db $01, $0F, $0F, $0F ; $64
	.db $01, $0F, $0F, $0F ; $68
	.db $01, $0F, $0F, $0F ; $6C

World3SpritePalettes:
	; Overworld
	.db $FF, $30, $16, $0F ; $00
	.db $FF, $38, $10, $0F ; $04
	.db $FF, $30, $25, $0F ; $08
	; Underground
	.db $FF, $30, $16, $02 ; $0C
	.db $FF, $38, $10, $02 ; $10
	.db $FF, $30, $25, $02 ; $14
	; Boss
	.db $FF, $30, $16, $0F ; $18
	.db $FF, $30, $10, $0F ; $1C
	.db $FF, $2B, $10, $0F ; $20
IFDEF EXPAND_TABLES
	unusedSpace World3SpritePalettes + $30, $FF
ENDIF

;
; #### World 4
;
World4BackgroundPalettes:
	; Day
	.db $23, $30, $12, $0F ; $00
	.db $23, $30, $16, $0F ; $04
	.db $23, $2B, $1B, $0F ; $08
	.db $23, $30, $32, $0F ; $0C
	; Night (unused)
	.db $0F, $30, $12, $01 ; $10
	.db $0F, $30, $16, $02 ; $14
	.db $0F, $2B, $1B, $0B ; $18
	.db $0F, $29, $1A, $0A ; $1C
	; Underground
	.db $0F, $32, $12, $01 ; $20
	.db $0F, $30, $16, $02 ; $24
	.db $0F, $2B, $1B, $0B ; $28
	.db $0F, $27, $17, $07 ; $2C
	; Jar
	.db $07, $30, $27, $0F ; $30
	.db $07, $30, $16, $0F ; $34
	.db $07, $27, $17, $0F ; $38
	.db $07, $21, $21, $0F ; $3C
	; Castle
	.db $03, $30, $12, $0F ; $40
	.db $03, $30, $16, $0F ; $44
	.db $03, $3C, $1C, $0F ; $48
	.db $03, $28, $18, $0F ; $4C
	; Boss
	.db $0C, $30, $00, $0F ; $50
	.db $0C, $30, $16, $0F ; $54
	.db $0C, $30, $10, $0F ; $58
	.db $0C, $30, $30, $0F ; $5C
	; Subspace
	.db $01, $0F, $0F, $0F ; $60
	.db $01, $0F, $0F, $0F ; $64
	.db $01, $0F, $0F, $0F ; $68
	.db $01, $0F, $0F, $0F ; $6C

World4SpritePalettes:
	; Overworld
	.db $FF, $30, $16, $0F ; $00
	.db $FF, $38, $10, $0F ; $04
	.db $FF, $30, $25, $0F ; $08
	; Underground
	.db $FF, $30, $16, $02 ; $0C
	.db $FF, $38, $10, $02 ; $10
	.db $FF, $30, $25, $02 ; $14
	; Boss
	.db $FF, $30, $16, $0F ; $18
	.db $FF, $30, $10, $0F ; $1C
	.db $FF, $27, $16, $0F ; $20
IFDEF EXPAND_TABLES
	unusedSpace World4SpritePalettes + $30, $FF
ENDIF

;
; #### World 5
;
World5BackgroundPalettes:
	; Night
	.db $0F, $30, $12, $01 ; $00
	.db $0F, $30, $16, $01 ; $04
	.db $0F, $27, $17, $07 ; $08
	.db $0F, $2B, $1B, $0B ; $0C
	; Also night (unused)
	.db $0F, $30, $12, $01 ; $10
	.db $0F, $30, $16, $02 ; $14
	.db $0F, $27, $17, $08 ; $18
	.db $0F, $29, $1A, $0A ; $1C
	; Underground
	.db $0F, $31, $12, $01 ; $20
	.db $0F, $30, $16, $02 ; $24
	.db $0F, $3C, $1C, $0C ; $28
	.db $0F, $2A, $1A, $0A ; $2C
	; Jar/Tree
	.db $07, $30, $27, $0F ; $30
	.db $07, $30, $16, $0F ; $34
	.db $07, $27, $17, $0F ; $38
	.db $07, $31, $01, $0F ; $3C
	; Castle
	.db $01, $2A, $1A, $0F ; $40
	.db $01, $30, $16, $0F ; $44
	.db $01, $3C, $1C, $0F ; $48
	.db $01, $25, $15, $05 ; $4C
	; Boss
	.db $0C, $30, $16, $0F ; $50
	.db $0C, $30, $16, $0F ; $54
	.db $0C, $30, $24, $0F ; $58
	.db $0C, $30, $34, $0F ; $5C
	; Subspace
	.db $01, $0F, $0F, $0F ; $60
	.db $01, $0F, $0F, $0F ; $64
	.db $01, $0F, $0F, $0F ; $68
	.db $01, $0F, $0F, $0F ; $6C

World5SpritePalettes:
	; Overworld
	.db $FF, $30, $16, $0F ; $00
	.db $FF, $38, $10, $0F ; $04
	.db $FF, $30, $25, $0F ; $08
	; Underground
	.db $FF, $30, $16, $02 ; $0C
	.db $FF, $38, $10, $02 ; $10
	.db $FF, $30, $25, $02 ; $14
	; Boss
	.db $FF, $30, $16, $0F ; $18
	.db $FF, $30, $16, $0F ; $1C
	.db $FF, $16, $30, $0F ; $20
IFDEF EXPAND_TABLES
	unusedSpace World5SpritePalettes + $30, $FF
ENDIF

;
; #### World 6
;
World6BackgroundPalettes:
	; Day
	.db $21, $30, $2A, $0F ; $00
	.db $21, $30, $16, $0F ; $04
	.db $21, $28, $18, $0F ; $08
	.db $21, $17, $07, $0F ; $0C
	; Night
	.db $0F, $30, $2A, $01 ; $10
	.db $0F, $30, $16, $02 ; $14
	.db $0F, $28, $18, $08 ; $18
	.db $0F, $17, $07, $08 ; $1C
	; Underground
	.db $0F, $30, $12, $01 ; $20
	.db $0F, $30, $16, $02 ; $24
	.db $0F, $28, $18, $08 ; $28
	.db $0F, $27, $17, $07 ; $2C
	; Jar
	.db $07, $30, $27, $0F ; $30
	.db $07, $30, $16, $0F ; $34
	.db $07, $28, $17, $0F ; $38
	.db $07, $31, $01, $0F ; $3C
	; Castle
	.db $0C, $2A, $1A, $0F ; $40
	.db $0C, $30, $16, $0F ; $44
	.db $0C, $17, $07, $0F ; $48
	.db $0C, $25, $15, $0F ; $4C
	; Boss
	.db $0C, $30, $1B, $0F ; $50
	.db $0C, $30, $16, $0F ; $54
	.db $0C, $30, $2B, $0F ; $58
	.db $0C, $30, $3B, $0F ; $5C
	; Subspace
	.db $01, $0F, $0F, $0F ; $60
	.db $01, $0F, $0F, $0F ; $64
	.db $01, $0F, $0F, $0F ; $68
	.db $01, $0F, $0F, $0F ; $6C

World6SpritePalettes:
	; Overworld
	.db $FF, $30, $16, $0F ; $00
	.db $FF, $38, $2A, $0F ; $04
	.db $FF, $30, $25, $0F ; $08
	; Underground
	.db $FF, $30, $16, $02 ; $0C
	.db $FF, $38, $2A, $02 ; $10
	.db $FF, $30, $25, $02 ; $14
	; Boss
	.db $FF, $30, $16, $0F ; $18
	.db $FF, $30, $10, $0F ; $1C
	.db $FF, $30, $23, $0F ; $20
IFDEF EXPAND_TABLES
	unusedSpace World6SpritePalettes + $30, $FF
ENDIF

;
; #### World 7
;
World7BackgroundPalettes:
	; Day
	.db $21, $30, $12, $0F ; $00
	.db $21, $30, $16, $0F ; $04
	.db $21, $27, $17, $0F ; $08
	.db $21, $29, $1A, $0F ; $0C
	; Night (unused)
	.db $0F, $30, $12, $01 ; $10
	.db $0F, $30, $16, $02 ; $14
	.db $0F, $27, $17, $08 ; $18
	.db $0F, $29, $1A, $0A ; $1C
	; Castle
	.db $0F, $2C, $1C, $0C ; $20
	.db $0F, $30, $16, $02 ; $24
	.db $0F, $27, $17, $08 ; $28
	.db $0F, $2A, $1A, $0A ; $2C
	; Jar (unused)
	.db $07, $30, $16, $0F ; $30
	.db $07, $30, $16, $0F ; $34
	.db $07, $27, $17, $0F ; $38
	.db $07, $31, $01, $0F ; $3C
	; Castle (unused)
	.db $0F, $3C, $2C, $0C ; $40
	.db $0F, $30, $16, $02 ; $44
	.db $0F, $28, $18, $08 ; $48
	.db $0F, $25, $15, $05 ; $4C
	; Boss
	.db $0C, $30, $08, $0F ; $50
	.db $0C, $30, $16, $0F ; $54
	.db $0C, $38, $18, $0F ; $58
	.db $0C, $28, $08, $0F ; $5C
	; Subspace
	.db $01, $0F, $0F, $0F ; $60
	.db $01, $0F, $0F, $0F ; $64
	.db $01, $0F, $0F, $0F ; $68
	.db $01, $0F, $0F, $0F ; $6C

World7SpritePalettes:
	; Overworld
	.db $FF, $30, $16, $0F ; $00
	.db $FF, $38, $10, $0F ; $04
	.db $FF, $30, $25, $0F ; $08
	; Underground
	.db $FF, $30, $16, $02 ; $0C
	.db $FF, $38, $10, $02 ; $10
	.db $FF, $30, $25, $02 ; $14
	; Boss
	.db $FF, $30, $16, $0F ; $18
	.db $FF, $30, $10, $0F ; $1C
	.db $FF, $30, $2A, $0F ; $20
IFDEF EXPAND_TABLES
	unusedSpace World7SpritePalettes + $30, $FF
ENDIF

; -----


;
; ## Ground appearance tiles
;
; The ground setting defines a single column (or row, for vertical areas) where each row (or column)
; is be one of four tiles. That set of four tiles is the ground appearance. Each world has its own
; ground appearances defined, which are which are divided into horizontal and vertical sets.
;
; An area has its initial ground appearance set in the header, but it can be changed mid-area using
; the `$F6` special object.
;

;
; #### Ground appearance pointers
;
GroundTilesHorizontalLo:
	.db <World1GroundTilesHorizontal
	.db <World2GroundTilesHorizontal
	.db <World3GroundTilesHorizontal
	.db <World4GroundTilesHorizontal
	.db <World5GroundTilesHorizontal
	.db <World6GroundTilesHorizontal
	.db <World7GroundTilesHorizontal

GroundTilesVerticalLo:
	.db <World1GroundTilesVertical
	.db <World2GroundTilesVertical
	.db <World3GroundTilesVertical
	.db <World4GroundTilesVertical
	.db <World5GroundTilesVertical
	.db <World6GroundTilesVertical
	.db <World7GroundTilesVertical

GroundTilesHorizontalHi:
	.db >World1GroundTilesHorizontal
	.db >World2GroundTilesHorizontal
	.db >World3GroundTilesHorizontal
	.db >World4GroundTilesHorizontal
	.db >World5GroundTilesHorizontal
	.db >World6GroundTilesHorizontal
	.db >World7GroundTilesHorizontal

GroundTilesVerticalHi:
	.db >World1GroundTilesVertical
	.db >World2GroundTilesVertical
	.db >World3GroundTilesVertical
	.db >World4GroundTilesVertical
	.db >World5GroundTilesVertical
	.db >World6GroundTilesVertical
	.db >World7GroundTilesVertical

;
; #### Ground appearance tile definitions
;
; These are the tiles used to render the ground setting of an area.
; Each row in a world's table corresponds to the ground type.
;
; You'll notice that the first entry, which correponds to the sky/background is
; $00 instead of $40. This is skipped with a BEQ in WriteGroundSetTiles,
; presumably as an optimization, so the value doesn't matter!
;
World1GroundTilesHorizontal:
	.db $00, $99, $D5, $00 ; $00
	.db $00, $99, $99, $99 ; $01
	.db $00, $A0, $A0, $A0 ; $02
	.db $00, $A2, $A2, $A2 ; $03
	.db $00, $D6, $9B, $18 ; $04
	.db $00, $A0, $A0, $99 ; $05
	.db $00, $00, $00, $00 ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World1GroundTilesHorizontal + $40, $00
ENDIF

World1GroundTilesVertical:
	.db $00, $9D, $9E, $C6 ; $00
	.db $00, $05, $A0, $00 ; $01
	.db $00, $00, $00, $00 ; $02
	.db $00, $00, $A2, $00 ; $03
	.db $00, $00, $C2, $00 ; $04
	.db $00, $00, $A0, $00 ; $05
	.db $00, $93, $9E, $C6 ; $06
	.db $00, $40, $9E, $C6 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World1GroundTilesVertical + $40, $00
ENDIF

World2GroundTilesHorizontal:
	.db $00, $99, $99, $99 ; $00
	.db $00, $8A, $8A, $8A ; $01
	.db $00, $8B, $8B, $8B ; $02
	.db $00, $A0, $A0, $A0 ; $03
	.db $00, $A2, $A2, $A2 ; $04
	.db $00, $D6, $9B, $18 ; $05
	.db $00, $00, $00, $00 ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World2GroundTilesHorizontal + $40, $00
ENDIF

World2GroundTilesVertical:
	.db $00, $9D, $9E, $C6 ; $00
	.db $00, $93, $A0, $00 ; $01
	.db $00, $40, $9B, $40 ; $02
	.db $00, $93, $9E, $C6 ; $03
	.db $00, $40, $9E, $C6 ; $04
	.db $00, $00, $00, $00 ; $05
	.db $00, $00, $00, $00 ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World2GroundTilesVertical + $40, $00
ENDIF

World3GroundTilesHorizontal:
	.db $00, $99, $D5, $00 ; $00
	.db $00, $99, $99, $99 ; $01
	.db $00, $A0, $A0, $A0 ; $02
	.db $00, $A2, $A2, $A2 ; $03
	.db $00, $D6, $9B, $18 ; $04
	.db $00, $A0, $A0, $99 ; $05
	.db $00, $00, $00, $00 ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World3GroundTilesHorizontal + $40, $00
ENDIF

World3GroundTilesVertical:
	.db $00, $C6, $9E, $9D ; $00
	.db $00, $05, $A0, $00 ; $01
	.db $00, $93, $9E, $C6 ; $02
	.db $00, $00, $A2, $00 ; $03
	.db $00, $00, $C2, $00 ; $04
	.db $00, $00, $A0, $00 ; $05
	.db $00, $40, $9E, $C6 ; $06
	.db $00, $06, $A0, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World3GroundTilesVertical + $40, $00
ENDIF

World4GroundTilesHorizontal:
	.db $00, $99, $D5, $00 ; $00
	.db $00, $99, $16, $00 ; $01
	.db $00, $A0, $A0, $A0 ; $02
	.db $00, $A2, $A2, $A2 ; $03
	.db $00, $D6, $9B, $18 ; $04
	.db $00, $0A, $0A, $08 ; $05
	.db $00, $1F, $1F, $1F ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World4GroundTilesHorizontal + $40, $00
ENDIF

World4GroundTilesVertical:
	.db $00, $C6, $99, $9D ; $00
	.db $00, $A2, $A2, $A2 ; $01
	.db $00, $9B, $9B, $9B ; $02
	.db $00, $A0, $A0, $A0 ; $03
	.db $00, $D6, $D6, $D6 ; $04
	.db $00, $18, $18, $18 ; $05
	.db $00, $00, $00, $00 ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World4GroundTilesVertical + $40, $00
ENDIF

World5GroundTilesHorizontal:
	.db $00, $99, $D5, $40 ; $00
	.db $00, $99, $99, $99 ; $01
	.db $00, $A0, $A0, $A0 ; $02
	.db $00, $A2, $A2, $A2 ; $03
	.db $00, $D6, $9B, $18 ; $04
	.db $00, $A0, $A0, $99 ; $05
	.db $00, $00, $00, $00 ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World5GroundTilesHorizontal + $40, $00
ENDIF

World5GroundTilesVertical:
	.db $00, $9D, $9E, $C6 ; $00
	.db $00, $05, $A0, $00 ; $01
	.db $00, $40, $A4, $00 ; $02
	.db $00, $00, $A2, $00 ; $03
	.db $00, $00, $C2, $00 ; $04
	.db $00, $00, $A0, $00 ; $05
	.db $00, $93, $9E, $C6 ; $06
	.db $00, $40, $9E, $C6 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World5GroundTilesVertical + $40, $00
ENDIF

World6GroundTilesHorizontal:
	.db $00, $99, $99, $99 ; $00
	.db $00, $8A, $8A, $8A ; $01
	.db $00, $8B, $8B, $8B ; $02
	.db $00, $A0, $A0, $A0 ; $03
	.db $00, $A2, $A2, $A2 ; $04
	.db $00, $D6, $9B, $18 ; $05
	.db $00, $00, $00, $00 ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World6GroundTilesHorizontal + $40, $00
ENDIF

World6GroundTilesVertical:
	.db $00, $9D, $9E, $C6 ; $00
	.db $00, $93, $A0, $00 ; $01
	.db $00, $40, $18, $40 ; $02
	.db $00, $93, $9E, $C6 ; $03
	.db $00, $40, $9E, $C6 ; $04
	.db $00, $00, $00, $00 ; $05
	.db $00, $00, $00, $00 ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World6GroundTilesVertical + $40, $00
ENDIF

World7GroundTilesHorizontal:
	.db $00, $9C, $9C, $9C ; $00
	.db $00, $D7, $9C, $19 ; $01
	.db $00, $00, $00, $00 ; $02
	.db $00, $00, $00, $00 ; $03
	.db $00, $00, $00, $00 ; $04
	.db $00, $00, $00, $00 ; $05
	.db $00, $00, $00, $00 ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World7GroundTilesHorizontal + $40, $00
ENDIF

World7GroundTilesVertical:
	.db $00, $9C, $9C, $9C ; $00
	.db $00, $05, $A0, $00 ; $01
	.db $00, $00, $00, $00 ; $02
	.db $00, $00, $9C, $00 ; $03
	.db $00, $00, $C2, $00 ; $04
	.db $00, $00, $A0, $00 ; $05
	.db $00, $00, $00, $00 ; $06
	.db $00, $00, $00, $00 ; $07
IFDEF EXPAND_TABLES
	unusedSpace World7GroundTilesVertical + $40, $00
ENDIF

; -----


;
; ## Tile quads (unused)
;
; These appear to be duplicates of the tile quads from bank F.
;
UnusedTileQuadPointersLo:
	.db <UnusedTileQuads1
	.db <UnusedTileQuads2
	.db <UnusedTileQuads3
	.db <UnusedTileQuads4

UnusedTileQuadPointersHi:
	.db >UnusedTileQuads1
	.db >UnusedTileQuads2
	.db >UnusedTileQuads3
	.db >UnusedTileQuads4

UnusedTileQuads1:
	.db $FE,$FE,$FE,$FE ; $00
	.db $B4,$B6,$B5,$B7 ; $04
	.db $B8,$FA,$B9,$FA ; $08
	.db $FA,$FA,$B2,$B3 ; $0C
	.db $BE,$BE,$BF,$BF ; $10
	.db $BF,$BF,$BF,$BF ; $14
	.db $4A,$4A,$4B,$4B ; $18
	.db $5E,$5F,$5E,$5F ; $1C
	.db $E8,$E8,$A9,$A9 ; $20
	.db $46,$FC,$46,$FC ; $24
	.db $A9,$A9,$A9,$A9 ; $28
	.db $FC,$FC,$FC,$FC ; $2C
	.db $E9,$E9,$A9,$A9 ; $30
	.db $FC,$48,$FC,$48 ; $34
	.db $11,$11,$11,$11 ; $38
	.db $22,$22,$22,$22 ; $3C
	.db $33,$33,$33,$33 ; $40
	.db $E8,$EB,$A9,$A9 ; $44
	.db $74,$76,$75,$77 ; $48
	.db $98,$9A,$99,$9B ; $4C
	.db $9C,$9A,$9D,$9B ; $50
	.db $9C,$9E,$9B,$9F ; $54
	.db $58,$5A,$59,$5B ; $58
	.db $5E,$5F,$5E,$5F ; $5C
	.db $8E,$8F,$8F,$8E ; $60
	.db $72,$73,$73,$72 ; $64
	.db $A6,$A6,$A7,$A7 ; $68
	.db $92,$93,$93,$92 ; $6C
	.db $74,$76,$75,$77 ; $70
	.db $70,$72,$71,$73 ; $74
	.db $71,$73,$71,$73 ; $78
	.db $24,$26,$25,$27 ; $7C
	.db $32,$34,$33,$35 ; $80
	.db $33,$35,$33,$35 ; $84
	.db $24,$26,$25,$27 ; $88

UnusedTileQuads2:
	.db $FA,$FA,$FA,$FA ; $00
	.db $FA,$FA,$FA,$FA ; $04
	.db $FA,$FA,$FA,$FA ; $08
	.db $FA,$FA,$B0,$B1 ; $0C
	.db $FA,$FA,$B0,$B1 ; $10
	.db $FA,$FA,$B0,$B1 ; $14
	.db $FA,$FA,$B0,$B1 ; $18
	.db $FA,$FA,$B0,$B1 ; $1C
	.db $FA,$FA,$B0,$B1 ; $20
	.db $FA,$FA,$B0,$B1 ; $24
	.db $FA,$FA,$B0,$B1 ; $28
	.db $FA,$FA,$B0,$B1 ; $2C
	.db $FA,$FA,$B0,$B1 ; $30
	.db $FA,$FA,$B0,$B1 ; $34
	.db $A0,$A2,$A1,$A3 ; $38
	.db $80,$82,$81,$83 ; $3C
	.db $F4,$86,$F5,$87 ; $40
	.db $84,$86,$85,$87 ; $44
	.db $FC,$FC,$FC,$FC ; $48
	.db $AD,$FB,$AC,$AD ; $4C
	.db $AC,$AC,$AC,$AC ; $50
	.db $FB,$3B,$3B,$AC ; $54
	.db $FC,$FC,$FC,$FC ; $58
	.db $F4,$86,$F5,$87 ; $5C
	.db $FB,$49,$49,$FB ; $60
	.db $FE,$FE,$FE,$FE ; $64
	.db $FE,$FE,$6D,$FE ; $68
	.db $3C,$3E,$3D,$3F ; $6C
	.db $58,$FD,$59,$5A ; $70
	.db $5B,$5A,$FD,$FD ; $74
	.db $5B,$5C,$FD,$5D ; $78
	.db $FD,$FD,$5B,$5A ; $7C
	.db $6C,$FE,$FE,$FE ; $80
	.db $FE,$FE,$FE,$FE ; $84
	.db $FE,$6E,$FE,$6F ; $88
	.db $20,$22,$21,$23 ; $8C
	.db $6E,$6F,$70,$71 ; $90
	.db $57,$57,$FB,$FB ; $94
	.db $57,$57,$FE,$FE ; $98
	.db $D3,$D3,$FB,$FB ; $9C
	.db $D2,$D2,$FB,$FB ; $A0
	.db $7C,$7E,$7D,$7F ; $A4
	.db $CA,$CC,$CB,$CD ; $A8
	.db $CA,$CC,$CB,$CD ; $AC
	.db $C0,$C2,$C1,$C3 ; $B0
	.db $2C,$2E,$2D,$2F ; $B4
	.db $8E,$8F,$8F,$8E ; $B8
	.db $88,$8A,$89,$8B ; $BC
	.db $89,$8B,$89,$8B ; $C0
	.db $89,$8B,$8C,$8D ; $C4
	.db $88,$8A,$8C,$8D ; $C8
	.db $88,$8A,$89,$8B ; $CC
	.db $88,$8A,$89,$8B ; $D0
	.db $6A,$6C,$6B,$6D ; $D4
	.db $6C,$6C,$6D,$6D ; $D8
	.db $6C,$6E,$6D,$6F ; $DC
	.db $6C,$54,$6D,$55 ; $E0
	.db $32,$34,$33,$35 ; $E4
	.db $33,$35,$33,$35 ; $E8

UnusedTileQuads3:
	.db $94,$95,$94,$95 ; $00
	.db $96,$97,$96,$97 ; $04
	.db $48,$49,$48,$49 ; $08
	.db $FE,$FE,$FE,$FE ; $0C
	.db $FB,$32,$32,$33 ; $10
	.db $33,$33,$33,$33 ; $14
	.db $FD,$FD,$FD,$FD ; $18
	.db $34,$FB,$FD,$34 ; $1C
	.db $FB,$30,$FB,$FB ; $20
	.db $FB,$FB,$31,$FB ; $24
	.db $D0,$D0,$D0,$D0 ; $28
	.db $D1,$D1,$D1,$D1 ; $2C
	.db $64,$66,$65,$67 ; $30
	.db $68,$6A,$69,$6B ; $34
	.db $FA,$6C,$FA,$6C ; $38
	.db $6D,$FA,$6D,$FA ; $3C
	.db $92,$93,$93,$92 ; $40
	.db $AE,$AF,$AE,$AF ; $44
	.db $78,$7A,$79,$7B ; $48
	.db $A8,$A8,$AF,$AE ; $4C
	.db $94,$95,$94,$95 ; $50
	.db $96,$97,$96,$97 ; $54
	.db $22,$24,$23,$25 ; $58
	.db $92,$93,$93,$92 ; $5C
	.db $50,$51,$50,$51 ; $60
	.db $AE,$AF,$AE,$AF ; $64
	.db $50,$51,$50,$51 ; $68
	.db $8E,$8F,$8F,$8E ; $6C
	.db $72,$73,$73,$72 ; $70
	.db $50,$52,$51,$53 ; $74
	.db $FD,$FD,$FD,$FD ; $78
	.db $FB,$36,$36,$4F ; $7C
	.db $4F,$4E,$4E,$4F ; $80
	.db $4E,$4F,$4F,$4E ; $84
	.db $92,$93,$93,$92 ; $88
	.db $8E,$8F,$8F,$8E ; $8C
	.db $44,$45,$45,$44 ; $90
	.db $4F,$37,$4E,$FE ; $94
	.db $4F,$3A,$4E,$FE ; $98
	.db $4F,$4E,$37,$38 ; $9C
	.db $4A,$4B,$FE,$FE ; $A0
	.db $72,$73,$4A,$4B ; $A4
	.db $40,$42,$41,$43 ; $A8
	.db $41,$43,$41,$43 ; $AC

UnusedTileQuads4:
	.db $40,$42,$41,$43 ; $00
	.db $40,$42,$41,$43 ; $04
	.db $BA,$BC,$BB,$BD ; $08
	.db $BA,$BC,$90,$91 ; $0C
	.db $FA,$FA,$FA,$FA ; $10
	.db $FA,$FA,$FA,$FA ; $14
	.db $FD,$FD,$FD,$FD ; $18
	.db $61,$63,$61,$63 ; $1C
	.db $65,$63,$65,$63 ; $20
	.db $65,$67,$65,$67 ; $24
	.db $60,$62,$61,$63 ; $28
	.db $32,$34,$33,$35 ; $2C
	.db $64,$62,$65,$63 ; $30
	.db $36,$34,$37,$35 ; $34
	.db $64,$66,$65,$67 ; $38
	.db $36,$38,$37,$39 ; $3C
	.db $68,$62,$61,$63 ; $40
	.db $64,$69,$65,$67 ; $44
	.db $46,$62,$61,$63 ; $48
	.db $64,$47,$65,$67 ; $4C
	.db $BA,$BC,$BB,$BD ; $50
	.db $70,$72,$71,$73 ; $54
	.db $8E,$8F,$8F,$8E ; $58
	.db $72,$73,$73,$72 ; $5C
	.db $44,$45,$45,$44 ; $60

; -----


;
; ## Object creation routine selection
;
; Object types are grouped into `$10` value ranges, where the upper nybble determines which routine
; or jump table to use.
;

;
; ### Length-based object table
;
; The `$3X-$FX` range is used for objects that specify a type in the upper nybble and length in the
; lower nybble, including runs of horizontal or vertical blocks, platforms, and waterfalls.
;
CreateObjects_30thruF0:
	JSR JumpToTableAfterJump

	.dw CreateObject_HorizontalBlocks ; $3X
	.dw CreateObject_HorizontalBlocks ; $4X
	.dw CreateObject_HorizontalBlocks ; $5X
	.dw CreateObject_HorizontalBlocks ; $6X
	.dw CreateObject_HorizontalBlocks ; $7X
	.dw CreateObject_VerticalBlocks ; $8X
	.dw CreateObject_VerticalBlocks ; $9X
	.dw CreateObject_VerticalBlocks ; $AX
IFNDEF ENABLE_LEVEL_OBJECT_MODE
	.dw CreateObject_WhaleOrDrawBridgeChain ; $BX
	.dw CreateObject_JumpthroughPlatform ; $CX
ELSE
	.dw CreateObject_Platform_BX ; $BX
	.dw CreateObject_Platform_CX ; $CX
ENDIF
	.dw CreateObject_HorizontalPlatform ; $DX
	.dw CreateObject_HorizontalPlatform ; $EX
	.dw CreateObject_WaterfallOrFrozenRocks ; $FX

;
; ### Single object tables
;
; The `$0X-$2X` range is used for various single-block and one-off objects, such a mushroom blocks,
; standable vines, doors, and vertical objects that extend all the way to the ground.
;
CreateObjects_00:
	JSR JumpToTableAfterJump

	.dw CreateObject_SingleBlock ; $00
	.dw CreateObject_SingleBlock ; $01
	.dw CreateObject_SingleBlock ; $02
	.dw CreateObject_SingleBlock ; $03
	.dw CreateObject_SingleBlock ; $04
IFNDEF LEVEL_ENGINE_UPGRADES
	.dw CreateObject_SingleBlock ; $05
ELSE
	.dw CreateObject_StandableAutomatic ; $05
ENDIF
	.dw CreateObject_Vase ; $06
	.dw CreateObject_Vase ; $07
	.dw CreateObject_Vase ; $08
	.dw CreateObject_Door ; $09
	.dw CreateObject_Door ; $0A
	.dw CreateObject_Door ; $0B
	.dw CreateObject_Vine ; $0C
	.dw CreateObject_Vine ; $0D
	.dw CreateObject_StarBackground ; $0E
	.dw CreateObject_Pillar ; $0F

CreateObjects_10:
	LDA byte_RAM_50E
	JSR JumpToTableAfterJump

	.dw CreateObject_BigCloud ; $10
	.dw CreateObject_SmallCloud ; $11
	.dw CreateObject_VineBottom ; $12
	.dw CreateObject_LightEntranceRight ; $13
	.dw CreateObject_LightEntranceLeft ; $14
	.dw CreateObject_Tall ; $15
	.dw CreateObject_Tall ; $16
	.dw CreateObject_Pyramid ; $17
	.dw CreateObject_Wall ; $18
	.dw CreateObject_Wall ; $19
	.dw CreateObject_Horn ; $1A
	.dw CreateObject_DrawBridgeChain ; $1B
	.dw CreateObject_Door ; $1C
	.dw CreateObject_Door ; $1D
	.dw CreateObject_RockWallEntrance ; $1E
	.dw CreateObject_TreeBackground ; $1F

CreateObjects_20:
	JMP CreateObject_SingleObject


;
; ## World object tiles
;
; The repeating blocks in the `$3X-$AX` range are specified per world in these
; lookup tables. Each world has 4 values for each object type, which are
; selected using byte 3 of the area header.
;
; `$3X-$9X` is specified using `%......XX` in byte 3 of the header.
; `$AX` (ladder/chain) is specified using `%....XX..` in byte 3 of the header.
;

WorldObjectTilePointersLo:
	.db <World1ObjectTiles
	.db <World2ObjectTiles
	.db <World3ObjectTiles
	.db <World4ObjectTiles
	.db <World5ObjectTiles
	.db <World6ObjectTiles
	.db <World7ObjectTiles

WorldObjectTilePointersHi:
	.db >World1ObjectTiles
	.db >World2ObjectTiles
	.db >World3ObjectTiles
	.db >World4ObjectTiles
	.db >World5ObjectTiles
	.db >World6ObjectTiles
	.db >World7ObjectTiles

World1ObjectTiles:
	.db $97, $92, $12, $12 ; 3X (horizontal jump-through block)
	.db $1C, $99, $1C, $1C ; 4X (horizontal solid block)
	.db $45, $45, $45, $45 ; 5X (small veggie grass)
	.db $65, $65, $65, $65 ; 6X (bridge)
	.db $1A, $1A, $1A, $1A ; 7X (spikes)
	.db $A0, $00, $9D, $A2 ; 8X (vertical wall, eg. rock, bombable)
	.db $A0, $A0, $A0, $A0 ; 9X (vertical wall, eg. rock with angle)
	.db $80, $07, $81, $80 ; AX (ladder, chain)
	.db $81, $81, $81, $81 ; AX over background (ladder with shadow)

World2ObjectTiles:
	.db $96, $92, $93, $12 ; 3X (horizontal jump-through block)
	.db $1C, $1C, $1C, $1C ; 4X (horizontal solid block)
	.db $45, $45, $45, $45 ; 5X (small veggie grass)
	.db $65, $65, $65, $65 ; 6X (bridge)
	.db $1A, $1A, $1A, $1A ; 7X (spikes)
	.db $A0, $40, $9D, $18 ; 8X (vertical wall, eg. rock, bombable)
	.db $A0, $A0, $A0, $A0 ; 9X (vertical wall, eg. rock with angle)
	.db $80, $07, $81, $80 ; AX (ladder, chain)
	.db $81, $81, $81, $81 ; AX over background (ladder with shadow)

World3ObjectTiles:
	.db $97, $92, $12, $12 ; 3X (horizontal jump-through block)
	.db $1C, $99, $A0, $1C ; 4X (horizontal solid block)
	.db $45, $45, $45, $45 ; 5X (small veggie grass)
	.db $65, $65, $65, $65 ; 6X (bridge)
	.db $1A, $1A, $1A, $1A ; 7X (spikes)
	.db $A0, $00, $9D, $A2 ; 8X (vertical wall, eg. rock, bombable)
	.db $A0, $A0, $A0, $A0 ; 9X (vertical wall, eg. rock with angle)
	.db $80, $07, $81, $80 ; AX (ladder, chain)
	.db $81, $81, $81, $81 ; AX over background (ladder with shadow)

World4ObjectTiles:
	.db $16, $92, $16, $12 ; 3X (horizontal jump-through block)
	.db $1C, $99, $A2, $18 ; 4X (horizontal solid block)
	.db $45, $45, $45, $45 ; 5X (small veggie grass)
	.db $65, $65, $65, $65 ; 6X (bridge)
	.db $1A, $1A, $1A, $1A ; 7X (spikes)
	.db $A0, $1F, $9D, $18 ; 8X (vertical wall, eg. rock, bombable)
	.db $A0, $A0, $A0, $A0 ; 9X (vertical wall, eg. rock with angle)
	.db $80, $07, $81, $80 ; AX (ladder, chain)
	.db $81, $81, $81, $81 ; AX over background (ladder with shadow)

World5ObjectTiles:
	.db $97, $92, $12, $12 ; 3X (horizontal jump-through block)
	.db $1C, $99, $1C, $1C ; 4X (horizontal solid block)
	.db $45, $45, $45, $45 ; 5X (small veggie grass)
	.db $65, $65, $65, $65 ; 6X (bridge)
	.db $1A, $1A, $1A, $1A ; 7X (spikes)
	.db $A0, $A4, $9D, $18 ; 8X (vertical wall, eg. rock, bombable)
	.db $A0, $A0, $A0, $A0 ; 9X (vertical wall, eg. rock with angle)
	.db $80, $07, $81, $80 ; AX (ladder, chain)
	.db $81, $81, $81, $81 ; AX over background (ladder with shadow)

World6ObjectTiles:
	.db $96, $92, $93, $12 ; 3X (horizontal jump-through block)
	.db $1C, $1C, $1C, $1C ; 4X (horizontal solid block)
	.db $45, $45, $45, $45 ; 5X (small veggie grass)
	.db $65, $65, $65, $65 ; 6X (bridge)
	.db $1A, $1A, $1A, $1A ; 7X (spikes)
	.db $A0, $40, $9D, $18 ; 8X (vertical wall, eg. rock, bombable)
	.db $A0, $A0, $A0, $A0 ; 9X (vertical wall, eg. rock with angle)
	.db $80, $07, $81, $80 ; AX (ladder, chain)
	.db $81, $81, $81, $81 ; AX over background (ladder with shadow)

World7ObjectTiles:
	.db $12, $68, $12, $9D ; 3X (horizontal jump-through block)
	.db $9C, $67, $64, $69 ; 4X (horizontal solid block)
	.db $45, $45, $45, $45 ; 5X (small veggie grass)
	.db $65, $65, $65, $65 ; 6X (bridge)
	.db $1A, $1A, $1A, $1A ; 7X (spikes)
	.db $9C, $9C, $9C, $9C ; 8X (vertical wall, eg. rock, bombable)
	.db $A0, $A0, $A0, $A0 ; 9X (vertical wall, eg. rock with angle)
	.db $80, $07, $81, $80 ; AX (ladder, chain)
	.db $81, $81, $81, $81 ; AX over background (ladder with shadow)


;
; ## Object creation routines
;
; These routines are responsible for turning an object in the level data into a set of tiles that
; are applied to the raw tile buffer.
;
; Some are specific one-offs to draw a particular object, where as otherws are generic routines,
; such as drawing an _n_-tile row or column of tile _x_. Many fall somewhere in-between.
;

IFDEF LEVEL_ENGINE_UPGRADES
;
; #### Automatic climbable tile generation
;
ClimbableTileSearch:
	.db BackgroundTile_LadderShadow
	.db BackgroundTile_Ladder
	.db BackgroundTile_Chain
	.db BackgroundTile_Vine

ClimbableTilePlatform:
	.db BackgroundTile_LadderStandableShadow
	.db BackgroundTile_LadderStandable
	.db BackgroundTile_ChainStandable
	.db BackgroundTile_VineStandable


;
; Find the corresponding climbable tile
;
; ##### Input
; - `A`: search tile
;
; ##### Output
; - `A`: replace tile
; - `C`: set if a match was found
;
FindClimableTile:
	STX byte_RAM_7
	LDX #(ClimbableTilePlatform - ClimbableTileSearch - 1)

FindClimableTile_Loop:
	CMP ClimbableTileSearch, X
	BEQ FindClimableTile_LoadReplacement

	DEX
	BPL FindClimableTile_Loop

	LDX byte_RAM_7
	CLC
	RTS

FindClimableTile_LoadReplacement:
	LDA ClimbableTilePlatform, X
	LDX byte_RAM_7
	RTS

;
; Creates a climbable tile that you can stand on based on ObjectTypeAXthruFX
;
; ##### Output
; - `A`: tile that was written
;
CreateObject_StandableObjectType:
	LDA ObjectTypeAXthruFX
	BEQ CreateObject_StandableObjectType_TableOffset

	; Offset for shadow
	CLC
	ADC #$04

CreateObject_StandableObjectType_TableOffset:
	; Offset to ladder/chain object definition
	ADC #$1C
	TAX

	LDY byte_RAM_E7
	STX byte_RAM_7
	STY byte_RAM_8
	LDX CurrentWorldTileset
	LDA WorldObjectTilePointersLo, X
	STA byte_RAM_C
	LDA WorldObjectTilePointersHi, X
	STA byte_RAM_D
	LDY byte_RAM_7
	LDA (byte_RAM_C), Y
	LDY byte_RAM_8
	LDX byte_RAM_7

	JSR FindClimableTile

	STA (byte_RAM_1), Y
	RTS

;
; Creates a climbable tile that you can stand on based on the based on the tile underneath.
;
; ##### Output
; - `A`: tile that was written
;
CreateObject_StandableAutomatic:
	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y

	JSR FindClimableTile
	BCC CreateObject_StandableObjectType

	STA (byte_RAM_1), Y
	RTS
ENDIF


;
; Places a tile using the world-specific tile lookup table.
;
; ##### Input
; - `Y`: destination tile
; - `byte_RAM_50E`: type of object to create (upper nybble of level object minus 3)
;
;     ```
;     $00 = jumpthrough block
;     $01 = solid block
;     $02 = grass
;     $03 = bridge
;     $04 = spikes
;     $05 = vertical rock
;     $06 = vertical rock with angle
;     $07 = ladder
;     $08 = whale
;     $09 = jumpthrough platform
;     $0A = log platform
;     $0B = cloud platform
;     $0C = waterfall
;     ```
;
; ##### Output
; - `A`: tile that was written
;
CreateWorldSpecificTile:
	LDA byte_RAM_50E
	ASL A
	ASL A
	STA byte_RAM_F
	LDA byte_RAM_50E
	CMP #$07
	BCC CreateWorldSpecificTile_3Xthru9X

CreateWorldSpecificTile_AXthruFX:
	LDA ObjectTypeAXthruFX
	JMP CreateWorldSpecificTile_ApplyObjectType

CreateWorldSpecificTile_3Xthru9X:
	LDA ObjectType3Xthru9X

CreateWorldSpecificTile_ApplyObjectType:
	CLC
	ADC byte_RAM_F
	TAX
	LDA byte_RAM_50E
	CMP #$03
	BNE CreateWorldSpecificTile_LookUpTile

	; bridge casts a shadow on background bricks
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_BackgroundBrick
	BNE CreateWorldSpecificTile_LookUpTile

	LDA #BackgroundTile_BridgeShadow
	BNE CreateWorldSpecificTile_Exit

CreateWorldSpecificTile_LookUpTile:
	STX byte_RAM_7
	STY byte_RAM_8
	LDX CurrentWorldTileset
	LDA WorldObjectTilePointersLo, X
	STA byte_RAM_C
	LDA WorldObjectTilePointersHi, X
	STA byte_RAM_D
	LDY byte_RAM_7
	LDA (byte_RAM_C), Y
	LDY byte_RAM_8
	LDX byte_RAM_7

CreateWorldSpecificTile_Exit:
	STA (byte_RAM_1), Y
	RTS


;
; Creates a horizontal run of blocks
;
; ##### Input
; - `byte_RAM_50D`: number of blocks to create
; - `byte_RAM_E7`: target tile placement offset
;
CreateObject_HorizontalBlocks:
	LDY byte_RAM_E7

CreateObject_HorizontalBlocks_Loop:
	JSR CreateWorldSpecificTile

	JSR IncrementAreaXOffset

	DEC byte_RAM_50D
	BPL CreateObject_HorizontalBlocks_Loop

	RTS


;
; Creates a light entrance with the trail facing right
;
; World 6 has some extra logic to make the entrance extend down to the floor.
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
;
CreateObject_LightEntranceRight:
	LDA CurrentWorldTileset
	CMP #$05
	BNE CreateObject_LightEntranceRight_NotWorld6

	JMP CreateObject_LightEntranceRight_World6

CreateObject_LightEntranceRight_NotWorld6:
	LDY byte_RAM_E7
	LDA #BackgroundTile_LightDoor
	STA (byte_RAM_1), Y
	INY
	LDA #BackgroundTile_LightTrailRight
	STA (byte_RAM_1), Y
	LDA byte_RAM_E7
	CLC
	ADC #$10
	TAY
	LDA #BackgroundTile_LightDoor
	STA (byte_RAM_1), Y
	INY
	LDA #BackgroundTile_LightTrail
	STA (byte_RAM_1), Y
	INY
	LDA #BackgroundTile_LightTrailRight
	STA (byte_RAM_1), Y

IFNDEF DISABLE_DOOR_POINTERS
	LDA CurrentWorld
	CMP #$05
	BEQ CreateObject_LightEntranceRight_World6or7Exit

	LDA CurrentWorld
	CMP #$06
	BEQ CreateObject_LightEntranceRight_World6or7Exit

	JSR LevelParser_EatDoorPointer
ENDIF

CreateObject_LightEntranceRight_World6or7Exit:
	RTS

CreateObject_LightEntranceRight_World6:
	LDY byte_RAM_E7
	LDA #$00
	STA byte_RAM_8

CreateObject_LightEntranceRight_World6Loop:
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE CreateObject_LightEntranceRight_World6_Exit

	LDA #BackgroundTile_LightDoor
	STA (byte_RAM_1), Y
	LDA byte_RAM_8
	TAX

CreateObject_LightEntranceRight_World6InnerLoop:
	CPX #$00
	BEQ CreateObject_LightEntranceRight_World6_TrailRight

	INY
	LDA #BackgroundTile_LightTrail
	STA (byte_RAM_1), Y
	DEX
	JMP CreateObject_LightEntranceRight_World6InnerLoop

CreateObject_LightEntranceRight_World6_TrailRight:
	INY
	LDA #BackgroundTile_LightTrailRight
	STA (byte_RAM_1), Y
	INC byte_RAM_8
	LDY byte_RAM_E7
	TYA
	CLC
	ADC #$10
	TAY
	STA byte_RAM_E7
	JMP CreateObject_LightEntranceRight_World6Loop

CreateObject_LightEntranceRight_World6_Exit:
	RTS


;
; Creates a light entrance with the trail facing left
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
;
CreateObject_LightEntranceLeft:
	LDY byte_RAM_E7
	LDA #BackgroundTile_LightDoor
	STA (byte_RAM_1), Y
	DEY
	LDA #BackgroundTile_LightTrailLeft
	STA (byte_RAM_1), Y
	LDY byte_RAM_E7
	TYA
	CLC
	ADC #$10
	TAY
	LDA #BackgroundTile_LightDoor
	STA (byte_RAM_1), Y
	DEY
	LDA #BackgroundTile_LightTrail
	STA (byte_RAM_1), Y
	DEY
	LDA #BackgroundTile_LightTrailLeft
	STA (byte_RAM_1), Y

IFNDEF DISABLE_DOOR_POINTERS
	LDA CurrentWorld
	CMP #$05
	BEQ CreateObject_LightEntranceLeft_World6or7Exit

	LDA CurrentWorld
	CMP #$06
	BEQ CreateObject_LightEntranceLeft_World6or7Exit

	JSR LevelParser_EatDoorPointer
ENDIF

CreateObject_LightEntranceLeft_World6or7Exit:
	RTS


;
; Creates a vertical run of blocks.
;
; ##### Input
; - `byte_RAM_50D`: number of blocks to create
; - `byte_RAM_50E`: type of object to create (upper nybble of level object minus 3)
;
;     ```
;     $00 = jumpthrough block
;     $01 = solid block
;     $02 = grass
;     $03 = bridge
;     $04 = spikes
;     $05 = vertical rock
;     $06 = vertical rock with angle
;     $07 = ladder
;     $08 = whale
;     $09 = jumpthrough platform
;     $0A = log platform
;     $0B = cloud platform
;     $0C = waterfall
;     ```
; - `byte_RAM_E7`: target tile placement offset
;
CreateObject_VerticalBlocks:
	LDY byte_RAM_E7

IFNDEF LEVEL_ENGINE_UPGRADES
	LDA byte_RAM_50E
	CMP #$06
	BNE CreateObject_VerticalBlocks_NotClawGrip

	LDA CurrentLevel
	CMP #$0E
	BNE CreateObject_VerticalBlocks_NotClawGrip

	LDA CurrentLevelArea
	CMP #$05
	BNE CreateObject_VerticalBlocks_NotClawGrip

CreateObject_VerticalBlocks_ClawGripRockLoop:
	LDA #BackgroundTile_ClawGripRock
	STA (byte_RAM_1), Y
	JSR IncrementAreaYOffset

	DEC byte_RAM_50D
	BPL CreateObject_VerticalBlocks_ClawGripRockLoop

	RTS
ENDIF

CreateObject_VerticalBlocks_NotClawGrip:
	LDA byte_RAM_50E
	CMP #$06
	BNE CreateObject_VerticalBlocks_Normal

IFNDEF LEVEL_ENGINE_UPGRADES
	LDA #BackgroundTile_RockWallAngle
ELSE
	;
	; Use the previous tile for the top of the column UNLESS we're using a sky
	; tile or have set an object type for in the level header.
	;
	; This supports creating a normal vertical block run for $9X as well as the
	; special rock wall with an angled top.
	;
	LDX ObjectType3Xthru9X
	BNE CreateObject_VerticalBlocks_Normal
	JSR CreateWorldSpecificTile
	CMP #BackgroundTile_Sky
	BEQ CreateObject_VerticalBlocks_NextRow
	CLC
	SBC #$00
ENDIF
	STA (byte_RAM_1), Y
	JMP CreateObject_VerticalBlocks_NextRow

CreateObject_VerticalBlocks_Normal:
	JSR CreateWorldSpecificTile

CreateObject_VerticalBlocks_NextRow:
	JSR IncrementAreaYOffset

	DEC byte_RAM_50D
	BPL CreateObject_VerticalBlocks_Normal

	RTS


;
; Lookup tables for single blocks
;
; Each the lower nybble of the object type is used as the offset, except for the
; standable ladder, which is described in the subroutine below.
;
World1thru6SingleBlocks:
	.db BackgroundTile_MushroomBlock
	.db BackgroundTile_POWBlock
	.db BackgroundTile_BombableBrick
	.db BackgroundTile_VineStandable
	.db BackgroundTile_JarSmall
	.db BackgroundTile_LadderStandable
	.db BackgroundTile_LadderStandableShadow

World7SingleBlocks:
	.db BackgroundTile_MushroomBlock
	.db BackgroundTile_POWBlock
	.db BackgroundTile_BombableBrick
	.db BackgroundTile_ChainStandable
	.db BackgroundTile_JarSmall
	.db BackgroundTile_LadderStandable
	.db BackgroundTile_LadderStandableShadow


;
; Creates a single block
;
; ##### Input
; - `byte_RAM_50E`: object type to use as an offset in the lookup table
;
CreateObject_SingleBlock:
	LDA byte_RAM_50E
	TAX

;
; Object `$05` is a single ladder tile that the player can stand on.
;
; When `ObjectTypeAXthruFX` is set, it is given a shadow. This works by
; incrementing the offset by one so that object `$05` ends up using offset `$06`
; in the lookup table!
;
	CMP #$05
	BNE CreateObject_SingleBlock_NotLadderStandable

	LDA ObjectTypeAXthruFX
	BEQ CreateObject_SingleBlock_NotLadderStandable

	INX

CreateObject_SingleBlock_NotLadderStandable:
	LDY byte_RAM_E7
	; World 7 gets its own lookup table for climbable chains instead of vines
	LDA CurrentWorldTileset
	CMP #$06
	BNE CreateObject_SingleBlock_NotWorld7

CreateObject_SingleBlock_World7:
	LDA World7SingleBlocks, X
	JMP CreateObject_SingleBlock_Exit

CreateObject_SingleBlock_NotWorld7:
	LDA World1thru6SingleBlocks, X

CreateObject_SingleBlock_Exit:
	STA (byte_RAM_1), Y
	RTS


;
; Horizontal platform lookup tables. Choose between logs and clouds.
;
HorizontalPlatformLeftTiles:
	.db BackgroundTile_LogLeft
	.db BackgroundTile_CloudLeft
HorizontalPlatformMiddleTiles:
	.db BackgroundTile_LogMiddle
	.db BackgroundTile_CloudMiddle
HorizontalPlatformRightTiles:
	.db BackgroundTile_LogRight
	.db BackgroundTile_CloudRight

;
; Creates a horizontal platform with special tiles for the endcaps.
;
; The log platforms and jump-through cloud platforms both use this.
;
CreateObject_HorizontalPlatform:
	LDA CurrentWorldTileset
	CMP #$04
	BNE CreateObject_HorizontalPlatform_NotWorld5

	; In World 5, we want to do some special stuff to make the logs look like
	; branches coming out of the tree trunk background.
	JMP CreateObject_HorizontalPlatform_World5

CreateObject_HorizontalPlatform_NotWorld5:
	LDY byte_RAM_E7
	LDA byte_RAM_50E
	SEC
	SBC #$0A
	TAX
	LDA HorizontalPlatformLeftTiles, X
	STA (byte_RAM_1), Y
	DEC byte_RAM_50D
	BEQ CreateObject_HorizontalPlatform_Exit

CreateObject_HorizontalPlatform_Loop:
	JSR IncrementAreaXOffset

	LDA HorizontalPlatformMiddleTiles, X
	STA (byte_RAM_1), Y
	DEC byte_RAM_50D
	BNE CreateObject_HorizontalPlatform_Loop

CreateObject_HorizontalPlatform_Exit:
	JSR IncrementAreaXOffset

	LDA HorizontalPlatformRightTiles, X
	STA (byte_RAM_1), Y
	RTS


;
; Lookup table for the big green platforms.
;
GreenPlatformTiles:
	.db BackgroundTile_GreenPlatformTopLeft
	.db BackgroundTile_GreenPlatformTop
	.db BackgroundTile_GreenPlatformTopRight
	.db BackgroundTile_GreenPlatformLeft
	.db BackgroundTile_GreenPlatformMiddle
	.db BackgroundTile_GreenPlatformRight

; These are the background tiles that the green platforms are allowed to overwrite.
; Any other tiles will stop the green platform from extending to the bottom of the page.
GreenPlatformOverwriteTiles:
	.db BackgroundTile_Sky
	.db BackgroundTile_WaterfallTop
	.db BackgroundTile_Waterfall
IFDEF LEVEL_ENGINE_UPGRADES
	.db BackgroundTile_WaterfallSplash
	.db BackgroundTile_Water
	.db BackgroundTile_WaterTop
ENDIF
GreenPlatformTiles_End:


IFNDEF ENABLE_LEVEL_OBJECT_MODE
;
; Draws the typical green hill platforms in Worlds 1 through 6 or the mushroom
; house platforms in World 7.
;
CreateObject_JumpthroughPlatform:
	LDA CurrentWorldTileset
	CMP #$06
	BNE CreateObject_GreenJumpthroughPlatform

	JMP CreateObject_MushroomJumpthroughPlatform
ELSE
CreateObject_Platform_CX:
	LDA LevelObjectMode
	JSR JumpToTableAfterJump

	.dw CreateObject_GreenJumpthroughPlatform
	.dw CreateObject_GreenJumpthroughPlatform
	.dw CreateObject_Whale
	.dw CreateObject_MushroomJumpthroughPlatform
ENDIF


;
; #### Green platforms
;
; Creates the typical (usually) green hill platforms used throughout World 1 through 6.
;
; These platforms are allowed to overlap each other, but typically appear behind other tiles that
; are already present in the area.
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
; - `byte_RAM_E8`: area page
; - `byte_RAM_50D`: width of platform
;
CreateObject_GreenJumpthroughPlatform:
	; Start with a top-left tile.
	LDX #$00

CreateObject_GreenJumpthroughPlatform_Row:
	STX byte_RAM_B
	; Update the area page.
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	; These two lines seem like leftovers.
	LDX #$05
	LDY byte_RAM_E7

	; Draw a left corner or side.
	LDX byte_RAM_B
	LDY byte_RAM_E7
	LDA byte_RAM_50D
	STA byte_RAM_7
	JSR CreateObject_GreenJumpthroughPlatformTile

	; Skip to the right side if we're drawing a short platform.
	INX
	LDA byte_RAM_7
	BEQ CreateObject_GreenJumpthroughPlatform_Right

	; Draw top or middle tiles.
CreateObject_GreenJumpthroughPlatform_Loop:
	JSR IncrementAreaXOffset

	JSR CreateObject_GreenJumpthroughPlatformTile

	BNE CreateObject_GreenJumpthroughPlatform_Loop

	; Draw right corner or side.
CreateObject_GreenJumpthroughPlatform_Right:
	JSR IncrementAreaXOffset

	INX
	JSR CreateObject_GreenJumpthroughPlatformTile

	; Exit if we've hit the bottom of the page.
	LDA byte_RAM_E7
	CLC
	ADC #$10
	CMP #$F0
	BCS CreateObject_GreenJumpthroughPlatform_Exit

	; Drawing a left side tile next.
	LDX #$03
	STA byte_RAM_E7
	JMP CreateObject_GreenJumpthroughPlatform_Row

CreateObject_GreenJumpthroughPlatform_Exit:
	RTS


;
; Lookup table for green platform overlap tiles.
;
; When drawing the top of a green platform, if the destination tile matches the compare tile, the
; corresponding left or right overlap tile will be drawn instead.
;
GreenPlatformOverlapCompareTiles:
	.db BackgroundTile_GreenPlatformLeft
	.db BackgroundTile_GreenPlatformMiddle
	.db BackgroundTile_GreenPlatformRight

GreenPlatformOverlapLeftTiles:
	.db BackgroundTile_GreenPlatformTopLeftOverlapEdge
	.db BackgroundTile_GreenPlatformTopLeftOverlap
	.db BackgroundTile_GreenPlatformTopLeftOverlap

GreenPlatformOverlapRightTiles:
	.db BackgroundTile_GreenPlatformTopRightOverlap
	.db BackgroundTile_GreenPlatformTopRightOverlap
	.db BackgroundTile_GreenPlatformTopRightOverlapEdge


;
; Draws a single tile of the green platform, taking into account the existing tile at the target.
;
; ##### Input
; - `X`: offset in `GreenPlatformTiles` table (0-2=top, 3-5=middle)
; - `Y`: raw data offset
;
CreateObject_GreenJumpthroughPlatformTile:
	STX byte_RAM_8
	TXA
	BNE CreateObject_GreenJumpthroughPlatformTile_NotTopLeft

	; Check if the top left corner requires a special tile
	LDX #(GreenPlatformOverlapLeftTiles - GreenPlatformOverlapCompareTiles - 1)
	LDA (byte_RAM_1), Y

CreateObject_GreenJumpthroughPlatformTile_TopLeftLoop:
	CMP GreenPlatformOverlapCompareTiles, X
	BEQ CreateObject_GreenJumpthroughPlatformTile_TopLeftMatch

	DEX
	BPL CreateObject_GreenJumpthroughPlatformTile_TopLeftLoop

	BMI CreateObject_GreenJumpthroughPlatformTile_CheckOverwrite

CreateObject_GreenJumpthroughPlatformTile_TopLeftMatch:
	LDA GreenPlatformOverlapLeftTiles, X
	BNE CreateObject_GreenJumpthroughPlatformTile_SetTile

CreateObject_GreenJumpthroughPlatformTile_NotTopLeft:
	LDX byte_RAM_8
	CPX #$02
	BNE CreateObject_GreenJumpthroughPlatformTile_CheckOverwrite

	; Check if the top right corner requires a special tile
	LDX #(GreenPlatformOverlapLeftTiles - GreenPlatformOverlapCompareTiles - 1)
	LDA (byte_RAM_1), Y

CreateObject_GreenJumpthroughPlatformTile_TopRightLoop:
	CMP GreenPlatformOverlapCompareTiles, X
	BEQ CreateObject_GreenJumpthroughPlatformTile_TopRightMatch

	DEX
	BPL CreateObject_GreenJumpthroughPlatformTile_TopRightLoop

	BMI CreateObject_GreenJumpthroughPlatformTile_CheckOverwrite

CreateObject_GreenJumpthroughPlatformTile_TopRightMatch:
	LDA GreenPlatformOverlapRightTiles, X
	BNE CreateObject_GreenJumpthroughPlatformTile_SetTile

	; Check if the target tile can be overwritten by a green platform
CreateObject_GreenJumpthroughPlatformTile_CheckOverwrite:
	LDX #(GreenPlatformTiles_End - GreenPlatformTiles - 1)

CreateObject_GreenJumpthroughPlatformTile_CheckOverwriteLoop:
	LDA (byte_RAM_1), Y
	CMP GreenPlatformTiles, X
	BEQ CreateObject_GreenJumpthroughPlatformTile_Overwrite

	DEX
	BPL CreateObject_GreenJumpthroughPlatformTile_CheckOverwriteLoop

	; Otherwise, we cannot overwrite this tile with a green platform.
	LDX byte_RAM_8
	JMP CreateObject_GreenJumpthroughPlatformTile_Exit

CreateObject_GreenJumpthroughPlatformTile_Overwrite:
	LDX byte_RAM_8
	LDA GreenPlatformTiles, X

CreateObject_GreenJumpthroughPlatformTile_SetTile:
	STA (byte_RAM_1), Y

CreateObject_GreenJumpthroughPlatformTile_Exit:
	LDX byte_RAM_8
	DEC byte_RAM_7
	RTS

; -----


;
; Lookup table for tall objects that extend to the ground.
;
TallObjectTopTiles:
	.db BackgroundTile_LightDoor
	.db BackgroundTile_PalmTreeTop

TallObjectBottomTiles:
	.db BackgroundTile_LightDoor
	.db BackgroundTile_PalmTreeTrunk


;
; #### Tall objects
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
; - `byte_RAM_50E`: type of object to create (lower nybble of level object minus 5)
;
; Creates a tree or light door object that extends down until it hits another tile.
;
CreateObject_Tall:
	LDA CurrentWorldTileset
	CMP #$04
	BNE CreateObject_Tall_NotWorld5
	JMP CreateObject_Tall_World5

CreateObject_Tall_NotWorld5:
	LDA byte_RAM_50E
	SEC
	SBC #$05
	STA byte_RAM_7
	TAX
	LDY byte_RAM_E7
	LDA TallObjectTopTiles, X
	STA (byte_RAM_1), Y

CreateObject_Tall_NotWorld5_Loop:
	JSR IncrementAreaYOffset

	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE CreateObject_Tall_NotWorld5_Exit

	LDX byte_RAM_7
	LDA TallObjectBottomTiles, X
	STA (byte_RAM_1), Y
	BNE CreateObject_Tall_NotWorld5_Loop

CreateObject_Tall_NotWorld5_Exit:
	RTS


;
; Lookup table for tall objects that extend to the ground in World 5.
;
World5TallObjectTopTiles:
	.db BackgroundTile_PalmTreeTop
	.db BackgroundTile_PalmTreeTop

World5TallObjectBottomTiles:
	.db BackgroundTile_PalmTreeTrunk
	.db BackgroundTile_PalmTreeTrunk


;
; ##### Tall objects (World 5)
;
; Other than the fact that this only renders palm trees and not doors, the only practical difference
; in this subroutine is that it will stop at the bottom of the screen if it doesn't encounter
; another tile beforehand.
;
; This appears to be a work-around for the palm trees in 5-2 that have vertical
; rock platforms beneath them. Since the rock comes later, tree trunk tiles would
; render all the way down to the screen and through to the next page!
;
; Using a new object layer would have achieved the same effect, but the
; developer decided to create this special case instead.
;
CreateObject_Tall_World5:
	LDX #$00
	LDA byte_RAM_50E
	CMP #$05
	BEQ CreateObject_Tall_World5_DoLookup

	INX

CreateObject_Tall_World5_DoLookup:
	STX byte_RAM_7
	LDY byte_RAM_E7
	LDA World5TallObjectTopTiles, X
	STA (byte_RAM_1), Y

CreateObject_Tall_World5_Loop:
	JSR IncrementAreaYOffset

	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE CreateObject_Tall_World5_Exit

	LDX byte_RAM_7
	LDA World5TallObjectBottomTiles, X
	STA (byte_RAM_1), Y
	CPY #$E0
	BCC CreateObject_Tall_World5_Loop

CreateObject_Tall_World5_Exit:
	RTS

; -----

;
; Creates the larger, two-tile-wide big cloud.
;
CreateObject_BigCloud:
	LDY byte_RAM_E7
	LDA #BackgroundTile_BgCloudLeft
	STA (byte_RAM_1), Y
	INY
	LDA #BackgroundTile_BgCloudRight
	STA (byte_RAM_1), Y
	RTS

; -----


;
; Creates a tiny, single-tile cloud.
;
CreateObject_SmallCloud:
	LDY byte_RAM_E7
	LDA #BackgroundTile_BgCloudSmall
	STA (byte_RAM_1), Y
	RTS

; -----


JarTopTiles:
	.db BackgroundTile_JarTopPointer
	.db BackgroundTile_JarTopGeneric
	.db BackgroundTile_JarTopNonEnterable


CreateObject_Vase:
	LDY byte_RAM_E7
	LDA byte_RAM_50E
	SEC
	SBC #$06
	TAX
	LDA JarTopTiles, X
	STA (byte_RAM_1), Y

CreateObject_Vase_Loop:
	JSR IncrementAreaYOffset

	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE CreateObject_Vase_Exit

	LDA #BackgroundTile_JarMiddle
	STA (byte_RAM_1), Y
	JMP CreateObject_Vase_Loop

CreateObject_Vase_Exit:
	TYA
	SEC
	SBC #$10
	TAY
	LDA #BackgroundTile_JarBottom
	STA (byte_RAM_1), Y
	RTS


;
; Creates a vine that extends downwards until it hits another tile.
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
; - `byte_RAM_50E`: type of object to create
;
CreateObject_Vine:
	LDY byte_RAM_E7
	LDA byte_RAM_50E
	; `$0D` is a vine with no top, so start right at the middle.
	CMP #$0D
	BEQ CreateObject_Vine_Middle

	LDA #BackgroundTile_VineTop
	STA (byte_RAM_1), Y

CreateObject_Vine_Loop:
	JSR IncrementAreaYOffset

CreateObject_Vine_Middle:
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE CreateObject_Vine_Exit

	LDA #BackgroundTile_Vine
	STA (byte_RAM_1), Y
	LDA IsHorizontalLevel
	BEQ CreateObject_Vine_Next

	; In horizontal areas, stop at the bottom of the screen.
	CPY #$E0
	BCS CreateObject_Vine_Exit

CreateObject_Vine_Next:
	JMP CreateObject_Vine_Loop

CreateObject_Vine_Exit:
	RTS

; -----


;
; Creates a vine that extends upwards until it hits another tile.
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset for the BOTTOM of the vine
;
CreateObject_VineBottom:
	LDY byte_RAM_E7
	LDA #BackgroundTile_VineBottom
	STA (byte_RAM_1), Y

CreateObject_VineBottom_Loop:
	; Stop at the top of the page.
	TYA
	SEC
	SBC #$10
	TAY
	CMP #$F0
	BCS CreateObject_VineBottom_Exit

	; Stop if we hit tile that isn't blank.
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE CreateObject_VineBottom_Exit

	; Draw a section of the vine
	LDA #BackgroundTile_Vine
	STA (byte_RAM_1), Y
	JMP CreateObject_VineBottom_Loop

CreateObject_VineBottom_Exit:
	RTS


;
; Lookup table for single object tiles.
;
SingleObjects:
	.db BackgroundTile_GrassCoin ; $20
	.db BackgroundTile_GrassLargeVeggie ; $21
	.db BackgroundTile_GrassSmallVeggie ; $22
	.db BackgroundTile_GrassRocket ; $23
	.db BackgroundTile_GrassShell ; $24
	.db BackgroundTile_GrassBomb ; $25
	.db BackgroundTile_GrassPotion ; $26
	.db BackgroundTile_Grass1UP ; $27
	.db BackgroundTile_GrassPow ; $28
	.db BackgroundTile_Cherry ; $29
	.db BackgroundTile_GrassBobOmb ; $2A
	.db BackgroundTile_SubspaceMushroom1 ; $2B
	.db BackgroundTile_Phanto ; $2C
	.db BackgroundTile_SubspaceMushroom2 ; $2D
	.db BackgroundTile_WhaleEye ; $2E
	; No entry for $2F in this table, so it uses tile $A4 due to the LDY below
IFDEF EXPAND_TABLES
	.db BackgroundTile_SolidWood ; $2F
ENDIF


;
; Creates a single tile object using the lookup table above.
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
; - `byte_RAM_50E`: type of object to create
;
CreateObject_SingleObject:
	LDY byte_RAM_E7
	LDX byte_RAM_50E
	LDA SingleObjects, X
	STA (byte_RAM_1), Y
	RTS

; -----


World1thru6BrickWallTiles:
	.db BackgroundTile_BackgroundBrick
	.db BackgroundTile_SolidBrick2Wall

World7BrickWallTiles:
	.db BackgroundTile_GroundBrick2
	.db BackgroundTile_GroundBrick2


CreateObject_Wall:
	LDA byte_RAM_50E
	SEC
	SBC #$08
	STA byte_RAM_8
	LDY byte_RAM_E7
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	LDY byte_RAM_E7
	LDA #$05
	STA byte_RAM_7
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE CreateObject_Wall_Exit

CreateObject_Wall_Loop:
	LDX byte_RAM_8
	LDA CurrentWorldTileset
	CMP #$06
	BNE CreateObject_Wall_PlaceTile_NotWorld7

	LDA World7BrickWallTiles, X
	JMP CreateObject_Wall_PlaceTile

CreateObject_Wall_PlaceTile_NotWorld7:
	LDA World1thru6BrickWallTiles, X

CreateObject_Wall_PlaceTile:
	STA (byte_RAM_1), Y
	JSR IncrementAreaXOffset

	DEC byte_RAM_7
	BPL CreateObject_Wall_Loop

	LDA byte_RAM_E7
	CLC
	ADC #$10
	CMP #$F0
	BCS CreateObject_Wall_Exit

	STA byte_RAM_E7
	JMP CreateObject_Wall

CreateObject_Wall_Exit:
	RTS


WaterfallTiles:
	.db BackgroundTile_WaterfallTop
	.db BackgroundTile_Waterfall


CreateObject_WaterfallOrFrozenRocks:
IFNDEF ENABLE_LEVEL_OBJECT_MODE
	LDA CurrentWorldTileset
	CMP #$03
	BNE CreateObject_Waterfall

	JMP CreateObject_FrozenRocks
ENDIF

CreateObject_Waterfall:
	LDA #$00
	STA byte_RAM_8

CreateObject_Waterfall_OuterLoop:
	LDY byte_RAM_E7
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	LDY byte_RAM_E7
	LDA byte_RAM_50D
	STA byte_RAM_7
	LDX byte_RAM_8

CreateObject_Waterfall_InnerLoop:
	LDA WaterfallTiles, X
	STA (byte_RAM_1), Y
	JSR IncrementAreaXOffset

	DEC byte_RAM_7
	BPL CreateObject_Waterfall_InnerLoop

	LDA #$01
	STA byte_RAM_8
	LDA byte_RAM_E7
	CLC
	ADC #$10
	CMP #$F0
	BCS CreateObject_Waterfall_Exit

	STA byte_RAM_E7
	JMP CreateObject_Waterfall_OuterLoop

CreateObject_Waterfall_Exit:
	RTS


IFDEF ENABLE_LEVEL_OBJECT_MODE
WaterTiles:
	.db BackgroundTile_WaterTop
	.db BackgroundTile_Water

CreateObject_Water:
	LDA #$00
	STA byte_RAM_8

CreateObject_Water_OuterLoop:
	LDY byte_RAM_E7
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	LDY byte_RAM_E7
	LDA byte_RAM_50D
	STA byte_RAM_7
	LDX byte_RAM_8

CreateObject_Water_InnerLoop:
	LDA WaterTiles, X
	STA (byte_RAM_1), Y
	JSR IncrementAreaXOffset

	DEC byte_RAM_7
	BPL CreateObject_Water_InnerLoop

	LDA #$01
	STA byte_RAM_8
	LDA byte_RAM_E7
	CLC
	ADC #$10
	CMP #$F0
	BCS CreateObject_Water_Exit

	STA byte_RAM_E7
	JMP CreateObject_Water_OuterLoop

CreateObject_Water_Exit:
	RTS
ENDIF


CreateObject_Pyramid:
	LDY byte_RAM_E7
	LDA #$00
	STA byte_RAM_8

CreateObject_Pyramid_CheckExistingTile:
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BEQ CreateObject_Pyramid_DrawLeftOuter

	RTS

CreateObject_Pyramid_DrawLeftOuter:
	LDA #BackgroundTile_PyramidLeftAngle
	STA (byte_RAM_1), Y
	LDX byte_RAM_8
	BEQ CreateObject_Pyramid_DrawRightOuter

CreateObject_Pyramid_DrawLeftInner:
	INY
	LDA #BackgroundTile_PyramidLeft
	STA (byte_RAM_1), Y
	DEX
	BNE CreateObject_Pyramid_DrawLeftInner

	LDX byte_RAM_8

CreateObject_Pyramid_DrawRightInner:
	INY
	LDA #BackgroundTile_PyramidRight
	STA (byte_RAM_1), Y
	DEX
	BNE CreateObject_Pyramid_DrawRightInner

CreateObject_Pyramid_DrawRightOuter:
	INY
	LDA #BackgroundTile_PyramidRightAngle
	STA (byte_RAM_1), Y
	INC byte_RAM_8
	LDA byte_RAM_E7
	CLC
	ADC #$10
	STA byte_RAM_E7
	SEC
	SBC byte_RAM_8
	TAY
	JMP CreateObject_Pyramid_CheckExistingTile


;
; This is basically equivalent to `CreateObject_Pillar`, except that it only
; creates desert world cacti. It doesn't seem to referenced anywhere and is
; possibly just a leftover from Doki Doki Panic.
;
Unused_CreateObject_Cactus:
	LDY byte_RAM_E7
	LDA #BackgroundTile_CactusTop
	STA (byte_RAM_1), Y

Unused_CreateObject_Cactus_Loop:
	JSR IncrementAreaYOffset

	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BEQ Unused_CreateObject_Cactus_PlaceTile

	RTS

Unused_CreateObject_Cactus_PlaceTile:
	LDA #BackgroundTile_CactusMiddle
	STA (byte_RAM_1), Y
	BNE Unused_CreateObject_Cactus_Loop


;
; See these stars? The tiles are pseudo-randomly chosen using this subroutine.
; This modifies two inputs and returns the exclusive OR of them to use as the
; index in the tile lookup table.
;
; ##### Input
; - `byte_RAM_9`
; - `byte_RAM_A`
;
; ##### Output
; - `A`: offset in the start tile lookup table
; - `byte_RAM_9`
; - `byte_RAM_A`
;
CreateObject_StarBackground_PickTile:
	; Multiply `RAM_9` by 5 and add one
	LDA byte_RAM_9
	ASL A
	ASL A
	SEC
	ADC byte_RAM_9
	STA byte_RAM_9

	; Multiply `RAM_A` by 2
	ASL byte_RAM_A

	LDA #%00100000
	BIT byte_RAM_A

	BCS CreateObject_StarBackground_PickTile_RAM_9_Overflowed

	BNE CreateObject_StarBackground_PickTile_RAM_A_Increment

	BEQ CreateObject_StarBackground_PickTile_Exit

CreateObject_StarBackground_PickTile_RAM_9_Overflowed:
	BNE CreateObject_StarBackground_PickTile_Exit

CreateObject_StarBackground_PickTile_RAM_A_Increment:
	; Increment `RAM_A` if
	; - `RAM_9` DID overflow and `RAM_A' is NOT divisible by 16
	; - `RAM_9` did NOT overflow and `RAM_A` IS divisible by 16
	INC byte_RAM_A

CreateObject_StarBackground_PickTile_Exit:
	; Return the exclusive OR of `RAM_9` and `RAM_A`
	LDA byte_RAM_A
	EOR byte_RAM_9
	RTS


StarBackgroundTiles:
	.db BackgroundTile_Sky
	.db BackgroundTile_StarBg1
	.db BackgroundTile_Sky
	.db BackgroundTile_Sky
	.db BackgroundTile_Sky
	.db BackgroundTile_Sky
	.db BackgroundTile_StarBg2
	.db BackgroundTile_Sky


CreateObject_StarBackground:
	LDA byte_RAM_E8
	STA byte_RAM_D
	LDA #$80
	STA byte_RAM_A
	LDA #$31
	STA byte_RAM_9

CreateObject_StarBackground_Loop:
	JSR CreateObject_StarBackground_PickTile

	AND #$07
	TAX
	LDA StarBackgroundTiles, X
	STA (byte_RAM_1), Y
	JSR IncrementAreaYOffset

	CPY #$30
	BCC CreateObject_StarBackground_Loop

	TYA
	AND #$0F
	TAY
	JSR IncrementAreaXOffset

	LDA byte_RAM_D
	STA byte_RAM_E8
	CMP #$A
	BNE CreateObject_StarBackground_Loop

	LDA #$00
	STA byte_RAM_E8
	STA byte_RAM_E6
	STA byte_RAM_E5
	RTS


;
; Lookup table for whale tiles.
;
; It's unclear why there are entries for black background tiles and jumpthrough
; cloud platforms, but the mushroom houses table also has this.
;
WhaleLeftTiles:
	.db BackgroundTile_Black
	.db BackgroundTile_CloudLeft
	.db BackgroundTile_WhaleTopLeft
	.db BackgroundTile_Whale
	.db BackgroundTile_WaterWhale

WhaleMiddleTiles:
	.db BackgroundTile_Black
	.db BackgroundTile_CloudMiddle
	.db BackgroundTile_WhaleTop
	.db BackgroundTile_Whale
	.db BackgroundTile_WaterWhale

WhaleRightTiles:
	.db BackgroundTile_Black
	.db BackgroundTile_CloudRight
	.db BackgroundTile_WhaleTopRight
	.db BackgroundTile_Whale
	.db BackgroundTile_WaterWhale


;
; Draws a row of the whale
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
; - `byte_RAM_50D`: width of house
; - `byte_RAM_50E`: offset in the tile lookup table plus `$0A`, for some reason
;
CreateObject_WhaleRow:
	LDY byte_RAM_E7
	LDA byte_RAM_50E
	SEC
	SBC #$0A
	TAX
	LDA WhaleLeftTiles, X
	STA (byte_RAM_1), Y
	DEC byte_RAM_50D
	BEQ CreateObject_WhaleRow_Right

CreateObject_WhaleRow_Loop:
	JSR IncrementAreaXOffset

	LDA WhaleMiddleTiles, X
	STA (byte_RAM_1), Y
	DEC byte_RAM_50D
	BNE CreateObject_WhaleRow_Loop

CreateObject_WhaleRow_Right:
	JSR IncrementAreaXOffset

	LDA WhaleRightTiles, X
	STA (byte_RAM_1), Y
	RTS


IFNDEF ENABLE_LEVEL_OBJECT_MODE
CreateObject_WhaleOrDrawBridgeChain:
	LDA CurrentWorldTileset
	CMP #$06
	BNE CreateObject_Whale

	JMP CreateObject_DrawBridgeChain
ELSE
CreateObject_Platform_BX:
	LDA LevelObjectMode
	JSR JumpToTableAfterJump

	.dw CreateObject_Water
	.dw CreateObject_FrozenRocks
	.dw CreateObject_FrozenRocks
	.dw CreateObject_DrawBridgeChain
ENDIF

;
; Draws a whale.
;
; ##### Input
; - `byte_RAM_50D`: width of whale
;
CreateObject_Whale:
	LDA byte_RAM_50D
	STA byte_RAM_7
	LDA #$0C
	STA byte_RAM_50E
	JSR CreateObject_WhaleRow

	INC byte_RAM_50E

CreateObject_Whale_Loop:
	LDA byte_RAM_7
	STA byte_RAM_50D
	LDA byte_RAM_E7
	CLC
	ADC #$10
	STA byte_RAM_E7
	CMP #$B0
	; This branch doesn't actually skip anything...
	BCC CreateObject_Whale_AboveWater

CreateObject_Whale_AboveWater:
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	JSR CreateObject_WhaleRow

	; Check to see if we're at the fixed row above the water.
	TYA
	AND #$F0
	CMP #$B0
	BNE CreateObject_Whale_NotTail

	; Draw the whale tail two tiles away.
	JSR IncrementAreaXOffset
	JSR IncrementAreaXOffset

	LDA #BackgroundTile_WhaleTail
	STA (byte_RAM_1), Y
	INC byte_RAM_50E
	JMP CreateObject_Whale_Loop

CreateObject_Whale_NotTail:
	LDA byte_RAM_50E
	CMP #$0E
	BNE CreateObject_Whale_Loop

	JSR IncrementAreaXOffset
	JSR IncrementAreaXOffset

	LDA #BackgroundTile_WaterWhaleTail
	STA (byte_RAM_1), Y
	RTS


;
; Lookup table for frozen rocks over water tiles.
;
FrozenRockTiles:
	.db BackgroundTile_WaterWhale
	.db BackgroundTile_FrozenRock


;
; Draws the frozen rocks object
;
; This places rows of tiles until it hits the water height, where it will place
; one last row of a different tile and then exit.
;
; ##### Input
; - `byte_RAM_50D`: number of blocks to create
; - `byte_RAM_E7`: target tile placement offset
; - `byte_RAM_E8`: area page
;
CreateObject_FrozenRocks:
	LDA #$01
	STA byte_RAM_8

CreateObject_FrozenRocks_OuterLoop:
	LDY byte_RAM_E7
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	LDY byte_RAM_E7
	LDA byte_RAM_50D
	STA byte_RAM_7
	LDX byte_RAM_8

CreateObject_FrozenRocks_InnerLoop:
	LDA FrozenRockTiles, X
	STA (byte_RAM_1), Y
	JSR IncrementAreaXOffset

	DEC byte_RAM_7
	BPL CreateObject_FrozenRocks_InnerLoop

	LDA byte_RAM_8
	BNE CreateObject_FrozenRocks_IncrementRow

	RTS

CreateObject_FrozenRocks_IncrementRow:
	LDA byte_RAM_E7
	CLC
	ADC #$10
	CMP #$C0
	BCC CreateObject_FrozenRocks_NextRow

	; Next row is the last row using a different tile
	DEC byte_RAM_8

CreateObject_FrozenRocks_NextRow:
	STA byte_RAM_E7
	JMP CreateObject_FrozenRocks_OuterLoop


;
; Horizontal platform lookup tables for World 5.
;
; Unlike HorizontalPlatform(Left/Middle/Right)Tiles, these support overlap with
; the red tree background.
;
HorizontalPlatformWithOverlapLeftTiles:
	.db BackgroundTile_LogLeft
	.db BackgroundTile_CloudLeft
	.db BackgroundTile_LogMiddle
HorizontalPlatformWithOverlapMiddleTiles:
	.db BackgroundTile_LogMiddle
	.db BackgroundTile_CloudMiddle
HorizontalPlatformWithOverlapRightTiles:
	.db BackgroundTile_LogRight
	.db BackgroundTile_CloudRight
	.db BackgroundTile_LogRightTree

;
; Creates a horizontal platform with special tiles for the endcaps.
;
; The endcaps use alternate tiles when they overlap a non-sky tile, which is how
; the game achieves the effect of a tree with branches in World 5.
;
; Amusingly, since cloud platforms also use this subroutine, their endcaps will
; turn into logs if they overlap another object.
;
CreateObject_HorizontalPlatform_World5:
	LDY byte_RAM_E7
	LDA byte_RAM_50E
	SEC
	SBC #$0A
	TAX
	JSR CreateObject_HorizontalPlatform_World5CheckOverlap

	LDA HorizontalPlatformWithOverlapLeftTiles, X
	STA (byte_RAM_1), Y
	LDX byte_RAM_7
	DEC byte_RAM_50D
	BEQ CreateObject_HorizontalPlatform_World5_Exit

CreateObject_HorizontalPlatform_World5_Loop:
	JSR IncrementAreaXOffset

	LDA HorizontalPlatformWithOverlapMiddleTiles, X
	STA (byte_RAM_1), Y
	DEC byte_RAM_50D
	BNE CreateObject_HorizontalPlatform_World5_Loop

CreateObject_HorizontalPlatform_World5_Exit:
	JSR IncrementAreaXOffset

	JSR CreateObject_HorizontalPlatform_World5CheckOverlap

	LDA HorizontalPlatformWithOverlapRightTiles, X
	STA (byte_RAM_1), Y
	RTS


;
; Check if the next platform tile overlaps the background
;
; ##### Output
; - `X`: table offset for (2 if there is an overlap)
;
CreateObject_HorizontalPlatform_World5CheckOverlap:
	STX byte_RAM_7
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BEQ CreateObject_HorizontalPlatform_World5CheckOverlap_Exit

	; otherwise, the platform is overlapping the background, so we need a special tile
	LDX #$02

CreateObject_HorizontalPlatform_World5CheckOverlap_Exit:
	RTS


;
; Lookup table for tree background tiles
;
TreeBackgroundTiles:
	.db BackgroundTile_TreeBackgroundRight
	.db BackgroundTile_TreeBackgroundMiddleLeft
	.db BackgroundTile_TreeBackgroundLeft


;
; Creates a tree background
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
; - `byte_RAM_E8`: area page
;
CreateObject_TreeBackground:
	; width of the middle of the tree (0 = two tiles, 4 = ten tiles)
	LDA #$04
	STA byte_RAM_7
	LDY byte_RAM_E7
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	LDX #$02

	; Stop when it touches the ground
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE CreateObject_TreeBackground_Exit

CreateObject_TreeBackground_Loop:
	; Draw the left side of the tree
	LDA TreeBackgroundTiles, X
	STA (byte_RAM_1), Y
	JSR IncrementAreaXOffset

	; Draw the middle of the tree
	DEX
	CPX #$01
	BNE CreateObject_TreeBackground_Right

	JSR CreateObject_TreeBackground_MiddleLoop

CreateObject_TreeBackground_Right:
	; Draw the right side of the tree
	DEX
	BPL CreateObject_TreeBackground_Loop

	; Try to draw the next row
	LDY byte_RAM_E7
	JSR IncrementAreaYOffset

	STY byte_RAM_E7
	JMP CreateObject_TreeBackground

CreateObject_TreeBackground_Exit:
	RTS


;
; Loops through and creates n+1 pairs of tiles for the middle of the tree.
;
CreateObject_TreeBackground_MiddleLoop:
	LDA #BackgroundTile_TreeBackgroundMiddleLeft
	STA (byte_RAM_1), Y
	JSR IncrementAreaXOffset

	LDA #BackgroundTile_TreeBackgroundMiddleRight
	STA (byte_RAM_1), Y
	JSR IncrementAreaXOffset

	DEC byte_RAM_7
	BPL CreateObject_TreeBackground_MiddleLoop

	RTS


; Unreferenced?
SomeUnusedTilesTop:
	.db BackgroundTile_LightDoor
	.db BackgroundTile_CactusTop
	.db BackgroundTile_PalmTreeTop
SomeUnusedTilesBottom:
	.db BackgroundTile_LightDoor
	.db BackgroundTile_CactusMiddle
	.db BackgroundTile_PalmTreeTrunk


;
; This 3x9 tile entrance is used in 6-3
;
RockWallEntranceTiles:
	.db BackgroundTile_RockWallAngle
	.db BackgroundTile_RockWall
	.db BackgroundTile_RockWall

	.db BackgroundTile_RockWall
	.db BackgroundTile_RockWall
	.db BackgroundTile_RockWall

	.db BackgroundTile_RockWall
	.db BackgroundTile_RockWall
	.db BackgroundTile_RockWall

	.db BackgroundTile_RockWallEyeLeft
	.db BackgroundTile_RockWallEyeRight
	.db BackgroundTile_RockWall

	.db BackgroundTile_RockWallMouth
	.db BackgroundTile_RockWallMouth
	.db BackgroundTile_RockWall

	.db BackgroundTile_DarkDoor
	.db BackgroundTile_DarkDoor
	.db BackgroundTile_RockWall

	.db BackgroundTile_DarkDoor
	.db BackgroundTile_DarkDoor
	.db BackgroundTile_RockWall

	.db BackgroundTile_DarkDoor
	.db BackgroundTile_DarkDoor
	.db BackgroundTile_RockWall

	.db BackgroundTile_DarkDoor
	.db BackgroundTile_DarkDoor
	.db BackgroundTile_RockWall


;
; Creates the rock wall face entrance for 6-3.
;
; If you ask me, this is a lot of trouble for a one-off, especially since they
; didn't correctly align the "eyes" and "teeth" tiles with the wall pattern!
;
CreateObject_RockWallEntrance:
	LDX #$00

CreateObject_RockWallEntrance_Loop:
	LDY byte_RAM_E7
	LDA #$02
	STA byte_RAM_9

CreateObject_RockWallEntrance_InnerLoop:
	LDA RockWallEntranceTiles, X
	STA (byte_RAM_1), Y
	INX
	INY
	DEC byte_RAM_9
	BPL CreateObject_RockWallEntrance_InnerLoop

	LDY byte_RAM_E7
	TYA
	CLC
	ADC #$10
	STA byte_RAM_E7
	CPX #$1B
	BNE CreateObject_RockWallEntrance_Loop

	RTS


;
; Door tile lookup tables
;
DoorTopTiles:
	.db BackgroundTile_DoorTop
	.db BackgroundTile_DoorTop
	.db BackgroundTile_DarkDoor
	.db BackgroundTile_DoorwayTop
	.db BackgroundTile_WindowTop

DoorBottomTiles:
	.db BackgroundTile_DoorBottomLock
	.db BackgroundTile_DoorBottom
	.db BackgroundTile_DarkDoor
	.db BackgroundTile_DarkDoor
	.db BackgroundTile_DarkDoor


;
; Creates a door object.
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
; - `byte_RAM_50E`: type of object to create
;
CreateObject_Door:
	LDY byte_RAM_E7
	LDA byte_RAM_50E
	CMP #$09
	BNE CreateObject_Door_Unlocked

	; If we've already used the key, create an unlocked door
	LDA KeyUsed
	BEQ CreateObject_Door_Unlocked

	; Use the door two slots after the locked door for the unlocked version
	INC byte_RAM_50E
	INC byte_RAM_50E

CreateObject_Door_Unlocked:
	LDA byte_RAM_50E
	SEC
	SBC #$09
	TAX
	LDA DoorTopTiles, X
	STA (byte_RAM_1), Y
	JSR IncrementAreaYOffset

	LDA DoorBottomTiles, X
	STA (byte_RAM_1), Y

IFNDEF DISABLE_DOOR_POINTERS
	;
	; For Worlds 1-5, the object after a door is used as an area pointer.
	;
	; This seems to be primarily a way to save space, as this method costs 1 byte
	; less than using a normal area pointer object.
	;
	; **But wait! Why not also use this space-saving trick for Worlds 6 and 7?**
	;
	; Regular level objects use the first nybble of the first byte for the Y
	; offset relative to the previous object. As it turns out, door pointer are
	; still "regular objects," at least insofar as their Y offset factors in when
	; rendering the level.
	;
	; For an area pointer, the first byte is the level offset. The first nybble of
	; that byte is $0 for levels 1-1 through 6-1, so there is no Y offset.
	; Door pointers starting in 6-2 would introduce a Y offset because that is
	; level offset is $10. Having everything after a door shift down by 1 row was
	; probably a nuisance when programming the levels.
	;
	LDA CurrentWorld
	CMP #$05
	BEQ CreateObject_Door_Exit

	LDA CurrentWorld
	CMP #$06
	BEQ CreateObject_Door_Exit

	JSR LevelParser_EatDoorPointer
ENDIF

CreateObject_Door_Exit:
	RTS


;
; Lookup table for World 7 mushroom house tiles.
;
; Interestingly, there are entries for black background tiles and jumpthrough
; cloud platforms in this table as well, although they are never used. Perhaps
; these houses would have included their own base at some point.
;
MushroomHouseLeftTiles:
	.db BackgroundTile_Black
	.db BackgroundTile_CloudLeft
	.db BackgroundTile_MushroomTopLeft
	.db BackgroundTile_HouseLeft

MushroomHouseMiddleTiles:
	.db BackgroundTile_Black
	.db BackgroundTile_CloudMiddle
	.db BackgroundTile_MushroomTopMiddle
	.db BackgroundTile_HouseMiddle

MushroomHouseRightTiles:
	.db BackgroundTile_Black
	.db BackgroundTile_CloudRight
	.db BackgroundTile_MushroomTopRight
	.db BackgroundTile_HouseRight


;
; Draws a row of the mushroom house
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
; - `byte_RAM_50D`: width of house
; - `byte_RAM_50E`: offset in the tile lookup table plus $0A, for some reason
;
CreateObject_MushroomHouseRow:
	LDY byte_RAM_E7
	LDA byte_RAM_50E
	SEC
	SBC #$0A
	TAX
	LDA MushroomHouseLeftTiles, X
	STA (byte_RAM_1), Y
	DEC byte_RAM_50D
	BEQ CreateObject_MushroomHouseRow_Right

CreateObject_MushroomHouseRow_Loop:
	JSR IncrementAreaXOffset

	LDA MushroomHouseMiddleTiles, X
	STA (byte_RAM_1), Y
	DEC byte_RAM_50D
	BNE CreateObject_MushroomHouseRow_Loop

CreateObject_MushroomHouseRow_Right:
	JSR IncrementAreaXOffset

	LDA MushroomHouseRightTiles, X
	STA (byte_RAM_1), Y
	RTS


;
; Draws the jump-through mushroom house platforms used in World 7
;
CreateObject_MushroomJumpthroughPlatform:
	LDA byte_RAM_50D
	STA byte_RAM_7
	LDA #$0C
	STA byte_RAM_50E
	; Draw roof of mushroom house
	JSR CreateObject_MushroomHouseRow

CreateObject_MushroomJumpthroughPlatform_Loop:
	LDA byte_RAM_E7
	CLC
	ADC #$10
	STA byte_RAM_E7
	LDA #$0D
	STA byte_RAM_50E
	LDA_abs byte_RAM_7

	STA byte_RAM_50D
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE CreateObject_MushroomJumpthroughPlatform_Exit

	; Draw body of mushroom house
	JSR CreateObject_MushroomHouseRow

	LDA byte_RAM_E7
	CMP #$E0
	BCC CreateObject_MushroomJumpthroughPlatform_Loop

CreateObject_MushroomJumpthroughPlatform_Exit:
	RTS


;
; Lookup table for pillar tiles, arranged by world
;
PillarTopTiles:
	.db BackgroundTile_LogPillarTop1
	.db BackgroundTile_CactusTop
	.db BackgroundTile_LogPillarTop1
	.db BackgroundTile_LogPillarTop0
	.db BackgroundTile_LogPillarTop1
	.db BackgroundTile_CactusTop
	.db BackgroundTile_ColumnPillarTop2

PillarBottomTiles:
	.db BackgroundTile_LogPillarMiddle1
	.db BackgroundTile_CactusMiddle
	.db BackgroundTile_LogPillarMiddle1
	.db BackgroundTile_LogPillarMiddle0
	.db BackgroundTile_LogPillarMiddle1
	.db BackgroundTile_CactusMiddle
	.db BackgroundTile_ColumnPillarMiddle2


;
; Draws a pillar that extends to the ground
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
;
CreateObject_Pillar:
	LDX CurrentWorldTileset
	LDY byte_RAM_E7
	LDA PillarTopTiles, X
	STA (byte_RAM_1), Y

CreateObject_Pillar_Loop:
	JSR IncrementAreaYOffset

	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE CreateObject_Pillar_Exit

	LDX CurrentWorldTileset
	LDA PillarBottomTiles, X
	STA (byte_RAM_1), Y

	;
	; Normally the pillars extend until they hit another tile, wrapping around to
	; the top of the next page, if necessary.
	;
	; This World 5 check prevents logs from coming down from the sky in the last
	; area before ClawGrip's boss room.
	;
	LDA CurrentWorldTileset
	CMP #$04
	BNE CreateObject_Pillar_Loop

	; Prevent the pillar from looping around to the next page
	CPY #$E0
	BCC CreateObject_Pillar_Loop

CreateObject_Pillar_Exit:
	RTS


;
; Draws one horn of Wart's vegetable thrower
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
;
CreateObject_Horn:
	LDY byte_RAM_E7
	LDA #BackgroundTile_HornTopLeft
	STA (byte_RAM_1), Y
	INY
	LDA #BackgroundTile_HornTopRight
	STA (byte_RAM_1), Y
	LDA byte_RAM_E7
	CLC
	ADC #$10
	TAY
	LDA #BackgroundTile_HornBottomLeft
	STA (byte_RAM_1), Y
	INY
	LDA #BackgroundTile_HornBottomRight
	STA (byte_RAM_1), Y
	RTS


;
; Draws the drawbridge chain
;
; ##### Input
; - `byte_RAM_E7`: target tile placement offset
;
CreateObject_DrawBridgeChain:
	LDY byte_RAM_E7

CreateObject_DrawBridgeChain_Loop:
	LDA #BackgroundTile_DrawBridgeChain
	STA (byte_RAM_1), Y
	TYA
	CLC
	ADC #$F
	TAY
	DEC byte_RAM_50D
	BNE CreateObject_DrawBridgeChain_Loop

	RTS


IFNDEF EXPAND_TABLES
; Unused space in the original ($9126 - $91FF)
unusedSpace $9200, $FF
ENDIF

;
; ## Ground setting data
;
; The ground setting defines a single column (or row, for vertical areas) where each row (or column)
; can be one of four tiles. These tiles are repeated until an object changes  the ground setting or
; the renderer reaches the the end of the area.
;
; An area has its initial ground setting set in the header, but it can be changed mid-area using the
; `$F0` and `$F1` special objects.
;

;
; #### Horizontal ground set data
;
; Two bits per tile are used to select from one of the four ground appearance tiles. The tiles are
; defined from top-to-bottom, except for the last tile, which is actually the top row!
;
; Ground appearance tiles are defined xpecifically in the `WorldXGroundTilesHorizontal` lookup
; tables, but here's an example of how they apply:
;
; - `%00`: default background (ie. sky)
; - `%01`: secondary platform (eg. sand)
; - `%10`: primary platform (eg. grass)
; - `%11`: secondary background (eg. black background in 3-2)
;
HorizontalGroundSetData:
	; The ruler here is an assumption based on the comments above,
	; so take it with a grain of salt or two
	;     1 2 3 4   5 6 7 8   9 A B C   D E F 0
	.db %00000000,%00000000,%00000000,%00100100 ; $00
	.db %00000000,%00000000,%00000010,%01010100 ; $01
	.db %00000000,%00000010,%01010101,%01010100 ; $02
	.db %00000000,%00000010,%01111111,%01010100 ; $03
	.db %00000000,%00000010,%01111111,%11010100 ; $04
	.db %00000000,%00000011,%11111111,%01010100 ; $05
	.db %00000000,%00000010,%01011111,%11111100 ; $06
	.db %00000000,%00000011,%11111111,%11111100 ; $07
	.db %00000000,%00000000,%00000000,%00000000 ; $08
	.db %01010101,%01010101,%01010101,%01111100 ; $09
	.db %11100111,%10011110,%01111001,%11100100 ; $0A
	.db %00000000,%00001110,%01111001,%11100100 ; $0B
	.db %00000000,%00000000,%00001001,%11100100 ; $0C
	.db %00000000,%00000000,%00000000,%00100100 ; $0D
	.db %11100000,%00001110,%01111001,%11100100 ; $0E
	.db %11100100,%00000000,%00001001,%11100100 ; $0F
	.db %11100100,%00000000,%00000000,%00100100 ; $10
	.db %11100111,%10010000,%00001001,%11100100 ; $11
	.db %11100111,%10011110,%01110000,%00100100 ; $12
	.db %11100111,%10011110,%01000000,%00100100 ; $13
	.db %11100111,%10011100,%00000000,%00100100 ; $14
	.db %11100000,%00001110,%01000000,%00100100 ; $15
	.db %00000000,%00000000,%00000000,%11100100 ; $16
	.db %11100100,%00000000,%00000000,%00000000 ; $17
	.db %11100111,%10011110,%01111001,%11100100 ; $18
	.db %11100111,%10010000,%00000001,%11100100 ; $19
	.db %11100000,%00000000,%00000001,%11100100 ; $1A
	.db %11100111,%10010000,%00000000,%00100100 ; $1B
	.db %11100000,%00000000,%00000000,%00100100 ; $1C
	.db %00000000,%00000000,%00000000,%00100100 ; $1D
	.db %00000000,%00000000,%00000000,%00100100 ; $1E

	; Based on the level header parsing code, $1F seems like it may have been reserved for some
	; special behavior at some point, but it doesn't appear to be implemented.
IFDEF EXPAND_TABLES
	.db %00000000,%00000000,%00000000,%00100100 ; $1F
ENDIF

;
; #### Vertical ground set data
;
; Two bits per tile are used to select from one of the four ground appearance tiles. The tiles are
; defined from left-to-right.
;
; Ground appearance tiles are defined xpecifically in the `WorldXGroundTilesVertical` lookup
; tables, but here's an example of how they apply:
;
; - `%00`: default background (ie. sky)
; - `%01`: secondary platform (eg. bombable wall, sand)
; - `%10`: primary platform
; - `%11`: secondary background
;
VerticalGroundSetData:
	;     0 1 2 3   4 5 6 7   8 9 A B   C D E F
	.db %10101010,%10101010,%10101010,%10101010 ; $00
	.db %10000000,%00000000,%00000000,%00000010 ; $01
	.db %10101010,%00000000,%00000000,%10101010 ; $02
	.db %11111010,%00000000,%00000000,%10101111 ; $03
	.db %11111110,%00000000,%00000000,%10111111 ; $04
	.db %11111010,%10000000,%00000010,%10101111 ; $05
	.db %11101000,%00000000,%00000000,%00101011 ; $06
	.db %11100000,%00000000,%00000000,%00001011 ; $07
	.db %11111010,%10010101,%01010110,%10101111 ; $08
	.db %10010101,%00000000,%00000000,%01010110 ; $09
	.db %10100101,%01010101,%01010101,%01011010 ; $0A
	.db %10100101,%01011010,%10100101,%01011010 ; $0B
	.db %01010101,%01010101,%01010101,%01010101 ; $0C
	.db %10010101,%01010101,%01010101,%01010110 ; $0D
	.db %10010101,%01011010,%10100101,%01010110 ; $0E
	.db %10101001,%01010101,%01010101,%01101010 ; $0F
	.db %10000001,%01010101,%01010101,%01000010 ; $10
	.db %10101010,%10100101,%01010101,%01011010 ; $11
	.db %10100101,%01010101,%01011010,%10101010 ; $12
	.db %00000000,%00000000,%00000000,%00000000 ; $13
	.db %10000000,%00000000,%00000000,%00000010 ; $14
	.db %10100000,%00000000,%00000000,%00001010 ; $15
	.db %10101010,%00000000,%00000000,%10101010 ; $16
	.db %10101010,%10100000,%00001010,%10101010 ; $17
	.db %10000000,%00000000,%00001010,%10101010 ; $18
	.db %10000000,%00001010,%10101010,%10101010 ; $19
	.db %10101010,%10101010,%10100000,%00000010 ; $1A
	.db %10101010,%10100000,%00000000,%00000010 ; $1B
	.db %10100000,%00001010,%10100000,%00001010 ; $1C
	.db %10100000,%00000000,%00000000,%00000000 ; $1D
	.db %00000000,%00000000,%00000000,%00001010 ; $1E
	; Based on the level header parsing code, %00011111 seems like it may have been reserved for some
	; special behavior at some point, but it doesn't appear to be implemented.
IFDEF EXPAND_TABLES
	.db %00000000,%00000000,%00000000,%00001010 ; $1F
ENDIF


;
; Lookup tables for decoded level data by page
;
DecodedLevelPageStartLo_Bank6:
	.db <DecodedLevelData
	.db <(DecodedLevelData+$00F0)
	.db <(DecodedLevelData+$01E0)
	.db <(DecodedLevelData+$02D0)
	.db <(DecodedLevelData+$03C0)
	.db <(DecodedLevelData+$04B0)
	.db <(DecodedLevelData+$05A0)
	.db <(DecodedLevelData+$0690)
	.db <(DecodedLevelData+$0780)
	.db <(DecodedLevelData+$0870)
	.db <(SubAreaTileLayout)

DecodedLevelPageStartHi_Bank6:
	.db >DecodedLevelData
	.db >(DecodedLevelData+$00F0)
	.db >(DecodedLevelData+$01E0)
	.db >(DecodedLevelData+$02D0)
	.db >(DecodedLevelData+$03C0)
	.db >(DecodedLevelData+$04B0)
	.db >(DecodedLevelData+$05A0)
	.db >(DecodedLevelData+$0690)
	.db >(DecodedLevelData+$0780)
	.db >(DecodedLevelData+$0870)
	.db >(SubAreaTileLayout)


;
; Subspace tile remapping
; =======================
;
; The horizontal order of tiles is reversed in subspace. Tiles with an obvious
; left/right direction (eg. the corners of green platforms) appear backwards
; until they're swapped with the corresponding right/left version.
;
; This is handled in two tables corresponding tables. If a tile is found in the
; first table, it will be replaced with the tile at the corresponding offset in
; the second table.
;
SubspaceTilesSearch:
	.db $75 ; $00
	.db $77 ; $01
	.db $CA ; $02
	.db $CE ; $03
	.db $C7 ; $04
IFNDEF FIX_SUBSPACE_TILES
	.db $C8 ; $05 ; BUG: This should be $C9
ENDIF
IFDEF FIX_SUBSPACE_TILES
	.db $C9 ; $05
ENDIF
	.db $D0 ; $06
	.db $D1 ; $07
	.db $01 ; $08
	.db $02 ; $09
	.db $84 ; $0A
	.db $87 ; $0B
	.db $60 ; $0C
	.db $62 ; $0D
	.db $13 ; $0E
	.db $15 ; $0F
	.db $53 ; $10
	.db $55 ; $11
	.db $CB ; $12
	.db $CF ; $13
	.db $09 ; $14
	.db $0D ; $15

SubspaceTilesReplace:
	.db $77 ; $00
	.db $75 ; $01
	.db $CE ; $02
	.db $CA ; $03
IFNDEF FIX_SUBSPACE_TILES
	.db $C8 ; $04 ; BUG: This should be $C9
ENDIF
IFDEF FIX_SUBSPACE_TILES
	.db $C9 ; $04
ENDIF
	.db $C7 ; $05
	.db $D1 ; $06
	.db $D0 ; $07
	.db $02 ; $08
	.db $01 ; $09
	.db $87 ; $0A
	.db $84 ; $0B
	.db $62 ; $0C
	.db $60 ; $0D
	.db $15 ; $0E
	.db $13 ; $0F
	.db $55 ; $10
	.db $53 ; $11
	.db $CF ; $12
	.db $CB ; $13
	.db $0D ; $14
	.db $09 ; $15


;
; Resets level data and PPU scrolling.
;
; This starts at the end of the last page and works backwards to create a blank slate upon which to
; render the current area's level data.
;
ResetLevelData:
	LDA #<DecodedLevelData
	STA byte_RAM_A
	LDY #>(DecodedLevelData+$0900)
	STY byte_RAM_B
	LDY #>(DecodedLevelData-$0100)

	; Set all tiles to sky
	LDA #BackgroundTile_Sky

ResetLevelData_Loop:
	STA (byte_RAM_A), Y
	DEY
	CPY #$FF
	BNE ResetLevelData_Loop

	DEC byte_RAM_B
	LDX byte_RAM_B
	CPX #>DecodedLevelData
	BCS ResetLevelData_Loop

	LDA #$00
	STA PPUScrollXMirror
	STA PPUScrollYMirror
	STA CurrentLevelPageX
	STA byte_RAM_D5
	STA byte_RAM_E6
	STA ScreenYHi
	STA ScreenYLo
	STA ScreenBoundaryLeftHi
	STA ScreenBoundaryLeftLo
	STA_abs NeedsScroll
	RTS


;
; Reads a color from the world's background palette
;
; ##### Input
; - `X`: color index
;
; ##### Output
; - `A`: background palette color
;
ReadWorldBackgroundColor:
	; stash X and Y registers
	STY byte_RAM_E
	STX byte_RAM_D
	; look up the address of the current world's palette
	LDY CurrentWorldTileset
	LDA WorldBackgroundPalettePointersLo, Y
	STA byte_RAM_7
	LDA WorldBackgroundPalettePointersHi, Y
	STA byte_RAM_8
	; load the color
	LDY byte_RAM_D
	LDA (byte_RAM_7), Y
	; restore prior X and Y registers
	LDY byte_RAM_E
	LDX byte_RAM_D
	RTS

;
; Reads a color from the world's sprite palette
;
; ##### Input
; - `X`: color index
;
; ##### Output
; - `A`: background palette color
;
ReadWorldSpriteColor:
	; stash X and Y registers
	STY byte_RAM_E
	STX byte_RAM_D
	; look up the address of the current world's palette
	LDY CurrentWorldTileset
	LDA WorldSpritePalettePointersLo, Y
	STA byte_RAM_7
	LDA WorldSpritePalettePointersHi, Y
	STA byte_RAM_8
	; load the color
	LDY byte_RAM_D
	LDA (byte_RAM_7), Y
	; restore prior X and Y registers
	LDY byte_RAM_E
	LDX byte_RAM_D
	RTS

;
; Loads the current area or jar palette
;
LoadCurrentPalette:
	LDA InSubspaceOrJar
	CMP #$01
	BNE LoadCurrentPalette_NotJar

	; This function call will overwrite the
	; normal level loading area with $7A00
	JSR HijackLevelDataCopyAddressWithJar

	JMP LoadCurrentPalette_AreaOffset

; ---------------------------------------------------------------------------

LoadCurrentPalette_NotJar:
	JSR RestoreLevelDataCopyAddress

; Read the palette offset from the area header
LoadCurrentPalette_AreaOffset:
	LDY #$00
	LDA (byte_RAM_5), Y

; End of function LoadCurrentPalette

;
; Loads a world palette to RAM
;
; ##### Input
; - `A`: background palette header byte
;
ApplyPalette:
	; Read background palette index from area header byte
	STA byte_RAM_F
	AND #%00111000
	ASL A
	TAX
	JSR ReadWorldBackgroundColor

	; Something PPU-related. If it's not right, the colors are very wrong.
	STA SkyColor
	LDA #$3F
	STA PPUBuffer_301
	LDA #$00
	STA PPUBuffer_301 + 1
	LDA #$20
	STA PPUBuffer_301 + 2

	LDY #$00
ApplyPalette_BackgroundLoop:
	JSR ReadWorldBackgroundColor
	STA PPUBuffer_301 + 3, Y
	INX
	INY
	CPY #$10
	BCC ApplyPalette_BackgroundLoop

	; Read sprite palette index from area header byte
	LDA byte_RAM_F
	AND #$03
	ASL A
	STA byte_RAM_F
	ASL A
	ADC byte_RAM_F
	ASL A
	TAX

	LDY #$00
ApplyPalette_SpriteLoop:
	JSR ReadWorldSpriteColor
	STA PPUBuffer_301 + $17, Y
	INX
	INY
	CPY #$0C
	BCC ApplyPalette_SpriteLoop

	LDA #$00
	STA PPUBuffer_301 + $17, Y
	LDY #$03

ApplyPalette_PlayerLoop:
	LDA RestorePlayerPalette0, Y
	STA PPUBuffer_301 + $13, Y
	DEY
	BPL ApplyPalette_PlayerLoop

	LDX #$03
	LDY #$10
ApplyPalette_SkyLoop:
	LDA SkyColor
	STA PPUBuffer_301 + 3, Y
	INY
	INY
	INY
	INY
	DEX
	BPL ApplyPalette_SkyLoop

	RTS


GenerateSubspaceArea:
	LDA CurrentLevelArea
	STA CurrentLevelAreaCopy
	LDA #$30 ; subspace palette (works like area header byte)
	STA byte_RAM_F ; why...?
	JSR ApplyPalette

	LDA ScreenBoundaryLeftHi
	STA byte_RAM_E8

	LDA ScreenBoundaryLeftLo
	CLC
	ADC #$08
	BCC GenerateSubspaceArea_SetMoveCameraX

	INC byte_RAM_E8

GenerateSubspaceArea_SetMoveCameraX:
	AND #$F0
	PHA

	SEC
	SBC ScreenBoundaryLeftLo
	STA MoveCameraX

	PLA
	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_E5

	LDA #$00
	STA byte_RAM_E6

	LDA byte_RAM_E8
	STA byte_RAM_D

	JSR SetTileOffsetAndAreaPageAddr_Bank6

	LDY byte_RAM_E7
	LDX #$0F

GenerateSubspaceArea_TileRemapLoop:
	LDA (byte_RAM_1), Y
	JSR DoSubspaceTileRemap

	STA SubAreaTileLayout, X
	TYA
	CLC
	ADC #$10
	TAY
	TXA
	CLC
	ADC #$10
	TAX
	AND #$F0
	BNE GenerateSubspaceArea_TileRemapLoop

	TYA
	AND #$0F
	TAY
	JSR IncrementAreaXOffset

	DEX
	BPL GenerateSubspaceArea_TileRemapLoop

	RTS


;
; Remaps a single subspace tile.
;
; This also handles creating the mushroom sprites.
;
; ##### Input
; - `A`: input tile
;
; ##### Output
; - `A`: output tile
;
DoSubspaceTileRemap:
	STY byte_RAM_8
	STX byte_RAM_7
	LDX #(SubspaceTilesReplace - SubspaceTilesSearch - 1)

DoSubspaceTileRemap_Loop:
	CMP SubspaceTilesSearch, X
	BEQ DoSubspaceTileRemap_ReplaceTile

	DEX
	BPL DoSubspaceTileRemap_Loop

	CMP #BackgroundTile_SubspaceMushroom1
	BEQ DoSubspaceTileRemap_CheckCreateMushroom

	CMP #BackgroundTile_SubspaceMushroom2
	BEQ DoSubspaceTileRemap_CheckCreateMushroom

	JMP DoSubspaceTileRemap_Exit

DoSubspaceTileRemap_CheckCreateMushroom:
	SEC
	SBC #BackgroundTile_SubspaceMushroom1
	TAY
	LDA Mushroom1Pulled, Y
	BNE DoSubspaceTileRemap_AfterCreateMushroom

	LDX byte_RAM_7
	JSR CreateSubspaceMushroomObject

DoSubspaceTileRemap_AfterCreateMushroom:
	LDA #BackgroundTile_SubspaceMushroom1
	JMP DoSubspaceTileRemap_Exit

DoSubspaceTileRemap_ReplaceTile:
	LDA SubspaceTilesReplace, X

DoSubspaceTileRemap_Exit:
	LDX byte_RAM_7
	LDY byte_RAM_8
	RTS


;
; Clears the sub-area tile layout when the player goes into a jar
;
ClearSubAreaTileLayout:
	LDX #$00
	STX IsHorizontalLevel

ClearSubAreaTileLayout_Loop:
	LDA #BackgroundTile_Sky
	STA SubAreaTileLayout, X
	INX
	BNE ClearSubAreaTileLayout_Loop

	LDA CurrentLevelArea
	STA CurrentLevelAreaCopy
	LDA #$04 ; jar is always area 4
	STA CurrentLevelArea
	LDA #$0A
	JSR HijackLevelDataCopyAddressWithJar

	LDY #$00
	LDA #$0A
	STA byte_RAM_E8
	STA byte_RAM_540
	STY byte_RAM_E6
	STY byte_RAM_E5
	STY GroundType
	LDY #$03
	STY GroundSetting
	LDY #$04
	JSR ReadLevelBackgroundData_Page

	; object type
	LDY #$02
	LDA (byte_RAM_5), Y
	AND #%00000011
	STA ObjectType3Xthru9X
	LDA (byte_RAM_5), Y
	LSR A
	LSR A
	AND #%00000011
	STA ObjectTypeAXthruFX
	JSR HijackLevelDataCopyAddressWithJar

	LDA #$0A
	STA byte_RAM_E8
	LDA #$00
	STA byte_RAM_E6
	STA byte_RAM_E5
	LDA #$03
	STA byte_RAM_4
	JSR ReadLevelForegroundData_NextByteObject

	LDA #$01
	STA IsHorizontalLevel
	RTS

;
; Set the current background music to the current area's music as defined in the header.
;
; This stops the current music unless the player is currently invincible.
;
LoadAreaMusic:
	LDY #$03
	LDA (byte_RAM_5), Y
	AND #%00000011
	STA CompareMusicIndex
	CMP CurrentMusicIndex
	BEQ LoadAreaMusic_Exit

	LDA StarInvincibilityTimer
	CMP #$08
	BCS LoadAreaMusic_Exit

	LDA #Music2_StopMusic
	STA MusicQueue2

LoadAreaMusic_Exit:
	RTS


;
; Unreferenced? A similar routine exists in Bank F, so it seems like this may
; be leftover code from a previous version.
;
Unused_LevelMusicIndexes:
	.db Music1_Overworld
	.db Music1_Inside
	.db Music1_Boss
	.db Music1_Wart
	.db Music1_Subspace

Unused_ChangeAreaMusic:
	LDA CompareMusicIndex
	CMP CurrentMusicIndex
	BEQ Unused_ChangeAreaMusic_Exit

	TAX
	STX CurrentMusicIndex
	LDA StarInvincibilityTimer
	CMP #$08
	BCS LoadAreaMusic_Exit

	LDA Unused_LevelMusicIndexes, X
	STA MusicQueue1

Unused_ChangeAreaMusic_Exit:
	RTS

; Unreferenced?
	LDA CurrentLevelPage
	ASL A
	TAY
	LDA AreaPointersByPage, Y
	STA CurrentLevel
	INY
	LDA AreaPointersByPage, Y
	LSR A
	LSR A
	LSR A
	LSR A
	STA CurrentLevelArea
	LDA AreaPointersByPage, Y
	AND #$0F
	STA CurrentLevelEntryPage
	RTS


;
; ## Area loading and rendering
;
; This is the main subroutine for parsing and rendering an entire area of a level.
;
LoadCurrentArea:
	; First, reset the level data and PPU scrolling.
	JSR ResetLevelData

	JSR ResetPPUScrollHi_Bank6

	; Determine the address of the raw level data.
	JSR RestoreLevelDataCopyAddress

	;
	; ### Read area header
	;
	; The level header is read backwards starting at the last byte.
	;

	; Queue any changes to the background music.
	JSR LoadAreaMusic

	;
	; Load initial ground appearance, which determines the tiles used for the background.
	;
	LDY #$03
	LDA (byte_RAM_5), Y
IFNDEF LEVEL_ENGINE_UPGRADES
	LSR A
	AND #%00011100
ELSE
	; double available ground types
	AND #%11110000
	LSR A
	LSR A
ENDIF

	STA GroundType

	; This doesn't hurt, but shouldn't be necessary.
	JSR RestoreLevelDataCopyAddress

IFDEF ENABLE_LEVEL_OBJECT_MODE
	; Read level object mode.
	LDA (byte_RAM_5), Y
	LSR A
	LSR A
	AND #%00000011
	STA LevelObjectMode
ENDIF

	; Determine whether this area is Horizontal or vertical.
	LDY #$00
	LDA (byte_RAM_5), Y
	ASL A
	LDA #$00
	ROL A
	STA IsHorizontalLevel

	; Reset the area page so that we can start drawing from the beginning.
	LDA #$00
	STA byte_RAM_E8

	; Determine the level length (in pages).
	LDY #$02
	LDA (byte_RAM_5), Y
	LSR A
	LSR A
	LSR A
	LSR A
	STA CurrentLevelPages

	; Determine the object types, which are used to determine which horizontal and vertical blocks are
	; used, as well as how some climbable objects appear.
	LDA (byte_RAM_5), Y
	AND #%00000011
	STA ObjectType3Xthru9X
	LDA (byte_RAM_5), Y
	LSR A
	LSR A
	AND #%00000011
	STA ObjectTypeAXthruFX
	DEY

IFDEF AREA_HEADER_TILESET
	; World tileset to use for the area.
	LDA (byte_RAM_5), Y
	ROL A
	ROL A
	ROL A
	ROL A
	AND #%00000111
	CMP #$07 ; only $00-06 are valid, force $07 to CurrentWorld
	BCC LoadCurrentArea_IsValid
	LDA CurrentWorld
LoadCurrentArea_IsValid:
	STA CurrentWorldTileset
ENDIF

	; Load initial ground setting, which determines the shape of the ground layout.
	;
	; Using `$1F` skips rendering ground settings entirely, but no areas seem to use it.
	LDA (byte_RAM_5), Y
	AND #%00011111
	CMP #%00011111
	BEQ LoadCurrentArea_ForegroundData

	STA GroundSetting

	;
	; ### Process level data
	;
	; The area is rendered in two passes (with the exception described above).
	;

	;
	; #### First pass: background terrain
	;
	; The first pass applies the ground settings and appearance to the entire area. This makes sure
	; that the ground is already in place when rendering objects that extend to the ground, such as
	; trees, vines, and platforms.
	;

	; Advance to the first object in the level data.
	INY
	INY
	INY

	; Reset the tile placement offset for the first pass.
	LDA #$00
	STA byte_RAM_E5
	STA byte_RAM_E6

	; Run the first pass of level rendering to apply ground settings and appearance.
	JSR ReadLevelBackgroundData

	;
	; #### Second pass: foreground objects
	;
	; The second pass renders normal level objects and sets up area pointers.
	;
LoadCurrentArea_ForegroundData:
	; Reset the tile placement offset for the second pass.
	LDA #$00
	STA byte_RAM_E6

	; Advance to the first object in the level data.
	LDA #$03
	STA byte_RAM_4

	; Run the second pass of level rendering to place regular objects in the level.
	JSR ReadLevelForegroundData

	; Bootstrap the pseudo-random number generator.
	LDA #$22
	ORA byte_RAM_10
	STA PseudoRNGSeed
	RTS


;
; Sets the raw level data pointer to the level data.
;
RestoreLevelDataCopyAddress:
	LDA #>RawLevelData
	STA byte_RAM_6
	LDA #<RawLevelData
	STA byte_RAM_5
	RTS


;
; Sets the raw level data pointer to the jar data.
;
; This is what allows jars to load so quickly.
;
HijackLevelDataCopyAddressWithJar:
	LDA #>RawJarData
	STA byte_RAM_6
	LDA #<RawJarData
	STA byte_RAM_5
	RTS


;
; ### Render foreground level data
;
; Reads level data from the beginning and processes individual objects.
;
; ##### Input
; - `byte_RAM_4`: raw data offset
;
ReadLevelForegroundData:
	; start at area page 0
	LDA #$00
	STA byte_RAM_E8

	; weird? the next lines do nothing
	LDY #$00
	JMP ReadLevelForegroundData_NextByteObject

ReadLevelForegroundData_NextByteObject:
	LDY byte_RAM_4

ReadLevelForegroundData_NextByte:
	INY
	LDA (byte_RAM_5), Y
	CMP #$FF
	BNE ReadLevelForegroundData_ProcessObject
	; Encountering `$FF` indicates the end of the level data.
	RTS

ReadLevelForegroundData_ProcessObject:
	; Stash the lower nybble of the first byte.
	; For a special object, this will be the special object type.
	; For a regular object, this will be the X position.
	LDA (byte_RAM_5), Y
	AND #$0F
	STA byte_RAM_E5
	; If the upper nybble of the first byte is $F, this is a special object.
	LDA (byte_RAM_5), Y
	AND #$F0
	CMP #$F0
	BNE ReadLevelForegroundData_RegularObject

ReadLevelForegroundData_SpecialObject:
	LDA byte_RAM_E5
	STY byte_RAM_F
	JSR ProcessSpecialObjectForeground

	LDY byte_RAM_F
	JMP ReadLevelForegroundData_NextByte

ReadLevelForegroundData_RegularObject:
	JSR UpdateAreaYOffset

	; check object type
	INY
	; upper nybble
	LDA (byte_RAM_5), Y
	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_50E
	CMP #$03
	BCS ReadLevelForegroundData_RegularObjectWithSize

ReadLevelForegroundData_RegularObjectNoSize:
	PHA
	LDA (byte_RAM_5), Y
	AND #$0F
	STA byte_RAM_50E
	PLA
	BEQ ReadLevelForegroundData_RegularObjectNoSize_00

	PHA
	JSR SetTileOffsetAndAreaPageAddr_Bank6

	LDA (byte_RAM_5), Y
	AND #$0F
	STY byte_RAM_4
	PLA
	CMP #$01
	BNE ReadLevelForegroundData_RegularObjectNoSize_Not10

ReadLevelForegroundData_RegularObjectNoSize_10:
	JSR CreateObjects_10
	JMP ReadLevelForegroundData_RegularObject_Exit

ReadLevelForegroundData_RegularObjectNoSize_Not10:
	CMP #$02
	BNE ReadLevelForegroundData_RegularObjectNoSize_Not20

ReadLevelForegroundData_RegularObjectNoSize_20:
	JSR CreateObjects_20
	JMP ReadLevelForegroundData_RegularObject_Exit

ReadLevelForegroundData_RegularObjectNoSize_Not20:
	JMP ReadLevelForegroundData_RegularObject_Exit

ReadLevelForegroundData_RegularObjectWithSize:
	LDA (byte_RAM_5), Y
	AND #$0F
	STA byte_RAM_50D
	STY byte_RAM_4
	JSR SetTileOffsetAndAreaPageAddr_Bank6

	LDA byte_RAM_50E
	SEC
	SBC #$03
	STA byte_RAM_50E
	JSR CreateObjects_30thruF0

ReadLevelForegroundData_RegularObject_Exit:
	JMP ReadLevelForegroundData_NextByteObject

ReadLevelForegroundData_RegularObjectNoSize_00:
	JSR SetTileOffsetAndAreaPageAddr_Bank6

	LDA (byte_RAM_5), Y
	AND #$0F
	STY byte_RAM_4
	JSR CreateObjects_00

	JMP ReadLevelForegroundData_RegularObject_Exit


;
; Updates the area Y offset for object placement
;
; ##### Input
; - `A`: vertical offset
;
UpdateAreaYOffset:
	CLC
	ADC byte_RAM_E6
	BCC UpdateAreaYOffset_SamePage

	ADC #$0F
	JMP UpdateAreaYOffset_NextPage

UpdateAreaYOffset_SamePage:
	CMP #$F0
	BNE UpdateAreaYOffset_Exit

	LDA #$00

UpdateAreaYOffset_NextPage:
	INC byte_RAM_E8

UpdateAreaYOffset_Exit:
	STA byte_RAM_E6
	RTS


;
; Processes special objects for the second pass, which draws object tiles.
;
; On this pass, ground setting tiles are ignored, and we're just eating the bytes, but page skip
; objects still require updating the tile placement cursor.
;
; Area pointers are also processed in this pass. Although they _could_ be processed earlier, this
; reduces the likelihood of being overridden by a door pointer.
;
ProcessSpecialObjectForeground:
	JSR JumpToTableAfterJump

	.dw EatLevelObject1Byte ; Ground setting 0-8
	.dw EatLevelObject1Byte ; Ground setting 9-15
	.dw SkipForwardPage1Foreground ; Skip forward 1 page
	.dw SkipForwardPage2Foreground ; Skip forward 2 pages
	.dw ResetPageAndOffsetForeground ; New object layer
	.dw SetAreaPointer ; Area pointer
	.dw EatLevelObject1Byte ; Ground appearance
IFDEF LEVEL_ENGINE_UPGRADES
	.dw CreateRawTiles
ENDIF


;
; Processes special objects for the first pass, which draws ground layout tiles.
;
ProcessSpecialObjectBackground:
	JSR JumpToTableAfterJump

	.dw SetGroundSettingA ; Ground setting 0-7
	.dw SetGroundSettingB ; Ground setting 8-15
	.dw SkipForwardPage1Background ; Skip forward 1 page
	.dw SkipForwardPage2Background ; Skip forward 2 pages
	.dw ResetPageAndOffsetBackground ; New object layer
	.dw SetAreaPointerNoOp ; Area pointer
	.dw SetGroundType ; Ground appearance
IFDEF LEVEL_ENGINE_UPGRADES
	.dw CreateRawTilesNoOp
ENDIF


;
; #### Special Object `$F2` / `$F3`: Skip Page (Foreground)
;
; Moves the tile placement cursor forward one or two pages in the foregorund pass.
;
; ##### Output
;
; - `byte_RAM_E8`: area page
; - `byte_RAM_E6`: tile placement offset
;
;

SkipForwardPage2Foreground:
	INC byte_RAM_E8

SkipForwardPage1Foreground:
	INC byte_RAM_E8
	LDA #$00
	STA byte_RAM_E6
	RTS


;
; #### Special Object `$F2` / `$F3`: Skip Page (Background)
;
; Moves the tile placement cursor forward one or two pages in the background pass.
;
; ##### Output
;
; - `byte_RAM_540`: area page
; - `byte_RAM_E`: tile placement offset
; - `byte_RAM_9`: tile placement offset (overflow counter)
;

SkipForwardPage2Background:
	INC byte_RAM_540

SkipForwardPage1Background:
	INC byte_RAM_540
	LDA #$00
	STA byte_RAM_E
	STA byte_RAM_9
	RTS

;
; Advances two bytes in the level data.
;
; Unreferenced?
;
EatLevelObject2Bytes:
	INC byte_RAM_F

;
; Advances one byte in the level data.
;
EatLevelObject1Byte:
	INC byte_RAM_F
	RTS


;
; #### Area Pointer Object `$F5`
;
; Sets the area pointer for this page.
;
; ##### Input
; - `byte_RAM_F`: level data byte offset
; - `byte_RAM_E8`: area page
;
; ##### Output
; - `byte_RAM_F`: level data byte offset
;
SetAreaPointer:
	LDY byte_RAM_F
	INY
	LDA byte_RAM_E8
	ASL A
	TAX
	LDA (byte_RAM_5), Y
	STA AreaPointersByPage, X
	INY
	INX
	LDA (byte_RAM_5), Y
	STA AreaPointersByPage, X
	STY byte_RAM_F
	RTS


IFDEF LEVEL_ENGINE_UPGRADES
;
; #### Special Object `$F7`
;
; Creates a run of 1-16 arbitrary tiles.
;
; #### Usage: `$F7 $YX $WL ...`
; - `Y`: relative Y offset on page
; - `X`: X position on page
; - `W`: wrap width (eg. 0 for no wrap, 2 for 2-tiles wide, etc.)
; - `L`: run length, L+1 subsequent bytes are the raw tiles
;
CreateRawTiles:
	LDY byte_RAM_F

	; setting the page address allows this to be the first object of an area
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	INY
	; read tile placement offset
	LDA (byte_RAM_5), Y
	CLC
	ADC byte_RAM_E6 ; add current offset
	STA byte_RAM_E7 ; target tile placement offset

	; apply page Y offset
	LDA (byte_RAM_5), Y
	AND #$F0
	JSR UpdateAreaYOffset

	INY
	; read run length
	LDA (byte_RAM_5), Y
	AND #$0F
	STA byte_RAM_50D

	; read wrap length
	LDA (byte_RAM_5), Y
	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_50E

	; start counting from 0
	LDX #$00

	; everything afterwards is raw data
CreateRawTiles_Loop:
	; increment and stash Y
	INY
	TYA
	PHA

	; write the next tile
	LDA (byte_RAM_5), Y
	LDY byte_RAM_E7
	STA (byte_RAM_1), Y

	; increment x-position (crossing page as necessary)
	JSR IncrementAreaXOffset
	STY byte_RAM_E7

	; are we wrapping this run of tiles?
	LDA byte_RAM_50E
	BEQ CreateRawTiles_NoWrap

	; increment y-position if we hit the wrap point
	TXA
	CLC
	ADC #$01
CreateRawTiles_CheckWrap:
	SEC
	SBC byte_RAM_50E
	BMI CreateRawTiles_NoWrap
	BNE CreateRawTiles_CheckWrap

CreateRawTiles_Wrap:
	TXA
	PHA
	JSR IncrementAreaYOffset
	SEC
	SBC byte_RAM_50E
	TAY
	STY byte_RAM_E7
	PLA
	TAX

CreateRawTiles_NoWrap:
	; restore Y and iterate
	PLA
	TAY

	CPX byte_RAM_50D
	INX
	BCC CreateRawTiles_Loop

	; update level data offset
	STY byte_RAM_F

CreateRawTilesNoOp:
	RTS
ENDIF


;
; Use top 3 bits for the X offset of a ground setting object
;
; ##### Output
; - `A`: 0-7
;
ReadGroundSettingOffset:
	LDY byte_RAM_F
	INY
	LDA (byte_RAM_5), Y
	AND #%11100000
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	RTS

;
; #### Special Object `$F0` / `$F1`: Ground Setting
;
; Sets ground setting at some relative offset on the current page.
;
; Object `$F0` can change the ground setting for offsets 0 through 7.
; Object `$F1` can change the ground setting for offsets 8 through 15.
;
; #### Input
; - `A`: Relative offset (0-7)
; - `byte_RAM_F`: level data byte offset
;
; #### Output
; - `byte_RAM_E`: tile placement offset
;
SetGroundSettingA:
	JSR ReadGroundSettingOffset
	JMP SetGroundSetting

SetGroundSettingB:
	JSR ReadGroundSettingOffset
	CLC
	ADC #$08

SetGroundSetting:
	STA byte_RAM_E
	LDA IsHorizontalLevel
	BNE SetGroundSetting_Exit

	LDA byte_RAM_E
	ASL A
	ASL A
	ASL A
	ASL A
	STA byte_RAM_E

SetGroundSetting_Exit:
	RTS


;
; #### Special Object `$F4`: New Layer (Foreground)
;
; Moves the tile placement cursor to the beginning of the first page in the foreground pass.
;
; ##### Output
;
; - `byte_RAM_E8`: area page
; - `byte_RAM_E6`: tile placement offset
;
ResetPageAndOffsetForeground:
	LDA #$00
	STA byte_RAM_E8 ; area page
	STA byte_RAM_E6 ; tile placement offset
	RTS


;
; #### Special Object `$F4`: New Layer (Background)
;
; Moves the tile placement cursor to the beginning of the first page in the background pass.
;
; ##### Output
;
; - `byte_RAM_540`: area page
; - `byte_RAM_E`: tile placement offset
;
ResetPageAndOffsetBackground:
	LDA #$00
	STA byte_RAM_540
	STA byte_RAM_E
	RTS


;
; Area pointers are not processed on the background pass.
;
SetAreaPointerNoOp:
	RTS


;
; #### Ground Appearance Object `$F6`
;
; Sets the ground appearance, which determines the tiles used when drawing the ground setting.
;
; ##### Output
;
; `GroundType`: the ground type used for drawing the background
;
SetGroundType:
	LDY byte_RAM_F
	INY
	LDA (byte_RAM_5), Y
	AND #%00001111
	ASL A
	ASL A
	STA GroundType
	RTS


;
; ### Render background level data
;
; Reads level data from the beginning and processes the ground layout.
;
; This first pass is used for setting up the ground types and settings before normal objects are
; rendered in the level.
;
; ##### Input
; - `Y`: raw data offset
;
ReadLevelBackgroundData:
	LDA #$00
	STA byte_RAM_540

ReadLevelBackgroundData_Page:
	LDA #$00
	STA byte_RAM_9

ReadLevelBackgroundData_Object:
	LDA (byte_RAM_5), Y
	CMP #$FF
	BNE ReadLevelBackgroundData_ProcessObject

	; Encountering `$FF` indicates the end of the level data.
	; We need to render the remaining ground setting through the end of the last page in the area.
	LDA #$0A
	STA byte_RAM_540
	INC byte_RAM_540
	LDA #$00
	STA byte_RAM_E
	JMP ReadLevelBackgroundData_RenderGround

ReadLevelBackgroundData_ProcessObject:
	LDA (byte_RAM_5), Y
	AND #$F0
	BEQ ReadLevelBackgroundData_ProcessObject_Advance2Bytes

	CMP #$F0
	BNE ReadLevelBackgroundData_ProcessRegularObject

;
; First byte of `$FX` indicates a special object.
;
ReadLevelBackgroundData_ProcessSpecialObject:
	LDA (byte_RAM_5), Y
	AND #$0F
	STY byte_RAM_F
	JSR ProcessSpecialObjectBackground

	; Determine how many more bytes to advance after processing the special object.
	LDY byte_RAM_F
	LDA (byte_RAM_5), Y
	AND #$0F

	; Ground setting `$F0` / `$F1` should render the previous ground setting
	CMP #$02
	BCC ReadLevelBackgroundData_RenderGround

	; Special objects except `$F0` / `$F1`
	CMP #$05
	BNE ReadLevelBackgroundData_ProcessObject_NotF5

ReadLevelBackgroundData_ProcessObject_Advance3Bytes:
	INY
	JMP ReadLevelBackgroundData_ProcessObject_Advance2Bytes

ReadLevelBackgroundData_ProcessObject_NotF5:
	; Special objects except `$F0` / `$F1` / `$F5`
	CMP #$06
	BNE ReadLevelBackgroundData_ProcessObject_AdvanceByte

; Ground appearance `$F6` is two bytes.
ReadLevelBackgroundData_ProcessObject_Advance2Bytes:
	INY

ReadLevelBackgroundData_ProcessObject_AdvanceByte:
	INY
	JMP ReadLevelBackgroundData_Object

;
; Processes a regular object, as indicated by a value of `$0X-$EX` in the first byte.
;
; ##### Input
; - `byte_RAM_9`: tile placement offset (overflow counter)
;
; ##### Output
; - `byte_RAM_540`: area page
; - `byte_RAM_9`: tile placement offset (overflow counter)
;
; Since we're only processing background objects, all this needs to do is look at the object offset
; and advance the tile placement cursor and current page as needed.
;
; #### The Door Pointer Y Offset "Bug"
;
; An interesting quirk about the level engine is that door pointers are used in worlds 1-5, but not
; worlds 6 and 7, due to the fact that the pointers have an effective Y offset of 1.
;
; The developers chose to disable door pointers to deal with this problem, but another solution
; would have been to modify the code here to determine whether an object was being used as a door
; pointer and avoid processing its position offset.
;
ReadLevelBackgroundData_ProcessRegularObject:
	CLC
	ADC byte_RAM_9
	BCC ReadLevelBackgroundData_ProcessRegularObject_SamePage

	; The object position overflowed to the next page.
	ADC #$0F
	JMP ReadLevelBackgroundData_ProcessRegularObject_NextPage

ReadLevelBackgroundData_ProcessRegularObject_SamePage:
	CMP #$F0
	BNE ReadLevelBackgroundData_ProcessRegularObject_Exit

	LDA #$00

ReadLevelBackgroundData_ProcessRegularObject_NextPage:
	INC byte_RAM_540

ReadLevelBackgroundData_ProcessRegularObject_Exit:
	STA byte_RAM_9
	JMP ReadLevelBackgroundData_ProcessObject_Advance2Bytes


;
; Renders the ground setting up to this point.
;
; This code is invoked when we encounter a ground setting object and need to render the previous
; ground setting up tothis point or when we have reached the end of the level data and need to
; render the current ground setting through the end of the area.
;
; #### Input
; - `byte_RAM_E8`: area page
; - `byte_RAM_E5`: tile placement offset shift
; - `byte_RAM_E6`: previous tile placement offset
; - `byte_RAM_540`: area page (end)
; - `byte_RAM_E`: tile placement offset (end)
;
; #### Output
;
ReadLevelBackgroundData_RenderGround:
	JSR SetTileOffsetAndAreaPageAddr_Bank6

	JSR LoadGroundSetData

	LDA IsHorizontalLevel
	BEQ ReadLevelBackgroundData_RenderGround_Vertical

ReadLevelBackgroundData_RenderGround_Horizontal:
	; Increment the column.
	INC byte_RAM_E5
	LDA byte_RAM_E5
	CMP #$10
	BNE ReadLevelBackgroundData_RenderGround_CheckComplete

	; Increment the page and reset to the first column.
	INC byte_RAM_E8
	LDA #$00
	STA byte_RAM_E5
	JMP ReadLevelBackgroundData_RenderGround_CheckComplete


ReadLevelBackgroundData_RenderGround_Vertical:
	; Increment the row.
	LDA #$10
	JSR UpdateAreaYOffset

ReadLevelBackgroundData_RenderGround_CheckComplete:
	; If there are more pages to render with this ground setting, keep going.
	LDA byte_RAM_E8
	CMP byte_RAM_540
	BNE ReadLevelBackgroundData_RenderGround

	LDA IsHorizontalLevel
	BEQ ReadLevelBackgroundData_RenderGround_CheckComplete_Vertical

ReadLevelBackgroundData_RenderGround_CheckComplete_Horizontal:
	; If there is more to render with this ground setting, keep going.
	LDA byte_RAM_E5
	CMP byte_RAM_E
	BCC ReadLevelBackgroundData_RenderGround

	; Otherwise, move on and process the next object.
	BCS ReadLevelBackgroundData_RenderGround_Exit

ReadLevelBackgroundData_RenderGround_CheckComplete_Vertical:
	LDA byte_RAM_E6
	CMP byte_RAM_E
	BCC ReadLevelBackgroundData_RenderGround

ReadLevelBackgroundData_RenderGround_Exit:
	LDA (byte_RAM_5), Y
	; Encountering `$FF` indicates the end of the level data.
	CMP #$FF
	BEQ ReadGroundSetByte_Exit

	; Otherwise this was triggered because we encountered a ground setting object, so `GroundSetting`
	; for the next time we need to render the ground.
	INY
	LDA (byte_RAM_5), Y
	AND #$1F
	STA GroundSetting
	JMP ReadLevelBackgroundData_ProcessObject_AdvanceByte

; -----


;
; Reads the current ground setting byte.
;
; ##### Input
; - `X`: Ground setting offset
;
; ##### Output
; - `A`: Byte containing the 4 ground appearance bit pairs for the offset
;
ReadGroundSetByte:
	LDA IsHorizontalLevel
	BNE ReadGroundSetByte_Vertical

	LDA VerticalGroundSetData, X
	RTS

ReadGroundSetByte_Vertical:
	LDA HorizontalGroundSetData, X

ReadGroundSetByte_Exit:
	RTS


;
; Draws the current ground setting and type to the raw tile buffer.
;
; ##### Input
; - `GroundSetting`: current ground setting
; - `GroundType`: current ground appearance
; - `byte_RAM_E7`: tile placement offset
;
LoadGroundSetData:
	STY byte_RAM_4
	LDA GroundSetting
	ASL A
	ASL A
	TAX
	LDY byte_RAM_E7

LoadGroundSetData_Loop:
	JSR ReadGroundSetByte

	JSR WriteGroundSetTiles1

	JSR ReadGroundSetByte

	JSR WriteGroundSetTiles2

	JSR ReadGroundSetByte

	JSR WriteGroundSetTiles3

	JSR ReadGroundSetByte

	JSR WriteGroundSetTiles4

	LDA IsHorizontalLevel
	BEQ LoadGroundSetData_Horizontal

	INX
	BCS LoadGroundSetData_Exit

	BCC LoadGroundSetData_Loop

LoadGroundSetData_Horizontal:
	INX
	TYA
	AND #$0F
	BNE LoadGroundSetData_Loop

LoadGroundSetData_Exit:
	LDY byte_RAM_4
	RTS

;
; Draws current ground set tiles.
;
WriteGroundSetTiles:
WriteGroundSetTiles1:
	LSR A
	LSR A

WriteGroundSetTiles2:
	LSR A
	LSR A

WriteGroundSetTiles3:
	LSR A
	LSR A

WriteGroundSetTiles4:
	AND #$03
	STX byte_RAM_3
	; This `BEQ` is what effectively ignores the first index of the groundset tiles lookup tables.
	BEQ WriteGroundSetTiles_AfterWriteTile

	CLC
	ADC GroundType
	TAX
	LDA IsHorizontalLevel
	BNE WriteGroundSetTiles_Horizontal

	JSR ReadGroundTileVertical

	JMP WriteGroundSetTiles_WriteTile

WriteGroundSetTiles_Horizontal:
	JSR ReadGroundTileHorizontal

WriteGroundSetTiles_WriteTile:
	STA (byte_RAM_1), Y

WriteGroundSetTiles_AfterWriteTile:
	LDX byte_RAM_3
	LDA IsHorizontalLevel
	BNE WriteGroundSetTiles_IncrementYOffset

	INY
	RTS

WriteGroundSetTiles_IncrementYOffset:
	TYA
	CLC
	ADC #$10
	TAY
	RTS


ReadGroundTileHorizontal:
	STX byte_RAM_C
	STY byte_RAM_D
	LDX CurrentWorldTileset
	LDA GroundTilesHorizontalLo, X
	STA byte_RAM_7
	LDA GroundTilesHorizontalHi, X
	STA byte_RAM_8
	LDY byte_RAM_C
	LDA (byte_RAM_7), Y
	LDX byte_RAM_C
	LDY byte_RAM_D
	RTS


ReadGroundTileVertical:
	STX byte_RAM_C
	STY byte_RAM_D
	LDX CurrentWorldTileset
	LDA GroundTilesVerticalLo, X
	STA byte_RAM_7
	LDA GroundTilesVerticalHi, X
	STA byte_RAM_8
	LDY byte_RAM_C
	LDA (byte_RAM_7), Y
	LDX byte_RAM_C
	LDY byte_RAM_D
	RTS


;
; Updates the area page and tile placement offset
;
; ##### Input
; - `byte_RAM_E8`: area page
; - `byte_RAM_E5`: tile placement offset shift
; - `byte_RAM_E6`: previous tile placement offset
;
; ##### Output
; - `byte_RAM_1`: low byte of decoded level data RAM
; - `byte_RAM_2`: high byte of decoded level data RAM
; - `byte_RAM_E7`: target tile placement offset
;
SetTileOffsetAndAreaPageAddr_Bank6:
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	LDA byte_RAM_E6
	CLC
	ADC byte_RAM_E5
	STA byte_RAM_E7
	RTS

;
; Updates the area page that we're drawing tiles to
;
; ##### Input
; - `X`: area page
;
; ##### Output
; - `byte_RAM_1`: low byte of decoded level data RAM
; - `byte_RAM_2`: high byte of decoded level data RAM
;
SetAreaPageAddr_Bank6:
	LDA DecodedLevelPageStartLo_Bank6, X
	STA byte_RAM_1
	LDA DecodedLevelPageStartHi_Bank6, X
	STA byte_RAM_2
	RTS


IncrementAreaXOffset:
	INY
	TYA
	AND #$0F
	BNE IncrementAreaXOffset_Exit

	TYA
	SEC
	SBC #$10
	TAY
	STX byte_RAM_B
	LDX byte_RAM_E8
	INX
	STX byte_RAM_D
	JSR SetAreaPageAddr_Bank6
	LDX byte_RAM_B

IncrementAreaXOffset_Exit:
	RTS


; Moves one row down and increments the page, if necessary
IncrementAreaYOffset:
	TYA
	CLC
	ADC #$10
	TAY
	CMP #$F0
	BCC IncrementAreaYOffset_Exit

	; increment the area page
	LDX byte_RAM_E8
	INX
	JSR SetAreaPageAddr_Bank6

	TYA
	AND #$0F
	TAY

IncrementAreaYOffset_Exit:
	RTS


IFNDEF DISABLE_DOOR_POINTERS
;
; Consume the object as an area pointer. This overwrites any existing area
; pointer for this page.
;
LevelParser_EatDoorPointer:
	LDY byte_RAM_4
	INY
	LDA (byte_RAM_5), Y
	STA byte_RAM_7
	INY
	LDA (byte_RAM_5), Y
	STA byte_RAM_8
	STY byte_RAM_4
	LDA byte_RAM_E8
	ASL A
	TAY
	LDA byte_RAM_7
	STA AreaPointersByPage, Y
	INY
	LDA byte_RAM_8
	STA AreaPointersByPage, Y
	RTS
ENDIF

;
; High byte of the PPU scroll offset for nametable B.
;
; When mirroring vertically, nametable A is `$2000` and nametable B is `$2800`.
; When mirroring horizontally, nametable A is `$2000` and nametable B is `$2400`.
;
PPUScrollHiOffsets_Bank6:
	.db $28 ; vertical
	.db $24 ; horizontal

;
; Resets the PPU high scrolling values and sets the high byte of the PPU scroll offset.
;
; The version of the subroutine in this bank is always called with `A = $00`.
;
; ##### Input
; - `A`: 0 = use nametable A, 1 = use nametable B
; - `Y`: 0 = vertical, 1 = horizontal
;
; ##### Output
; - `PPUScrollYHiMirror`
; - `PPUScrollXHiMirror`
; - `PPUScrollCheckHi`: PPU scroll offset high byte
;
ResetPPUScrollHi_Bank6:
	LSR A
	BCS ResetPPUScrollHi_NametableB_Bank6

ResetPPUScrollHi_NametableA_Bank6:
	LDA #$01
	STA PPUScrollXHiMirror
	ASL A
	STA PPUScrollYHiMirror
	LDA #$20
	BNE ResetPPUScrollHi_Exit_Bank6

ResetPPUScrollHi_NametableB_Bank6:
	LDA #$00
	STA PPUScrollXHiMirror
	STA PPUScrollYHiMirror
	LDA PPUScrollHiOffsets_Bank6, Y

ResetPPUScrollHi_Exit_Bank6:
	STA PPUScrollCheckHi
	RTS


;
; Creates a mushroom object in subspace.
;
; ##### Input
; - `X`: Object position
; - `Y`: Which mushroom (0 or 1)
;
CreateSubspaceMushroomObject:
	TXA
	PHA
	AND #$F0
	STA ObjectYLo
	TXA
	ASL A
	ASL A
	ASL A
	ASL A
	STA ObjectXLo

	; Subspace is page `$0A`.
	LDA #$0A
	STA ObjectXHi
	LDX #$00
	STX byte_RAM_12
	STX ObjectYHi

	; Create a living fungus.
	; Even most of this routine uses an enemy slot offset, the next few lines assume slot 0.
	; We just set `X` to 0, so this is a safe enough assumption.
	LDA #Enemy_Mushroom
	STA ObjectType
	LDA #EnemyState_Alive
	STA EnemyState
	; Keep track of which mushroom so that you can't collect it twice.
	STY EnemyVariable

	; Reset various object timers and attributes
	LDA #$00
	STA ObjectTimer1, X
	STA EnemyArray_B1, X
	STA ObjectBeingCarriedTimer, X
	STA ObjectAnimationTimer, X
	STA ObjectShakeTimer, X
	STA EnemyCollision, X
	STA ObjectStunTimer, X
	STA ObjectTimer2, X
	STA ObjectFlashTimer, X
	STA ObjectYVelocity, X
	STA ObjectXVelocity, X

	; Load various object attributes for a mushroom
	LDY ObjectType, X
	LDA ObjectAttributeTable, Y
	AND #$7F
	STA ObjectAttributes, X
	LDA EnemyArray_46E_Data, Y
	STA EnemyArray_46E, X
	LDA ObjectHitbox_Data, Y
	STA ObjectHitbox, X
	LDA EnemyArray_492_Data, Y
	STA EnemyArray_492, X
	LDA #$FF
	STA EnemyRawDataOffset, X

	; Restore X to its previous value
	PLA
	TAX

	RTS
