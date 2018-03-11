
      ;.segment	BANKC
;       *	=  $8000
MarioDream_Pointers:
	  .BYTE 1

byte_BANKC_8001:
	  .BYTE 3

      .WORD MarioDream_Bed
      .WORD MarioDream_Bubble
      .WORD MarioDream_DoNothing
      .WORD MarioDream_EraseBubble1
      .WORD MarioDream_EraseBubble2
      .WORD MarioDream_EraseBubble3
      .WORD MarioDream_EraseBubble4
      .WORD MarioDream_EraseBubble5
      .WORD MarioDream_Palettes

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_8014:
      LDA     #0
      BEQ     loc_BANKC_801A

; End of function sub_BANKC_8014

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_8018:
      LDA     #PPUMask_ShowLeft8Pixels_BG|PPUMask_ShowLeft8Pixels_SPR|PPUMask_ShowBackground|PPUMask_ShowSprites

loc_BANKC_801A:
      STA     PPUMaskMirror

; End of function sub_BANKC_8018

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_801C:
      LDA     ScreenUpdateIndex
      ASL     A
      TAX
      LDA     MarioDream_Pointers,X
      STA     RAM_PPUDataBufferPointer
      LDA     byte_BANKC_8001,X
      STA     RAM_PPUDataBufferPointer+1
      LDA     #0
      STA     NMIWaitFlag

loc_BANKC_802E:
      LDA     NMIWaitFlag
      BPL     loc_BANKC_802E

      RTS

; End of function sub_BANKC_801C

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_8033:
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      RTS

; End of function sub_BANKC_8033

; ---------------------------------------------------------------------------
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIDisabled
      STA     PPUCTRL
      STA     PPUCtrlMirror
      RTS

; ---------------------------------------------------------------------------
MarioDream_Palettes:
	  .BYTE $3F,0,$20,2				
      .BYTE $22,$12,$F,2			  ; 4
      .BYTE $30,$16,$F,2			  ; 8
      .BYTE $30,$16,$28,2			  ; $C
      .BYTE $22,$31,$F,2			  ; $10
      .BYTE $27,$16,$F,2			  ; $14
      .BYTE $27,$2A,$F,2			  ; $18
      .BYTE $27,$25,$F,2			  ; $1C
      .BYTE $27,$3C,$F,0			  ; $20
MarioDream_Bed:
	  .BYTE $20,0,$60,$FF			   
      .BYTE $20,$20,$60,$FF			  
      .BYTE $20,$40,$60,$FF			  
      .BYTE $20,$60,$60,$FF			  
      .BYTE $23,$40,$60,$FF			  
      .BYTE $23,$60,$60,$FF			  
      .BYTE $23,$80,$60,$FF			  
      .BYTE $23,$A0,$60,$FF			  
      .BYTE $20,$80,$D6,$FF			  
      .BYTE $20,$81,$D6,$FF			  
      .BYTE $20,$82,$D6,$FF			  
      .BYTE $20,$83,$D6,$FF			  
      .BYTE $20,$9C,$D6,$FF			  
      .BYTE $20,$9D,$D6,$FF			  
      .BYTE $20,$9E,$D6,$FF			  
      .BYTE $20,$9F,$D6,$FF			  
      .BYTE $20,$84,$58,$FC			  
      .BYTE $20,$A4,$58,$FC			  
      .BYTE $20,$C4,$58,$FC			  
      .BYTE $20,$E4,$58,$FC			  
      .BYTE $21,4,$58,$FC			  
      .BYTE $21,$24,$58,$FC			  
      .BYTE $21,$44,$58,$FC			  
      .BYTE $21,$64,$58,$FC			  
      .BYTE $21,$84,$58,$FC			  
      .BYTE $21,$A4,$58,$FC			  
      .BYTE $21,$C4,$58,$FC			  
      .BYTE $21,$E4,$58,$FC			  
      .BYTE $22,4,$58,$FC			  
      .BYTE $22,$24,$58,$FC			  
      .BYTE $22,$44,$58,$FC			  
      .BYTE $22,$64,$58,$FC			  
      .BYTE $22,$84,$58,$FC			  
      .BYTE $22,$A4,$58,$FC			  
      .BYTE $22,$C4,$58,$FC			  
      .BYTE $21,$4E,2,$60,$61			  
      .BYTE $21,$6E,2,$70,$71			  
      .BYTE $21,$8E,2,$80,$81			  
      .BYTE $21,$AC,6,$36,$37,$38,$39,$3A,$3B	  
      .BYTE $21,$CA,$C,$36,$37,$35,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F
      .BYTE $21,$E8,$E,$36,$37,$35,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D
      .BYTE $5E,$5F				  ; $F
      .BYTE $22,6,$10,$36,$37,$35,$FC,$64,$65,$66,$67,$68,$69,$6A,$6B
      .BYTE $6C,$6D,$6E,$6F			  ; $F
      .BYTE $22,$24,$12,$36,$37,$35,$FC,$FC,$FC,$74,$75,$76,$77,$78,$79
      .BYTE $7A,$7B,$7C,$7D,$7E,$7F		  ; $F
      .BYTE $22,$44,$18,$35,$FC,$FC,$FC,$82,$83,$84,$85,$86,$87,$88,$89
      .BYTE $8A,$8B,$8C,$8D,$8E,$8F,0,1,2,3,4,5	  ; $F
      .BYTE $22,$68,$14,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D
      .BYTE $9E,$9F,$10,$11,$12,$13,$14,$15	  ; $F
      .BYTE $22,$88,$14,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD
      .BYTE $AE,$AF,$FE,$FE,$FE,$FE,$FE,$FE	  ; $F
      .BYTE $22,$A7,$15,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC
      .BYTE $BD,$BE,$BF,$FE,$FE,$FE,$FE,$FE,$FE	  ; $F
      .BYTE $22,$C6,$16,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB
      .BYTE $CC,$CD,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE; $F
      .BYTE $22,$E4,$18,$B1,$F1,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9
      .BYTE $DA,$DB,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE; $F
      .BYTE $23,4,$18,$F0,$FE,$FE,$FE,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9
      .BYTE $EA,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE; $F
      .BYTE $23,$24,$18,$FE,$FE,$FE,$FE,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9
      .BYTE $FA,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE; $F
      .BYTE 0
MarioDream_Bubble:
	  .BYTE	$20,$8F,$84,6,$16,7,$17		      
      .BYTE $20,$D0,$85,8,$18,9,$19,$1D		  
      .BYTE $20,$90,$4C,$FD			  
      .BYTE $20,$B0,$4C,$FD			  
      .BYTE $20,$D1,$4B,$FD			  
      .BYTE $20,$F1,$B,$FD,$FD,$FD,$28,$29,$29,$29,$29,$2A,$FD,$FD
      .BYTE $21,$11,$B,$FD,$FD,$FD,$FD,$27,$FD,$FD,$27,$FD,$FD,$FD
      .BYTE $21,$31,$B,$FD,$FD,$FD,$FD,$27,$FD,$FD,$27,$FD,$FD,$FD
      .BYTE $21,$51,$B,$FD,$FD,$23,$24,$25,$22,$23,$24,$25,$25,$FD
      .BYTE $21,$71,$B,$B,$C,$D,$E,$F,$FD,$FD,$FD,$FD,$FD,$FD
      .BYTE $21,$95,7,$1F,$1A,$30,$31,$32,$33,$1B 
      .BYTE $21,$B5,6,$53,$FC,$40,$41,$42,$43	  
      .BYTE $21,$D7,3,$50,$51,$52		  
      .BYTE $21,$F6,2,$20,$21			  
      .BYTE $23,$CB,4,$44,$55,$A5,$65		  ;	Attribute table	changes
      .BYTE $23,$D4,3,$55,$5A,$56		  
      .BYTE $23,$DD,2,$45,$15			  
      .BYTE $23,$E4,1,$3F			  
      .BYTE 0
MarioDream_DoNothing:
	  .BYTE 0
						  ; This is pointed to,	but the	very first byte
						  ; is the terminating 0, so nothing gets drawn.
						  ; This would have undone the attribute changes
						  ; done in the	above PPU writing, but I guess
						  ; Nintendo realized they were	never going to
						  ; use	that part of the screen	again
      .BYTE $23,$CB,$44,0			  
      .BYTE $23,$D4,$43,0			  
      .BYTE $23,$DD,$42,0			  
      .BYTE   0
MarioDream_EraseBubble1:
	  .BYTE $20,$8F,$4D,$FC			    
      .BYTE $20,$AF,$4D,$FC			  
      .BYTE   0
MarioDream_EraseBubble2:
	  .BYTE $20,$CF,$4D,$FC			    
      .BYTE $20,$EF,$4D,$FC			  
      .BYTE   0
MarioDream_EraseBubble3:
	  .BYTE $21,$10,$4C,$FC			    
      .BYTE $21,$30,$4C,$FC			  
      .BYTE   0
MarioDream_EraseBubble4:
	  .BYTE $21,$50,$4C,$FC			    
      .BYTE $21,$71,$4B,$FC			  
      .BYTE   0
MarioDream_EraseBubble5:
	  .BYTE $21,$95,$47,$FC			    
      .BYTE $21,$B5,$46,$FC			  
      .BYTE $21,$D7,$43,$FC			  
      .BYTE $21,$F6,$42,$FC			  
      .BYTE 0
MarioDream_BubbleSprites:
	  .BYTE $28,0,0,$A8			     
      .BYTE $28,4,1,$B0				  ; 4
      .BYTE $28,8,2,$C0				  ; 8
      .BYTE $28,$C,3,$B8			  ; $C
byte_BANKC_8308:
	  .BYTE $28,2,0,$A8			    
      .BYTE $28,6,1,$B0				  ; 4
byte_BANKC_8310:
	  .BYTE $28,$A,2,$C0			    
      .BYTE $28,$E,3,$B8			  ; 4
MarioDream_SnoringFrameCounts:
	  .BYTE $20

      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $20
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
MarioDream_WakingFrameCounts:
	  .BYTE 8

      .BYTE 8
      .BYTE $50
      .BYTE $40
      .BYTE $30
      .BYTE $10
      .BYTE $10
MarioDream_SnoringFrames:
	  .BYTE $50

      .BYTE $54
      .BYTE $58
      .BYTE $5C
      .BYTE $60
      .BYTE $64
      .BYTE $68
      .BYTE $6C
      .BYTE $68
      .BYTE $64
      .BYTE $60
      .BYTE $5C
      .BYTE $58
      .BYTE $54
MarioDream_WakingFrames:
	  .BYTE $78

      .BYTE $74
      .BYTE $70
      .BYTE $7C
      .BYTE $70
      .BYTE $74
      .BYTE $78
; ---------------------------------------------------------------------------

MarioSleepingScene:
      JSR     sub_BANKC_8014

      LDA     #0
      JSR     sub_BANKF_FFA0

      JSR     ClearNametablesAndSprites

      LDA     #$40
      STA     StackArea
      JSR     sub_BANKC_8033

      JSR     sub_BANKC_801C

      LDA     #9
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #1
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #2
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #$10
      STA     ObjectXHi+3
      LDA     #4
      STA     PlayerXHi

loc_BANKC_8375:
      LDA     #0
      STA     ObjectXHi
      LDA     #$D
      STA     ObjectXHi+1
      LDA     #0
      STA     ObjectXHi+2
      JSR     sub_BANKC_8493

      JSR     sub_BANKC_8018

loc_BANKC_8387:
      LDY     ObjectXHi
      LDA     MarioDream_SnoringFrames,Y
      STA     BackgroundCHR1
      CLC
      ADC     #2
      STA     BackgroundCHR2
      LDA     MarioDream_SnoringFrameCounts,Y
      STA     byte_RAM_10

loc_BANKC_839A:
      DEC     ObjectXHi+3
      BPL     loc_BANKC_83A7

      LDA     #$10
      STA     ObjectXHi+3
      INC     ObjectXHi+2
      JSR     sub_BANKC_8493

loc_BANKC_83A7:
      JSR     sub_BANKC_801C

      DEC     byte_RAM_10
      BPL     loc_BANKC_839A

      INC     ObjectXHi
      DEC     ObjectXHi+1
      BPL     loc_BANKC_8387

      DEC     PlayerXHi
      BMI     loc_BANKC_83BB

      JMP     loc_BANKC_8375

; ---------------------------------------------------------------------------

loc_BANKC_83BB:
      LDA     #3
      STA     ScreenUpdateIndex
      LDA     #$F8
      STA     SpriteDMAArea
      STA     SpriteDMAArea + $04
      STA     SpriteDMAArea + $08
      STA     SpriteDMAArea + $0C
      JSR     sub_BANKC_801C

      LDA     #4
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #5
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #6
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #7
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #8
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #0
      STA     ObjectXHi
      LDA     #6
      STA     ObjectXHi+1
      LDA     #0
      STA     PlayerXHi
      JSR     sub_BANKC_8018

loc_BANKC_8402:
      LDY     ObjectXHi
      LDA     MarioDream_WakingFrames,Y
      STA     BackgroundCHR1
      CLC
      ADC     #2
      STA     BackgroundCHR2
      LDA     MarioDream_WakingFrameCounts,Y
      STA     byte_RAM_10

loc_BANKC_8415:
      JSR     sub_BANKC_801C

      DEC     byte_RAM_10
      BPL     loc_BANKC_8415

      INC     ObjectXHi
      DEC     ObjectXHi+1
      BPL     loc_BANKC_8402

      LDA     #$10
      STA     ObjectXHi+3
      LDA     #1
      STA     PlayerXHi

loc_BANKC_842A:
      LDA     #0
      STA     ObjectXHi
      LDA     #$D
      STA     ObjectXHi+1
      JSR     sub_BANKC_8018

loc_BANKC_8435:
      LDY     ObjectXHi
      LDA     MarioDream_SnoringFrames,Y
      STA     BackgroundCHR1
      CLC
      ADC     #2

loc_BANKC_8440:
      STA     BackgroundCHR2
      LDA     MarioDream_SnoringFrameCounts,Y
      STA     byte_RAM_10

loc_BANKC_8448:
      JSR     sub_BANKC_801C

      DEC     byte_RAM_10
      BPL     loc_BANKC_8448

      INC     ObjectXHi

loc_BANKC_8451:
      DEC     ObjectXHi+1
      BPL     loc_BANKC_8435

      DEC     PlayerXHi
      BMI     loc_BANKC_845C

      JMP     loc_BANKC_842A

; ---------------------------------------------------------------------------

loc_BANKC_845C:
      JSR     sub_BANKC_84FB

      JSR     sub_BANKC_801C

loc_BANKC_8462:
      LDA     #0
      STA     ObjectXHi
      LDA     #$D
      STA     ObjectXHi+1
      JSR     sub_BANKC_8018

loc_BANKC_846D:
      LDY     ObjectXHi
      LDA     MarioDream_SnoringFrames,Y
      STA     BackgroundCHR1
      CLC
      ADC     #2
      STA     BackgroundCHR2
      LDA     MarioDream_SnoringFrameCounts,Y
      STA     byte_RAM_10

loc_BANKC_8480:
      JSR     loc_BANKC_84B2

      JSR     sub_BANKC_801C

      DEC     byte_RAM_10
      BPL     loc_BANKC_8480

      INC     ObjectXHi
      DEC     ObjectXHi+1

loc_BANKC_848E:
      BPL     loc_BANKC_846D

loc_BANKC_8490:
      JMP     loc_BANKC_8462

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_8493:
      LDY     #$F
      LDA     ObjectXHi+2
      AND     #1
      BNE     loc_BANKC_84A5

loc_BANKC_849B:
      LDA     MarioDream_BubbleSprites,Y
      STA     SpriteDMAArea,Y
      DEY
      BPL     loc_BANKC_849B

      RTS

; ---------------------------------------------------------------------------

loc_BANKC_84A5:
      LDA     byte_BANKC_8308,Y
      STA     SpriteDMAArea,Y
      DEY
      BPL     loc_BANKC_84A5

      RTS

; End of function sub_BANKC_8493

; ---------------------------------------------------------------------------
CastRoll_PaletteFadeIn:
	  .BYTE $22

      .BYTE $32
      .BYTE $30
; ---------------------------------------------------------------------------

loc_BANKC_84B2:
      INC     ObjectXLo+5
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_84C0

      DEC     ObjectYLo+6
      DEC     ObjectYLo+7
      DEC     ObjectYLo+8

loc_BANKC_84C0:
      LDA     ObjectXLo
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANKC_8593
      .WORD loc_BANKC_85D6
      .WORD loc_BANKC_85E7
      .WORD loc_BANKC_861C
      .WORD loc_BANKC_8898
      .WORD loc_BANKC_88D7
      .WORD loc_BANKC_89B6
      .WORD loc_BANKC_8A04
      .WORD loc_BANKC_8A37
      .WORD loc_BANKC_8A52
      .WORD loc_BANKC_8A82
; ---------------------------------------------------------------------------
      RTS

; ---------------------------------------------------------------------------
CastRoll_CASTText:
	  .BYTE	$60,$D4,0,$28			      
      .BYTE $60,$D0,0,$38			  ; 4
      .BYTE $60,$F4,0,$48			  ; 8
      .BYTE $60,$F6,0,$58			  ; $C

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_84EC:
      LDY     ObjectXLo+2
      LDA     CastRoll_SpritePointersLo,Y
      STA     ObjectXLo+6
      LDA     CastRoll_SpritePointersHi,Y
      STA     ObjectXLo+7
      INC     ObjectXLo+2
      RTS

; End of function sub_BANKC_84EC

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_84FB:
      LDY     #$4C
      STY     SpriteCHR1

loc_BANKC_8500:
      INY
      STY     SpriteCHR2
      INY
      STY     SpriteCHR3
      INY
      STY     SpriteCHR4
      LDX     #7
      LDA     #$20
      STA     PlayerYHi
      LDY     #0

loc_BANKC_8514:
      LDA     #$F
      STA     SpriteDMAArea,Y
      INY
      LDA     #$3E
      STA     SpriteDMAArea,Y
      INY
      LDA     #0
      STA     SpriteDMAArea,Y
      INY
      LDA     PlayerYHi
      STA     SpriteDMAArea,Y
      INY
      CLC
      ADC     #8
      STA     PlayerYHi
      DEX
      BPL     loc_BANKC_8514

      LDX     #7
      LDA     #$20
      STA     PlayerYHi

loc_BANKC_853A:
      LDA     #$D0
      STA     SpriteDMAArea,Y
      INY
      LDA     #$3E
      STA     SpriteDMAArea,Y
      INY
      LDA     #0
      STA     SpriteDMAArea,Y
      INY
      LDA     PlayerYHi
      STA     SpriteDMAArea,Y
      INY
      CLC
      ADC     #8
      STA     PlayerYHi
      DEX
      BPL     loc_BANKC_853A

      LDX     #$F

loc_BANKC_855C:
      LDA     CastRoll_CASTText,X
      STA     SpriteDMAArea + $40,X
      DEX
      BPL     loc_BANKC_855C

      LDA     #$3F
      STA     PPUBuffer_301
      LDA     #$11
      STA     byte_RAM_302
      LDA     #1
      STA     byte_RAM_303
      LDA     #$12
      STA     byte_RAM_304
      LDA     #0
      STA     byte_RAM_305
      LDA     #$10
      STA     PlayerXLo
      LDA     #0
      STA     ObjectXLo
      STA     ObjectXLo+1
      LDY     #$40

loc_BANKC_858A:
      LDA     #$27
      STA     PlayerState,Y
      DEY
      BPL     loc_BANKC_858A

      RTS

; End of function sub_BANKC_84FB

; ---------------------------------------------------------------------------

loc_BANKC_8593:
      DEC     PlayerXLo
      BPL     locret_BANKC_85D5

      LDA     #$10
      STA     PlayerXLo
      LDA     #$3F
      STA     PPUBuffer_301
      LDA     #$11
      STA     byte_RAM_302
      LDA     #1
      STA     byte_RAM_303
      LDY     ObjectXLo+1
      LDA     CastRoll_PaletteFadeIn,Y
      STA     byte_RAM_304

loc_BANKC_85B2:
      LDA     #0
      STA     byte_RAM_305
      INC     ObjectXLo+1
      LDA     ObjectXLo+1
      CMP     #3
      BNE     locret_BANKC_85D5

      INC     ObjectXLo
      LDA     #$80
      STA     PlayerXLo
      LDA     #$60
      STA     ObjectYHi
      LDA     #1
      STA     ObjectYLo+2
      STA     ObjectYLo+5
      LDA     #0
      STA     ObjectYLo+3
      STA     ObjectYLo+4

locret_BANKC_85D5:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_85D6:
      DEC     PlayerXLo
      BPL     locret_BANKC_85E6

      INC     ObjectXLo
      LDA     #0
      STA     ObjectXLo+2
      STA     ObjectXAccel+2
      LDA     #1
      STA     ObjectYLo+7

locret_BANKC_85E6:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_85E7:
      LDA     ObjectXLo+5
      AND     #1

loc_BANKC_85EB:
      BEQ     loc_BANKC_861C

      LDA     ObjectYHi
      SEC
      SBC     #1
      STA     ObjectYHi
      STA     SpriteDMAArea + $40
      STA     SpriteDMAArea + $44
      STA     SpriteDMAArea + $48
      STA     SpriteDMAArea + $4C
      LDA     ObjectYHi
      CMP     #$10
      BNE     loc_BANKC_861C

      LDA     #$F8
      STA     SpriteDMAArea + $40
      STA     SpriteDMAArea + $44
      STA     SpriteDMAArea + $48
      STA     SpriteDMAArea + $4A
      INC     ObjectXLo
      LDA     #0
      STA     ObjectYLo+5
      STA     ObjectYLo+2

loc_BANKC_861C:
      LDA     ObjectYLo+2
      BNE     loc_BANKC_8641

      LDA     ObjectYLo+6
      BNE     loc_BANKC_8641

      JSR     sub_BANKC_84EC

      LDY     #$3F

loc_BANKC_8629:
      LDA     (ObjectXLo+6),Y
      STA     SpriteDMAArea + $40,Y
      DEY
      BPL     loc_BANKC_8629

      LDA     #1
      STA     ObjectYLo+2
      LDA     #$D0
      STA     ObjectYHi
      LDA     #$E0
      STA     ObjectYHi+1
      LDA     #$F8
      STA     ObjectYHi+2

loc_BANKC_8641:
      LDA     ObjectYLo+3
      BNE     loc_BANKC_8666

      LDA     ObjectYLo+7
      BNE     loc_BANKC_8666

      JSR     sub_BANKC_84EC

      LDY     #$3F

loc_BANKC_864E:
      LDA     (ObjectXLo+6),Y
      STA     SpriteDMAArea + $80,Y
      DEY
      BPL     loc_BANKC_864E

      LDA     #1
      STA     ObjectYLo+3
      LDA     #$D0
      STA     ObjectYHi+3
      LDA     #$E0
      STA     ObjectYHi+4
      LDA     #$F8
      STA     ObjectYHi+5

loc_BANKC_8666:
      LDA     ObjectYLo+4
      BNE     loc_BANKC_8693

      LDA     ObjectYLo+8
      BNE     loc_BANKC_8693

      JSR     sub_BANKC_84EC

      LDY     #$3F

loc_BANKC_8673:
      LDA     (ObjectXLo+6),Y
      STA     SpriteDMAArea + $C0,Y
      DEY
      BPL     loc_BANKC_8673

      LDA     #1
      STA     ObjectYLo+4
      LDA     #$D0
      STA     ObjectYHi+6
      LDA     #$E0
      STA     ObjectYHi+7
      LDY     #$F8
      LDA     ObjectXLo+2
      CMP     #$1D
      BNE     loc_BANKC_8691

      LDY     #$F0

loc_BANKC_8691:
      STY     ObjectYHi+8

loc_BANKC_8693:
      LDA     ObjectYLo+5
      BEQ     loc_BANKC_869A

      JMP     loc_BANKC_873A

; ---------------------------------------------------------------------------

loc_BANKC_869A:
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_86A3

      JMP     loc_BANKC_873A

; ---------------------------------------------------------------------------

loc_BANKC_86A3:
      LDA     SpriteDMAArea + $40
      CMP     #$F8
      BEQ     loc_BANKC_86C3

      LDA     ObjectYHi
      SEC
      SBC     #1
      CMP     #$10
      BNE     loc_BANKC_86B5

      LDA     #$F8

loc_BANKC_86B5:
      STA     ObjectYHi
      STA     SpriteDMAArea + $40
      STA     SpriteDMAArea + $44
      STA     SpriteDMAArea + $48
      STA     SpriteDMAArea + $4C

loc_BANKC_86C3:
      LDA     SpriteDMAArea + $50
      CMP     #$F8
      BEQ     loc_BANKC_86F2

      DEC     ObjectYHi+1
      CMP     #$F9
      BNE     loc_BANKC_86D6

      LDA     ObjectYHi+1
      CMP     #$D0
      BNE     loc_BANKC_86F2

loc_BANKC_86D6:
      LDA     ObjectYHi+1
      CMP     #$10
      BNE     loc_BANKC_86E6

      LDA     ObjectXLo+2
      CMP     #$FF
      BNE     loc_BANKC_86E4

      INC     ObjectXLo

loc_BANKC_86E4:
      LDA     #$F8

loc_BANKC_86E6:
      STA     SpriteDMAArea + $50
      STA     SpriteDMAArea + $54
      STA     SpriteDMAArea + $58
      STA     SpriteDMAArea + $5C

loc_BANKC_86F2:
      LDA     SpriteDMAArea + $60
      CMP     #$F8
      BEQ     loc_BANKC_873A

      DEC     ObjectYHi+2
      CMP     #$F9
      BNE     loc_BANKC_870C

      LDA     ObjectYHi+2
      CMP     #$D0
      BNE     loc_BANKC_873A

      LDY     ObjectXLo+2
      LDA     PlayerState,Y
      STA     ObjectYLo+7

loc_BANKC_870C:
      LDA     ObjectYHi+2
      CMP     #$10
      BNE     loc_BANKC_8722

      LDA     #0
      STA     ObjectYLo+2
      LDA     ObjectXLo+2
      CMP     #$FF
      BNE     loc_BANKC_8720

      LDA     #$FF
      STA     ObjectYLo+2

loc_BANKC_8720:
      LDA     #$F8

loc_BANKC_8722:
      STA     SpriteDMAArea + $60
      STA     SpriteDMAArea + $64
      STA     SpriteDMAArea + $68
      STA     SpriteDMAArea + $6C
      STA     SpriteDMAArea + $70
      STA     SpriteDMAArea + $74
      STA     SpriteDMAArea + $78
      STA     SpriteDMAArea + $7C

loc_BANKC_873A:
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_8743

      JMP     loc_BANKC_87D2

; ---------------------------------------------------------------------------

loc_BANKC_8743:
      LDA     SpriteDMAArea + $80
      CMP     #$F8
      BEQ     loc_BANKC_8763

      LDA     ObjectYHi+3

loc_BANKC_874C:
      SEC
      SBC     #1
      CMP     #$10
      BNE     loc_BANKC_8755

      LDA     #$F8

loc_BANKC_8755:
      STA     ObjectYHi+3
      STA     SpriteDMAArea + $80
      STA     SpriteDMAArea + $84
      STA     SpriteDMAArea + $88
      STA     SpriteDMAArea + $8C

loc_BANKC_8763:
      LDA     SpriteDMAArea + $90
      CMP     #$F8
      BEQ     loc_BANKC_878A

      DEC     ObjectYHi+4
      CMP     #$F9
      BNE     loc_BANKC_8776

      LDA     ObjectYHi+4
      CMP     #$D0
      BNE     loc_BANKC_878A

loc_BANKC_8776:
      LDA     ObjectYHi+4
      CMP     #$10
      BNE     loc_BANKC_877E

      LDA     #$F8

loc_BANKC_877E:
      STA     SpriteDMAArea + $90
      STA     SpriteDMAArea + $94

loc_BANKC_8784:
      STA     SpriteDMAArea + $98
      STA     SpriteDMAArea + $9C

loc_BANKC_878A:
      LDA     SpriteDMAArea + $A0
      CMP     #$F8
      BEQ     loc_BANKC_87D2

      DEC     ObjectYHi+5
      CMP     #$F9
      BNE     loc_BANKC_87A4

      LDA     ObjectYHi+5
      CMP     #$D0
      BNE     loc_BANKC_87D2

      LDY     ObjectXLo+2
      LDA     PlayerState,Y
      STA     ObjectYLo+8

loc_BANKC_87A4:
      LDA     ObjectYHi+5
      CMP     #$10
      BNE     loc_BANKC_87BA

loc_BANKC_87AA:
      LDA     #0
      STA     ObjectYLo+3
      LDA     ObjectXLo+2
      CMP     #$FF
      BNE     loc_BANKC_87B8

      LDA     #$FF
      STA     ObjectYLo+3

loc_BANKC_87B8:
      LDA     #$F8

loc_BANKC_87BA:
      STA     SpriteDMAArea + $A0
      STA     SpriteDMAArea + $A4
      STA     SpriteDMAArea + $A8
      STA     SpriteDMAArea + $AC
      STA     SpriteDMAArea + $B0
      STA     SpriteDMAArea + $B4
      STA     SpriteDMAArea + $B8
      STA     SpriteDMAArea + $BC

loc_BANKC_87D2:
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_87DB

      JMP     locret_BANKC_8897

; ---------------------------------------------------------------------------

loc_BANKC_87DB:
      LDA     SpriteDMAArea + $C0
      CMP     #$F8
      BEQ     loc_BANKC_87FB

      LDA     ObjectYHi+6
      SEC
      SBC     #1
      CMP     #$10
      BNE     loc_BANKC_87ED

      LDA     #$F8

loc_BANKC_87ED:
      STA     ObjectYHi+6
      STA     SpriteDMAArea + $C0
      STA     SpriteDMAArea + $C4
      STA     SpriteDMAArea + $C8
      STA     SpriteDMAArea + $CC

loc_BANKC_87FB:
      LDA     SpriteDMAArea + $D0
      CMP     #$F8
      BEQ     loc_BANKC_8822

      DEC     ObjectYHi+7
      CMP     #$F9
      BNE     loc_BANKC_880E

      LDA     ObjectYHi+7
      CMP     #$D0
      BNE     loc_BANKC_8822

loc_BANKC_880E:
      LDA     ObjectYHi+7
      CMP     #$10
      BNE     loc_BANKC_8816

      LDA     #$F8

loc_BANKC_8816:
      STA     SpriteDMAArea + $D0
      STA     SpriteDMAArea + $D4
      STA     SpriteDMAArea + $D8
      STA     SpriteDMAArea + $DC

loc_BANKC_8822:
      LDA     SpriteDMAArea + $E0
      CMP     #$F8
      BEQ     locret_BANKC_8897

      DEC     ObjectYHi+8
      CMP     #$F9
      BNE     loc_BANKC_883C

      LDA     ObjectYHi+8
      CMP     #$D0
      BNE     locret_BANKC_8897

      LDY     ObjectXLo+2
      LDA     PlayerState,Y
      STA     ObjectYLo+6

loc_BANKC_883C:
      LDA     ObjectXLo+2
      CMP     #$1D
      BNE     loc_BANKC_884C

      LDA     ObjectYHi+8
      CMP     #$B8
      BNE     loc_BANKC_884C

      LDA     #1
      STA     ObjectXAccel+2

loc_BANKC_884C:
      LDA     ObjectYHi+8
      CMP     #$10
      BNE     loc_BANKC_8862

      LDA     #0
      STA     ObjectYLo+4
      LDA     ObjectXLo+2
      CMP     #$FF
      BNE     loc_BANKC_8860

      LDA     #$FF
      STA     ObjectYLo+4

loc_BANKC_8860:
      LDA     #$F8

loc_BANKC_8862:
      STA     SpriteDMAArea + $E0
      STA     SpriteDMAArea + $E4
      STA     SpriteDMAArea + $E8
      STA     SpriteDMAArea + $EC
      STA     SpriteDMAArea + $F0
      STA     SpriteDMAArea + $F4
      STA     SpriteDMAArea + $F8
      STA     SpriteDMAArea + $FC
      LDA     ObjectXAccel+2
      BEQ     locret_BANKC_8897

      LDY     #$1F

loc_BANKC_8880:
      LDA     CastRoll_TriclydeText,Y
      STA     SpriteDMAArea + $40,Y
      DEY
      BPL     loc_BANKC_8880

      LDA     #$D0
      STA     ObjectYHi
      STA     ObjectYHi+1
      LDA     #0
      STA     ObjectXAccel+2

loc_BANKC_8893:
      LDA     #$FF
      STA     ObjectXLo+2

locret_BANKC_8897:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_8898:
      LDY     #$48
      STY     SpriteCHR1
      INY
      STY     SpriteCHR2
      INY
      STY     SpriteCHR3
      INY
      STY     SpriteCHR4
      LDY     #$5B

loc_BANKC_88AB:
      LDA     CastRoll_Wart,Y
      STA     SpriteDMAArea + $40,Y
      DEY
      BPL     loc_BANKC_88AB

      INC     ObjectXLo
      LDY     #0
      LDX     #$F
      LDA     #$C0

loc_BANKC_88BC:
      STA     SpriteDMAArea + $01,Y
      INY
      INY
      INY
      INY
      DEX
      BPL     loc_BANKC_88BC

      LDA     #$D0
      STA     ObjectYHi
      LDA     #$E0
      STA     ObjectYHi+1
      LDA     #$F0
      STA     ObjectYHi+2
      LDA     #8
      STA     ObjectYHi+3
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_88D7:
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_88E0

      JMP     loc_BANKC_898D

; ---------------------------------------------------------------------------

loc_BANKC_88E0:
      LDA     SpriteDMAArea + $40
      CMP     #$F8
      BEQ     loc_BANKC_8906

      LDA     ObjectYHi
      SEC
      SBC     #1
      CMP     #$50
      BNE     loc_BANKC_88F5

      INC     ObjectXLo
      JMP     loc_BANKC_898D

; ---------------------------------------------------------------------------

loc_BANKC_88F5:
      STA     ObjectYHi
      STA     SpriteDMAArea + $40
      STA     SpriteDMAArea + $44
      STA     SpriteDMAArea + $48
      STA     SpriteDMAArea + $4C
      STA     SpriteDMAArea + $50

loc_BANKC_8906:
      LDA     SpriteDMAArea + $54
      CMP     #$F8
      BEQ     loc_BANKC_8930

      DEC     ObjectYHi+1
      CMP     #$F9
      BNE     loc_BANKC_8919

      LDA     ObjectYHi+1
      CMP     #$D0
      BNE     loc_BANKC_8930

loc_BANKC_8919:
      LDA     ObjectYHi+1
      CMP     #$10
      BNE     loc_BANKC_8921

      LDA     #$F8

loc_BANKC_8921:
      STA     SpriteDMAArea + $54
      STA     SpriteDMAArea + $58
      STA     SpriteDMAArea + $5C
      STA     SpriteDMAArea + $60
      STA     SpriteDMAArea + $64

loc_BANKC_8930:
      LDA     SpriteDMAArea + $68
      CMP     #$F8
      BEQ     loc_BANKC_895A

      DEC     ObjectYHi+2
      CMP     #$F9
      BNE     loc_BANKC_8943

      LDA     ObjectYHi+2
      CMP     #$D0
      BNE     loc_BANKC_895A

loc_BANKC_8943:
      LDA     ObjectYHi+2
      CMP     #$10
      BNE     loc_BANKC_894B

      LDA     #$F8

loc_BANKC_894B:
      STA     SpriteDMAArea + $68
      STA     SpriteDMAArea + $6C
      STA     SpriteDMAArea + $70
      STA     SpriteDMAArea + $74
      STA     SpriteDMAArea + $78

loc_BANKC_895A:
      LDA     SpriteDMAArea + $7C
      CMP     #$F8
      BEQ     loc_BANKC_898D

      DEC     ObjectYHi+3
      CMP     #$F9
      BNE     loc_BANKC_896D

      LDA     ObjectYHi+3
      CMP     #$D0
      BNE     loc_BANKC_898D

loc_BANKC_896D:
      LDA     ObjectYHi+3
      CMP     #$10
      BNE     loc_BANKC_8975

      LDA     #$F8

loc_BANKC_8975:
      STA     SpriteDMAArea + $7C
      STA     SpriteDMAArea + $80
      STA     SpriteDMAArea + $84
      STA     SpriteDMAArea + $88
      STA     SpriteDMAArea + $8C
      STA     SpriteDMAArea + $90
      STA     SpriteDMAArea + $94
      STA     SpriteDMAArea + $98

loc_BANKC_898D:
      LDA     #0
      STA     ObjectXAccel
      STA     PlayerXAccel
      LDA     #$C
      STA     ObjectXAccel+1
      RTS

; ---------------------------------------------------------------------------
byte_BANKC_8998:
	  .BYTE $9E

      .BYTE $A0
      .BYTE $A2
      .BYTE $A4
      .BYTE $88
      .BYTE $A6
      .BYTE $A8
      .BYTE $AA
      .BYTE $AC
      .BYTE $92
      .BYTE $94
      .BYTE $96
      .BYTE $98
      .BYTE $9A
      .BYTE $9C
byte_BANKC_89A7:
	  .BYTE $AE

      .BYTE $B0
byte_BANKC_89A9:
	  .BYTE $B2
      .BYTE $B4
      .BYTE $BE
      .BYTE $B6
      .BYTE $B8
      .BYTE $BA
      .BYTE $BC
      .BYTE $92
      .BYTE $94
      .BYTE $96
      .BYTE $98
      .BYTE $9A
      .BYTE $9C
; ---------------------------------------------------------------------------

loc_BANKC_89B6:
      DEC     PlayerXAccel
      BPL     locret_BANKC_8A00

      LDA     #8
      STA     PlayerXAccel
      DEC     ObjectXAccel+1
      BPL     loc_BANKC_89CD

      INC     ObjectXLo
      LDA     #0
      STA     PlayerXLo
      STA     ObjectXLo+1
      JMP     locret_BANKC_8A00

; ---------------------------------------------------------------------------

loc_BANKC_89CD:
      LDA     ObjectXAccel
      AND     #1
      BNE     loc_BANKC_89EB

      LDY     #0
      LDX     #0

loc_BANKC_89D7:
      INC     ObjectXAccel
      LDA     byte_BANKC_8998,X
      STA     SpriteDMAArea + $41,Y
      INY
      INY
      INY
      INY
      INX
      CPX     #$F
      BNE     loc_BANKC_89D7

      JMP     locret_BANKC_8A00

; ---------------------------------------------------------------------------

loc_BANKC_89EB:
      INC     ObjectXAccel
      LDX     #0
      LDY     #0

loc_BANKC_89F1:
      LDA     byte_BANKC_89A7,X
      STA     SpriteDMAArea + $41,Y
      INY
      INY
      INY
      INY
      INX
      CPX     #$F
      BNE     loc_BANKC_89F1

locret_BANKC_8A00:
      RTS

; ---------------------------------------------------------------------------
CastRoll_PaletteFadeOut:
	  .BYTE $32

byte_BANKC_8A02:
	  .BYTE $22
      .BYTE $12
; ---------------------------------------------------------------------------

loc_BANKC_8A04:
      DEC     PlayerXLo
      BPL     locret_BANKC_8A36

      LDA     #$10
      STA     PlayerXLo
      LDA     #$3F
      STA     PPUBuffer_301
      LDA     #$11
      STA     byte_RAM_302
      LDA     #1
      STA     byte_RAM_303
      LDY     ObjectXLo+1
      LDA     CastRoll_PaletteFadeOut,Y
      STA     byte_RAM_304
      LDA     #0
      STA     byte_RAM_305
      INC     ObjectXLo+1
      LDA     ObjectXLo+1
      CMP     #3
      BNE     locret_BANKC_8A36

      INC     ObjectXLo
      LDA     #$16
      STA     PlayerXLo

locret_BANKC_8A36:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_8A37:
      DEC     PlayerXLo
      BPL     locret_BANKC_8A51

      LDX     #$16
      LDY     #0
      LDA     #$F8

loc_BANKC_8A41:
      STA     SpriteDMAArea + $40,Y
      INY
      INY
      INY
      INY
      DEX
      BPL     loc_BANKC_8A41

      LDA     #$30
      STA     PlayerXLo

loc_BANKC_8A4F:
      INC     ObjectXLo

locret_BANKC_8A51:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_8A52:
      DEC     PlayerXLo
      BPL     locret_BANKC_8A81

      LDA     #0
      STA     ObjectXHi+4
      STA     ObjectXHi+5

loc_BANKC_8A5C:
      STA     ObjectXHi+6
      LDA     #5
      STA     ObjectXHi+7
      LDA     #$14
      STA     ObjectXHi+8
      LDA     #$3F
      STA     PPUBuffer_301
      LDA     #$11
      STA     byte_RAM_302
      LDA     #1
      STA     byte_RAM_303
      LDA     #$30
      STA     byte_RAM_304
      LDA     #0
      STA     byte_RAM_305
      INC     ObjectXLo

locret_BANKC_8A81:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_8A82:
      LDA     ObjectXHi+5
      AND     #$80
      BNE     locret_BANKC_8ACC

      LDA     ObjectXHi+5
      BNE     loc_BANKC_8ACD

      DEC     ObjectXHi+7
      BPL     locret_BANKC_8ACC

      LDA     #5
      STA     ObjectXHi+7
      LDA     #3
      STA     ObjectXHi+6
      LDX     #0
      LDY     ObjectXHi+4

loc_BANKC_8A9C:
      LDA     #$40
      STA     SpriteDMAArea,X
      INX
      LDA     byte_BANKC_92FE,Y
      STA     SpriteDMAArea,X
      INY
      INX
      LDA     #0
      STA     SpriteDMAArea,X
      INX
      LDA     byte_BANKC_92FE,Y
      STA     SpriteDMAArea,X
      INY
      INX
      DEC     ObjectXHi+6
      BPL     loc_BANKC_8A9C

      STY     ObjectXHi+4
      DEC     ObjectXHi+8
      BPL     locret_BANKC_8ACC

      INC     ObjectXHi+5
      LDA     #$12
      STA     ObjectXHi+8
      LDA     #0
      STA     ObjectXHi+4

locret_BANKC_8ACC:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_8ACD:
      DEC     ObjectXHi+7
      BPL     locret_BANKC_8B07

      LDA     #5
      STA     ObjectXHi+7
      LDA     #3
      STA     ObjectXHi+6
      LDX     #0
      LDY     ObjectXHi+4

loc_BANKC_8ADD:
      LDA     #$40
      STA     SpriteDMAArea + $10,X
      INX
      LDA     byte_BANKC_93A6,Y
      STA     SpriteDMAArea + $10,X
      INY
      INX
      LDA     #0
      STA     SpriteDMAArea + $10,X
      INX
      LDA     byte_BANKC_93A6,Y
      STA     SpriteDMAArea + $10,X
      INY
      INX
      DEC     ObjectXHi+6
      BPL     loc_BANKC_8ADD

      STY     ObjectXHi+4
      DEC     ObjectXHi+8
      BPL     locret_BANKC_8B07

      LDA     #$FF
      STA     ObjectXHi+5

locret_BANKC_8B07:
      RTS

; ---------------------------------------------------------------------------
CastRoll_SpritePointersHi:
	  .BYTE	>CastRoll_Mario ;	DATA XREF: sub_BANKC_84EC+7r

      .BYTE >CastRoll_Luigi
      .BYTE >CastRoll_Princess
      .BYTE >CastRoll_Toad
      .BYTE >CastRoll_Shyguy
      .BYTE >CastRoll_Snifit
      .BYTE >CastRoll_Ninji
      .BYTE >CastRoll_Beezo
      .BYTE >CastRoll_Porcupo
      .BYTE >CastRoll_Tweeter
      .BYTE >CastRoll_BobOmb
      .BYTE >CastRoll_Hoopstar
      .BYTE >CastRoll_Trouter
      .BYTE >CastRoll_Pidgit
      .BYTE >CastRoll_Panser
      .BYTE >CastRoll_Flurry
      .BYTE >CastRoll_Albatoss
      .BYTE >CastRoll_Phanto
      .BYTE >CastRoll_Spark
      .BYTE >CastRoll_Subcon
      .BYTE >CastRoll_Pokey
      .BYTE >CastRoll_Birdo
      .BYTE >CastRoll_Ostro
      .BYTE >CastRoll_Autobomb
      .BYTE >CastRoll_Cobrat
      .BYTE >CastRoll_Mouser
      .BYTE >CastRoll_Fryguy
      .BYTE >CastRoll_Clawglip
      .BYTE >CastRoll_Triclyde
CastRoll_SpritePointersLo:
	  .BYTE	<CastRoll_Mario

      .BYTE <CastRoll_Luigi
      .BYTE <CastRoll_Princess
      .BYTE <CastRoll_Toad
      .BYTE <CastRoll_Shyguy
      .BYTE <CastRoll_Snifit
      .BYTE <CastRoll_Ninji
      .BYTE <CastRoll_Beezo
      .BYTE <CastRoll_Porcupo
      .BYTE <CastRoll_Tweeter
      .BYTE <CastRoll_BobOmb
      .BYTE <CastRoll_Hoopstar
      .BYTE <CastRoll_Trouter
      .BYTE <CastRoll_Pidgit
      .BYTE <CastRoll_Panser
      .BYTE <CastRoll_Flurry
      .BYTE <CastRoll_Albatoss
      .BYTE <CastRoll_Phanto
      .BYTE <CastRoll_Spark
      .BYTE <CastRoll_Subcon
      .BYTE <CastRoll_Pokey
      .BYTE <CastRoll_Birdo
      .BYTE <CastRoll_Ostro
      .BYTE <CastRoll_Autobomb
      .BYTE <CastRoll_Cobrat
      .BYTE <CastRoll_Mouser
      .BYTE <CastRoll_Fryguy
      .BYTE <CastRoll_Clawglip
      .BYTE <CastRoll_Triclyde
CastRoll_Mario:
	  .BYTE $D0, $3E, 0, $30			   
      .BYTE $D0, 0, 0, $38			  ; 4
      .BYTE $D0, 2, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, 4, 0, $38			  ; $14
      .BYTE $F9, 6, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $24			  ; $20
      .BYTE $F9, $E8, 0, $2C			  ; $24
      .BYTE $F9, $D0, 0, $34			  ; $28
      .BYTE $F9, $F2, 0, $3C			  ; $2C
      .BYTE $F9, $E0, 0, $44			  ; $30
      .BYTE $F9, $EC, 0, $4C			  ; $34
      .BYTE $F9, $3E, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Luigi:
	  .BYTE $D0, $3E, 0, $30			   
      .BYTE $D0, 8, 0, $38			  ; 4
      .BYTE $D0, $A, 0,	$40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $C, 0,	$38			  ; $14
      .BYTE $F9, $E, 0,	$40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $24			  ; $20
      .BYTE $F9, $E6, 0, $2C			  ; $24
      .BYTE $F9, $F8, 0, $34			  ; $28
      .BYTE $F9, $E0, 0, $3C			  ; $2C
      .BYTE $F9, $DC, 0, $44			  ; $30
      .BYTE $F9, $E0, 0, $4C			  ; $34
      .BYTE $F9, $3E, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Princess:
	  .BYTE	$D0, $3E, 0, $30		      
      .BYTE $D0, $10, 0, $38			  ; 4
      .BYTE $D0, $12, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $14, 0, $38			  ; $14
      .BYTE $F9, $16, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $EE, 0, $20			  ; $20
      .BYTE $F9, $F2, 0, $28			  ; $24
      .BYTE $F9, $E0, 0, $30			  ; $28
      .BYTE $F9, $EA, 0, $38			  ; $2C
      .BYTE $F9, $D4, 0, $40			  ; $30
      .BYTE $F9, $D8, 0, $48			  ; $34
      .BYTE $F9, $F4, 0, $50			  ; $38
      .BYTE $F9, $F4, 0, $58			  ; $3C
CastRoll_Toad:
	  .BYTE $D0, $3E, 0, $30			  ;	DATA XREF: BANKC:8B0Bo
      .BYTE $D0, $18, 0, $38			  ; 4
      .BYTE $D0, $1A, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $1C, 0, $38			  ; $14
      .BYTE $F9, $1E, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $20			  ; $20
      .BYTE $F9, $3E, 0, $28			  ; $24
      .BYTE $F9, $F6, 0, $30			  ; $28
      .BYTE $F9, $EC, 0, $38			  ; $2C
      .BYTE $F9, $D0, 0, $40			  ; $30
      .BYTE $F9, $D6, 0, $48			  ; $34
      .BYTE $F9, $3E, 0, $50			  ; $38
      .BYTE $F9, $3E, 0, $58			  ; $3C
CastRoll_Shyguy:
	  .BYTE $D0, $3E,	0, $30			    
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $20, 0, $38			  ; $14
      .BYTE $F9, $22, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $20			  ; $20
      .BYTE $F9, $F4, 0, $28			  ; $24
      .BYTE $F9, $DE, 0, $30			  ; $28
      .BYTE $F9, $CC, 0, $38			  ; $2C
      .BYTE $F9, $DC, 0, $40			  ; $30
      .BYTE $F9, $F8, 0, $48			  ; $34
      .BYTE $F9, $CC, 0, $50			  ; $38
      .BYTE $F9, $3E, 0, $58			  ; $3C
CastRoll_Snifit:
	  .BYTE $D0, $3E,	0, $30			    
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $24, 0, $38			  ; $14
      .BYTE $F9, $26, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $20			  ; $20
      .BYTE $F9, $F4, 0, $28			  ; $24
      .BYTE $F9, $EA, 0, $30			  ; $28
      .BYTE $F9, $E0, 0, $38			  ; $2C
      .BYTE $F9, $DA, 0, $40			  ; $30
      .BYTE $F9, $E0, 0, $48			  ; $34
      .BYTE $F9, $F6, 0, $50			  ; $38
      .BYTE $F9, $3E, 0, $58			  ; $3C
CastRoll_Ninji:
	  .BYTE $D0, $3E, 0, $30			   
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $28, 0, $38			  ; $14
      .BYTE $F9, $2A, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $24			  ; $20
      .BYTE $F9, $EA, 0, $2C			  ; $24
      .BYTE $F9, $E0, 0, $34			  ; $28
      .BYTE $F9, $EA, 0, $3C			  ; $2C
      .BYTE $F9, $E2, 0, $44			  ; $30
      .BYTE $F9, $E0, 0, $4C			  ; $34
      .BYTE $F9, $3E, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Beezo:
	  .BYTE $D0, $3E, 0, $30			   
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $2C, 0, $38			  ; $14
      .BYTE $F9, $2E, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $24			  ; $20
      .BYTE $F9, $D2, 0, $2C			  ; $24
      .BYTE $F9, $D8, 0, $34			  ; $28
      .BYTE $F9, $D8, 0, $3C			  ; $2C
      .BYTE $F9, $CE, 0, $44			  ; $30
      .BYTE $F9, $EC, 0, $4C			  ; $34
      .BYTE $F9, $3E, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Porcupo:
	  .BYTE $D0, $3E, 0, $30			     
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $30, 0, $38			  ; $14
      .BYTE $F9, $32, 0, $40			  ; $18
      .BYTE $F9					  ; $1C
byte_BANKC_8D5F:
	  .BYTE $3E, 0, $48, $F9			    
      .BYTE $EE, 0, $24, $F9			  ; 4
      .BYTE $EC, 0, $2C, $F9			  ; 8
      .BYTE $F2, 0, $34, $F9			  ; $C
      .BYTE $D4, 0, $3C, $F9			  ; $10
      .BYTE $F8, 0, $44, $F9			  ; $14
      .BYTE $EE, 0, $4C, $F9			  ; $18
      .BYTE $EC, 0, $54, $F9			  ; $1C
      .BYTE $3E, 0, $5C				  ; $20
CastRoll_Tweeter:
	  .BYTE $D0, $3E, 0, $30			     
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $34, 0, $38			  ; $14
      .BYTE $F9, $36, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $F6, 0, $24			  ; $20
      .BYTE $F9, $FC, 0, $2C			  ; $24
      .BYTE $F9, $D8, 0, $34			  ; $28
      .BYTE $F9, $D8, 0, $3C			  ; $2C
      .BYTE $F9, $F6, 0, $44			  ; $30
      .BYTE $F9, $D8, 0, $4C			  ; $34
      .BYTE $F9, $F2, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_BobOmb:
	  .BYTE $D0, $3E,	0, $30			    
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $38, 0, $38			  ; $14
      .BYTE $F9, $3A, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $D2, 0, $24			  ; $20
      .BYTE $F9, $EC, 0, $2C			  ; $24
      .BYTE $F9, $D2, 0, $34			  ; $28
      .BYTE $F9, $3E, 0, $3C			  ; $2C
      .BYTE $F9, $EC, 0, $44			  ; $30
      .BYTE $F9, $E8, 0, $4C			  ; $34
      .BYTE $F9, $D2, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Hoopstar:
	  .BYTE	$D0, $3E, 0, $30		      
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $3C, 0, $38			  ; $14
      .BYTE $F9, $3C, $40, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $DE, 0, $20			  ; $20
      .BYTE $F9, $EC, 0, $28			  ; $24
      .BYTE $F9, $EC, 0, $30			  ; $28
      .BYTE $F9, $EE, 0, $38			  ; $2C
      .BYTE $F9, $F4, 0, $40			  ; $30
      .BYTE $F9, $F6, 0, $48			  ; $34
      .BYTE $F9, $D0, 0, $50			  ; $38
      .BYTE $F9, $F2, 0, $58			  ; $3C
CastRoll_Trouter:
	  .BYTE $D0, $3E, 0, $30			     
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $40, 0, $38			  ; $14
      .BYTE $F9, $42, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $F6, 0, $24			  ; $20
      .BYTE $F9, $F2, 0, $2C			  ; $24
      .BYTE $F9, $EC, 0, $34			  ; $28
      .BYTE $F9, $F8, 0, $3C			  ; $2C
      .BYTE $F9, $F6, 0, $44			  ; $30
      .BYTE $F9, $D8, 0, $4C			  ; $34
      .BYTE $F9, $F2, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Pidgit:
	  .BYTE $D0, $3E,	0, $30			    
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $44, 0, $38			  ; $14
      .BYTE $F9, $46, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $20			  ; $20
      .BYTE $F9, $EE, 0, $28			  ; $24
      .BYTE $F9, $E0, 0, $30			  ; $28
      .BYTE $F9, $D6, 0, $38			  ; $2C
      .BYTE $F9, $DC, 0, $40			  ; $30
      .BYTE $F9, $E0, 0, $48			  ; $34
      .BYTE $F9, $F6, 0, $50			  ; $38
      .BYTE $F9, $3E, 0, $58			  ; $3C
CastRoll_Panser:
	  .BYTE $D0, $3E,	0, $30			    
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $48, 0, $38			  ; $14
      .BYTE $F9, $4A, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $20			  ; $20
      .BYTE $F9, $EE, 0, $28			  ; $24
      .BYTE $F9, $D0, 0, $30			  ; $28
      .BYTE $F9, $EA, 0, $38			  ; $2C
      .BYTE $F9, $F4, 0, $40			  ; $30
      .BYTE $F9, $D8, 0, $48			  ; $34
      .BYTE $F9, $F2, 0, $50			  ; $38
      .BYTE $F9, $3E, 0, $58			  ; $3C
CastRoll_Flurry:
	  .BYTE $D0, $3E,	0, $30			    
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $4C, 0, $38			  ; $14
      .BYTE $F9, $4E, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $20			  ; $20
      .BYTE $F9, $DA, 0, $28			  ; $24
      .BYTE $F9, $E6, 0, $30			  ; $28
      .BYTE $F9, $F8, 0, $38			  ; $2C
      .BYTE $F9, $F2, 0, $40			  ; $30
      .BYTE $F9, $F2, 0, $48			  ; $34
      .BYTE $F9, $CC, 0, $50			  ; $38
      .BYTE $F9, $3E, 0, $58			  ; $3C
CastRoll_Albatoss:
	  .BYTE	$D0, $3E, 0, $30		      
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $50, 0, $30			  ; $10
      .BYTE $F9, $52, 0, $38			  ; $14
      .BYTE $F9, $54, 0, $40			  ; $18
      .BYTE $F9, $56, 0, $48			  ; $1C
      .BYTE $F9, $D0, 0, $20			  ; $20
      .BYTE $F9, $E6, 0, $28			  ; $24
      .BYTE $F9, $D2, 0, $30			  ; $28
      .BYTE $F9, $D0, 0, $38			  ; $2C
      .BYTE $F9, $F6, 0, $40			  ; $30
      .BYTE $F9, $EC, 0, $48			  ; $34
      .BYTE $F9, $F4, 0, $50			  ; $38
      .BYTE $F9, $F4, 0, $58			  ; $3C
CastRoll_Phanto:
	  .BYTE $D0, $3E,	0, $30			    
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $68, 0, $38			  ; $14
      .BYTE $F9, $68, $40, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $20			  ; $20
      .BYTE $F9, $EE, 0, $28			  ; $24
      .BYTE $F9, $DE, 0, $30			  ; $28
      .BYTE $F9, $D0, 0, $38			  ; $2C
      .BYTE $F9, $EA, 0, $40			  ; $30
      .BYTE $F9, $F6, 0, $48			  ; $34
      .BYTE $F9, $EC, 0, $50			  ; $38
      .BYTE $F9, $3E, 0, $58			  ; $3C
CastRoll_Spark:
	  .BYTE $D0, $3E, 0, $30			   
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $6A, 0, $38			  ; $14
      .BYTE $F9, $6A, $40, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $24			  ; $20
      .BYTE $F9, $F4, 0, $2C			  ; $24
      .BYTE $F9, $EE, 0, $34			  ; $28
      .BYTE $F9, $D0, 0, $3C			  ; $2C
      .BYTE $F9, $F2, 0, $44			  ; $30
      .BYTE $F9, $E4, 0, $4C			  ; $34
      .BYTE $F9, $3E, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Subcon:
	  .BYTE $D0, $3E,	0, $30			    
      .BYTE $D0, $3E, 0, $38			  ; 4
      .BYTE $D0, $3E, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $6C, 0, $38			  ; $14
      .BYTE $F9, $6E, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $24			  ; $20
      .BYTE $F9, $F4, 0, $2C			  ; $24
      .BYTE $F9, $F8, 0, $34			  ; $28
      .BYTE $F9, $D2, 0, $3C			  ; $2C
      .BYTE $F9, $D4, 0, $44			  ; $30
      .BYTE $F9, $EC, 0, $4C			  ; $34
      .BYTE $F9, $EA, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Pokey:
	  .BYTE $D0, $3E, 0, $30			   
      .BYTE $D0, $60, 0, $38			  ; 4
      .BYTE $D0, $62, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $64, 0, $38			  ; $14
      .BYTE $F9, $66, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $24			  ; $20
      .BYTE $F9, $EE, 0, $2C			  ; $24
      .BYTE $F9, $EC, 0, $34			  ; $28
      .BYTE $F9, $E4, 0, $3C			  ; $2C
      .BYTE $F9, $D8, 0, $44			  ; $30
      .BYTE $F9, $CC, 0, $4C			  ; $34
      .BYTE $F9, $3E, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Birdo:
	  .BYTE $D0, $3E, 0, $30			   
      .BYTE $D0, $70, 0, $38			  ; 4
      .BYTE $D0, $72, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $74, 0, $38			  ; $14
      .BYTE $F9, $76, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $24			  ; $20
      .BYTE $F9, $D2, 0, $2C			  ; $24
      .BYTE $F9, $E0, 0, $34			  ; $28
      .BYTE $F9, $F2, 0, $3C			  ; $2C
      .BYTE $F9, $D6, 0, $44			  ; $30
      .BYTE $F9, $EC, 0, $4C			  ; $34
      .BYTE $F9, $3E, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Ostro:
	  .BYTE $D0, $3E, 0, $30			   
      .BYTE $D0, $78, 0, $38			  ; 4
      .BYTE $D0, $7A, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $7C, 0, $38			  ; $14
      .BYTE $F9, $7E, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $24			  ; $20
      .BYTE $F9, $EC, 0, $2C			  ; $24
      .BYTE $F9, $F4, 0, $34			  ; $28
      .BYTE $F9, $F6, 0, $3C			  ; $2C
      .BYTE $F9, $F2, 0, $44			  ; $30
      .BYTE $F9, $EC, 0, $4C			  ; $34
      .BYTE $F9, $3E, 0, $54			  ; $38
      .BYTE $F9, $3E, 0, $5C			  ; $3C
CastRoll_Autobomb:
	  .BYTE	$D0, $3E, 0, $30		      
      .BYTE $D0, $80, 0, $38			  ; 4
      .BYTE $D0, $82, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $84, 0, $38			  ; $14
      .BYTE $F9, $86, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $D0, 0, $20			  ; $20
      .BYTE $F9, $F8, 0, $28			  ; $24
      .BYTE $F9, $F6, 0, $30			  ; $28
      .BYTE $F9, $EC, 0, $38			  ; $2C
      .BYTE $F9, $D2, 0, $40			  ; $30
      .BYTE $F9, $EC, 0, $48			  ; $34
      .BYTE $F9, $E8, 0, $50			  ; $38
      .BYTE $F9, $D2, 0, $58			  ; $3C
CastRoll_Cobrat:
	  .BYTE $D0, $3E,	0, $30			    
      .BYTE $D0, $58, 0, $38			  ; 4
      .BYTE $D0, $5A, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $3E, 0, $30			  ; $10
      .BYTE $F9, $5C, 0, $38			  ; $14
      .BYTE $F9, $5E, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $20			  ; $20
      .BYTE $F9, $D4, 0, $28			  ; $24
      .BYTE $F9, $EC, 0, $30			  ; $28
      .BYTE $F9, $D2, 0, $38			  ; $2C
      .BYTE $F9, $F2, 0, $40			  ; $30
      .BYTE $F9, $D0, 0, $48			  ; $34
      .BYTE $F9, $F6, 0, $50			  ; $38
      .BYTE $F9, $3E, 0, $58			  ; $3C
CastRoll_Mouser:
	  .BYTE $D0, $88,	0, $30			    
      .BYTE $D0, $8A, 0, $38			  ; 4
      .BYTE $D0, $8C, 0, $40			  ; 8
      .BYTE $D0, $3E, 0, $48			  ; $C
      .BYTE $F9, $8E, 0, $30			  ; $10
      .BYTE $F9, $90, 0, $38			  ; $14
      .BYTE $F9, $92, 0, $40			  ; $18
      .BYTE $F9, $3E, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $1C			  ; $20
      .BYTE $F9, $E8, 0, $24			  ; $24
      .BYTE $F9, $EC, 0, $2C			  ; $28
      .BYTE $F9, $F8, 0, $34			  ; $2C
      .BYTE $F9, $F4, 0, $3C			  ; $30
      .BYTE $F9, $D8, 0, $44			  ; $34
      .BYTE $F9, $F2, 0, $4C			  ; $38
      .BYTE $F9, $3E, 0, $54			  ; $3C
CastRoll_Fryguy:
	  .BYTE $D0, $AA,	0, $30			    
      .BYTE $D0, $AC, 0, $38			  ; 4
      .BYTE $D0, $AE, 0, $40			  ; 8
      .BYTE $D0, $B0, 0, $48			  ; $C
      .BYTE $F9, $B2, 0, $30			  ; $10
      .BYTE $F9, $B4, 0, $38			  ; $14
      .BYTE $F9, $B6, 0, $40			  ; $18
      .BYTE $F9, $B8, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $20			  ; $20
      .BYTE $F9, $DA, 0, $28			  ; $24
      .BYTE $F9, $F2, 0, $30			  ; $28
      .BYTE $F9, $CC, 0, $38			  ; $2C
      .BYTE $F9, $DC, 0, $40			  ; $30
      .BYTE $F9, $F8, 0, $48			  ; $34
      .BYTE $F9, $CC, 0, $50			  ; $38
      .BYTE $F9, $3E, 0, $58			  ; $3C
CastRoll_Clawglip:
	  .BYTE	$D0, $BA, 0, $30		      
      .BYTE $D0, $BC, 0, $38			  ; 4
      .BYTE $D0, $BE, 0, $40			  ; 8
      .BYTE $D0, $C0, 0, $48			  ; $C
      .BYTE $F9, $C2, 0, $30			  ; $10
      .BYTE $F9, $C4, 0, $38			  ; $14
      .BYTE $F9, $C6, 0, $40			  ; $18
      .BYTE $F9, $C8, 0, $48			  ; $1C
      .BYTE $F9, $D4, 0, $20			  ; $20
      .BYTE $F9, $E6, 0, $28			  ; $24
      .BYTE $F9, $D0, 0, $30			  ; $28
      .BYTE $F9, $FC, 0, $38			  ; $2C
      .BYTE $F9, $DC, 0, $40			  ; $30
      .BYTE $F9, $E6, 0, $48			  ; $34
      .BYTE $F9, $E0, 0, $50			  ; $38
      .BYTE $F9, $EE, 0, $58			  ; $3C
CastRoll_Triclyde:
	  .BYTE	$D0, $94, 0, $30		      
      .BYTE $D0, $96, 0, $38			  ; 4
      .BYTE $D0, $98, 0, $40			  ; 8
      .BYTE $D0, $9A, 0, $48			  ; $C
      .BYTE $F9, $9C, 0, $30			  ; $10
      .BYTE $F9, $9E, 0, $38			  ; $14
      .BYTE $F9, $A0, 0, $40			  ; $18
      .BYTE $F9, $A2, 0, $48			  ; $1C
      .BYTE $F9, $3E, 0, $30			  ; $20
      .BYTE $F9, $A4, 0, $38			  ; $24
      .BYTE $F9, $A6, 0, $40			  ; $28
      .BYTE $F9, $A8, 0, $48			  ; $2C
      .BYTE $F9, $3E, 0, $50			  ; $30
      .BYTE $F9, $3E, 0, $58			  ; $34
      .BYTE $F9, $3E, 0, $60			  ; $38
      .BYTE $F9, $3E, 0, $68			  ; $3C
CastRoll_TriclydeText:
	  .BYTE $D0, $F6, 0, $20			  
      .BYTE $D0, $F2, 0, $28			  ; 4
      .BYTE $D0, $E0, 0, $30			  ; 8
      .BYTE $D0, $D4, 0, $38			  ; $C
      .BYTE $D0, $E6, 0, $40			  ; $10
      .BYTE $D0, $CC, 0, $48			  ; $14
      .BYTE $D0, $D6, 0, $50			  ; $18
      .BYTE $D0, $D8, 0, $58			  ; $1C
CastRoll_Wart:
	  .BYTE $D0, $80, 0, $28			  
      .BYTE $D0, $82, 0, $30			  ; 4
      .BYTE $D0, $84, 0, $38			  ; 8
      .BYTE $D0, $86, 0, $40			  ; $C
      .BYTE $D0, $88, 0, $48			  ; $10
      .BYTE $F9, $8A, 0, $28			  ; $14
      .BYTE $F9, $8C, 0, $30			  ; $18
      .BYTE $F9, $8E, 0, $38			  ; $1C
      .BYTE $F9, $90, 0, $40			  ; $20
      .BYTE $F9, $92, 0, $48			  ; $24
      .BYTE $F9, $94, 0, $28			  ; $28
      .BYTE $F9, $96, 0, $30			  ; $2C
      .BYTE $F9, $98, 0, $38			  ; $30
      .BYTE $F9, $9A, 0, $40			  ; $34
      .BYTE $F9, $9C, 0, $48			  ; $38
      .BYTE $F9, $C0, 0, $20			  ; $3C
      .BYTE $F9, $C0, 0, $20			  ; $40
      .BYTE $F9, $FC, 0, $2C			  ; $44
      .BYTE $F9, $D0, 0, $34			  ; $48
      .BYTE $F9, $F2, 0, $3C			  ; $4C
      .BYTE $F9, $F6, 0, $44			  ; $50
      .BYTE $F9, $C0, 0, $50			  ; $54
      .BYTE $F9, $C0, 0, $58			  ; $58
byte_BANKC_92FE:
	  .BYTE $10

      .BYTE $90
      .BYTE $7C
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $12
      .BYTE $90
      .BYTE $7C
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $14
      .BYTE $90
      .BYTE $7C
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $16
      .BYTE $90
      .BYTE $7C
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $16
      .BYTE $90
      .BYTE $18
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $16
      .BYTE $90
      .BYTE $1A
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $16
      .BYTE $90
      .BYTE $1C
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $16
      .BYTE $90
      .BYTE $1E
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $20
      .BYTE $90
      .BYTE $1E
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $1E
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $28
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $2A
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $2A
      .BYTE $98
      .BYTE $2C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $2A
      .BYTE $98
      .BYTE $2E
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $32
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $34
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $36
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $36
      .BYTE $A0
      .BYTE $38
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $3A
      .BYTE $A0
      .BYTE $3C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $3E
      .BYTE $A0
      .BYTE $40
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $3E
      .BYTE $A0
      .BYTE $42
      .BYTE $A8
byte_BANKC_93A6:
	  .BYTE $44

      .BYTE $B0
      .BYTE $46
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $48
      .BYTE $B0
      .BYTE $4A
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $4C
      .BYTE $B0
      .BYTE $4E
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $50
      .BYTE $B0
      .BYTE $52
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $54
      .BYTE $B0
      .BYTE $56
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $58
      .BYTE $B0
      .BYTE $5A
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $5E
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $60
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $62
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $66
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $68
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6A
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $6E
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $70
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $72
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $74
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $76
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $78
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $7A
      .BYTE $C8
      .BYTE $60
; [00000BC1 BYTES: BEGIN OF AREA UNUSED-BANKC:943F. PRESS KEYPAD "-" TO	COLLAPSE]
_unused_BANKC_943F:
	  .BYTE $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF
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
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $700
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $710
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $720
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $730
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $740
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $750
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $760
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $770
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $780
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $790
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $800
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $810
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $820
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $830
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $840
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $850
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $860
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $870
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $880
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $890
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $900
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $910
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $920
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $930
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $940
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $950
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $960
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $970
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $980
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $990
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A00
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A40
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A50
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A70
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A80
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A90
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AA0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AB0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AC0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AD0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AE0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AF0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B00
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B40
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B50
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B70
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B80
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B90
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $BA0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $BB0
      .BYTE $FF					  ; $BC0
; end of 'BANKC'

; [00000BC1 BYTES: END OF AREA UNUSED-BANKC:943F. PRESS	KEYPAD "-" TO COLLAPSE]
; ===========================================================================

