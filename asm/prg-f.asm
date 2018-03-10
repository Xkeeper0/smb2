
      ;.segment	BANKF
;       *	=  $E000
      .BYTE 0					  ; PPUBuffer_BANKE_DFA7 continued from	end of Bank D
      .BYTE $23,$E7,1,0				  
      .BYTE $23,$EF,1,0				  
      .BYTE $23,$F7,1,0				  
      .BYTE $23,$FF,1,0				  
      .BYTE 0
WorldStartingLevel:
	  .BYTE 0

WorldPlus1StartingLevel:
	  .BYTE 3					    
      .BYTE 6					  ; 1
      .BYTE 9					  ; 2
      .BYTE $C					  ; 3
      .BYTE $F					  ; 4
      .BYTE $12					  ; 5
      .BYTE $14					  ; 6
PlayerSelectMarioSprites1:
	  .BYTE	$8F,0,0,$48			      
      .BYTE $8F,0,$40,$50			  ; 4
      .BYTE $9F,2,0,$48				  ; 8
      .BYTE $9F,2,$40,$50			  ; $C
PlayerSelectLuigiSprites1:
	  .BYTE	$8F,4,1,$68			      
      .BYTE $8F,4,$41,$70			  ; 4
      .BYTE $9F,6,1,$68				  ; 8
      .BYTE $9F,6,$41,$70			  ; $C
PlayerSelectToadSprites1:
	  .BYTE $8F,8,2,$88			     
      .BYTE $8F,8,$42,$90			  ; 4
      .BYTE $9F,$A,2,$88			  ; 8
      .BYTE $9F,$A,$42,$90			  ; $C
PlayerSelectPrincessSprites1:
	  .BYTE $8F,$C,3,$A8				 
      .BYTE $8F,$C,$43,$B0			  ; 4
      .BYTE $9F,$E,3,$A8			  ; 8
      .BYTE $9F,$E,$43,$B0			  ; $C
PlayerSelectMarioSprites2:
	  .BYTE	$8F,$10,0,$48			      
      .BYTE $8F,$12,0,$50			  ; 4
      .BYTE $9F,$14,0,$48			  ; 8
      .BYTE $9F,$16,0,$50			  ; $C
PlayerSelectLuigiSprites2:
	  .BYTE	$8F,$18,1,$68			      
      .BYTE $8F,$1A,1,$70			  ; 4
      .BYTE $9F,$1C,1,$68			  ; 8
      .BYTE $9F,$1E,1,$70			  ; $C
PlayerSelectToadSprites2:
	  .BYTE $8F,$20,2,$88			     
      .BYTE $8F,$22,2,$90			  ; 4
      .BYTE $9F,$24,2,$88			  ; 8
      .BYTE $9F,$26,2,$90			  ; $C
PlayerSelectPrincessSprites2:
	  .BYTE $8F,$28,3,$A8			 
      .BYTE $8F,$2A,3,$B0			  ; 4
      .BYTE $9F,$2C,3,$A8			  ; 8
      .BYTE $9F,$2E,3,$B0			  ; $C
PlayerSelectSpriteIndexes:
	  .BYTE	0, $30,	$20, $10		      
BonusChanceCherrySprite:
	  .BYTE $5F,5,1,$58			    
      .BYTE $5F,7,1,$60				  ; 4
BonusChanceStarSprite:
	  .BYTE $5F,9,1,$58				  
      .BYTE $5F,9,$41,$60			  ; 4
BonusChanceVeggieSprite:
	  .BYTE $5F,$B,1,$58			    
      .BYTE $5F,$B,$41,$60			  ; 4
BonusChanceSnifitSprite:
	  .BYTE $5F,1,1,$58			    
      .BYTE $5F,3,1,$60				  ; 4
PlayerSelectSpritePalettesDark:
	  .BYTE $3F,$10,$10,$F			   
      .BYTE $22,$12,1,$F			  ; 4
      .BYTE $22,$12,1,$F			  ; 8
      .BYTE $22,$12,1,$F			  ; $C
      .BYTE $22
      .BYTE $12
      .BYTE 1
unk_BANKF_E0D1:
	  .BYTE   0

      .BYTE $15
      .BYTE  $E
      .BYTE   7
byte_BANKF_E0D5:
	  .BYTE $3F,$10,4,$F			    
      .BYTE $27,$16,1,$3F			  ; 4
      .BYTE $14,4,$F,$36			  ; 8
      .BYTE $2A,1,$3F,$18			  ; $C
      .BYTE 4,$F,$27,$30			  ; $10
      .BYTE 1,$3F,$1C,4				  ; $14
      .BYTE $F,$36,$25,7			  ; $18
TitleCardPalettes:
	  .BYTE	$3F,0,$20,$38			      
      .BYTE $30,$1A,$F,$38			  ; 4
      .BYTE $38,$F,$F,$38			  ; 8
      .BYTE $17,$17,$38,$38			  ; $C
      .BYTE $28,$18,8,$38			  ; $10
      .BYTE $30,$27,1,$38			  ; $14
      .BYTE $37,$27,6,$38			  ; $18
      .BYTE $25,$36,6,$38			  ; $1C
      .BYTE $12,$36,1,0				  ; $20
BonusChanceSpritePalettes:
	  .BYTE	$F,$37,$16,$F			      
      .BYTE $F,$37,$16,$F			  ; 4
      .BYTE $F,$37,$16,$F			  ; 8
      .BYTE $F,$37,$16,$F			  ; $C

; =============== S U B	R O U T	I N E =======================================

; Load A with an index and call	this to
; jump to a pointer from the table directly
; after	the call.

JumpToTableAfterJump:
      ASL     A
      TAY
      PLA
      STA     byte_RAM_A
      PLA
      STA     byte_RAM_B
      INY
      LDA     (byte_RAM_A),Y
      STA     word_RAM_C
      INY
      LDA     (byte_RAM_A),Y
      STA     word_RAM_C+1
      JMP     (word_RAM_C)

; End of function JumpToTableAfterJump

; ---------------------------------------------------------------------------
BlackAndWhitePalette:
	  .BYTE $F,$30,$30,$F			 ; =============== S U B	R O U T	I N E =======================================

SetBlackAndWhitePalette:
      LDA     PPUSTATUS
      LDA     #$3F
      LDY     #0
      STA     PPUADDR
      STY     PPUADDR

loc_BANKF_E14B:
      TYA
      AND     #3
      TAX
      LDA     BlackAndWhitePalette,X
      STA     PPUDATA
      INY
      CPY     #$14
      BCC     loc_BANKF_E14B

      RTS

; End of function SetBlackAndWhitePalette

; =============== S U B	R O U T	I N E =======================================

SetScrollXYTo0:
      LDA     #0
      STA     PPUScrollYMirror
      STA     PPUScrollXMirror
      STA     byte_RAM_C8
      STA     byte_RAM_C9
      RTS

; End of function SetScrollXYTo0

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_E166:
      JSR     EnableNMI

      JSR     WaitForNMI_TurnOffPPU

      JSR     SetScrollXYTo0

      LDA     #ScreenUpdateBuffer_RAM_55F
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

      LDA     #0
      JSR     sub_BANKF_FFA0

      JSR     ClearNametables

      RTS

; End of function sub_BANKF_E166

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_E17F:
      JSR     EnableNMI

      JSR     WaitForNMI_TurnOffPPU

      LDA     #$40
      STA     StackArea
      LDA     #ScreenUpdateBuffer_CharacterSelect
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

      LDA     #ScreenUpdateBuffer_BANKE_DE7A
      STA     ScreenUpdateIndex
      JMP     WaitForNMI

; End of function sub_BANKF_E17F

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_E198:
      INY
      TYA
      JSR     sub_BANKF_EA8E

      INX
      TXA
      ORA     #$D0
      STA     byte_RAM_717D
      LDY     ExtraLives
      DEY
      TYA
      JSR     sub_BANKF_EA8E

      STY     byte_RAM_7191
      STA     byte_RAM_7192
      LDY     #6
      LDA     #$FB

loc_BANKF_E1B6:
      STA     unk_RAM_716B,Y
      DEY
      BPL     loc_BANKF_E1B6

      LDY     CurrentWorld
      LDA     CurrentLevel
      SEC
      SBC     WorldStartingLevel,Y
      STA     byte_RAM_629
      CLC
      ADC     #$D1
      STA     byte_RAM_717F
      LDA     WorldPlus1StartingLevel,Y
      SEC
      SBC     WorldStartingLevel,Y
      STA     byte_RAM_3
      LDX     #0
      LDY     #0

loc_BANKF_E1DC:
      LDA     #$FD
      CPX     byte_RAM_629
      BNE     loc_BANKF_E1E5

      LDA     #$F6

loc_BANKF_E1E5:
      STA     unk_RAM_716B,Y
      INY
      INY
      INX
      CPX     byte_RAM_3
      BCC     loc_BANKF_E1DC

      LDA     #8
      STA     ScreenUpdateIndex
      RTS

; End of function sub_BANKF_E198

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_E1F4:
      LDA     #$C0
      STA     StackArea
      RTS

; End of function sub_BANKF_E1F4

; =============== S U B	R O U T	I N E =======================================

InitializeSomeLevelStuff:
      LDA     #0
      STA     CurrentLevelArea
      STA     byte_RAM_4E8
      STA     byte_RAM_533
      STA     byte_RAM_4E9
      STA     byte_RAM_534
      STA     byte_RAM_4EA
      STA     PlayerState
      STA     byte_RAM_4E6
      STA     InSubspaceOrJar
      STA     byte_RAM_4EE
      STA     StopwatchTimer
      STA     byte_RAM_6F6
      RTS

; End of function InitializeSomeLevelStuff

; ---------------------------------------------------------------------------
byte_BANKF_E220:
	  .BYTE $C9

      .BYTE $D5
      .BYTE $D1
      .BYTE $CD
byte_BANKF_E224:
	  .BYTE $E9

      .BYTE $F5
      .BYTE $F1
      .BYTE $ED

; =============== S U B	R O U T	I N E =======================================

DisplayLevelTitleCardAndMore:
      JSR     WaitForNMI_TurnOffPPU

      JSR     DisableNMI

      LDA     #$FF				  ; Set	the scrolling mirror over to the right side...
						  ; This Isn't quiiite correct, and causes a bunch of
						  ; crud to show on the	very left pixel	-- residue
						  ; from the character select screen
      STA     PPUScrollXMirror
      JSR     ChangeTitleCardCHR

      LDA     #PRGBank_A_B
      JSR     ChangeMappedPRGBank

      JSR     CopyCharacterStatsAndStuff

      JSR     EnableNMI

      JSR     HideAllSprites

      LDY     #$23

loc_BANKF_E245:
      LDA     TitleCardPalettes,Y
      STA     PPUBuffer_55F,Y
      DEY
      BPL     loc_BANKF_E245

      LDA     #ScreenUpdateBuffer_RAM_55F	  ; Then tell it to dump that into the PPU
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

      LDA     #ScreenUpdateBuffer_BANKE_DFAF	  ; @TODO I am not sure	what this is doing, exactly
      STA     ScreenUpdateIndex			  ; Commenting it out doesn't seem to have any effect
      JSR     WaitForNMI

      JSR     DrawTitleCardWorldImage

      JSR     WaitForNMI_TurnOnPPU

      JSR     RestorePlayerToFullHealth

      LDA     #$50
      STA     byte_RAM_2

loc_BANKF_E269:
      JSR     WaitForNMI

      DEC     byte_RAM_2
      BPL     loc_BANKF_E269

      JSR     sub_BANKF_E1F4

      JSR     WaitForNMI_TurnOffPPU

      JSR     DisableNMI

      JSR     sub_BANKF_FE16

      LDA     #PRGBank_A_B
      JSR     ChangeMappedPRGBank

      JSR     CopyCharacterStatsAndStuff

      JSR     EnableNMI

      RTS

; End of function DisplayLevelTitleCardAndMore

; =============== S U B	R O U T	I N E =======================================

DoCharacterSelectMenu:
      JSR     WaitForNMI

      LDA     #0
      STA     PPUMASK
      JSR     DisableNMI

      JSR     LoadCharacterSelectCHRBanks

      LDA     #PRGBank_A_B
      JSR     ChangeMappedPRGBank

      JSR     CopyCharacterStatsAndStuff

      JSR     sub_BANKF_E166

      LDA     byte_RAM_636
      CMP     #$A5
      BEQ     loc_BANKF_E2B2

      LDA     #PRGBank_A_B
      JSR     ChangeMappedPRGBank

      LDA     #$A5
      STA     byte_RAM_636

loc_BANKF_E2B2:
      JSR     sub_BANKF_E17F

      JSR     DisableNMI

      LDA     #Music1_CharacterSelect
      STA     Music1Queue
      LDA     CurrentCharacter
      STA     byte_RAM_404
      LDA     CurrentWorld
      STA     byte_RAM_405
      LDY     #$3F

loc_BANKF_E2CA:
      LDA     PlayerSelectMarioSprites1,Y
      STA     SpriteDMAArea + $10,Y
      DEY
      BPL     loc_BANKF_E2CA

      JSR     EnableNMI

      JSR     WaitForNMI

      LDX     CurrentWorld
      LDY     CurrentLevel
      JSR     sub_BANKF_E198

      JSR     WaitForNMI

      JMP     loc_BANKF_E311

; ---------------------------------------------------------------------------

loc_BANKF_E2E8:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Right|ControllerInput_Left
      BNE     CharacterSelect_ChangeCharacter

      JMP     CharacterSelectMenuLoop

; ---------------------------------------------------------------------------

CharacterSelect_ChangeCharacter:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Right
      BEQ     loc_BANKF_E2FE

      DEC     CurrentCharacter
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffect1Queue

loc_BANKF_E2FE:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Left
      BEQ     loc_BANKF_E30B

      INC     CurrentCharacter
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffect1Queue

loc_BANKF_E30B:
      LDA     CurrentCharacter
      AND     #3
      STA     CurrentCharacter

loc_BANKF_E311:
      LDY     #0
      LDA     #$21
      STA     PPUBuffer_301
      LDA     #$C9
      STA     byte_RAM_302
      LDA     #$4F
      STA     byte_RAM_303
      LDA     #$FB
      STA     byte_RAM_304
      LDA     #$21
      STA     byte_RAM_305
      LDA     #$E9
      STA     byte_RAM_306
      LDA     #$4F
      STA     byte_RAM_307
      LDA     #$FB
      STA     byte_RAM_308
      LDY     CurrentCharacter
      LDA     #$21
      STA     byte_RAM_309
      LDA     byte_BANKF_E220,Y
      STA     byte_RAM_30A
      LDA     #2
      STA     byte_RAM_30B
      LDA     #$BE
      STA     byte_RAM_30C
      LDA     #$C0
      STA     byte_RAM_30D
      LDA     #$21
      STA     byte_RAM_30E
      LDA     byte_BANKF_E224,Y
      STA     byte_RAM_30F
      LDA     #2
      STA     byte_RAM_310
      LDA     #$BF
      STA     byte_RAM_311
      LDA     #$C1
      STA     byte_RAM_312
      LDA     #0
      STA     byte_RAM_313
      JSR     WaitForNMI_TurnOnPPU

      LDX     #$12
      LDY     #0

loc_BANKF_E37D:
      LDA     PlayerSelectSpritePalettesDark,Y
      STA     PPUBuffer_301,Y
      INY
      DEX
      BPL     loc_BANKF_E37D

      LDA     #6
      STA     byte_RAM_A
      LDX     CurrentCharacter
      LDA     unk_BANKF_E0D1,X			  ; @TODO What is this *doing*?
						  ; It's reading in the middle of some palette data
      TAX

loc_BANKF_E391:
      LDA     byte_BANKF_E0D5,X
      STA     PPUBuffer_301,Y
      INY
      INX
      DEC     byte_RAM_A
      BPL     loc_BANKF_E391

      LDA     #0
      STA     PPUBuffer_301,Y

CharacterSelectMenuLoop:
      JSR     WaitForNMI_TurnOnPPU

      LDA     Player1JoypadPress
      AND     #ControllerInput_A
      BNE     loc_BANKF_E3AE

      JMP     loc_BANKF_E2E8

; ---------------------------------------------------------------------------

loc_BANKF_E3AE:
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffect1Queue
      LDX     CurrentWorld
      LDY     CurrentLevel
      JSR     sub_BANKF_E198

      LDA     #$40
      STA     byte_RAM_10
      JSR     WaitForNMI

      LDX     #$F
      LDA     CurrentCharacter
      TAY
      LDA     PlayerSelectSpriteIndexes,Y
      TAY

loc_BANKF_E3CC:
      LDA     PlayerSelectMarioSprites2,Y
      STA     SpriteDMAArea + $10,Y
      INY
      DEX
      BPL     loc_BANKF_E3CC

loc_BANKF_E3D6:
      JSR     WaitForNMI

      DEC     byte_RAM_10
      BPL     loc_BANKF_E3D6

      LDY     #$3F

loc_BANKF_E3DF:
      LDA     PlayerSelectMarioSprites1,Y
      STA     SpriteDMAArea + $10,Y
      DEY
      BPL     loc_BANKF_E3DF

      LDA     #$40
      STA     byte_RAM_10

loc_BANKF_E3EC:
      JSR     WaitForNMI

      DEC     byte_RAM_10
      BPL     loc_BANKF_E3EC

      LDA     #Music2_StopMusic
      STA     MusicQueue2
      RTS

; End of function DoCharacterSelectMenu

; ---------------------------------------------------------------------------

StartGame:
      LDA     #0				  ; This starts	the game once RESET has	done its thing.
						  ; We also come here after choosing "RETRY"
						  ; from the game over menu
      STA     PPUMASK
      JSR     DisableNMI

      LDA     #PRGBank_0_1
      STA     byte_RAM_6F3
      JSR     ChangeMappedPRGBank

      JSR     TitleScreen			  ; The	whole title screen is a	subroutine, lol

      INC     byte_RAM_6F3
      LDA     #2				  ; Give the player 2 continues	once they start
      STA     Continues

ContinueGame:
      LDA     #3				  ; We return here after picking "CONTINUE"
						  ; from the game over menu
      STA     ExtraLives			  ; You	get 3 extra lives to start. Generous as	always

StartCharacterSelectMenu:
      LDX     CurrentWorld
      LDY     WorldStartingLevel,X
      STY     CurrentLevel
      STY     byte_RAM_4E7
      JSR     DoCharacterSelectMenu		  ; Does Character Select menu stuff

      JSR     InitializeSomeLevelStuff		  ; Initializes	some level stuff

      JSR     DisplayLevelTitleCardAndMore	  ; Displays title card	for the	stage,
						  ; and	seems to load the proper graphics
						  ; and	reset some variables

      LDA     #$FF
      STA     byte_RAM_545
      BNE     loc_BANKF_E43B			  ; Branch always?

loc_BANKF_E435:
      JSR     DoCharacterSelectMenu

loc_BANKF_E438:
      JSR     DisplayLevelTitleCardAndMore

loc_BANKF_E43B:
      JSR     WaitForNMI_TurnOffPPU

      LDA     #$B0
      ORA     byte_RAM_C9
      LDY     IsHorizontalLevel
      BNE     loc_BANKF_E44A

      AND     #$FE
      ORA     byte_RAM_C8

loc_BANKF_E44A:
      STA     PPUCtrlMirror
      STA     PPUCTRL
      LDA     #$80
      STA     StackArea
      LDA     #PRGBank_8_9
      JSR     ChangeMappedPRGBank

      JSR     GetLevelPointers

      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK6_9567

      JSR     sub_BANK6_93A4

      JSR     HideAllSprites

      JSR     WaitForNMI

      JSR     sub_BANKF_E1F4

      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIEnabled
      STA     PPUCtrlMirror
      LDA     IsHorizontalLevel
      BEQ     loc_BANKF_E4CC

loc_BANKF_E478:
      JSR     WaitForNMI

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_8500

      JSR     sub_BANKF_F6C0

      LDA     byte_RAM_13
      BEQ     loc_BANKF_E478

      LDA     #0
      STA     byte_RAM_13
      JSR     WaitForNMI_TurnOnPPU

loc_BANKF_E491:
      JSR     WaitForNMI

      LDA     byte_RAM_D8
      AND     #4
      BNE     loc_BANKF_E4A3

      LDA     Player1JoypadPress
      AND     #ControllerInput_Start
      BEQ     loc_BANKF_E4A3

      JMP     loc_BANKF_E515

; ---------------------------------------------------------------------------

loc_BANKF_E4A3:
      LDA     InSubspaceOrJar
      BEQ     loc_BANKF_E4AB

      JMP     loc_BANKF_E5A0

; ---------------------------------------------------------------------------

loc_BANKF_E4AB:
      JSR     HideAllSprites

      JSR     sub_BANKF_F11E

      LDY     GameMode
      BEQ     loc_BANKF_E4B9

      JMP     loc_BANKF_E665

; ---------------------------------------------------------------------------

loc_BANKF_E4B9:
      LDA     byte_RAM_627
      BEQ     loc_BANKF_E491

      JSR     sub_BANKF_F6A1

      JSR     sub_BANKF_F1AE

      LDA     #0
      STA     byte_RAM_627
      JMP     loc_BANKF_E43B

; ---------------------------------------------------------------------------

loc_BANKF_E4CC:
      JSR     WaitForNMI

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_8000

      JSR     sub_BANKF_F6C0

      LDA     byte_RAM_13
      BEQ     loc_BANKF_E4CC

      LDA     #0
      STA     byte_RAM_13
      JSR     WaitForNMI_TurnOnPPU

loc_BANKF_E4E5:
      JSR     WaitForNMI

      LDA     byte_RAM_D8
      AND     #4
      BNE     loc_BANKF_E4F4

      LDA     Player1JoypadPress
      AND     #ControllerInput_Start
      BNE     loc_BANKF_E515

loc_BANKF_E4F4:
      JSR     HideAllSprites			  ; Pause stuff

      JSR     sub_BANKF_F17E

      LDY     GameMode
      BEQ     loc_BANKF_E502

      JMP     loc_BANKF_E665

; ---------------------------------------------------------------------------

loc_BANKF_E502:
      LDA     byte_RAM_627
      BEQ     loc_BANKF_E4E5

      JSR     sub_BANKF_F6A1

      JSR     sub_BANKF_F1AE

      LDA     #0
      STA     byte_RAM_627
      JMP     loc_BANKF_E43B

; ---------------------------------------------------------------------------

loc_BANKF_E515:
      JSR     sub_BANKF_E9E5

      LDA     #$41
						  ; used when running sound queues
      STA     StackArea

loc_BANKF_E51D:
      LDA     #$E
      STA     byte_RAM_6

DoSuicideCheatCheck:
      JSR     WaitForNMI_TurnOnPPU

      LDA     PlayerState			  ; Check if the player	is already dying
      CMP     #PlayerState_Dying
      BEQ     loc_BANKF_E533			  ; If so, skip	the suicide code check

      LDA     Player2JoypadHeld			  ; Check for suicide code
      CMP     #ControllerInput_Up|ControllerInput_B|ControllerInput_A ;	Up + A + B
      BNE     loc_BANKF_E533			  ; Not	being held! Nothing to see here

      JSR     KillPlayer			  ; KILL THYSELF

loc_BANKF_E533:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Start
      BNE     loc_BANKF_E54B

      DEC     byte_RAM_6
      BPL     DoSuicideCheatCheck

      INC     byte_RAM_7
      LDA     byte_RAM_7
      AND     #1
      CLC
      ADC     #$D				  ; Will use either $D or $E from the update index pointers
      STA     ScreenUpdateIndex			  ; @TODO I assume this	is what	blinks "PAUSE"
      JMP     loc_BANKF_E51D

; ---------------------------------------------------------------------------

loc_BANKF_E54B:
      JSR     WaitForNMI_TurnOffPPU

      JSR     sub_BANKF_FE16

      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK6_93A4

      JSR     WaitForNMI

      JSR     sub_BANKF_E1F4

      JSR     HideAllSprites

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_81D6

      LDA     IsHorizontalLevel
      BNE     loc_BANKF_E587

      LDA     #1
      JSR     sub_BANKF_FFA0

      JSR     sub_BANK0_81FE

loc_BANKF_E576:
      JSR     WaitForNMI

      JSR     sub_BANK0_823D

      LDA     byte_RAM_537
      BEQ     loc_BANKF_E576

      JSR     WaitForNMI_TurnOnPPU

      JMP     loc_BANKF_E4E5

; ---------------------------------------------------------------------------

loc_BANKF_E587:
      LDA     #0
      JSR     sub_BANKF_FFA0

      JSR     sub_BANK0_8785

loc_BANKF_E58F:
      JSR     WaitForNMI

      JSR     sub_BANK0_87AA

      LDA     byte_RAM_537
      BEQ     loc_BANKF_E58F

      JSR     WaitForNMI_TurnOnPPU

      JMP     loc_BANKF_E491

; ---------------------------------------------------------------------------

loc_BANKF_E5A0:
      JSR     ClearNametables

      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      LDA     #0
      STA     byte_RAM_622
      LDA     InSubspaceOrJar
      CMP     #2
      BEQ     loc_BANKF_E5D4

      LDA     #PRGBank_8_9
      JSR     ChangeMappedPRGBank

      JSR     GetJarPointers

      JSR     GetEnemyPointers

      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK6_94AD

      LDA     #Music1_Inside
      STA     Music1Queue
      LDA     #1
      STA     byte_RAM_545
      JMP     loc_BANKF_E5E1

; ---------------------------------------------------------------------------

loc_BANKF_E5D4:
      JSR     sub_BANK6_941D

      LDA     #Music1_Subspace
      STA     Music1Queue
      LDA     #4
      STA     byte_RAM_545

loc_BANKF_E5E1:
      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_870C

      JSR     EnableNMI

loc_BANKF_E5EC:
      JSR     WaitForNMI

      JSR     sub_BANK0_87AA

      LDA     byte_RAM_537
      BEQ     loc_BANKF_E5EC

      LDA     InSubspaceOrJar
      CMP     #2
      BEQ     loc_BANKF_E606

      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK6_93A4

loc_BANKF_E606:
      JSR     WaitForNMI_TurnOnPPU

loc_BANKF_E609:
      JSR     WaitForNMI

      JSR     HideAllSprites

      JSR     sub_BANKF_F0F9

      LDY     GameMode
      BEQ     loc_BANKF_E61A

      JMP     loc_BANKF_E665

; ---------------------------------------------------------------------------

loc_BANKF_E61A:
      LDA     InSubspaceOrJar
      BNE     loc_BANKF_E609

      LDA     byte_RAM_622
      BEQ     loc_BANKF_E627

      INC     SubspaceVisits

loc_BANKF_E627:
      LDA     CurrentLevelAreaCopy
      STA     CurrentLevelArea
      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK6_93A4

      JSR     WaitForNMI_TurnOffPPU

      JSR     HideAllSprites

      LDY     byte_RAM_544
      STY     byte_RAM_545
      LDA     StarInvincibilityTimer
      BNE     loc_BANKF_E64C

      LDA     LevelMusicIndexes,Y
      STA     Music1Queue

loc_BANKF_E64C:
      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_874C

loc_BANKF_E654:
      JSR     WaitForNMI

      JSR     sub_BANK0_87AA

      LDA     byte_RAM_537
      BEQ     loc_BANKF_E654

      JSR     WaitForNMI_TurnOnPPU

      JMP     loc_BANKF_E491

; ---------------------------------------------------------------------------

loc_BANKF_E665:
      JSR     sub_BANKF_F6DA

      LDY     GameMode
      LDA     #GameMode_InGame
      STA     GameMode
      STA     StarInvincibilityTimer
      STA     BigVeggiesPulled
      STA     CherryCount
      STA     StopwatchTimer
      DEY
      BNE     loc_BANKF_E69F

      STY     byte_RAM_6F6
      JSR     sub_BANKF_F1E1

      LDA     #$FF
      STA     byte_RAM_545
      LDA     #$25
      STA     byte_RAM_7180
      LDA     #$48
      STA     byte_RAM_7181
      LDA     #$15
      STA     byte_RAM_5BD
      JSR     sub_BANKF_E9F4

      JMP     loc_BANKF_E438

; ---------------------------------------------------------------------------

loc_BANKF_E69F:
      LDA     #PlayerHealth_2_HP
      STA     PlayerHealth
      LDA     #0
      STA     PlayerMaxHealth
      STA     KeyUsed
      STA     Mushroom1upPulled
      STA     Mushroom1Pulled
      STA     Mushroom2Pulled
      STA     SubspaceVisits
      STA     EnemiesKilledForHeart
      DEY
      BEQ     DoGameOverStuff

      JMP     loc_BANKF_E75A

; ---------------------------------------------------------------------------

DoGameOverStuff:
      STY     byte_RAM_6F6
      LDA     #Music2_GameOver
      STA     MusicQueue2
      JSR     WaitForNMI_TurnOffPPU

      JSR     ChangeTitleCardCHR

      JSR     ClearNametables

      JSR     SetBlackAndWhitePalette

      JSR     SetScrollXYTo0

      JSR     EnableNMI

      JSR     WaitForNMI_TurnOnPPU

      LDA     #ScreenUpdateBuffer_Text_Game_Over
      STA     ScreenUpdateIndex
      LDA     #$C0
      STA     byte_RAM_6

loc_BANKF_E6E6:
      JSR     WaitForNMI

      DEC     byte_RAM_6
      BNE     loc_BANKF_E6E6

      LDY     #$28

loc_BANKF_E6EF:
      LDA     Text_Continue,Y
      STA     PPUBuffer_67B,Y
      DEY
      BPL     loc_BANKF_E6EF

      LDA     #$FB
      STA     byte_RAM_68F
      LDA     Continues
      CLC
      ADC     #$D0
      STA     byte_RAM_67E
      LDA     #0
      STA     byte_RAM_8
      LDA     #6
      DEC     Continues
      BPL     loc_BANKF_E717

      LDA     #1
      STA     byte_RAM_8
      LDA     #ScreenUpdateBuffer_Text_Retry

loc_BANKF_E717:
      STA     ScreenUpdateIndex

loc_BANKF_E719:
      JSR     WaitForNMI

      LDA     Player1JoypadPress
      AND     #ControllerInput_Select
      BEQ     loc_BANKF_E747

      LDA     byte_RAM_8
      EOR     #1
      STA     byte_RAM_8
      LDY     Continues
      CPY     #$FF
      BNE     loc_BANKF_E733

      LDA     #1
      STA     byte_RAM_8

loc_BANKF_E733:
      ASL     A
      ASL     A
      TAY
      LDA     #$FB
      STA     byte_RAM_71AB
      STA     byte_RAM_71AF
      LDA     #$F6
      STA     byte_RAM_71AB,Y
      LDA     #ScreenUpdateBuffer_RAM_71a8
      STA     ScreenUpdateIndex

loc_BANKF_E747:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Start
      BEQ     loc_BANKF_E719

      LDA     byte_RAM_8
      BNE     GameOver_Retry

      STA     SlotMachineCoins
      JMP     ContinueGame

; ---------------------------------------------------------------------------

GameOver_Retry:
      JMP     StartGame

; ---------------------------------------------------------------------------

loc_BANKF_E75A:
      DEY
      BEQ     EndOfLevel

      LDY     CurrentWorld
      STY     byte_RAM_405
      LDA     WarpDestinations,Y
      STA     CurrentWorld
      TAY
      LDX     CurrentCharacter
      LDA     WorldStartingLevel,Y
      STA     CurrentLevel
      STA     byte_RAM_4E7
      INY
      TYA
      ORA     #$D0
      STA     byte_RAM_71A6
      JSR     WaitForNMI_TurnOffPPU

      JSR     SetScrollXYTo0

      JSR     ClearNametables

      JSR     SetBlackAndWhitePalette

      JSR     EnableNMI

      JSR     ChangeTitleCardCHR

      LDA     #ScreenUpdateBuffer_RAM_7194
      STA     ScreenUpdateIndex
      LDA     #Music2_SlotWarpFanfare
      STA     MusicQueue2
      JSR     sub_BANKF_E94A

      JSR     InitializeSomeLevelStuff

      JMP     loc_BANKF_E435

; ---------------------------------------------------------------------------

EndOfLevel:
      LDA     #Music2_StopMusic			  ; Stop music
      STA     MusicQueue2
      LDX     CurrentCharacter			  ; Increase the current character's
      INC     CharacterLevelsCompleted,X	  ; "contribution" counter
      LDA     CurrentLevel			  ; Check if we've just completed
      CMP     #$13				  ; the	final level
      BNE     EndOfLevelSlotMachine		  ; Jump to slots if not final level

      JMP     EndingSceneRoutine		  ; Otherwise, do ending

; ---------------------------------------------------------------------------

EndOfLevelSlotMachine:
      STY     byte_RAM_6F6
      JSR     WaitForNMI_TurnOffPPU

      JSR     ClearNametables

      JSR     LoadBonusChanceCHRBanks

      JSR     CopyUnusedCoinSpriteToSpriteArea

      LDA     #PRGBank_A_B
      JSR     ChangeMappedPRGBank

      JSR     CopyBonusChanceLayoutToRAM

      LDA     #ScreenUpdateBuffer_RAM_BonusChanceLayout
      STA     ScreenUpdateIndex
      LDA     #$40
      STA     StackArea
      JSR     EnableNMI

      JSR     WaitForNMI

      LDA     #$C0
      STA     StackArea
      JSR     DisableNMI

      JSR     sub_BANKF_EA33

      LDA     #Music2_SlotWarpFanfare
      STA     MusicQueue2
      LDA     SlotMachineCoins
      BNE     loc_BANKF_E7F2

      JMP     NoCoinsForSlotMachine

; ---------------------------------------------------------------------------

loc_BANKF_E7F2:
      LDA     #3
      STA     ObjectXLo+3
      STA     ObjectXLo+4
      STA     ObjectXLo+5
      JSR     WaitForNMI_TurnOnPPU

loc_BANKF_E7FD:
      LDA     SlotMachineCoins
      BNE     StartSlotMachine

loc_BANKF_E802:
      LDY     CurrentWorld
      LDA     WorldPlus1StartingLevel,Y
      SEC
      SBC     #1
      CMP     CurrentLevel
      BNE     loc_BANKF_E81E

      JSR     sub_BANKF_E1F4

      LDA     #$FF
      STA     byte_RAM_545
      INC     CurrentWorld
      JMP     StartCharacterSelectMenu

; ---------------------------------------------------------------------------

loc_BANKF_E81E:
      JSR     sub_BANKF_F6A1

      LDA     CurrentLevel
      LDY     #0

loc_BANKF_E826:
      INY
      CMP     WorldStartingLevel,Y
      BCS     loc_BANKF_E826

      DEY
      STY     CurrentWorld			  ; I am sure this is important	somehow, but...	why
      LDY     CurrentWorld
      LDA     CurrentLevel
      SEC
      SBC     WorldStartingLevel,Y
      STA     byte_RAM_629
      LDA     CurrentLevel
      STA     byte_RAM_4E7
      LDA     CurrentLevelArea
      STA     byte_RAM_4E8
      LDA     byte_RAM_533
      STA     byte_RAM_4E9
      LDY     #0
      STY     byte_RAM_4E6
      STY     byte_RAM_534
      STY     byte_RAM_4EA
      DEY
      STY     byte_RAM_545
      JSR     sub_BANKF_E1F4

      JMP     loc_BANKF_E435

; ---------------------------------------------------------------------------

StartSlotMachine:
      DEC     SlotMachineCoins
      JSR     WaitForNMI

      JSR     sub_BANKF_EA68

      LDA     #1				  ; Set	all reel timers
      STA     ObjectXLo
      STA     ObjectXLo+1
      STA     ObjectXLo+2
      LSR     A					  ; Set	all reels to the first position
      STA     ObjectXLo+6
      STA     ObjectXLo+7
      STA     ObjectXLo+8

DoSlotMachineSpinnyShit:
      JSR     WaitForNMI			  ; $2C-$2E: Reel change timer
						  ; $2F-$31: Current reel icon

      LDA     #SoundEffect2_Climbing		  ; Play "reel sound" sound effect
      STA     SoundEffectQueue2
      JSR     sub_BANKF_EAC2

      JSR     sub_BANKF_EADC

      JSR     sub_BANKF_EAF6

      JSR     sub_BANKF_E916

      LDA     byte_BANKF_E9DF,Y
      STA     ScreenUpdateIndex
      INC     byte_RAM_6
      LDA     ObjectXLo				  ; Reel 1 still active?
      ORA     ObjectXLo+1			  ; Reel 2 still active?
      ORA     ObjectXLo+2			  ; Reel 3 still active?
      BNE     DoSlotMachineSpinnyShit		  ; If any are still active, go	back to	waiting

      LDA     #ScreenUpdateBuffer_RAM_6df
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

      LDY     #0
      LDX     ObjectXLo+6			  ; Load reel 1
      LDA     SlotMachineReelOrder1RAM,X
      BNE     CheckReel2Symbol			  ; Is this reel a cherry?

      INY					  ; Yes; add one life

CheckReel2Symbol:
      LDX     ObjectXLo+7			  ; Load reel 2
      CMP     SlotMachineReelOrder2RAM,X
      BNE     AddSlotMachineExtraLives		  ; Does this match the	previous symbol?

      CMP     #0				  ; Yes; are they both cherries?
      BNE     CheckReel3Symbol			  ; If no, skip	to third reel

      INY					  ; They are both cherries, add	another	life or	something

CheckReel3Symbol:
      LDX     ObjectXLo+8			  ; Load reel 3
      CMP     SlotMachineReelOrder3RAM,X	  ; Does reel 3	match the previous two?
      BNE     AddSlotMachineExtraLives		  ; No,	fuck you

      INY					  ; They all match! Yay! Add a life.
						  ; Cherry count: 3 / Non-cherry: 1
      CMP     #0				  ; Were they all cherries?
      BNE     AddSlotMachineExtraLives		  ; Nope, all done

      INY					  ; Yes, add 2 more extra lives
      INY

AddSlotMachineExtraLives:
      TYA					  ; Y contains extra lives to add
      CLC
      ADC     ExtraLives			  ; Add	won extra lives	to current lives
      BCC     loc_BANKF_E8D3			  ; Check if adding extra lives	has wrapped the	counter

      LDA     #$FF				  ; If so, set extra lives to 255 (#$FF)

loc_BANKF_E8D3:
      STA     ExtraLives
      TYA					  ; Did	we actually win	any lives?
      BEQ     SlotMachineLoseFanfare		  ; No,	play lose sound	effect

      ORA     #$D0
      STA     byte_RAM_6C8
      LDA     #Music2_CrystalGetFanfare		  ; Play winner	jingle
      STA     MusicQueue2
      LDA     #$A0
      STA     byte_RAM_6
      JSR     WaitForNMI

      JSR     sub_BANKF_EA68

loc_BANKF_E8ED:
      JSR     WaitForNMI

      JSR     sub_BANKF_E916

      LDA     byte_BANKF_E9E3,Y
      STA     ScreenUpdateIndex
      DEC     byte_RAM_6
      BNE     loc_BANKF_E8ED

      BEQ     loc_BANKF_E90C

SlotMachineLoseFanfare:
      LDA     #Music2_DeathJingle
      STA     MusicQueue2
      JSR     WaitForNMI

      JSR     sub_BANKF_EA68

      JSR     sub_BANKF_E94A

loc_BANKF_E90C:
      LDA     #ScreenUpdateBuffer_RAM_6e4
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

      JMP     loc_BANKF_E7FD

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_E916:
      LDA     byte_RAM_6
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      AND     #1
      TAY
      RTS

; End of function sub_BANKF_E916

; ---------------------------------------------------------------------------

NoCoinsForSlotMachine:
      JSR     sub_BANKF_E946

      LDA     #Music2_DeathJingle
      STA     MusicQueue2
      STA     byte_RAM_6

loc_BANKF_E92A:
      LDA     byte_RAM_6
      AND     #1
      TAY
      LDA     byte_BANKF_E9E1,Y
      STA     ScreenUpdateIndex
      LDA     #$A
      STA     byte_RAM_7

loc_BANKF_E938:
      JSR     WaitForNMI_TurnOnPPU

      DEC     byte_RAM_7
      BNE     loc_BANKF_E938

      DEC     byte_RAM_6
      BPL     loc_BANKF_E92A

      JMP     loc_BANKF_E802

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_E946:
      LDA     #$50
      BNE     loc_BANKF_E94C

; End of function sub_BANKF_E946

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_E94A:
      LDA     #$A0

loc_BANKF_E94C:
      STA     byte_RAM_7

loc_BANKF_E94E:
      JSR     WaitForNMI_TurnOnPPU

      DEC     byte_RAM_7
      BNE     loc_BANKF_E94E

      RTS

; End of function sub_BANKF_E94A

; ---------------------------------------------------------------------------

EndingSceneRoutine:
      JSR     SetScrollXYTo0

      LDA     #$80
      STA     byte_RAM_4080			  ; FDS	leftover; $4080	is an old sound	register
						  ; The	prototype had two writes to this address!
						  ; It looks like they missed this one,	though.
      ASL     A
      STA     byte_RAM_607
      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK1_A43B

      JSR     WaitForNMI_TurnOffPPU

      JSR     DisableNMI

      JSR     LoadCelebrationSceneBackgroundCHR

      JSR     EnableNMI

      JSR     WaitForNMI

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      INC     byte_RAM_6F3
      JSR     sub_BANK1_AA79

      JSR     WaitForNMI_TurnOffPPU

      JSR     DisableNMI

      JSR     LoadMarioSleepingCHRBanks

      JSR     EnableNMI

      JSR     WaitForNMI

      LDA     #PRGBank_C_D
      JSR     ChangeMappedPRGBank

      INC     byte_RAM_6F3
      JMP     MarioSleepingScene

; =============== S U B	R O U T	I N E =======================================

DisableNMI:
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIDisabled
      STA     PPUCTRL
      STA     PPUCtrlMirror
      RTS

; End of function DisableNMI

; ---------------------------------------------------------------------------
PPUBuffer_Text_Game_Over:
	  .BYTE $21, $CB, $A, $E0, $DA, $E6, $DE, $FB, $FB, $E8,	$EF, $DE
      .BYTE $EB, 0				  ; $C ; "GAME	OVER"
Text_Continue:
	  .BYTE $21, $75, 1, 0			  ; (Placeholder for continue count)
						  ; This is loaded manually and	drawn so the count
						  ; can	be patched in
						  ; * CONTINUE
      .BYTE $21, $6A, $A, $F6, $FB, $DC, $E8, $E7, $ED,	$E2, $E7, $EE
      .BYTE $DE					  ; $C
PPUBuffer_Text_Retry:
	  .BYTE $21,	$AA, 7,	$F6, $FB, $EB, $DE, $ED, $EB, $F2; * RETRY
      .BYTE $21, $CB, $A, $FB, $FB, $FB, $FB, $FB, $FB,	$FB, $FB, $FB; Blank, erases "GAME	OVER"
      .BYTE $FB, 0				  ; $C
      .BYTE   9
      .BYTE  $F
byte_BANKF_E9DF:
	  .BYTE ScreenUpdateBuffer_RAM_6ab
      .BYTE ScreenUpdateBuffer_RAM_6df
byte_BANKF_E9E1:
	  .BYTE ScreenUpdateBuffer_RAM_693

      .BYTE ScreenUpdateBuffer_RAM_6da
byte_BANKF_E9E3:
	  .BYTE ScreenUpdateBuffer_RAM_6bd
      .BYTE ScreenUpdateBuffer_RAM_6da

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_E9E5:
      LDA     #$16
      STA     byte_RAM_5BD
      LDA     #$26
      STA     byte_RAM_7180
      LDA     #$C8
      STA     byte_RAM_7181

; End of function sub_BANKF_E9E5

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_E9F4:
      JSR     WaitForNMI_TurnOffPPU

      JSR     ChangeTitleCardCHR

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_81A2

      LDY     #$23

loc_BANKF_EA04:
      LDA     TitleCardPalettes,Y
      STA     PPUBuffer_55F,Y
      DEY
      BPL     loc_BANKF_EA04

      JSR     sub_BANKF_E166

      JSR     sub_BANKF_E17F

      LDX     CurrentWorld
      LDY     CurrentLevel
      JSR     sub_BANKF_E198

      LDA     #$FF
      STA     PPUScrollXMirror
      JSR     WaitForNMI

      LDA     byte_RAM_5BD
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

; End of function sub_BANKF_E9F4

; =============== S U B	R O U T	I N E =======================================

EnableNMI:
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      RTS

; End of function EnableNMI

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_EA33:
      JSR     SetScrollXYTo0

      LDA     PPUSTATUS
      LDY     #0
      LDA     #$3F
      STA     PPUADDR
      STY     PPUADDR

loc_BANKF_EA43:
      LDA     unk_RAM_59C,Y
      STA     PPUDATA
      INY
      CPY     #$10
      BCC     loc_BANKF_EA43

      LDY     #0
      LDA     PPUSTATUS
      LDA     #$3F
      STA     PPUADDR
      LDA     #$10
      STA     PPUADDR

SetBonusChancePalette:
      LDA     BonusChanceSpritePalettes,Y
      STA     PPUDATA
      INY
      CPY     #$10
      BCC     SetBonusChancePalette

; End of function sub_BANKF_EA33

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_EA68:
      LDY     ExtraLives
      DEY
      TYA
      JSR     sub_BANKF_EA8E

      STY     byte_RAM_599
      STA     byte_RAM_59A
      LDA     SlotMachineCoins
      CLC
      ADC     #$D0
      STA     byte_RAM_588
      LDA     #1
      STA     ScreenUpdateIndex
      LDA     #$40
      STA     StackArea
      JSR     EnableNMI

      JMP     WaitForNMI

; End of function sub_BANKF_EA68

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_EA8E:
      LDY     #$D0

loc_BANKF_EA90:
      CMP     #$A
      BCC     loc_BANKF_EA9A

      SBC     #$A
      INY
      JMP     loc_BANKF_EA90

; ---------------------------------------------------------------------------

loc_BANKF_EA9A:
      ORA     #$D0
      CPY     #$D0
      BNE     locret_BANKF_EAA2

      LDY     #$FB

locret_BANKF_EAA2:
      RTS

; End of function sub_BANKF_EA8E

; =============== S U B	R O U T	I N E =======================================

WaitForNMI_TurnOffPPU:
      LDA     #0
      BEQ     _WaitForNMI_StuffPPUMask		  ; Branch always

; End of function WaitForNMI_TurnOffPPU

; =============== S U B	R O U T	I N E =======================================

WaitForNMI_TurnOnPPU:
      LDA     #PPUMask_ShowLeft8Pixels_BG|PPUMask_ShowLeft8Pixels_SPR|PPUMask_ShowBackground|PPUMask_ShowSprites

_WaitForNMI_StuffPPUMask:
      STA     PPUMaskMirror

; End of function WaitForNMI_TurnOnPPU

; =============== S U B	R O U T	I N E =======================================

WaitForNMI:
      LDA     ScreenUpdateIndex
      ASL     A
      TAX
      LDA     ScreenUpdateBufferPointers,X
      STA     RAM_PPUDataBufferPointer
      LDA     ScreenUpdateBufferPointers+1,X
      STA     RAM_PPUDataBufferPointer+1
      LDA     #0
      STA     NMIWaitFlag			  ; Start waiting for NMI to finish

WaitForNMILoop:
      LDA     NMIWaitFlag			  ; Has	the NMI	routine	set the	flag yet?
      BPL     WaitForNMILoop			  ; If no, wait	some more

      RTS					  ; If yes, go back to what we were doing

; End of function WaitForNMI

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_EAC2:
      LDA     Player1JoypadPress
      BPL     locret_BANKF_EAD1

      LDX     #0

loc_BANKF_EAC8:
      LDA     ObjectXLo,X
      BNE     loc_BANKF_EAD2

      INX
      CPX     #3
      BCC     loc_BANKF_EAC8

locret_BANKF_EAD1:
      RTS

; ---------------------------------------------------------------------------

loc_BANKF_EAD2:
      LDA     #0
      STA     ObjectXLo,X
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffect1Queue
      RTS

; End of function sub_BANKF_EAC2

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_EADC:
      LDX     #2

loc_BANKF_EADE:
      LDA     ObjectXLo,X
      BEQ     loc_BANKF_EAF2

      DEC     ObjectXLo+3,X
      BNE     loc_BANKF_EAF2

      LDA     #4
      STA     ObjectXLo+3,X
      DEC     ObjectXLo+6,X
      BPL     loc_BANKF_EAF2

      LDA     #7
      STA     ObjectXLo+6,X

loc_BANKF_EAF2:
      DEX
      BPL     loc_BANKF_EADE

      RTS

; End of function sub_BANKF_EADC

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_EAF6:
      LDA     #2
      STA     byte_RAM_0

loc_BANKF_EAFA:
      LDA     byte_RAM_0
      TAY
      ASL     A
      ASL     A
      ASL     A
      TAX
      ADC     ObjectXLo+6,Y
      TAY
      LDA     SlotMachineReelOrder1RAM,Y
      TAY
      LDA     #7
      STA     byte_RAM_1

loc_BANKF_EB0D:
      LDA     BonusChanceCherrySprite,Y
      STA     SpriteDMAArea + $10,X
      INX
      INY
      DEC     byte_RAM_1
      BPL     loc_BANKF_EB0D

      DEC     byte_RAM_0
      BPL     loc_BANKF_EAFA

      LDX     #$17

loc_BANKF_EB1F:
      TXA
      AND     #$18
      ASL     A
      ASL     A
      ADC     SpriteDMAArea + $10,X
      STA     SpriteDMAArea + $10,X
      DEX
      DEX
      DEX
      DEX
      BPL     loc_BANKF_EB1F

      RTS

; End of function sub_BANKF_EAF6

; =============== S U B	R O U T	I N E =======================================

CopyUnusedCoinSpriteToSpriteArea:
      LDY     #0				  ; This copies	the unused coin	sprite from memory
						  ; into the sprite DMA	area at	$200

loc_BANKF_EB33:
      LDA     unk_RAM_653,Y			  ; Copy two sprites from memory to memory.
      STA     SpriteDMAArea + $28,Y			  ; This is definitely efficient.
      INY					  ; Two	sprites	for each half of the coin.
      CPY     #8				  ; Four bytes per sprite * 2 sprites =	8 bytes
      BCC     loc_BANKF_EB33

      RTS

; End of function CopyUnusedCoinSpriteToSpriteArea

; ---------------------------------------------------------------------------

loc_BANKF_EB3F:
      LDA     #0
      STA     OAMADDR
      LDA     #2
      STA     OAM_DMA
      JSR     sub_BANKF_FF73

      LDA     PPUMaskMirror
      STA     PPUMASK
      JSR     DoSoundProcessing

      LDA     PPUCtrlMirror
      STA     PPUCTRL
      DEC     NMIWaitFlag
      JMP     loc_BANKF_EC61

; ---------------------------------------------------------------------------

loc_BANKF_EB5E:
      LDA     #0
      STA     PPUMASK
      STA     OAMADDR
      LDA     #2
      STA     OAM_DMA
      JSR     sub_BANKF_FF73

      JSR     UpdatePPUFromBufferWithOptions

      JSR     sub_BANKF_EC68

      LDA     PPUScrollXMirror
      STA     PPUSCROLL
      LDA     #0
      STA     PPUSCROLL
      LDA     PPUMaskMirror
      STA     PPUMASK
      JMP     loc_BANKF_EC4B

; ---------------------------------------------------------------------------

loc_BANKF_EB86:
      LDA     PPUMaskMirror
      STA     PPUMASK
      JMP     loc_BANKF_EC5E

; =============== S U B	R O U T	I N E =======================================

      ;	public NMI
NMI:
      PHP
      PHA
      TXA
      PHA
      TYA
      PHA
      BIT     StackArea
      BPL     loc_BANKF_EB5E

      BVC     loc_BANKF_EB3F

      LDA     #0
      STA     PPUMASK
      STA     OAMADDR
      LDA     #2
      STA     OAM_DMA
      JSR     sub_BANKF_FF73

      LDA     NMIWaitFlag
      BNE     loc_BANKF_EB86

      LDA     IsHorizontalLevel
      BEQ     loc_BANKF_EC1F

      LDA     byte_RAM_51C
      BEQ     loc_BANKF_EBE8

      LDA     #0
      STA     byte_RAM_51C
      LDX     #$1E
      LDY     #0
      LDA     PPUSTATUS
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementVertical|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIEnabled
      STA     PPUCTRL

loc_BANKF_EBC9:
IFDEF _COMPATIBILITY_
	  .db $ad, $d1, $00 ; LDA $00D1
ENDIF
IFNDEF _COMPATIBILITY_
      LDA     byte_RAM_D1			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF

      STA     PPUADDR
IFDEF _COMPATIBILITY_
	  .db $ad, $d2, $00 ; LDA $00D2
ENDIF
IFNDEF _COMPATIBILITY_
      LDA     byte_RAM_D2			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF

      STA     PPUADDR

loc_BANKF_EBD5:
      LDA     unk_RAM_380,Y
      STA     PPUDATA
      INY
      DEX
      BNE     loc_BANKF_EBD5

      LDX     #$1E
IFDEF _COMPATIBILITY_
	  .db $ee, $d2, $00 ; INC $00D2
ENDIF
IFNDEF _COMPATIBILITY_
      INC     byte_RAM_D2			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF

      CPY     #$3C
      BNE     loc_BANKF_EBC9

loc_BANKF_EBE8:
      LDA     byte_RAM_3BC
      BEQ     loc_BANKF_EC1F

      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementVertical|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIEnabled
      STA     PPUCTRL
      LDY     #0
      LDX     #4

loc_BANKF_EBF6:
      LDA     PPUSTATUS
      LDA     byte_RAM_3BC
      STA     PPUADDR
      LDA     byte_RAM_3BD
      STA     PPUADDR

loc_BANKF_EC05:
      LDA     unk_RAM_3BE,Y
      STA     PPUDATA
      INY
      TYA
      LSR     A
      BCS     loc_BANKF_EC05

      LDA     byte_RAM_3BD
      CLC
      ADC     #8
      STA     byte_RAM_3BD
      DEX
      BNE     loc_BANKF_EBF6

      STX     byte_RAM_3BC

loc_BANKF_EC1F:
      JSR     UpdatePPUFromBufferNMI

      JSR     sub_BANKF_EC68

      LDA     #$B0
      ORA     byte_RAM_C9
      LDY     IsHorizontalLevel
      BNE     loc_BANKF_EC31

      AND     #$FE
      ORA     byte_RAM_C8

loc_BANKF_EC31:
      STA     PPUCTRL
      STA     PPUCtrlMirror
      LDA     PPUScrollXMirror
      STA     PPUSCROLL
      LDA     PPUScrollYMirror
      CLC
      ADC     byte_RAM_4C5
      STA     PPUSCROLL
      LDA     PPUMaskMirror
      STA     PPUMASK
      INC     byte_RAM_10

loc_BANKF_EC4B:
      LDA     ScreenUpdateIndex
      BNE     loc_BANKF_EC55

      STA     byte_RAM_300
      STA     PPUBuffer_301

loc_BANKF_EC55:
      LDA     #0
      STA     ScreenUpdateIndex
      JSR     sub_BANKF_F661

      DEC     NMIWaitFlag

loc_BANKF_EC5E:
      JSR     DoSoundProcessing

loc_BANKF_EC61:
      PLA
      TAY
      PLA
      TAX
      PLA
      PLP
      RTI

; End of function NMI

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_EC68:
      LDA     PPUSTATUS
      LDA     #$3F
      STA     PPUADDR
      LDA     #0
      STA     PPUADDR
      STA     PPUADDR
      STA     PPUADDR
      RTS

; End of function sub_BANKF_EC68

; =============== S U B	R O U T	I N E =======================================

DoSoundProcessing:
      LDA     #2
      JSR     ChangeMappedPRGBankWithoutSaving

      JSR     StartProcessingSoundQueue

      LDA     MMC3PRGBankTemp
      JMP     ChangeMappedPRGBank

; End of function DoSoundProcessing

; =============== S U B	R O U T	I N E =======================================

ClearNametables:
      LDA     #0
      STA     PPUMaskMirror
      STA     PPUMASK
      LDA     #$20
      JSR     ClearNametableChunk

      LDA     #$24
      JSR     ClearNametableChunk

      LDA     #$28
      JSR     ClearNametableChunk

; End of function ClearNametables

; =============== S U B	R O U T	I N E =======================================

HideAllSprites:
      LDY     #0
      LDA     #$F8

HideAllSpritesLoop:
      STA     SpriteDMAArea,Y
      DEY
      DEY
      DEY
      DEY
      BNE     HideAllSpritesLoop

      RTS

; End of function HideAllSprites

; =============== S U B	R O U T	I N E =======================================

ClearNametableChunk:
      LDY     PPUSTATUS				  ; Reset PPU address latch
      LDY     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIDisabled
      STY     PPUCTRL				  ; Turn off NMI
      STY     PPUCtrlMirror
      LDY     #0
      STA     PPUADDR				  ; A will contain the high byte of the	PPU address
						  ; (generally $20, $24, $28)
      STY     PPUADDR				  ; And	Y has the low byte ($00)
      LDX     #3				  ; Do $300 bytes for this loop.
      LDA     #$FB

ClearNametableChunk_Loop:
      STA     PPUDATA				  ; Store the blank tile $300 times
      INY
      BNE     ClearNametableChunk_Loop		  ; (Loop falls	through	every $100 bytes)

      DEX
      BNE     ClearNametableChunk_Loop		  ; Loop falls through after $300 bytes

ClearNametableChunk_Loop2:
      STA     PPUDATA				  ; Do another loop of $C0 bytes to clear the
						  ; rest of the	nametable chunk
      INY
      CPY     #$C0
      BNE     ClearNametableChunk_Loop2

      LDA     #0				  ; Load A with	$00 for	clearing the attribute tables

ClearNametableChunk_AttributeTableLoop:
      STA     PPUDATA				  ; Clear attribute table...
      INY					  ; Y was $C0 on entry,	so write $40 bytes...
      BNE     ClearNametableChunk_AttributeTableLoop

PPUBufferUpdatesComplete:
      RTS					  ; Woo	fucking	hoo

; End of function ClearNametableChunk

; =============== S U B	R O U T	I N E =======================================

; Used to update the PPU nametable / palette data during NMI.
;
; This function	can only handle	$100 bytes of data
; (actually less).
;
; Unlike UpdatePPUFromBuffer, this one does not	support
; $80 or $40 as	options, instead treating them as direct length.
; It also does not increment the buffer	pointer, only using Y
; to read further data.
;
; If Y overflows, it will resume copying again from the	beginning,
; and can get into an infinite loop if it doesn't encounter
; a terminating	$00. Welp!

UpdatePPUFromBufferNMI:
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIEnabled
      STA     PPUCTRL
      LDY     #0

UpdatePPUFromBufferNMI_CheckForBuffer:
      LDA     (RAM_PPUDataBufferPointer),Y
      BEQ     PPUBufferUpdatesComplete

      LDX     PPUSTATUS
      STA     PPUADDR
      INY
      LDA     (RAM_PPUDataBufferPointer),Y
      STA     PPUADDR
      INY
      LDA     (RAM_PPUDataBufferPointer),Y
      TAX

UpdatePPUFromBufferNMI_CopyLoop:
      INY
      LDA     (RAM_PPUDataBufferPointer),Y
      STA     PPUDATA
      DEX
      BNE     UpdatePPUFromBufferNMI_CopyLoop

      INY
      JMP     UpdatePPUFromBufferNMI_CheckForBuffer

; End of function UpdatePPUFromBufferNMI

; =============== S U B	R O U T	I N E =======================================

; This reads from $F0/$F1 to determine where a "buffer"	is.
; Basically, a buffer is like this:
;
; PPUADDR  LEN	DATA ......
; $20 $04  $03	$E9 $F0	$FB
; $25 $5F  $4F	$FB
; $21 $82  $84	$00 $01	$02 $03
; $00
;
; PPUADDR is two bytes (hi,lo) for the address to send to PPUADDR.
; LEN is the length, with the following	two bitmasks:
;  - $80: Set the "draw	vertically" option
;  - $40: Use ONE tile instead of a string
; DATA is either (LEN) bytes or	one byte.
;
; After	(LEN) bytes have been written, the buffer pointer
; is incremented to (LEN+2) and	the function restarts.
; A byte of $00	terminates execution and returns.
;
; There	is a similar function, UpdatePPUFromBufferNMI,
; that is called during	NMI, but unlike	this one,
; that one does	NOT use	bitmasks, nor increment	the pointer.
;

UpdatePPUFromBufferWithOptions:
      LDY     #0				  ; First, check if we have anything
						  ; to send to the PPU
      LDA     (RAM_PPUDataBufferPointer),Y
      BEQ     PPUBufferUpdatesComplete		  ; If the first byte at the buffer address
						  ; is #$00, we	have nothing. We're done here

      LDX     PPUSTATUS				  ; Clear address latch
      STA     PPUADDR				  ; Set	the PPU	address	to the
						  ; address from the PPU buffer
      INY
      LDA     (RAM_PPUDataBufferPointer),Y
      STA     PPUADDR
      INY
      LDA     (RAM_PPUDataBufferPointer),Y	  ; Data segment length	byte...
      ASL     A
      PHA
      LDA     PPUCtrlMirror			  ; Enable NMI + Vertical increment
						  ; + whatever else was	already	set...
      ORA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementVertical|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable0000|PPUCtrl_SpriteSize8x8|PPUControl_NMIEnabled
      BCS     UpdatePPUFBWO_EnableVerticalIncrement ; ...but only if $80 was set in the	length byte.
						  ; Otherwise, turn vertical incrementing back off

      AND     #PPUCtrl_BaseAddr2C00|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable1000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIEnabled|$40

UpdatePPUFBWO_EnableVerticalIncrement:
      STA     PPUCTRL
      PLA
      ASL     A					  ; Check if the second	bit ($40) in the length
						  ; has	been set
      BCC     UpdatePPUFBWO_CopyStringOfTiles	  ; If not, we are copying a string of data

      ORA     #2				  ; Length (A) is now (A << 2).
						  ; OR in #$02 now if we are copying a single tile;
						  ; This will be rotated out into register C momentarily
      INY

UpdatePPUFBWO_CopyStringOfTiles:
      LSR     A					  ; Restore the	data length.
						  ; A =	(Length	& #$3F)
						  ;
						  ; This moves the second bit (used above to signal
						  ; "one tile mode") into the Carry register
      LSR     A
      TAX					  ; Copy the length into register X

UpdatePPUFBWO_CopyLoop:
      BCS     UpdatePPUFBWO_CopySingleTileSkip	  ; If Carry is	set (from above),
						  ; we're only copying one tile.
						  ; Do not increment Y to advance copying index

      INY

UpdatePPUFBWO_CopySingleTileSkip:
      LDA     (RAM_PPUDataBufferPointer),Y	  ; Load data from buffer...
      STA     PPUDATA				  ; ...store it	to the PPU.
      DEX					  ; Decrease remaining length.
      BNE     UpdatePPUFBWO_CopyLoop		  ; Are	we done? If no,	copy more stuff

      INY					  ; Y contains the amount of copied data now
      TYA					  ; ...and now A does
      CLC					  ; Clear carry	bit (from earlier)
      ADC     RAM_PPUDataBufferPointer		  ; Add	the length to the PPU data buffer
      STA     RAM_PPUDataBufferPointer
      LDA     RAM_PPUDataBufferPointer+1
      ADC     #0				  ; If the length overflowed (carry set),
						  ; add	that to	the hi byte of the pointer
      STA     RAM_PPUDataBufferPointer+1
      JMP     UpdatePPUFromBufferWithOptions	  ; Start the cycle over again.
						  ; (If	the PPU	buffer points to a 0,
						  ;  it	will terminate after this jump)

; End of function UpdatePPUFromBufferWithOptions

; ---------------------------------------------------------------------------
; [000002B3 BYTES: BEGIN OF AREA UNUSED-BANKF:ED4D. PRESS KEYPAD "-" TO	COLLAPSE]
_unused_BANKF_ED4D:
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
      .BYTE $FF, $FF, $FF			  ; $2B0
; [000002B3 BYTES: END OF AREA UNUSED-BANKF:ED4D. PRESS	KEYPAD "-" TO COLLAPSE]
byte_BANKF_F000:
	  .BYTE 0

      .BYTE 8
      .BYTE $10
      .BYTE $18
      .BYTE $20
      .BYTE $24
byte_BANKF_F006:
	  .BYTE $28

      .BYTE $2A
      .BYTE $29
      .BYTE $2B
byte_BANKF_F00A:
	  .BYTE $2C

byte_BANKF_F00B:
	  .BYTE $2E

      .BYTE $30
      .BYTE $34
      .BYTE $38	; 8
      .BYTE $3C
      .BYTE $40
byte_BANKF_F011:
	  .BYTE 6

      .BYTE 9
      .BYTE 6
      .BYTE 9
      .BYTE 1
      .BYTE 1
      .BYTE $E
      .BYTE $E
      .BYTE 6
      .BYTE 9
      .BYTE 6
      .BYTE 9
      .BYTE 1
      .BYTE 1
      .BYTE $E
      .BYTE $E
      .BYTE 6
      .BYTE 9
      .BYTE 6
      .BYTE 9
      .BYTE 1
      .BYTE 1
      .BYTE $E
      .BYTE $E
      .BYTE 6
      .BYTE 9
      .BYTE 6
      .BYTE 9
      .BYTE 1
      .BYTE 1
      .BYTE $E
      .BYTE $E
      .BYTE 8
      .BYTE 8
      .BYTE 0
      .BYTE $F
      .BYTE 8
      .BYTE 8
      .BYTE 3
      .BYTE $C
      .BYTE $F8
      .BYTE $18
      .BYTE $F8
      .BYTE $18
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE 3
      .BYTE $C
      .BYTE 3
      .BYTE 3
      .BYTE 2
      .BYTE 5
      .BYTE   8
      .BYTE   8
      .BYTE   3
      .BYTE  $C
      .BYTE 8
      .BYTE 8
      .BYTE $FF
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE   2
      .BYTE $1E
byte_BANKF_F055:
	  .BYTE 7

      .BYTE 7
      .BYTE $20
      .BYTE $20
      .BYTE $D
      .BYTE $1C
      .BYTE $D
      .BYTE $1C
      .BYTE $FF
      .BYTE $FF
      .BYTE $20
      .BYTE $20
      .BYTE 4
      .BYTE $1C
      .BYTE 4
      .BYTE $1C
      .BYTE $F
      .BYTE $F
      .BYTE $20
      .BYTE $20
      .BYTE $1C
      .BYTE $1C
      .BYTE $1C
      .BYTE $1C
      .BYTE 7
      .BYTE 7
      .BYTE $20
      .BYTE $20
      .BYTE $D
      .BYTE $1C
      .BYTE $D
      .BYTE $1C
      .BYTE 0
      .BYTE $10
      .BYTE 9
      .BYTE 9
      .BYTE 3
      .BYTE $10
      .BYTE 9
      .BYTE 9
      .BYTE $FF
      .BYTE $FF
      .BYTE $F
      .BYTE $F
      .BYTE $C
      .BYTE $14
      .BYTE 7
      .BYTE $20
      .BYTE $FE
      .BYTE $20
      .BYTE $10
      .BYTE $10
      .BYTE 9
      .BYTE $A
      .BYTE 8
      .BYTE 8
      .BYTE   3
      .BYTE $30	
      .BYTE $18
      .BYTE $18
      .BYTE $FF
      .BYTE $10
      .BYTE 8
      .BYTE 8
      .BYTE 9
      .BYTE $A
      .BYTE   8
      .BYTE 8
byte_BANKF_F099:
	  .BYTE 2

      .BYTE 2
      .BYTE 3
      .BYTE 0
      .BYTE 3
      .BYTE 3
      .BYTE $F8
      .BYTE 0
      .BYTE 3
      .BYTE 1
      .BYTE $F3
      .BYTE 4
      .BYTE 3
      .BYTE 3
      .BYTE 3
      .BYTE $F2
      .BYTE 3
      .BYTE 3
      .BYTE 5
      .BYTE 3
      .BYTE $B
      .BYTE $10
      .BYTE 3
      .BYTE 0
      .BYTE 3
      .BYTE 3
      .BYTE $F8
      .BYTE 0
      .BYTE 9
      .BYTE 4
      .BYTE 3
      .BYTE 3
      .BYTE $E
      .BYTE 3
      .BYTE 3
      .BYTE 3
      .BYTE $F6
      .BYTE $C
      .BYTE 2
      .BYTE 3
      .BYTE $B
      .BYTE $B
      .BYTE 9
      .BYTE $10
      .BYTE 9
      .BYTE $19
      .BYTE $20
      .BYTE $20
      .BYTE 3
      .BYTE $1E
      .BYTE $19
      .BYTE 8
      .BYTE 9
      .BYTE 9
      .BYTE 9
      .BYTE $18
      .BYTE 9
      .BYTE $1A
      .BYTE 6
      .BYTE $15
      .BYTE $16
      .BYTE $11
      .BYTE $D
      .BYTE $10
      .BYTE $1A
      .BYTE $19
      .BYTE $24
      .BYTE $10
      .BYTE 3
      .BYTE 4
      .BYTE $2D
      .BYTE $30
      .BYTE $F
      .BYTE $2E
      .BYTE $3E
      .BYTE $1E
      .BYTE $28
      .BYTE $13
      .BYTE $48
      .BYTE $26

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F0E9:
      DEC     byte_RAM_400
      BPL     locret_BANKF_F0F3

      LDA     #8
      STA     byte_RAM_400

locret_BANKF_F0F3:
      RTS

; End of function sub_BANKF_F0E9

; ---------------------------------------------------------------------------
LevelMusicIndexes:
	  .BYTE	Music1_Overworld		      
      .BYTE Music1_Inside			  ; 1 ;	Music1 indexes.
      .BYTE Music1_Boss				  ; 2
      .BYTE Music1_Wart				  ; 3
      .BYTE Music1_Subspace			  ; 4

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F0F9:
      JSR     sub_BANKF_F0E9

      LDA     byte_RAM_4C7
      BNE     loc_BANKF_F11B

      LDA     byte_RAM_606
      CMP     #2
      BEQ     loc_BANKF_F115

      LDA     byte_RAM_41B
      BNE     loc_BANKF_F115

      LDA     #0
      JSR     ChangeMappedPRGBank

      JSR     loc_BANK0_8A02

loc_BANKF_F115:
      JSR     sub_BANKF_F228

      JSR     sub_BANKF_F31A

loc_BANKF_F11B:
      JMP     loc_BANKF_F146

; End of function sub_BANKF_F0F9

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F11E:
      JSR     sub_BANKF_F0E9

      LDA     byte_RAM_4C7
      BNE     loc_BANKF_F146

      LDA     #0
      JSR     ChangeMappedPRGBank

      LDA     byte_RAM_606
      CMP     #2
      BEQ     loc_BANKF_F13A

      LDA     byte_RAM_41B
      BNE     loc_BANKF_F13A

      JSR     loc_BANK0_8A02

loc_BANKF_F13A:
      JSR     sub_BANKF_F2C2

      JSR     sub_BANK0_85EC

      JSR     sub_BANKF_F228

      JSR     sub_BANKF_F31A

loc_BANKF_F146:
      LDA     #1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK2_8010

      JSR     sub_BANK3_BE0B

      JSR     sub_BANKF_FACA

      JSR     sub_BANKF_F47C

      LDX     #3

loc_BANKF_F159:
      LDA     byte_RAM_82,X
      BEQ     loc_BANKF_F15F

      DEC     byte_RAM_82,X

loc_BANKF_F15F:
      DEX
      BPL     loc_BANKF_F159

      LDY     StarInvincibilityTimer
      BEQ     locret_BANKF_F17D

      LDA     byte_RAM_10
      AND     #7
      BNE     locret_BANKF_F17D

      DEC     StarInvincibilityTimer
      CPY     #8
      BNE     locret_BANKF_F17D

      LDY     byte_RAM_545
      LDA     LevelMusicIndexes,Y
      STA     Music1Queue

locret_BANKF_F17D:
      RTS

; End of function sub_BANKF_F11E

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F17E:
      JSR     sub_BANKF_F0E9

      JSR     sub_BANKF_F494

      LDA     byte_RAM_4C7
      BNE     loc_BANKF_F1AB

      LDA     byte_RAM_606
      CMP     #2
      BEQ     loc_BANKF_F19D

      LDA     byte_RAM_41B
      BNE     loc_BANKF_F19D

      LDA     #0
      JSR     ChangeMappedPRGBank

      JSR     loc_BANK0_8A02

loc_BANKF_F19D:
      LDA     #0
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_8083

      JSR     sub_BANKF_F228

      JSR     sub_BANKF_F31A

loc_BANKF_F1AB:
      JMP     loc_BANKF_F146

; End of function sub_BANKF_F17E

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F1AE:
      LDA     byte_RAM_627
      CMP     #2
      BEQ     locret_BANKF_F1E0

      LDY     #3

loc_BANKF_F1B7:
      LDA     CurrentLevel,Y
      STA     byte_RAM_4E7,Y
      DEY
      BPL     loc_BANKF_F1B7

      LDA     PlayerXLo
      STA     byte_RAM_4E1
      LDA     PlayerYLo
      STA     byte_RAM_4E2
      LDA     PlayerPageX
      STA     byte_RAM_4E3
      LDA     PlayerPageY
      STA     byte_RAM_4E4
      LDA     PlayerYAccel
      STA     byte_RAM_4E5
      LDA     PlayerState
      STA     byte_RAM_4E6

locret_BANKF_F1E0:
      RTS

; End of function sub_BANKF_F1AE

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F1E1:
      LDY     #3

loc_BANKF_F1E3:
      LDA     byte_RAM_4E7,Y
      STA     CurrentLevel,Y
      DEY
      BPL     loc_BANKF_F1E3

      LDA     byte_RAM_4E1
      STA     PlayerXLo
      LDA     byte_RAM_4E2
      STA     PlayerYLo
      LDA     byte_RAM_4E3
      STA     PlayerPageX
      LDA     byte_RAM_4E4
      STA     PlayerPageY
      LDA     byte_RAM_4E5
      STA     PlayerYAccel
      LDA     byte_RAM_4E6
      STA     PlayerState
      LDA     #0
      STA     InSubspaceOrJar
      STA     byte_RAM_4EE
      STA     byte_RAM_99
      STA     DamageInvulnTime

; End of function sub_BANKF_F1E1

; =============== S U B	R O U T	I N E =======================================

RestorePlayerToFullHealth:
      LDY     PlayerMaxHealth			  ; Get	player's current max HP
      LDA     PlayerHealthValueByHeartCount,Y	  ; Get	the health value for this amount of hearts
      STA     PlayerHealth
      RTS

; End of function RestorePlayerToFullHealth

; ---------------------------------------------------------------------------
PlayerHealthValueByHeartCount:
	  .BYTE PlayerHealth_2_HP, PlayerHealth_3_HP, PlayerHealth_4_HP; Max	hearts = (hearts - 2), value is	0,1,2
						  ; This table determines what the player's HP is set to
byte_BANKF_F225:
	  .BYTE 0

byte_BANKF_F226:
	  .BYTE $20

byte_BANKF_F227:
	  .BYTE $F0

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F228:
      LDA     PlayerXLo
      SEC
      SBC     byte_RAM_4C0
      STA     PlayerPageX
      LDA     PlayerYLo
      CLC
      SBC     byte_RAM_CB
      STA     PlayerPageY
      LDA     PlayerYHi
      SBC     byte_RAM_CA
      STA     byte_RAM_42A
      LDA     PlayerState
      CMP     #PlayerState_Lifting
      BCS     locret_BANKF_F297

      LDA     byte_RAM_42A
      BEQ     loc_BANKF_F298

      BMI     loc_BANKF_F254

      LDA     #0
      STA     byte_RAM_82
      JMP     KillPlayer

; ---------------------------------------------------------------------------

loc_BANKF_F254:
      LDA     PlayerYHi
      BPL     locret_BANKF_F297

      LDA     byte_RAM_4EE
      BEQ     loc_BANKF_F298

      LDA     PlayerYLo
      CMP     #$F0
      BCS     locret_BANKF_F297

      JSR     sub_BANKF_F6DA

      PLA
      PLA
      LDY     #0
      STY     byte_RAM_9A
      STY     PlayerYAccel
      STY     PlayerXAccel
      LDA     #PlayerState_ExitingVase
      STA     PlayerState
      LDA     #SpriteAnimation_Ducking
      STA     PlayerAnimationFrame
      LDA     byte_RAM_4EE
      STY     byte_RAM_4EE
      CMP     #2
      BNE     loc_BANKF_F286

      STA     byte_RAM_627
      RTS

; ---------------------------------------------------------------------------

loc_BANKF_F286:
      STY     InSubspaceOrJar
      LDA     CurrentLevelAreaCopy
      STA     CurrentLevelArea
      LDA     #4
      JSR     ChangeMappedPRGBank

      JMP     GetEnemyPointers

; ---------------------------------------------------------------------------

locret_BANKF_F297:
      RTS

; ---------------------------------------------------------------------------

loc_BANKF_F298:
      LDA     PlayerState
      CMP     #PlayerState_1
      BNE     locret_BANKF_F297

      LDA     InSubspaceOrJar
      CMP     #2
      BEQ     locret_BANKF_F297

      LDA     byte_BANKF_F227
      LDY     PlayerYHi
      BMI     loc_BANKF_F2BB

      LDA     PlayerPageY
      CMP     #$B8
      BCC     locret_BANKF_F297

      LSR     PlayerYLo
      SEC
      ROL     PlayerYLo
      LDA     byte_BANKF_F226

loc_BANKF_F2BB:
      STA     PlayerYAccel
      LDA     #3
      STA     PlayerState
      RTS

; End of function sub_BANKF_F228

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F2C2:
      LDA     #0
      LDY     byte_RAM_4FA
      BNE     loc_BANKF_F2D2

      LDA     PlayerXLo
      SEC
      SBC     #$78
      SEC
      SBC     byte_RAM_4C0

loc_BANKF_F2D2:
      STA     byte_RAM_BA
      RTS

; End of function sub_BANKF_F2C2

; ---------------------------------------------------------------------------
byte_BANKF_F2D5:
	  .BYTE 0

      .BYTE   0
      .BYTE 0
      .BYTE   0
      .BYTE $FB
      .BYTE $FB
      .BYTE 0
      .BYTE $FB
      .BYTE $FB
      .BYTE 0
      .BYTE $FB
byte_BANKF_F2E0:
	  .BYTE $D5

      .BYTE $D9
      .BYTE $FB
      .BYTE $D7
byte_BANKF_F2E4:
	  .BYTE 0

byte_BANKF_F2E5:
	  .BYTE 2

byte_BANKF_F2E6:
	  .BYTE 4

byte_BANKF_F2E7:
	  .BYTE 6

      .BYTE $C
      .BYTE $E
      .BYTE $10
      .BYTE $12
      .BYTE 0
      .BYTE 2
      .BYTE 8
      .BYTE $A
      .BYTE $C
      .BYTE $E
      .BYTE $14
      .BYTE $16
      .BYTE $FB
      .BYTE $FB
      .BYTE $2C
      .BYTE $2C
      .BYTE $FB
      .BYTE $FB
      .BYTE $2E
      .BYTE $2E
      .BYTE $C
      .BYTE $E
      .BYTE $10
      .BYTE $12
      .BYTE $30
      .BYTE $30
      .BYTE $32
      .BYTE $32
      .BYTE $20
      .BYTE $22
      .BYTE $24
      .BYTE $26
      .BYTE 0
      .BYTE 2
      .BYTE $28
      .BYTE $2A
      .BYTE $18
      .BYTE $1A
      .BYTE $1C
      .BYTE $1E
      .BYTE $B4
      .BYTE $B6
DamageInvulnBlinkFrames:
	  .BYTE 1, 1, 1, 2, 2, 4,	4, 4		    ; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F31A:
IFDEF _COMPATIBILITY_
	  .db $ac, $50, $00 ; LDA $0000 + PlayerState
ENDIF
IFNDEF _COMPATIBILITY_
      LDY     PlayerState			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF

      CPY     #PlayerState_ChangingSize
      BEQ     loc_BANKF_F337

      LDY     StarInvincibilityTimer
      BNE     loc_BANKF_F337

      LDA     DamageInvulnTime			  ; Determine if the player is invincible from damage,
						  ; and	if so, if they should be visible
      BEQ     loc_BANKF_F345

      LSR     A
      LSR     A
      LSR     A
      LSR     A
      TAY
      LDA     DamageInvulnTime
      AND     DamageInvulnBlinkFrames,Y
      BNE     loc_BANKF_F345

      RTS

; ---------------------------------------------------------------------------

loc_BANKF_F337:
      LDA     byte_RAM_10
      CPY     #$18
      BCS     loc_BANKF_F33F

      LSR     A
      LSR     A

loc_BANKF_F33F:
      AND     #3
      ORA     byte_RAM_64
      STA     byte_RAM_64

loc_BANKF_F345:
      LDA     byte_RAM_4DF
      BEQ     loc_BANKF_F350

      LDA     #$20
      ORA     byte_RAM_64
      STA     byte_RAM_64

loc_BANKF_F350:
      LDA     PlayerPageX
      STA     SpriteDMAArea + $23
      STA     SpriteDMAArea + $2B
      CLC
      ADC     #8
      STA     SpriteDMAArea + $27
      STA     SpriteDMAArea + $2F
      LDA     PlayerPageY
      STA     byte_RAM_0
      LDA     byte_RAM_42A
      STA     byte_RAM_1
      LDY     PlayerAnimationFrame
      CPY     #4
      BEQ     loc_BANKF_F382

      LDA     byte_RAM_6F6
      BEQ     loc_BANKF_F382

      LDA     byte_RAM_0
      CLC
      ADC     #8
      STA     byte_RAM_0
      BCC     loc_BANKF_F382

      INC     byte_RAM_1

loc_BANKF_F382:
      LDA     CurrentCharacter
      CMP     #Character_Princess
      BEQ     loc_BANKF_F394

      CPY     #0
      BNE     loc_BANKF_F394

      LDA     byte_RAM_0
      BNE     loc_BANKF_F392

      DEC     byte_RAM_1

loc_BANKF_F392:
      DEC     byte_RAM_0

loc_BANKF_F394:
      JSR     loc_BANKF_FAFE

      LDA     byte_RAM_1
      BNE     loc_BANKF_F3A6

      LDA     byte_RAM_0
      STA     SpriteDMAArea,Y
      STA     SpriteDMAArea + $20
      STA     SpriteDMAArea + $24

loc_BANKF_F3A6:
      LDA     byte_RAM_0
      CLC
      ADC     #$10
      STA     byte_RAM_0
      LDA     byte_RAM_1
      ADC     #0
      BNE     loc_BANKF_F3BB

      LDA     byte_RAM_0
      STA     SpriteDMAArea + $28
      STA     SpriteDMAArea + $2C

loc_BANKF_F3BB:
      LDA     CrouchJumpTimer
      CMP     #$3C
      BCC     loc_BANKF_F3CA

      LDA     byte_RAM_10
      AND     #1
      ORA     byte_RAM_64
      STA     byte_RAM_64

loc_BANKF_F3CA:
      LDA     byte_RAM_9D
      LSR     A
      ROR     A
      ROR     A
      ORA     byte_RAM_64
      AND     #$FC
      ORA     #1
      STA     SpriteDMAArea + $02,Y
      LDX     PlayerAnimationFrame
      CPX     #7
      BEQ     loc_BANKF_F3E2

      CPX     #4
      BNE     loc_BANKF_F3EE

loc_BANKF_F3E2:
      LDA     byte_RAM_64
      STA     SpriteDMAArea + $22
      STA     SpriteDMAArea + $2A
      ORA     #$40
      BNE     loc_BANKF_F3F8

loc_BANKF_F3EE:
      AND     #$FC
      ORA     byte_RAM_64
      STA     SpriteDMAArea + $22
      STA     SpriteDMAArea + $2A

loc_BANKF_F3F8:
      STA     SpriteDMAArea + $26
      STA     SpriteDMAArea + $2E
      LDA     byte_BANKF_F2D5,X
      BNE     loc_BANKF_F408

      LDX     CurrentCharacter
      LDA     byte_BANKF_F2E0,X

loc_BANKF_F408:
      STA     SpriteDMAArea + $01,Y
      LDA     PlayerAnimationFrame
      CMP     #6
      BCS     loc_BANKF_F413

      ORA     HoldingItem

loc_BANKF_F413:
      ASL     A
      ASL     A
      TAX
      LDA     byte_RAM_9D
      BNE     loc_BANKF_F44A

      LDA     SpriteDMAArea + $23
      STA     SpriteDMAArea + $03,Y
      LDA     byte_BANKF_F2E4,X
      STA     SpriteDMAArea + $21
      LDA     byte_BANKF_F2E5,X
      STA     SpriteDMAArea + $25
      LDA     byte_RAM_6F6
      BNE     loc_BANKF_F43F

      LDA     CurrentCharacter
      CMP     #Character_Princess
      BNE     loc_BANKF_F43F

      LDA     PlayerAnimationFrame
      CMP     #SpriteAnimation_Jumping
      BNE     loc_BANKF_F43F

      LDX     #$2A

loc_BANKF_F43F:
      LDA     byte_BANKF_F2E6,X
      STA     SpriteDMAArea + $29
      LDA     byte_BANKF_F2E7,X
      BNE     loc_BANKF_F478

loc_BANKF_F44A:
      LDA     SpriteDMAArea + $27
      STA     SpriteDMAArea + $03,Y
      LDA     byte_BANKF_F2E5,X
      STA     SpriteDMAArea + $21
      LDA     byte_BANKF_F2E4,X
      STA     SpriteDMAArea + $25
      LDA     byte_RAM_6F6
      BNE     loc_BANKF_F46F

      LDA     CurrentCharacter
      CMP     #Character_Princess
      BNE     loc_BANKF_F46F

      LDA     PlayerAnimationFrame
      CMP     #SpriteAnimation_Jumping
      BNE     loc_BANKF_F46F

      LDX     #$2A

loc_BANKF_F46F:
      LDA     byte_BANKF_F2E7,X
      STA     SpriteDMAArea + $29
      LDA     byte_BANKF_F2E6,X

loc_BANKF_F478:
      STA     SpriteDMAArea + $2D
      RTS

; End of function sub_BANKF_F31A

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F47C:
      LDA     IsHorizontalLevel
      BNE     loc_BANKF_F48E

      LDY     PlayerYHi
      LDA     PlayerYLo
      JSR     sub_BANKF_F4C3

      TYA
      BPL     loc_BANKF_F490

      LDA     #0
      BEQ     loc_BANKF_F490

loc_BANKF_F48E:
      LDA     PlayerXHi

loc_BANKF_F490:
      STA     byte_RAM_535
      RTS

; End of function sub_BANKF_F47C

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F494:
      LDX     byte_RAM_D8
      BNE     locret_BANKF_F4C2

      LDA     PlayerState
      CMP     #PlayerState_Lifting
      BCS     locret_BANKF_F4C2

      LDA     PlayerPageY
      LDY     byte_RAM_42A
      BMI     loc_BANKF_F4B0

      BNE     loc_BANKF_F4B6

      CMP     #$B4
      BCS     loc_BANKF_F4B6

      CMP     #$21
      BCS     loc_BANKF_F4B8

loc_BANKF_F4B0:
      LDY     byte_RAM_99
      BNE     loc_BANKF_F4B8

      BEQ     loc_BANKF_F4B7

loc_BANKF_F4B6:
      INX

loc_BANKF_F4B7:
      INX

loc_BANKF_F4B8:
      LDA     byte_RAM_425
      STX     byte_RAM_425
      BNE     locret_BANKF_F4C2

      STX     byte_RAM_D8

locret_BANKF_F4C2:
      RTS

; End of function sub_BANKF_F494

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F4C3:
      STA     byte_RAM_F
      TYA
      BMI     locret_BANKF_F4D9

      ASL     A
      ASL     A
      ASL     A
      ASL     A
      CLC
      ADC     byte_RAM_F
      BCS     loc_BANKF_F4D5

      CMP     #$F0
      BCC     locret_BANKF_F4D9

loc_BANKF_F4D5:
      CLC
      ADC     #$10
      INY

locret_BANKF_F4D9:
      RTS

; End of function sub_BANKF_F4C3

; ---------------------------------------------------------------------------
byte_BANKF_F4DA:
	  .BYTE $C0

      .BYTE $70
      .BYTE $80
      .BYTE $50
      .BYTE $A0
      .BYTE $40
      .BYTE $B0
      .BYTE $60
      .BYTE $90
      .BYTE $C0
      .BYTE $70
      .BYTE $80
      .BYTE $50
      .BYTE $A0
      .BYTE $40
      .BYTE $B0
      .BYTE $60
ObjectAttributeTable:
	  .BYTE ObjAttrib_Palette1			 
      .BYTE ObjAttrib_Palette1			  ; 1
      .BYTE ObjAttrib_Palette1			  ; 2
      .BYTE ObjAttrib_Palette3			  ; 3
      .BYTE ObjAttrib_Palette2			  ; 4
      .BYTE ObjAttrib_Palette1			  ; 5
      .BYTE ObjAttrib_Palette2			  ; 6
      .BYTE ObjAttrib_Palette3			  ; 7
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; 8
      .BYTE ObjAttrib_Palette1			  ; 9
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_16x32; $A
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_16x32; $B
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_16x32; $C
      .BYTE ObjAttrib_Palette1			  ; $D
      .BYTE ObjAttrib_Palette1			  ; $E
      .BYTE ObjAttrib_Palette1			  ; $F
      .BYTE ObjAttrib_Palette2			  ; $10
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $11
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_Unknown_08; $12
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $13
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $14
      .BYTE ObjAttrib_Palette0			  ; $15
      .BYTE ObjAttrib_Palette0			  ; $16
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $17
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32|ObjAttrib_UpsideDown; $18
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $19
      .BYTE ObjAttrib_Palette2|ObjAttrib_Unknown_08; $1A
      .BYTE ObjAttrib_Palette2|ObjAttrib_Unknown_08; $1B
      .BYTE ObjAttrib_Palette2|ObjAttrib_16x32	  ; $1C
      .BYTE ObjAttrib_Palette3|ObjAttrib_16x32	  ; $1D
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $1E
      .BYTE ObjAttrib_Palette2|ObjAttrib_Unknown_08; $1F
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $20
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $21
      .BYTE ObjAttrib_Palette2			  ; $22
      .BYTE ObjAttrib_Palette1			  ; $23
      .BYTE ObjAttrib_Palette3			  ; $24
      .BYTE ObjAttrib_Palette2			  ; $25
      .BYTE ObjAttrib_Palette1			  ; $26
      .BYTE ObjAttrib_Palette1			  ; $27
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $28
      .BYTE ObjAttrib_Palette1			  ; $29
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $2A
      .BYTE ObjAttrib_Palette1			  ; $2B
      .BYTE ObjAttrib_Palette3|ObjAttrib_Unknown_04|ObjAttrib_Unknown_08|ObjAttrib_16x32; $2C
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $2D
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $2E
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $2F
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $30
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $31
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$32
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$33
      .BYTE ObjAttrib_Palette2|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$34
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$35
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$36
      .BYTE ObjAttrib_Palette1|ObjAttrib_UpsideDown; $37
      .BYTE ObjAttrib_Palette1|ObjAttrib_UpsideDown; $38
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $39
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08|ObjAttrib_UpsideDown; $3A
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_Unknown_08|ObjAttrib_16x32; $3B
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $3C
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $3D
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08|ObjAttrib_UpsideDown; $3E
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $3F
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08|ObjAttrib_UpsideDown; $40
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_16x32; $41
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $42
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $43
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $44
      .BYTE ObjAttrib_Palette2|ObjAttrib_Mirrored ; $45
      .BYTE ObjAttrib_Palette2|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$46
byte_BANKF_F532:
	  .BYTE 4

      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 3
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE $50
      .BYTE $40
      .BYTE $42
      .BYTE $42
      .BYTE $42
      .BYTE $40
      .BYTE $40
      .BYTE $40
      .BYTE $40
      .BYTE $13
      .BYTE $D0
      .BYTE $80
      .BYTE 0
      .BYTE 6
      .BYTE 6
      .BYTE 7
      .BYTE $10
      .BYTE $50
      .BYTE $90
      .BYTE 7
      .BYTE $A
      .BYTE $3B
      .BYTE $40
      .BYTE $18
      .BYTE 7
      .BYTE $1B
      .BYTE $10
      .BYTE 7
      .BYTE 7
      .BYTE 7
      .BYTE $50
      .BYTE $53
      .BYTE $96
      .BYTE $50
      .BYTE $9B
      .BYTE $D3
      .BYTE $1B
      .BYTE $B
      .BYTE 3
      .BYTE 3
      .BYTE 3
      .BYTE 3
      .BYTE 0
      .BYTE 0
      .BYTE   0
      .BYTE   0
      .BYTE   4
      .BYTE 4
      .BYTE 4
      .BYTE 0
      .BYTE 0
      .BYTE 6
      .BYTE 4
      .BYTE 0
      .BYTE 4
      .BYTE   4
      .BYTE   4
      .BYTE $16
      .BYTE 6
      .BYTE 6
      .BYTE $C
      .BYTE 4
      .BYTE   4
unk_BANKF_F579:
	  .BYTE   0
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE $C
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE $D
      .BYTE $D
      .BYTE 5
      .BYTE $C
      .BYTE $C
      .BYTE 5
      .BYTE $D
      .BYTE $C
      .BYTE $C
      .BYTE 5
      .BYTE $E
      .BYTE $D
      .BYTE $C
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE $C
      .BYTE   5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 0
      .BYTE $F
      .BYTE $F
      .BYTE $F
      .BYTE $F
      .BYTE 5
      .BYTE 5
      .BYTE   5
      .BYTE   5
      .BYTE   5
      .BYTE 5
      .BYTE 5
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE   4
      .BYTE   4
      .BYTE $10
      .BYTE 0
      .BYTE 0
      .BYTE 5
      .BYTE 5
      .BYTE   5
unk_BANKF_F5C0:
	  .BYTE   8
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 4
      .BYTE 2
      .BYTE 9
      .BYTE 9
      .BYTE 9
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 8
      .BYTE 8
      .BYTE 2
      .BYTE 4
      .BYTE 4
      .BYTE $E
      .BYTE 8
      .BYTE 4
      .BYTE 4
      .BYTE 2
      .BYTE $F
      .BYTE 2
      .BYTE $13
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE $10
      .BYTE   2
      .BYTE $12
      .BYTE 2
      .BYTE $F
      .BYTE 2
      .BYTE $11
      .BYTE $B
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE   2
      .BYTE   2
      .BYTE   2
      .BYTE 2
      .BYTE 4
      .BYTE 3
      .BYTE 3
      .BYTE 7
      .BYTE 4
      .BYTE 3
      .BYTE 3
      .BYTE   3
      .BYTE   3
      .BYTE 9
      .BYTE $B
      .BYTE $B
      .BYTE 2
      .BYTE 2
      .BYTE   2
byte_BANKF_F607:
	  .BYTE 0

      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 2
      .BYTE 1
      .BYTE 0
      .BYTE 2
      .BYTE 3
      .BYTE 2
      .BYTE 4
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 0
      .BYTE 2
byte_BANKF_F64E:
	  .BYTE 1

      .BYTE $43
      .BYTE $80
      .BYTE $C0
      .BYTE $12
      .BYTE $60
      .BYTE $91
      .BYTE $CA
      .BYTE $18
      .BYTE $69
      .BYTE $98
      .BYTE $D5
WarpDestinations:
	  .BYTE 3, 1, 4,	5, 6, 5, 6		     ; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F661:
      JSR     ReadJoypads

loc_BANKF_F664:
      LDY     Player1JoypadPress
      JSR     ReadJoypads

      CPY     Player1JoypadPress
      BNE     loc_BANKF_F664

      LDX     #1

loc_BANKF_F66F:
      LDA     Player1JoypadPress,X
      TAY
      EOR     Player1JoypadHeld,X
      AND     Player1JoypadPress,X
      STA     Player1JoypadPress,X
      STY     Player1JoypadHeld,X
      DEX
      BPL     loc_BANKF_F66F

      RTS

; End of function sub_BANKF_F661

; =============== S U B	R O U T	I N E =======================================

ReadJoypads:
      LDX     #1
      STX     JOY1
      DEX
      STX     JOY1
      LDX     #8

ReadJoypadLoop:
      LDA     JOY1
      LSR     A
      ROL     Player1JoypadPress
      LSR     A
      ROL     byte_RAM_6F4
      LDA     JOY2
      LSR     A
      ROL     Player2JoypadPress
      LSR     A
      ROL     byte_RAM_6F5
      DEX
      BNE     ReadJoypadLoop

      RTS

; End of function ReadJoypads

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F6A1:
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

; End of function sub_BANKF_F6A1

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F6C0:
      LDA     byte_RAM_544
      CMP     byte_RAM_545
      BEQ     locret_BANKF_F6D9

      TAX
      STX     byte_RAM_545
      LDA     StarInvincibilityTimer
      CMP     #8
      BCS     locret_BANKF_F6D9

      LDA     LevelMusicIndexes,X
      STA     Music1Queue

locret_BANKF_F6D9:
      RTS

; End of function sub_BANKF_F6C0

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F6DA:
      LDA     #0
      STA     byte_RAM_4AE
      STA     byte_RAM_4AF
      STA     SubspaceTimer
      STA     byte_RAM_4B3
      LDX     #8

loc_BANKF_F6EA:
      LDA     EnemyState,X
      BEQ     loc_BANKF_F6FE

      LDA     unk_RAM_A8,X
      BEQ     loc_BANKF_F6FB

      LDA     ObjectType,X
      CMP     #$39
      BEQ     loc_BANKF_F6FB

      STA     byte_RAM_4AF

loc_BANKF_F6FB:
      JSR     sub_BANKF_F704

loc_BANKF_F6FE:
      DEX
      BPL     loc_BANKF_F6EA

      LDX     byte_RAM_12
      RTS

; End of function sub_BANKF_F6DA

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_F704:
      LDY     unk_RAM_441,X
      BMI     loc_BANKF_F70F

      LDA     (byte_RAM_CC),Y
      AND     #$7F
      STA     (byte_RAM_CC),Y

loc_BANKF_F70F:
      LDA     #0
      STA     EnemyState,X
      RTS

; End of function sub_BANKF_F704

; =============== S U B	R O U T	I N E =======================================

KillPlayer:
      LDA     #PlayerState_Dying		  ; Mark player	as dead
      STA     PlayerState
      LDA     #0				  ; Clear some variables
      STA     PlayerHealth
      STA     CrouchJumpTimer
      STA     StarInvincibilityTimer
      LDA     #SpriteAnimation_Dead		  ; Set	player animation to dead?
      STA     PlayerAnimationFrame
      LDA     HoldingItem
      BEQ     loc_BANKF_F749

      DEC     HoldingItem			  ; Probably something to throw	away
						  ; a held item	on death
      LDY     byte_RAM_42D
      STA     unk_RAM_42F,Y
      LSR     A
      STA     unk_RAM_A8,Y
      STA     ObjectXAccel,Y
      LDA     #$E0
      STX     word_RAM_C+1
      LDX     EnemyState,Y
      CPX     #7
      BEQ     loc_BANKF_F747

      STA     ObjectYAccel,Y

loc_BANKF_F747:
      LDX     word_RAM_C+1

loc_BANKF_F749:
      LDA     #Music2_DeathJingle		  ; Set	music to death jingle
      STA     MusicQueue2
      LDA     #DPCM_PlayerDeath			  ; BUG: Setting DPCM at the same time as music
						  ; causes DPCM	to not play
      STA     DPCMQueue
      RTS

; End of function KillPlayer

; =============== S U B	R O U T	I N E =======================================

; Something to do with loading levels here

GetLevelPointers:
      LDY     CurrentLevel
      LDA     LevelAreaStartIndexes,Y
      CLC
      ADC     CurrentLevelArea
      TAY					  ; Y now contains the current area or something
      LDA     LevelDataPointersLo,Y
      STA     byte_RAM_5			  ; $0005/$0006	are pointers to	the level data
      LDA     LevelDataPointersHi,Y
      STA     byte_RAM_6
      LDX     #$FF				  ; Set	to load	level data into	$7800 in RAM
      LDA     #$78
      STA     byte_RAM_2
      LDY     #0
      STY     byte_RAM_1

CopyLevelDataToMemory:
      LDA     (byte_RAM_5),Y
      STA     (byte_RAM_1),Y
      INY
      DEX
      BNE     CopyLevelDataToMemory

      STA     (byte_RAM_1),Y

; End of function GetLevelPointers

; =============== S U B	R O U T	I N E =======================================

GetEnemyPointers:
      LDY     CurrentLevel
      LDA     EnemyPointersByLevel_HiHi,Y
      STA     byte_RAM_1
      LDA     EnemyPointersByLevel_HiLo,Y
      STA     byte_RAM_0
      LDA     EnemyPointersByLevel_LoHi,Y
      STA     byte_RAM_3
      LDA     EnemyPointersByLevel_LoLo,Y
      STA     byte_RAM_2
      LDA     InSubspaceOrJar			  ; Are	we in a	jar?
      CMP     #1
      BNE     loc_BANKF_F7A0			  ; No,	load the area as usual

      LDY     #4				  ; Yes; jars are always area #$04 for some reason
      JMP     loc_BANKF_F7A3

; ---------------------------------------------------------------------------

loc_BANKF_F7A0:
      LDY     CurrentLevelArea

loc_BANKF_F7A3:
      LDA     (byte_RAM_0),Y
      STA     byte_RAM_1
      LDA     (byte_RAM_2),Y
      STA     byte_RAM_0
      LDX     #$FF
      LDA     #$7B
      STA     byte_RAM_3
      LDY     #0
      STY     byte_RAM_2

CopyEnemyDataToMemory:
      LDA     (byte_RAM_0),Y
      STA     (byte_RAM_2),Y
      INY
      DEX
      BNE     CopyEnemyDataToMemory

      RTS

; End of function GetEnemyPointers

; =============== S U B	R O U T	I N E =======================================

GetJarPointers:
      LDY     CurrentLevel			  ; Get	the area starting index	for the	current	level
      LDA     LevelAreaStartIndexes,Y
      CLC
      ADC     #4				  ; 4 is always	the jar	sub area
      TAY
      LDA     LevelDataPointersLo,Y
      STA     byte_RAM_5
      LDA     LevelDataPointersHi,Y
      STA     byte_RAM_6
      LDA     #$7A
      STA     byte_RAM_2
      LDY     #0
      STY     byte_RAM_1

CopyJarDataToMemory:
      LDA     (byte_RAM_5),Y
      CMP     #$FF				  ; This one actually terminates on any	$FF read! Welp.
      BEQ     CopyJarDataToMemoryFinished

      STA     (byte_RAM_1),Y
      INY
      JMP     CopyJarDataToMemory

; ---------------------------------------------------------------------------

CopyJarDataToMemoryFinished:
      STA     (byte_RAM_1),Y
      RTS

; End of function GetJarPointers

; ---------------------------------------------------------------------------
TileQuadPointersLo:
	  .BYTE <TileQuads1

      .BYTE <TileQuads2
      .BYTE <TileQuads3
      .BYTE <TileQuads4
TileQuadPointersHi:
	  .BYTE >TileQuads1

      .BYTE >TileQuads2
      .BYTE >TileQuads3
      .BYTE >TileQuads4
TileQuads1:
	  .BYTE $FE,$FE,$FE,$FE		       
      .BYTE $B4,$B6,$B5,$B7			  ; 4
      .BYTE $B8,$FA,$B9,$FA			  ; 8
      .BYTE $FA,$FA,$B2,$B3			  ; $C
      .BYTE $BE,$BE,$BF,$BF			  ; $10
      .BYTE $BF,$BF,$BF,$BF			  ; $14
      .BYTE $4A,$4A,$4B,$4B			  ; $18
      .BYTE $5E,$5F,$5E,$5F			  ; $1C
      .BYTE $E8,$E8,$A9,$A9			  ; $20
      .BYTE $46,$FC,$46,$FC			  ; $24
      .BYTE $A9,$A9,$A9,$A9			  ; $28
      .BYTE $FC,$FC,$FC,$FC			  ; $2C
      .BYTE $E9,$E9,$A9,$A9			  ; $30
      .BYTE $FC,$48,$FC,$48			  ; $34
      .BYTE $11,$11,$11,$11			  ; $38
      .BYTE $22,$22,$22,$22			  ; $3C
      .BYTE $33,$33,$33,$33			  ; $40
      .BYTE $E8,$EB,$A9,$A9			  ; $44
      .BYTE $74,$76,$75,$77			  ; $48
      .BYTE $98,$9A,$99,$9B			  ; $4C
      .BYTE $9C,$9A,$9D,$9B			  ; $50
      .BYTE $9C,$9E,$9B,$9F			  ; $54
      .BYTE $58,$5A,$59,$5B			  ; $58
      .BYTE $5E,$5F,$5E,$5F			  ; $5C
      .BYTE $8E,$8F,$8F,$8E			  ; $60
      .BYTE $72,$73,$73,$72			  ; $64
      .BYTE $A6,$A6,$A7,$A7			  ; $68
      .BYTE $92,$93,$93,$92			  ; $6C
      .BYTE $74,$76,$75,$77			  ; $70
      .BYTE $70,$72,$71,$73			  ; $74
      .BYTE $71,$73,$71,$73			  ; $78
      .BYTE $24,$26,$25,$27			  ; $7C
      .BYTE $32,$34,$33,$35			  ; $80
      .BYTE $33,$35,$33,$35			  ; $84
      .BYTE $24,$26,$25,$27			  ; $88
TileQuads2:
	  .BYTE $FA,$FA,$FA,$FA		       
      .BYTE $FA,$FA,$FA,$FA			  ; 4
      .BYTE $FA,$FA,$FA,$FA			  ; 8
      .BYTE $FA,$FA,$B0,$B1			  ; $C
      .BYTE $FA,$FA,$B0,$B1			  ; $10
      .BYTE $FA,$FA,$B0,$B1			  ; $14
      .BYTE $FA,$FA,$B0,$B1			  ; $18
      .BYTE $FA,$FA,$B0,$B1			  ; $1C
      .BYTE $FA,$FA,$B0,$B1			  ; $20
      .BYTE $FA,$FA,$B0,$B1			  ; $24
      .BYTE $FA,$FA,$B0,$B1			  ; $28
      .BYTE $FA,$FA,$B0,$B1			  ; $2C
      .BYTE $FA,$FA,$B0,$B1			  ; $30
      .BYTE $FA,$FA,$B0,$B1			  ; $34
      .BYTE $A0,$A2,$A1,$A3			  ; $38
      .BYTE $80,$82,$81,$83			  ; $3C
      .BYTE $F4,$86,$F5,$87			  ; $40
      .BYTE $84,$86,$85,$87			  ; $44
      .BYTE $FC,$FC,$FC,$FC			  ; $48
      .BYTE $AD,$FB,$AC,$AD			  ; $4C
      .BYTE $AC,$AC,$AC,$AC			  ; $50
      .BYTE $FB,$3B,$3B,$AC			  ; $54
      .BYTE $FC,$FC,$FC,$FC			  ; $58
      .BYTE $F4,$86,$F5,$87			  ; $5C
      .BYTE $FB,$49,$49,$FB			  ; $60
      .BYTE $FE,$FE,$FE,$FE			  ; $64
      .BYTE $FE,$FE,$6D,$FE			  ; $68
      .BYTE $3C,$3E,$3D,$3F			  ; $6C
      .BYTE $58,$FD,$59,$5A			  ; $70
      .BYTE $5B,$5A,$FD,$FD			  ; $74
      .BYTE $5B,$5C,$FD,$5D			  ; $78
      .BYTE $FD,$FD,$5B,$5A			  ; $7C
      .BYTE $6C,$FE,$FE,$FE			  ; $80
      .BYTE $FE,$FE,$FE,$FE			  ; $84
      .BYTE $FE,$6E,$FE,$6F			  ; $88
      .BYTE $20,$22,$21,$23			  ; $8C
      .BYTE $6E,$6F,$70,$71			  ; $90
      .BYTE $57,$57,$FB,$FB			  ; $94
      .BYTE $57,$57,$FE,$FE			  ; $98
      .BYTE $D3,$D3,$FB,$FB			  ; $9C
      .BYTE $D2,$D2,$FB,$FB			  ; $A0
      .BYTE $7C,$7E,$7D,$7F			  ; $A4
      .BYTE $CA,$CC,$CB,$CD			  ; $A8
      .BYTE $CA,$CC,$CB,$CD			  ; $AC
      .BYTE $C0,$C2,$C1,$C3			  ; $B0
      .BYTE $2C,$2E,$2D,$2F			  ; $B4
      .BYTE $8E,$8F,$8F,$8E			  ; $B8
      .BYTE $88,$8A,$89,$8B			  ; $BC
      .BYTE $89,$8B,$89,$8B			  ; $C0
      .BYTE $89,$8B,$8C,$8D			  ; $C4
      .BYTE $88,$8A,$8C,$8D			  ; $C8
      .BYTE $88,$8A,$89,$8B			  ; $CC
      .BYTE $88,$8A,$89,$8B			  ; $D0
      .BYTE $6A,$6C,$6B,$6D			  ; $D4
      .BYTE $6C,$6C,$6D,$6D			  ; $D8
      .BYTE $6C,$6E,$6D,$6F			  ; $DC
      .BYTE $6C,$54,$6D,$55			  ; $E0
      .BYTE $32,$34,$33,$35			  ; $E4
      .BYTE $33,$35,$33,$35			  ; $E8
TileQuads3:
	  .BYTE $94,$95,$94,$95		       
      .BYTE $96,$97,$96,$97			  ; 4
      .BYTE $48,$49,$48,$49			  ; 8
      .BYTE $FE,$FE,$FE,$FE			  ; $C
      .BYTE $FB,$32,$32,$33			  ; $10
      .BYTE $33,$33,$33,$33			  ; $14
      .BYTE $FD,$FD,$FD,$FD			  ; $18
      .BYTE $34,$FB,$FD,$34			  ; $1C
      .BYTE $FB,$30,$FB,$FB			  ; $20
      .BYTE $FB,$FB,$31,$FB			  ; $24
      .BYTE $D0,$D0,$D0,$D0			  ; $28
      .BYTE $D1,$D1,$D1,$D1			  ; $2C
      .BYTE $64,$66,$65,$67			  ; $30
      .BYTE $68,$6A,$69,$6B			  ; $34
      .BYTE $FA,$6C,$FA,$6C			  ; $38
      .BYTE $6D,$FA,$6D,$FA			  ; $3C
      .BYTE $92,$93,$93,$92			  ; $40
      .BYTE $AE,$AF,$AE,$AF			  ; $44
      .BYTE $78,$7A,$79,$7B			  ; $48
      .BYTE $A8,$A8,$AF,$AE			  ; $4C
      .BYTE $94,$95,$94,$95			  ; $50
      .BYTE $96,$97,$96,$97			  ; $54
      .BYTE $22,$24,$23,$25			  ; $58
      .BYTE $92,$93,$93,$92			  ; $5C
      .BYTE $50,$51,$50,$51			  ; $60
      .BYTE $AE,$AF,$AE,$AF			  ; $64
      .BYTE $50,$51,$50,$51			  ; $68
      .BYTE $8E,$8F,$8F,$8E			  ; $6C
      .BYTE $72,$73,$73,$72			  ; $70
      .BYTE $50,$52,$51,$53			  ; $74
      .BYTE $FD,$FD,$FD,$FD			  ; $78
      .BYTE $FB,$36,$36,$4F			  ; $7C
      .BYTE $4F,$4E,$4E,$4F			  ; $80
      .BYTE $4E,$4F,$4F,$4E			  ; $84
      .BYTE $92,$93,$93,$92			  ; $88
      .BYTE $8E,$8F,$8F,$8E			  ; $8C
      .BYTE $44,$45,$45,$44			  ; $90
      .BYTE $4F,$37,$4E,$FE			  ; $94
      .BYTE $4F,$3A,$4E,$FE			  ; $98
      .BYTE $4F,$4E,$37,$38			  ; $9C
      .BYTE $4A,$4B,$FE,$FE			  ; $A0
      .BYTE $72,$73,$4A,$4B			  ; $A4
      .BYTE $40,$42,$41,$43			  ; $A8
      .BYTE $41,$43,$41,$43			  ; $AC
TileQuads4:
	  .BYTE $40,$42,$41,$43		       
      .BYTE $40,$42,$41,$43			  ; 4
      .BYTE $BA,$BC,$BB,$BD			  ; 8
      .BYTE $BA,$BC,$90,$91			  ; $C
      .BYTE $FA,$FA,$FA,$FA			  ; $10
      .BYTE $FA,$FA,$FA,$FA			  ; $14
      .BYTE $FD,$FD,$FD,$FD			  ; $18
      .BYTE $61,$63,$61,$63			  ; $1C
      .BYTE $65,$63,$65,$63			  ; $20
      .BYTE $65,$67,$65,$67			  ; $24
      .BYTE $60,$62,$61,$63			  ; $28
      .BYTE $32,$34,$33,$35			  ; $2C
      .BYTE $64,$62,$65,$63			  ; $30
      .BYTE $36,$34,$37,$35			  ; $34
      .BYTE $64,$66,$65,$67			  ; $38
      .BYTE $36,$38,$37,$39			  ; $3C
      .BYTE $68,$62,$61,$63			  ; $40
      .BYTE $64,$69,$65,$67			  ; $44
      .BYTE $46,$62,$61,$63			  ; $48
      .BYTE $64,$47,$65,$67			  ; $4C
      .BYTE $BA,$BC,$BB,$BD			  ; $50
      .BYTE $70,$72,$71,$73			  ; $54
      .BYTE $8E,$8F,$8F,$8E			  ; $58
      .BYTE $72,$73,$73,$72			  ; $5C
      .BYTE $44,$45,$45,$44			  ; $60
byte_BANKF_FA7D:
	  .BYTE $22

      .BYTE $D0
      .BYTE 4
      .BYTE $FC
      .BYTE $FC
      .BYTE $AD
      .BYTE $FA
      .BYTE $22
      .BYTE $F0
      .BYTE 4
      .BYTE $FC
      .BYTE $FC
      .BYTE $AC
      .BYTE $AD
      .BYTE $23
      .BYTE $10
      .BYTE 6
      .BYTE $FC
      .BYTE $FC
      .BYTE $AC
      .BYTE $AC
      .BYTE $AD
      .BYTE $FA
      .BYTE $23
      .BYTE $30
      .BYTE 6
      .BYTE $FC
      .BYTE $FC
      .BYTE $AC
      .BYTE $AC
      .BYTE $AC
      .BYTE $AD
      .BYTE 0
byte_BANKF_FA9E:
	  .BYTE 0

      .BYTE 7
      .BYTE $E
      .BYTE $17
byte_BANKF_FAA2:
	  .BYTE 0

      .BYTE 0
      .BYTE 6
      .BYTE 6
      .BYTE $A
      .BYTE $A
      .BYTE $B
      .BYTE $D
      .BYTE $E
      .BYTE $11
      .BYTE $11
      .BYTE $12
      .BYTE $12
      .BYTE $12
      .BYTE $12
      .BYTE $13
byte_BANKF_FAB2:
	  .BYTE 1

      .BYTE 5
      .BYTE 1
      .BYTE 3
      .BYTE 1
      .BYTE 2
      .BYTE 4
      .BYTE 2
      .BYTE 4
      .BYTE 3
      .BYTE 4
      .BYTE 0
      .BYTE 1
      .BYTE 2
      .BYTE 3
      .BYTE 0
BackgroundCHRAnimationSpeedByWorld:
	  .BYTE 7, 7, 7, 7, 9,	7, 5		       
      .BYTE $B

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_FACA:
      DEC     BackgroundCHR2Timer
      BPL     locret_BANKF_FAFD

      LDX     #7
      LDY     #$F

loc_BANKF_FAD3:
      LDA     byte_RAM_4E7
      CMP     byte_BANKF_FAA2,Y
      BNE     loc_BANKF_FAE3

      LDA     byte_RAM_4E8
      CMP     byte_BANKF_FAB2,Y
      BEQ     loc_BANKF_FAE9

loc_BANKF_FAE3:
      DEY
      BPL     loc_BANKF_FAD3

      LDX     CurrentWorld

loc_BANKF_FAE9:
      LDA     BackgroundCHRAnimationSpeedByWorld,X
      STA     BackgroundCHR2Timer
      LDY     BackgroundCHR2
      INY
      INY
      CPY     #$26
						  ; This is present in the original game.
      BCC     loc_BANKF_FAFA

      LDY     #$18

loc_BANKF_FAFA:
      STY     BackgroundCHR2

locret_BANKF_FAFD:
      RTS

; End of function sub_BANKF_FACA

; ---------------------------------------------------------------------------

loc_BANKF_FAFE:
      LDX     #8

loc_BANKF_FB00:
      LDA     EnemyState,X
      BEQ     loc_BANKF_FB1C

loc_BANKF_FB04:
      DEX
      BPL     loc_BANKF_FB00

      LDY     #0
      LDA     SpriteDMAArea,Y
      CMP     #$F8
      BNE     loc_BANKF_FB17

      LDA     SpriteDMAArea + $04,Y
      CMP     #$F8
      BEQ     loc_BANKF_FB19

loc_BANKF_FB17:
      LDY     #$10

loc_BANKF_FB19:
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

loc_BANKF_FB1C:
      TXA
      CLC
      ADC     byte_RAM_400
      TAY
      LDA     byte_BANKF_F4DA,Y
      TAY
      LDA     SpriteDMAArea,Y
      CMP     #$F8
      BNE     loc_BANKF_FB04

      LDA     SpriteDMAArea + $04,Y
      CMP     #$F8
      BNE     loc_BANKF_FB04

      BEQ     loc_BANKF_FB19

; ---------------------------------------------------------------------------
; [000002CA BYTES: BEGIN OF AREA BANKF:FB36. PRESS KEYPAD "-" TO COLLAPSE]
_unused_fb36:
	  .BYTE $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF
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
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF; $2C0
; [000002CA BYTES: END OF AREA BANKF:FB36. PRESS KEYPAD	"-" TO COLLAPSE]
byte_BANKF_FE00:
	  .BYTE $C
      .BYTE $D
      .BYTE $C
      .BYTE $E
      .BYTE $C
      .BYTE $D
      .BYTE $F
byte_BANKF_FE07:
	  .BYTE $10

      .BYTE $12
      .BYTE $10
      .BYTE $14
      .BYTE $A
      .BYTE $12
      .BYTE $16
byte_BANKF_FE0E:
	  .BYTE 0

      .BYTE 4
      .BYTE 2
      .BYTE   6
      .BYTE 3
      .BYTE 7
      .BYTE 1
      .BYTE 5

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_FE16:
      LDY     #8
      STY     SpriteCHR2
      INY
      STY     SpriteCHR3
      LDY     CurrentWorld
      LDA     byte_BANKF_FE00,Y
      STA     SpriteCHR4
      LDA     byte_BANKF_FE07,Y
      STA     BackgroundCHR1
      LDA     #$18
      STA     BackgroundCHR2

loc_BANKF_FE33:
      LDA     CurrentCharacter
      ASL     A
      ORA     byte_RAM_6F6
      TAY
      LDA     byte_BANKF_FE0E,Y
      STA     SpriteCHR1
      RTS

; End of function sub_BANKF_FE16

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_FE41:
      LDA     #$28
      STA     BackgroundCHR1
      LDA     #$2A
      STA     BackgroundCHR2
      RTS

; End of function sub_BANKF_FE41

; =============== S U B	R O U T	I N E =======================================

LoadCelebrationSceneBackgroundCHR:
      LDA     #$38
      STA     BackgroundCHR1
      LDA     #$3A
      STA     BackgroundCHR2
      RTS

; End of function LoadCelebrationSceneBackgroundCHR

; =============== S U B	R O U T	I N E =======================================

LoadCharacterSelectCHRBanks:
      LDA     #$30
      STA     SpriteCHR1
      LDA     #$2C
      STA     BackgroundCHR1
      LDA     #$2E
      STA     BackgroundCHR2
      RTS

; End of function LoadCharacterSelectCHRBanks

; ---------------------------------------------------------------------------
TitleCardCHRBanks:
	  .BYTE	$40, $42, $40, $44, $40, $42, $46     ; =============== S U B	R O U T	I N E =======================================

ChangeTitleCardCHR:
      LDY     CurrentWorld
      LDA     TitleCardCHRBanks,Y
      STA     BackgroundCHR2
      RTS

; End of function ChangeTitleCardCHR

; =============== S U B	R O U T	I N E =======================================

LoadBonusChanceCHRBanks:
      LDA     #$34
      STA     BackgroundCHR1
      LDA     #$36
      STA     BackgroundCHR2
      RTS

; End of function LoadBonusChanceCHRBanks

; =============== S U B	R O U T	I N E =======================================

LoadMarioSleepingCHRBanks:
      LDY     #$48
      STY     SpriteCHR1
      INY
      STY     SpriteCHR2
      LDA     #$50
      STA     BackgroundCHR1
      LDA     #$52
      STA     BackgroundCHR2
      RTS

; End of function LoadMarioSleepingCHRBanks

; ---------------------------------------------------------------------------
; [000000B9 BYTES: BEGIN OF AREA UNUSED-BANKF:FE97. PRESS KEYPAD "-" TO	COLLAPSE]
_unused_BANKF_FE97:
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
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF; $B0
; [000000B9 BYTES: END OF AREA UNUSED-BANKF:FE97. PRESS	KEYPAD "-" TO COLLAPSE]

; =============== S U B	R O U T	I N E =======================================

      ;	public RESET
RESET:
      SEI					  ; This code is called	when the NES is	reset.
      CLD
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable0000|PPUCtrl_SpriteSize8x8|PPUControl_NMIDisabled
      STA     PPUCTRL
      LDX     #$FF				  ; Reset stack	pointer
      TXS

loc_BANKF_FF5A:
      LDA     PPUSTATUS				  ; Wait for VBlank
      AND     #PPUStatus_VBlankHit
      BEQ     loc_BANKF_FF5A

loc_BANKF_FF61:
      LDA     PPUSTATUS				  ; Wait for a second VBlank
      BPL     loc_BANKF_FF61

      LDA     #0
      STA     $A000
      LDA     #$80
      STA     $A001
      JMP     StartGame

; End of function RESET

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_FF73:
      LDY     #5

loc_BANKF_FF75:
      TYA
      ORA     #$80
      STA     $8000
      LDA     BackgroundCHR1,Y
      STA     $8001
      DEY
      BPL     loc_BANKF_FF75

      RTS

; End of function sub_BANKF_FF73

; =============== S U B	R O U T	I N E =======================================

ChangeMappedPRGBank:
      STA     MMC3PRGBankTemp			  ; See	below comment.
						  ; Calling this one will save the changed bank
						  ; to RAM, so if something uses the below version
						  ; the	original bank set with this can	be restored.

; End of function ChangeMappedPRGBank

; =============== S U B	R O U T	I N E =======================================

ChangeMappedPRGBankWithoutSaving:
      ASL     A					  ; Any	call to	this sub switches the lower
						  ; two	banks together.	e.g.:
						  ; LDA	0 JSR Change...	= Bank 0/1
						  ; LDA	1 JSR Change...	= Bank 2/3
						  ; etc.
						  ;
						  ; This version changes the bank numbers without
						  ; saving the change to RAM, so the previous bank
						  ; can	be recalled later (mostly for temporary	switches,
						  ; like music handling	and such)
      PHA
      LDA     #$86
      STA     $8000
      PLA
      STA     $8001				  ; Change first bank
      ORA     #1				  ; Use	the bank right after this one next
      PHA
      LDA     #$87
      STA     $8000
      PLA
      STA     $8001				  ; Change second bank
      RTS

; End of function ChangeMappedPRGBankWithoutSaving

; =============== S U B	R O U T	I N E =======================================

sub_BANKF_FFA0:
      STA     $A000
      RTS

; End of function sub_BANKF_FFA0

; ---------------------------------------------------------------------------
; [00000047 BYTES: BEGIN OF AREA UNUSED-BANKF:FFA4. PRESS KEYPAD "-" TO	COLLAPSE]
_unused_BANKF_FFA4:
	  .BYTE $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF	  ; $40
; [00000047 BYTES: END OF AREA UNUSED-BANKF:FFA4. PRESS	KEYPAD "-" TO COLLAPSE]
UnusedTextZELDA:
	  .BYTE 'ZELDA'                     ; Not used; leftover part of FamicomBox cart title?
IRQ:
	    .BYTE $DF
						  ; Note that this is NOT CODE.
						  ; If the NES actually	hits a BRK,
						  ; the	game will probably just	explode.
						  ; If you wanted, you could write
						  ; some sort of crash handler though.
      .BYTE $E6
      .BYTE   0
      .BYTE   0
      .BYTE $38	; 8
      .BYTE   4
      .BYTE   1
      .BYTE   4
      .BYTE   1
      .BYTE $BE
NESVectorTables:
	  .WORD NMI			  ; Vectors for	the NES	CPU. These should ALWAYS be at $FFFA!
						  ; Add	a .pad or .base	before here if you change code above.
						  ; NMI	= VBlank, RESET	= ...well, reset.
						  ; IRQ	is not used, but you could if you wanted.
      .WORD RESET
      .WORD IRQ
; end of 'BANKF'
; End