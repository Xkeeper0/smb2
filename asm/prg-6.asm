
      ;.segment	BANK6
;       *	=  $8000
WorldBackgroundPalettePointersLo:.BYTE <World1BackgroundPalettes

      .BYTE <World2BackgroundPalettes
      .BYTE <World3BackgroundPalettes
      .BYTE <World4BackgroundPalettes
      .BYTE <World5BackgroundPalettes
      .BYTE <World6BackgroundPalettes
      .BYTE <World7BackgroundPalettes
WorldSpritePalettePointersLo:.BYTE <World1SpritePalettes ;	DATA XREF: sub_BANK6_938A+7r

      .BYTE <World2SpritePalettes
      .BYTE <World3SpritePalettes
      .BYTE <World4SpritePalettes
      .BYTE <World5SpritePalettes
      .BYTE <World6SpritePalettes
      .BYTE <World7SpritePalettes
WorldBackgroundPalettePointersHi:.BYTE >World1BackgroundPalettes

      .BYTE >World2BackgroundPalettes
off_BANK6_8010:.BYTE >World3BackgroundPalettes
      .BYTE >World4BackgroundPalettes
      .BYTE >World5BackgroundPalettes
      .BYTE >World6BackgroundPalettes
      .BYTE >World7BackgroundPalettes
WorldSpritePalettePointersHi:.BYTE >World1SpritePalettes

      .BYTE >World2SpritePalettes
      .BYTE >World3SpritePalettes
      .BYTE >World4SpritePalettes
      .BYTE >World5SpritePalettes
      .BYTE >World6SpritePalettes
      .BYTE >World7SpritePalettes
World1BackgroundPalettes:.BYTE $21
      .BYTE $30	
      .BYTE $12
      .BYTE  $F
      .BYTE $21
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $21
      .BYTE $27
      .BYTE $17
      .BYTE  $F
      .BYTE $21
      .BYTE $29
      .BYTE $1A
      .BYTE  $F
      .BYTE  $F
      .BYTE $30	
      .BYTE $12
      .BYTE   1
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   8
      .BYTE  $F
      .BYTE $29
      .BYTE $1A
      .BYTE  $A
      .BYTE  $F
      .BYTE $2C
      .BYTE $1C
      .BYTE  $C
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   8
      .BYTE  $F
      .BYTE $2A
      .BYTE $1A
      .BYTE  $A
      .BYTE   7
      .BYTE $30	
      .BYTE $27
      .BYTE  $F
      .BYTE   7
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   7
      .BYTE $27
      .BYTE $17
      .BYTE  $F
      .BYTE   7
      .BYTE $31	; 1
      .BYTE $21
      .BYTE  $F
      .BYTE   3
      .BYTE $2C
      .BYTE $1C
      .BYTE  $F
      .BYTE   3
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   3
      .BYTE $3C
      .BYTE $1C
      .BYTE  $F
      .BYTE   3
      .BYTE $25
      .BYTE $15
      .BYTE   5
      .BYTE  $C
      .BYTE $30	
      .BYTE   6
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $26
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
unk_BANK6_8083:.BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
World1SpritePalettes:.BYTE $FF

      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $10
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $25
      .BYTE $10
      .BYTE  $F
World2BackgroundPalettes:.BYTE $11

      .BYTE $30	
      .BYTE $2A
      .BYTE  $F
      .BYTE $11
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $11
      .BYTE $28
      .BYTE $18
      .BYTE  $F
      .BYTE $11
      .BYTE $17
      .BYTE   7
      .BYTE  $F
      .BYTE  $F
      .BYTE $30	
      .BYTE $2A
      .BYTE  $A
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $28
      .BYTE $18
      .BYTE   8
      .BYTE  $F
      .BYTE $17
      .BYTE   7
      .BYTE   8
      .BYTE  $F
      .BYTE $2A
      .BYTE $1A
      .BYTE  $A
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $28
      .BYTE $18
      .BYTE   8
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   7
      .BYTE   7
      .BYTE $30	
      .BYTE $27
      .BYTE  $F
      .BYTE   7
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   7
      .BYTE $28
      .BYTE $17
      .BYTE  $F
      .BYTE   7
      .BYTE $31	; 1
      .BYTE $11
      .BYTE  $F
      .BYTE  $C
      .BYTE $2A
      .BYTE $1A
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $17
      .BYTE   7
      .BYTE  $F
      .BYTE  $C
      .BYTE $25
      .BYTE $15
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $1A
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $2A
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $3A
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
World2SpritePalettes:.BYTE $FF

      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $2A
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $2A
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $23
      .BYTE  $F
World3BackgroundPalettes:.BYTE $22
      .BYTE $30	
      .BYTE $12
      .BYTE  $F
      .BYTE $22
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $22
      .BYTE $27
      .BYTE $17
      .BYTE  $F
      .BYTE $22
      .BYTE $29
      .BYTE $1A
      .BYTE  $F
      .BYTE  $F
      .BYTE $30	
      .BYTE $12
      .BYTE   1
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   8
      .BYTE  $F
      .BYTE $29
      .BYTE $1A
      .BYTE   4
      .BYTE  $F
      .BYTE $30	
      .BYTE $1C
      .BYTE  $C
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   8
      .BYTE  $F
      .BYTE $26
      .BYTE $16
      .BYTE   6
      .BYTE   7
      .BYTE $30	
      .BYTE $27
      .BYTE  $F
      .BYTE   7
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   7
      .BYTE $27
      .BYTE $17
      .BYTE  $F
      .BYTE   7
      .BYTE $31	; 1
      .BYTE $31	; 1
      .BYTE  $F
      .BYTE   3
      .BYTE $31	; 1
      .BYTE $21
      .BYTE  $F
      .BYTE   3
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   3
      .BYTE $3C
      .BYTE $1C
      .BYTE  $F
      .BYTE   3
      .BYTE $2A
      .BYTE $1A
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $11
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $21
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
unk_BANK6_81A2:.BYTE $31 ; 1
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
World3SpritePalettes:.BYTE $FF

      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $10
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $2B
unk_BANK6_81D6:.BYTE $10
      .BYTE  $F
World4BackgroundPalettes:.BYTE $23
      .BYTE $30	
      .BYTE $12
      .BYTE  $F
      .BYTE $23
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $23
      .BYTE $2B
      .BYTE $1B
      .BYTE  $F
      .BYTE $23
      .BYTE $30	
      .BYTE $32	; 2
      .BYTE  $F
      .BYTE  $F
      .BYTE $30	
      .BYTE $12
      .BYTE   1
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $2B
      .BYTE $1B
      .BYTE  $B
      .BYTE  $F
      .BYTE $29
      .BYTE $1A
      .BYTE  $A
      .BYTE  $F
      .BYTE $32	; 2
      .BYTE $12
      .BYTE   1
      .BYTE  $F
      .BYTE $30	
unk_BANK6_81FE:.BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $2B
      .BYTE $1B
      .BYTE  $B
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   7
      .BYTE   7
      .BYTE $30	
      .BYTE $27
      .BYTE  $F
      .BYTE   7
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   7
      .BYTE $27
      .BYTE $17
      .BYTE  $F
      .BYTE   7
      .BYTE $21
      .BYTE $21
      .BYTE  $F
      .BYTE   3
      .BYTE $30	
      .BYTE $12
      .BYTE  $F
      .BYTE   3
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   3
      .BYTE $3C
      .BYTE $1C
      .BYTE  $F
      .BYTE   3
      .BYTE $28
      .BYTE $18
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE   0
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $10
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $30	
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
unk_BANK6_823D:.BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
World4SpritePalettes:.BYTE $FF

      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $10
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $27
      .BYTE $16
      .BYTE  $F
World5BackgroundPalettes:.BYTE	$F

      .BYTE $30	
      .BYTE $12
      .BYTE   1
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   1
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   7
      .BYTE  $F
      .BYTE $2B
      .BYTE $1B
      .BYTE  $B
      .BYTE  $F
      .BYTE $30	
      .BYTE $12
      .BYTE   1
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   8
      .BYTE  $F
      .BYTE $29
      .BYTE $1A
      .BYTE  $A
      .BYTE  $F
      .BYTE $31	; 1
      .BYTE $12
      .BYTE   1
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $3C
      .BYTE $1C
      .BYTE  $C
      .BYTE  $F
      .BYTE $2A
      .BYTE $1A
      .BYTE  $A
      .BYTE   7
      .BYTE $30	
      .BYTE $27
      .BYTE  $F
      .BYTE   7
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   7
      .BYTE $27
      .BYTE $17
      .BYTE  $F
      .BYTE   7
      .BYTE $31	; 1
      .BYTE   1
      .BYTE  $F
      .BYTE   1
      .BYTE $2A
      .BYTE $1A
      .BYTE  $F
      .BYTE   1
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   1
      .BYTE $3C
      .BYTE $1C
      .BYTE  $F
      .BYTE   1
      .BYTE $25
      .BYTE $15
      .BYTE   5
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $24
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $34	; 4
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
World5SpritePalettes:.BYTE $FF

      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $10
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $16
      .BYTE $30	
      .BYTE  $F
World6BackgroundPalettes:.BYTE $21
      .BYTE $30	
      .BYTE $2A
      .BYTE  $F
      .BYTE $21
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $21
      .BYTE $28
      .BYTE $18
      .BYTE  $F
      .BYTE $21
      .BYTE $17
      .BYTE   7
      .BYTE  $F
      .BYTE  $F
      .BYTE $30	
      .BYTE $2A
      .BYTE   1
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $28
      .BYTE $18
      .BYTE   8
      .BYTE  $F
      .BYTE $17
      .BYTE   7
      .BYTE   8
      .BYTE  $F
      .BYTE $30	
      .BYTE $12
      .BYTE   1
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
unk_BANK6_8327:.BYTE   2
      .BYTE  $F
      .BYTE $28
      .BYTE $18
      .BYTE   8
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   7
      .BYTE   7
      .BYTE $30	
      .BYTE $27
      .BYTE  $F
      .BYTE   7
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   7
      .BYTE $28
      .BYTE $17
      .BYTE  $F
      .BYTE   7
      .BYTE $31	; 1
      .BYTE   1
      .BYTE  $F
      .BYTE  $C
      .BYTE $2A
      .BYTE $1A
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $17
      .BYTE   7
      .BYTE  $F
      .BYTE  $C
      .BYTE $25
      .BYTE $15
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $1B
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $2B
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $3B
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
World6SpritePalettes:.BYTE $FF

      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $2A
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $2A
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $23
      .BYTE  $F
World7BackgroundPalettes:.BYTE $21
      .BYTE $30	
      .BYTE $12
      .BYTE  $F
      .BYTE $21
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $21
      .BYTE $27
      .BYTE $17
      .BYTE  $F
      .BYTE $21
      .BYTE $29
      .BYTE $1A
      .BYTE  $F
      .BYTE  $F
      .BYTE $30	
      .BYTE $12
      .BYTE   1
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   8
      .BYTE  $F
      .BYTE $29
      .BYTE $1A
      .BYTE  $A
      .BYTE  $F
      .BYTE $2C
      .BYTE $1C
      .BYTE  $C
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $27
      .BYTE $17
      .BYTE   8
      .BYTE  $F
      .BYTE $2A
      .BYTE $1A
      .BYTE  $A
      .BYTE   7
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   7
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   7
      .BYTE $27
      .BYTE $17
      .BYTE  $F
      .BYTE   7
      .BYTE $31	; 1
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE $3C
      .BYTE $2C
      .BYTE  $C
      .BYTE  $F
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE  $F
      .BYTE $28
      .BYTE $18
      .BYTE   8
      .BYTE  $F
      .BYTE $25
      .BYTE $15
      .BYTE   5
      .BYTE  $C
      .BYTE $30	
      .BYTE   8
      .BYTE  $F
      .BYTE  $C
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE  $C
      .BYTE $38	; 8
      .BYTE $18
      .BYTE  $F
      .BYTE  $C
      .BYTE $28
      .BYTE   8
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   1
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
World7SpritePalettes:.BYTE $FF

      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE   2
      .BYTE $FF
      .BYTE $38	; 8
      .BYTE $10
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $25
      .BYTE   2
      .BYTE $FF
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $10
      .BYTE  $F
      .BYTE $FF
      .BYTE $30	
      .BYTE $2A
      .BYTE  $F
off_BANK6_8428:.BYTE <World1GroundTilesHorizontal

      .BYTE <World2GroundTilesHorizontal
      .BYTE <World3GroundTilesHorizontal
      .BYTE <World4GroundTilesHorizontal
      .BYTE <World5GroundTilesHorizontal
      .BYTE <World6GroundTilesHorizontal
      .BYTE <World7GroundTilesHorizontal
off_BANK6_842F:.BYTE <World1GroundTilesVertical

      .BYTE <World2GroundTilesVertical
      .BYTE <World3GroundTilesVertical
      .BYTE <World4GroundTilesVertical
      .BYTE <World5GroundTilesVertical
      .BYTE <World6GroundTilesVertical
      .BYTE <World7GroundTilesVertical
off_BANK6_8436:.BYTE >World1GroundTilesHorizontal

      .BYTE >World2GroundTilesHorizontal
      .BYTE >World3GroundTilesHorizontal
      .BYTE >World4GroundTilesHorizontal
      .BYTE >World5GroundTilesHorizontal
      .BYTE >World6GroundTilesHorizontal
      .BYTE >World7GroundTilesHorizontal
off_BANK6_843D:.BYTE >World1GroundTilesVertical ;	DATA XREF: sub_BANK6_985E+Cr

      .BYTE >World2GroundTilesVertical
      .BYTE >World3GroundTilesVertical
      .BYTE >World4GroundTilesVertical
off_BANK6_8441:.BYTE >World5GroundTilesVertical
      .BYTE >World6GroundTilesVertical
      .BYTE >World7GroundTilesVertical
World1GroundTilesHorizontal:.BYTE 0, $99, $D5, 0, 0, $99, $99, $99, 0, $A0, $A0, $A0, 0, $A2, $A2, $A2
      .BYTE 0, $D6, $9B, $18, 0, $A0, $A0, $99,	0, 0, 0, 0, 0, 0, 0, 0;	$10
World1GroundTilesVertical:.BYTE	0, $9D,	$9E, $C6, 0, 5,	$A0, 0,	0, 0, 0, 0, 0, 0, $A2, 0
      .BYTE 0, 0, $C2, 0, 0, 0,	$A0, 0,	0, $93,	$9E, $C6, 0, $40, $9E, $C6; $10
World2GroundTilesHorizontal:.BYTE 0, $99, $99, $99, 0, $8A, $8A, $8A, 0, $8B, $8B, $8B,	0, $A0,	$A0, $A0
      .BYTE 0, $A2, $A2, $A2, 0, $D6, $9B, $18,	0, 0, 0, 0, 0, 0, 0, 0;	$10
World2GroundTilesVertical:.BYTE	0, $9D,	$9E, $C6, 0, $93, $A0, 0, 0, $40, $9B, $40, 0, $93, $9E, $C6
      .BYTE 0, $40, $9E, $C6, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0; $10
World3GroundTilesHorizontal:.BYTE 0, $99, $D5, 0, 0, $99, $99, $99, 0, $A0, $A0, $A0, 0, $A2, $A2, $A2
      .BYTE 0, $D6, $9B, $18, 0, $A0, $A0, $99,	0, 0, 0, 0, 0, 0, 0, 0;	$10
World3GroundTilesVertical:.BYTE	0, $C6,	$9E, $9D, 0, 5,	$A0, 0,	0, $93,	$9E, $C6, 0, 0,	$A2, 0
      .BYTE 0, 0, $C2, 0, 0, 0,	$A0, 0,	0, $40,	$9E, $C6, 0, 6,	$A0, 0;	$10
World4GroundTilesHorizontal:.BYTE 0, $99, $D5, 0, 0, $99, $16, 0, 0, $A0, $A0, $A0, 0, $A2, $A2, $A2
      .BYTE 0, $D6, $9B, $18, 0, $A, $A, 8, 0, $1F, $1F, $1F, 0, 0, 0, 0; $10
World4GroundTilesVertical:.BYTE	0, $C6,	$99, $9D, 0, $A2, $A2, $A2, 0, $9B, $9B, $9B, 0, $A0, $A0, $A0
      .BYTE 0, $D6, $D6, $D6, 0, $18, $18, $18,	0, 0, 0, 0, 0, 0, 0, 0;	$10
World5GroundTilesHorizontal:.BYTE 0, $99, $D5, $40, 0, $99, $99, $99, 0, $A0, $A0, $A0,	0, $A2,	$A2, $A2
      .BYTE 0, $D6, $9B, $18, 0, $A0, $A0, $99,	0, 0, 0, 0, 0, 0, 0, 0;	$10
World5GroundTilesVertical:.BYTE	0, $9D,	$9E, $C6, 0, 5,	$A0, 0,	0, $40,	$A4, 0,	0, 0, $A2, 0
      .BYTE 0, 0, $C2, 0, 0, 0,	$A0, 0,	0, $93,	$9E, $C6, 0, $40, $9E, $C6; $10
World6GroundTilesHorizontal:.BYTE 0, $99, $99, $99, 0, $8A, $8A, $8A, 0, $8B, $8B, $8B,	0, $A0,	$A0, $A0
      .BYTE 0, $A2, $A2, $A2, 0, $D6, $9B, $18,	0, 0, 0, 0, 0, 0, 0, 0;	$10
World6GroundTilesVertical:.BYTE	0, $9D,	$9E, $C6, 0, $93, $A0, 0, 0, $40, $18, $40, 0, $93, $9E, $C6
      .BYTE 0, $40, $9E, $C6, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0; $10
World7GroundTilesHorizontal:.BYTE 0, $9C, $9C, $9C, 0, $D7, $9C, $19, 0, 0, 0, 0, 0, 0,	0, 0
      .BYTE 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0; $10
World7GroundTilesVertical:.BYTE	0, $9C,	$9C, $9C, 0, 5,	$A0, 0,	0, 0, 0, 0, 0, 0, $9C, 0
      .BYTE 0, 0, $C2, 0, 0, 0,	$A0, 0,	0, 0, 0, 0, 0, 0, 0, 0;	$10
UnusedTileQuadPointersLo:.BYTE <UnusedTileQuads1
      .BYTE <UnusedTileQuads2
      .BYTE <UnusedTileQuads3
      .BYTE <UnusedTileQuads4
UnusedTileQuadPointersHi:.BYTE >UnusedTileQuads1
      .BYTE >UnusedTileQuads2
      .BYTE >UnusedTileQuads3
      .BYTE >UnusedTileQuads4
UnusedTileQuads1:.BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $B4
      .BYTE $B6
      .BYTE $B5
      .BYTE $B7
      .BYTE $B8
      .BYTE $FA
      .BYTE $B9
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $B2
      .BYTE $B3
      .BYTE $BE
      .BYTE $BE
      .BYTE $BF
      .BYTE $BF
      .BYTE $BF
      .BYTE $BF
      .BYTE $BF
      .BYTE $BF
      .BYTE $4A
      .BYTE $4A
      .BYTE $4B
      .BYTE $4B
      .BYTE $5E
      .BYTE $5F
      .BYTE $5E
      .BYTE $5F
      .BYTE $E8
      .BYTE $E8
      .BYTE $A9
      .BYTE $A9
      .BYTE $46
      .BYTE $FC
      .BYTE $46
      .BYTE $FC
      .BYTE $A9
      .BYTE $A9
      .BYTE $A9
      .BYTE $A9
      .BYTE $FC
      .BYTE $FC
      .BYTE $FC
      .BYTE $FC
      .BYTE $E9
      .BYTE $E9
      .BYTE $A9
      .BYTE $A9
      .BYTE $FC
      .BYTE $48
      .BYTE $FC
      .BYTE $48
      .BYTE $11
      .BYTE $11
      .BYTE $11
      .BYTE $11
      .BYTE $22
      .BYTE $22
      .BYTE $22
      .BYTE $22
      .BYTE $33	; 3
      .BYTE $33	; 3
      .BYTE $33	; 3
      .BYTE $33	; 3
      .BYTE $E8
      .BYTE $EB
      .BYTE $A9
      .BYTE $A9
      .BYTE $74
      .BYTE $76
      .BYTE $75
      .BYTE $77
      .BYTE $98
      .BYTE $9A
      .BYTE $99
      .BYTE $9B
      .BYTE $9C
      .BYTE $9A
      .BYTE $9D
      .BYTE $9B
      .BYTE $9C
      .BYTE $9E
      .BYTE $9B
      .BYTE $9F
      .BYTE $58
      .BYTE $5A
      .BYTE $59
      .BYTE $5B
      .BYTE $5E
      .BYTE $5F
      .BYTE $5E
      .BYTE $5F
      .BYTE $8E
      .BYTE $8F
      .BYTE $8F
      .BYTE $8E
      .BYTE $72
      .BYTE $73
      .BYTE $73
      .BYTE $72
      .BYTE $A6
      .BYTE $A6
      .BYTE $A7
      .BYTE $A7
      .BYTE $92
      .BYTE $93
      .BYTE $93
      .BYTE $92
      .BYTE $74
      .BYTE $76
      .BYTE $75
      .BYTE $77
      .BYTE $70
      .BYTE $72
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $24
      .BYTE $26
      .BYTE $25
      .BYTE $27
      .BYTE $32	; 2
      .BYTE $34	; 4
      .BYTE $33	; 3
      .BYTE $35	; 5
      .BYTE $33	; 3
      .BYTE $35	; 5
      .BYTE $33	; 3
      .BYTE $35	; 5
      .BYTE $24
      .BYTE $26
      .BYTE $25
      .BYTE $27
UnusedTileQuads2:.BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $FA
      .BYTE $FA
      .BYTE $B0
      .BYTE $B1
      .BYTE $A0
      .BYTE $A2
      .BYTE $A1
      .BYTE $A3
      .BYTE $80
      .BYTE $82
      .BYTE $81
      .BYTE $83
      .BYTE $F4
      .BYTE $86
      .BYTE $F5
      .BYTE $87
      .BYTE $84
      .BYTE $86
      .BYTE $85
      .BYTE $87
      .BYTE $FC
      .BYTE $FC
      .BYTE $FC
      .BYTE $FC
      .BYTE $AD
      .BYTE $FB
      .BYTE $AC
      .BYTE $AD
      .BYTE $AC
      .BYTE $AC
      .BYTE $AC
      .BYTE $AC
      .BYTE $FB
      .BYTE $3B
      .BYTE $3B
      .BYTE $AC
      .BYTE $FC
      .BYTE $FC
      .BYTE $FC
      .BYTE $FC
      .BYTE $F4
      .BYTE $86
      .BYTE $F5
      .BYTE $87
      .BYTE $FB
      .BYTE $49
      .BYTE $49
      .BYTE $FB
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $6D
      .BYTE $FE
      .BYTE $3C
      .BYTE $3E
      .BYTE $3D
      .BYTE $3F
      .BYTE $58
      .BYTE $FD
      .BYTE $59
      .BYTE $5A
      .BYTE $5B
      .BYTE $5A
      .BYTE $FD
      .BYTE $FD
      .BYTE $5B
      .BYTE $5C
      .BYTE $FD
      .BYTE $5D
      .BYTE $FD
      .BYTE $FD
      .BYTE $5B
      .BYTE $5A
      .BYTE $6C
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $6E
      .BYTE $FE
      .BYTE $6F
      .BYTE $20
      .BYTE $22
      .BYTE $21
      .BYTE $23
      .BYTE $6E
      .BYTE $6F
      .BYTE $70
      .BYTE $71
      .BYTE $57
      .BYTE $57
      .BYTE $FB
      .BYTE $FB
      .BYTE $57
      .BYTE $57
      .BYTE $FE
      .BYTE $FE
      .BYTE $D3
      .BYTE $D3
      .BYTE $FB
      .BYTE $FB
      .BYTE $D2
      .BYTE $D2
      .BYTE $FB
      .BYTE $FB
      .BYTE $7C
      .BYTE $7E
      .BYTE $7D
      .BYTE $7F
      .BYTE $CA
      .BYTE $CC
      .BYTE $CB
      .BYTE $CD
      .BYTE $CA
      .BYTE $CC
      .BYTE $CB
      .BYTE $CD
      .BYTE $C0
      .BYTE $C2
      .BYTE $C1
      .BYTE $C3
unk_BANK6_874C:.BYTE $2C
      .BYTE $2E
      .BYTE $2D
      .BYTE $2F
      .BYTE $8E
      .BYTE $8F
      .BYTE $8F
      .BYTE $8E
      .BYTE $88
      .BYTE $8A
      .BYTE $89
      .BYTE $8B
      .BYTE $89
      .BYTE $8B
      .BYTE $89
      .BYTE $8B
      .BYTE $89
      .BYTE $8B
      .BYTE $8C
      .BYTE $8D
      .BYTE $88
      .BYTE $8A
      .BYTE $8C
      .BYTE $8D
      .BYTE $88
      .BYTE $8A
      .BYTE $89
      .BYTE $8B
      .BYTE $88
      .BYTE $8A
      .BYTE $89
      .BYTE $8B
      .BYTE $6A
      .BYTE $6C
      .BYTE $6B
      .BYTE $6D
      .BYTE $6C
      .BYTE $6C
      .BYTE $6D
      .BYTE $6D
      .BYTE $6C
      .BYTE $6E
      .BYTE $6D
      .BYTE $6F
      .BYTE $6C
      .BYTE $54
      .BYTE $6D
      .BYTE $55
      .BYTE $32	; 2
      .BYTE $34	; 4
      .BYTE $33	; 3
      .BYTE $35	; 5
      .BYTE $33	; 3
      .BYTE $35	; 5
      .BYTE $33	; 3
      .BYTE $35	; 5
UnusedTileQuads3:.BYTE $94
unk_BANK6_8785:.BYTE $95
      .BYTE $94
      .BYTE $95
      .BYTE $96
      .BYTE $97
      .BYTE $96
      .BYTE $97
      .BYTE $48
      .BYTE $49
      .BYTE $48
      .BYTE $49
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FB
      .BYTE $32	; 2
      .BYTE $32	; 2
      .BYTE $33	; 3
      .BYTE $33	; 3
      .BYTE $33	; 3
      .BYTE $33	; 3
      .BYTE $33	; 3
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $34	; 4
      .BYTE $FB
      .BYTE $FD
      .BYTE $34	; 4
      .BYTE $FB
      .BYTE $30	
      .BYTE $FB
      .BYTE $FB
      .BYTE $FB
      .BYTE $FB
unk_BANK6_87AA:.BYTE $31 ; 1
      .BYTE $FB
      .BYTE $D0
      .BYTE $D0
      .BYTE $D0
      .BYTE $D0
      .BYTE $D1
      .BYTE $D1
      .BYTE $D1
      .BYTE $D1
      .BYTE $64
      .BYTE $66
      .BYTE $65
      .BYTE $67
      .BYTE $68
      .BYTE $6A
      .BYTE $69
      .BYTE $6B
      .BYTE $FA
      .BYTE $6C
      .BYTE $FA
      .BYTE $6C
      .BYTE $6D
      .BYTE $FA
      .BYTE $6D
      .BYTE $FA
      .BYTE $92
      .BYTE $93
      .BYTE $93
      .BYTE $92
      .BYTE $AE
      .BYTE $AF
      .BYTE $AE
      .BYTE $AF
      .BYTE $78
      .BYTE $7A
      .BYTE $79
      .BYTE $7B
      .BYTE $A8
      .BYTE $A8
      .BYTE $AF
      .BYTE $AE
      .BYTE $94
      .BYTE $95
      .BYTE $94
      .BYTE $95
      .BYTE $96
      .BYTE $97
      .BYTE $96
      .BYTE $97
      .BYTE $22
      .BYTE $24
      .BYTE $23
      .BYTE $25
      .BYTE $92
      .BYTE $93
      .BYTE $93
      .BYTE $92
      .BYTE $50
      .BYTE $51
      .BYTE $50
      .BYTE $51
      .BYTE $AE
      .BYTE $AF
      .BYTE $AE
      .BYTE $AF
      .BYTE $50
      .BYTE $51
      .BYTE $50
      .BYTE $51
      .BYTE $8E
      .BYTE $8F
      .BYTE $8F
      .BYTE $8E
      .BYTE $72
      .BYTE $73
      .BYTE $73
      .BYTE $72
      .BYTE $50
      .BYTE $52
      .BYTE $51
      .BYTE $53
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $FB
      .BYTE $36	; 6
      .BYTE $36	; 6
      .BYTE $4F
      .BYTE $4F
      .BYTE $4E
      .BYTE $4E
      .BYTE $4F
      .BYTE $4E
      .BYTE $4F
      .BYTE $4F
      .BYTE $4E
      .BYTE $92
      .BYTE $93
      .BYTE $93
      .BYTE $92
      .BYTE $8E
      .BYTE $8F
      .BYTE $8F
      .BYTE $8E
      .BYTE $44
      .BYTE $45
      .BYTE $45
      .BYTE $44
      .BYTE $4F
      .BYTE $37	; 7
      .BYTE $4E
      .BYTE $FE
      .BYTE $4F
      .BYTE $3A
      .BYTE $4E
      .BYTE $FE
      .BYTE $4F
      .BYTE $4E
      .BYTE $37	; 7
      .BYTE $38	; 8
      .BYTE $4A
      .BYTE $4B
      .BYTE $FE
      .BYTE $FE
      .BYTE $72
      .BYTE $73
      .BYTE $4A
      .BYTE $4B
      .BYTE $40
      .BYTE $42
      .BYTE $41
      .BYTE $43
      .BYTE $41
      .BYTE $43
      .BYTE $41
      .BYTE $43
UnusedTileQuads4:.BYTE $40
      .BYTE $42
      .BYTE $41
      .BYTE $43
      .BYTE $40
      .BYTE $42
      .BYTE $41
      .BYTE $43
      .BYTE $BA
      .BYTE $BC
      .BYTE $BB
      .BYTE $BD
      .BYTE $BA
      .BYTE $BC
      .BYTE $90
      .BYTE $91
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FA
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $61
      .BYTE $63
      .BYTE $61
      .BYTE $63
      .BYTE $65
      .BYTE $63
      .BYTE $65
      .BYTE $63
      .BYTE $65
      .BYTE $67
      .BYTE $65
      .BYTE $67
      .BYTE $60
      .BYTE $62
      .BYTE $61
      .BYTE $63
      .BYTE $32	; 2
      .BYTE $34	; 4
      .BYTE $33	; 3
      .BYTE $35	; 5
      .BYTE $64
      .BYTE $62
      .BYTE $65
      .BYTE $63
      .BYTE $36	; 6
      .BYTE $34	; 4
      .BYTE $37	; 7
      .BYTE $35	; 5
      .BYTE $64
      .BYTE $66
      .BYTE $65
      .BYTE $67
      .BYTE $36	; 6
      .BYTE $38	; 8
      .BYTE $37	; 7
      .BYTE $39	; 9
      .BYTE $68
      .BYTE $62
      .BYTE $61
      .BYTE $63
      .BYTE $64
      .BYTE $69
      .BYTE $65
      .BYTE $67
      .BYTE $46
      .BYTE $62
      .BYTE $61
      .BYTE $63
      .BYTE $64
      .BYTE $47
      .BYTE $65
      .BYTE $67
      .BYTE $BA
      .BYTE $BC
      .BYTE $BB
      .BYTE $BD
      .BYTE $70
      .BYTE $72
      .BYTE $71
      .BYTE $73
      .BYTE $8E
      .BYTE $8F
      .BYTE $8F
      .BYTE $8E
      .BYTE $72
      .BYTE $73
      .BYTE $73
      .BYTE $72
unk_BANK6_8894:.BYTE $44
      .BYTE $45
      .BYTE $45
      .BYTE $44
; ---------------------------------------------------------------------------

loc_BANK6_8898:
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK6_8A53
      .WORD loc_BANK6_8A53
      .WORD loc_BANK6_8A53
      .WORD loc_BANK6_8A53
      .WORD loc_BANK6_8A53
      .WORD loc_BANK6_8B02
      .WORD loc_BANK6_8B02
      .WORD loc_BANK6_8B02
      .WORD loc_BANK6_8EB8
      .WORD loc_BANK6_8BB3
      .WORD loc_BANK6_8B77
      .WORD loc_BANK6_8B77
      .WORD loc_BANK6_8D95
; ---------------------------------------------------------------------------

loc_BANK6_88B5:
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK6_8B4E
      .WORD loc_BANK6_8B4E
      .WORD loc_BANK6_8B4E
      .WORD loc_BANK6_8B4E
      .WORD loc_BANK6_8B4E
      .WORD loc_BANK6_8B4E
      .WORD loc_BANK6_8CC5
      .WORD loc_BANK6_8CC5
      .WORD loc_BANK6_8CC5
      .WORD loc_BANK6_9020
      .WORD loc_BANK6_9020
      .WORD loc_BANK6_9020
      .WORD loc_BANK6_8CED
      .WORD loc_BANK6_8CED
      .WORD loc_BANK6_8E4A
      .WORD loc_BANK6_90D3
; ---------------------------------------------------------------------------

loc_BANK6_88D8:
      LDA     byte_RAM_50E
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK6_8CAF
      .WORD loc_BANK6_8CBB
      .WORD loc_BANK6_8D13
      .WORD loc_BANK6_8A61
      .WORD loc_BANK6_8AD0
      .WORD loc_BANK6_8C56
      .WORD loc_BANK6_8C56
      .WORD loc_BANK6_8DD2
      .WORD loc_BANK6_8D4E
      .WORD loc_BANK6_8D4E
      .WORD loc_BANK6_90FA
      .WORD loc_BANK6_9115
      .WORD loc_BANK6_9020
      .WORD loc_BANK6_9020
      .WORD loc_BANK6_8FF6
      .WORD loc_BANK6_8F91
; ---------------------------------------------------------------------------

loc_BANK6_88FE:
      JMP     loc_BANK6_8D3F

; ---------------------------------------------------------------------------
WorldObjectTilePointersLo:.BYTE	<World1ObjectTiles

      .BYTE <World2ObjectTiles
      .BYTE <World3ObjectTiles
      .BYTE <World4ObjectTiles
      .BYTE <World5ObjectTiles
      .BYTE <World6ObjectTiles
      .BYTE <World7ObjectTiles
WorldObjectTilePointersHi:.BYTE	>World1ObjectTiles

      .BYTE >World2ObjectTiles
      .BYTE >World3ObjectTiles
      .BYTE >World4ObjectTiles
      .BYTE >World5ObjectTiles
      .BYTE >World6ObjectTiles
      .BYTE >World7ObjectTiles
World1ObjectTiles:.BYTE	$97, $92, $12, $12		      
      .BYTE $1C, $99, $1C, $1C			  ; 4
      .BYTE $45, $45, $45, $45			  ; 8
      .BYTE $65, $65, $65, $65			  ; $C
      .BYTE $1A, $1A, $1A, $1A			  ; $10
      .BYTE $A0, 0, $9D, $A2			  ; $14
      .BYTE $A0, $A0, $A0, $A0			  ; $18
      .BYTE $80, 7, $81, $80			  ; $1C
      .BYTE $81, $81, $81, $81			  ; $20
World2ObjectTiles:.BYTE	$96, $92, $93, $12		      
      .BYTE $1C, $1C, $1C, $1C			  ; 4
      .BYTE $45, $45, $45, $45			  ; 8
      .BYTE $65, $65, $65, $65			  ; $C
      .BYTE $1A, $1A, $1A, $1A			  ; $10
      .BYTE $A0, $40, $9D, $18			  ; $14
      .BYTE $A0, $A0, $A0, $A0			  ; $18
      .BYTE $80, 7, $81, $80			  ; $1C
      .BYTE $81, $81, $81, $81			  ; $20
World3ObjectTiles:.BYTE	$97, $92, $12, $12		      
      .BYTE $1C, $99, $A0, $1C			  ; 4
      .BYTE $45, $45, $45, $45			  ; 8
      .BYTE $65, $65, $65, $65			  ; $C
      .BYTE $1A, $1A, $1A, $1A			  ; $10
      .BYTE $A0, 0, $9D, $A2			  ; $14
      .BYTE $A0, $A0, $A0, $A0			  ; $18
      .BYTE $80, 7, $81, $80			  ; $1C
      .BYTE $81, $81, $81, $81			  ; $20
World4ObjectTiles:.BYTE	$16, $92, $16, $12		      
      .BYTE $1C, $99, $A2, $18			  ; 4
      .BYTE $45, $45, $45, $45			  ; 8
      .BYTE $65, $65, $65, $65			  ; $C
      .BYTE $1A, $1A, $1A, $1A			  ; $10
      .BYTE $A0, $1F, $9D, $18			  ; $14
      .BYTE $A0, $A0, $A0, $A0			  ; $18
      .BYTE $80, 7, $81, $80			  ; $1C
      .BYTE $81, $81, $81, $81			  ; $20
World5ObjectTiles:.BYTE	$97, $92, $12, $12		      
      .BYTE $1C, $99, $1C, $1C			  ; 4
      .BYTE $45, $45, $45, $45			  ; 8
      .BYTE $65, $65, $65, $65			  ; $C
      .BYTE $1A, $1A, $1A, $1A			  ; $10
      .BYTE $A0, $A4, $9D, $18			  ; $14
      .BYTE $A0, $A0, $A0, $A0			  ; $18
      .BYTE $80, 7, $81, $80			  ; $1C
      .BYTE $81, $81, $81, $81			  ; $20
World6ObjectTiles:.BYTE	$96, $92, $93, $12		      
      .BYTE $1C, $1C, $1C, $1C			  ; 4
      .BYTE $45, $45, $45, $45			  ; 8
      .BYTE $65, $65, $65, $65			  ; $C
      .BYTE $1A, $1A, $1A, $1A			  ; $10
      .BYTE $A0, $40, $9D, $18			  ; $14
      .BYTE $A0, $A0, $A0, $A0			  ; $18
      .BYTE $80, 7, $81, $80			  ; $1C
      .BYTE $81, $81, $81, $81			  ; $20
World7ObjectTiles:.BYTE	$12, $68, $12, $9D		      
      .BYTE $9C, $67, $64, $69			  ; 4
      .BYTE $45, $45, $45, $45			  ; 8
      .BYTE $65, $65, $65, $65			  ; $C
      .BYTE $1A, $1A, $1A, $1A			  ; $10
      .BYTE $9C, $9C, $9C, $9C			  ; $14
      .BYTE $A0, $A0, $A0, $A0			  ; $18
      .BYTE $80, 7, $81, $80			  ; $1C
      .BYTE $81, $81, $81, $81			  ; $20
; ---------------------------------------------------------------------------

loc_BANK6_8A0B:
      LDA     byte_RAM_50E
      ASL     A
      ASL     A
      STA     byte_RAM_F
      LDA     byte_RAM_50E
      CMP     #7
      BCC     loc_BANK6_8A1F

      LDA     byte_RAM_543
      JMP     loc_BANK6_8A22

; ---------------------------------------------------------------------------

loc_BANK6_8A1F:
      LDA     byte_RAM_542

loc_BANK6_8A22:
      CLC
      ADC     byte_RAM_F
      TAX
      LDA     byte_RAM_50E
      CMP     #3
      BNE     loc_BANK6_8A37

      LDA     (byte_RAM_1),Y
      CMP     #$90
      BNE     loc_BANK6_8A37

      LDA     #$66
      BNE     loc_BANK6_8A50

loc_BANK6_8A37:
      STX     byte_RAM_7
      STY     byte_RAM_8
      LDX     BackgroundCHR2TimerIndex
      LDA     WorldObjectTilePointersLo,X
      STA     word_RAM_C
      LDA     WorldObjectTilePointersHi,X
      STA     word_RAM_C+1
      LDY     byte_RAM_7
      LDA     (word_RAM_C),Y
      LDY     byte_RAM_8
      LDX     byte_RAM_7

loc_BANK6_8A50:
      STA     (byte_RAM_1),Y
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8A53:
      LDY     byte_RAM_E7

loc_BANK6_8A55:
      JSR     loc_BANK6_8A0B

      JSR     sub_BANK6_9890

loc_BANK6_8A5B:
      DEC     byte_RAM_50D
      BPL     loc_BANK6_8A55

      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8A61:
      LDA     BackgroundCHR2TimerIndex
      CMP     #5
      BNE     loc_BANK6_8A6B

      JMP     loc_BANK6_8A9C

; ---------------------------------------------------------------------------

loc_BANK6_8A6B:
      LDY     byte_RAM_E7
      LDA     #$52
      STA     (byte_RAM_1),Y
      INY
      LDA     #$53
      STA     (byte_RAM_1),Y
      LDA     byte_RAM_E7
      CLC
      ADC     #$10
      TAY
      LDA     #$52
      STA     (byte_RAM_1),Y
      INY
      LDA     #$54
      STA     (byte_RAM_1),Y
      INY
      LDA     #$53
      STA     (byte_RAM_1),Y
      LDA     BackgroundCHR2TimerIndex
      CMP     #5
      BEQ     locret_BANK6_8A9B

      LDA     BackgroundCHR2TimerIndex
      CMP     #6
      BEQ     locret_BANK6_8A9B

      JSR     sub_BANK6_98BC

locret_BANK6_8A9B:
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8A9C:
      LDY     byte_RAM_E7
      LDA     #0
      STA     byte_RAM_8

loc_BANK6_8AA2:
      LDA     (byte_RAM_1),Y
      CMP     #$40
      BNE     locret_BANK6_8ACF

      LDA     #$52
      STA     (byte_RAM_1),Y
      LDA     byte_RAM_8
      TAX

loc_BANK6_8AAF:
      CPX     #0
      BEQ     loc_BANK6_8ABC

      INY
      LDA     #$54
      STA     (byte_RAM_1),Y
      DEX
      JMP     loc_BANK6_8AAF

; ---------------------------------------------------------------------------

loc_BANK6_8ABC:
      INY
      LDA     #$53
      STA     (byte_RAM_1),Y
      INC     byte_RAM_8
      LDY     byte_RAM_E7
      TYA
      CLC
      ADC     #$10
      TAY
      STA     byte_RAM_E7
      JMP     loc_BANK6_8AA2

; ---------------------------------------------------------------------------

locret_BANK6_8ACF:
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8AD0:
      LDY     byte_RAM_E7
      LDA     #$52
      STA     (byte_RAM_1),Y
      DEY
      LDA     #$55
      STA     (byte_RAM_1),Y
      LDY     byte_RAM_E7
      TYA
      CLC
      ADC     #$10
      TAY
      LDA     #$52
      STA     (byte_RAM_1),Y
      DEY
      LDA     #$54
      STA     (byte_RAM_1),Y
      DEY
      LDA     #$55
      STA     (byte_RAM_1),Y
      LDA     BackgroundCHR2TimerIndex
      CMP     #5
      BEQ     locret_BANK6_8B01

      LDA     BackgroundCHR2TimerIndex
      CMP     #6
      BEQ     locret_BANK6_8B01

      JSR     sub_BANK6_98BC

locret_BANK6_8B01:
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8B02:
      LDY     byte_RAM_E7
      LDA     byte_RAM_50E

loc_BANK6_8B07:
      CMP     #6
      BNE     loc_BANK6_8B26

      LDA     CurrentLevel
      CMP     #$E
      BNE     loc_BANK6_8B26

      LDA     CurrentLevelArea
      CMP     #5
      BNE     loc_BANK6_8B26

loc_BANK6_8B19:
      LDA     #$22
      STA     (byte_RAM_1),Y
      JSR     sub_BANK6_98A8

      DEC     byte_RAM_50D
      BPL     loc_BANK6_8B19

      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8B26:
      LDA     byte_RAM_50E
      CMP     #6
      BNE     loc_BANK6_8B34

      LDA     #$9F
      STA     (byte_RAM_1),Y
      JMP     loc_BANK6_8B37

; ---------------------------------------------------------------------------

loc_BANK6_8B34:
      JSR     loc_BANK6_8A0B

loc_BANK6_8B37:
      JSR     sub_BANK6_98A8

      DEC     byte_RAM_50D
      BPL     loc_BANK6_8B34

      RTS

; ---------------------------------------------------------------------------
byte_BANK6_8B40:.BYTE $69

      .BYTE $6C
      .BYTE $9D
      .BYTE $D4
      .BYTE $72
      .BYTE $94
      .BYTE $95
byte_BANK6_8B47:.BYTE $69

      .BYTE $6C
      .BYTE $9D
      .BYTE $17
      .BYTE $72
      .BYTE $94
      .BYTE $95
; ---------------------------------------------------------------------------

loc_BANK6_8B4E:
      LDA     byte_RAM_50E
      TAX
      CMP     #5
      BNE     loc_BANK6_8B5C

      LDA     byte_RAM_543
      BEQ     loc_BANK6_8B5C

      INX

loc_BANK6_8B5C:
      LDY     byte_RAM_E7
      LDA     BackgroundCHR2TimerIndex
      CMP     #6
      BNE     loc_BANK6_8B6B

      LDA     byte_BANK6_8B47,X
      JMP     loc_BANK6_8B6E

; ---------------------------------------------------------------------------

loc_BANK6_8B6B:
      LDA     byte_BANK6_8B40,X

loc_BANK6_8B6E:
      STA     (byte_RAM_1),Y
      RTS

; ---------------------------------------------------------------------------
byte_BANK6_8B71:.BYTE $75

      .BYTE $13
byte_BANK6_8B73:.BYTE $76

      .BYTE $14
byte_BANK6_8B75:.BYTE $77

      .BYTE $15
; ---------------------------------------------------------------------------

loc_BANK6_8B77:
      LDA     BackgroundCHR2TimerIndex
      CMP     #4
      BNE     loc_BANK6_8B81

      JMP     loc_BANK6_8F52

; ---------------------------------------------------------------------------

loc_BANK6_8B81:
      LDY     byte_RAM_E7
      LDA     byte_RAM_50E
      SEC
      SBC     #$A
      TAX
      LDA     byte_BANK6_8B71,X
      STA     (byte_RAM_1),Y
      DEC     byte_RAM_50D
      BEQ     loc_BANK6_8BA1

loc_BANK6_8B94:
      JSR     sub_BANK6_9890

      LDA     byte_BANK6_8B73,X
      STA     (byte_RAM_1),Y
      DEC     byte_RAM_50D
      BNE     loc_BANK6_8B94

loc_BANK6_8BA1:
      JSR     sub_BANK6_9890

      LDA     byte_BANK6_8B75,X
      STA     (byte_RAM_1),Y
      RTS

; ---------------------------------------------------------------------------
byte_BANK6_8BAA:.BYTE $CA

      .BYTE $CC
      .BYTE $CE
      .BYTE $C7
      .BYTE $C8
      .BYTE $C9
      .BYTE $40
      .BYTE 4
      .BYTE 5
; ---------------------------------------------------------------------------

loc_BANK6_8BB3:
      LDA     BackgroundCHR2TimerIndex
      CMP     #6
      BNE     loc_BANK6_8BBD

      JMP     loc_BANK6_908F

; ---------------------------------------------------------------------------

loc_BANK6_8BBD:
      LDX     #0

loc_BANK6_8BBF:
      STX     byte_RAM_B
      LDX     byte_RAM_E8
      JSR     sub_BANK6_9885

      LDX     #5
      LDY     byte_RAM_E7
      LDX     byte_RAM_B
      LDY     byte_RAM_E7
      LDA     byte_RAM_50D
      STA     byte_RAM_7
      JSR     loc_BANK6_8C04

      INX
      LDA     byte_RAM_7
      BEQ     loc_BANK6_8BE3

loc_BANK6_8BDB:
      JSR     sub_BANK6_9890

      JSR     loc_BANK6_8C04

      BNE     loc_BANK6_8BDB

loc_BANK6_8BE3:
      JSR     sub_BANK6_9890

      INX
      JSR     loc_BANK6_8C04

      LDA     byte_RAM_E7
      CLC
      ADC     #$10
      CMP     #$F0
      BCS     locret_BANK6_8BFA

      LDX     #3
      STA     byte_RAM_E7
      JMP     loc_BANK6_8BBF

; ---------------------------------------------------------------------------

locret_BANK6_8BFA:
      RTS

; ---------------------------------------------------------------------------
byte_BANK6_8BFB:.BYTE $C7

      .BYTE $C8
      .BYTE $C9
byte_BANK6_8BFE:.BYTE $D2

      .BYTE $D0
      .BYTE $D0
byte_BANK6_8C01:.BYTE $D1

      .BYTE $D1
      .BYTE $D3
; ---------------------------------------------------------------------------

loc_BANK6_8C04:
      STX     byte_RAM_8
      TXA
      BNE     loc_BANK6_8C1C

      LDX     #2
      LDA     (byte_RAM_1),Y

loc_BANK6_8C0D:
      CMP     byte_BANK6_8BFB,X
      BEQ     loc_BANK6_8C17

      DEX
      BPL     loc_BANK6_8C0D

      BMI     loc_BANK6_8C35

loc_BANK6_8C17:
      LDA     byte_BANK6_8BFE,X
      BNE     loc_BANK6_8C4B

loc_BANK6_8C1C:
      LDX     byte_RAM_8
      CPX     #2
      BNE     loc_BANK6_8C35

      LDX     #2
      LDA     (byte_RAM_1),Y

loc_BANK6_8C26:
      CMP     byte_BANK6_8BFB,X
      BEQ     loc_BANK6_8C30

      DEX
      BPL     loc_BANK6_8C26

      BMI     loc_BANK6_8C35

loc_BANK6_8C30:
      LDA     byte_BANK6_8C01,X
      BNE     loc_BANK6_8C4B

loc_BANK6_8C35:
      LDX     #8

loc_BANK6_8C37:
      LDA     (byte_RAM_1),Y
      CMP     byte_BANK6_8BAA,X
      BEQ     loc_BANK6_8C46

      DEX
      BPL     loc_BANK6_8C37

      LDX     byte_RAM_8
      JMP     loc_BANK6_8C4D

; ---------------------------------------------------------------------------

loc_BANK6_8C46:
      LDX     byte_RAM_8
      LDA     byte_BANK6_8BAA,X

loc_BANK6_8C4B:
      STA     (byte_RAM_1),Y

loc_BANK6_8C4D:
      LDX     byte_RAM_8
      DEC     byte_RAM_7
      RTS

; ---------------------------------------------------------------------------
unk_BANK6_8C52:.BYTE $52
      .BYTE $C0
unk_BANK6_8C54:.BYTE $52
      .BYTE $82
; ---------------------------------------------------------------------------

loc_BANK6_8C56:
      LDA     BackgroundCHR2TimerIndex
      CMP     #4
      BNE     loc_BANK6_8C60

      JMP     loc_BANK6_8C87

; ---------------------------------------------------------------------------

loc_BANK6_8C60:
      LDA     byte_RAM_50E
      SEC
      SBC     #5
      STA     byte_RAM_7
      TAX
      LDY     byte_RAM_E7
      LDA     unk_BANK6_8C52,X
      STA     (byte_RAM_1),Y

loc_BANK6_8C70:
      JSR     sub_BANK6_98A8

      LDA     (byte_RAM_1),Y
      CMP     #$40
      BNE     locret_BANK6_8C82

      LDX     byte_RAM_7
      LDA     unk_BANK6_8C54,X
      STA     (byte_RAM_1),Y
      BNE     loc_BANK6_8C70

locret_BANK6_8C82:
      RTS

; ---------------------------------------------------------------------------
unk_BANK6_8C83:.BYTE $C0
      .BYTE $C0
unk_BANK6_8C85:.BYTE $82
      .BYTE $82
; ---------------------------------------------------------------------------

loc_BANK6_8C87:
      LDX     #0
      LDA     byte_RAM_50E
      CMP     #5
      BEQ     loc_BANK6_8C91

      INX

loc_BANK6_8C91:
      STX     byte_RAM_7
      LDY     byte_RAM_E7
      LDA     unk_BANK6_8C83,X

loc_BANK6_8C98:
      STA     (byte_RAM_1),Y

loc_BANK6_8C9A:
      JSR     sub_BANK6_98A8

      LDA     (byte_RAM_1),Y
      CMP     #$40
      BNE     locret_BANK6_8CAE

      LDX     byte_RAM_7
      LDA     unk_BANK6_8C85,X
      STA     (byte_RAM_1),Y
      CPY     #$E0
      BCC     loc_BANK6_8C9A

locret_BANK6_8CAE:
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8CAF:
      LDY     byte_RAM_E7
      LDA     #1
      STA     (byte_RAM_1),Y
      INY
      LDA     #2
      STA     (byte_RAM_1),Y
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8CBB:
      LDY     byte_RAM_E7
      LDA     #3
      STA     (byte_RAM_1),Y
      RTS

; ---------------------------------------------------------------------------
byte_BANK6_8CC2:.BYTE $6F

      .BYTE $73
      .BYTE $74
; ---------------------------------------------------------------------------

loc_BANK6_8CC5:
      LDY     byte_RAM_E7
      LDA     byte_RAM_50E
      SEC
      SBC     #6
      TAX
      LDA     byte_BANK6_8CC2,X
      STA     (byte_RAM_1),Y

loc_BANK6_8CD3:
      JSR     sub_BANK6_98A8

      LDA     (byte_RAM_1),Y
      CMP     #$40
      BNE     loc_BANK6_8CE3

      LDA     #$70
      STA     (byte_RAM_1),Y
      JMP     loc_BANK6_8CD3

; ---------------------------------------------------------------------------

loc_BANK6_8CE3:
      TYA
      SEC
      SBC     #$10
      TAY
      LDA     #$71
      STA     (byte_RAM_1),Y
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8CED:
      LDY     byte_RAM_E7
      LDA     byte_RAM_50E
      CMP     #$D
      BEQ     loc_BANK6_8CFD

      LDA     #$C1

loc_BANK6_8CF8:
      STA     (byte_RAM_1),Y

loc_BANK6_8CFA:
      JSR     sub_BANK6_98A8

loc_BANK6_8CFD:
      LDA     (byte_RAM_1),Y
      CMP     #$40
      BNE     locret_BANK6_8D12

      LDA     #$C2
      STA     (byte_RAM_1),Y
      LDA     IsHorizontalLevel
      BEQ     loc_BANK6_8D0F

loc_BANK6_8D0B:
      CPY     #$E0
      BCS     locret_BANK6_8D12

loc_BANK6_8D0F:
      JMP     loc_BANK6_8CFA

; ---------------------------------------------------------------------------

locret_BANK6_8D12:
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8D13:
      LDY     byte_RAM_E7
      LDA     #$C3
      STA     (byte_RAM_1),Y

loc_BANK6_8D19:
      TYA
      SEC
      SBC     #$10
      TAY
      CMP     #$F0
      BCS     locret_BANK6_8D2F

      LDA     (byte_RAM_1),Y
      CMP     #$40
      BNE     locret_BANK6_8D2F

      LDA     #$C2
      STA     (byte_RAM_1),Y
      JMP     loc_BANK6_8D19

; ---------------------------------------------------------------------------

locret_BANK6_8D2F:
      RTS

; ---------------------------------------------------------------------------
unk_BANK6_8D30:.BYTE $43
      .BYTE $44
      .BYTE $45
      .BYTE $46
      .BYTE $47
      .BYTE $48
      .BYTE $49
      .BYTE $4A
      .BYTE $4B
      .BYTE $4E
      .BYTE $4C
      .BYTE $41
      .BYTE $5B
      .BYTE $42
      .BYTE $5A
; ---------------------------------------------------------------------------

loc_BANK6_8D3F:
      LDY     byte_RAM_E7
      LDX     byte_RAM_50E
      LDA     unk_BANK6_8D30,X
      STA     (byte_RAM_1),Y
      RTS

; ---------------------------------------------------------------------------
byte_BANK6_8D4A:.BYTE $90

      .BYTE $A3
byte_BANK6_8D4C:.BYTE $9C
      .BYTE $9C
; ---------------------------------------------------------------------------

loc_BANK6_8D4E:
      LDA     byte_RAM_50E
      SEC
      SBC     #8
      STA     byte_RAM_8
      LDY     byte_RAM_E7
      LDX     byte_RAM_E8
      JSR     sub_BANK6_9885

      LDY     byte_RAM_E7

loc_BANK6_8D5F:
      LDA     #5
      STA     byte_RAM_7
      LDA     (byte_RAM_1),Y
      CMP     #$40
      BNE     locret_BANK6_8D92

loc_BANK6_8D69:
      LDX     byte_RAM_8
      LDA     BackgroundCHR2TimerIndex

loc_BANK6_8D6E:
      CMP     #6
      BNE     loc_BANK6_8D78

loc_BANK6_8D72:
      LDA     byte_BANK6_8D4C,X
      JMP     loc_BANK6_8D7B

; ---------------------------------------------------------------------------

loc_BANK6_8D78:
      LDA     byte_BANK6_8D4A,X

loc_BANK6_8D7B:
      STA     (byte_RAM_1),Y
      JSR     sub_BANK6_9890

      DEC     byte_RAM_7
      BPL     loc_BANK6_8D69

      LDA     byte_RAM_E7
      CLC
      ADC     #$10
      CMP     #$F0
      BCS     locret_BANK6_8D92

      STA     byte_RAM_E7
      JMP     loc_BANK6_8D4E

; ---------------------------------------------------------------------------

locret_BANK6_8D92:
      RTS

; ---------------------------------------------------------------------------
byte_BANK6_8D93:.BYTE 4

      .BYTE 5
; ---------------------------------------------------------------------------

loc_BANK6_8D95:
      LDA     BackgroundCHR2TimerIndex
      CMP     #3
      BNE     loc_BANK6_8D9F

      JMP     loc_BANK6_8F15

; ---------------------------------------------------------------------------

loc_BANK6_8D9F:
      LDA     #0
      STA     byte_RAM_8

loc_BANK6_8DA3:
      LDY     byte_RAM_E7
      LDX     byte_RAM_E8
      JSR     sub_BANK6_9885

      LDY     byte_RAM_E7
      LDA     byte_RAM_50D
      STA     byte_RAM_7
      LDX     byte_RAM_8

loc_BANK6_8DB3:
      LDA     byte_BANK6_8D93,X
      STA     (byte_RAM_1),Y
      JSR     sub_BANK6_9890

      DEC     byte_RAM_7
      BPL     loc_BANK6_8DB3

      LDA     #1
      STA     byte_RAM_8
      LDA     byte_RAM_E7
      CLC
      ADC     #$10
      CMP     #$F0
      BCS     locret_BANK6_8DD1

      STA     byte_RAM_E7
      JMP     loc_BANK6_8DA3

; ---------------------------------------------------------------------------

locret_BANK6_8DD1:
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8DD2:
      LDY     byte_RAM_E7
      LDA     #0
      STA     byte_RAM_8

loc_BANK6_8DD8:
      LDA     (byte_RAM_1),Y
      CMP     #$40
      BEQ     loc_BANK6_8DDF

      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8DDF:
      LDA     #$84
      STA     (byte_RAM_1),Y
      LDX     byte_RAM_8
      BEQ     loc_BANK6_8DF9

loc_BANK6_8DE7:
      INY
      LDA     #$85
      STA     (byte_RAM_1),Y
      DEX
      BNE     loc_BANK6_8DE7

      LDX     byte_RAM_8

loc_BANK6_8DF1:
      INY
      LDA     #$86
      STA     (byte_RAM_1),Y
      DEX
      BNE     loc_BANK6_8DF1

loc_BANK6_8DF9:
      INY
      LDA     #$87
      STA     (byte_RAM_1),Y
      INC     byte_RAM_8
      LDA     byte_RAM_E7
      CLC
      ADC     #$10
      STA     byte_RAM_E7
      SEC
      SBC     byte_RAM_8
      TAY
      JMP     loc_BANK6_8DD8

; ---------------------------------------------------------------------------
      LDY     byte_RAM_E7
      LDA     #$1D

loc_BANK6_8E12:
      STA     (byte_RAM_1),Y

loc_BANK6_8E14:
      JSR     sub_BANK6_98A8

      LDA     (byte_RAM_1),Y
      CMP     #$40
      BEQ     loc_BANK6_8E1E

      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8E1E:
      LDA     #$1E
      STA     (byte_RAM_1),Y
      BNE     loc_BANK6_8E14

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_8E24:
      LDA     byte_RAM_9
      ASL     A
      ASL     A
      SEC
      ADC     byte_RAM_9
      STA     byte_RAM_9
      ASL     byte_RAM_A
      LDA     #$20
      BIT     byte_RAM_A
      BCS     loc_BANK6_8E39

      BNE     loc_BANK6_8E3B

      BEQ     loc_BANK6_8E3D

loc_BANK6_8E39:
      BNE     loc_BANK6_8E3D

loc_BANK6_8E3B:
      INC     byte_RAM_A

loc_BANK6_8E3D:
      LDA     byte_RAM_A
      EOR     byte_RAM_9
      RTS

; End of function sub_BANK6_8E24

; ---------------------------------------------------------------------------
byte_BANK6_8E42:.BYTE $40				    
      .BYTE $88					  ; 1
      .BYTE $40					  ; 2
      .BYTE $40					  ; 3
      .BYTE $40					  ; 4
      .BYTE $40					  ; 5
      .BYTE $89					  ; 6
      .BYTE $40					  ; 7
; ---------------------------------------------------------------------------

loc_BANK6_8E4A:
      LDA     byte_RAM_E8
      STA     word_RAM_C+1
      LDA     #$80
      STA     byte_RAM_A
      LDA     #$31
      STA     byte_RAM_9

loc_BANK6_8E56:
      JSR     sub_BANK6_8E24

      AND     #7
      TAX
      LDA     byte_BANK6_8E42,X
      STA     (byte_RAM_1),Y
      JSR     sub_BANK6_98A8

      CPY     #$30
      BCC     loc_BANK6_8E56

      TYA
      AND     #$F
      TAY
      JSR     sub_BANK6_9890

      LDA     word_RAM_C+1
      STA     byte_RAM_E8
      CMP     #$A
      BNE     loc_BANK6_8E56

      LDA     #0
      STA     byte_RAM_E8
      STA     byte_RAM_E6
      STA     byte_RAM_E5
      RTS

; ---------------------------------------------------------------------------
unk_BANK6_8E80:.BYTE   0
      .BYTE $13
      .BYTE $60
      .BYTE $59
      .BYTE $C
unk_BANK6_8E85:.BYTE   0
      .BYTE $14
byte_BANK6_8E87:.BYTE $61
      .BYTE $59
      .BYTE $C
unk_BANK6_8E8A:.BYTE   0
      .BYTE $15
      .BYTE $62
      .BYTE $59
      .BYTE $C

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_8E8F:
      LDY     byte_RAM_E7
      LDA     byte_RAM_50E
      SEC
      SBC     #$A
      TAX
      LDA     unk_BANK6_8E80,X
      STA     (byte_RAM_1),Y
      DEC     byte_RAM_50D
      BEQ     loc_BANK6_8EAF

loc_BANK6_8EA2:
      JSR     sub_BANK6_9890

      LDA     unk_BANK6_8E85,X
      STA     (byte_RAM_1),Y
      DEC     byte_RAM_50D
      BNE     loc_BANK6_8EA2

loc_BANK6_8EAF:
      JSR     sub_BANK6_9890

      LDA     unk_BANK6_8E8A,X
      STA     (byte_RAM_1),Y
      RTS

; End of function sub_BANK6_8E8F

; ---------------------------------------------------------------------------

loc_BANK6_8EB8:
      LDA     BackgroundCHR2TimerIndex
      CMP     #6
      BNE     loc_BANK6_8EC2

      JMP     loc_BANK6_9115

; ---------------------------------------------------------------------------

loc_BANK6_8EC2:
      LDA     byte_RAM_50D
      STA     byte_RAM_7
      LDA     #$C
      STA     byte_RAM_50E
      JSR     sub_BANK6_8E8F

      INC     byte_RAM_50E

loc_BANK6_8ED2:
      LDA     byte_RAM_7
      STA     byte_RAM_50D
      LDA     byte_RAM_E7
      CLC
      ADC     #$10
      STA     byte_RAM_E7
      CMP     #$B0
      BCC     loc_BANK6_8EE2

loc_BANK6_8EE2:
      LDX     byte_RAM_E8
      JSR     sub_BANK6_9885

      JSR     sub_BANK6_8E8F

      TYA
      AND     #$F0
      CMP     #$B0
      BNE     loc_BANK6_8F01

      JSR     sub_BANK6_9890

      JSR     sub_BANK6_9890

      LDA     #$63
      STA     (byte_RAM_1),Y
      INC     byte_RAM_50E
      JMP     loc_BANK6_8ED2

; ---------------------------------------------------------------------------

loc_BANK6_8F01:
      LDA     byte_RAM_50E
      CMP     #$E
      BNE     loc_BANK6_8ED2

      JSR     sub_BANK6_9890

loc_BANK6_8F0B:
      JSR     sub_BANK6_9890

      LDA     #$11
      STA     (byte_RAM_1),Y
      RTS

; ---------------------------------------------------------------------------
byte_BANK6_8F13:.BYTE $C

      .BYTE $1F
; ---------------------------------------------------------------------------

loc_BANK6_8F15:
      LDA     #1
      STA     byte_RAM_8

loc_BANK6_8F19:
      LDY     byte_RAM_E7
      LDX     byte_RAM_E8
      JSR     sub_BANK6_9885

      LDY     byte_RAM_E7
      LDA     byte_RAM_50D
      STA     byte_RAM_7
      LDX     byte_RAM_8

loc_BANK6_8F29:
      LDA     byte_BANK6_8F13,X
      STA     (byte_RAM_1),Y
      JSR     sub_BANK6_9890

      DEC     byte_RAM_7
      BPL     loc_BANK6_8F29

      LDA     byte_RAM_8
      BNE     loc_BANK6_8F3A

      RTS

; ---------------------------------------------------------------------------

loc_BANK6_8F3A:
      LDA     byte_RAM_E7
      CLC
      ADC     #$10
      CMP     #$C0
      BCC     loc_BANK6_8F45

      DEC     byte_RAM_8

loc_BANK6_8F45:
      STA     byte_RAM_E7
      JMP     loc_BANK6_8F19

; ---------------------------------------------------------------------------
byte_BANK6_8F4A:.BYTE $75

      .BYTE $13
      .BYTE $76
byte_BANK6_8F4D:.BYTE $76

      .BYTE $14
byte_BANK6_8F4F:.BYTE $77

      .BYTE $15
      .BYTE $78
; ---------------------------------------------------------------------------

loc_BANK6_8F52:
      LDY     byte_RAM_E7
      LDA     byte_RAM_50E
      SEC
      SBC     #$A
      TAX
      JSR     sub_BANK6_8F83

      LDA     byte_BANK6_8F4A,X
      STA     (byte_RAM_1),Y
      LDX     byte_RAM_7
      DEC     byte_RAM_50D
      BEQ     loc_BANK6_8F77

loc_BANK6_8F6A:
      JSR     sub_BANK6_9890

loc_BANK6_8F6D:
      LDA     byte_BANK6_8F4D,X
      STA     (byte_RAM_1),Y
      DEC     byte_RAM_50D
      BNE     loc_BANK6_8F6A

loc_BANK6_8F77:
      JSR     sub_BANK6_9890

      JSR     sub_BANK6_8F83

      LDA     byte_BANK6_8F4F,X
      STA     (byte_RAM_1),Y
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_8F83:
      STX     byte_RAM_7
      LDA     (byte_RAM_1),Y
      CMP     #$40
      BEQ     locret_BANK6_8F8D

      LDX     #2

locret_BANK6_8F8D:
      RTS

; End of function sub_BANK6_8F83

; ---------------------------------------------------------------------------
byte_BANK6_8F8E:.BYTE $5E

      .BYTE $5D
      .BYTE $5C
; ---------------------------------------------------------------------------

loc_BANK6_8F91:
      LDA     #4
      STA     byte_RAM_7
      LDY     byte_RAM_E7
      LDX     byte_RAM_E8
      JSR     sub_BANK6_9885

      LDX     #2
      LDA     (byte_RAM_1),Y
      CMP     #$40
      BNE     locret_BANK6_8FC1

loc_BANK6_8FA4:
      LDA     byte_BANK6_8F8E,X
      STA     (byte_RAM_1),Y
      JSR     sub_BANK6_9890

      DEX
      CPX     #1
      BNE     loc_BANK6_8FB4

      JSR     sub_BANK6_8FC2

loc_BANK6_8FB4:
      DEX
      BPL     loc_BANK6_8FA4

      LDY     byte_RAM_E7
      JSR     sub_BANK6_98A8

      STY     byte_RAM_E7
      JMP     loc_BANK6_8F91

; ---------------------------------------------------------------------------

locret_BANK6_8FC1:
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_8FC2:
      LDA     #$5D
      STA     (byte_RAM_1),Y
      JSR     sub_BANK6_9890

      LDA     #$5F
      STA     (byte_RAM_1),Y
      JSR     sub_BANK6_9890

      DEC     byte_RAM_7
      BPL     sub_BANK6_8FC2

      RTS

; End of function sub_BANK6_8FC2

; ---------------------------------------------------------------------------
      .BYTE $52
      .BYTE $1D
      .BYTE $C0
      .BYTE $52
      .BYTE $1E
      .BYTE $82
byte_BANK6_8FDB:.BYTE $9F

      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A5
      .BYTE $A6
      .BYTE $A0
      .BYTE $A7
      .BYTE $A7
      .BYTE $A0
      .BYTE $83
      .BYTE $83
      .BYTE $A0
      .BYTE $83
      .BYTE $83
      .BYTE $A0
      .BYTE $83
      .BYTE $83
      .BYTE $A0
      .BYTE $83
      .BYTE $83
      .BYTE $A0
; ---------------------------------------------------------------------------

loc_BANK6_8FF6:
      LDX     #0

loc_BANK6_8FF8:
      LDY     byte_RAM_E7
      LDA     #2
      STA     byte_RAM_9

loc_BANK6_8FFE:
      LDA     byte_BANK6_8FDB,X
      STA     (byte_RAM_1),Y
      INX

loc_BANK6_9004:
      INY
      DEC     byte_RAM_9
      BPL     loc_BANK6_8FFE

      LDY     byte_RAM_E7
      TYA
      CLC
      ADC     #$10
      STA     byte_RAM_E7
      CPX     #$1B
      BNE     loc_BANK6_8FF8

      RTS

; ---------------------------------------------------------------------------
byte_BANK6_9016:.BYTE $4F

      .BYTE $4F
      .BYTE $83
      .BYTE $A9
      .BYTE $A8
byte_BANK6_901B:.BYTE $50

      .BYTE $51
      .BYTE $83
      .BYTE $83
      .BYTE $83
; ---------------------------------------------------------------------------

loc_BANK6_9020:
      LDY     byte_RAM_E7

loc_BANK6_9022:
      LDA     byte_RAM_50E
      CMP     #9
      BNE     loc_BANK6_9034

      LDA     KeyUsed
      BEQ     loc_BANK6_9034

      INC     byte_RAM_50E

loc_BANK6_9031:
      INC     byte_RAM_50E

loc_BANK6_9034:
      LDA     byte_RAM_50E
      SEC
      SBC     #9
      TAX
      LDA     byte_BANK6_9016,X
      STA     (byte_RAM_1),Y
      JSR     sub_BANK6_98A8

      LDA     byte_BANK6_901B,X
      STA     (byte_RAM_1),Y
      LDA     BackgroundCHR2TimerIndex
      CMP     #5
      BEQ     locret_BANK6_9059

      LDA     BackgroundCHR2TimerIndex
      CMP     #6
      BEQ     locret_BANK6_9059

loc_BANK6_9056:
      JSR     sub_BANK6_98BC

locret_BANK6_9059:
      RTS

; ---------------------------------------------------------------------------
unk_BANK6_905A:.BYTE   0
      .BYTE $13
byte_BANK6_905C:.BYTE $CB
      .BYTE 9
unk_BANK6_905E:.BYTE   0
      .BYTE $14
      .BYTE $CD
      .BYTE $B
unk_BANK6_9062:.BYTE   0
      .BYTE $15
      .BYTE $CF
      .BYTE $D

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9066:
      LDY     byte_RAM_E7
      LDA     byte_RAM_50E
      SEC
      SBC     #$A
      TAX
      LDA     unk_BANK6_905A,X
      STA     (byte_RAM_1),Y
      DEC     byte_RAM_50D
      BEQ     loc_BANK6_9086

loc_BANK6_9079:
      JSR     sub_BANK6_9890

      LDA     unk_BANK6_905E,X
      STA     (byte_RAM_1),Y
      DEC     byte_RAM_50D
      BNE     loc_BANK6_9079

loc_BANK6_9086:
      JSR     sub_BANK6_9890

      LDA     unk_BANK6_9062,X
      STA     (byte_RAM_1),Y
      RTS

; End of function sub_BANK6_9066

; ---------------------------------------------------------------------------

loc_BANK6_908F:
      LDA     byte_RAM_50D
      STA     byte_RAM_7
      LDA     #$C
      STA     byte_RAM_50E
      JSR     sub_BANK6_9066

loc_BANK6_909C:
      LDA     byte_RAM_E7
      CLC
      ADC     #$10
      STA     byte_RAM_E7
      LDA     #$D
      STA     byte_RAM_50E
      LDA     byte_RAM_7
NOP ; @TODO fix abs-to-zp
STA     byte_RAM_50D
      LDX     byte_RAM_E8
      JSR     sub_BANK6_9885

      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y
      CMP     #$40
      BNE     locret_BANK6_90C4

      JSR     sub_BANK6_9066

      LDA     byte_RAM_E7

loc_BANK6_90C0:
      CMP     #$E0

loc_BANK6_90C2:
      BCC     loc_BANK6_909C

locret_BANK6_90C4:
      RTS

; ---------------------------------------------------------------------------
byte_BANK6_90C5:.BYTE $79

      .BYTE $1D
      .BYTE $79
      .BYTE $20
      .BYTE $79
      .BYTE $1D
      .BYTE $AA
byte_BANK6_90CC:.BYTE $7A

      .BYTE $1E
      .BYTE $7A
      .BYTE $21
      .BYTE $7A
      .BYTE $1E
      .BYTE $AB
; ---------------------------------------------------------------------------

loc_BANK6_90D3:
      LDX     BackgroundCHR2TimerIndex
      LDY     byte_RAM_E7
      LDA     byte_BANK6_90C5,X
      STA     (byte_RAM_1),Y

loc_BANK6_90DD:
      JSR     sub_BANK6_98A8

      LDA     (byte_RAM_1),Y
      CMP     #$40
      BNE     locret_BANK6_90F9

      LDX     BackgroundCHR2TimerIndex
      LDA     byte_BANK6_90CC,X
      STA     (byte_RAM_1),Y
      LDA     BackgroundCHR2TimerIndex
      CMP     #4
      BNE     loc_BANK6_90DD

      CPY     #$E0
      BCC     loc_BANK6_90DD

locret_BANK6_90F9:
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_90FA:
      LDY     byte_RAM_E7
      LDA     #$8C
      STA     (byte_RAM_1),Y
      INY
      LDA     #$8D
      STA     (byte_RAM_1),Y
      LDA     byte_RAM_E7
      CLC
      ADC     #$10
      TAY
      LDA     #$8E

loc_BANK6_910D:
      STA     (byte_RAM_1),Y
      INY
      LDA     #$8F
      STA     (byte_RAM_1),Y
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_9115:
      LDY     byte_RAM_E7

loc_BANK6_9117:
      LDA     #$58
      STA     (byte_RAM_1),Y
      TYA
      CLC
      ADC     #$F
      TAY
      DEC     byte_RAM_50D
      BNE     loc_BANK6_9117

      RTS

; ---------------------------------------------------------------------------
; [000000DA BYTES: BEGIN OF AREA UNUSED-BANK6:9126. PRESS KEYPAD "-" TO	COLLAPSE]
_empty_D126:.BYTE $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $40
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $50
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $70
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $80
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $90
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF; $D0
; [000000DA BYTES: END OF AREA UNUSED-BANK6:9126. PRESS	KEYPAD "-" TO COLLAPSE]
MysteryDataD200:.BYTE 0

      .BYTE 0
      .BYTE 0
      .BYTE $24
      .BYTE 0
      .BYTE 0
      .BYTE 2
      .BYTE $54
      .BYTE 0
      .BYTE 2
      .BYTE $55
      .BYTE $54
      .BYTE 0
      .BYTE 2
      .BYTE $7F
      .BYTE $54
      .BYTE 0
      .BYTE 2
      .BYTE $7F
      .BYTE $D4
      .BYTE 0
      .BYTE 3
      .BYTE $FF
      .BYTE $54
      .BYTE 0
      .BYTE 2
      .BYTE $5F
      .BYTE $FC
      .BYTE 0
      .BYTE 3
      .BYTE $FF
      .BYTE $FC
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE $55
      .BYTE $55
      .BYTE $55
      .BYTE $7C
byte_BANK6_9228:.BYTE $E7
      .BYTE $9E
      .BYTE $79
      .BYTE $E4
      .BYTE 0
      .BYTE $E
      .BYTE $79
      .BYTE $E4
      .BYTE 0
      .BYTE 0
      .BYTE 9
      .BYTE $E4
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE $24
      .BYTE $E0
      .BYTE $E
      .BYTE $79
      .BYTE $E4
byte_BANK6_923C:.BYTE $E4
      .BYTE 0
      .BYTE 9
      .BYTE $E4
      .BYTE $E4
      .BYTE 0
      .BYTE 0
      .BYTE $24
      .BYTE $E7
      .BYTE $90
      .BYTE 9
      .BYTE $E4
      .BYTE $E7
      .BYTE $9E
      .BYTE $70
      .BYTE $24
      .BYTE $E7
      .BYTE $9E
      .BYTE $40
      .BYTE $24
      .BYTE $E7
      .BYTE $9C
      .BYTE 0
      .BYTE $24
      .BYTE $E0
      .BYTE $E
      .BYTE $40
      .BYTE $24
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE $E4
      .BYTE $E4
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE $E7
      .BYTE $9E
      .BYTE $79
      .BYTE $E4
      .BYTE $E7
      .BYTE $90
      .BYTE 1
      .BYTE $E4
      .BYTE $E0
      .BYTE 0
      .BYTE 1
      .BYTE $E4
      .BYTE $E7
      .BYTE $90
      .BYTE 0
      .BYTE $24
      .BYTE $E0
      .BYTE 0
      .BYTE 0
      .BYTE $24
      .BYTE 0
      .BYTE 0
      .BYTE 0
byte_BANK6_9277:.BYTE $24
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE $24
byte_BANK6_927C:.BYTE $AA

      .BYTE $AA
      .BYTE $AA
      .BYTE $AA
      .BYTE $80
      .BYTE 0
      .BYTE 0
      .BYTE 2
      .BYTE $AA
      .BYTE   0
unk_BANK6_9286:.BYTE   0
      .BYTE $AA
      .BYTE $FA
      .BYTE 0
      .BYTE 0
      .BYTE $AF
      .BYTE $FE
      .BYTE 0
      .BYTE 0
      .BYTE $BF
      .BYTE $FA
      .BYTE $80
      .BYTE 2
      .BYTE $AF
      .BYTE $E8
      .BYTE 0
      .BYTE 0
      .BYTE $2B
      .BYTE $E0
      .BYTE 0
      .BYTE 0
      .BYTE $B
      .BYTE $FA
      .BYTE $95
      .BYTE $56
      .BYTE $AF
      .BYTE $95
      .BYTE   0
      .BYTE   0
      .BYTE $56
      .BYTE $A5
      .BYTE $55
      .BYTE $55
      .BYTE $5A
      .BYTE $A5
      .BYTE $5A
      .BYTE $A5
      .BYTE $5A
      .BYTE $55
      .BYTE $55
      .BYTE $55
      .BYTE $55
      .BYTE $95
      .BYTE $55
      .BYTE $55
      .BYTE $56
      .BYTE $95
      .BYTE $5A
      .BYTE $A5
      .BYTE $56
      .BYTE $A9
      .BYTE $55
      .BYTE $55
      .BYTE $6A
      .BYTE $81
      .BYTE $55
      .BYTE $55
      .BYTE $42
      .BYTE $AA
      .BYTE $A5
      .BYTE $55
      .BYTE $5A
byte_BANK6_92C4:.BYTE $A5
      .BYTE $55
      .BYTE $5A
      .BYTE $AA
byte_BANK6_92C8:.BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE $80
      .BYTE 0
      .BYTE 0
      .BYTE 2
      .BYTE $A0
      .BYTE 0
      .BYTE 0
      .BYTE $A
      .BYTE $AA
      .BYTE 0
      .BYTE 0
      .BYTE $AA
      .BYTE $AA
      .BYTE $A0
      .BYTE $A
      .BYTE $AA
      .BYTE $80
      .BYTE 0
      .BYTE $A
      .BYTE $AA
      .BYTE $80
      .BYTE $A
      .BYTE $AA
      .BYTE $AA
      .BYTE $AA
      .BYTE $AA
      .BYTE $A0
      .BYTE 2
      .BYTE $AA
      .BYTE $A0
      .BYTE 0
      .BYTE 2
      .BYTE $A0
      .BYTE $A
      .BYTE $A0
      .BYTE $A
      .BYTE $A0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE $A
byte_BANK6_92F8:.BYTE 0

      .BYTE $F0
      .BYTE $E0
      .BYTE $D0
      .BYTE $C0
      .BYTE $B0
      .BYTE $A0
      .BYTE $90
      .BYTE $80
      .BYTE $70
      .BYTE 0
byte_BANK6_9303:.BYTE $60

      .BYTE $60
      .BYTE $61
      .BYTE $62
      .BYTE $63
      .BYTE $64
      .BYTE $65
      .BYTE $66
      .BYTE $67
      .BYTE $68
      .BYTE 7
byte_BANK6_930E:.BYTE $75

      .BYTE $77
byte_BANK6_9310:.BYTE $CA
      .BYTE $CE
      .BYTE $C7
      .BYTE $C8
      .BYTE $D0
      .BYTE $D1
      .BYTE 1
      .BYTE 2
      .BYTE $84
      .BYTE $87
      .BYTE $60
      .BYTE $62
      .BYTE $13
      .BYTE $15
      .BYTE $53
      .BYTE $55
      .BYTE $CB
      .BYTE $CF
      .BYTE 9
      .BYTE $D
unk_BANK6_9324:.BYTE $77
      .BYTE $75
      .BYTE $CE
      .BYTE $CA
      .BYTE $C8
      .BYTE $C7
      .BYTE $D1
      .BYTE $D0
      .BYTE 2
      .BYTE   1
      .BYTE $87
      .BYTE $84
      .BYTE $62
      .BYTE $60
      .BYTE $15
      .BYTE $13
      .BYTE $55
      .BYTE $53
      .BYTE $CF
      .BYTE $CB
      .BYTE  $D
      .BYTE   9

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_933A:
      LDA     #0
      STA     byte_RAM_A
      LDY     #$69
      STY     byte_RAM_B
      LDY     #$5F
      LDA     #$40

loc_BANK6_9346:
      STA     (byte_RAM_A),Y
      DEY
      CPY     #$FF
      BNE     loc_BANK6_9346

      DEC     byte_RAM_B
      LDX     byte_RAM_B
      CPX     #$60
      BCS     loc_BANK6_9346

      LDA     #0
      STA     PPUScrollXMirror
      STA     PPUScrollYMirror
      STA     byte_RAM_536
      STA     byte_RAM_D5
      STA     byte_RAM_E6
      STA     byte_RAM_CA
      STA     byte_RAM_CB
      STA     byte_RAM_4BE
      STA     byte_RAM_4C0
      STA     byte_RAM_D8
NOP ; @TODO fix abs-to-zp
RTS

; End of function sub_BANK6_933A

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9370:
      STY     byte_RAM_E
      STX     word_RAM_C+1
      LDY     BackgroundCHR2TimerIndex
      LDA     WorldBackgroundPalettePointersLo,Y
      STA     byte_RAM_7
      LDA     WorldBackgroundPalettePointersHi,Y
      STA     byte_RAM_8
      LDY     word_RAM_C+1
      LDA     (byte_RAM_7),Y
      LDY     byte_RAM_E
      LDX     word_RAM_C+1
      RTS

; End of function sub_BANK6_9370

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_938A:
      STY     byte_RAM_E
      STX     word_RAM_C+1
      LDY     BackgroundCHR2TimerIndex
      LDA     WorldSpritePalettePointersLo,Y
      STA     byte_RAM_7
      LDA     WorldSpritePalettePointersHi,Y
      STA     byte_RAM_8
      LDY     word_RAM_C+1
      LDA     (byte_RAM_7),Y
      LDY     byte_RAM_E
      LDX     word_RAM_C+1
      RTS

; End of function sub_BANK6_938A

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_93A4:
      LDA     InSubspaceOrJar
      CMP     #1
      BNE     loc_BANK6_93B1

      JSR     HijackLevelDataCopyAddressWithJar	  ; This function call will overwrite the
						  ; normal level loading area with $7A00

      JMP     loc_BANK6_93B4

; ---------------------------------------------------------------------------

loc_BANK6_93B1:
      JSR     RestoreLevelDataCopyAddress

loc_BANK6_93B4:
      LDY     #0
      LDA     (byte_RAM_5),Y

; End of function sub_BANK6_93A4

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_93B8:
      STA     byte_RAM_F

loc_BANK6_93BA:
      AND     #$38
      ASL     A
      TAX
      JSR     sub_BANK6_9370

      STA     byte_RAM_4BC
      LDA     #$3F
      STA     _RAM_PPUDataBuffer
      LDA     #0
      STA     byte_RAM_302
      LDA     #$20
      STA     byte_RAM_303
      LDY     #0

loc_BANK6_93D5:
      JSR     sub_BANK6_9370

      STA     byte_RAM_304,Y
      INX
      INY
      CPY     #$10

loc_BANK6_93DF:
      BCC     loc_BANK6_93D5

      LDA     byte_RAM_F
      AND     #3
      ASL     A
      STA     byte_RAM_F
      ASL     A
      ADC     byte_RAM_F
      ASL     A
      TAX
      LDY     #0

loc_BANK6_93EF:
      JSR     sub_BANK6_938A

      STA     unk_RAM_318,Y
      INX
      INY
      CPY     #$C
      BCC     loc_BANK6_93EF

      LDA     #0
      STA     unk_RAM_318,Y
      LDY     #3

loc_BANK6_9402:
      LDA     unk_RAM_637,Y
      STA     unk_RAM_314,Y
      DEY
      BPL     loc_BANK6_9402

      LDX     #3
      LDY     #$10

loc_BANK6_940F:
      LDA     byte_RAM_4BC
      STA     byte_RAM_304,Y
      INY
      INY
      INY
      INY
      DEX
      BPL     loc_BANK6_940F

      RTS

; End of function sub_BANK6_93B8

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_941D:
      LDA     CurrentLevelArea
      STA     CurrentLevelAreaCopy
      LDA     #$30
      STA     byte_RAM_F
      JSR     sub_BANK6_93B8

      LDA     byte_RAM_4BE
      STA     byte_RAM_E8

loc_BANK6_942F:
      LDA     byte_RAM_4C0
      CLC
      ADC     #8
      BCC     loc_BANK6_9439

      INC     byte_RAM_E8

loc_BANK6_9439:
      AND     #$F0
      PHA
      SEC

loc_BANK6_943D:
      SBC     byte_RAM_4C0
      STA     byte_RAM_BA
      PLA
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_E5
      LDA     #0
      STA     byte_RAM_E6
      LDA     byte_RAM_E8
      STA     word_RAM_C+1
      JSR     sub_BANK6_9878

      LDY     byte_RAM_E7
      LDX     #$F

loc_BANK6_9458:
      LDA     (byte_RAM_1),Y
      JSR     sub_BANK6_9479

      STA     SubAreaTileLayout,X
      TYA
      CLC
      ADC     #$10
      TAY
      TXA
      CLC
      ADC     #$10
      TAX
      AND     #$F0

loc_BANK6_946C:
      BNE     loc_BANK6_9458

      TYA

loc_BANK6_946F:
      AND     #$F
      TAY
      JSR     sub_BANK6_9890

      DEX
      BPL     loc_BANK6_9458

      RTS

; End of function sub_BANK6_941D

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9479:
      STY     byte_RAM_8
      STX     byte_RAM_7
      LDX     #$15

loc_BANK6_947F:
      CMP     byte_BANK6_930E,X
      BEQ     loc_BANK6_94A5

      DEX
      BPL     loc_BANK6_947F

      CMP     #$41
      BEQ     loc_BANK6_9492

      CMP     #$42
      BEQ     loc_BANK6_9492

      JMP     loc_BANK6_94A8

; ---------------------------------------------------------------------------

loc_BANK6_9492:
      SEC					  ; Some code involving	Subspace mushrooms
						  ; Checking if	it should create a Subspace object?
      SBC     #$41
      TAY
      LDA     Mushroom1Pulled,Y
      BNE     loc_BANK6_94A0

      LDX     byte_RAM_7
      JSR     sub_BANK6_98F7

loc_BANK6_94A0:
      LDA     #$41
      JMP     loc_BANK6_94A8

; ---------------------------------------------------------------------------

loc_BANK6_94A5:
      LDA     unk_BANK6_9324,X

loc_BANK6_94A8:
      LDX     byte_RAM_7
      LDY     byte_RAM_8
      RTS

; End of function sub_BANK6_9479

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_94AD:
      LDX     #0
      STX     IsHorizontalLevel

ClearSubAreaTileLayout:
      LDA     #$40
      STA     SubAreaTileLayout,X
      INX
      BNE     ClearSubAreaTileLayout

      LDA     CurrentLevelArea
      STA     CurrentLevelAreaCopy
      LDA     #4
      STA     CurrentLevelArea
      LDA     #$A
      JSR     HijackLevelDataCopyAddressWithJar

      LDY     #0
      LDA     #$A
      STA     byte_RAM_E8
      STA     byte_RAM_540
      STY     byte_RAM_E6
      STY     byte_RAM_E5
      STY     byte_RAM_55E
      LDY     #3
      STY     byte_RAM_541
      LDY     #4
      JSR     loc_BANK6_972D

      LDY     #2
      LDA     (5),Y
      AND     #3
      STA     byte_RAM_542
      LDA     (5),Y
      LSR     A
      LSR     A
      AND     #3
      STA     byte_RAM_543
      JSR     HijackLevelDataCopyAddressWithJar

      LDA     #$A
      STA     byte_RAM_E8
      LDA     #0
      STA     byte_RAM_E6
      STA     byte_RAM_E5
      LDA     #3
      STA     4
      JSR     loc_BANK6_95EF

      LDA     #1
      STA     IsHorizontalLevel
      RTS

; End of function sub_BANK6_94AD

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_950E:
      LDY     #3
      LDA     (byte_RAM_5),Y
      AND     #3
      STA     byte_RAM_544
      CMP     byte_RAM_545
      BEQ     locret_BANK6_9528

      LDA     StarInvincibilityTimer
      CMP     #8
      BCS     locret_BANK6_9528

      LDA     #Music2_StopMusic
      STA     MusicQueue2

locret_BANK6_9528:
      RTS

; End of function sub_BANK6_950E

; ---------------------------------------------------------------------------
LevelMusicTable:.BYTE Music1_Overworld
      .BYTE Music1_Inside
      .BYTE Music1_Boss
      .BYTE Music1_Wart
      .BYTE Music1_Subspace
; ---------------------------------------------------------------------------
      LDA     byte_RAM_544
      CMP     byte_RAM_545
      BEQ     locret_BANK6_9547

      TAX
      STX     byte_RAM_545
      LDA     StarInvincibilityTimer
      CMP     #8
      BCS     locret_BANK6_9528

      LDA     LevelMusicTable,X
      STA     Music1Queue

locret_BANK6_9547:
      RTS

; ---------------------------------------------------------------------------
      LDA     byte_RAM_535
      ASL     A
      TAY
      LDA     unk_RAM_51D,Y
      STA     CurrentLevel
      INY
      LDA     unk_RAM_51D,Y
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     CurrentLevelArea
      LDA     unk_RAM_51D,Y
      AND     #$F
      STA     byte_RAM_533
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9567:
      JSR     sub_BANK6_933A

      JSR     sub_BANK6_98DC

      JSR     RestoreLevelDataCopyAddress

      JSR     sub_BANK6_950E

      LDY     #3
      LDA     (byte_RAM_5),Y
      LSR     A
      AND     #$1C
      STA     byte_RAM_55E
      JSR     RestoreLevelDataCopyAddress

      LDY     #0
      LDA     (byte_RAM_5),Y
      ASL     A
      LDA     #0
      ROL     A
      STA     IsHorizontalLevel
      LDA     #0
      STA     byte_RAM_E8
      LDY     #2
      LDA     (byte_RAM_5),Y
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_53F
      LDA     (byte_RAM_5),Y
      AND     #3
      STA     byte_RAM_542
      LDA     (byte_RAM_5),Y
      LSR     A
      LSR     A
      AND     #3
      STA     byte_RAM_543
      DEY
      LDA     (byte_RAM_5),Y
      AND     #$1F
      CMP     #$1F

loc_BANK6_95B0:
      BEQ     loc_BANK6_95C1

      STA     byte_RAM_541
      INY
      INY
      INY
      LDA     #0
      STA     byte_RAM_E5
      STA     byte_RAM_E6
      JSR     sub_BANK6_9728

loc_BANK6_95C1:
      LDA     #0
      STA     byte_RAM_E6
      LDA     #3
      STA     byte_RAM_4
      JSR     sub_BANK6_95E6

      LDA     #$22

loc_BANK6_95CE:
      ORA     byte_RAM_10
      STA     byte_RAM_5AC
      RTS

; End of function sub_BANK6_9567

; =============== S U B	R O U T	I N E =======================================

RestoreLevelDataCopyAddress:
      LDA     #$78
      STA     byte_RAM_6
      LDA     #0
      STA     byte_RAM_5
      RTS

; End of function RestoreLevelDataCopyAddress

; =============== S U B	R O U T	I N E =======================================

HijackLevelDataCopyAddressWithJar:
      LDA     #$7A
      STA     byte_RAM_6
      LDA     #0
      STA     byte_RAM_5
      RTS

; End of function HijackLevelDataCopyAddressWithJar

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_95E6:
      LDA     #0
      STA     byte_RAM_E8

loc_BANK6_95EA:
      LDY     #0
      JMP     loc_BANK6_95EF

loc_BANK6_95EF:
      LDY     byte_RAM_4

loc_BANK6_95F1:
      INY
      LDA     (byte_RAM_5),Y
      CMP     #$FF
      BNE     loc_BANK6_95F9

      RTS

; ---------------------------------------------------------------------------

loc_BANK6_95F9:
      LDA     (byte_RAM_5),Y
      AND     #$F
      STA     byte_RAM_E5
      LDA     (byte_RAM_5),Y
      AND     #$F0
      CMP     #$F0
      BNE     loc_BANK6_9613

      LDA     byte_RAM_E5
      STY     byte_RAM_F
      JSR     loc_BANK6_9690

loc_BANK6_960E:
      LDY     byte_RAM_F
      JMP     loc_BANK6_95F1

; ---------------------------------------------------------------------------

loc_BANK6_9613:
      JSR     sub_BANK6_967B

      INY
      LDA     (byte_RAM_5),Y
      LSR     A
      LSR     A
      LSR     A
      LSR     A

loc_BANK6_961D:
      STA     byte_RAM_50E
      CMP     #3
      BCS     loc_BANK6_9651

      PHA
      LDA     (byte_RAM_5),Y
      AND     #$F
      STA     byte_RAM_50E
      PLA
      BEQ     loc_BANK6_966C

      PHA
      JSR     sub_BANK6_9878

      LDA     (byte_RAM_5),Y
      AND     #$F
      STY     byte_RAM_4
      PLA
      CMP     #1
      BNE     loc_BANK6_9644

      JSR     loc_BANK6_88D8

      JMP     loc_BANK6_9669

; ---------------------------------------------------------------------------

loc_BANK6_9644:
      CMP     #2
      BNE     loc_BANK6_964E

      JSR     loc_BANK6_88FE

      JMP     loc_BANK6_9669

; ---------------------------------------------------------------------------

loc_BANK6_964E:
      JMP     loc_BANK6_9669

; ---------------------------------------------------------------------------

loc_BANK6_9651:
      LDA     (byte_RAM_5),Y
      AND     #$F
      STA     byte_RAM_50D
      STY     byte_RAM_4
      JSR     sub_BANK6_9878

      LDA     byte_RAM_50E
      SEC
      SBC     #3
      STA     byte_RAM_50E
      JSR     loc_BANK6_8898

loc_BANK6_9669:
      JMP     loc_BANK6_95EF

; ---------------------------------------------------------------------------

loc_BANK6_966C:
      JSR     sub_BANK6_9878

      LDA     (byte_RAM_5),Y
      AND     #$F
      STY     byte_RAM_4
      JSR     loc_BANK6_88B5

      JMP     loc_BANK6_9669

; End of function sub_BANK6_95E6

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_967B:
      CLC
      ADC     byte_RAM_E6
      BCC     loc_BANK6_9685

      ADC     #$F
      JMP     loc_BANK6_968B

; ---------------------------------------------------------------------------

loc_BANK6_9685:
      CMP     #$F0
      BNE     loc_BANK6_968D

      LDA     #0

loc_BANK6_968B:
      INC     byte_RAM_E8

loc_BANK6_968D:
      STA     byte_RAM_E6
      RTS

; End of function sub_BANK6_967B

; ---------------------------------------------------------------------------

loc_BANK6_9690:
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK6_96CA
      .WORD loc_BANK6_96CA
      .WORD loc_BANK6_96B4
      .WORD loc_BANK6_96B2
      .WORD loc_BANK6_970B
      .WORD loc_BANK6_96CD
      .WORD loc_BANK6_96CA
; ---------------------------------------------------------------------------

loc_BANK6_96A1:
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK6_96F0
      .WORD loc_BANK6_96F6
      .WORD loc_BANK6_96BE
      .WORD loc_BANK6_96BB
      .WORD loc_BANK6_9712
      .WORD locret_BANK6_971A
      .WORD loc_BANK6_971B
; ---------------------------------------------------------------------------

loc_BANK6_96B2:
      INC     byte_RAM_E8

loc_BANK6_96B4:
      INC     byte_RAM_E8
      LDA     #0
      STA     byte_RAM_E6
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_96BB:
      INC     byte_RAM_540

loc_BANK6_96BE:
      INC     byte_RAM_540
      LDA     #0
      STA     byte_RAM_E
      STA     byte_RAM_9
      RTS

; ---------------------------------------------------------------------------
      INC     byte_RAM_F

loc_BANK6_96CA:
      INC     byte_RAM_F
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_96CD:
      LDY     byte_RAM_F
      INY
      LDA     byte_RAM_E8
      ASL     A
      TAX
      LDA     (byte_RAM_5),Y
      STA     unk_RAM_51D,X
      INY
      INX
      LDA     (byte_RAM_5),Y
      STA     unk_RAM_51D,X
      STY     byte_RAM_F
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_96E3:
      LDY     byte_RAM_F
      INY
      LDA     (byte_RAM_5),Y
      AND     #$E0
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      RTS

; End of function sub_BANK6_96E3

; ---------------------------------------------------------------------------

loc_BANK6_96F0:
      JSR     sub_BANK6_96E3

      JMP     loc_BANK6_96FC

; ---------------------------------------------------------------------------

loc_BANK6_96F6:
      JSR     sub_BANK6_96E3

      CLC
      ADC     #8

loc_BANK6_96FC:
      STA     byte_RAM_E
      LDA     IsHorizontalLevel
      BNE     locret_BANK6_970A

      LDA     byte_RAM_E
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     byte_RAM_E

locret_BANK6_970A:
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_970B:
      LDA     #0
      STA     byte_RAM_E8
      STA     byte_RAM_E6
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_9712:
      LDA     #0
      STA     byte_RAM_540
      STA     byte_RAM_E

locret_BANK6_9719:
      RTS

; ---------------------------------------------------------------------------

locret_BANK6_971A:
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_971B:
      LDY     byte_RAM_F
      INY
      LDA     (byte_RAM_5),Y
      AND     #$F
      ASL     A
      ASL     A
      STA     byte_RAM_55E
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9728:
      LDA     #0
      STA     byte_RAM_540

loc_BANK6_972D:
      LDA     #0
      STA     byte_RAM_9

loc_BANK6_9731:
      LDA     (byte_RAM_5),Y
      CMP     #$FF
      BNE     loc_BANK6_9746

      LDA     #$A
      STA     byte_RAM_540
      INC     byte_RAM_540
      LDA     #0
      STA     byte_RAM_E
      JMP     loc_BANK6_978C

; ---------------------------------------------------------------------------

loc_BANK6_9746:
      LDA     (byte_RAM_5),Y
      AND     #$F0
      BEQ     loc_BANK6_976F

      CMP     #$F0
      BNE     loc_BANK6_9774

      LDA     (byte_RAM_5),Y
      AND     #$F
      STY     byte_RAM_F
      JSR     loc_BANK6_96A1

      LDY     byte_RAM_F
      LDA     (byte_RAM_5),Y
      AND     #$F
      CMP     #2
      BCC     loc_BANK6_978C

      CMP     #5
      BNE     loc_BANK6_976B

      INY
      JMP     loc_BANK6_976F

; ---------------------------------------------------------------------------

loc_BANK6_976B:
      CMP     #6
      BNE     loc_BANK6_9770

loc_BANK6_976F:
      INY

loc_BANK6_9770:
      INY
      JMP     loc_BANK6_9731

; ---------------------------------------------------------------------------

loc_BANK6_9774:
      CLC
      ADC     byte_RAM_9
      BCC     loc_BANK6_977E

      ADC     #$F
      JMP     loc_BANK6_9784

; ---------------------------------------------------------------------------

loc_BANK6_977E:
      CMP     #$F0
      BNE     loc_BANK6_9787

      LDA     #0

loc_BANK6_9784:
      INC     byte_RAM_540

loc_BANK6_9787:
      STA     byte_RAM_9
      JMP     loc_BANK6_976F

; ---------------------------------------------------------------------------

loc_BANK6_978C:
      JSR     sub_BANK6_9878

      JSR     sub_BANK6_97E2

      LDA     IsHorizontalLevel
      BEQ     loc_BANK6_97A7

      INC     byte_RAM_E5
      LDA     byte_RAM_E5
      CMP     #$10
      BNE     loc_BANK6_97AC

      INC     byte_RAM_E8
      LDA     #0
      STA     byte_RAM_E5
      JMP     loc_BANK6_97AC

; ---------------------------------------------------------------------------

loc_BANK6_97A7:
      LDA     #$10
      JSR     sub_BANK6_967B

loc_BANK6_97AC:
      LDA     byte_RAM_E8
      CMP     byte_RAM_540
      BNE     loc_BANK6_978C

      LDA     IsHorizontalLevel
      BEQ     loc_BANK6_97BF

      LDA     byte_RAM_E5
      CMP     byte_RAM_E
      BCC     loc_BANK6_978C

      BCS     loc_BANK6_97C5

loc_BANK6_97BF:
      LDA     byte_RAM_E6
      CMP     byte_RAM_E
      BCC     loc_BANK6_978C

loc_BANK6_97C5:
      LDA     (byte_RAM_5),Y
      CMP     #$FF
      BEQ     locret_BANK6_97E1

      INY
      LDA     (byte_RAM_5),Y
      AND     #$1F
      STA     byte_RAM_541
      JMP     loc_BANK6_9770

; End of function sub_BANK6_9728

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_97D6:
      LDA     IsHorizontalLevel
      BNE     loc_BANK6_97DE

      LDA     byte_BANK6_927C,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_97DE:
      LDA     MysteryDataD200,X

locret_BANK6_97E1:
      RTS

; End of function sub_BANK6_97D6

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_97E2:
      STY     byte_RAM_4
      LDA     byte_RAM_541
      ASL     A
      ASL     A
      TAX
      LDY     byte_RAM_E7

loc_BANK6_97EC:
      JSR     sub_BANK6_97D6

      JSR     sub_BANK6_9816

      JSR     sub_BANK6_97D6

      JSR     sub_BANK6_9818

      JSR     sub_BANK6_97D6

      JSR     sub_BANK6_981A

      JSR     sub_BANK6_97D6

      JSR     sub_BANK6_981C

      LDA     IsHorizontalLevel
      BEQ     loc_BANK6_980D

      INX
      BCS     loc_BANK6_9813

      BCC     loc_BANK6_97EC

loc_BANK6_980D:
      INX
      TYA
      AND     #$F
      BNE     loc_BANK6_97EC

loc_BANK6_9813:
      LDY     byte_RAM_4
      RTS

; End of function sub_BANK6_97E2

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9816:
      LSR     A
      LSR     A

; End of function sub_BANK6_9816

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9818:
      LSR     A
      LSR     A

; End of function sub_BANK6_9818

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_981A:
      LSR     A
      LSR     A

; End of function sub_BANK6_981A

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_981C:
      AND     #3
      STX     byte_RAM_3
      BEQ     loc_BANK6_9836

      CLC
      ADC     byte_RAM_55E
      TAX
      LDA     IsHorizontalLevel
      BNE     loc_BANK6_9831

      JSR     sub_BANK6_985E

      JMP     loc_BANK6_9834

; ---------------------------------------------------------------------------

loc_BANK6_9831:
      JSR     sub_BANK6_9844

loc_BANK6_9834:
      STA     (byte_RAM_1),Y

loc_BANK6_9836:
      LDX     byte_RAM_3
      LDA     IsHorizontalLevel
      BNE     loc_BANK6_983E

      INY
      RTS

; ---------------------------------------------------------------------------

loc_BANK6_983E:
      TYA
      CLC
      ADC     #$10
      TAY
      RTS

; End of function sub_BANK6_981C

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9844:
      STX     word_RAM_C
      STY     word_RAM_C+1
      LDX     BackgroundCHR2TimerIndex
      LDA     off_BANK6_8428,X
      STA     byte_RAM_7
      LDA     off_BANK6_8436,X
      STA     byte_RAM_8
      LDY     word_RAM_C
      LDA     (byte_RAM_7),Y
      LDX     word_RAM_C
      LDY     word_RAM_C+1
      RTS

; End of function sub_BANK6_9844

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_985E:
      STX     word_RAM_C
      STY     word_RAM_C+1
      LDX     BackgroundCHR2TimerIndex
      LDA     off_BANK6_842F,X
      STA     byte_RAM_7
      LDA     off_BANK6_843D,X
      STA     byte_RAM_8
      LDY     word_RAM_C
      LDA     (byte_RAM_7),Y
      LDX     word_RAM_C
      LDY     word_RAM_C+1
      RTS

; End of function sub_BANK6_985E

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9878:
      LDX     byte_RAM_E8
      JSR     sub_BANK6_9885

      LDA     byte_RAM_E6
      CLC
      ADC     byte_RAM_E5
      STA     byte_RAM_E7
      RTS

; End of function sub_BANK6_9878

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9885:
      LDA     byte_BANK6_92F8,X
      STA     byte_RAM_1
      LDA     byte_BANK6_9303,X
      STA     byte_RAM_2
      RTS

; End of function sub_BANK6_9885

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_9890:
      INY
      TYA
      AND     #$F
      BNE     locret_BANK6_98A7

      TYA
      SEC
      SBC     #$10

loc_BANK6_989A:
      TAY
      STX     byte_RAM_B
      LDX     byte_RAM_E8
      INX
      STX     word_RAM_C+1
      JSR     sub_BANK6_9885

loc_BANK6_98A5:
      LDX     byte_RAM_B

locret_BANK6_98A7:
      RTS

; End of function sub_BANK6_9890

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_98A8:
      TYA
      CLC
      ADC     #$10
      TAY
      CMP     #$F0
      BCC     locret_BANK6_98BB

      LDX     byte_RAM_E8
      INX
      JSR     sub_BANK6_9885

      TYA
      AND     #$F
      TAY

locret_BANK6_98BB:
      RTS

; End of function sub_BANK6_98A8

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_98BC:
      LDY     byte_RAM_4
      INY
      LDA     (byte_RAM_5),Y
      STA     byte_RAM_7
      INY
      LDA     (byte_RAM_5),Y
      STA     byte_RAM_8
      STY     byte_RAM_4
      LDA     byte_RAM_E8
      ASL     A

loc_BANK6_98CD:
      TAY
      LDA     byte_RAM_7
      STA     unk_RAM_51D,Y
      INY
      LDA     byte_RAM_8

loc_BANK6_98D6:
      STA     unk_RAM_51D,Y
      RTS

; End of function sub_BANK6_98BC

; ---------------------------------------------------------------------------
unk_BANK6_98DA:.BYTE $28
      .BYTE $24
; =============== S U B	R O U T	I N E =======================================

sub_BANK6_98DC:
      LSR     A
      BCS     loc_BANK6_98EA

      LDA     #1
      STA     byte_RAM_C9
      ASL     A
      STA     byte_RAM_C8
      LDA     #$20
      BNE     loc_BANK6_98F3

loc_BANK6_98EA:
      LDA     #0
      STA     byte_RAM_C9
      STA     byte_RAM_C8
      LDA     unk_BANK6_98DA,Y

loc_BANK6_98F3:
      STA     byte_RAM_506
      RTS

; End of function sub_BANK6_98DC

; =============== S U B	R O U T	I N E =======================================

sub_BANK6_98F7:
      TXA
      PHA
      AND     #$F0
      STA     ObjectYLo
      TXA
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     ObjectXLo
      LDA     #$A
      STA     ObjectXHi
      LDX     #0
      STX     byte_RAM_12
      STX     ObjectYHi
      LDA     #$3F
      STA     ObjectType
      LDA     #1
      STA     EnemyState
      STY     EnemyTimer
      LDA     #0
      STA     unk_RAM_86,X
      STA     unk_RAM_B1,X
      STA     unk_RAM_A8,X
      STA     unk_RAM_9F,X
      STA     unk_RAM_44A,X
      STA     EnemyCollision,X
      STA     unk_RAM_438,X
      STA     unk_RAM_453,X
      STA     unk_RAM_45C,X
      STA     ObjectYAccel,X
      STA     ObjectXAccel,X

loc_BANK6_9934:
      LDY     ObjectType,X
      LDA     ObjectAttributeTable,Y
      AND     #$7F
      STA     ObjectAttributes,X
      LDA     byte_BANKF_F532,Y
      STA     unk_RAM_46E,X
      LDA     unk_BANKF_F5C0,Y
      STA     unk_RAM_489,X
      LDA     unk_BANKF_F579,Y
      STA     unk_RAM_492,X
      LDA     #$FF
      STA     unk_RAM_441,X
      PLA
      TAX
      RTS

; End of function sub_BANK6_98F7

; ---------------------------------------------------------------------------
; [000006A9 BYTES: BEGIN OF AREA UNUSED-BANK6:9957. PRESS KEYPAD "-" TO	COLLAPSE]
_empty_D957:.BYTE $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $40
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $50
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $70
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $80
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $90
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $100
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $110
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $120
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $130
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $140
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $150
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $160
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $170
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $180
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $190
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $200
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $210
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $220
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $230
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $240
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $250
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $260
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $270
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $280
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $290
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $300
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $310
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $320
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $330
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $340
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $350
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $360
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $370
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $380
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $390
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $400
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $410
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $420
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $430
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $440
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $450
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $460
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $470
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $480
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $490
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $500
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $510
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $520
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $530
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $540
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $550
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $560
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $570
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $580
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $590
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $600
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $610
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $620
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $630
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $640
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $650
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $660
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $670
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $680
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $690
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF; $6A0
; end of 'BANK6'

; [000006A9 BYTES: END OF AREA UNUSED-BANK6:9957. PRESS	KEYPAD "-" TO COLLAPSE]
; ===========================================================================

