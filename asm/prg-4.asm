
      ;.segment	BANK4
;       *	=  $8000

; =============== S U B	R O U T	I N E =======================================

StartProcessingSoundQueue:
      LDA     #$FF
      STA     JOY2
      LDA     StackArea
      CMP     #$41
						  ; various values otherwise
      BNE     ProcessMusicAndSfxQueues

      LDA     #$C				  ; Mute the two square	channels
						  ; (TODO: Bitmask pls)
      STA     SND_CHN
      JMP     ProcessOnlyMusicQueue2		  ; You	would think you	could skip processing,
						  ; since if the game is paused, nothing should
						  ; be setting new music or whatever.
						  ;
						  ; You	would be correct, except for the suicide code!
						  ; That sets MusicQueue2.
						  ;
						  ; If not for processing it, the music	would not
						  ; change (or stop) when you used the code. Welp!

; ---------------------------------------------------------------------------

ProcessMusicAndSfxQueues:
      JSR     ProcessSoundEffectQueue2

      JSR     ProcessSoundEffectQueue1

      JSR     ProcessSoundEffectQueue3

      JSR     ProcessDPCMQueue

ProcessOnlyMusicQueue2:
      JSR     ProcessMusicQueue2

      LDA     #0
      STA     SoundEffectQueue2
      STA     MusicQueue2
      STA     SoundEffect1Queue
      STA     DPCMQueue
      STA     Music1Queue
      STA     SoundEffectQueue3
      RTS

; End of function StartProcessingSoundQueue

; ---------------------------------------------------------------------------

loc_BANK4_8038:
      LDA     #$42
      LDX     #$82
      LDY     #$A8
      JSR     sub_BANK4_86C8

      LDA     #$22
      STA     byte_RAM_C4

loc_BANK4_8045:
      LDA     byte_RAM_C4
      CMP     #$20
      BNE     loc_BANK4_8051

      LDX     #$DF
      LDY     #$F6
      BNE     loc_BANK4_8059

loc_BANK4_8051:
      CMP     #$1A
      BNE     loc_BANK4_8076

      LDX     #$C1
      LDY     #$BC

loc_BANK4_8059:
      JSR     sub_BANK4_86BA

      BNE     loc_BANK4_8076

loc_BANK4_805E:
      LDA     #$35
      LDX     #$8D
      STA     byte_RAM_C4
      LDY     #$7F

loc_BANK4_8066:
      LDA     #$5E
      JSR     sub_BANK4_86C8

loc_BANK4_806B:
      LDA     byte_RAM_C4
      CMP     #$30
      BNE     loc_BANK4_8076

      LDA     #$54
      STA     SQ1_LO

loc_BANK4_8076:
      BNE     loc_BANK4_80D3

; =============== S U B	R O U T	I N E =======================================

ProcessSoundEffectQueue2:
      LDA     byte_RAM_60D
      CMP     #2
      BEQ     loc_BANK4_80D3

      LDY     SoundEffectQueue2
      BEQ     loc_BANK4_80A5

      STY     byte_RAM_60D
      LSR     SoundEffectQueue2
      BCS     loc_BANK4_8038

      LSR     SoundEffectQueue2
      BCS     loc_BANK4_80C3

      LSR     SoundEffectQueue2
      BCS     loc_BANK4_805E

      LSR     SoundEffectQueue2
      BCS     loc_BANK4_80E7

      LSR     SoundEffectQueue2
      BCS     loc_BANK4_80BD

      LSR     SoundEffectQueue2
      BCS     loc_BANK4_8103

loc_BANK4_80A5:
      LDA     byte_RAM_60D
      BEQ     locret_BANK4_80BC

      LSR     A
      BCS     loc_BANK4_8045

      LSR     A
      BCS     loc_BANK4_80D3

      LSR     A
      BCS     loc_BANK4_806B

      LSR     A
      BCS     loc_BANK4_80EB

      LSR     A
      BCS     loc_BANK4_80D3

      LSR     A
      BCS     loc_BANK4_8107

locret_BANK4_80BC:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_80BD:
      LDA     #$60
      LDY     #$A5
      BNE     loc_BANK4_80CA

loc_BANK4_80C3:
      STY     byte_RAM_60D
      LDA     #5
      LDY     #$9C

loc_BANK4_80CA:
      LDX     #$9E
      STA     byte_RAM_C4
      LDA     #$60
      JSR     sub_BANK4_86C8

loc_BANK4_80D3:
      DEC     byte_RAM_C4
      BNE     locret_BANK4_80E6

      LDX     #$E
      STX     SND_CHN
      LDX     #$F
      STX     SND_CHN
      LDX     #0
      STX     byte_RAM_60D

locret_BANK4_80E6:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_80E7:
      LDA     #$2F
      STA     byte_RAM_C4

loc_BANK4_80EB:
      LDA     byte_RAM_C4
      LSR     A
      BCS     loc_BANK4_8100

      LSR     A
      BCS     loc_BANK4_8100

      AND     #2
      BEQ     loc_BANK4_8100

      LDY     #$91
      LDX     #$9A
      LDA     #$68
      JSR     sub_BANK4_86C8

loc_BANK4_8100:
      JMP     loc_BANK4_80D3

; ---------------------------------------------------------------------------

loc_BANK4_8103:
      LDA     #$36
      STA     byte_RAM_C4

loc_BANK4_8107:
      LDA     byte_RAM_C4
      LSR     A
      BCS     loc_BANK4_80D3

      TAY
      LDA     loc_BANK4_8117+2,Y
      LDX     #$5D
      LDY     #$7F
      JSR     sub_BANK4_86C8

loc_BANK4_8117:
      JMP     loc_BANK4_80D3

; End of function ProcessSoundEffectQueue2

; ---------------------------------------------------------------------------
MushroomSoundData:.BYTE	$6A, $74, $6A, $64, $5C, $52, $5C, $52,	$4C, $44, $66, $70, $66, $60, $58, $4E;	0
      .BYTE $58, $4E, $48, $40,	$56, $60, $56, $50, $48, $3E, $48, $3E,	$38, $30; $10

; =============== S U B	R O U T	I N E =======================================

ProcessSoundEffectQueue1:
      LDA     SoundEffect1Queue
      BEQ     loc_BANK4_8146

      CMP     #SoundEffect1_StopwatchTick
      BNE     loc_BANK4_814C

      LDX     byte_RAM_607
      BEQ     loc_BANK4_814C

loc_BANK4_8146:
      LDA     byte_RAM_607
      BNE     loc_BANK4_815A

      RTS

; ---------------------------------------------------------------------------

loc_BANK4_814C:
      STA     byte_RAM_607
      LDY     #0

loc_BANK4_8151:
      INY
      LSR     A
      BCC     loc_BANK4_8151

      LDA     locret_BANK4_818E,Y
      STA     byte_RAM_C1

loc_BANK4_815A:
      LDY     byte_RAM_C1
      INC     byte_RAM_C1
      LDA     SoundEffectPointers,Y
      BMI     loc_BANK4_8178

      BNE     loc_BANK4_8182

      LDX     #$90
      STX     SQ2_VOL
      LDX     #$18
      STX     SQ2_HI
      LDX     #0
      STX     SQ2_LO
      STX     byte_RAM_607
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_8178:
      STA     SQ2_VOL
      LDY     byte_RAM_C1
      INC     byte_RAM_C1
      LDA     SoundEffectPointers,Y

loc_BANK4_8182:
      CMP     #$7E
      BEQ     loc_BANK4_8189

      JSR     sub_BANK4_873F

loc_BANK4_8189:
      LDA     #$7F
      STA     SQ2_SWEEP

locret_BANK4_818E:
      RTS

; End of function ProcessSoundEffectQueue1

; ---------------------------------------------------------------------------
SoundEffectPointers:.BYTE $4E

      .BYTE 8
      .BYTE $6D
      .BYTE $27
      .BYTE $D7
      .BYTE $74
      .BYTE $8B
      .BYTE $A5
SoundEffects:.BYTE $9F
      .BYTE $10
      .BYTE $E
      .BYTE $C
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $10
      .BYTE $E
      .BYTE $C
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $86
      .BYTE $10
      .BYTE $E
      .BYTE $C
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE 0
      .BYTE $9F
      .BYTE $64
      .BYTE $7E
      .BYTE $7E
      .BYTE $9E
      .BYTE $68
      .BYTE $7E
      .BYTE $7E
      .BYTE $9D
      .BYTE $6A
      .BYTE $7E
      .BYTE $7E
      .BYTE $9C
      .BYTE $6E
      .BYTE $7E
      .BYTE $7E
      .BYTE $9B
      .BYTE $72
      .BYTE $7E
      .BYTE $7E
      .BYTE $9A
      .BYTE $76
      .BYTE $7E
      .BYTE $7E
      .BYTE $84
      .BYTE $78
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE 0
      .BYTE $9F
      .BYTE $30
      .BYTE $34
      .BYTE $36
      .BYTE $38
      .BYTE $9F
      .BYTE $3C
      .BYTE $3E
      .BYTE $40
      .BYTE $42
      .BYTE $9A
      .BYTE $3A
      .BYTE $3C
      .BYTE $3E
      .BYTE $40
      .BYTE $9C
      .BYTE $38
      .BYTE $3A
      .BYTE $3C
      .BYTE $3E
      .BYTE $96
      .BYTE $36
      .BYTE $38
      .BYTE $3A
      .BYTE $3C
      .BYTE $98
      .BYTE $34
      .BYTE $36
      .BYTE $38
      .BYTE $36
      .BYTE 0
      .BYTE $81
      .BYTE $56
      .BYTE $7E
      .BYTE $64
      .BYTE $7E
      .BYTE $68
      .BYTE 0
      .BYTE $99
      .BYTE $18
      .BYTE $1A
      .BYTE $18
      .BYTE $1C
      .BYTE $18
      .BYTE $1A
      .BYTE $9B
      .BYTE $18
      .BYTE $1C
      .BYTE $18
      .BYTE $20
      .BYTE $18
      .BYTE $22
      .BYTE $9F
      .BYTE $18
      .BYTE $3C
      .BYTE $24
      .BYTE $30
      .BYTE $3C
      .BYTE $18
      .BYTE $30
      .BYTE 0
      .BYTE $80
      .BYTE $68
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $60
      .BYTE $7E
      .BYTE $7E
      .BYTE $64
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $56
      .BYTE $7E
      .BYTE $7E
      .BYTE   0
      .BYTE $80
      .BYTE $1E
      .BYTE $1C
      .BYTE $1E
      .BYTE $1A
      .BYTE $18
      .BYTE $16
      .BYTE $1C
      .BYTE $18
      .BYTE $1A
      .BYTE $1E
      .BYTE $18
      .BYTE $16
      .BYTE $14
      .BYTE $12
      .BYTE $14
      .BYTE $16
      .BYTE $14
      .BYTE $12
      .BYTE $2C
      .BYTE $2C
      .BYTE $2A
      .BYTE $2E
      .BYTE $2C
      .BYTE $2A
      .BYTE $28
      .BYTE $26
      .BYTE $28
      .BYTE $24
      .BYTE $22
      .BYTE $20
      .BYTE $1E
      .BYTE $1C
      .BYTE $1A
      .BYTE $18
      .BYTE $16
      .BYTE $14
      .BYTE $14
      .BYTE $12
      .BYTE $10
      .BYTE $E
      .BYTE $C
      .BYTE $A
      .BYTE 8
      .BYTE 8
      .BYTE 6
      .BYTE 4
      .BYTE 2
      .BYTE 2
      .BYTE 0
      .BYTE $81
      .BYTE $5E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $64
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $76
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $6E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $72
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7C
      .BYTE $7E
      .BYTE $7E
      .BYTE   0
; ---------------------------------------------------------------------------

loc_BANK4_828E:
      LDA     #2
      STA     byte_RAM_611

loc_BANK4_8293:
      LDA     #$1A
      STA     NOISE_VOL
      LDA     #4
      STA     NOISE_LO
      STA     NOISE_HI
      BNE     loc_BANK4_82E8

; =============== S U B	R O U T	I N E =======================================

ProcessSoundEffectQueue3:
      LDY     SoundEffectQueue3
      BEQ     loc_BANK4_82B9

      STY     byte_RAM_60E
      LSR     SoundEffectQueue3
      BCS     loc_BANK4_828E

      LSR     SoundEffectQueue3
      BCS     loc_BANK4_82C6

loc_BANK4_82B4:
      LSR     SoundEffectQueue3
      BCS     loc_BANK4_82C6

loc_BANK4_82B9:
      LDA     byte_RAM_60E
      LSR     A
      BCS     loc_BANK4_8293

      LSR     A
      BCS     loc_BANK4_82CB

      LSR     A
      BCS     loc_BANK4_82CB

      RTS

; ---------------------------------------------------------------------------

loc_BANK4_82C6:
      LDA     #$7F
      STA     byte_RAM_611

loc_BANK4_82CB:
      LDY     byte_RAM_611
      LDA     ProcessMusicQueue2,Y
      ORA     #$C
      STA     NOISE_LO
      LDA     byte_RAM_611
      LSR     A
      LSR     A
      LSR     A
      AND     #$1F
      ORA     #$10
      STA     NOISE_VOL
      LDA     #$18
      STA     NOISE_HI

loc_BANK4_82E8:
      DEC     byte_RAM_611
      BNE     locret_BANK4_82FC

      LDX     #7
      STX     SND_CHN
      LDX     #$F
      STX     SND_CHN
      LDX     #0
      STX     byte_RAM_60E

locret_BANK4_82FC:
      RTS

; End of function ProcessSoundEffectQueue3

; =============== S U B	R O U T	I N E =======================================

ProcessDPCMQueue:
      LDA     DPCMQueue
      BNE     loc_BANK4_8317

      LDA     byte_RAM_608
      BEQ     loc_BANK4_830C

      DEC     byte_RAM_60A
      BNE     locret_BANK4_8316

loc_BANK4_830C:
      LDA     #0

loc_BANK4_830E:
      STA     byte_RAM_608
      LDA     #$F
      STA     SND_CHN

locret_BANK4_8316:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_8317:
      STA     byte_RAM_608
      LDY     #0

loc_BANK4_831C:
      INY
      LSR     A
      BCC     loc_BANK4_831C

      LDA     unk_BANK4_8351,Y
      STA     DMC_FREQ

loc_BANK4_8326:
      LDA     locret_BANK4_8341,Y
      STA     DMC_START
      LDA     unk_BANK4_8349,Y
      STA     DMC_LEN
      LDA     #$A0
      STA     byte_RAM_60A
      LDA     #$F
      STA     SND_CHN
      LDA     #$1F
      STA     SND_CHN

locret_BANK4_8341:
      RTS

; End of function ProcessDPCMQueue

; ---------------------------------------------------------------------------
byte_BANK4_8342:.BYTE $4F
      .BYTE $60
      .BYTE $4B
      .BYTE 0
      .BYTE $31
      .BYTE $60
      .BYTE $E
unk_BANK4_8349:.BYTE $1D
      .BYTE $43
      .BYTE $14
      .BYTE $10
      .BYTE $38
      .BYTE $48
      .BYTE $28
      .BYTE $3C
unk_BANK4_8351:.BYTE $50
      .BYTE $E
      .BYTE $E
      .BYTE $F
      .BYTE $F
      .BYTE $F
      .BYTE $F
      .BYTE $F
      .BYTE  $F
      .BYTE $60
; ---------------------------------------------------------------------------

loc_BANK4_835B:
      JMP     loc_BANK4_8429

; ---------------------------------------------------------------------------

loc_BANK4_835E:
      JMP     loc_BANK4_8451

; =============== S U B	R O U T	I N E =======================================

ProcessMusicQueue2:
      LDA     MusicQueue2
      BMI     loc_BANK4_835E			  ; code used as data at 8000

      CMP     #4				  ; code used as data at 8000
      BEQ     loc_BANK4_837D			  ; code used as data at 8000

      LDA     MusicQueue2			  ; code used as data at 8000
      BNE     loc_BANK4_83C5			  ; code used as data at 8000

      LDA     Music1Queue			  ; code used as data at 8000
      BNE     loc_BANK4_8389			  ; code used as data at 8000

      LDA     byte_RAM_606			  ; code used as data at 8000
      ORA     byte_RAM_609			  ; code used as data at 8000
      BNE     loc_BANK4_835B			  ; code used as data at 8000

      RTS					  ; code used as data at 8000

; ---------------------------------------------------------------------------

loc_BANK4_837D:
      STA     byte_RAM_606			  ; code used as data at 8000
      LDY     #0				  ; code used as data at 8000
      STY     byte_RAM_609			  ; code used as data at 8000
      LDY     #8				  ; code used as data at 8000
      BNE     loc_BANK4_8397			  ; code used as data at 8000

loc_BANK4_8389:
      STA     byte_RAM_609			  ; code used as data at 8000
      LDY     #0				  ; code used as data at 8000
      STY     byte_RAM_606			  ; code used as data at 8000
      LDY     #$FF				  ; code used as data at 8000

loc_BANK4_8393:
      INY					  ; code used as data at 8000
      LSR     A					  ; code used as data at 8000
      BCC     loc_BANK4_8393			  ; code used as data at 8000

loc_BANK4_8397:
      LDA     MusicPointersFirstPart,Y		  ; code used as data at 8000
      STA     byte_RAM_5EE			  ; code used as data at 8000
      LDA     MusicPointersEndPart,Y		  ; code used as data at 8000
      CLC					  ; code used as data at 8000
      ADC     #2				  ; code used as data at 8000
      STA     byte_RAM_5EF			  ; code used as data at 8000
      LDA     MusicPointersLoopPart,Y		  ; code used as data at 8000
      STA     byte_RAM_5F0			  ; code used as data at 8000
      LDA     byte_RAM_5EE			  ; code used as data at 8000

loc_BANK4_83AF:
      STA     byte_RAM_5EC			  ; code used as data at 8000

loc_BANK4_83B2:
      INC     byte_RAM_5EC			  ; code used as data at 8000
      LDY     byte_RAM_5EC			  ; code used as data at 8000
      CPY     byte_RAM_5EF			  ; code used as data at 8000
      BNE     loc_BANK4_83D7			  ; code used as data at 8000

      LDA     byte_RAM_5F0			  ; code used as data at 8000
      BNE     loc_BANK4_83AF			  ; code used as data at 8000

      JMP     loc_BANK4_8451			  ; code used as data at 8000

; ---------------------------------------------------------------------------

loc_BANK4_83C5:
      STA     byte_RAM_606			  ; code used as data at 8000
      LDY     byte_RAM_609			  ; code used as data at 8000
      STY     byte_RAM_5F3			  ; code used as data at 8000
      LDY     #0				  ; code used as data at 8000
      STY     byte_RAM_609			  ; code used as data at 8000

loc_BANK4_83D3:
      INY					  ; code used as data at 8000
      LSR     A					  ; code used as data at 8000
      BCC     loc_BANK4_83D3			  ; code used as data at 8000

loc_BANK4_83D7:
      LDA     unk_BANK4_8FFF,Y			  ; code used as data at 8000
      TAY					  ; code used as data at 8000
      LDA     MusicPartPointers,Y		  ; code used as data at 8000
      STA     MusicTempoSetting			  ; code used as data at 8000
      LDA     byte_BANK4_9001,Y
      STA     byte_RAM_BB
      LDA     unk_BANK4_9002,Y
      STA     byte_RAM_BC
      LDA     byte_BANK4_9003,Y
      STA     byte_RAM_615
      LDA     unk_BANK4_9004,Y
      STA     byte_RAM_614
      LDA     byte_BANK4_9005,Y
      STA     byte_RAM_616
      STA     byte_RAM_5F5
      STA     byte_RAM_5FF
      STA     byte_RAM_5FC
      LDA     #1
      STA     byte_RAM_618
      STA     byte_RAM_61A
      STA     byte_RAM_61D
      STA     byte_RAM_61E
      STA     byte_RAM_5FA
      LDA     #0
      STA     byte_RAM_613
      STA     byte_RAM_60C
      LDA     #$B
      STA     SND_CHN
      LDA     #$F
      STA     SND_CHN

loc_BANK4_8429:
      DEC     byte_RAM_618
      BNE     loc_BANK4_84A1

      LDY     byte_RAM_613
      INC     byte_RAM_613
      LDA     (byte_RAM_BB),Y
      BEQ     loc_BANK4_843C

      BPL     loc_BANK4_847D

      BNE     loc_BANK4_8468

loc_BANK4_843C:
      LDA     byte_RAM_609
      BNE     loc_BANK4_8462

loc_BANK4_8441:
      LDA     byte_RAM_606
      CMP     #4
      BEQ     loc_BANK4_8462

      AND     #$25
      BEQ     loc_BANK4_8451

      LDA     byte_RAM_5F3
      BNE     loc_BANK4_8465

loc_BANK4_8451:
      LDA     #0
      STA     byte_RAM_606
      STA     byte_RAM_609
      STA     SND_CHN

loc_BANK4_845C:
      LDX     #$F
      STX     SND_CHN
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_8462:
      JMP     loc_BANK4_83B2

; ---------------------------------------------------------------------------

loc_BANK4_8465:
      JMP     loc_BANK4_8389

; ---------------------------------------------------------------------------

loc_BANK4_8468:
      TAX
      AND     #$F0
      STA     byte_RAM_5F1
      TXA
      JSR     sub_BANK4_8629

      STA     byte_RAM_617
      LDY     byte_RAM_613
      INC     byte_RAM_613
      LDA     (byte_RAM_BB),Y

loc_BANK4_847D:
      LDX     byte_RAM_607
      BNE     loc_BANK4_849B

      JSR     sub_BANK4_873F

      TAY
      BNE     loc_BANK4_848D

      LDA     byte_RAM_BF
      JMP     loc_BANK4_8495

; ---------------------------------------------------------------------------

loc_BANK4_848D:
      LDA     byte_RAM_617
      LDX     byte_RAM_BF

loc_BANK4_8492:
      JSR     sub_BANK4_8634

loc_BANK4_8495:
      STA     byte_RAM_619
      JSR     sub_BANK4_86C1

loc_BANK4_849B:
      LDA     byte_RAM_617
      STA     byte_RAM_618

loc_BANK4_84A1:
      LDX     byte_RAM_607
      BNE     loc_BANK4_84BF

      LDY     byte_RAM_619
      BEQ     loc_BANK4_84AE

      DEC     byte_RAM_619

loc_BANK4_84AE:
      LDA     byte_RAM_617
      LDX     byte_RAM_5F1
      JSR     sub_BANK4_8643

      STA     SQ2_VOL
      LDX     #$7F
      STX     SQ2_SWEEP

loc_BANK4_84BF:
      DEC     byte_RAM_61A
      BNE     loc_BANK4_8518

loc_BANK4_84C4:
      LDY     byte_RAM_614
      INC     byte_RAM_614
      LDA     (byte_RAM_BB),Y
      BPL     loc_BANK4_84E3

      TAX
      AND     #$F0
      STA     byte_RAM_5F2
      TXA
      JSR     sub_BANK4_8629

      STA     byte_RAM_5ED
      LDY     byte_RAM_614
      INC     byte_RAM_614
      LDA     (byte_RAM_BB),Y

loc_BANK4_84E3:
      TAY
      BNE     loc_BANK4_84F5

      LDA     #$83
      STA     SQ1_VOL
      LDA     #$94
      STA     SQ1_SWEEP
      STA     byte_RAM_60C
      BNE     loc_BANK4_84C4

loc_BANK4_84F5:
      LDY     byte_RAM_60D
      BNE     loc_BANK4_8512

      JSR     sub_BANK4_86CE

      BNE     loc_BANK4_8504

loc_BANK4_84FF:
      LDA     byte_RAM_BF
      JMP     loc_BANK4_850C

; ---------------------------------------------------------------------------

loc_BANK4_8504:
      LDA     byte_RAM_5ED
      LDX     byte_RAM_C0
      JSR     sub_BANK4_8634

loc_BANK4_850C:
      STA     byte_RAM_61B
      JSR     sub_BANK4_86BA

loc_BANK4_8512:
      LDA     byte_RAM_5ED
      STA     byte_RAM_61A

loc_BANK4_8518:
      LDA     byte_RAM_60D
      BNE     loc_BANK4_853B

      LDY     byte_RAM_61B
      BEQ     loc_BANK4_8525

      DEC     byte_RAM_61B

loc_BANK4_8525:
      LDA     byte_RAM_5ED
      LDX     byte_RAM_5F2
      JSR     sub_BANK4_8643

      STA     SQ1_VOL
      LDA     byte_RAM_60C
      BNE     loc_BANK4_8538

      LDA     #$7F

loc_BANK4_8538:
      STA     SQ1_SWEEP

loc_BANK4_853B:
      LDA     byte_RAM_615
      BEQ     loc_BANK4_8585

      DEC     byte_RAM_61D
      BNE     loc_BANK4_8585

      LDY     byte_RAM_615
      INC     byte_RAM_615
      LDA     (byte_RAM_BB),Y
      BEQ     loc_BANK4_8582

      BPL     loc_BANK4_8566

      JSR     sub_BANK4_8629

      STA     byte_RAM_61C
      LDA     #$1F
      STA     TRI_LINEAR
      LDY     byte_RAM_615
      INC     byte_RAM_615
      LDA     (byte_RAM_BB),Y
      BEQ     loc_BANK4_8582

loc_BANK4_8566:
      JSR     loc_BANK4_8743

      LDX     byte_RAM_61C
      STX     byte_RAM_61D
      TXA
      CMP     #$A
      BCC     loc_BANK4_857C

      CMP     #$1E

loc_BANK4_8576:
      BCS     loc_BANK4_8580

      LDA     #$24
      BNE     loc_BANK4_8582

loc_BANK4_857C:
      LDA     #$18

loc_BANK4_857E:
      BNE     loc_BANK4_8582

loc_BANK4_8580:
      LDA     #$6F

loc_BANK4_8582:
      STA     TRI_LINEAR

loc_BANK4_8585:
      LDA     byte_RAM_609
      AND     #$14
      BNE     loc_BANK4_85E0

      LDA     byte_RAM_616
      BEQ     loc_BANK4_85CC

      DEC     byte_RAM_61E
      BNE     loc_BANK4_85CC

loc_BANK4_8596:
      LDY     byte_RAM_616
      INC     byte_RAM_616
      LDA     (byte_RAM_BB),Y
      BEQ     loc_BANK4_85CF

      BPL     loc_BANK4_85B2

      JSR     sub_BANK4_8629

      STA     byte_RAM_61F
      LDY     byte_RAM_616
      INC     byte_RAM_616
      LDA     (byte_RAM_BB),Y
      BEQ     loc_BANK4_85CF

loc_BANK4_85B2:
      LSR     A
      TAY
      LDA     byte_BANK4_861D,Y
      STA     NOISE_VOL
      LDA     byte_BANK4_8621,Y
      STA     NOISE_LO
      LDA     byte_BANK4_8625,Y
      STA     NOISE_HI
      LDA     byte_RAM_61F
      STA     byte_RAM_61E

loc_BANK4_85CC:
      JMP     loc_BANK4_85D8

; ---------------------------------------------------------------------------

loc_BANK4_85CF:
      LDA     byte_RAM_5F5
      STA     byte_RAM_616
      JMP     loc_BANK4_8596

; ---------------------------------------------------------------------------

loc_BANK4_85D8:
      LDA     byte_RAM_609
      AND     #$14
      BNE     loc_BANK4_85E0

      RTS

; ---------------------------------------------------------------------------

loc_BANK4_85E0:
      LDA     byte_RAM_5FF
      BEQ     locret_BANK4_8613

      DEC     byte_RAM_5FA
      BNE     locret_BANK4_8613

loc_BANK4_85EA:
      LDY     byte_RAM_5FF
      INC     byte_RAM_5FF
      LDA     (byte_RAM_BB),Y
      BEQ     loc_BANK4_8614

      BPL     loc_BANK4_8606

      JSR     sub_BANK4_8629

      STA     byte_RAM_5FB
      LDY     byte_RAM_5FF
      INC     byte_RAM_5FF
      LDA     (byte_RAM_BB),Y
      BEQ     loc_BANK4_8614

loc_BANK4_8606:
      ASL     A
      STA     DPCMQueue
      JSR     ProcessDPCMQueue

      LDA     byte_RAM_5FB
      STA     byte_RAM_5FA

locret_BANK4_8613:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_8614:
      LDA     byte_RAM_5FC
      STA     byte_RAM_5FF
      JMP     loc_BANK4_85EA

; End of function ProcessMusicQueue2

; ---------------------------------------------------------------------------
byte_BANK4_861D:.BYTE $10

      .BYTE $1E
      .BYTE $1F
      .BYTE $16
byte_BANK4_8621:.BYTE 0

      .BYTE 3
      .BYTE $A
      .BYTE 2
byte_BANK4_8625:.BYTE 0

      .BYTE $18
      .BYTE $18
      .BYTE $58

; =============== S U B	R O U T	I N E =======================================

sub_BANK4_8629:
      AND     #$F				  ; code used as data at 8000
      CLC
      ADC     MusicTempoSetting
      TAY
      LDA     NoteLengthTable,Y
      RTS

; End of function sub_BANK4_8629

; =============== S U B	R O U T	I N E =======================================

sub_BANK4_8634:
      CMP     #$13
      BCC     loc_BANK4_863C

      LDA     #$3F
      BNE     loc_BANK4_863E

loc_BANK4_863C:
      LDA     #$16

loc_BANK4_863E:
      LDX     #$82
      LDY     #$7F
      RTS

; End of function sub_BANK4_8634

; =============== S U B	R O U T	I N E =======================================

sub_BANK4_8643:
      CPX     #$90
      BEQ     loc_BANK4_866C

      CPX     #$E0
      BEQ     loc_BANK4_866C

      CPX     #$A0
      BEQ     loc_BANK4_8679

      CPX     #$B0
      BEQ     loc_BANK4_8686

      CPX     #$C0
      BEQ     loc_BANK4_8693

      CPX     #$D0
      BEQ     loc_BANK4_86AD

      CPX     #$F0
      BEQ     loc_BANK4_86A0

      CMP     #$13
      BCC     loc_BANK4_8668

      LDA     byte_BANK5_A18D,Y
      BNE     locret_BANK4_866B

loc_BANK4_8668:
      LDA     byte_BANK5_A1CD,Y

locret_BANK4_866B:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_866C:
      CMP     #$13
      BCC     loc_BANK4_8675

      LDA     byte_BANK5_A1E4,Y
      BNE     locret_BANK4_8678

loc_BANK4_8675:
      LDA     byte_BANK5_A224,Y

locret_BANK4_8678:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_8679:
      CMP     #$13
      BCC     loc_BANK4_8682

      LDA     byte_BANK5_A23B,Y
      BNE     locret_BANK4_8685

loc_BANK4_8682:
      LDA     byte_BANK5_A27B,Y

locret_BANK4_8685:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_8686:
      CMP     #$13
      BCC     loc_BANK4_868F

      LDA     byte_BANK5_A293,Y
      BNE     locret_BANK4_8692

loc_BANK4_868F:
      LDA     byte_BANK5_A2D3,Y

locret_BANK4_8692:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_8693:
      CMP     #$13
      BCC     loc_BANK4_869C

      LDA     byte_BANK5_A301,Y
      BNE     locret_BANK4_869F

loc_BANK4_869C:
      LDA     byte_BANK5_A2EA,Y

locret_BANK4_869F:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_86A0:
      CMP     #$13
      BCC     loc_BANK4_86A9

      LDA     byte_BANK5_A3AF,Y
      BNE     locret_BANK4_86AC

loc_BANK4_86A9:
      LDA     byte_BANK5_A398,Y

locret_BANK4_86AC:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_86AD:
      CMP     #$13
      BCC     loc_BANK4_86B6

      LDA     unk_BANK5_A341,Y
      BNE     locret_BANK4_86B9

loc_BANK4_86B6:
      LDA     unk_BANK5_A381,Y

locret_BANK4_86B9:
      RTS

; End of function sub_BANK4_8643

; =============== S U B	R O U T	I N E =======================================

sub_BANK4_86BA:
      STY     SQ1_SWEEP
      STX     SQ1_VOL
      RTS

; End of function sub_BANK4_86BA

; =============== S U B	R O U T	I N E =======================================

sub_BANK4_86C1:
      STX     SQ2_VOL
      STY     SQ2_SWEEP
      RTS

; End of function sub_BANK4_86C1

; =============== S U B	R O U T	I N E =======================================

sub_BANK4_86C8:
      STX     SQ1_VOL
      STY     SQ1_SWEEP

; End of function sub_BANK4_86C8

; =============== S U B	R O U T	I N E =======================================

sub_BANK4_86CE:
      LDX     #0

loc_BANK4_86D0:
      CMP     #$7E
      BNE     loc_BANK4_86DC

      LDA     #$10
      STA     SQ1_VOL,X
      LDA     #0
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_86DC:
      LDY     #1
      STY     byte_RAM_5F4
      PHA
      TAY
      BMI     loc_BANK4_86ED

loc_BANK4_86E5:
      INC     byte_RAM_5F4
      SEC
      SBC     #$18
      BPL     loc_BANK4_86E5

loc_BANK4_86ED:
      CLC
      ADC     #$18
      TAY
      LDA     NoteFrequencyData,Y
      STA     byte_RAM_BD
      LDA     NoteFrequencyData+1,Y
      STA     byte_RAM_BE

loc_BANK4_86FB:
      LSR     byte_RAM_BE
      ROR     byte_RAM_BD
      DEC     byte_RAM_5F4
      BNE     loc_BANK4_86FB

      PLA
      CMP     #$38
      BCC     loc_BANK4_870B

      DEC     byte_RAM_BD

loc_BANK4_870B:
      TXA

loc_BANK4_870C:
      CMP     #4
      BNE     loc_BANK4_8717

      LDA     byte_RAM_5F2
      CMP     #$E0
      BEQ     loc_BANK4_8727

loc_BANK4_8717:
      LDA     byte_RAM_BD
      STA     SQ1_LO,X
      STA     unk_RAM_5F9,X
      LDA     byte_RAM_BE
      ORA     #8
      STA     SQ1_HI,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_8727:
      LDA     byte_RAM_BD
      SEC
      SBC     #2
      STA     SQ2_LO
      STA     byte_RAM_C2
      LDA     byte_RAM_BE
      ORA     #8
      STA     SQ2_HI
      RTS

; End of function sub_BANK4_86CE

; ---------------------------------------------------------------------------
      STX     SQ2_VOL
      STY     SQ2_SWEEP

; =============== S U B	R O U T	I N E =======================================

sub_BANK4_873F:
      LDX     #4
      BNE     loc_BANK4_86D0

; End of function sub_BANK4_873F

loc_BANK4_8743:
      LDX     #8
      BNE     loc_BANK4_86D0

; ---------------------------------------------------------------------------
NoteFrequencyData:.WORD	$1AB8, $1938, $17CC, $1678, $1534, $1404; 0
      .WORD $12E4, $11D4, $10D4, $FE0, $EFC, $E24 ; 6
; [000007A1 BYTES: BEGIN OF AREA UNUSED-BANK4:875F. PRESS KEYPAD "-" TO	COLLAPSE]
_empty_875F:.BYTE $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF; 0
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
      .BYTE $FF					  ; $7A0
; [000007A1 BYTES: END OF AREA UNUSED-BANK4:875F. PRESS	KEYPAD "-" TO COLLAPSE]
NoteLengthTable:.BYTE 3, 3, 4, 4, 6, 9,	8, 8, $C, $12, $18, $24, $30, 3, 4, 5; 0
      .BYTE 4, 7, $A, 9, $A, $E, $15, $1C, $2A,	$38, $B, 4, 4, 5, 6, 8;	$10
      .BYTE $C,	$B, $A,	$10, $18, $20, $30, $40, 4, 5, 6, 6, 9,	$D, $C,	$C; $20
      .BYTE $12, $1B, $24, $36,	$48, $E, 3, 5, 5, 7, 6,	$A, $F,	$D, $E,	$14; $30
      .BYTE $1E, $28, $3C, $50,	5, 6, 7, 8, $B,	$10, $F, $E, $16, $21, $2C, $42; $40
      .BYTE $58, $11, 6, 6, 8, 8, $C, $12, $10,	$10, $18, $24, $30, $48, $60, 2; $50
      .BYTE 6, 7, 9, 8,	$D, $13, $11, $12, $1A,	$27, $34, $4E, $68, $14, 7, 7; $60
      .BYTE 9, $A, $E, $15, $13, $12, $1C, $2A,	$38, $54, $70, 3, 4, 7,	8, $A; $70
      .BYTE $A,	$F, $16, $14, $14, $1E,	$2D, $3C, $5A, $78, $17, 8, 8, $B, $A, $10; $80
      .BYTE $18, $15, $16, $20,	$30, $40, $60, $80, 8, 9, $B, $C, $11, $19, $15, $16; $90
      .BYTE $22, $33, $44, $60,	$88, $1A, 9, 9,	$C, $C,	$12, $1B, $18, $18, $24, $36; $A0
      .BYTE $48, $6C, $90			  ; $B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; 0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$40
unk_BANK4_8FFF:.BYTE $FF
MusicPartPointers:.BYTE	$99 ; ™
byte_BANK4_9001:.BYTE $8E

unk_BANK4_9002:.BYTE $84
byte_BANK4_9003:.BYTE $A4

unk_BANK4_9004:.BYTE $89
byte_BANK4_9005:.BYTE $84

      .BYTE $99
      .BYTE $2A
      .BYTE $30
      .BYTE $36
      .BYTE $30
      .BYTE $3C
      .BYTE $42
      .BYTE $A9
      .BYTE $9E
      .BYTE $93
      .BYTE $48
      .BYTE $4E
      .BYTE $54
      .BYTE $5A
      .BYTE $54
      .BYTE $60
      .BYTE $66
      .BYTE $72
      .BYTE $78
      .BYTE $7E
      .BYTE $B5
      .BYTE $AF
      .BYTE $BB
      .BYTE $C1
      .BYTE $C7
      .BYTE $CD
      .BYTE $D3
      .BYTE $CD
      .BYTE $D9
      .BYTE $DF
byte_BANK4_9024:.BYTE $EB
      .BYTE $E5
      .BYTE $F7
      .BYTE $F1
      .BYTE $FD
      .BYTE $6C
MusicPartHeaders:.BYTE 0
      .BYTE $AD
      .BYTE $98
      .BYTE $6B
      .BYTE $36
      .BYTE $A0
      .BYTE 0
      .BYTE $5C
byte_BANK4_9032:.BYTE $99
      .BYTE $8E
      .BYTE $48
      .BYTE $B0
      .BYTE 0
      .BYTE $9A
      .BYTE $99
      .BYTE $6F
      .BYTE $48
      .BYTE $76
      .BYTE 0
      .BYTE $9E
      .BYTE $99
      .BYTE $6B
      .BYTE $47
      .BYTE $72
      .BYTE 0
      .BYTE $26
      .BYTE $9A
      .BYTE $8A
      .BYTE $46
      .BYTE $AC
      .BYTE $28
      .BYTE $D4
      .BYTE $9B
      .BYTE $2B
      .BYTE $16
      .BYTE $3D
      .BYTE $28
      .BYTE $20
      .BYTE $9C
      .BYTE $A8
      .BYTE $54
      .BYTE $C9
      .BYTE $28
      .BYTE $F9
byte_BANK4_9056:.BYTE $9C
      .BYTE $DD
      .BYTE $73
      .BYTE $6C
      .BYTE $28
      .BYTE $3F
byte_BANK4_905C:.BYTE $9D
      .BYTE $B2
      .BYTE $73
      .BYTE $26
      .BYTE $28
      .BYTE 0
      .BYTE $9E
      .BYTE $38
      .BYTE $1D
      .BYTE $46
      .BYTE $28
      .BYTE $4D
      .BYTE $9E
      .BYTE $A7
      .BYTE $4F
      .BYTE $C8
      .BYTE $6E
      .BYTE $BD
      .BYTE $94
      .BYTE $53
      .BYTE $2A
      .BYTE $84
      .BYTE $28
      .BYTE $1C
      .BYTE $9F
      .BYTE $83
      .BYTE $42
      .BYTE 0
      .BYTE 0
      .BYTE $69
      .BYTE $94
      .BYTE $37
      .BYTE $1A
      .BYTE $49
      .BYTE $28
      .BYTE $C7
      .BYTE $9F
      .BYTE $96
      .BYTE $4B
      .BYTE 0
      .BYTE 0
      .BYTE $48
      .BYTE $A1
      .BYTE $1B
      .BYTE $D
      .BYTE 0
      .BYTE $CE
      .BYTE $A0
      .BYTE $1B
      .BYTE  $E
      .BYTE 0
      .BYTE $F2
      .BYTE $A0
      .BYTE $41
      .BYTE $27
      .BYTE 0
      .BYTE $93
      .BYTE $9B
      .BYTE $2F
      .BYTE $21
      .BYTE $38
      .BYTE $52
      .BYTE $BB
      .BYTE $A0
      .BYTE 0
      .BYTE $A
      .BYTE 0
      .BYTE $DF
      .BYTE $9A
      .BYTE $97
      .BYTE $61
      .BYTE $B0
      .BYTE $28
      .BYTE $6F
      .BYTE $A1
      .BYTE $17
      .BYTE $C
      .BYTE 0
      .BYTE $5D
      .BYTE $9A
      .BYTE $6C
      .BYTE $45
      .BYTE $79
      .BYTE $1B
      .BYTE $A7
      .BYTE $96
      .BYTE $BC
      .BYTE $64
      .BYTE $59
      .BYTE $1B
      .BYTE $3E
      .BYTE $96
      .BYTE $43
      .BYTE $22
      .BYTE $57
      .BYTE $1B
      .BYTE $94
      .BYTE $97
      .BYTE $8D
      .BYTE $47
byte_BANK4_90C0:.BYTE $BA
      .BYTE $1B
      .BYTE $78
byte_BANK4_90C3:.BYTE $98
      .BYTE $24
      .BYTE $12
      .BYTE $29
      .BYTE $28
      .BYTE $50
      .BYTE $95
      .BYTE $38
      .BYTE $1C
      .BYTE $83
      .BYTE $28
      .BYTE $A3
      .BYTE $95
      .BYTE $24
      .BYTE $12
      .BYTE $30	; 0
unk_BANK4_90D3:.BYTE $28
      .BYTE $E0
      .BYTE $95
      .BYTE $22
      .BYTE $10
      .BYTE $51
      .BYTE $28
      .BYTE  $F
      .BYTE $96
      .BYTE $17
      .BYTE  $A
      .BYTE $22
      .BYTE $6E
      .BYTE $1E
      .BYTE $91
      .BYTE $3D
      .BYTE $1F
      .BYTE $6D
      .BYTE $6E
      .BYTE $9C
      .BYTE $91
      .BYTE $41
      .BYTE $21
      .BYTE $8C
      .BYTE $6E
      .BYTE $80
      .BYTE $92
      .BYTE $2A
      .BYTE $5A
      .BYTE $19
      .BYTE $6E
      .BYTE $F2
      .BYTE $92
      .BYTE $4C
      .BYTE $14
      .BYTE $68
      .BYTE $6E
      .BYTE $D
      .BYTE $92
      .BYTE $43
      .BYTE $29
      .BYTE $1B
      .BYTE $6E
      .BYTE $76
      .BYTE $93
      .BYTE 0
      .BYTE $72
      .BYTE 0
MusicPointersFirstPart:.BYTE $10

      .BYTE 7
      .BYTE $29
      .BYTE $17
      .BYTE $18
      .BYTE $1E
      .BYTE $19
      .BYTE $1A
      .BYTE $23
MusicPointersEndPart:.BYTE $16

byte_BANK4_910D:.BYTE $F
      .BYTE $29
      .BYTE $17
      .BYTE $18
      .BYTE $22
      .BYTE $19
      .BYTE $1D
      .BYTE $28
MusicPointersLoopPart:.BYTE $11

      .BYTE 8
      .BYTE $29
      .BYTE $17
      .BYTE $18
      .BYTE $1E
      .BYTE $19
      .BYTE 0
      .BYTE $28
MusicData:.BYTE	$8A
      .BYTE $50
      .BYTE $84
      .BYTE $7E
      .BYTE $52
      .BYTE $50
      .BYTE $48
      .BYTE $82
      .BYTE $4C
      .BYTE $7E
      .BYTE $83
      .BYTE $50
      .BYTE $8A
      .BYTE $52
      .BYTE $88
      .BYTE $4C
      .BYTE $8A
      .BYTE $56
      .BYTE $82
byte_BANK4_9131:.BYTE $7E
      .BYTE $7E
      .BYTE $52
      .BYTE $52
      .BYTE $83
      .BYTE $50
      .BYTE $4C
      .BYTE $8B
      .BYTE $50
      .BYTE $88
      .BYTE $4C
      .BYTE 0
      .BYTE $8A
      .BYTE $3E
      .BYTE $84
      .BYTE $7E
byte_BANK4_9141:.BYTE $42
      .BYTE $3E
      .BYTE $38
      .BYTE $82
      .BYTE $3A
      .BYTE $7E
      .BYTE $83
      .BYTE $3E
      .BYTE $8A
      .BYTE $44
      .BYTE $88
      .BYTE $3A
      .BYTE $8A
      .BYTE $44
      .BYTE $82
      .BYTE $7E
      .BYTE $7E
      .BYTE $44
      .BYTE $44
      .BYTE $83
      .BYTE $3E
      .BYTE $3A
      .BYTE $8B
      .BYTE $3E
      .BYTE $88
      .BYTE $3A
      .BYTE $88
      .BYTE $30
      .BYTE $82
      .BYTE $30
      .BYTE $30
      .BYTE $83
      .BYTE $30
      .BYTE $84
      .BYTE $30
      .BYTE $30
      .BYTE $30
      .BYTE $30
      .BYTE $88
      .BYTE $30
      .BYTE $82
      .BYTE $30
      .BYTE $30
      .BYTE $83
      .BYTE $30
      .BYTE $84
      .BYTE $30
      .BYTE $30
      .BYTE $30
      .BYTE $30
      .BYTE $88
      .BYTE $30
      .BYTE $82
      .BYTE $30
      .BYTE $30
      .BYTE $83
      .BYTE $30
      .BYTE $84
      .BYTE $30
      .BYTE $30
      .BYTE $30
      .BYTE $30
      .BYTE $88
      .BYTE $30
      .BYTE $82
      .BYTE $30
      .BYTE $30
      .BYTE $83
      .BYTE $30
      .BYTE $84
      .BYTE $30
      .BYTE $30
      .BYTE $2E
      .BYTE $2E
      .BYTE $88
      .BYTE $10
      .BYTE $82
      .BYTE $10
      .BYTE $82
      .BYTE $10
      .BYTE $83
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE 0
      .BYTE $8A
      .BYTE $50
      .BYTE $84
      .BYTE $7E
      .BYTE $52
      .BYTE $50
      .BYTE $48
      .BYTE $82
      .BYTE $4C
      .BYTE $7E
      .BYTE $83
      .BYTE $4C
      .BYTE $8A
      .BYTE $56
      .BYTE $88
      .BYTE $3E
      .BYTE $8A
      .BYTE $4C
      .BYTE $84
      .BYTE $7E
byte_BANK4_91B0:.BYTE $4E
      .BYTE $4C
      .BYTE $44
      .BYTE $82
      .BYTE $48
      .BYTE $7E
      .BYTE $83
      .BYTE $48
      .BYTE $8A
      .BYTE $52
      .BYTE $88
      .BYTE $3A
      .BYTE 0
      .BYTE $8A
      .BYTE $48
      .BYTE $84
      .BYTE $7E
      .BYTE $48
      .BYTE $48
      .BYTE $3E
      .BYTE $82
      .BYTE $46
      .BYTE $7E
      .BYTE $83
      .BYTE $46
      .BYTE $8A
      .BYTE $4C
      .BYTE $88
      .BYTE $34
      .BYTE $8A
      .BYTE $44
      .BYTE $84
      .BYTE $7E
      .BYTE $44
      .BYTE $44
      .BYTE $3A
      .BYTE $82
      .BYTE $42
      .BYTE $7E
      .BYTE $83
      .BYTE $42
      .BYTE $8A
      .BYTE $48
      .BYTE $88
      .BYTE $30
      .BYTE $88
      .BYTE $30
      .BYTE $82
      .BYTE $30
      .BYTE $30
      .BYTE $83
      .BYTE $30
      .BYTE $84
      .BYTE $30
      .BYTE $30
      .BYTE $30
      .BYTE $30
      .BYTE $88
      .BYTE $2E
      .BYTE $82
      .BYTE $2E
      .BYTE $2E
      .BYTE $83
      .BYTE $2E
      .BYTE $84
      .BYTE $2E
      .BYTE $2E
      .BYTE $2E
      .BYTE $2E
      .BYTE $88
      .BYTE $2C
      .BYTE $82
      .BYTE $2C
      .BYTE $2C
      .BYTE $83
      .BYTE $2C
      .BYTE $84
      .BYTE $2C
      .BYTE $2C
      .BYTE $2C
      .BYTE $2C
      .BYTE $88
      .BYTE $2A
      .BYTE $82
      .BYTE $2A
      .BYTE $2A
      .BYTE $83
      .BYTE $2A
      .BYTE $84
      .BYTE $2A
      .BYTE $2A
      .BYTE $2A
      .BYTE $2A
      .BYTE $8A
      .BYTE $48
      .BYTE $84
      .BYTE $7E
      .BYTE $48
      .BYTE $4C
      .BYTE $52
      .BYTE $8A
      .BYTE $50
      .BYTE $88
      .BYTE $48
      .BYTE $3E
      .BYTE $8A
      .BYTE $42
      .BYTE $84
      .BYTE $7E
      .BYTE $42
      .BYTE $46
      .BYTE $48
      .BYTE $8A
      .BYTE $42
      .BYTE $84
      .BYTE $7E
      .BYTE $42
      .BYTE $46
      .BYTE $50
      .BYTE 0
byte_BANK4_9228:.BYTE $88
      .BYTE $10
      .BYTE $82
      .BYTE $10
      .BYTE $10
      .BYTE $83
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE 0
      .BYTE $8A
      .BYTE $40
      .BYTE $84
      .BYTE $7E
      .BYTE $40
      .BYTE $40
byte_BANK4_923C:.BYTE $48
      .BYTE $8A
      .BYTE $48
      .BYTE $88
      .BYTE $3E
      .BYTE $38
      .BYTE $8A
      .BYTE $3A
      .BYTE $84
      .BYTE $7E
      .BYTE $3A
      .BYTE $3A
      .BYTE $42
      .BYTE $8A
      .BYTE $3A
      .BYTE $84
      .BYTE $7E
      .BYTE $3A
      .BYTE $3A
      .BYTE $3A
      .BYTE $88
      .BYTE $28
      .BYTE $82
      .BYTE $28
      .BYTE $28
      .BYTE $83
      .BYTE $28
      .BYTE $84
      .BYTE $28
      .BYTE $28
      .BYTE $28
      .BYTE $28
      .BYTE $88
      .BYTE $26
      .BYTE $82
      .BYTE $26
      .BYTE $26
      .BYTE $83
      .BYTE $26
      .BYTE $84
      .BYTE $26
      .BYTE $26
      .BYTE $26
      .BYTE $26
      .BYTE $88
      .BYTE $34
      .BYTE $82
      .BYTE $34
      .BYTE $34
      .BYTE $83
      .BYTE $34
      .BYTE $84
      .BYTE $34
      .BYTE $34
      .BYTE $34
      .BYTE $34
      .BYTE $88
      .BYTE $26
      .BYTE $82
byte_BANK4_9277:.BYTE $26
      .BYTE $26
      .BYTE $83
      .BYTE $26
      .BYTE $84
      .BYTE $26
      .BYTE $26
      .BYTE $26
      .BYTE $26
      .BYTE $8A
      .BYTE $48
      .BYTE $84
      .BYTE $7E
      .BYTE $46
      .BYTE $48
byte_BANK4_9286:.BYTE $4C
      .BYTE $8A
      .BYTE $48
      .BYTE $84
      .BYTE $7E
      .BYTE $46
      .BYTE $48
      .BYTE $4C
      .BYTE $8A
      .BYTE $48
      .BYTE $84
      .BYTE $7E
      .BYTE $42
      .BYTE $48
      .BYTE $4C
      .BYTE $8A
      .BYTE $56
      .BYTE $7E
      .BYTE 0
      .BYTE $88
      .BYTE $10
      .BYTE $82
      .BYTE $10
      .BYTE $82
      .BYTE $10
      .BYTE $83
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE 0
      .BYTE $88
      .BYTE $2A
      .BYTE $82
      .BYTE $2A
      .BYTE $2A
      .BYTE $83
      .BYTE $2A
      .BYTE $84
      .BYTE $28
      .BYTE $28
      .BYTE $28
      .BYTE $28
      .BYTE $88
      .BYTE $26
      .BYTE $82
      .BYTE $26
      .BYTE $26
      .BYTE $83
      .BYTE $26
      .BYTE $84
      .BYTE $24
      .BYTE $24
      .BYTE $24
      .BYTE $24
      .BYTE $88
      .BYTE $22
byte_BANK4_92C4:.BYTE $82
      .BYTE $22
      .BYTE $22
      .BYTE $83
byte_BANK4_92C8:.BYTE $22
      .BYTE $84
      .BYTE $22
      .BYTE $22
      .BYTE $22
      .BYTE $22
      .BYTE $88
      .BYTE $26
      .BYTE $82
      .BYTE $26
      .BYTE $26
      .BYTE $83
      .BYTE $26
      .BYTE $84
      .BYTE $26
      .BYTE $26
      .BYTE $26
      .BYTE $26
      .BYTE $8A
      .BYTE $38
      .BYTE $84
      .BYTE $7E
      .BYTE $3A
      .BYTE $3A
      .BYTE $3A
      .BYTE $8A
      .BYTE $38
      .BYTE $84
      .BYTE $7E
      .BYTE $36
      .BYTE $36
      .BYTE $36
      .BYTE $8A
      .BYTE $34
      .BYTE $84
      .BYTE $7E
      .BYTE $30
      .BYTE $3A
      .BYTE $3A
      .BYTE $8A
      .BYTE $48
      .BYTE $46
      .BYTE $8A
      .BYTE $48
      .BYTE $48
      .BYTE $88
      .BYTE $48
      .BYTE $84
      .BYTE $26
      .BYTE $26
      .BYTE $26
      .BYTE $8A
      .BYTE $26
      .BYTE $7E
      .BYTE $8C
      .BYTE $7E
      .BYTE $88
      .BYTE $7E
      .BYTE $FC
      .BYTE $7E
      .BYTE $7E
      .BYTE 0
      .BYTE $88
      .BYTE $40
      .BYTE $82
      .BYTE $40
      .BYTE $40
      .BYTE $83
      .BYTE $40
      .BYTE $88
      .BYTE $3A
      .BYTE $82
byte_BANK4_9310:.BYTE $3A
      .BYTE $3A
      .BYTE $83
      .BYTE $3A
      .BYTE $88
      .BYTE $38
      .BYTE $84
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $88
      .BYTE $18
      .BYTE $F4
      .BYTE $48
      .BYTE $56
      .BYTE $50
      .BYTE $56
      .BYTE $46
      .BYTE $56
      .BYTE $4C
      .BYTE $56
      .BYTE $42
      .BYTE $56
      .BYTE $50
      .BYTE $56
      .BYTE $46
      .BYTE $56
      .BYTE $4C
      .BYTE $56
      .BYTE $F4
      .BYTE $48
      .BYTE $56
      .BYTE $50
      .BYTE $56
      .BYTE $46
      .BYTE $56
      .BYTE $4C
      .BYTE $56
      .BYTE $42
      .BYTE $56
      .BYTE $50
      .BYTE $56
      .BYTE $46
      .BYTE $56
      .BYTE $4C
      .BYTE $56
      .BYTE $88
      .BYTE $28
      .BYTE $82
      .BYTE $28
      .BYTE $28
      .BYTE $83
      .BYTE $28
      .BYTE $88
      .BYTE $2C
      .BYTE $82
      .BYTE $2C
      .BYTE $2C
      .BYTE $83
      .BYTE $2C
      .BYTE $88
      .BYTE $30
      .BYTE $84
      .BYTE $30
      .BYTE $30
      .BYTE $30
      .BYTE $8A
      .BYTE $30
      .BYTE $7E
      .BYTE $8C
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $88
      .BYTE $10
      .BYTE $82
      .BYTE $10
      .BYTE $10
      .BYTE $83
      .BYTE $10
      .BYTE $88
      .BYTE $10
      .BYTE $82
      .BYTE $10
      .BYTE $10
      .BYTE $83
      .BYTE $10
      .BYTE $88
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE $8A
      .BYTE $10
      .BYTE 1
      .BYTE $8C
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE $F4
      .BYTE $68
      .BYTE $6A
      .BYTE $6E
      .BYTE $64
      .BYTE $7E
      .BYTE $64
      .BYTE $7E
      .BYTE $64
      .BYTE $60
      .BYTE $64
      .BYTE $68
      .BYTE $5E
      .BYTE $7E
      .BYTE $5E
      .BYTE $7E
      .BYTE $56
      .BYTE $5A
      .BYTE $5E
      .BYTE $60
      .BYTE $56
      .BYTE $7E
      .BYTE $56
      .BYTE $54
      .BYTE $56
      .BYTE $5A
      .BYTE $5E
      .BYTE $60
      .BYTE $5E
      .BYTE $7E
      .BYTE $60
      .BYTE $64
      .BYTE $7E
      .BYTE $68
      .BYTE $6A
      .BYTE $6E
      .BYTE $64
      .BYTE $7E
      .BYTE $64
      .BYTE $6E
      .BYTE $76
      .BYTE $78
      .BYTE $7C
      .BYTE $78
      .BYTE $76
      .BYTE $7E
byte_BANK4_93A4:.BYTE $72
      .BYTE $6E
      .BYTE $6A
      .BYTE $68
      .BYTE $6A
      .BYTE $6E
      .BYTE $64
      .BYTE $7E
      .BYTE $64
      .BYTE $60
      .BYTE $5E
      .BYTE $60
      .BYTE $7E
      .BYTE $FB
      .BYTE $7E
      .BYTE $F4
      .BYTE $60
      .BYTE $64
      .BYTE $60
      .BYTE $64
      .BYTE $7E
      .BYTE $66
      .BYTE $6A
byte_BANK4_93BB:.BYTE $6E
      .BYTE $FC
      .BYTE $7E
      .BYTE $F4
      .BYTE $60
      .BYTE $64
      .BYTE $60
      .BYTE $64
      .BYTE $7E
      .BYTE $66
      .BYTE $7E
      .BYTE $6A
      .BYTE $6E
      .BYTE $7E
      .BYTE $FB
      .BYTE $7E
      .BYTE $F4
      .BYTE $60
      .BYTE $64
      .BYTE $60
      .BYTE $64
      .BYTE $7E
      .BYTE $66
      .BYTE $6A
      .BYTE $6E
      .BYTE $7E
      .BYTE $68
      .BYTE $60
      .BYTE $56
      .BYTE $FA
      .BYTE $7E
      .BYTE $F4
      .BYTE $60
      .BYTE $64
      .BYTE $60
      .BYTE $64
byte_BANK4_93DF:.BYTE $7E
      .BYTE $5A
      .BYTE $5E
      .BYTE $60
      .BYTE $64
      .BYTE $7E
      .BYTE $8B
      .BYTE $7E
      .BYTE 0
      .BYTE $F4
      .BYTE $48
      .BYTE $56
      .BYTE $50
      .BYTE $56
      .BYTE $46
      .BYTE $56
      .BYTE $4C
      .BYTE $56
      .BYTE $42
      .BYTE $56
      .BYTE $50
      .BYTE $56
      .BYTE $3E
      .BYTE $56
      .BYTE $4C
      .BYTE $56
      .BYTE $3A
      .BYTE $52
      .BYTE $48
      .BYTE $52
      .BYTE $38
      .BYTE $50
      .BYTE $46
      .BYTE $50
      .BYTE $34
      .BYTE $4C
      .BYTE $42
      .BYTE $4C
      .BYTE $3E
      .BYTE $52
      .BYTE $46
      .BYTE $52
      .BYTE $48
      .BYTE $56
      .BYTE $50
      .BYTE $56
      .BYTE $46
      .BYTE $56
byte_BANK4_940F:.BYTE $4C
      .BYTE $56
      .BYTE $44
      .BYTE $52
      .BYTE $4C
      .BYTE $52
      .BYTE $42
      .BYTE $52
      .BYTE $48
      .BYTE $52
      .BYTE $3E
      .BYTE $50
      .BYTE $48
      .BYTE $50
byte_BANK4_941D:.BYTE $3E
      .BYTE $4C
      .BYTE $46
      .BYTE $4C
      .BYTE $48
      .BYTE $56
      .BYTE $50
      .BYTE $56
      .BYTE $48
      .BYTE $56
      .BYTE $50
      .BYTE $56
      .BYTE $40
      .BYTE $4E
      .BYTE $48
      .BYTE $4E
      .BYTE $40
      .BYTE $4E
      .BYTE $48
byte_BANK4_9430:.BYTE $4E
      .BYTE $3E
      .BYTE $50
      .BYTE $48
      .BYTE $50
      .BYTE $3E
      .BYTE $50
      .BYTE $48
      .BYTE $50
      .BYTE $40
      .BYTE $4E
      .BYTE $48
      .BYTE $4E
      .BYTE $40
byte_BANK4_943E:.BYTE $4E
      .BYTE $48
      .BYTE $4E
      .BYTE $3E
      .BYTE $50
      .BYTE $48
      .BYTE $50
      .BYTE $3E
      .BYTE $50
      .BYTE $48
      .BYTE $50
      .BYTE $40
      .BYTE $4E
      .BYTE $48
      .BYTE $4E
      .BYTE $40
      .BYTE $4E
      .BYTE $48
      .BYTE $4E
      .BYTE $3E
      .BYTE $50
      .BYTE $48
      .BYTE $50
      .BYTE $3E
      .BYTE $50
      .BYTE $48
      .BYTE $50
      .BYTE $3C
      .BYTE $4C
      .BYTE $48
      .BYTE $4C
      .BYTE $3C
      .BYTE $4C
      .BYTE $48
      .BYTE $4C
      .BYTE $3E
      .BYTE $4C
      .BYTE $46
      .BYTE $4C
      .BYTE $3E
      .BYTE $52
      .BYTE $4C
      .BYTE $5E
      .BYTE $98
      .BYTE $48
      .BYTE $48
      .BYTE $48
byte_BANK4_946D:.BYTE $94
      .BYTE $7E
      .BYTE $48
byte_BANK4_9470:.BYTE $7E
      .BYTE $99
      .BYTE $48
      .BYTE $98
      .BYTE $48
      .BYTE $48
      .BYTE $46
      .BYTE $46
      .BYTE $46
      .BYTE $94
      .BYTE $7E
      .BYTE $46
      .BYTE $7E
      .BYTE $99
      .BYTE $46
      .BYTE $98
      .BYTE $46
      .BYTE $46
      .BYTE 0
      .BYTE $98
      .BYTE $3A
      .BYTE $3A
      .BYTE $3A
      .BYTE $94
      .BYTE $34
      .BYTE $98
      .BYTE $3A
      .BYTE $3A
      .BYTE $94
      .BYTE $34
      .BYTE $3A
      .BYTE $34
      .BYTE $98
      .BYTE $3A
      .BYTE $38
      .BYTE $38
      .BYTE $38
      .BYTE $94
      .BYTE $30
      .BYTE $98
      .BYTE $38
      .BYTE $38
      .BYTE $94
      .BYTE $30
      .BYTE $38
      .BYTE $30
      .BYTE $98
      .BYTE $38
      .BYTE $9A
      .BYTE $34
      .BYTE $99
      .BYTE $42
      .BYTE $4C
      .BYTE $98
      .BYTE $7E
      .BYTE $42
      .BYTE $4C
      .BYTE $9A
      .BYTE $30
      .BYTE $99
      .BYTE $3E
byte_BANK4_94AD:.BYTE $48
      .BYTE $98
      .BYTE $7E
      .BYTE $3E
      .BYTE $48
      .BYTE $94
      .BYTE 1
      .BYTE $98
      .BYTE $10
      .BYTE $94
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE 1
      .BYTE 1
      .BYTE 0
      .BYTE $A4
      .BYTE $A
      .BYTE $18
      .BYTE $22
      .BYTE $84
      .BYTE $40
      .BYTE $7E
      .BYTE $89
      .BYTE $42
      .BYTE $A4
      .BYTE $A
      .BYTE $18
      .BYTE $22
      .BYTE $84
      .BYTE $40
      .BYTE $7E
      .BYTE $89
      .BYTE $3E
      .BYTE $B8
      .BYTE $7E
      .BYTE $B9
      .BYTE $48
      .BYTE $44
      .BYTE $B8
      .BYTE $3A
      .BYTE $B9
      .BYTE $40
      .BYTE $B8
      .BYTE $44
      .BYTE $B4
      .BYTE $36
      .BYTE $B8
      .BYTE $3A
      .BYTE $B9
      .BYTE $30
      .BYTE $B9
      .BYTE $34
      .BYTE $BB
      .BYTE $36
      .BYTE $B8
      .BYTE $7E
      .BYTE 0
      .BYTE $B4
      .BYTE $A
      .BYTE $18
      .BYTE $22
      .BYTE $84
      .BYTE $36
      .BYTE $7E
      .BYTE $89
      .BYTE $38
      .BYTE $B4
      .BYTE $A
      .BYTE $18
      .BYTE $22
      .BYTE $84
      .BYTE $36
      .BYTE $7E
      .BYTE $89
      .BYTE $34
      .BYTE $B8
      .BYTE $7E
      .BYTE $B9
      .BYTE $3A
      .BYTE $36
      .BYTE $B8
      .BYTE $30
      .BYTE $B9
      .BYTE $36
      .BYTE $B8
      .BYTE $3A
      .BYTE $B4
      .BYTE $2C
      .BYTE $B8
      .BYTE $30
      .BYTE $B9
      .BYTE $22
      .BYTE $B9
      .BYTE $26
      .BYTE $BB
      .BYTE $28
      .BYTE $B8
      .BYTE $7E
      .BYTE $84
      .BYTE $22
      .BYTE $30
      .BYTE $3A
      .BYTE $42
      .BYTE $7E
      .BYTE $44
      .BYTE $3A
      .BYTE $30
      .BYTE $22
      .BYTE $30
      .BYTE $3A
      .BYTE $42
      .BYTE $7E
      .BYTE $40
      .BYTE $3A
      .BYTE $30
      .BYTE $22
      .BYTE $30
      .BYTE $3A
      .BYTE $30
      .BYTE $7E
      .BYTE $40
      .BYTE $3A
      .BYTE $30
      .BYTE $22
      .BYTE $30
      .BYTE $3A
      .BYTE $30
      .BYTE $7E
      .BYTE $40
      .BYTE $3A
      .BYTE $30
      .BYTE $22
      .BYTE $30
      .BYTE $3A
      .BYTE $30
      .BYTE $7E
      .BYTE $40
      .BYTE $3A
      .BYTE $30
      .BYTE $22
      .BYTE $30
      .BYTE $3A
      .BYTE $30
      .BYTE $7E
      .BYTE $40
      .BYTE $3A
      .BYTE $30
      .BYTE $85
      .BYTE 1
      .BYTE $8D
      .BYTE $10
      .BYTE $8E
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $88
      .BYTE $10
      .BYTE $84
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 0
      .BYTE $99
      .BYTE $48
      .BYTE $3E
      .BYTE $38
      .BYTE $98
      .BYTE $42
      .BYTE $46
      .BYTE $94
      .BYTE $44
      .BYTE $42
      .BYTE $7E
      .BYTE $96
      .BYTE $3E
      .BYTE $50
      .BYTE $56
      .BYTE $94
      .BYTE $5A
      .BYTE $7E
      .BYTE $52
      .BYTE $98
      .BYTE $56
      .BYTE $50
      .BYTE $94
      .BYTE $48
      .BYTE $4C
      .BYTE $99
      .BYTE $46
      .BYTE   0
      .BYTE $99
      .BYTE $38
      .BYTE $30
      .BYTE $26
      .BYTE $98
      .BYTE $30	; 0
      .BYTE $34	; 4
      .BYTE $94
      .BYTE $32	; 2
      .BYTE $98
      .BYTE $30	; 0
      .BYTE $96
      .BYTE $30	; 0
      .BYTE $3E
      .BYTE $46
      .BYTE $98
      .BYTE $48
      .BYTE $94
      .BYTE $42
      .BYTE $98
      .BYTE $46
      .BYTE $98
      .BYTE $42
      .BYTE $94
      .BYTE $38	; 8
      .BYTE $3A
      .BYTE $99
      .BYTE $34	; 4
      .BYTE $99
      .BYTE $3E
      .BYTE $38
      .BYTE $30
      .BYTE $98
      .BYTE $3A
      .BYTE $3E
      .BYTE $94
      .BYTE $3C
      .BYTE $3A
      .BYTE $7E
      .BYTE $96
      .BYTE $38	; 8
      .BYTE $48
      .BYTE $50
      .BYTE $94
      .BYTE $52
      .BYTE $7E
      .BYTE $4C
      .BYTE $50
      .BYTE $7E
      .BYTE $48
      .BYTE $7E
      .BYTE $42
      .BYTE $46
      .BYTE $99
      .BYTE $3E
      .BYTE $98
      .BYTE $7E
      .BYTE $94
      .BYTE $56
      .BYTE $54
      .BYTE $52
      .BYTE $4E
      .BYTE $7E
      .BYTE $50
      .BYTE $7E
      .BYTE $40
      .BYTE $42
      .BYTE $48
unk_BANK4_95B0:.BYTE $7E
      .BYTE $42
      .BYTE $48
      .BYTE $4C
      .BYTE   0
      .BYTE $98
      .BYTE $7E
      .BYTE $94
      .BYTE $50
      .BYTE $4E
      .BYTE $4C
      .BYTE $98
      .BYTE $46
      .BYTE $94
      .BYTE $48
      .BYTE $7E
      .BYTE $38	; 8
      .BYTE $3A
      .BYTE $3E
      .BYTE $7E
      .BYTE $30	; 0
      .BYTE $38	; 8
      .BYTE $3A
      .BYTE $99
      .BYTE $30	; 0
      .BYTE $3E
      .BYTE $98
      .BYTE $48
      .BYTE $99
      .BYTE $3A
unk_BANK4_95CE:.BYTE $94
      .BYTE $48
      .BYTE $98
      .BYTE $48
      .BYTE $3A
      .BYTE $98
      .BYTE 4
      .BYTE $92
      .BYTE 2
      .BYTE 1
      .BYTE 2
      .BYTE $98
      .BYTE 6
      .BYTE $92
      .BYTE 2
      .BYTE 1
      .BYTE 2
      .BYTE   0
      .BYTE $98
      .BYTE $7E
      .BYTE $94
      .BYTE $56
      .BYTE $54
      .BYTE $52
      .BYTE $4E
      .BYTE $7E
      .BYTE $50
      .BYTE $7E
      .BYTE $60
unk_BANK4_95EB:.BYTE $7E
      .BYTE $60
      .BYTE $9A
      .BYTE $60
      .BYTE   0
      .BYTE $98
      .BYTE $7E
      .BYTE $94
      .BYTE $50
      .BYTE $4E
      .BYTE $4C
      .BYTE $98
      .BYTE $46
      .BYTE $94
      .BYTE $48
      .BYTE $7E
      .BYTE $98
      .BYTE $52
      .BYTE $94
      .BYTE $52
      .BYTE $52
      .BYTE $99
      .BYTE $7E
      .BYTE $99
      .BYTE $30	; 0
      .BYTE $38	; 8
      .BYTE $94
      .BYTE $3E
      .BYTE $98
      .BYTE $48
      .BYTE $6E
      .BYTE $94
      .BYTE $6E
      .BYTE $98
      .BYTE $6E
      .BYTE $3E
unk_BANK4_960F:.BYTE $98
      .BYTE $7E
      .BYTE $99
      .BYTE $4E
      .BYTE $99
      .BYTE $4C
      .BYTE $9A
      .BYTE $48
      .BYTE $7E
      .BYTE   0
      .BYTE $98
      .BYTE $7E
      .BYTE $94
      .BYTE $40
      .BYTE $98
      .BYTE $7E
unk_BANK4_961F:.BYTE $94
      .BYTE $3A
      .BYTE $98
      .BYTE $7E
      .BYTE $9A
      .BYTE $38	; 8
      .BYTE $7E
      .BYTE $98
      .BYTE $30	; 0
      .BYTE $99
      .BYTE $40
      .BYTE $44
      .BYTE $48
      .BYTE $94
      .BYTE $3E
      .BYTE $98
      .BYTE $3E
      .BYTE $30	; 0
      .BYTE $98
      .BYTE   4
      .BYTE $92
      .BYTE   2
      .BYTE   1
      .BYTE   2
      .BYTE $98
      .BYTE   6
      .BYTE $92
      .BYTE   2
      .BYTE   1
      .BYTE   2
      .BYTE   0
      .BYTE $E4
      .BYTE $6E
      .BYTE $E8
      .BYTE $6A
      .BYTE $E4
      .BYTE $64
      .BYTE $E8
      .BYTE $5E
      .BYTE $E4
      .BYTE $56
      .BYTE $E8
      .BYTE $52
      .BYTE $E4
      .BYTE $4C
      .BYTE $E8
      .BYTE $46
      .BYTE $E4
      .BYTE $3E
      .BYTE $E8
      .BYTE $3C
      .BYTE $E4
      .BYTE $3A
      .BYTE $34
      .BYTE $2E
      .BYTE $E8
      .BYTE $26
      .BYTE $7E
      .BYTE $3E
      .BYTE $E8
      .BYTE $56
      .BYTE $7E
      .BYTE $E9
      .BYTE $3E
      .BYTE 0
      .BYTE $E4
      .BYTE $56
      .BYTE $E8
      .BYTE $52
      .BYTE $E4
      .BYTE $4C
      .BYTE $E8
      .BYTE $46
      .BYTE $E4
      .BYTE $3E
      .BYTE $E8
      .BYTE $3A
      .BYTE $E4
      .BYTE $34
      .BYTE $E8
      .BYTE $2E
      .BYTE $E4
      .BYTE $26
      .BYTE $E8
      .BYTE $24
      .BYTE $E4
      .BYTE $22
      .BYTE $1C
      .BYTE $16
      .BYTE $E8
      .BYTE $E
      .BYTE $7E
      .BYTE $26
      .BYTE $E8
      .BYTE $46
      .BYTE $7E
      .BYTE $E9
      .BYTE $3E
      .BYTE $EB
      .BYTE $7E
      .BYTE $7E
      .BYTE $E4
      .BYTE $3E
      .BYTE $E8
      .BYTE $3C
      .BYTE $E4
      .BYTE $3A
      .BYTE $34
      .BYTE $2E
      .BYTE $E8
      .BYTE $3E
byte_BANK4_968E:.BYTE $7E
      .BYTE $7E
      .BYTE $E8
      .BYTE $4C
      .BYTE $7E
      .BYTE $89
      .BYTE $7E
      .BYTE $E8
      .BYTE $10
      .BYTE 2
      .BYTE 6
      .BYTE $10
      .BYTE 2
      .BYTE 6
      .BYTE $10
      .BYTE 2
      .BYTE 6
      .BYTE $10
      .BYTE 1
      .BYTE $10
      .BYTE $10
      .BYTE 1
      .BYTE 1
      .BYTE $EA
      .BYTE 1
      .BYTE $E4
      .BYTE $50
      .BYTE $3E
      .BYTE $48
      .BYTE $50
      .BYTE $7E
      .BYTE $3E
      .BYTE $4E
      .BYTE $3E
      .BYTE $46
      .BYTE $4E
      .BYTE $7E
      .BYTE $3E
      .BYTE $EB
      .BYTE $50
      .BYTE $E4
      .BYTE $7E
      .BYTE $7E
      .BYTE $42
      .BYTE $46
      .BYTE $48
      .BYTE $4C
      .BYTE $50
      .BYTE $3E
      .BYTE $48
      .BYTE $50
      .BYTE $7E
      .BYTE $3E
      .BYTE $4E
      .BYTE $3E
      .BYTE $46
      .BYTE $52
      .BYTE $7E
      .BYTE $3E
      .BYTE $E9
      .BYTE $50
      .BYTE $E4
      .BYTE $26
      .BYTE $2A
      .BYTE $26
      .BYTE $E8
      .BYTE $2E
      .BYTE $2A
      .BYTE $26
      .BYTE $E4
      .BYTE $4C
      .BYTE $3E
      .BYTE $46
      .BYTE $4C
      .BYTE $7E
      .BYTE $3E
      .BYTE $4A
      .BYTE $3E
      .BYTE $44
      .BYTE $4A
      .BYTE $7E
      .BYTE $3E
      .BYTE $EB
      .BYTE $4C
      .BYTE $E4
      .BYTE $7E
      .BYTE $7E
      .BYTE $42
      .BYTE $46
      .BYTE $48
      .BYTE $4A
      .BYTE $4C
      .BYTE $3E
      .BYTE $46
      .BYTE $4C
      .BYTE $7E
      .BYTE $3E
      .BYTE $46
      .BYTE $3E
      .BYTE $46
      .BYTE $52
      .BYTE $7E
      .BYTE $46
      .BYTE $E9
      .BYTE $50
      .BYTE $E4
      .BYTE $26
      .BYTE $2A
      .BYTE $26
      .BYTE $E8
      .BYTE $2E
      .BYTE $30
      .BYTE $34
      .BYTE 0
      .BYTE $B8
      .BYTE 2
      .BYTE $10
      .BYTE $10
      .BYTE 2
      .BYTE $B4
      .BYTE $10
      .BYTE $10
      .BYTE $B8
      .BYTE $10
      .BYTE 0
      .BYTE $E4
      .BYTE $38
      .BYTE $3E
      .BYTE $48
      .BYTE $38
      .BYTE $7E
      .BYTE $3E
      .BYTE $36
      .BYTE $3E
      .BYTE $46
      .BYTE $36
      .BYTE $7E
      .BYTE $3E
      .BYTE $EB
byte_BANK4_9719:.BYTE $38
      .BYTE $E4
      .BYTE $7E
      .BYTE $7E
      .BYTE $42
      .BYTE $46
      .BYTE $48
      .BYTE $4C
      .BYTE $38
      .BYTE $3E
      .BYTE $48
      .BYTE $38
      .BYTE $7E
      .BYTE $3E
      .BYTE $36
      .BYTE $3E
      .BYTE $46
      .BYTE $3A
      .BYTE $7E
      .BYTE $3E
      .BYTE $E9
      .BYTE $48
      .BYTE $E4
      .BYTE $26
      .BYTE $2A
      .BYTE $26
      .BYTE $E8
      .BYTE $2E
      .BYTE $2A
      .BYTE $26
      .BYTE $E4
      .BYTE $34
      .BYTE $3E
      .BYTE $46
      .BYTE $34
      .BYTE $7E
      .BYTE $3E
      .BYTE $32
      .BYTE $3E
      .BYTE $44
      .BYTE $32
      .BYTE $7E
      .BYTE $3E
      .BYTE $EB
      .BYTE $34
      .BYTE $E4
      .BYTE $7E
      .BYTE $7E
      .BYTE $42
      .BYTE $46
      .BYTE $48
      .BYTE $4A
      .BYTE $34
      .BYTE $3E
      .BYTE $46
      .BYTE $34
      .BYTE $7E
      .BYTE $3E
      .BYTE $2E
      .BYTE $3E
      .BYTE $46
      .BYTE $3A
      .BYTE $7E
      .BYTE $46
      .BYTE $E9
      .BYTE $48
      .BYTE $E4
      .BYTE $26
      .BYTE $2A
      .BYTE $26
      .BYTE $E8
      .BYTE $2E
      .BYTE $30
      .BYTE $34
      .BYTE $88
      .BYTE $48
      .BYTE $56
      .BYTE $56
      .BYTE $46
      .BYTE $56
      .BYTE $56
      .BYTE $48
      .BYTE $56
      .BYTE $56
      .BYTE $3E
      .BYTE $56
      .BYTE $56
      .BYTE $48
      .BYTE $56
      .BYTE $56
      .BYTE $46
      .BYTE $56
      .BYTE $56
      .BYTE $48
      .BYTE $56
      .BYTE $56
      .BYTE $3E
      .BYTE $56
      .BYTE $56
      .BYTE $4C
      .BYTE $56
      .BYTE $56
      .BYTE $4A
      .BYTE $54
      .BYTE $54
      .BYTE $4C
      .BYTE $56
      .BYTE $56
      .BYTE $46
      .BYTE $56
      .BYTE $56
      .BYTE $4C
      .BYTE $56
      .BYTE $56
      .BYTE $46
      .BYTE $56
      .BYTE $56
      .BYTE $48
      .BYTE $56
      .BYTE $56
      .BYTE $3E
      .BYTE $56
      .BYTE $56
      .BYTE $E4
      .BYTE $56
      .BYTE $48
      .BYTE $7E
      .BYTE $56
      .BYTE $7E
      .BYTE $48
      .BYTE $56
      .BYTE $46
      .BYTE $7E
      .BYTE $56
      .BYTE $7E
      .BYTE $46
      .BYTE $56
      .BYTE $44
      .BYTE $7E
      .BYTE $56
      .BYTE $7E
      .BYTE $44
      .BYTE $56
      .BYTE $7E
      .BYTE $5A
      .BYTE $7E
      .BYTE $E6
      .BYTE $7E
      .BYTE $E4
      .BYTE $56
      .BYTE $52
      .BYTE $42
      .BYTE $7E
      .BYTE $52
      .BYTE $7E
      .BYTE $42
      .BYTE $52
      .BYTE $42
      .BYTE $7E
      .BYTE $52
      .BYTE $7E
      .BYTE $42
      .BYTE $52
      .BYTE $42
      .BYTE $7E
      .BYTE $52
      .BYTE $7E
      .BYTE $42
      .BYTE $52
      .BYTE $7E
      .BYTE $56
      .BYTE $7E
      .BYTE $E6
      .BYTE $7E
      .BYTE $E4
      .BYTE $52
      .BYTE $50
      .BYTE $3E
      .BYTE $3E
      .BYTE $50
      .BYTE $7E
      .BYTE $3E
      .BYTE $E8
      .BYTE $42
      .BYTE $46
      .BYTE $52
      .BYTE $E4
      .BYTE $50
      .BYTE $50
      .BYTE $E9
      .BYTE $50
      .BYTE $E4
      .BYTE $46
      .BYTE 0
      .BYTE $E4
      .BYTE $50
      .BYTE $48
      .BYTE $7E
      .BYTE $50
      .BYTE $7E
      .BYTE $48
      .BYTE $4C
      .BYTE $46
      .BYTE $7E
      .BYTE $4C
      .BYTE $7E
      .BYTE $46
      .BYTE $4A
      .BYTE $44
      .BYTE $7E
      .BYTE $4A
      .BYTE $7E
      .BYTE $44
      .BYTE $4A
      .BYTE $4A
      .BYTE $4A
      .BYTE $7E
      .BYTE $E6
      .BYTE $7E
      .BYTE $E4
      .BYTE $56
      .BYTE $4C
      .BYTE $42
      .BYTE $7E
      .BYTE $4C
      .BYTE $7E
      .BYTE $42
      .BYTE $4A
      .BYTE $42
      .BYTE $7E
      .BYTE $4A
      .BYTE $7E
      .BYTE $42
      .BYTE $48
      .BYTE $42
      .BYTE $7E
      .BYTE $48
      .BYTE $7E
      .BYTE $42
      .BYTE $46
      .BYTE $46
      .BYTE $46
      .BYTE $7E
      .BYTE $E6
      .BYTE $7E
      .BYTE $E4
      .BYTE $52
      .BYTE $30
      .BYTE $3E
      .BYTE $3E
      .BYTE $30
      .BYTE $7E
      .BYTE $3E
      .BYTE $E8
      .BYTE $3A
      .BYTE $3E
      .BYTE $46
      .BYTE $E4
      .BYTE $46
      .BYTE $46
      .BYTE $E9
      .BYTE $46
      .BYTE $E4
      .BYTE $3A
      .BYTE $48
      .BYTE $56
      .BYTE $56
      .BYTE $46
      .BYTE $56
      .BYTE $56
      .BYTE $44
      .BYTE $56
      .BYTE $56
      .BYTE $4A
      .BYTE $56
      .BYTE $86
      .BYTE $7E
      .BYTE $84
      .BYTE $7E
      .BYTE $88
      .BYTE $4C
      .BYTE $5A
      .BYTE $5A
      .BYTE $4A
      .BYTE $5A
      .BYTE $5A
      .BYTE $48
      .BYTE $5A
      .BYTE $5A
      .BYTE $46
      .BYTE $56
      .BYTE $86
      .BYTE $7E
      .BYTE $84
      .BYTE $7E
      .BYTE $88
      .BYTE $48
      .BYTE $56
      .BYTE $56
      .BYTE $3E
      .BYTE $56
      .BYTE $56
      .BYTE $84
      .BYTE $52
      .BYTE $52
      .BYTE $89
      .BYTE $52
      .BYTE $84
      .BYTE $46
      .BYTE $B8
      .BYTE 2
      .BYTE $10
      .BYTE $10
      .BYTE 2
      .BYTE $10
      .BYTE $10
      .BYTE 2
      .BYTE $10
      .BYTE $10
      .BYTE 2
      .BYTE $10
      .BYTE $86
      .BYTE 1
      .BYTE $84
      .BYTE 1
      .BYTE $88
      .BYTE 2
      .BYTE $10
      .BYTE $10
      .BYTE 2
      .BYTE $10
      .BYTE $10
      .BYTE 2
      .BYTE $10
      .BYTE $10
      .BYTE 2
      .BYTE $10
      .BYTE $86
      .BYTE 1
      .BYTE $84
      .BYTE 1
      .BYTE $88
      .BYTE 2
      .BYTE $10
      .BYTE $10
      .BYTE 2
      .BYTE $10
      .BYTE $10
      .BYTE 2
      .BYTE $10
      .BYTE $10
      .BYTE $48
      .BYTE $7E
      .BYTE $7E
      .BYTE $3E
      .BYTE $38
      .BYTE $34
      .BYTE $30
      .BYTE $7E
      .BYTE $7E
      .BYTE $26
      .BYTE $20
      .BYTE $1C
      .BYTE $E8
      .BYTE $18
      .BYTE $7E
      .BYTE $3E
      .BYTE $48
      .BYTE 0
      .BYTE $30
      .BYTE $7E
      .BYTE $7E
      .BYTE $26
      .BYTE $20
      .BYTE $1C
      .BYTE $18
      .BYTE $7E
      .BYTE $7E
      .BYTE $E
      .BYTE 8
      .BYTE 4
      .BYTE $E8
      .BYTE $18
      .BYTE $7E
      .BYTE 0
byte_BANK4_989A:.BYTE $2E
      .BYTE $38
      .BYTE $EB
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $30
      .BYTE $10
      .BYTE 1
      .BYTE 1
      .BYTE $10
      .BYTE 1
byte_BANK4_98A6:.BYTE 1
      .BYTE $10
      .BYTE 1
      .BYTE $10
      .BYTE $10
      .BYTE   1
      .BYTE   1
      .BYTE $96
      .BYTE $48
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $48
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
byte_BANK4_98CD:.BYTE $96
      .BYTE $48
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
byte_BANK4_98D6:.BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $98
      .BYTE $50
      .BYTE $7E
      .BYTE $4C
      .BYTE $7E
      .BYTE 0
      .BYTE $96
      .BYTE $3E
      .BYTE $92
      .BYTE $3E
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $3E
byte_BANK4_98EB:.BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $3E
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $3E
      .BYTE $96
      .BYTE $3C
      .BYTE $92
      .BYTE $3C
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $3C
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $3C
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $3C
      .BYTE $96
      .BYTE $3A
      .BYTE $92
      .BYTE $3A
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $3A
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $3A
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $3A
      .BYTE $98
      .BYTE $46
      .BYTE $7E
      .BYTE $3A
      .BYTE $7E
      .BYTE $96
      .BYTE $48
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $48
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
byte_BANK4_9935:.BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $48
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $48
      .BYTE $98
      .BYTE $3E
      .BYTE $7E
      .BYTE $46
      .BYTE $7E
      .BYTE $8A
      .BYTE 4
      .BYTE 1
      .BYTE 0
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $48
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $42
      .BYTE $A8
      .BYTE $50
      .BYTE $50
      .BYTE $A8
      .BYTE $50
      .BYTE $7E
      .BYTE $50
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $50
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $48
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $42
      .BYTE $AA
      .BYTE $3E
      .BYTE $A8
      .BYTE $48
      .BYTE $7E
      .BYTE $48
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $48
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $42
byte_BANK4_997A:.BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $3C
      .BYTE $AA
      .BYTE $38
      .BYTE $A8
      .BYTE $50
      .BYTE $7E
      .BYTE $50
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $50
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $48
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $42
      .BYTE $A8
      .BYTE $50
      .BYTE $50
      .BYTE $A4
      .BYTE $48
      .BYTE $A9
      .BYTE $7E
      .BYTE $AA
      .BYTE $7E
      .BYTE 0
      .BYTE $AA
      .BYTE $7E
      .BYTE $7E
      .BYTE 0
      .BYTE $C8
      .BYTE $7E
      .BYTE $48
      .BYTE $4C
      .BYTE $4E
      .BYTE 0
      .BYTE $A8
      .BYTE $3E
      .BYTE $7E
      .BYTE $A8
      .BYTE $3E
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $3E
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $38
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $38
      .BYTE $AA
      .BYTE $30
      .BYTE $A8
      .BYTE $3C
      .BYTE $7E
      .BYTE $3C
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $3C
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $34
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $34
      .BYTE $AA
      .BYTE $30
      .BYTE $A8
      .BYTE $3A
      .BYTE $7E
      .BYTE $3A
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $3A
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $34
      .BYTE $A6
      .BYTE $7E
      .BYTE $A2
      .BYTE $2E
      .BYTE $A8
      .BYTE $3E
      .BYTE $3E
      .BYTE $A4
      .BYTE $38
      .BYTE $A9
      .BYTE $7E
      .BYTE $AA
      .BYTE $7E
      .BYTE $AA
      .BYTE $7E
      .BYTE $7E
      .BYTE $C8
      .BYTE $7E
      .BYTE $38
      .BYTE $3A
      .BYTE $3C
      .BYTE $88
      .BYTE $30
      .BYTE $7E
      .BYTE $30
      .BYTE $7E
      .BYTE $30
      .BYTE $7E
      .BYTE $30
      .BYTE $7E
      .BYTE $34
      .BYTE $7E
      .BYTE $34
      .BYTE $7E
      .BYTE $34
      .BYTE $7E
      .BYTE $34
      .BYTE $7E
      .BYTE $3E
      .BYTE $7E
      .BYTE $3E
      .BYTE $7E
      .BYTE $3E
      .BYTE $7E
      .BYTE $3E
      .BYTE $7E
      .BYTE $30
      .BYTE $7E
      .BYTE $8A
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $8A
      .BYTE $7E
      .BYTE $7E
      .BYTE $88
      .BYTE 2
      .BYTE 4
      .BYTE 0
      .BYTE $82
      .BYTE 4
      .BYTE $82
      .BYTE 4
      .BYTE $82
      .BYTE 4
      .BYTE $86
      .BYTE 4
      .BYTE $82
      .BYTE 4
      .BYTE $82
      .BYTE 4
      .BYTE $82
      .BYTE 1
      .BYTE $82
      .BYTE 4
      .BYTE $82
      .BYTE 4
      .BYTE $82
      .BYTE 1
      .BYTE $82
      .BYTE 4
      .BYTE $C8
      .BYTE $50
      .BYTE $7E
      .BYTE $50
      .BYTE $C6
      .BYTE $7E
      .BYTE $C2
      .BYTE $50
      .BYTE $C6
      .BYTE $7E
      .BYTE $C8
      .BYTE $4C
      .BYTE $C2
      .BYTE $7E
      .BYTE $C8
      .BYTE $4C
      .BYTE $50
      .BYTE $C4
      .BYTE $4C
      .BYTE $7E
      .BYTE $48
      .BYTE $7E
      .BYTE $C2
      .BYTE $48
      .BYTE $C6
      .BYTE $46
      .BYTE $7E
      .BYTE $C8
      .BYTE $48
      .BYTE $C2
      .BYTE $7E
      .BYTE $C8
      .BYTE $42
      .BYTE $46
      .BYTE $48
      .BYTE $C8
      .BYTE $4C
      .BYTE $7E
      .BYTE $4C
      .BYTE $C6
      .BYTE $7E
      .BYTE $C2
      .BYTE $4C
      .BYTE $C6
      .BYTE $7E
      .BYTE $C8
      .BYTE $48
      .BYTE $C2
      .BYTE $7E
      .BYTE $C8
      .BYTE $46
      .BYTE $C4
      .BYTE $42
      .BYTE $7E
      .BYTE 0
      .BYTE $C8
      .BYTE $7E
      .BYTE $46
      .BYTE $48
      .BYTE $4A
      .BYTE $C8
      .BYTE $4C
      .BYTE $7E
      .BYTE $C6
      .BYTE $7E
      .BYTE $C8
      .BYTE $3E
      .BYTE $C2
      .BYTE $7E
      .BYTE 0
      .BYTE $C8
      .BYTE $40
      .BYTE $7E
      .BYTE $40
      .BYTE $C6
      .BYTE $7E
      .BYTE $C2
      .BYTE $40
      .BYTE $C6
      .BYTE $7E
      .BYTE $C8
      .BYTE $3C
      .BYTE $C2
      .BYTE $7E
      .BYTE $C8
      .BYTE $3C
      .BYTE $40
      .BYTE $C4
      .BYTE $38
      .BYTE $7E
      .BYTE $38
      .BYTE $7E
      .BYTE $C2
      .BYTE $38
      .BYTE $C6
      .BYTE $34
      .BYTE $7E
      .BYTE $C8
      .BYTE $38
      .BYTE $C2
      .BYTE $7E
      .BYTE $C8
      .BYTE $30
      .BYTE $34
      .BYTE $38
      .BYTE $C8
      .BYTE $3C
      .BYTE $7E
      .BYTE $3C
      .BYTE $C6
      .BYTE $7E
      .BYTE $C2
      .BYTE $3C
      .BYTE $C6
      .BYTE $7E
      .BYTE $C8
      .BYTE $38
      .BYTE $C2
      .BYTE $7E
      .BYTE $C8
      .BYTE $34
      .BYTE $C4
      .BYTE $30
      .BYTE $7E
      .BYTE $C8
      .BYTE $7E
      .BYTE $34
      .BYTE $38
      .BYTE $3A
      .BYTE $C8
      .BYTE $3C
      .BYTE $7E
      .BYTE $C6
      .BYTE $7E
      .BYTE $C8
      .BYTE $2E
      .BYTE $C2
      .BYTE $7E
      .BYTE $88
      .BYTE $38
      .BYTE $7E
      .BYTE $3C
      .BYTE $7E
      .BYTE $3E
      .BYTE $7E
      .BYTE $40
      .BYTE $46
      .BYTE $42
      .BYTE $7E
      .BYTE $46
      .BYTE $7E
      .BYTE $48
      .BYTE $7E
      .BYTE $46
      .BYTE $42
      .BYTE $34
      .BYTE $7E
      .BYTE $38
      .BYTE $7E
      .BYTE $3A
      .BYTE $7E
      .BYTE $3C
      .BYTE $42
      .BYTE $88
      .BYTE $7E
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $46
      .BYTE $7E
      .BYTE $8A
      .BYTE $7E
      .BYTE $88
      .BYTE 2
      .BYTE 4
      .BYTE 0
      .BYTE $88
      .BYTE 2
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE 2
      .BYTE 2
      .BYTE $7E
      .BYTE 6
      .BYTE $96
      .BYTE $50
      .BYTE $92
      .BYTE $4E
      .BYTE $96
      .BYTE $50
      .BYTE $92
      .BYTE $5E
      .BYTE $96
      .BYTE $58
      .BYTE $92
      .BYTE $50
      .BYTE $96
      .BYTE $68
      .BYTE $92
      .BYTE $5E
      .BYTE $96
      .BYTE $64
      .BYTE $92
      .BYTE $5E
      .BYTE $96
      .BYTE $5A
      .BYTE $92
      .BYTE $5E
      .BYTE $96
      .BYTE $58
      .BYTE $92
      .BYTE $52
      .BYTE $96
      .BYTE $50
      .BYTE $92
      .BYTE $4C
      .BYTE $96
      .BYTE $48
      .BYTE $92
      .BYTE $46
      .BYTE $96
      .BYTE $48
      .BYTE $92
      .BYTE $4C
      .BYTE $96
      .BYTE $50
      .BYTE $92
      .BYTE $4E
      .BYTE $96
      .BYTE $50
      .BYTE $92
      .BYTE $5A
      .BYTE $96
      .BYTE $58
      .BYTE $92
      .BYTE $50
      .BYTE $96
      .BYTE $4C
      .BYTE $92
      .BYTE $4E
      .BYTE $96
      .BYTE $5A
      .BYTE $92
      .BYTE $50
byte_BANK4_9B1B:.BYTE $96
      .BYTE $56
      .BYTE $92
      .BYTE $54
      .BYTE $96
      .BYTE $52
      .BYTE $92
      .BYTE $50
      .BYTE $96
      .BYTE $52
      .BYTE $92
      .BYTE $5A
      .BYTE $96
      .BYTE $68
      .BYTE $92
      .BYTE $4C
      .BYTE $96
      .BYTE $5A
      .BYTE $92
      .BYTE $58
      .BYTE $96
      .BYTE $56
      .BYTE $92
      .BYTE $68
      .BYTE $96
      .BYTE $56
      .BYTE $92
      .BYTE $54
      .BYTE $96
      .BYTE $52
      .BYTE $92
      .BYTE $64
      .BYTE $96
      .BYTE $5A
      .BYTE $92
      .BYTE $5C
      .BYTE 0
      .BYTE $C8
      .BYTE $50
      .BYTE $7E
      .BYTE $50
      .BYTE $C6
      .BYTE $7E
      .BYTE $C2
      .BYTE $50
      .BYTE $C6
      .BYTE $7E
      .BYTE $C8
      .BYTE $4C
      .BYTE $C2
      .BYTE $7E
      .BYTE $C8
      .BYTE $4C
      .BYTE $50
      .BYTE $C4
      .BYTE $4C
      .BYTE $7E
      .BYTE $48
      .BYTE $7E
      .BYTE $C2
      .BYTE $48
      .BYTE $C6
      .BYTE $46
      .BYTE $C6
      .BYTE $7E
      .BYTE $C8
      .BYTE $48
      .BYTE $C2
      .BYTE $7E
      .BYTE $C8
      .BYTE $42
      .BYTE $46
      .BYTE $48
      .BYTE $4C
      .BYTE $7E
      .BYTE $4C
      .BYTE $C6
      .BYTE $7E
      .BYTE $C2
      .BYTE $4C
      .BYTE $C6
      .BYTE $7E
      .BYTE $C8
      .BYTE $48
      .BYTE $C2
      .BYTE $7E
      .BYTE $C8
      .BYTE $46
      .BYTE $C4
      .BYTE $42
      .BYTE $7E
      .BYTE $88
      .BYTE $38
      .BYTE $7E
      .BYTE $3C
      .BYTE $7E
      .BYTE $3E
      .BYTE $7E
      .BYTE $40
      .BYTE $46
      .BYTE $42
      .BYTE $7E
      .BYTE $46
      .BYTE $7E
      .BYTE $48
      .BYTE $7E
      .BYTE $46
      .BYTE $42
      .BYTE $34
      .BYTE $7E
      .BYTE $38
      .BYTE $7E
      .BYTE $3A
      .BYTE $7E
      .BYTE $3C
      .BYTE $42
      .BYTE $88
      .BYTE 2
      .BYTE 4
      .BYTE 0
      .BYTE $96
      .BYTE $5E
      .BYTE $92
      .BYTE $5C
      .BYTE $96
      .BYTE $5E
      .BYTE $92
      .BYTE $5A
      .BYTE $96
      .BYTE $56
      .BYTE $92
      .BYTE $52
      .BYTE $96
      .BYTE $42
      .BYTE $92
      .BYTE $46
      .BYTE $96
      .BYTE $56
      .BYTE $92
      .BYTE $52
byte_BANK4_9BA7:.BYTE $96
      .BYTE $46
      .BYTE $92
      .BYTE $42
      .BYTE $96
      .BYTE $52
      .BYTE $92
      .BYTE $46
      .BYTE $96
byte_BANK4_9BB0:.BYTE $42
      .BYTE $92
      .BYTE $3E
byte_BANK4_9BB3:.BYTE 0
      .BYTE $C8
      .BYTE $7E
      .BYTE $46
      .BYTE $48
      .BYTE $4A
      .BYTE $C8
      .BYTE $4C
      .BYTE $7E
      .BYTE $C6
      .BYTE $7E
      .BYTE $C8
      .BYTE $3E
      .BYTE $C2
      .BYTE $7E
      .BYTE $88
      .BYTE $7E
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $46
      .BYTE $7E
      .BYTE $8A
      .BYTE $7E
      .BYTE $88
      .BYTE 2
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE 2
      .BYTE 2
      .BYTE $7E
      .BYTE 6
      .BYTE $A2
      .BYTE $7E
      .BYTE $7E
      .BYTE $56
      .BYTE $54
      .BYTE $7E
      .BYTE $52
      .BYTE $4C
      .BYTE $7E
      .BYTE $46
      .BYTE $42
      .BYTE $7E
      .BYTE $40
      .BYTE $A4
      .BYTE $3E
      .BYTE $7E
      .BYTE $56
      .BYTE $7E
      .BYTE $A8
      .BYTE $3E
      .BYTE $7E
      .BYTE 0
      .BYTE $A2
      .BYTE $7E
      .BYTE $7E
      .BYTE $46
      .BYTE $44
      .BYTE $7E
      .BYTE $42
      .BYTE $3A
      .BYTE $7E
      .BYTE $34
      .BYTE $30
      .BYTE $7E
      .BYTE $2E
      .BYTE $A4
      .BYTE $2E
      .BYTE $7E
      .BYTE $46
      .BYTE $7E
      .BYTE $A8
      .BYTE $3A
      .BYTE $7E
      .BYTE $82
      .BYTE $7E
      .BYTE $7E
      .BYTE $4C
      .BYTE $4A
      .BYTE $7E
      .BYTE $48
      .BYTE $46
      .BYTE $7E
      .BYTE $3E
      .BYTE $3A
      .BYTE $7E
      .BYTE $38
      .BYTE $88
      .BYTE $34
      .BYTE $4C
      .BYTE $34
      .BYTE $3E
      .BYTE $8A
      .BYTE 1
      .BYTE 1
      .BYTE $88
      .BYTE 2
      .BYTE $82
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 1
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE $82
      .BYTE $56
      .BYTE $7E
      .BYTE $48
      .BYTE $50
      .BYTE $7E
      .BYTE $88
      .BYTE $56
      .BYTE $82
      .BYTE $48
      .BYTE $50
      .BYTE $7E
      .BYTE $56
      .BYTE $46
      .BYTE $4E
      .BYTE $56
      .BYTE $5E
      .BYTE $7E
      .BYTE $8A
      .BYTE $5A
      .BYTE $82
      .BYTE $7E
      .BYTE $56
      .BYTE $7E
      .BYTE $44
      .BYTE $4C
      .BYTE $7E
      .BYTE $88
      .BYTE $56
      .BYTE $82
      .BYTE $44
      .BYTE $4C
      .BYTE $7E
      .BYTE $56
      .BYTE $4A
      .BYTE $50
      .BYTE $56
      .BYTE $5E
      .BYTE $7E
      .BYTE $8A
      .BYTE $5A
      .BYTE $82
      .BYTE $5E
      .BYTE $60
      .BYTE $7E
      .BYTE $5E
      .BYTE $60
      .BYTE $7E
      .BYTE $88
      .BYTE $5A
      .BYTE $82
byte_BANK4_9C53:.BYTE $60
      .BYTE $5E
      .BYTE $7E
      .BYTE $5A
      .BYTE $56
      .BYTE $7E
      .BYTE $54
      .BYTE $56
      .BYTE $7E
      .BYTE $88
      .BYTE $50
      .BYTE $82
      .BYTE $4A
      .BYTE $4C
      .BYTE $7E
      .BYTE $50
      .BYTE $52
      .BYTE $7E
      .BYTE $50
      .BYTE $52
      .BYTE $7E
      .BYTE $88
      .BYTE $46
      .BYTE $82
      .BYTE $50
      .BYTE $4C
      .BYTE $7E
      .BYTE $8A
      .BYTE $48
      .BYTE $7E
      .BYTE $82
      .BYTE $7E
      .BYTE 0
      .BYTE $82
      .BYTE $48
      .BYTE $7E
      .BYTE $38
      .BYTE $3E
      .BYTE $7E
      .BYTE $88
      .BYTE $48
      .BYTE $82
      .BYTE $38
      .BYTE $3E
      .BYTE $7E
      .BYTE $48
      .BYTE $36
      .BYTE $3E
      .BYTE $46
      .BYTE $4E
      .BYTE $7E
      .BYTE $8A
      .BYTE $46
      .BYTE $82
      .BYTE $7E
      .BYTE $44
      .BYTE $7E
      .BYTE $34
      .BYTE $3E
      .BYTE $7E
      .BYTE $88
      .BYTE $44
      .BYTE $82
      .BYTE $34
      .BYTE $3E
      .BYTE $7E
      .BYTE $44
      .BYTE $38
      .BYTE $42
      .BYTE $4A
      .BYTE $50
      .BYTE $7E
      .BYTE $8A
byte_BANK4_9C9C:.BYTE $4A
      .BYTE $82
      .BYTE $50
      .BYTE $5A
      .BYTE $7E
      .BYTE $56
      .BYTE $5A
      .BYTE $7E
      .BYTE $88
      .BYTE $52
      .BYTE $82
      .BYTE $5A
      .BYTE $56
      .BYTE $7E
      .BYTE $54
      .BYTE $50
      .BYTE $7E
      .BYTE $4E
      .BYTE $50
      .BYTE $7E
      .BYTE $88
      .BYTE $48
      .BYTE $82
      .BYTE $42
      .BYTE $46
      .BYTE $7E
      .BYTE $4A
      .BYTE $4C
      .BYTE $7E
      .BYTE $48
      .BYTE $4C
      .BYTE $7E
      .BYTE $88
      .BYTE $3E
      .BYTE $82
      .BYTE $48
      .BYTE $46
      .BYTE $7E
      .BYTE $8A
      .BYTE $3E
      .BYTE $8A
      .BYTE $7E
      .BYTE $82
      .BYTE $7E
      .BYTE $88
      .BYTE $30
      .BYTE $3E
      .BYTE $30
      .BYTE $3E
      .BYTE $2E
      .BYTE $3E
      .BYTE $2E
      .BYTE $3E
      .BYTE $2C
      .BYTE $3E
      .BYTE $2C
      .BYTE $3E
      .BYTE $2A
      .BYTE $3E
      .BYTE $2A
      .BYTE $3E
      .BYTE $22
      .BYTE $3A
      .BYTE $24
      .BYTE $3C
      .BYTE $26
      .BYTE $3E
      .BYTE $2A
      .BYTE $42
      .BYTE $34
      .BYTE $3A
      .BYTE $26
      .BYTE $34
      .BYTE $30
      .BYTE $26
      .BYTE $30
      .BYTE $7E
      .BYTE $88
      .BYTE 1
      .BYTE 2
      .BYTE 1
      .BYTE 2
      .BYTE $88
      .BYTE 1
      .BYTE 2
      .BYTE $82
byte_BANK4_9CF2:.BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 1
      .BYTE 2
      .BYTE 0
      .BYTE $92
      .BYTE $7E
      .BYTE $7E
      .BYTE $98
      .BYTE $50
      .BYTE $92
      .BYTE $7E
      .BYTE $56
      .BYTE $7E
      .BYTE $7E
      .BYTE $5A
      .BYTE $7E
      .BYTE $9A
      .BYTE $60
      .BYTE $92
      .BYTE $7E
      .BYTE $5A
      .BYTE $7E
      .BYTE $56
      .BYTE $50
      .BYTE $7E
      .BYTE $48
      .BYTE $4C
      .BYTE $7E
      .BYTE $50
      .BYTE $4C
      .BYTE $7E
      .BYTE $50
      .BYTE $4C
      .BYTE $7E
      .BYTE $42
      .BYTE $7E
      .BYTE $7E
      .BYTE $98
      .BYTE $4C
      .BYTE $90
      .BYTE $42
      .BYTE $4C
      .BYTE $42
      .BYTE $4C
      .BYTE $42
      .BYTE $4C
      .BYTE $42
      .BYTE $4C
      .BYTE $42
      .BYTE $4C
      .BYTE $42
      .BYTE $4C
      .BYTE $92
      .BYTE $7E
      .BYTE $98
      .BYTE $4C
      .BYTE $92
      .BYTE $50
      .BYTE $4C
      .BYTE $7E
      .BYTE $50
      .BYTE $4C
      .BYTE $7E
      .BYTE $50
      .BYTE $7E
      .BYTE $7E
      .BYTE $98
      .BYTE $5A
      .BYTE $92
      .BYTE $56
      .BYTE $5A
      .BYTE $7E
      .BYTE $56
      .BYTE 0
      .BYTE $92
      .BYTE $50
      .BYTE $7E
      .BYTE $4C
      .BYTE $48
      .BYTE $7E
      .BYTE $98
      .BYTE $50
      .BYTE $90
      .BYTE $3E
      .BYTE $50
      .BYTE $3E
      .BYTE $50
      .BYTE $3E
      .BYTE $50
      .BYTE $3E
      .BYTE $50
      .BYTE $3E
      .BYTE $50
      .BYTE $3E
      .BYTE $50
      .BYTE $92
      .BYTE $7E
      .BYTE $7E
      .BYTE $C2
      .BYTE $7E
      .BYTE $7E
      .BYTE $56
      .BYTE $7E
      .BYTE $4E
      .BYTE $7E
      .BYTE $46
      .BYTE $7E
      .BYTE $42
      .BYTE $7E
      .BYTE $3E
      .BYTE $7E
      .BYTE 0
      .BYTE $88
      .BYTE 6
      .BYTE $82
      .BYTE 2
      .BYTE 1
      .BYTE 2
      .BYTE 0
      .BYTE $92
      .BYTE $7E
      .BYTE $7E
      .BYTE $98
      .BYTE $3E
      .BYTE $92
      .BYTE $7E
      .BYTE $48
      .BYTE $7E
      .BYTE $7E
      .BYTE $50
      .BYTE $7E
      .BYTE $9A
      .BYTE $56
      .BYTE $92
      .BYTE $7E
      .BYTE $50
      .BYTE $7E
      .BYTE $48
      .BYTE $42
      .BYTE $7E
      .BYTE $3E
      .BYTE $3C
      .BYTE $7E
      .BYTE $3E
      .BYTE $3C
      .BYTE $7E
      .BYTE $3E
      .BYTE $3C
      .BYTE $7E
      .BYTE $34
      .BYTE $7E
      .BYTE $7E
      .BYTE $98
      .BYTE $3C
      .BYTE $90
      .BYTE $34
      .BYTE $3C
      .BYTE $34
      .BYTE $34
      .BYTE $3C
      .BYTE $34
      .BYTE $3C
      .BYTE $34
      .BYTE $3C
      .BYTE $90
      .BYTE $34
      .BYTE $3C
      .BYTE $34
      .BYTE $92
      .BYTE $7E
      .BYTE $98
      .BYTE $3A
      .BYTE $92
      .BYTE $3E
      .BYTE $3A
      .BYTE $7E
      .BYTE $3E
      .BYTE $3A
      .BYTE $7E
      .BYTE $3E
      .BYTE $7E
      .BYTE $7E
      .BYTE $98
      .BYTE $48
      .BYTE $92
      .BYTE $46
      .BYTE $48
      .BYTE $7E
      .BYTE $46
      .BYTE $92
      .BYTE $3E
      .BYTE $7E
      .BYTE $3A
      .BYTE $38
      .BYTE $7E
      .BYTE $98
      .BYTE $48
      .BYTE $90
      .BYTE $38
      .BYTE $48
      .BYTE $38
      .BYTE $48
      .BYTE $38
      .BYTE $48
      .BYTE $38
      .BYTE $48
      .BYTE $38
      .BYTE $48
      .BYTE $38
      .BYTE $48
      .BYTE $C2
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $46
      .BYTE $7E
      .BYTE $42
      .BYTE $7E
      .BYTE $3E
      .BYTE $7E
      .BYTE $3A
      .BYTE $7E
      .BYTE $36
      .BYTE $7E
      .BYTE $88
      .BYTE $30
      .BYTE $34
      .BYTE $38
      .BYTE $3E
      .BYTE $42
      .BYTE $3E
      .BYTE $38
      .BYTE $30
      .BYTE $34
      .BYTE $38
      .BYTE $3C
      .BYTE $2A
      .BYTE $82
      .BYTE $34
      .BYTE $7E
      .BYTE $38
      .BYTE $88
      .BYTE $30
      .BYTE $2E
      .BYTE $2A
      .BYTE $26
      .BYTE $3E
      .BYTE $3A
      .BYTE $34
      .BYTE $2E
      .BYTE $26
      .BYTE $88
      .BYTE $2A
      .BYTE $2E
      .BYTE $30
      .BYTE $32
      .BYTE $34
      .BYTE $36
      .BYTE $82
      .BYTE $38
      .BYTE $7E
      .BYTE $2E
      .BYTE $88
      .BYTE $2A
      .BYTE $26
      .BYTE $2E
      .BYTE $92
      .BYTE $5A
      .BYTE $7E
      .BYTE $56
      .BYTE $50
      .BYTE $7E
      .BYTE $9A
      .BYTE $48
      .BYTE $82
      .BYTE $3C
      .BYTE $3E
      .BYTE $7E
      .BYTE $40
      .BYTE $42
      .BYTE $7E
      .BYTE $48
      .BYTE $7E
      .BYTE $7E
      .BYTE $88
      .BYTE $7E
      .BYTE $82
      .BYTE $48
      .BYTE $88
      .BYTE $7E
      .BYTE $E2
      .BYTE $7E
      .BYTE $7E
      .BYTE $50
      .BYTE 0
      .BYTE $92
      .BYTE $48
      .BYTE $7E
      .BYTE $46
      .BYTE $3E
      .BYTE $7E
      .BYTE $9A
      .BYTE $38
      .BYTE $88
      .BYTE $7E
      .BYTE $82
      .BYTE $7E
      .BYTE $3A
      .BYTE $7E
      .BYTE $38
      .BYTE $7E
      .BYTE $7E
      .BYTE $88
      .BYTE $7E
      .BYTE $82
      .BYTE $38
      .BYTE $88
      .BYTE $7E
      .BYTE $E2
      .BYTE $7E
      .BYTE $7E
      .BYTE $38
      .BYTE $2A
      .BYTE $2E
      .BYTE $30
byte_BANK4_9E3B:.BYTE $26
      .BYTE $2A
      .BYTE $2E
      .BYTE $30
      .BYTE $82
      .BYTE $7E
      .BYTE $7E
      .BYTE $30
      .BYTE $88
      .BYTE $7E
      .BYTE $7E
      .BYTE $88
      .BYTE 6
      .BYTE $82
      .BYTE 2
      .BYTE 1
byte_BANK4_9E4B:.BYTE 2
      .BYTE 0
      .BYTE $E2
      .BYTE $7E
      .BYTE $7E
byte_BANK4_9E50:.BYTE $52
      .BYTE $4E
      .BYTE $7E
      .BYTE $50
      .BYTE $52
      .BYTE $7E
      .BYTE $4E
      .BYTE $50
      .BYTE $7E
      .BYTE $E8
      .BYTE $5E
      .BYTE $E2
      .BYTE $7E
      .BYTE $E8
      .BYTE $58
      .BYTE $52
      .BYTE $50
      .BYTE $E2
      .BYTE $4C
      .BYTE $E0
      .BYTE $50
      .BYTE $4C
      .BYTE $48
      .BYTE $E2
      .BYTE $46
      .BYTE $7E
      .BYTE $48
      .BYTE $E2
      .BYTE $4C
      .BYTE $7E
      .BYTE $48
      .BYTE $46
      .BYTE $7E
      .BYTE $EA
      .BYTE $48
      .BYTE $E2
      .BYTE $48
      .BYTE $E8
      .BYTE $46
      .BYTE $48
      .BYTE $E2
      .BYTE $7E
      .BYTE $7E
      .BYTE $E8
      .BYTE $4C
      .BYTE $E2
      .BYTE $7E
      .BYTE $E8
      .BYTE $4A
      .BYTE $E2
      .BYTE $4C
      .BYTE $7E
      .BYTE $E8
      .BYTE $5A
      .BYTE $E2
      .BYTE $7E
      .BYTE $E8
      .BYTE $54
      .BYTE $56
      .BYTE $5A
      .BYTE $EA
      .BYTE $5E
      .BYTE $5A
      .BYTE $E8
      .BYTE $58
      .BYTE $E2
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $56
      .BYTE $7E
      .BYTE $4C
      .BYTE $46
      .BYTE $7E
      .BYTE $3E
      .BYTE 0
      .BYTE $E2
      .BYTE $7E
      .BYTE $7E
      .BYTE $3A
      .BYTE $36
      .BYTE $7E
      .BYTE $38
      .BYTE $3A
      .BYTE $7E
      .BYTE $36
      .BYTE $38
      .BYTE $7E
      .BYTE $E8
byte_BANK4_9EA9:.BYTE $46
      .BYTE $E2
      .BYTE $7E
      .BYTE $E8
      .BYTE $40
      .BYTE $3A
      .BYTE $38
      .BYTE $E2
      .BYTE $34
      .BYTE $E0
      .BYTE $38
      .BYTE $34
      .BYTE $30
      .BYTE $E2
      .BYTE $2E
      .BYTE $7E
      .BYTE $30
      .BYTE $E2
      .BYTE $34
      .BYTE $7E
      .BYTE $30
      .BYTE $2E
      .BYTE $7E
      .BYTE $EA
      .BYTE $30
      .BYTE $E2
      .BYTE $30
      .BYTE $E8
      .BYTE $2E
      .BYTE $30
      .BYTE $E2
      .BYTE $7E
      .BYTE $7E
      .BYTE $E8
      .BYTE $34
      .BYTE $E2
      .BYTE $7E
      .BYTE $E8
      .BYTE $32
      .BYTE $E2
      .BYTE $34
      .BYTE $7E
      .BYTE $E8
      .BYTE $42
      .BYTE $E2
      .BYTE $7E
      .BYTE $E8
      .BYTE $3C
      .BYTE $3E
      .BYTE $42
      .BYTE $E2
      .BYTE $46
      .BYTE $7E
      .BYTE $44
      .BYTE $46
      .BYTE $7E
      .BYTE $5E
      .BYTE $42
      .BYTE $7E
      .BYTE $40
      .BYTE $42
      .BYTE $7E
      .BYTE $5A
      .BYTE $40
      .BYTE $7E
      .BYTE $3E
      .BYTE $40
      .BYTE $7E
      .BYTE $58
      .BYTE $3E
      .BYTE $7E
      .BYTE $34
      .BYTE $2E
      .BYTE $7E
      .BYTE $26
      .BYTE $88
      .BYTE $38
      .BYTE $46
      .BYTE $40
      .BYTE $3A
      .BYTE $38
      .BYTE $34
      .BYTE $2E
      .BYTE $28
      .BYTE $2A
      .BYTE $2E
      .BYTE $30
      .BYTE $34
      .BYTE $38
      .BYTE $30
      .BYTE $2E
      .BYTE $2A
      .BYTE $34
      .BYTE $38
      .BYTE $3C
      .BYTE $42
      .BYTE $34
      .BYTE $2A
      .BYTE $34
      .BYTE $3C
      .BYTE $3E
      .BYTE $3A
      .BYTE $34
      .BYTE $2E
      .BYTE $34
      .BYTE $2E
      .BYTE $2A
      .BYTE $26
      .BYTE $88
      .BYTE 6
      .BYTE $82
      .BYTE $10
      .BYTE 1
      .BYTE $10
      .BYTE 0
      .BYTE $94
      .BYTE $34
      .BYTE $36
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $36
      .BYTE $34
      .BYTE $36
      .BYTE $38
      .BYTE $3A
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE $3A
      .BYTE $38
      .BYTE $3A
      .BYTE 0
      .BYTE $94
      .BYTE $7E
      .BYTE $42
      .BYTE $42
      .BYTE $7E
      .BYTE $42
      .BYTE $42
      .BYTE $7E
      .BYTE $42
      .BYTE $7E
      .BYTE $42
      .BYTE $42
      .BYTE $7E
      .BYTE $42
      .BYTE $42
      .BYTE $7E
      .BYTE $42
      .BYTE $7E
      .BYTE $40
      .BYTE $40
      .BYTE $7E
      .BYTE $40
      .BYTE $40
      .BYTE $7E
      .BYTE $40
      .BYTE $7E
      .BYTE $40
      .BYTE $40
      .BYTE $7E
      .BYTE $40
      .BYTE $40
      .BYTE $7E
      .BYTE $40
      .BYTE $7E
      .BYTE $46
      .BYTE $46
      .BYTE $7E
      .BYTE $46
      .BYTE $46
      .BYTE $7E
      .BYTE $46
      .BYTE $7E
      .BYTE $46
      .BYTE $46
      .BYTE $7E
      .BYTE $46
      .BYTE $46
      .BYTE $7E
      .BYTE $46
      .BYTE $7E
      .BYTE $44
      .BYTE $44
      .BYTE $7E
      .BYTE $44
      .BYTE $44
      .BYTE $7E
      .BYTE $44
      .BYTE $7E
      .BYTE $44
      .BYTE $44
      .BYTE $7E
      .BYTE $44
      .BYTE $44
      .BYTE $7E
      .BYTE $44
      .BYTE $89
      .BYTE $3C
      .BYTE $3C
      .BYTE $88
      .BYTE $3C
      .BYTE $89
      .BYTE $3C
      .BYTE $3C
      .BYTE $88
      .BYTE $3C
      .BYTE $89
      .BYTE $3A
      .BYTE $3A
      .BYTE $88
      .BYTE $3A
      .BYTE $89
      .BYTE $3A
      .BYTE $3A
      .BYTE $88
      .BYTE $3A
      .BYTE $89
      .BYTE $40
      .BYTE $40
      .BYTE $88
      .BYTE $40
      .BYTE $89
      .BYTE $40
      .BYTE $40
      .BYTE $88
      .BYTE $40
      .BYTE $89
      .BYTE $3E
      .BYTE $3E
      .BYTE $88
      .BYTE $3E
      .BYTE $89
      .BYTE $3E
      .BYTE $3E
      .BYTE $88
      .BYTE $3E
      .BYTE $A9
      .BYTE $56
      .BYTE $54
      .BYTE $A8
      .BYTE $4C
      .BYTE $A9
      .BYTE $54
      .BYTE $52
      .BYTE $A8
      .BYTE $4A
      .BYTE $A9
      .BYTE $52
      .BYTE $50
      .BYTE $A8
      .BYTE $48
      .BYTE $A4
      .BYTE $4E
      .BYTE $AB
      .BYTE $4C
      .BYTE $A4
      .BYTE $7E
      .BYTE $A9
      .BYTE $5A
      .BYTE $58
      .BYTE $A8
      .BYTE $50
      .BYTE $A9
      .BYTE $58
      .BYTE $56
      .BYTE $A8
      .BYTE $4E
      .BYTE $A9
      .BYTE $56
      .BYTE $54
      .BYTE $A8
      .BYTE $4C
      .BYTE $A4
      .BYTE $52
      .BYTE $AB
      .BYTE $50
      .BYTE $A4
      .BYTE $7E
      .BYTE $4E
      .BYTE $4C
      .BYTE $4E
      .BYTE $4C
      .BYTE $4E
      .BYTE $4C
      .BYTE $4E
      .BYTE $4C
      .BYTE $50
      .BYTE $4E
      .BYTE $50
      .BYTE $4E
      .BYTE $50
      .BYTE $4E
      .BYTE $50
; end of 'BANK4'

; ===========================================================================

