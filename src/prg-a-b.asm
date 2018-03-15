
      ;.segment	BANKA
;       *	=  $8000
World1thru6TitleCard:
	  .BYTE $FB,	$FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB,	$FB, $FB, $FB, $FB, $FB, $FB, $FB
      .BYTE $FB, $FB, $B1, $B3,	$FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1,	$FB, $FB, $FB, $FB; $10	; This title card is used for every world
      .BYTE $FB, $FB, $B4, $B5,	$FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8,	$BA, $BC, $FB, $FB; $20	; from 1 to 6. The only	difference is
      .BYTE $FB, $FB, $B4, $B5,	$FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9,	$BB, $BD, $FB, $FB; $30	; the loaded CHR banks.
      .BYTE $FB, $FB, $B4, $B5,	$FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9,	$BB, $BD, $FB, $FB; $40
      .BYTE $FB, $FB, $B4, $B5,	$C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9,	$BB, $BD, $FB, $FB; $50
      .BYTE $CA, $CC, $CA, $CC,	$CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC,	$CA, $CC, $CA, $CC; $60
      .BYTE $CB, $CD, $CB, $CD,	$CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD,	$CB, $CD, $CB, $CD; $70
      .BYTE $CE, $CF, $CE, $CF,	$CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF,	$CE, $CF, $CE, $CF; $80
      .BYTE $CF, $CE, $CF, $CE,	$CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE,	$CF, $CE, $CF, $CE; $90
World7TitleCard:
	  .BYTE $FB, $FB,	$B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB,	$FB, $FB, $FB, $FB, $FB, $FB
      .BYTE $FB, $FB, $B1, $B3,	$FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1,	$FB, $FB, $FB, $FB; $10	; This one is the special one used for World 7,
      .BYTE $FB, $FB, $B1, $B3,	$FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8,	$BA, $BC, $FB, $FB; $20	; if you couldn't guess
      .BYTE $FB, $FB, $B1, $B3,	$FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9,	$BB, $BD, $FB, $FB; $30
      .BYTE $FB, $FB, $B1, $B3,	$FB, $FB, $FB, $FB, $CA, $FC, $FC, $FC,	$FC, $CC, $FB, $FB; $40
      .BYTE $FB, $FB, $B1, $B3,	$C0, $C1, $FB, $FB, $CA, $FC, $FC, $FC,	$FC, $CC, $FB, $FB; $50
      .BYTE $A8, $AC, $AA, $AC,	$AA, $AC, $AA, $AC, $AA, $AC, $AA, $AC,	$AA, $AC, $AA, $AE; $60
      .BYTE $A9, $AD, $AB, $AD,	$AB, $AD, $AB, $AD, $AB, $AD, $AB, $AD,	$AB, $AD, $AB, $AF; $70
      .BYTE $FB, $FB, $FB, $FB,	$FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB,	$FB, $FB, $FB, $FB; $80
      .BYTE $FB, $FB, $FB, $FB,	$FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB,	$FB, $FB, $FB, $FB; $90
BonusChanceLayout:
	  .BYTE	$20,0,$60,$FD			      
      .BYTE $20,$20,$60,$FD			  
      .BYTE $20,$40,$60,$FD			  
      .BYTE $20,$60,$60,$FD			  
      .BYTE $23,$40,$60,$FD			  
      .BYTE $23,$60,$60,$FD			  
      .BYTE $23,$80,$60,$FD			  
      .BYTE $23,$A0,$60,$FD			  
      .BYTE $20,$80,$D6,$FD			  
      .BYTE $20,$81,$D6,$FD			  
      .BYTE $20,$82,$D6,$FD			  
      .BYTE $20,$9D,$D6,$FD			  
      .BYTE $20,$9E,$D6,$FD			  
      .BYTE $20,$9F,$D6,$FD			  
      .BYTE $20,$68,$10,$48,$4A,$4C,$4E,$50,$51,$52,$53,$54,$55,$56,$57
      .BYTE $58,$5A,$5C,$5E			  ; $F
      .BYTE $20,$83,9,$FD,$FD,$22,$23,$24,$49,$4B,$4D,$4F
      .BYTE $20,$94,9,$59,$5B,$5D,$5F,$2E,$2F,$30,$FD,$FD
      .BYTE $20,$A3,4,$FD,$25,$26,$27		  
      .BYTE $20,$B9,4,$31,$32,$33,$FD		  
      .BYTE $20,$C3,4,$FD,$28,$29,$2A		  
      .BYTE $20,$D9,4,$34,$35,$36,$FD		  
      .BYTE $20,$E3,3,$2B,$2C,$2D		  
      .BYTE $20,$FA,3,$37,$38,$39		  
      .BYTE $21,3,2,$3A,$3B			  
      .BYTE $21,$1B,2,$40,$41			  
      .BYTE $21,$23,$D0,$3C			  
      .BYTE $21,$3C,$D0,$42			  
      .BYTE $22,2,2,$3E,$3F			  
      .BYTE $22,$1C,2,$61,$62			  
      .BYTE $22,$22,2,$43,$44			  
      .BYTE $22,$3C,2,$63,$64			  
      .BYTE $22,$43,1,$45			  
      .BYTE $22,$5C,1,$65			  
      .BYTE $22,$C4,2,$A6,$A8			  
      .BYTE $22,$E4,2,$A7,$A9			  
      .BYTE $22,$FA,4,$80,$82,$88,$8A		  
      .BYTE $23,4,2,$90,$92			  
      .BYTE $23,$14,2,$9E,$A0			  
      .BYTE $23,$1A,4,$81,$83,$89,$8B		  
      .BYTE $23,$23,3,$46,$91,$93		  
      .BYTE $23,$2A,2,$A2,$A4			  
      .BYTE $23,$2E,$10,$67,$6C,$6E,$70,$72,$69,$9F,$A1,$75,$98,$9A,$FB
      .BYTE $84,$86,$8C,$8E			  ; $F
BonusChanceLayout_:
	  .BYTE $23,$43,$1B,$47,$94,$96,$74,$74,$74,$74,$A3,$A5,$74,$66,$68
      .BYTE $6D,$6F,$71,$73,$6A,$6B,$74,$74,$99,$9B,$74,$85,$87,$8D,$8F; $F ; This is still part of the	original, but used
						  ; to copy data $100 bytes in in this disassembly
						  ; @TODO Fix later
      .BYTE $23,$64,5,$95,$97,$FD,$AA,$AB	  
      .BYTE $23,$77,5,$9C,$9D,$AA,$AB,$AB	  
      .BYTE $23,$89,2,$AA,$AB			  
      .BYTE $20,$C9,$E,$78,$AC,$B0,$B4,$B7,$BA,$FB,$BC,$BE,$C1,$C4,$C7
      .BYTE $CB,$7C				  ; $F
      .BYTE $20,$E8,$10,$1C,$79,$AD,$B1,$B5,$B8,$BB,$FB,$BD,$BF,$C2,$C5
      .BYTE $C8,$CC,$7D,$1E			  ; $F
      .BYTE $21,8,$10,$1D,$7A,$AE,$B2,$B6,$B9,$FB,$FB,$FB,$C0,$C3,$C6
      .BYTE $C9,$CD,$7E,$1F			  ; $F
      .BYTE $21,$29,3,$7B,$AF,$B3		  
      .BYTE $21,$34,3,$CA,$CE,$7F		  
      .BYTE $21,$6A,$C,$14,$10,$10,$16,$14,$10,$10,$16,$14,$10,$10,$16
      .BYTE $21,$8A,$C,$11,$FC,$FC,$12,$11,$FC,$FC,$12,$11,$FC,$FC,$12
      .BYTE $21,$AA,$C,$11,$FC,$FC,$12,$11,$FC,$FC,$12,$11,$FC,$FC,$12
      .BYTE $21,$CA,$C,$15,$13,$13,$17,$15,$13,$13,$17,$15,$13,$13,$17
      .BYTE $22,$D,2,$18,$1A			  
      .BYTE $22,$2D,2,$19,$1B			  
      .BYTE $23,$D2,4,$80,$A0,$A0,$20		  
      .BYTE $23,$DA,4,$88,$AA,$AA,$22		  
      .BYTE $23,$E4,1,$A			  
      .BYTE $23,$EA,5,$A0,$A0,$A0,$A0,$20	  
      .BYTE 0

; =============== S U B	R O U T	I N E =======================================

CopyBonusChanceLayoutToRAM:
      LDY     #0				  ; This copies	the bonus chance layout	from
						  ; ROM	into some area of save RAM...
						  ; including some extra data (like this code)
						  ; This section of RAM	is never used for anything else,
						  ; so in theory you could free	that by	just...
						  ; not	doing this.

loc_BANKA_8312:
      LDA     BonusChanceLayout,Y		  ; Blindly copy $100 bytes from $8140 to $7400
      STA     BonusChanceLayoutRAM,Y
      DEY
      BNE     loc_BANKA_8312

      LDY     #0

loc_BANKA_831D:
      LDA     BonusChanceLayout_+7,Y		  ; Blindly copy $100 more bytes from $8240 to $7500
						  ; That range includes	this code! clap. clap.
      STA     BonusChanceLayoutRAM2,Y
      DEY
      BNE     loc_BANKA_831D

      RTS

; End of function CopyBonusChanceLayoutToRAM

; =============== S U B	R O U T	I N E =======================================

DrawTitleCardWorldImage:
      LDA     CurrentWorld
      CMP     #6
      BEQ     loc_BANKA_8392			  ; Special case for World 7's title card

      LDA     #$25
      STA     byte_RAM_0
      LDA     #$C8
      STA     byte_RAM_1
      LDY     #0

loc_BANKA_8338:
      LDX     #$F
      LDA     PPUSTATUS
      LDA     byte_RAM_0
      STA     PPUADDR

loc_BANKA_8342:
      LDA     byte_RAM_1
      STA     PPUADDR

loc_BANKA_8347:
      LDA     World1thru6TitleCard,Y
      STA     PPUDATA
      INY
      DEX
      BPL     loc_BANKA_8347

      CPY     #$A0
      BCS     loc_BANKA_8364

      LDA     byte_RAM_1
      ADC     #$20
      STA     byte_RAM_1
      LDA     byte_RAM_0
      ADC     #0
      STA     byte_RAM_0
      JMP     loc_BANKA_8338

; ---------------------------------------------------------------------------

loc_BANKA_8364:
      LDA     CurrentWorld
      CMP     #1
      BEQ     loc_BANKA_8371

      CMP     #5
      BEQ     loc_BANKA_8371

      BNE     loc_BANKA_8389

loc_BANKA_8371:
      AND     #$80
      BNE     loc_BANKA_8389

      LDA     #$26
      STA     byte_RAM_0
      LDA     #$88
      STA     byte_RAM_1
      LDA     CurrentWorld
      ORA     #$80
      STA     CurrentWorld
      LDY     #$80
      BNE     loc_BANKA_8338

loc_BANKA_8389:
      LDA     CurrentWorld
      AND     #$F
      STA     CurrentWorld
      RTS

; ---------------------------------------------------------------------------

loc_BANKA_8392:
      LDA     #$25
      STA     byte_RAM_0
      LDA     #$C8
      STA     byte_RAM_1
      LDY     #0

loc_BANKA_839C:
      LDX     #$F
      LDA     PPUSTATUS
      LDA     byte_RAM_0
      STA     PPUADDR
      LDA     byte_RAM_1
      STA     PPUADDR

loc_BANKA_83AB:
      LDA     World7TitleCard,Y
      STA     PPUDATA
      INY
      DEX
      BPL     loc_BANKA_83AB

      CPY     #$A0
      BCS     locret_BANKA_83C8

      LDA     byte_RAM_1
      ADC     #$20
      STA     byte_RAM_1
      LDA     byte_RAM_0
      ADC     #0
      STA     byte_RAM_0
      JMP     loc_BANKA_839C

; ---------------------------------------------------------------------------

locret_BANKA_83C8:
      RTS

; End of function DrawTitleCardWorldImage

; ---------------------------------------------------------------------------
StatOffsets:
	  .BYTE 0
						  ; @TODO Assembler update: (MarioStats	- $)
      .BYTE $45
      .BYTE $17
      .BYTE $2E
MarioStats:
	  .BYTE   0

      .BYTE   4
      .BYTE   2
      .BYTE   1
      .BYTE   4
      .BYTE   7
      .BYTE $B0
      .BYTE $B0
      .BYTE $98
      .BYTE $98
      .BYTE $A6
      .BYTE $AA
      .BYTE $E0
      .BYTE   0
      .BYTE   7
      .BYTE   4
      .BYTE   8
      .BYTE $18
      .BYTE $18
      .BYTE   4
      .BYTE $E8
      .BYTE $E8
      .BYTE $FC
ToadStats:
	  .BYTE	  0
      .BYTE   1
      .BYTE   1
      .BYTE   1
      .BYTE   1
      .BYTE   2
      .BYTE $B2
      .BYTE $B2
      .BYTE $98
      .BYTE $98
      .BYTE $AD
      .BYTE $AD
      .BYTE $E0
      .BYTE   0
      .BYTE   7
      .BYTE   4
      .BYTE   8
      .BYTE $18
      .BYTE $1D
      .BYTE   4
      .BYTE $E8
      .BYTE $E3
      .BYTE $FC
LuigiStats:
	  .BYTE   0
      .BYTE   4
      .BYTE   2
      .BYTE   1
      .BYTE   4
      .BYTE   7
      .BYTE $D6
      .BYTE $D6
      .BYTE $C9
      .BYTE $C9
      .BYTE $D0
      .BYTE $D4
      .BYTE $E0
      .BYTE   0
      .BYTE   2
      .BYTE   1
      .BYTE   8
      .BYTE $18
      .BYTE $16
      .BYTE   4
      .BYTE $E8
      .BYTE $EA
      .BYTE $FC
PrincessStats:
	  .BYTE   0
      .BYTE   6
      .BYTE   4
      .BYTE   2
      .BYTE   6
      .BYTE  $C
      .BYTE $B3
      .BYTE $B3
      .BYTE $98
      .BYTE $98
      .BYTE $AC
      .BYTE $B3
      .BYTE $E0
      .BYTE $3C	; <				  ; Float timer
      .BYTE   7
      .BYTE   4
      .BYTE   8
      .BYTE $18
      .BYTE $15
      .BYTE   4
      .BYTE $E8
      .BYTE $EB
      .BYTE $FC
MarioPalette:
	  .BYTE $F,1,$16,$27				 
PrincessPalette:
	  .BYTE $F,6,$25,$36			    
ToadPalette:
	  .BYTE $F,1,$30,$27				
LuigiPalette:
	  .BYTE $F,1,$2A,$36				 
MysteryData14439:
	  .BYTE $DF

      .BYTE $EF
      .BYTE $F7
      .BYTE $FB
      .BYTE 0
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $AF
      .BYTE $D7
      .BYTE $EB
      .BYTE $F5
      .BYTE $FB
      .BYTE $F7
      .BYTE $EF
      .BYTE $DF
      .BYTE 0
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $F5
      .BYTE $EB
      .BYTE $D7
      .BYTE $AF

; =============== S U B	R O U T	I N E =======================================

CopyCharacterStatsAndStuff:
      LDX     CurrentCharacter			  ; This copies	the selected character's stats
						  ; into memory	for use	later, but also	a bunch
						  ; of other unrelated crap like the
						  ; Bonus Chance slot reels (???) and
						  ; god	knows what else.
      LDY     StatOffsets,X
      LDX     #0

loc_BANKA_8458:
      LDA     MarioStats,Y

loc_BANKA_845B:
      STA     PickupSpeedAnimation,X
      INY
      INX
      CPX     #$17
      BCC     loc_BANKA_8458

      LDA     CurrentCharacter
      ASL     A
      ASL     A
      TAY
      LDX     #0

loc_BANKA_846B:
      LDA     MarioPalette,Y
      STA     unk_RAM_637,X
      INY
      INX
      CPX     #4
      BCC     loc_BANKA_846B

      LDY     #$4C

loc_BANKA_8479:
      LDA     PlayerSelectPalettes,Y
      STA     PPUBuffer_55F,Y
      DEY
      CPY     #$FF
      BNE     loc_BANKA_8479

      LDY     #$B6

loc_BANKA_8486:
      LDA     BonusChanceReel1Order,Y
      STA     SlotMachineReelOrder1RAM,Y
      DEY
      CPY     #$FF

loc_BANKA_848F:
      BNE     loc_BANKA_8486

loc_BANKA_8491:
      LDY     #$63

loc_BANKA_8493:
      LDA     Text_Unknown5,Y
      STA     PPUBuffer_7168,Y
      DEY
      CPY     #$FF
      BNE     loc_BANKA_8493

      LDY     #$17

loc_BANKA_84A0:
      LDA     MysteryData14439,Y
      STA     unk_RAM_7150,Y
      DEY
      BPL     loc_BANKA_84A0

      LDY     #$4F

loc_BANKA_84AB:
      LDA     byte_BANKF_F099,Y
      STA     unk_RAM_7100,Y
      DEY
      BPL     loc_BANKA_84AB

      LDY     #3

loc_BANKA_84B6:
      LDA     byte_BANKA_84E1,Y
      STA     byte_RAM_71CC,Y
      DEY
      BPL     loc_BANKA_84B6

      LDY     #$49

loc_BANKA_84C1:
      LDA     byte_BANKF_F607,Y
      STA     unk_RAM_71D1,Y
      DEY
      BPL     loc_BANKA_84C1

      LDY     #$20

loc_BANKA_84CC:
      LDA     byte_BANKF_FA7D,Y
      STA     PPUBuffer_721B,Y
      DEY
      BPL     loc_BANKA_84CC

      LDY     #6

loc_BANKA_84D7:
      LDA     byte_BANKA_84E5,Y
      STA     unk_RAM_7265,Y
      DEY
      BPL     loc_BANKA_84D7

      RTS

; End of function CopyCharacterStatsAndStuff

; ---------------------------------------------------------------------------
byte_BANKA_84E1:
	  .BYTE 0

      .BYTE 1
      .BYTE $FF
      .BYTE 0
byte_BANKA_84E5:
	  .BYTE 0

      .BYTE $E0
      .BYTE $FF
      .BYTE $D0
      .BYTE 0
      .BYTE $E0
      .BYTE $FF
PlayerSelectPalettes:
	  .BYTE $3F,0,$20,$F				 
      .BYTE $28,$16,6,$F			  ; 4
      .BYTE $30,$12,$16,$F			  ; 8
      .BYTE $30,$16,$12,$F			  ; $C
      .BYTE $30,$12,$16,$F			  ; $10
      .BYTE $22,$12,1,$F			  ; $14
      .BYTE $22,$12,1,$F			  ; $18
      .BYTE $22,$12,1,$F			  ; $1C
      .BYTE $22,$12,1,0				  ; $20
BonusChanceText_X_1:
	  .BYTE $22,$30,3,$EA,$FB,$D1			
BonusChanceText_EXTRA_LIFE_1:
	  .BYTE $22,$C9,$F,$DE,$F1,$ED,$EB,$DA,$FB,$E5,$E2,$DF,$DE,$F9,$F9
      .BYTE $F9,$FB,$D1,0			  ; $F
BonusChanceBackgroundPalettes:
	  .BYTE $F,$27,$17,7			  
      .BYTE $F,$37,$16,$12			  ; 4
      .BYTE $F,$30,$10,0			  ; 8
      .BYTE $F,$21,$12,1			  ; $C
BonusChanceReel1Order:
	  .BYTE Slot_Snifit				  
      .BYTE Slot_Turnip				  ; 1 ;	Graphics exist for a mushroom (not used)
      .BYTE Slot_Star				  ; 2
      .BYTE Slot_Turnip				  ; 3
      .BYTE Slot_Snifit				  ; 4
      .BYTE Slot_Star				  ; 5
      .BYTE Slot_Cherry				  ; 6
      .BYTE Slot_Turnip				  ; 7
BonusChanceReel2Order:
	  .BYTE Slot_Star				  
      .BYTE Slot_Snifit				  ; 1
      .BYTE Slot_Cherry				  ; 2
      .BYTE Slot_Snifit				  ; 3
      .BYTE Slot_Turnip				  ; 4
      .BYTE Slot_Star				  ; 5
      .BYTE Slot_Snifit				  ; 6
      .BYTE Slot_Turnip				  ; 7
BonusChanceReel3Order:
	  .BYTE Slot_Star				  
      .BYTE Slot_Snifit				  ; 1
      .BYTE Slot_Star				  ; 2
      .BYTE Slot_Turnip				  ; 3
      .BYTE Slot_Star				  ; 4
      .BYTE Slot_Cherry				  ; 5
      .BYTE Slot_Turnip				  ; 6
      .BYTE Slot_Snifit				  ; 7
BonusChanceUnusedCoinSprite:
	  .BYTE $F8,$19,1,$60,$F8,$1B,1,$68		
BonusChanceUnusedImajinHead:
	  .BYTE $CB,$B0,0,$A0,$CB,$B0,$40,$A8		
BonusChanceUnusedLinaHead:
	  .BYTE	$CB,$B2,0,$A0,$CB,$B2,$40,$A8	      
BonusChanceUnusedMamaHead:
	  .BYTE	$CB,$B6,0,$A0,$CB,$B6,$40,$A8	      
BonusChanceUnusedPapaHead:
	  .BYTE	$CB,$B4,0,$A0,$CB,$B4,$40,$A8	      
BonusChanceUnused_Blank20C6:
	  .BYTE $20,$C6,$14,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB
      .BYTE $FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,0	  ; $F
BonusChanceText_NO_BONUS:
	  .BYTE $22,$86,$14,$FB,$FB,$FB,$FB,$FB,$FB,$E7,$E8,$FB,$DB,$E8,$E7
      .BYTE $EE,$EC,$FB,$FB,$FB,$FB,$FB,$FB,0	  ; $F
BonusChanceText_PUSH_A_BUTTON:
	  .BYTE $22,$89,$E,$E9,$EE,$EC,$E1,$FB,$E,$F,$FB,$DB,$EE,$ED,$ED,$E8
      .BYTE $E7,0				  ; $10
BonusChanceText_PLAYER_1UP:
	  .BYTE $22,$8B,$B,$E9,$E5,$DA,$F2,$DE,$EB,$FB,$FB,$D1,$EE,$E9,0
Text_PAUSE:
	  .BYTE $25,$ED,5,$E9,$DA,$EE,$EC,$DE	       
Text_Unknown:
	  .BYTE $27,$DB,2,$AA,$AA,0			 
Text_Unknown2:
	  .BYTE $22,$86,$54,$FB,0			  
Text_Unknown3:
	  .BYTE $22,$AA,$4D,$FB,0			  
Text_Unknown4:
	  .BYTE $22,$EB,$4B,$FB,0			  
Text_PAUSE_Erase:
	  .BYTE $25,$ED,5,$FB,$FB,$FB,$FB,$FB,0	     
Text_Unknown5:
	  .BYTE $25,$E,7,$FB,$FB,$FB,$FB,$FB,$FB,$FB  ; This one is	actually used, just not	sure what for
Text_WORLD_1_1:
	  .BYTE $24,$CA,$B,$FB,$F0,$E8,$EB,$E5,$DD,$FB,$FB,$D1,$F3,$D1
Text_EXTRA_LIFE_0:
	  .BYTE	$23,$48,$10,$DE,$F1,$ED,$EB,$DA,$FB,$E5,$E2,$DF,$DE,$F9,$F9
      .BYTE $F9,$FB,$FB,$D0,0			  ; $F
Text_WARP:
	  .BYTE	$21,$8E,4,$F0,$DA,$EB,$E9	      
Text_WORLD_1:
	  .BYTE $22,$C,9,$FB,$F0,$E8,$EB,$E5,$DD,$FB,$FB,$D1,0; Doki Doki Panic pseudo-leftover
						  ; This actually has extra spaces on either end:
						  ; "-WORLD-" ... It originally	said "CHAPTER"
Text_Unknown6:
	  .BYTE $21,$6A,1,$FB			  
Text_Unknown7:
	  .BYTE $21,$AA,1,$FB,0			  
Text_Unknown8:
	  .BYTE $21,$97,$C6,$FB,0			  
UnusedText_THANK_YOU:
	  .BYTE $21,$C,9,$ED,$E1,$3A,$E7,$E4,$FB,$F2,$E8,$EE
UnusedText_Blank214D:
	  .BYTE $21,$4D,6,$FB,$FB,$FB,$FB,$FB,$FB,0	 ; The rest of this bank	pair is	empty


; -------------------------------------------


; [00002000 BYTES: END OF AREA UNUSED-BANKB:A000. PRESS	KEYPAD "-" TO COLLAPSE]
; ===========================================================================

