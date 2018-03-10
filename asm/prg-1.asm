
      ;.segment	BANK1
;       *	=  $A000
; [00000200 BYTES: BEGIN OF AREA UNUSED-BANK1_A000. PRESS KEYPAD "-" TO	COLLAPSE]
byte_BANK1_A000:
	  .BYTE $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF
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
; [00000200 BYTES: END OF AREA UNUSED-BANK1_A000. PRESS	KEYPAD "-" TO COLLAPSE]
EndingPPUDataPointers:
	  .WORD PPUBuffer_301

      .WORD EndingCorkJarRoom
      .WORD EndingCelebrationCeilingTextAndPodium
      .WORD EndingCelebrationFloorAndSubconParade
      .WORD EndingCelebrationPaletteFade1
      .WORD EndingCelebrationPaletteFade2
      .WORD EndingCelebrationPaletteFade3
      .WORD EndingCelebrationSubconStandStill
      .WORD EndingCelebrationUnusedText_THE_END
      .WORD EndingCelebrationText_MARIO
      .WORD EndingCelebrationText_PRINCESS
      .WORD EndingCelebrationText_TOAD
      .WORD EndingCelebrationText_LUIGI

; =============== S U B	R O U T	I N E =======================================

WaitForNMI_Ending_TurnOffPPU:
      LDA     #0
      BEQ     loc_BANK1_A220

; End of function WaitForNMI_Ending_TurnOffPPU

; =============== S U B	R O U T	I N E =======================================

WaitForNMI_Ending_TurnOnPPU:
      LDA     #PPUMask_ShowLeft8Pixels_BG|PPUMask_ShowLeft8Pixels_SPR|PPUMask_ShowBackground|PPUMask_ShowSprites

loc_BANK1_A220:
      STA     PPUMaskMirror

; End of function WaitForNMI_Ending_TurnOnPPU

; =============== S U B	R O U T	I N E =======================================

WaitForNMI_Ending:
      LDA     ScreenUpdateIndex
      ASL     A
      TAX
      LDA     EndingPPUDataPointers,X
      STA     RAM_PPUDataBufferPointer
      LDA     EndingPPUDataPointers+1,X
      STA     RAM_PPUDataBufferPointer+1
      LDA     #0
      STA     NMIWaitFlag

WaitForNMI_EndingLoop:
      LDA     NMIWaitFlag
      BPL     WaitForNMI_EndingLoop

      RTS

; End of function WaitForNMI_Ending

; ---------------------------------------------------------------------------
EndingCorkJarRoom:
	  .BYTE	$20

      .BYTE   0
      .BYTE $9E
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $20
      .BYTE   1
      .BYTE $9E
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $22
      .BYTE   2
      .BYTE $8E
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $22
      .BYTE   3
      .BYTE $8E
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $23
      .BYTE $44
      .BYTE $18
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $23
      .BYTE $64
      .BYTE $18
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $23
      .BYTE $84
      .BYTE $18
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $23
      .BYTE $A4
      .BYTE $18
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $22
      .BYTE $1C
      .BYTE $8E
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $22
      .BYTE $1D
      .BYTE $8E
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
unk_BANK1_A323:
	  .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $20
      .BYTE $1E
      .BYTE $9E
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $20
      .BYTE $1F
      .BYTE $9E
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $73
      .BYTE $72
      .BYTE $22
      .BYTE $C6
      .BYTE $C4
      .BYTE $FC	; ü				  ; fart
      .BYTE $22
      .BYTE $C7
      .BYTE $C4
      .BYTE $FC
      .BYTE $22
      .BYTE $C8
      .BYTE $84
      .BYTE $AD
      .BYTE $AC
      .BYTE $AC
      .BYTE $AC
      .BYTE $22
      .BYTE $E9
      .BYTE $83
      .BYTE $AD
      .BYTE $AC
      .BYTE $AC
      .BYTE $23
      .BYTE  $A
      .BYTE $82
      .BYTE $AD
      .BYTE $AC
      .BYTE $23
      .BYTE $2B
      .BYTE   1
      .BYTE $AD
      .BYTE $22
      .BYTE $90
      .BYTE $84
      .BYTE $88
      .BYTE $89
      .BYTE $89
      .BYTE $8C
      .BYTE $22
      .BYTE $91
      .BYTE $84
      .BYTE $8A
      .BYTE $8B
      .BYTE $8B
      .BYTE $8D
      .BYTE $23
      .BYTE  $E
      .BYTE   6
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $23
      .BYTE $2E
      .BYTE   6
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $23
      .BYTE $C0
      .BYTE $20
      .BYTE $22
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE $88
      .BYTE $22
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE $88
      .BYTE $22
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE $88
      .BYTE $22
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE $88
      .BYTE $23
      .BYTE $E0
      .BYTE $20
      .BYTE $AA
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE $AA
      .BYTE $AA
      .BYTE   0
      .BYTE   0
      .BYTE   0
      .BYTE $11
      .BYTE   0
      .BYTE   0
      .BYTE $AA
      .BYTE $AA
      .BYTE $A0
      .BYTE $A0
      .BYTE $A4
      .BYTE $A5
      .BYTE $A0
      .BYTE $A0
      .BYTE $AA
      .BYTE  $A
      .BYTE  $A
      .BYTE  $A
      .BYTE  $A
      .BYTE  $A
      .BYTE  $A
      .BYTE  $A
      .BYTE  $A
      .BYTE   0
EndingCelebrationUnusedText_THANK_YOU:
	  .BYTE $21
      .BYTE  $C
      .BYTE   9
      .BYTE $ED
      .BYTE $E1
      .BYTE $DA
      .BYTE $E7
      .BYTE $E4
      .BYTE $FB
      .BYTE $F2
      .BYTE $E8
      .BYTE $EE
      .BYTE   0
byte_BANK1_A3FF:
	  .BYTE $30

      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
byte_BANK1_A409:
	  .BYTE $B0

      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $95
byte_BANK1_A413:
	  .BYTE $10

      .BYTE $F4
      .BYTE $C
      .BYTE $E8
      .BYTE $18
      .BYTE $EC
      .BYTE $14
      .BYTE $F8
      .BYTE 8
      .BYTE 0
byte_BANK1_A41D:
	  .BYTE 0

      .BYTE $C4
      .BYTE $C4
      .BYTE $B8
      .BYTE $B8
      .BYTE $A8
      .BYTE $A8
      .BYTE $A0
      .BYTE $A0
      .BYTE 0
byte_BANK1_A427:
	  .BYTE 0

      .BYTE $F0
      .BYTE $E0
      .BYTE $C0
      .BYTE $A0
      .BYTE $80
      .BYTE $60
      .BYTE $40
      .BYTE $20
      .BYTE 0
byte_BANK1_A431:
	  .BYTE 0

byte_BANK1_A432:
	  .BYTE $21

      .BYTE $61
      .BYTE $21
      .BYTE $61
      .BYTE $21
      .BYTE $61
      .BYTE $21
      .BYTE $61
      .BYTE $22

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_A43B:
      JSR     WaitForNMI_Ending_TurnOffPPU

loc_BANK1_A43E:
      JSR     ClearNametables

      LDA     #$40
      STA     StackArea
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      JSR     WaitForNMI_Ending

      LDA     #1
      STA     ScreenUpdateIndex
      JSR     WaitForNMI_Ending

      LDA     #$60
      STA     byte_RAM_83
      LDA     #1
      STA     byte_RAM_9D
      LSR     A
      STA     PlayerState
      STA     byte_RAM_8E
      STA     CrouchJumpTimer
      STA     byte_RAM_E6
      STA     byte_RAM_E5
      STA     byte_RAM_400
      LDX     #9

loc_BANK1_A470:
      LDA     byte_BANK1_A3FF,X
      STA     PlayerXLo,X
      LDA     byte_BANK1_A409,X
      STA     PlayerYLo,X
      LDA     byte_BANK1_A413,X
      STA     PlayerXAccel,X
      LDA     byte_BANK1_A41D,X
      STA     PlayerYAccel,X
      LDA     byte_BANK1_A427,X
      STA     DamageInvulnTime,X
      LDA     byte_BANK1_A431,X

loc_BANK1_A48C:
      STA     byte_RAM_64,X
      DEX
      BPL     loc_BANK1_A470

loc_BANK1_A491:
      JSR     WaitForNMI_Ending_TurnOnPPU

      INC     byte_RAM_10
      JSR     HideAllSprites

      JSR     loc_BANK1_A4C0

      JSR     sub_BANK1_A5DE

      LDA     byte_RAM_83
      BEQ     loc_BANK1_A4B8

      LDA     byte_RAM_10
      AND     #7
      BNE     loc_BANK1_A491

      DEC     byte_RAM_83
      LDA     byte_RAM_83
      CMP     #$25
      BNE     loc_BANK1_A491

      LDY     #Music2_EndingAndCast
      STY     MusicQueue2
      BNE     loc_BANK1_A491

loc_BANK1_A4B8:
      JSR     sub_BANK1_AB90

      LDA     byte_RAM_E6
      BEQ     loc_BANK1_A491

      RTS

; End of function sub_BANK1_A43B

; ---------------------------------------------------------------------------

loc_BANK1_A4C0:
      LDA     byte_RAM_84
      BEQ     loc_BANK1_A4C6

      DEC     byte_RAM_84

loc_BANK1_A4C6:
      LDA     byte_RAM_82
      BEQ     loc_BANK1_A4CC

      DEC     byte_RAM_82

loc_BANK1_A4CC:
      LDA     PlayerXLo
      STA     PlayerPageX
      LDA     PlayerYLo
      STA     PlayerPageY
      JSR     sub_BANKF_F31A

      LDA     PlayerState
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK1_A4E8
      .WORD loc_BANK1_A504
      .WORD loc_BANK1_A530
      .WORD loc_BANK1_A556
      .WORD loc_BANK1_A578
; ---------------------------------------------------------------------------

loc_BANK1_A4E8:
      JSR     sub_BANK0_8D6F

      JSR     sub_BANK0_8A50

      LDA     PlayerXLo
      CMP     #$3E
      BCC     locret_BANK1_A52F

      INC     PlayerState
      INC     byte_RAM_99
      LDA     #SpriteAnimation_Jumping
      STA     PlayerAnimationFrame

loc_BANK1_A4FC:
      LDA     #SoundEffect2_Jump
      STA     SoundEffectQueue2
      JMP     sub_BANK0_8C99

; ---------------------------------------------------------------------------

loc_BANK1_A504:
      JSR     sub_BANK0_8D6F

loc_BANK1_A507:
      JSR     sub_BANK0_8A50

      JSR     sub_BANK1_A596

      JSR     sub_BANK0_8EA4

      LDA     PlayerYAccel
      BMI     locret_BANK1_A52F

      LDA     PlayerYLo
      CMP     #$A0
      BCC     loc_BANK1_A521

      LDA     #$C
      STA     PlayerXAccel
      JMP     loc_BANK1_A4FC

; ---------------------------------------------------------------------------

loc_BANK1_A521:
      CMP     #$75
      BCC     locret_BANK1_A52F

      LDA     PlayerXLo
      CMP     #$70
      BCC     locret_BANK1_A52F

      INC     PlayerState
      DEC     byte_RAM_99

locret_BANK1_A52F:
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_A530:
      JSR     sub_BANK0_8D6F

      JSR     sub_BANK0_8A50

      LDA     PlayerXLo
      CMP     #$80
      BCC     locret_BANK1_A52F

      INC     PlayerState
      INC     HoldingItem
      LDA     #8
      STA     PlayerAnimationFrame
      LDA     #5
      STA     byte_RAM_8E
      LDA     #$28
      STA     byte_RAM_82

locret_BANK1_A54C:
      RTS

; ---------------------------------------------------------------------------
      .BYTE $14
      .BYTE $A
      .BYTE $14
byte_BANK1_A550:
	  .BYTE $A

      .BYTE $1C
      .BYTE $1B
      .BYTE $1E
      .BYTE $1D
      .BYTE $1F
; ---------------------------------------------------------------------------

loc_BANK1_A556:
      LDA     byte_RAM_82
      BNE     locret_BANK1_A577

      DEC     byte_RAM_8E
      BNE     loc_BANK1_A570

      INC     PlayerState
      INC     byte_RAM_99
      LDA     #6
      STA     PlayerAnimationFrame
      LDA     #8
      STA     DPCMQueue

loc_BANK1_A56B:
      LDA     #$A0
      STA     ObjectYAccel+8
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_A570:
      LDY     byte_RAM_8E
      LDA     locret_BANK1_A54C,Y
      STA     byte_RAM_82

locret_BANK1_A577:
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_A578:
      JSR     sub_BANK1_A5A1

loc_BANK1_A57B:
      JSR     sub_BANK1_A596

      JSR     sub_BANK0_8D6F

      JSR     sub_BANK0_8EA4

      LDA     PlayerYAccel
      BMI     locret_BANK1_A591

      LDA     PlayerYLo
      CMP     #$80
      BCC     locret_BANK1_A591

      JMP     sub_BANK0_8C99

; ---------------------------------------------------------------------------

locret_BANK1_A591:
      RTS

; ---------------------------------------------------------------------------
unk_BANK1_A592:
	  .BYTE   4
      .BYTE   4
      .BYTE 4
      .BYTE   1

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_A596:
      LDY     CurrentCharacter
      LDA     unk_BANK1_A592,Y
      CLC
      ADC     PlayerYAccel
      STA     PlayerYAccel
      RTS

; End of function sub_BANK1_A596

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_A5A1:
      LDX     #7

loc_BANK1_A5A3:
      STX     byte_RAM_12
      LDA     unk_RAM_86,X
      BEQ     loc_BANK1_A5B4

      CMP     #1
      BNE     loc_BANK1_A5D8

      LDA     #SoundEffect1_ThrowItem
      STA     SoundEffect1Queue
      BNE     loc_BANK1_A5D8

loc_BANK1_A5B4:
      JSR     sub_BANK1_B948

      LDA     ObjectYAccel,X
      CMP     #8
      BMI     loc_BANK1_A5CC

      LDA     #0
      STA     ObjectXAccel,X
      LDA     #$F9
      STA     ObjectYAccel,X
      LDA     byte_BANK1_A432,X
      EOR     #ObjAttrib_Palette0|ObjAttrib_16x32
      STA     ObjectAttributes,X

loc_BANK1_A5CC:
      LDA     byte_RAM_10
      ASL     A
      AND     #2
      STA     byte_RAM_F
      JSR     sub_BANK1_A60E

      INC     unk_RAM_86,X

loc_BANK1_A5D8:
      DEC     unk_RAM_86,X
      DEX
      BPL     loc_BANK1_A5A3

      RTS

; End of function sub_BANK1_A5A1

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_A5DE:
      LDA     #4
      STA     byte_RAM_F
      LDX     #8
      STX     byte_RAM_12
      JSR     sub_BANK1_A60E

      LDY     byte_RAM_8E
      BNE     loc_BANK1_A5F6

      LDA     ObjectYLo+8
      CMP     #$F0
      BCS     locret_BANK1_A5FE

      JMP     sub_BANK1_B907

; ---------------------------------------------------------------------------

loc_BANK1_A5F6:
      LDA     byte_BANK1_A550,Y
      CLC
      ADC     PlayerYLo
      STA     ObjectYLo+8

locret_BANK1_A5FE:
      RTS

; End of function sub_BANK1_A5DE

; ---------------------------------------------------------------------------
byte_BANK1_A5FF:
	  .BYTE $E8

byte_BANK1_A600:
	  .BYTE $EA

      .BYTE $EC
      .BYTE $EE
      .BYTE $61
      .BYTE $63
byte_BANK1_A605:
	  .BYTE $30

      .BYTE $38
      .BYTE $40
      .BYTE $48
      .BYTE $50
      .BYTE $58
      .BYTE $60
      .BYTE $68
      .BYTE 0

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_A60E:
      LDY     byte_BANK1_A605,X
      LDA     ObjectYLo,X
      STA     SpriteDMAArea,Y
      STA     SpriteDMAArea + $04,Y
      LDA     ObjectXLo,X
      STA     SpriteDMAArea + $03,Y
      CLC
      ADC     #8
      STA     SpriteDMAArea + $07,Y
      LDA     ObjectAttributes,X
      STA     SpriteDMAArea + $02,Y
      STA     SpriteDMAArea + $06,Y
      LDX     byte_RAM_F
      AND     #$40
      BNE     loc_BANK1_A63D

      LDA     byte_BANK1_A5FF,X
      STA     SpriteDMAArea + $01,Y
      LDA     byte_BANK1_A600,X
      BNE     loc_BANK1_A646

loc_BANK1_A63D:
      LDA     byte_BANK1_A600,X
      STA     SpriteDMAArea + $01,Y
      LDA     byte_BANK1_A5FF,X

loc_BANK1_A646:
      STA     SpriteDMAArea + $05,Y
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK1_A60E

; ---------------------------------------------------------------------------
EndingCelebrationCeilingTextAndPodium:
	  .BYTE $20

      .BYTE 0
      .BYTE $20
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
byte_BANK1_A654:
	  .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $20
      .BYTE $20
      .BYTE $20
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
byte_BANK1_A67D:
	  .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $20
      .BYTE $40
      .BYTE $20
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $20
      .BYTE $60
      .BYTE $20
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $20
      .BYTE $88
      .BYTE 1
      .BYTE $5A
      .BYTE $20
      .BYTE $89
      .BYTE $4E
      .BYTE $9A
      .BYTE $20
      .BYTE $97
      .BYTE 1
      .BYTE $5C
      .BYTE $20
      .BYTE $A8
      .BYTE $C3
      .BYTE $9B
      .BYTE $20
      .BYTE $B7
      .BYTE $C3
      .BYTE $9B
      .BYTE $21
      .BYTE 8
      .BYTE 1
      .BYTE $5B
      .BYTE $21
      .BYTE 9
      .BYTE $4E
      .BYTE $9A
      .BYTE $21
      .BYTE $17
      .BYTE 1
      .BYTE $5D
      .BYTE $20
      .BYTE $AB
      .BYTE $B
      .BYTE $DC
      .BYTE $E8
      .BYTE $E7
      .BYTE $ED
      .BYTE $EB
      .BYTE $E2
      .BYTE $DB
      .BYTE $EE
      .BYTE $ED
      .BYTE $E8
      .BYTE $EB
      .BYTE $20
      .BYTE $E3
      .BYTE 4
      .BYTE $40
      .BYTE $42
      .BYTE $44
      .BYTE $46
      .BYTE $20
      .BYTE $F9
      .BYTE 4
      .BYTE $40
      .BYTE $42
      .BYTE $44
      .BYTE $46
      .BYTE $21
      .BYTE $23
      .BYTE $C9
      .BYTE $48
      .BYTE $21
      .BYTE $24
      .BYTE $C9
      .BYTE $49
      .BYTE $21
      .BYTE $25
      .BYTE $C9
      .BYTE $4A
      .BYTE $21
      .BYTE $26
      .BYTE $C9
      .BYTE $4B
byte_BANK1_A724:
	  .BYTE $22
      .BYTE $43
      .BYTE 4
      .BYTE $4C
      .BYTE $4D
      .BYTE $4E
      .BYTE $4F
      .BYTE $21
      .BYTE 3
      .BYTE 4
      .BYTE $41
      .BYTE $43
      .BYTE $45
      .BYTE $47
      .BYTE $21
      .BYTE $19
      .BYTE 4
      .BYTE $41
      .BYTE $43
      .BYTE $45
      .BYTE $47
      .BYTE $21
      .BYTE $39
      .BYTE $C9
      .BYTE $48
      .BYTE $21
      .BYTE $3A
      .BYTE $C9
      .BYTE $49
      .BYTE $21
      .BYTE $3B
      .BYTE $C9
      .BYTE $4A
      .BYTE $21
      .BYTE $3C
      .BYTE $C9
      .BYTE $4B
      .BYTE $22
      .BYTE $59
      .BYTE 4
      .BYTE $4C
      .BYTE $4D
      .BYTE $4E
      .BYTE $4F
      .BYTE $21
      .BYTE $CA
      .BYTE $4C
      .BYTE $54
      .BYTE $21
      .BYTE $EA
      .BYTE $4C
      .BYTE $55
      .BYTE $22
      .BYTE $B
      .BYTE $A
      .BYTE $50
      .BYTE $52
byte_BANK1_A75D:
	  .BYTE $50
      .BYTE $52
      .BYTE $50
      .BYTE $52
      .BYTE $50
      .BYTE $52
      .BYTE $50
      .BYTE $52
      .BYTE $22
      .BYTE $2B
      .BYTE $A
      .BYTE $51
      .BYTE $53
      .BYTE $51
      .BYTE $53
      .BYTE $51
      .BYTE $53
      .BYTE $51
      .BYTE $53
      .BYTE $51
      .BYTE $53
      .BYTE $22
      .BYTE $4C
      .BYTE 2
      .BYTE $3A
      .BYTE $3B
      .BYTE $22
      .BYTE $6C
      .BYTE $C5
      .BYTE $3C
      .BYTE $22
      .BYTE $6D
      .BYTE $C5
      .BYTE $3D
      .BYTE $22
      .BYTE $52
      .BYTE 2
      .BYTE $3A
byte_BANK1_A783:
	  .BYTE $3B
      .BYTE $22
      .BYTE $72
      .BYTE $C5
      .BYTE $3C
      .BYTE $22
      .BYTE $73
      .BYTE $C5
      .BYTE $3D
      .BYTE 0
EndingCelebrationFloorAndSubconParade:
	  .BYTE $23

      .BYTE 0
      .BYTE $20
      .BYTE 0
      .BYTE 2
      .BYTE 8
      .BYTE $A
      .BYTE $C
      .BYTE $E
      .BYTE 4
      .BYTE 6
      .BYTE 8
      .BYTE $A
      .BYTE 4
      .BYTE 6
      .BYTE $C
      .BYTE $E
      .BYTE 4
      .BYTE 6
      .BYTE 8
      .BYTE $A
      .BYTE 0
      .BYTE 2
      .BYTE $C
      .BYTE $E
      .BYTE $C
      .BYTE $E
      .BYTE 0
      .BYTE 2
      .BYTE 4
      .BYTE 6
      .BYTE 4
      .BYTE 6
      .BYTE 8
      .BYTE $A
      .BYTE $23
      .BYTE $20
      .BYTE $20
      .BYTE 1
      .BYTE 3
      .BYTE 9
      .BYTE $B
      .BYTE $D
      .BYTE $F
      .BYTE 5
      .BYTE 7
      .BYTE 9
      .BYTE $B
      .BYTE 5
      .BYTE 7
      .BYTE $D
      .BYTE $F
      .BYTE 5
      .BYTE 7
      .BYTE 9
      .BYTE $B
      .BYTE 1
      .BYTE 3
      .BYTE $D
      .BYTE $F
      .BYTE $D
      .BYTE $F
      .BYTE 1
      .BYTE 3
      .BYTE 5
      .BYTE 7
      .BYTE 5
      .BYTE 7
      .BYTE 9
      .BYTE $B
      .BYTE $27
      .BYTE 0
      .BYTE $20
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $74
      .BYTE $76
      .BYTE $27
      .BYTE $20
      .BYTE $20
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $75
      .BYTE $77
      .BYTE $23
      .BYTE $40
      .BYTE $20
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $23
      .BYTE $60
      .BYTE $20
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $23
      .BYTE $80
      .BYTE $20
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $23
      .BYTE $A0
      .BYTE $20
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $27
      .BYTE $40
      .BYTE $20
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $27
      .BYTE $60
      .BYTE $20
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $27
      .BYTE $80
      .BYTE $20
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
byte_BANK1_A8F2:
	  .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
byte_BANK1_A8FD:
	  .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $27
      .BYTE $A0
      .BYTE $20
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $81
      .BYTE $80
      .BYTE $23
      .BYTE $C0
      .BYTE $48
      .BYTE $AA
      .BYTE $23
      .BYTE $C8
      .BYTE 8
      .BYTE $15
      .BYTE 5
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $15
      .BYTE $45
      .BYTE $23
      .BYTE $D0
      .BYTE $20
      .BYTE $31
      .BYTE 0
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE 0
      .BYTE $44
      .BYTE $33
      .BYTE 0
      .BYTE $A6
      .BYTE $A5
      .BYTE $A5
      .BYTE $A6
      .BYTE 0
      .BYTE $44
      .BYTE $F3
      .BYTE $F0
      .BYTE $59
      .BYTE $AA
      .BYTE $AA
      .BYTE $96
      .BYTE $F0
      .BYTE $74
      .BYTE $DD
      .BYTE $FF
      .BYTE $55
      .BYTE $AA
      .BYTE $AA
      .BYTE $95
      .BYTE $55
      .BYTE $55
      .BYTE $23
      .BYTE $F0
      .BYTE $48
      .BYTE $A5
      .BYTE $23
      .BYTE $F8
      .BYTE $48
      .BYTE $A
      .BYTE $27
      .BYTE $F0
      .BYTE $48
      .BYTE $A5
      .BYTE $27
      .BYTE $F8
      .BYTE $48
      .BYTE $A
      .BYTE 0
EndingCelebrationSubconStandStill:
	  .BYTE	$23

      .BYTE 0
      .BYTE $20
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
byte_BANK1_A97C:
	  .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $70
      .BYTE $72
      .BYTE $23
      .BYTE $20
      .BYTE $20
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE $71
      .BYTE $73
      .BYTE 0
EndingCelebrationUnusedText_THE_END:
	  .BYTE $21
      .BYTE $AC
      .BYTE   7
      .BYTE $ED
      .BYTE $E1
      .BYTE $DE
      .BYTE $FB
      .BYTE $DE
      .BYTE $E7
      .BYTE $DD
      .BYTE   0
EndingCelebrationPaletteFade1:
	  .BYTE $3F
      .BYTE   0
      .BYTE $20
      .BYTE   1
      .BYTE $30	
      .BYTE $21
      .BYTE  $F
      .BYTE   1
      .BYTE $30	
      .BYTE $16
      .BYTE  $F
      .BYTE   1
      .BYTE $28
      .BYTE $18
      .BYTE  $F
      .BYTE   1
      .BYTE $30	
      .BYTE $30	
      .BYTE   1
      .BYTE   1
      .BYTE $27
      .BYTE $16
      .BYTE  $F
      .BYTE   1
      .BYTE $37	; 7
      .BYTE $2A
      .BYTE  $F
      .BYTE   1
      .BYTE $27
      .BYTE $30	
      .BYTE  $F
      .BYTE   1
      .BYTE $36	; 6
      .BYTE $25
      .BYTE  $F
      .BYTE   0
EndingCelebrationPaletteFade2:
	  .BYTE $3F
      .BYTE   0
      .BYTE $20
      .BYTE  $F
      .BYTE $10
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE $10
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE $10
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE $10
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE $10
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE $10
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE $10
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE $10
      .BYTE   0
      .BYTE  $F
      .BYTE   0
EndingCelebrationPaletteFade3:
	  .BYTE $3F
      .BYTE   0
      .BYTE $20
      .BYTE  $F
      .BYTE   0
      .BYTE  $F
unk_BANK1_AA14:
	  .BYTE  $F
      .BYTE  $F
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE  $F
      .BYTE   0
      .BYTE  $F
      .BYTE  $F
      .BYTE   0
byte_BANK1_AA32:
	  .BYTE 4

      .BYTE 5
      .BYTE 6
byte_BANK1_AA35:
	  .BYTE $8C

      .BYTE $FC
      .BYTE $20
      .BYTE $94
byte_BANK1_AA39:
	  .BYTE $4F

      .BYTE $61
      .BYTE $20
      .BYTE $50
      .BYTE $4F
      .BYTE $63
      .BYTE $20
      .BYTE $58
      .BYTE $5F
      .BYTE $65
      .BYTE $20
      .BYTE $50
      .BYTE $5F
      .BYTE $67
      .BYTE $20
      .BYTE $58
      .BYTE $4F
      .BYTE $69
      .BYTE $21
      .BYTE $68
      .BYTE $4F
      .BYTE $6B
      .BYTE $21
      .BYTE $70
      .BYTE $5F
      .BYTE $6D
      .BYTE $21
      .BYTE $68
      .BYTE $5F
      .BYTE $6F
      .BYTE $21
      .BYTE $70
      .BYTE $4F
      .BYTE $83
      .BYTE $22
      .BYTE $88
      .BYTE $4F
      .BYTE $83
      .BYTE $62
      .BYTE $90
      .BYTE $5F
      .BYTE $87
      .BYTE $22
      .BYTE $88
      .BYTE $5F
      .BYTE $87
      .BYTE $62
      .BYTE $90
      .BYTE $4F
      .BYTE $8B
      .BYTE $23
      .BYTE $A0
      .BYTE $4F
      .BYTE $8D
      .BYTE $23
      .BYTE $A8
      .BYTE $5F
      .BYTE $8F
      .BYTE $23
      .BYTE $A0
      .BYTE $5F
      .BYTE $91
      .BYTE $23
      .BYTE $A8

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_AA79:
      JSR     WaitForNMI_Ending_TurnOffPPU

      LDA     #0
      JSR     sub_BANKF_FFA0

      JSR     ClearNametables

      LDA     #$40
      STA     StackArea
      JSR     sub_BANK1_ABBC

      JSR     WaitForNMI_Ending

      LDA     #2
      STA     ScreenUpdateIndex
      JSR     WaitForNMI_Ending

      LDA     #3
      STA     ScreenUpdateIndex
      JSR     WaitForNMI_Ending

      JSR     sub_BANK1_AD40

      JSR     WaitForNMI_Ending

      LDA     #1
      JSR     sub_BANKF_FFA0

      LDY     #3

loc_BANK1_AAAA:
      LDA     byte_BANK1_AA35,Y
      STA     SpriteDMAArea,Y
      DEY

loc_BANK1_AAB1:
      BPL     loc_BANK1_AAAA

      LDA     #0
      STA     byte_RAM_F3
      STA     byte_RAM_E6
      LDY     #$3F

loc_BANK1_AABB:
      LDA     byte_BANK1_AA39,Y
      STA     SpriteDMAArea + $10,Y
      DEY
      BPL     loc_BANK1_AABB

      LDA     #$FF
      STA     PlayerXHi
      LDA     #$A0
      STA     PlayerXLo
      LDA     #8
      STA     PlayerXAccel
      LDA     #1
      STA     IsHorizontalLevel

loc_BANK1_AAD4:
      JSR     WaitForNMI_Ending_TurnOnPPU

      INC     byte_RAM_F3
      INC     byte_RAM_10
      JSR     sub_BANK1_ADF1

      JSR     loc_BANK1_ABCC

      LDA     byte_RAM_E6
      CMP     #3
      BCS     loc_BANK1_AB20

loc_BANK1_AAE7:
      BIT     PPUSTATUS
      BVS     loc_BANK1_AAE7

loc_BANK1_AAEC:
      BIT     PPUSTATUS
      BVC     loc_BANK1_AAEC

      LDX     #2

loc_BANK1_AAF3:
      LDY     #0

loc_BANK1_AAF5:
      LDA     byte_RAM_0
      LDA     byte_RAM_0
      DEY
      BNE     loc_BANK1_AAF5

      DEX
      BNE     loc_BANK1_AAF3

      LDA     PPUSTATUS
      LDA     byte_RAM_F2
      STA     PPUSCROLL
      LDA     #0
      STA     PPUSCROLL
      LDA     byte_RAM_F3
      CMP     #$A
      BCC     loc_BANK1_AB1D

      LDA     #0
      STA     byte_RAM_F3
      LDA     byte_RAM_F2
      SEC

loc_BANK1_AB19:
      SBC     #$30
      STA     byte_RAM_F2

loc_BANK1_AB1D:
      JMP     loc_BANK1_AAD4

; ---------------------------------------------------------------------------

loc_BANK1_AB20:
      LDA     #0
      JSR     sub_BANKF_FFA0

      LDA     #1
      STA     byte_RAM_F2
      LSR     A
      STA     byte_RAM_F3
      STA     byte_RAM_7
      LDA     #7
      STA     ScreenUpdateIndex

loc_BANK1_AB32:
      JSR     WaitForNMI_Ending

      JSR     sub_BANK1_ABBC

      INC     byte_RAM_F3
      JSR     sub_BANK1_ADF1

      JSR     sub_BANK1_AD0C

loc_BANK1_AB40:
      BIT     PPUSTATUS
      BVS     loc_BANK1_AB40

loc_BANK1_AB45:
      BIT     PPUSTATUS
      BVC     loc_BANK1_AB45

      LDX     #2

loc_BANK1_AB4C:
      LDY     #0

loc_BANK1_AB4E:
      LDA     byte_RAM_0
      LDA     byte_RAM_0
      DEY
      BNE     loc_BANK1_AB4E

      DEX
      BNE     loc_BANK1_AB4C

      LDA     #$B0
      ORA     byte_RAM_F2
      STA     PPUCtrlMirror
      STA     PPUCTRL
      LDA     PPUSTATUS
      LDA     #0
      STA     PPUSCROLL
      LDA     #0
      STA     PPUSCROLL
      LDA     byte_RAM_F3
      CMP     #$14
      BCC     loc_BANK1_AB80

      LDA     #0
      STA     byte_RAM_F3
      LDA     byte_RAM_F2
      EOR     #1
      STA     byte_RAM_F2
      INC     byte_RAM_7

loc_BANK1_AB80:
      LDA     byte_RAM_7
      CMP     #$29
      BCC     loc_BANK1_AB32

      JSR     sub_BANK1_AB90

      LDA     byte_RAM_E6
      CMP     #4
      BCC     loc_BANK1_AB32

      RTS

; End of function sub_BANK1_AA79

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_AB90:
      LDA     byte_RAM_10
      AND     #3
      BNE     locret_BANK1_ABA6

      INC     byte_RAM_E5
      LDY     byte_RAM_E5
      CPY     #3
      BCS     loc_BANK1_ABA4

      LDA     byte_BANK1_AA32,Y
      STA     ScreenUpdateIndex
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_ABA4:
      INC     byte_RAM_E6

locret_BANK1_ABA6:
      RTS

; End of function sub_BANK1_AB90

; ---------------------------------------------------------------------------

_code_2BA7:
      LDA     byte_RAM_10
      AND     #3
      BNE     locret_BANK1_ABA6

      DEC     byte_RAM_E5
      LDY     byte_RAM_E5
      LDA     byte_BANK1_AA32,Y
      STA     ScreenUpdateIndex
      TYA
      BNE     locret_BANK1_ABA6

      INC     byte_RAM_E6
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_ABBC:
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      RTS

; End of function sub_BANK1_ABBC

; ---------------------------------------------------------------------------

_code_2BC4:
      LDA     #$30
      STA     PPUCTRL
      STA     PPUCtrlMirror
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_ABCC:
      JSR     sub_BANK1_AD0C

      LDA     byte_RAM_E6
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD _code_2BA7
      .WORD loc_BANK1_AC0A
      .WORD loc_BANK1_AC87
byte_BANK1_ABDA:
	  .BYTE $C0

      .BYTE $C8
      .BYTE $B8
      .BYTE $B8
      .BYTE $C8
      .BYTE $C0
byte_BANK1_ABE0:
	  .BYTE $C0

      .BYTE 8
      .BYTE $E0
      .BYTE $F0
      .BYTE $D0
      .BYTE $E8
byte_BANK1_ABE6:
	  .BYTE $11

      .BYTE $13
      .BYTE $19
      .BYTE $1B
      .BYTE $21
      .BYTE $23
      .BYTE $15
      .BYTE $17
byte_BANK1_ABEE:
	  .BYTE $1D
      .BYTE $1F
      .BYTE $25
      .BYTE $27
byte_BANK1_ABF2:
	  .BYTE 0

      .BYTE 8
      .BYTE $10
      .BYTE $18
      .BYTE $20
      .BYTE $28
      .BYTE 0
      .BYTE 8
      .BYTE $10
      .BYTE $18
      .BYTE $20
      .BYTE $28
byte_BANK1_ABFE:
	  .BYTE 0

      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE $10
; ---------------------------------------------------------------------------

loc_BANK1_AC0A:
      JSR     sub_BANK0_8A50

      LDA     PlayerXHi
      CMP     #1
      BNE     loc_BANK1_AC37

      LDA     PlayerXLo
      CMP     #$20
      BCC     loc_BANK1_AC37

IFDEF _COMPATIBILITY_
	  .db $ee, $e6, $00 ; INC $00E6
ENDIF
IFNDEF _COMPATIBILITY_
      INC     byte_RAM_E6			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF

      LDA     #$A0
      STA     byte_RAM_10
      LDX     #5

loc_BANK1_AC22:
      LDA     #$20
      STA     ObjectXLo,X
      LDA     #$A8

loc_BANK1_AC28:
      STA     ObjectYLo,X
      LDA     byte_BANK1_ABDA,X
      STA     ObjectXAccel,X
      LDA     byte_BANK1_ABE0,X
      STA     ObjectYAccel,X
      DEX
      BPL     loc_BANK1_AC22

loc_BANK1_AC37:
      LDY     #$A0
      LDA     byte_RAM_10
      AND     #$38
      BNE     loc_BANK1_AC40

      DEY

loc_BANK1_AC40:
      AND     #8
      BNE     loc_BANK1_AC45

      DEY

loc_BANK1_AC45:
      STY     PlayerYLo
      LDX     #$B
      LDY     #$70

loc_BANK1_AC4B:
      LDA     PlayerYLo
      CLC
      ADC     byte_BANK1_ABFE,X
      STA     SpriteDMAArea,Y
      LDA     byte_BANK1_ABE6,X
      STA     SpriteDMAArea + $01,Y
      LDA     #1
      STA     SpriteDMAArea + $02,Y
      LDA     PlayerXLo
      CLC
      ADC     byte_BANK1_ABF2,X
      STA     SpriteDMAArea + $03,Y
      LDA     PlayerXHi

loc_BANK1_AC6A:
      ADC     #0
      BEQ     loc_BANK1_AC73

      LDA     #$F0
      STA     SpriteDMAArea,Y

loc_BANK1_AC73:
      INY
      INY
      INY
      INY
      DEX
      BPL     loc_BANK1_AC4B

      RTS

; ---------------------------------------------------------------------------
byte_BANK1_AC7B:
	  .BYTE $39

      .BYTE $35
      .BYTE $37
      .BYTE $35
      .BYTE $37
      .BYTE $39
byte_BANK1_AC81:
	  .BYTE 0

      .BYTE 6
      .BYTE 3
      .BYTE 9
      .BYTE $F
      .BYTE $C
; ---------------------------------------------------------------------------

loc_BANK1_AC87:
      LDA     byte_RAM_10
      BNE     loc_BANK1_ACA4

loc_BANK1_AC8B:
      STA     byte_RAM_40E
      STA     byte_RAM_418
      STA     ObjectXLo+6
      STA     byte_RAM_10
      LDA     #$6F
      STA     ObjectYLo+6
      LDA     #$E6
      STA     ObjectXAccel+6
      LDA     #$DA
      STA     ObjectYAccel+6
IFDEF _COMPATIBILITY_
	  .db $ee, $e6, $00 ; INC $00E6
ENDIF
IFNDEF _COMPATIBILITY_
      INC     byte_RAM_E6			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF


loc_BANK1_ACA4:
      LDX     #5

loc_BANK1_ACA6:
      STX     byte_RAM_12
      JSR     sub_BANK1_B90C

      JSR     sub_BANK1_B907

      LDY     #$F0
      LDA     byte_RAM_10
      BEQ     loc_BANK1_ACC1

      AND     #$F
      CMP     byte_BANK1_AC81,X
      BNE     loc_BANK1_ACC3

      LDA     #$20
      STA     ObjectXLo,X
      LDY     #$A8

loc_BANK1_ACC1:
      STY     ObjectYLo,X

loc_BANK1_ACC3:
      TXA
      ASL     A
      ASL     A
      TAY
      LDA     ObjectXLo,X
      CMP     #$80
      BCS     loc_BANK1_ACD1

      LDA     #$F0
      BNE     loc_BANK1_ACD6

loc_BANK1_ACD1:
      STA     SpriteDMAArea + $73,Y
      LDA     ObjectYLo,X

loc_BANK1_ACD6:
      STA     SpriteDMAArea + $70,Y
      LDA     byte_BANK1_AC7B,X
      STA     SpriteDMAArea + $71,Y
      LDA     #0
      STA     SpriteDMAArea + $72,Y
      DEX
      BPL     loc_BANK1_ACA6

      RTS

; ---------------------------------------------------------------------------
byte_BANK1_ACE8:
	  .BYTE $61

      .BYTE $61
      .BYTE $63
      .BYTE $93
      .BYTE $65
      .BYTE $65
      .BYTE $67
      .BYTE $67
      .BYTE $69
      .BYTE $69
      .BYTE $95
      .BYTE $6B
      .BYTE $6D
      .BYTE $6D
      .BYTE $97
      .BYTE $6F
      .BYTE $83
      .BYTE $85
      .BYTE $83
      .BYTE $85
      .BYTE $87
      .BYTE $89
      .BYTE $87
      .BYTE $89
      .BYTE $8B
      .BYTE $8B
      .BYTE $99
      .BYTE $8D
      .BYTE $8F
      .BYTE $8F
      .BYTE $91
      .BYTE $91
byte_BANK1_AD08:
	  .BYTE 6

      .BYTE $E
      .BYTE $16
      .BYTE $1E

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_AD0C:
      INC     byte_RAM_9B
      LDA     #3
      STA     byte_RAM_0
      LDA     byte_RAM_9B
      STA     byte_RAM_1
      LDY     #$3C

loc_BANK1_AD18:
      LDX     byte_RAM_0
      LDA     byte_BANK1_AD08,X
      TAX
      INC     byte_RAM_1
      LDA     byte_RAM_1
      AND     #$10
      BEQ     loc_BANK1_AD27

      INX

loc_BANK1_AD27:
      LDA     #3
      STA     byte_RAM_2

loc_BANK1_AD2B:
      LDA     byte_BANK1_ACE8,X
      STA     SpriteDMAArea + $11,Y
      DEX
      DEX
      DEY
      DEY
      DEY
      DEY
      DEC     byte_RAM_2
      BPL     loc_BANK1_AD2B

      DEC     byte_RAM_0
      BPL     loc_BANK1_AD18

      RTS

; End of function sub_BANK1_AD0C

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_AD40:
      LDA     #0
      STA     byte_RAM_631
      LDY     #3

loc_BANK1_AD47:
      LDA     CharacterLevelsCompleted,Y
      CMP     byte_RAM_631
      BCC     loc_BANK1_AD55

      LDA     CharacterLevelsCompleted,Y
      STA     byte_RAM_631

loc_BANK1_AD55:
      DEY
      BPL     loc_BANK1_AD47

      LDX     #0
      LDY     #3

loc_BANK1_AD5C:
      LDA     CharacterLevelsCompleted,Y
      CMP     byte_RAM_631
      BNE     loc_BANK1_AD69

      TYA
      STA     unk_RAM_5BE,X
      INX

loc_BANK1_AD69:
      DEY
      BPL     loc_BANK1_AD5C

      DEX
      STX     byte_RAM_5C2
      LDX     #0
      LDA     #$21
      STA     PPUBuffer_301,X
      INX
      LDA     #$2A
      STA     PPUBuffer_301,X
      INX
      LDA     #$C
      STA     PPUBuffer_301,X
      INX
      LDY     #0
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX
      LDA     #$FB
      STA     PPUBuffer_301,X
      INX
      LDY     #3
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX

loc_BANK1_ADB0:
      LDA     #$FB
      STA     PPUBuffer_301,X
      INX
      STA     PPUBuffer_301,X
      INX
      LDY     #2
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX
      LDA     #$FB
      STA     PPUBuffer_301,X
      INX
      LDY     #1
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX
      LDA     #0
      STA     PPUBuffer_301,X
      LDA     #$3C
      STA     byte_RAM_5C4
      RTS

; End of function sub_BANK1_AD40

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_ADF1:
      DEC     byte_RAM_5C4
      BPL     locret_BANK1_AE12

      LDA     #$3C
      STA     byte_RAM_5C4
      LDY     byte_RAM_5C3
      LDA     unk_RAM_5BE,Y
      CLC
      ADC     #9
IFDEF _COMPATIBILITY_
	  .db $8d, $11, $00 ; STA $0011
ENDIF
IFNDEF _COMPATIBILITY_
      STA     ScreenUpdateIndex			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF

      DEC     byte_RAM_5C3
      BPL     locret_BANK1_AE12

      LDA     byte_RAM_5C2
      STA     byte_RAM_5C3

locret_BANK1_AE12:
      RTS

; End of function sub_BANK1_ADF1

; ---------------------------------------------------------------------------
EndingCelebrationText_MARIO:
	  .BYTE $20
      .BYTE $ED
      .BYTE   8
      .BYTE $E6
      .BYTE $DA
      .BYTE $EB
      .BYTE $E2
      .BYTE $E8
      .BYTE $FB
      .BYTE $FB
      .BYTE $FB
      .BYTE   0
EndingCelebrationText_PRINCESS:
	  .BYTE $20
      .BYTE $ED
      .BYTE   8
      .BYTE $E9
      .BYTE $EB
      .BYTE $E2
      .BYTE $E7
      .BYTE $DC
      .BYTE $DE
      .BYTE $EC
      .BYTE $EC
      .BYTE   0
EndingCelebrationText_TOAD:
	  .BYTE $20

      .BYTE $ED
      .BYTE   8
      .BYTE $ED
      .BYTE $E8
      .BYTE $DA
      .BYTE $DD
      .BYTE $FB
      .BYTE $FB
      .BYTE $FB
      .BYTE $FB
      .BYTE   0
EndingCelebrationText_LUIGI:
	  .BYTE $20
      .BYTE $ED
      .BYTE   8
      .BYTE $E5
      .BYTE $EE
      .BYTE $E2
      .BYTE $E0
      .BYTE $E2
      .BYTE $FB
      .BYTE $FB
      .BYTE $FB
      .BYTE   0

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_AE43:
      LDY     #$D0

loc_BANK1_AE45:
      CMP     #$A
      BCC     loc_BANK1_AE4F

      SBC     #$A

loc_BANK1_AE4B:
      INY
      JMP     loc_BANK1_AE45

; ---------------------------------------------------------------------------

loc_BANK1_AE4F:
      ORA     #$D0
      CPY     #$D0
      BNE     loc_BANK1_AE57

      LDY     #$FB

loc_BANK1_AE57:
      STA     byte_RAM_1
      RTS

; End of function sub_BANK1_AE43

; ---------------------------------------------------------------------------
; [00000AA6 BYTES: BEGIN OF AREA UNUSED-BANK1:AE5A. PRESS KEYPAD "-" TO	COLLAPSE]
_empty_2E5A:
	  .BYTE $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF
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
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF	  ; $AA0
; [00000AA6 BYTES: END OF AREA UNUSED-BANK1:AE5A. PRESS	KEYPAD "-" TO COLLAPSE]
MysteryCharacterData3900:
	  .BYTE $FB
      .BYTE $FF
      .BYTE   0
      .BYTE   8
      .BYTE  $C
      .BYTE $18
      .BYTE $1A

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_B907:
      TXA
      CLC
      ADC     #$A
      TAX

; End of function sub_BANK1_B907

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_B90C:
      LDA     ObjectXAccel,X
      CLC
      ADC     unk_RAM_4CC,X
      PHA
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     byte_RAM_1
      PLA
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      CMP     #8
      BCC     loc_BANK1_B924

      ORA     #$F0

loc_BANK1_B924:
      STA     byte_RAM_0
      LDY     #0
      ASL     A
      BCC     loc_BANK1_B92C

      DEY

loc_BANK1_B92C:
      STY     byte_RAM_2
      LDA     unk_RAM_408,X
      CLC
      ADC     byte_RAM_1
      STA     unk_RAM_408,X
      LDA     ObjectXLo,X
      ADC     byte_RAM_0
      STA     ObjectXLo,X
      LSR     byte_RAM_1
      LDA     ObjectXHi,X
      ADC     byte_RAM_2
      STA     ObjectXHi,X
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK1_B90C

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_B948:
      LDA     unk_RAM_44A,X
      BNE     loc_BANK1_B950

      JSR     sub_BANK1_B90C

loc_BANK1_B950:
      JSR     sub_BANK1_B907

      LDA     ObjectYAccel,X
      BMI     loc_BANK1_B95B

      CMP     #$3E
      BCS     locret_BANK1_B95F

loc_BANK1_B95B:
      INC     ObjectYAccel,X
      INC     ObjectYAccel,X

locret_BANK1_B95F:
      RTS

; End of function sub_BANK1_B948

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_B960:
      LDA     #1
      BNE     loc_BANK1_B966

loc_BANK1_B964:
      LDA     #0

loc_BANK1_B966:
      PHA
      LDY     #8

loc_BANK1_B969:
      LDA     EnemyState,Y
      BEQ     loc_BANK1_B97F

      LDA     ObjectType,Y
      CMP     #$3C
      BNE     loc_BANK1_B97F

      LDA     #5
      STA     EnemyState,Y
      LDA     #$20
      STA     unk_RAM_86,Y

loc_BANK1_B97F:
      DEY
      BPL     loc_BANK1_B969

_code_3982:
      JSR     sub_BANK1_BB10

      BMI     loc_BANK1_B9B6

      LDA     #0
      STA     byte_RAM_4BD
      STA     byte_RAM_4B3
      LDX     byte_RAM_0
      PLA
      STA     unk_RAM_477,X
      LDA     #$3C
      STA     ObjectType,X
      LDA     PlayerXLo
      ADC     #8
      AND     #$F0
      STA     ObjectXLo,X
      LDA     PlayerXHi
      ADC     #0
      STA     ObjectXHi,X
      LDA     PlayerYLo
      STA     ObjectYLo,X
      LDA     PlayerYHi
      STA     ObjectYHi,X
      LDA     #$41
      STA     ObjectAttributes,X
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_B9B6:
      PLA
      RTS

; End of function sub_BANK1_B960

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_B9B8:
      JSR     loc_BANK1_BB14

      BMI     locret_BANK1_B9E2

      LDX     byte_RAM_0
      LDA     #$45
      STA     ObjectType,X
      LDA     byte_RAM_4C0
      ADC     #$D0
      STA     ObjectXLo,X
      LDA     byte_RAM_4BE
      ADC     #0
      STA     ObjectXHi,X
      LDA     byte_RAM_CB
      ADC     #$E0
      STA     ObjectYLo,X
      LDA     byte_RAM_CA
      ADC     #0
      STA     ObjectYHi,X
      JSR     loc_BANK1_BA17

      LDX     byte_RAM_12

locret_BANK1_B9E2:
      RTS

; End of function sub_BANK1_B9B8

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_B9E3:
      LDA     #0
      STA     unk_RAM_86,X
      LDA     #0
      STA     EnemyTimer,X

loc_BANK1_B9EB:
      LDA     #0
      STA     unk_RAM_B1,X
      STA     unk_RAM_42F,X
      STA     unk_RAM_A8,X
      STA     unk_RAM_9F,X
      STA     unk_RAM_44A,X
      STA     EnemyCollision,X
      STA     unk_RAM_438,X
      STA     unk_RAM_453,X
      STA     unk_RAM_4CC,X
      STA     unk_RAM_4D6,X
      STA     unk_RAM_45C,X
      STA     unk_RAM_477,X
      STA     unk_RAM_480,X
      STA     EnemyHP,X
      STA     ObjectYAccel,X
      STA     ObjectXAccel,X

loc_BANK1_BA17:
      LDY     ObjectType,X
      LDA     ObjectAttributeTable,Y
      AND     #ObjAttrib_Palette3|ObjAttrib_Unknown_04|ObjAttrib_Unknown_08|ObjAttrib_Mirrored|ObjAttrib_Unknown_20|ObjAttrib_16x32
      STA     ObjectAttributes,X
      LDA     byte_BANKF_F532,Y
      STA     unk_RAM_46E,X
      LDA     unk_BANKF_F5C0,Y
      STA     unk_RAM_489,X
      LDA     unk_BANKF_F579,Y
      STA     unk_RAM_492,X
      RTS

; End of function sub_BANK1_B9E3

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_BA33:
      LDA     ObjectAttributes,X
      AND     #$FC
      ORA     #1
      STA     ObjectAttributes,X
      LDA     #5
      STA     EnemyState,X
      STA     unk_RAM_9F,X
      LDA     #$1F
      STA     unk_RAM_86,X
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK1_BA33

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_BA48:
      LDA     #$FF
      STA     unk_RAM_441,X
      RTS

; End of function sub_BANK1_BA48

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_BA4E:
      LDX     byte_RAM_E8
      JSR     sub_BANK1_BA71

      LDA     byte_RAM_E6
      CLC
      ADC     byte_RAM_E5
      STA     byte_RAM_E7
      RTS

; End of function sub_BANK1_BA4E

; ---------------------------------------------------------------------------
byte_BANK1_BA5B:
	  .BYTE 0

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
byte_BANK1_BA66:
	  .BYTE $60

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

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_BA71:
      LDA     byte_BANK1_BA5B,X
      STA     byte_RAM_1
      LDA     byte_BANK1_BA66,X
      STA     byte_RAM_2
      RTS

; End of function sub_BANK1_BA71

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_BA7C:
      LDA     #1
      LDY     byte_RAM_0
      CPY     #$8A
      BEQ     loc_BANK1_BA8D

      CPY     #$8B
      BEQ     loc_BANK1_BA8B

      LDA     #0
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_BA8B:
      LDA     #8

loc_BANK1_BA8D:
      STA     PlayerYAccel
      LDA     byte_RAM_4DF
      BNE     loc_BANK1_BA9B

      LDA     PlayerYLo
      AND     #$10
      STA     byte_RAM_4EB

loc_BANK1_BA9B:
      LDA     PlayerYLo
      AND     #$F
      TAY
      LDA     byte_RAM_4EB
      EOR     PlayerYLo
      AND     #$10
      BEQ     loc_BANK1_BAB6

      CPY     #$C
      BCC     loc_BANK1_BAB4

      LDA     #0
      STA     byte_RAM_82
      JSR     KillPlayer

loc_BANK1_BAB4:
      LDY     #4

loc_BANK1_BAB6:
      CPY     #4
      BCS     loc_BANK1_BABC

      LDY     #1

loc_BANK1_BABC:
      TYA
      DEX
      RTS

; End of function sub_BANK1_BA7C

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_BABF:
      LDA     DamageInvulnTime
      BNE     locret_BANK1_BAEC

      LDA     PlayerHealth
      SEC
      SBC     #$10
      BCC     loc_BANK1_BAED

      STA     PlayerHealth
      LDA     #$7F
      STA     DamageInvulnTime
      LDA     PlayerPageX
      SEC
      SBC     byte_RAM_429
      ASL     A
      ASL     A
      STA     PlayerXAccel
      LDA     #$C0
      LDY     PlayerYAccel
      BPL     loc_BANK1_BAE5

      LDA     #0

loc_BANK1_BAE5:
      STA     PlayerYAccel
      LDA     #4
      STA     DPCMQueue

locret_BANK1_BAEC:
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_BAED:
      LDA     #$C0
      STA     PlayerYAccel
      LDA     #$20
      STA     byte_RAM_82
      LDY     byte_RAM_12
      BMI     loc_BANK1_BAFD

      LSR     A
      STA     unk_RAM_438,Y

loc_BANK1_BAFD:
      JMP     KillPlayer

; End of function sub_BANK1_BABF

; ---------------------------------------------------------------------------

_code_3B00:
      LDY     unk_RAM_441,X
      BMI     loc_BANK1_BB0B

      LDA     (byte_RAM_CC),Y
      AND     #$7F
      STA     (byte_RAM_CC),Y

loc_BANK1_BB0B:
      LDA     #0
      STA     EnemyState,X
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK1_BB10:
      LDY     #8
      BNE     loc_BANK1_BB16

loc_BANK1_BB14:
      LDY     #5

loc_BANK1_BB16:
      LDA     EnemyState,Y
      BEQ     loc_BANK1_BB1F

      DEY
      BPL     loc_BANK1_BB16

      RTS

; ---------------------------------------------------------------------------

loc_BANK1_BB1F:
      LDA     #1
      STA     EnemyState,Y
      LSR     A
      STA     unk_RAM_49B,Y
      LDA     #1
      STA     ObjectType,Y
      LDA     ObjectXLo,X
      ADC     #5
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      ADC     #0
      STA     ObjectXHi,Y
      LDA     ObjectYLo,X
      STA     ObjectYLo,Y
      LDA     ObjectYHi,X
      STA     ObjectYHi,Y
      STY     byte_RAM_0
      TYA
      TAX
      JSR     sub_BANK1_B9E3

      JSR     sub_BANK1_BA48

      LDX     byte_RAM_12
      RTS

; End of function sub_BANK1_BB10

; ---------------------------------------------------------------------------
; [000004AE BYTES: BEGIN OF AREA UNUSED_empty_3B52. PRESS KEYPAD "-" TO	COLLAPSE]
_empty_3B52:
	  .BYTE $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF
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
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF; $4A0
; end of 'BANK1'

; [000004AE BYTES: END OF AREA UNUSED_empty_3B52. PRESS	KEYPAD "-" TO COLLAPSE]
; ===========================================================================

