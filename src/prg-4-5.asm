;
; Bank 4 & Bank 5
; ===============
;
; What's inside:
;
;   - Music engine
;   - Song data
;

; .segment BANK4
; * =  $8000


StartProcessingSoundQueue:
      LDA     #$FF
      STA     JOY2
      LDA     StackArea
      CMP     #Stack100_Pause
      BNE     ProcessMusicAndSfxQueues

      LDA     #%00001100 ; Mute the two square channels
      STA     SND_CHN
      ; You would think you could skip processing,
      ; since if the game is paused, nothing should
      ; be setting new music or whatever.
      ;
      ; You would be correct, except for the suicide code!
      ; That sets MusicQueue2.
      ;
      ; If not for processing it, the music would not
      ; change (or stop) when you used the code. Welp!
      JMP     ProcessOnlyMusicQueue2


ProcessMusicAndSfxQueues:
      JSR     ProcessSoundEffectQueue2

      JSR     ProcessSoundEffectQueue1

      JSR     ProcessSoundEffectQueue3

      JSR     ProcessDPCMQueue

ProcessOnlyMusicQueue2:
      JSR     ProcessMusicQueue2

      ; Reset queues
      LDA     #$00
      STA     SoundEffectQueue2
      STA     MusicQueue2
      STA     SoundEffectQueue1
      STA     DPCMQueue
      STA     MusicQueue1
      STA     SoundEffectQueue3
      RTS

; End of function StartProcessingSoundQueue

ProcessSoundEffectQueue2_Jump:
      LDA     #$42
      LDX     #$82
      LDY     #$A8
      JSR     PlaySquare1Sweep

      LDA     #$22
      STA     SoundEffectTimer2

ProcessSoundEffectQueue2_JumpPart2:
      LDA     SoundEffectTimer2
      CMP     #$20
      BNE     ProcessSoundEffectQueue2_JumpPart3

      LDX     #$DF
      LDY     #$F6
      BNE     ProcessSoundEffectQueue2_SetSquare1ThenDecrementTimer

ProcessSoundEffectQueue2_JumpPart3:
      CMP     #$1A
      BNE     ProcessSoundEffectQueue2_ThenDecrementTimer

      LDX     #$C1
      LDY     #$BC

ProcessSoundEffectQueue2_SetSquare1ThenDecrementTimer:
      JSR     SetSquare1VolumeAndSweep

      BNE     ProcessSoundEffectQueue2_ThenDecrementTimer

ProcessSoundEffectQueue2_CoinGet:
      LDA     #$35
      LDX     #$8D
      STA     SoundEffectTimer2

      LDY     #$7F
      LDA     #$5E
      JSR     PlaySquare1Sweep

ProcessSoundEffectQueue2_CoinGetPart2:
      LDA     SoundEffectTimer2
      CMP     #$30
      BNE     ProcessSoundEffectQueue2_ThenDecrementTimer

      LDA     #$54
      STA     SQ1_LO

ProcessSoundEffectQueue2_ThenDecrementTimer:
      BNE     ProcessSoundEffectQueue2_DecrementTimer

ProcessSoundEffectQueue2:
      LDA     SoundEffectPlaying2
      CMP     #SoundEffect2_Climbing
      BEQ     ProcessSoundEffectQueue2_DecrementTimer

      LDY     SoundEffectQueue2
      BEQ     ProcessSoundEffectQueue2_None

      STY     SoundEffectPlaying2
      LSR     SoundEffectQueue2
      BCS     ProcessSoundEffectQueue2_Jump

      LSR     SoundEffectQueue2
      BCS     ProcessSoundEffectQueue2_Climbing

      LSR     SoundEffectQueue2
      BCS     ProcessSoundEffectQueue2_CoinGet

      LSR     SoundEffectQueue2
      BCS     ProcessSoundEffectQueue2_Shrinking

      LSR     SoundEffectQueue2
      BCS     ProcessSoundEffectQueue2_IntroFallSlide

      LSR     SoundEffectQueue2
      BCS     ProcessSoundEffectQueue2_Growing

ProcessSoundEffectQueue2_None:
      LDA     SoundEffectPlaying2
      BEQ     ProcessSoundEffectQueue2_NoneExit

      ; Jumping
      LSR     A
      BCS     ProcessSoundEffectQueue2_JumpPart2

      ; Climbing
      LSR     A
      BCS     ProcessSoundEffectQueue2_DecrementTimer

      ; CoinGet
      LSR     A
      BCS     ProcessSoundEffectQueue2_CoinGetPart2

      ; Shrinking
      LSR     A
      BCS     ProcessSoundEffectQueue2_ShrinkingPart2

      ; IntroFallSlide
      LSR     A
      BCS     ProcessSoundEffectQueue2_DecrementTimer

      ; Growing
      LSR     A
      BCS     ProcessSoundEffectQueue2_GrowingPart2

ProcessSoundEffectQueue2_NoneExit:
      RTS

ProcessSoundEffectQueue2_IntroFallSlide:
      LDA     #$60
      LDY     #$A5
      BNE     ProcessSoundEffectQueue2_SingleSweep

ProcessSoundEffectQueue2_Climbing:
      STY     SoundEffectPlaying2
      LDA     #$05
      LDY     #$9C

; A = timer
; Y = sweep
ProcessSoundEffectQueue2_SingleSweep:
      LDX     #$9E
      STA     SoundEffectTimer2
      LDA     #$60
      JSR     PlaySquare1Sweep

ProcessSoundEffectQueue2_DecrementTimer:
      DEC     SoundEffectTimer2
      BNE     ProcessSoundEffectQueue2_Exit

      LDX     #%00001110
      STX     SND_CHN
      LDX     #%00001111
      STX     SND_CHN
      LDX     #$00
      STX     SoundEffectPlaying2

ProcessSoundEffectQueue2_Exit:
      RTS

; ---------------------------------------------------------------------------

ProcessSoundEffectQueue2_Shrinking:
      LDA     #$2F
      STA     SoundEffectTimer2

ProcessSoundEffectQueue2_ShrinkingPart2:
      LDA     SoundEffectTimer2
      LSR     A
      BCS     ProcessSoundEffectQueue2_ShrinkingPart3

      LSR     A
      BCS     ProcessSoundEffectQueue2_ShrinkingPart3

      AND     #$02
      BEQ     ProcessSoundEffectQueue2_ShrinkingPart3

      LDY     #$91
      LDX     #$9A
      LDA     #$68
      JSR     PlaySquare1Sweep

ProcessSoundEffectQueue2_ShrinkingPart3:
      JMP     ProcessSoundEffectQueue2_DecrementTimer

; ---------------------------------------------------------------------------

ProcessSoundEffectQueue2_Growing:
      LDA     #$36
      STA     SoundEffectTimer2

ProcessSoundEffectQueue2_GrowingPart2:
      LDA     SoundEffectTimer2
      LSR     A
      BCS     ProcessSoundEffectQueue2_DecrementTimer

      TAY
      LDA     MushroomSoundData-1,Y
      LDX     #$5D
      LDY     #$7F
      JSR     PlaySquare1Sweep

      JMP     ProcessSoundEffectQueue2_DecrementTimer

MushroomSoundData:
      .BYTE $6A, $74, $6A, $64, $5C, $52, $5C, $52, $4C, $44, $66, $70, $66, $60, $58, $4E
      .BYTE $58, $4E, $48, $40, $56, $60, $56, $50, $48, $3E, $48, $3E, $38, $30 ; $10


ProcessSoundEffectQueue1:
      LDA     SoundEffectQueue1
      BEQ     ProcessSoundEffectQueue1_None

      CMP     #SoundEffect1_StopwatchTick
      BNE     ProcessSoundEffectQueue1_Part2

      LDX     SoundEffectPlaying1
      BEQ     ProcessSoundEffectQueue1_Part2

ProcessSoundEffectQueue1_None:
      LDA     SoundEffectPlaying1
      BNE     ProcessSoundEffectQueue1_Part3

      RTS

ProcessSoundEffectQueue1_Part2:
      STA     SoundEffectPlaying1
      LDY     #$00

ProcessSoundEffectQueue1_PointerLoop:
      INY
      LSR     A
      BCC     ProcessSoundEffectQueue1_PointerLoop

      LDA     SoundEffectPointers-1,Y
      STA     SoundEffect1DataOffset

ProcessSoundEffectQueue1_Part3:
      LDY     SoundEffect1DataOffset
      INC     SoundEffect1DataOffset
      LDA     SoundEffectPointers,Y
      BMI     ProcessSoundEffectQueue1_Patch

      BNE     ProcessSoundEffectQueue1_Note

      ; if it was $00, we're at the end of the data for this sound effect
      LDX     #$90
      STX     SQ2_VOL
      LDX     #$18
      STX     SQ2_HI
      LDX     #$00
      STX     SQ2_LO
      STX     SoundEffectPlaying1
      RTS

ProcessSoundEffectQueue1_Patch:
      STA     SQ2_VOL
      LDY     SoundEffect1DataOffset
      INC     SoundEffect1DataOffset
      LDA     SoundEffectPointers,Y

ProcessSoundEffectQueue1_Note:
      CMP     #$7E
      BEQ     ProcessSoundEffectQueue1_Exit

      JSR     PlaySquare2Note

ProcessSoundEffectQueue1_Exit:
      LDA     #$7F
      STA     SQ2_SWEEP

      RTS


SoundEffectPointers:
      .BYTE SoundEffect1Data_BirdoShot - SoundEffectPointers
      .BYTE SoundEffect1Data_PotionDoorBong - SoundEffectPointers
      .BYTE SoundEffect1Data_CherryGet - SoundEffectPointers
      .BYTE SoundEffect1Data_ThrowItem - SoundEffectPointers
      .BYTE SoundEffect1Data_1UP - SoundEffectPointers
      .BYTE SoundEffect1Data_EnemyHit - SoundEffectPointers
      .BYTE SoundEffect1Data_StopwatchTick - SoundEffectPointers
      .BYTE SoundEffect1Data_HawkOpen_WartBarf - SoundEffectPointers

SoundEffect1Data_PotionDoorBong:
      .BYTE $9F
      .BYTE $10, $0E, $0C, $7E, $7E, $7E
      .BYTE $10, $0E, $0C, $7E, $7E, $7E
      .BYTE $86
      .BYTE $10, $0E, $0C, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
      .BYTE $00

SoundEffect1Data_ThrowItem:
      .BYTE $9F, $64, $7E, $7E
      .BYTE $9E, $68, $7E, $7E
      .BYTE $9D, $6A, $7E, $7E
      .BYTE $9C, $6E, $7E, $7E
      .BYTE $9B, $72, $7E, $7E
      .BYTE $9A, $76, $7E, $7E
      .BYTE $84, $78, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
      .BYTE $00

SoundEffect1Data_BirdoShot:
      .BYTE $9F, $30, $34, $36, $38
      .BYTE $9F, $3C, $3E, $40, $42
      .BYTE $9A, $3A, $3C, $3E, $40
      .BYTE $9C, $38, $3A, $3C, $3E
      .BYTE $96, $36, $38, $3A, $3C
      .BYTE $98, $34, $36, $38, $36
      .BYTE $00

SoundEffect1Data_CherryGet:
      .BYTE $81, $56, $7E, $64, $7E, $68
      .BYTE $00

SoundEffect1Data_EnemyHit:
      .BYTE $99, $18, $1A, $18, $1C, $18, $1A
      .BYTE $9B, $18, $1C, $18, $20, $18, $22
      .BYTE $9F, $18, $3C, $24, $30, $3C, $18, $30
      .BYTE $00

SoundEffect1Data_StopwatchTick:
      .BYTE $80
      .BYTE $68, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
      .BYTE $60, $7E, $7E
      .BYTE $64, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
      .BYTE $56, $7E, $7E
      .BYTE $00

SoundEffect1Data_HawkOpen_WartBarf:
      .BYTE $80, $1E, $1C, $1E, $1A, $18, $16, $1C, $18, $1A, $1E, $18
      .BYTE $16, $14, $12, $14, $16, $14, $12, $2C, $2C, $2A, $2E, $2C
      .BYTE $2A, $28, $26, $28, $24, $22, $20, $1E, $1C, $1A, $18, $16
      .BYTE $14, $14, $12, $10, $0E, $0C, $0A, $08, $08, $06, $04, $02, $02
      .BYTE $00

SoundEffect1Data_1UP:
      .BYTE $81
      .BYTE $5E, $7E, $7E, $7E, $7E, $7E, $7E
      .BYTE $64, $7E, $7E, $7E, $7E, $7E, $7E
      .BYTE $76, $7E, $7E, $7E, $7E, $7E, $7E
      .BYTE $6E, $7E, $7E, $7E, $7E, $7E, $7E
      .BYTE $72, $7E, $7E, $7E, $7E, $7E, $7E
      .BYTE $7C, $7E, $7E
      .BYTE $00


ProcessSoundEffectQueue3_ShortNoise:
      LDA     #$02
      STA     SoundEffectTimer3

ProcessSoundEffectQueue3_ShortNoisePart2:
      LDA     #$1A
      STA     NOISE_VOL
      LDA     #$04
      STA     NOISE_LO
      STA     NOISE_HI
      BNE     ProcessSoundEffectQueue3_DecrementTimer

ProcessSoundEffectQueue3:
      LDY     SoundEffectQueue3
      BEQ     ProcessSoundEffectQueue3_Part2

      STY     SoundEffectPlaying3
      LSR     SoundEffectQueue3
      BCS     ProcessSoundEffectQueue3_ShortNoise

      LSR     SoundEffectQueue3
      BCS     ProcessSoundEffectQueue3_Rumble

      LSR     SoundEffectQueue3
      BCS     ProcessSoundEffectQueue3_Rumble

ProcessSoundEffectQueue3_Part2:
      LDA     SoundEffectPlaying3
      LSR     A
      BCS     ProcessSoundEffectQueue3_ShortNoisePart2

      LSR     A
      BCS     ProcessSoundEffectQueue3_RumblePart2

      LSR     A
      BCS     ProcessSoundEffectQueue3_RumblePart2

      RTS

ProcessSoundEffectQueue3_Rumble:
      LDA     #$7F
      STA     SoundEffectTimer3

ProcessSoundEffectQueue3_RumblePart2:
      LDY     SoundEffectTimer3
      LDA     ProcessMusicQueue2,Y ; weird, but i guess that's one way to get "random" noise
      ORA     #$0C
      STA     NOISE_LO
      LDA     SoundEffectTimer3
      LSR     A
      LSR     A
      LSR     A
      AND     #$1F
      ORA     #$10
      STA     NOISE_VOL
      LDA     #$18
      STA     NOISE_HI

ProcessSoundEffectQueue3_DecrementTimer:
      DEC     SoundEffectTimer3
      BNE     ProcessSoundEffectQueue3_Exit

      LDX     #$07
      STX     SND_CHN
      LDX     #$0F
      STX     SND_CHN
      LDX     #$00
      STX     SoundEffectPlaying3

ProcessSoundEffectQueue3_Exit:
      RTS


ProcessDPCMQueue:
      LDA     DPCMQueue
      BNE     ProcessDPCMQueue_Part2

      LDA     DPCMPlaying
      BEQ     ProcessDPCMQueue_None

      DEC     DPCMTimer
      BNE     ProcessDPCMQueue_Exit

ProcessDPCMQueue_None:
      LDA     #$00
      STA     DPCMPlaying
      LDA     #%00001111
      STA     SND_CHN

ProcessDPCMQueue_Exit:
      RTS

ProcessDPCMQueue_Part2:
      STA     DPCMPlaying
      LDY     #$00

ProcessDPCMQueue_PointerLoop:
      INY
      LSR     A
      BCC     ProcessDPCMQueue_PointerLoop

      LDA     DMCFreqTable-1,Y
      STA     DMC_FREQ

      LDA     DMCStartTable-1,Y
      STA     DMC_START
      LDA     DMCLengthTable-1,Y
      STA     DMC_LEN
      LDA     #$A0
      STA     DPCMTimer
      LDA     #%00001111
      STA     SND_CHN
      LDA     #%00011111
      STA     SND_CHN
      RTS


DMCStartTable:
      .BYTE $4F
      ; @TODO
      ; It seems that the references to these tables are off by one byte, maybe intentionally?
      ; Need to fix this in the final disassembly
      .BYTE $60
      .BYTE $4B
      .BYTE $00
      .BYTE $31
      .BYTE $60
      .BYTE $0E
      .BYTE $1D

DMCLengthTable:
      .BYTE $43
      .BYTE $14
      .BYTE $10
      .BYTE $38
      .BYTE $48
      .BYTE $28
      .BYTE $3C
      .BYTE $50

DMCFreqTable:
      .BYTE $0E
      .BYTE $0E
      .BYTE $0F
      .BYTE $0F
      .BYTE $0F
      .BYTE $0F
      .BYTE $0F
      .BYTE $0F
      .BYTE $60


ProcessMusicQueue2_ThenReadNoteData:
      JMP     ProcessMusicQueue2_ReadNoteData

ProcessMusicQueue2_StopMusic:
      JMP     StopMusic

ProcessMusicQueue2:
      LDA     MusicQueue2
      BMI     ProcessMusicQueue2_StopMusic

      CMP     #Music2_EndingAndCast
      BEQ     ProcessMusicQueue2_EndingAndCast

      LDA     MusicQueue2
      BNE     ProcessMusicQueue2_Part2

      LDA     MusicQueue1
      BNE     ProcessMusicQueue2_MusicQueue1

      LDA     MusicPlaying2
      ORA     MusicPlaying1
      BNE     ProcessMusicQueue2_ThenReadNoteData

      RTS

ProcessMusicQueue2_EndingAndCast:
      STA     MusicPlaying2
      LDY     #$00
      STY     MusicPlaying1
      LDY     #$08 ; index of ending music pointer
      BNE     ProcessMusicQueue2_ReadFirstPointer

ProcessMusicQueue2_MusicQueue1:
      STA     MusicPlaying1
      LDY     #$00
      STY     MusicPlaying2
      LDY     #$FF

ProcessMusicQueue2_FirstPointerLoop:
      INY
      LSR     A
      BCC     ProcessMusicQueue2_FirstPointerLoop

ProcessMusicQueue2_ReadFirstPointer:
      LDA     MusicPointersFirstPart,Y
      STA     MusicPointerFirstPart
      LDA     MusicPointersEndPart,Y
      CLC
      ADC     #$02
      STA     MusicPointerEndPart
      LDA     MusicPointersLoopPart,Y
      STA     MusicPointerLoopPart
      LDA     MusicPointerFirstPart

ProcessMusicQueue2_SetCurrentPart:
      STA     MusicPointerCurrentPart

ProcessMusicQueue2_SetNextPart:
      INC     MusicPointerCurrentPart
      LDY     MusicPointerCurrentPart
      CPY     MusicPointerEndPart
      BNE     ProcessMusicQueue2_ReadHeader

      LDA     MusicPointerLoopPart
      BNE     ProcessMusicQueue2_SetCurrentPart

      JMP     StopMusic

ProcessMusicQueue2_Part2:
      STA     MusicPlaying2
      LDY     MusicPlaying1
      STY     MusicResume1
      LDY     #$00
      STY     MusicPlaying1

ProcessMusicQueue2_PointerLoop:
      INY
      LSR     A
      BCC     ProcessMusicQueue2_PointerLoop

ProcessMusicQueue2_ReadHeader:
      LDA     MusicPartPointers-1,Y
      TAY
      LDA     MusicPartPointers,Y
      STA     MusicTempoSetting
      LDA     MusicPartPointers+1,Y
      STA     CurrentMusicPointer
      LDA     MusicPartPointers+2,Y
      STA     CurrentMusicPointer+1
      LDA     MusicPartPointers+3,Y
      STA     CurrentMusicTriangleOffset
      LDA     MusicPartPointers+4,Y
      STA     CurrentMusicSquare1Offset
      LDA     MusicPartPointers+5,Y
      STA     CurrentMusicNoiseOffset
      STA     CurrentMusicNoiseStartOffset
      STA     CurrentMusicDPCMOffset
      STA     CurrentMusicDPCMStartOffset
      LDA     #$01
      STA     MusicSquare2NoteLength
      STA     MusicSquare1NoteLength
      STA     MusicTriangleNoteLength
      STA     MusicNoiseNoteLength
      STA     MusicDPCMNoteLength
      LDA     #$00
      STA     MusicSquare1NoteOffset
      STA     MusicSquare1NoteSweep

      LDA     #%00001011
      STA     SND_CHN
      LDA     #%00001111
      STA     SND_CHN

ProcessMusicQueue2_ReadNoteData:
      DEC     MusicSquare2NoteLength
      BNE     ProcessMusicQueue2_SustainNote

      LDY     MusicSquare1NoteOffset
      INC     MusicSquare1NoteOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     ProcessMusicQueue2_EndOfSegment

      BPL     ProcessMusicQueue2_Note

      BNE     ProcessMusicQueue2_Patch

ProcessMusicQueue2_EndOfSegment:
      LDA     MusicPlaying1
      BNE     ProcessMusicQueue2_ThenSetNextPart

      LDA     MusicPlaying2
      CMP     #Music2_EndingAndCast
      BEQ     ProcessMusicQueue2_ThenSetNextPart

      AND     #Music1_Overworld|Music1_Inside|Music1_Subspace
      BEQ     StopMusic

      LDA     MusicResume1
      BNE     ProcessMusicQueue2_ResumeMusicQueue1

StopMusic:
      LDA     #$00
      STA     MusicPlaying2
      STA     MusicPlaying1
      STA     SND_CHN
      LDX     #%00001111
      STX     SND_CHN
      RTS

ProcessMusicQueue2_ThenSetNextPart:
      JMP     ProcessMusicQueue2_SetNextPart

ProcessMusicQueue2_ResumeMusicQueue1:
      JMP     ProcessMusicQueue2_MusicQueue1

ProcessMusicQueue2_Patch:
      TAX
      AND     #$F0
      STA     MusicSquare2Patch
      TXA
      JSR     ProcessMusicQueue2_PatchNoteLength

      STA     MusicSquare2NoteStartLength
      LDY     MusicSquare1NoteOffset
      INC     MusicSquare1NoteOffset
      LDA     (CurrentMusicPointer),Y

ProcessMusicQueue2_Note:
      LDX     SoundEffectPlaying1
      BNE     loc_BANK4_849B

      JSR     PlaySquare2Note

      TAY
      BNE     loc_BANK4_848D

      LDA     byte_RAM_BF
      JMP     loc_BANK4_8495

; ---------------------------------------------------------------------------

loc_BANK4_848D:
      LDA     MusicSquare2NoteStartLength
      LDX     byte_RAM_BF
      JSR     sub_BANK4_8634

loc_BANK4_8495:
      STA     byte_RAM_619
      JSR     SetSquare2VolumeAndSweep

loc_BANK4_849B:
      LDA     MusicSquare2NoteStartLength
      STA     MusicSquare2NoteLength

ProcessMusicQueue2_SustainNote:
      LDX     SoundEffectPlaying1
      BNE     loc_BANK4_84BF

      LDY     byte_RAM_619
      BEQ     loc_BANK4_84AE

      DEC     byte_RAM_619

loc_BANK4_84AE:
      LDA     MusicSquare2NoteStartLength
      LDX     MusicSquare2Patch
      JSR     sub_BANK4_8643

      STA     SQ2_VOL
      LDX     #$7F
      STX     SQ2_SWEEP

loc_BANK4_84BF:
      DEC     MusicSquare1NoteLength
      BNE     ProcessMusicQueue2_Square1SustainNote

loc_BANK4_84C4:
      LDY     CurrentMusicSquare1Offset
      INC     CurrentMusicSquare1Offset
      LDA     (CurrentMusicPointer),Y
      BPL     loc_BANK4_84E3

      TAX
      AND     #$F0
      STA     MusicSquare1Patch
      TXA
      JSR     ProcessMusicQueue2_PatchNoteLength

      STA     MusicSquare1NoteStartLength
      LDY     CurrentMusicSquare1Offset
      INC     CurrentMusicSquare1Offset
      LDA     (CurrentMusicPointer),Y

loc_BANK4_84E3:
      TAY
      BNE     ProcessMusicQueue2_Square1Note

      LDA     #$83
      STA     SQ1_VOL
      LDA     #$94
      STA     SQ1_SWEEP
      STA     MusicSquare1NoteSweep
      BNE     loc_BANK4_84C4

ProcessMusicQueue2_Square1Note:
      LDY     SoundEffectPlaying2
      BNE     loc_BANK4_8512

      JSR     PlaySquare1Note

      BNE     loc_BANK4_8504

      LDA     byte_RAM_BF
      JMP     loc_BANK4_850C

; ---------------------------------------------------------------------------

loc_BANK4_8504:
      LDA     MusicSquare1NoteStartLength
      LDX     byte_RAM_C0
      JSR     sub_BANK4_8634

loc_BANK4_850C:
      STA     byte_RAM_61B
      JSR     SetSquare1VolumeAndSweep

loc_BANK4_8512:
      LDA     MusicSquare1NoteStartLength
      STA     MusicSquare1NoteLength

ProcessMusicQueue2_Square1SustainNote:
      LDA     SoundEffectPlaying2
      BNE     loc_BANK4_853B

      LDY     byte_RAM_61B
      BEQ     loc_BANK4_8525

      DEC     byte_RAM_61B

loc_BANK4_8525:
      LDA     MusicSquare1NoteStartLength
      LDX     MusicSquare1Patch
      JSR     sub_BANK4_8643

      STA     SQ1_VOL
      LDA     MusicSquare1NoteSweep
      BNE     loc_BANK4_8538

      LDA     #$7F

loc_BANK4_8538:
      STA     SQ1_SWEEP

loc_BANK4_853B:
      LDA     CurrentMusicTriangleOffset
      BEQ     loc_BANK4_8585

      DEC     MusicTriangleNoteLength
      BNE     loc_BANK4_8585

      LDY     CurrentMusicTriangleOffset
      INC     CurrentMusicTriangleOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     loc_BANK4_8582

      BPL     loc_BANK4_8566

      JSR     ProcessMusicQueue2_PatchNoteLength

      STA     MusicTriangleNoteStartLength
      LDA     #$1F
      STA     TRI_LINEAR
      LDY     CurrentMusicTriangleOffset
      INC     CurrentMusicTriangleOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     loc_BANK4_8582

loc_BANK4_8566:
      JSR     PlayTriangleNote

      LDX     MusicTriangleNoteStartLength
      STX     MusicTriangleNoteLength
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
      LDA     MusicPlaying1
      AND     #Music1_Inside|Music1_Invincible
      BNE     loc_BANK4_85E0

      LDA     CurrentMusicNoiseOffset
      BEQ     loc_BANK4_85CC

      DEC     MusicNoiseNoteLength
      BNE     loc_BANK4_85CC

loc_BANK4_8596:
      LDY     CurrentMusicNoiseOffset
      INC     CurrentMusicNoiseOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     loc_BANK4_85CF

      BPL     loc_BANK4_85B2

      JSR     ProcessMusicQueue2_PatchNoteLength

      STA     MusicNoiseNoteStartLength
      LDY     CurrentMusicNoiseOffset
      INC     CurrentMusicNoiseOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     loc_BANK4_85CF

loc_BANK4_85B2:
      LSR     A
      TAY
      LDA     NoiseVolTable,Y
      STA     NOISE_VOL
      LDA     NoiseLoTable,Y
      STA     NOISE_LO
      LDA     NoiseHiTable,Y
      STA     NOISE_HI
      LDA     MusicNoiseNoteStartLength
      STA     MusicNoiseNoteLength

loc_BANK4_85CC:
      JMP     loc_BANK4_85D8

; ---------------------------------------------------------------------------

loc_BANK4_85CF:
      LDA     CurrentMusicNoiseStartOffset
      STA     CurrentMusicNoiseOffset
      JMP     loc_BANK4_8596

; ---------------------------------------------------------------------------

loc_BANK4_85D8:
      LDA     MusicPlaying1
      AND     #Music1_Inside|Music1_Invincible
      BNE     loc_BANK4_85E0

      RTS

; ---------------------------------------------------------------------------

; use DPCM instead of noise for percussion channel
loc_BANK4_85E0:
      LDA     CurrentMusicDPCMOffset
      BEQ     locret_BANK4_8613

      DEC     MusicDPCMNoteLength
      BNE     locret_BANK4_8613

loc_BANK4_85EA:
      LDY     CurrentMusicDPCMOffset
      INC     CurrentMusicDPCMOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     loc_BANK4_8614

      BPL     loc_BANK4_8606

      JSR     ProcessMusicQueue2_PatchNoteLength

      STA     MusicDPCMNoteStartLength
      LDY     CurrentMusicDPCMOffset
      INC     CurrentMusicDPCMOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     loc_BANK4_8614

loc_BANK4_8606:
      ASL     A
      STA     DPCMQueue
      JSR     ProcessDPCMQueue

      LDA     MusicDPCMNoteStartLength
      STA     MusicDPCMNoteLength

locret_BANK4_8613:
      RTS

; ---------------------------------------------------------------------------

loc_BANK4_8614:
      LDA     CurrentMusicDPCMStartOffset
      STA     CurrentMusicDPCMOffset
      JMP     loc_BANK4_85EA

; End of function ProcessMusicQueue2

; ---------------------------------------------------------------------------
NoiseVolTable:
      .BYTE $10,$1E,$1F,$16
NoiseLoTable:
      .BYTE $00,$03,$0A,2
NoiseHiTable:
      .BYTE $00,$18,$18,$58

; Input
;   A = full patch byte
; Output
;   A = new note length
ProcessMusicQueue2_PatchNoteLength:
      AND     #$F
      CLC
      ADC     MusicTempoSetting
      TAY
      LDA     NoteLengthTable,Y
      RTS

; =============== S U B R O U T I N E =======================================

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

; =============== S U B R O U T I N E =======================================

; apply the current square patch
; Input
;   X = patch
;   A = ??? @TODO
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


; Sets volume/sweep on Square 1 channel
;
; Input
;   X = duty/volume/envelope
;   Y = sweep
SetSquare1VolumeAndSweep:
      STY     SQ1_SWEEP
      STX     SQ1_VOL
      RTS

; Sets volume/sweep on Square 2 channel
;
; Input
;   X = duty/volume/envelope
;   Y = sweep
SetSquare2VolumeAndSweep:
      STX     SQ2_VOL
      STY     SQ2_SWEEP
      RTS

; Sets volume/sweep on Square 1 channel and plays a note
;
; Input
;   A = note
;   X = duty/volume/envelope
;   Y = sweep
PlaySquare1Sweep:
      STX     SQ1_VOL
      STY     SQ1_SWEEP

; Play a note on the Square 1 channel
;
; Input
;   A = note
PlaySquare1Note:
      LDX     #$00

; Plays a note
;
; Input
;   A = note
;   X = channel
;       $00: square 1
;       $04: square 2
;       $08: triangle
;       $0C: noise
PlayNote:
      CMP     #$7E
      BNE     PlayNote_NotRest

      LDA     #$10
      STA     SQ1_VOL,X
      LDA     #$00
      RTS

; ---------------------------------------------------------------------------

PlayNote_NotRest:
      LDY     #$01
      STY     NextOctave
      PHA
      TAY
      BMI     PlayNote_LoadFrequencyData

PlayNote_IncrementOctave:
      INC     NextOctave
      SEC
      SBC     #$18
      BPL     PlayNote_IncrementOctave

PlayNote_LoadFrequencyData:
      CLC
      ADC     #$18
      TAY
      LDA     NoteFrequencyData,Y
      STA     NextFrequencyLo
      LDA     NoteFrequencyData+1,Y
      STA     NextFrequencyHi

PlayNote_FrequencyOctaveLoop:
      LSR     NextFrequencyHi
      ROR     NextFrequencyLo
      DEC     NextOctave
      BNE     PlayNote_FrequencyOctaveLoop

      ; tweak the frequency for notes < $38
      PLA
      CMP     #$38
      BCC     loc_BANK4_870B

      DEC     NextFrequencyLo

loc_BANK4_870B:
      TXA
      CMP     #APUOffset_Square2
      BNE     loc_BANK4_8717

      LDA     MusicSquare1Patch
      CMP     #$E0
      BEQ     loc_BANK4_8727

loc_BANK4_8717:
      LDA     NextFrequencyLo
      STA     SQ1_LO,X
      STA     unk_RAM_5F9,X
      LDA     NextFrequencyHi
      ORA     #8
      STA     SQ1_HI,X
      RTS

loc_BANK4_8727:
      LDA     NextFrequencyLo
      SEC
      SBC     #$02
      STA     SQ2_LO
      STA     byte_RAM_C2
      LDA     NextFrequencyHi
      ORA     #$08
      STA     SQ2_HI
      RTS

; (not referenced)
; Sets volume/sweep on Square 2 channel and plays a note
;
; Input
;   A = note
;   X = duty/volume/envelope
;   Y = sweep
PlaySquare2Sweep:
      STX     SQ2_VOL
      STY     SQ2_SWEEP

; =============== S U B R O U T I N E =======================================

; Play a note on the Square 2 channel
;
; Input
;   A = note
PlaySquare2Note:
      LDX     #APUOffset_Square2
      BNE     PlayNote

; Play a note on the Triangle channel
;
; Input
;   A = note
PlayTriangleNote:
      LDX     #APUOffset_Triangle
      BNE     PlayNote

NoteFrequencyData:
      .WORD $1AB8 ; C
      .WORD $1938 ; C# / Db
      .WORD $17CC ; D
      .WORD $1678 ; D# / Eb
      .WORD $1534 ; E
      .WORD $1404 ; F
      .WORD $12E4 ; F# / Gb
      .WORD $11D4 ; G
      .WORD $10D4 ; G# / Ab
      .WORD $0FE0 ; A
      .WORD $0EFC ; A# / Bb
      .WORD $0E24 ; B

IFDEF PRESERVE_UNUSED_SPACE
; Unused space in the original
; $875F - $8EFF
ENDIF
; @TODO
; Music pointers are not currently defined and labeled yet,
; so we have to keep proper alignment
      .pad $8F00, $FF


; [000007A1 BYTES: END OF AREA UNUSED-BANK4:875F. PRESS KEYPAD "-" TO COLLAPSE]
NoteLengthTable:
      .BYTE $03, $03, $04, $04, $06, $09, $08, $08, $0C, $12, $18, $24, $30, $03, $04, $05
      .BYTE $04, $07, $0A, $09, $0A, $0E, $15, $1C, $2A, $38, $0B, $04, $04, $05, $06, $08 ; $10
      .BYTE $0C, $0B, $0A, $10, $18, $20, $30, $40, $04, $05, $06, $06, $09, $0D, $0C, $0C ; $20
      .BYTE $12, $1B, $24, $36, $48, $0E, $03, $05, $05, $07, $06, $0A, $0F, $0D, $0E, $14 ; $30
      .BYTE $1E, $28, $3C, $50, $05, $06, $07, $08, $0B, $10, $0F, $0E, $16, $21, $2C, $42 ; $40
      .BYTE $58, $11, $06, $06, $08, $08, $0C, $12, $10, $10, $18, $24, $30, $48, $60, $02 ; $50
      .BYTE $06, $07, $09, $08, $0D, $13, $11, $12, $1A, $27, $34, $4E, $68, $14, $07, $07 ; $60
      .BYTE $09, $0A, $0E, $15, $13, $12, $1C, $2A, $38, $54, $70, $03, $04, $07, $08, $0A ; $70
      .BYTE $0A, $0F, $16, $14, $14, $1E, $2D, $3C, $5A, $78, $17, $08, $08, $0B, $0A, $10 ; $80
      .BYTE $18, $15, $16, $20, $30, $40, $60, $80, $08, $09, $0B, $0C, $11, $19, $15, $16 ; $90
      .BYTE $22, $33, $44, $60, $88, $1A, $09, $09, $0C, $0C, $12, $1B, $18, $18, $24, $36 ; $A0
      .BYTE $48, $6C, $90 ; $B0
IFDEF PRESERVE_UNUSED_SPACE
      ; Unused space in the original
      ; $8FB3 - $8FFF
ENDIF
      ; @TODO
      ; Music pointers are not currently defined and labeled yet,
      ; so we have to keep proper alignment
      .pad $9000, $FF


MusicPartPointers:
      ; Mushroom
      .BYTE MusicHeaderMushroomBonusChance - MusicPartPointers
      ; Boss beaten
      .BYTE MusicHeaderBossBeaten - MusicPartPointers
      ; Crystal fanfare (not sure where this one is used)
      .BYTE MusicHeaderCrystal - MusicPartPointers
      ; Death / Lose
      .BYTE MusicHeaderDeath - MusicPartPointers
      ; Game Over
      .BYTE MusicHeaderGameOver - MusicPartPointers
      ; Crystal fanfare
      .BYTE MusicHeaderCrystal - MusicPartPointers
      ; Bonus chance
      .BYTE MusicHeaderMushroomBonusChance - MusicPartPointers
      ; Character select
      .BYTE MusicHeaderCharacterSelect1 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect2 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect3 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect2 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect4 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect5 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect6 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect7 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect8 - MusicPartPointers
      ; Overworld
      .BYTE MusicHeaderOverworld1 - MusicPartPointers
      .BYTE MusicHeaderOverworld2 - MusicPartPointers
      .BYTE MusicHeaderOverworld3 - MusicPartPointers
      .BYTE MusicHeaderOverworld4 - MusicPartPointers
      .BYTE MusicHeaderOverworld3 - MusicPartPointers
      .BYTE MusicHeaderOverworld5 - MusicPartPointers
      .BYTE MusicHeaderOverworld6 - MusicPartPointers
      ; Boss
      .BYTE MusicHeaderBoss - MusicPartPointers
      ; Star
      .BYTE MusicHeaderStar - MusicPartPointers
      ; Wart
      .BYTE MusicHeaderWart - MusicPartPointers
      ; Title screen
      .BYTE MusicHeaderTitleScreen1 - MusicPartPointers
      .BYTE MusicHeaderTitleScreen2 - MusicPartPointers
      .BYTE MusicHeaderTitleScreen3 - MusicPartPointers
      .BYTE MusicHeaderTitleScreen4 - MusicPartPointers
      ; Subspace
      .BYTE MusicHeaderSubspace1 - MusicPartPointers
      .BYTE MusicHeaderSubspace2 - MusicPartPointers
      .BYTE MusicHeaderSubspace3 - MusicPartPointers
      .BYTE MusicHeaderSubspace2 - MusicPartPointers
      .BYTE MusicHeaderSubspace4 - MusicPartPointers
      ; Ending
      .BYTE MusicHeaderEnding1 - MusicPartPointers
      .BYTE MusicHeaderEnding2 - MusicPartPointers
      .BYTE MusicHeaderEnding3 - MusicPartPointers
      .BYTE MusicHeaderEnding4 - MusicPartPointers
      .BYTE MusicHeaderEnding5 - MusicPartPointers
      .BYTE MusicHeaderEnding6 - MusicPartPointers
      ; Underground
      .BYTE MusicHeaderUnderground - MusicPartPointers

;
; Music Headers
; =============
;
; These are broken down by song segment and point to the note length table and
; and individual channel data. Square 2 is the main pointer, and triangle,
; square 1, and noise are stored as offets relative to the main pointer.
;
; Bytes:
;   00: Note length table (from $8F00)
;   01: Main address / Square 2 (lo)
;   02: Main address / Square 2 (hi)
;   03: Triangle offset from main
;   04: Square 1 offset from main
;   05: Noise offset from main
;
MusicPartHeaders:
MusicHeaderCharacterSelect1:
      .BYTE $00
      ; .BYTE $AD, $98
      .WORD MusicDataCharacterSelect1
      .BYTE $6B
      .BYTE $36
      .BYTE $A0
MusicHeaderCharacterSelect2:
      .BYTE $00
      ; .BYTE $5C, $99
      .WORD MusicDataCharacterSelect2
      .BYTE $8E
      .BYTE $48
      .BYTE $B0
MusicHeaderCharacterSelect3:
      .BYTE $00
      ; .BYTE $9A, $99
      .WORD MusicDataCharacterSelect3
      .BYTE $6F
      .BYTE $48
      .BYTE $76
MusicHeaderCharacterSelect4:
      .BYTE $00
      ; .BYTE $9E, $99
      .WORD MusicDataCharacterSelect4
      .BYTE $6B
      .BYTE $47
      .BYTE $72
MusicHeaderCharacterSelect5:
      .BYTE $00
      ; .BYTE $26, $9A
      .WORD MusicDataCharacterSelect5
      .BYTE $8A
      .BYTE $46
      .BYTE $AC
MusicHeaderOverworld1:
      .BYTE $28
      ; .BYTE $D4, $9B
      .WORD MusicDataOverworld1
      .BYTE $2B
      .BYTE $16
      .BYTE $3D
MusicHeaderOverworld2:
      .BYTE $28
      ; .BYTE $20, $9C
      .WORD MusicDataOverworld2
      .BYTE $A8
      .BYTE $54
      .BYTE $C9
MusicHeaderOverworld3:
      .BYTE $28
      ; .BYTE $F9, $9C
      .WORD MusicDataOverworld3
      .BYTE $DD
      .BYTE $73
      .BYTE $6C
MusicHeaderOverworld4:
      .BYTE $28
      ; .BYTE $3F, $9D
      .WORD MusicDataOverworld4
      .BYTE $B2
      .BYTE $73
      .BYTE $26
MusicHeaderOverworld5:
      .BYTE $28
      ; .BYTE $00, $9E
      .WORD MusicDataOverworld5
      .BYTE $38
      .BYTE $1D
      .BYTE $46
MusicHeaderOverworld6:
      .BYTE $28
      ; .BYTE $4D, $9E
      .WORD MusicDataOverworld6
      .BYTE $A7
      .BYTE $4F
      .BYTE $C8
MusicHeaderUnderground:
      .BYTE $6E
      ; .BYTE $BD, $94
      .WORD MusicDataUnderground
      .BYTE $53
      .BYTE $2A
      .BYTE $84
MusicHeaderBoss:
      .BYTE $28
      ; .BYTE $1C, $9F
      .WORD MusicDataBoss
      .BYTE $83
      .BYTE $42
      .BYTE $00
MusicHeaderStar:
      .BYTE $00
      ; .BYTE $69, $94
      .WORD MusicDataStar
      .BYTE $37
      .BYTE $1A
      .BYTE $49
MusicHeaderWart:
      .BYTE $28
      ; .BYTE $C7, $9F
      .WORD MusicDataWart
      .BYTE $96
      .BYTE $4B
      .BYTE $00
MusicHeaderCrystal:
      .BYTE $00
      ; .BYTE $48, $A1
      .WORD MusicDataCrystal
      .BYTE $1B
      .BYTE $0D
      ; no noise channel, using $00 from below
MusicHeaderGameOver:
      .BYTE $00
      ; .BYTE $CE, $A0
      .WORD MusicDataGameOver
      .BYTE $1B
      .BYTE $0E
      ; no noise channel, using $00 from below
MusicHeaderBossBeaten:
      .BYTE $00
      ; .BYTE $F2, $A0
      .WORD MusicDataBossBeaten
      .BYTE $41
      .BYTE $27
      ; no noise channel, using $00 from below
MusicHeaderCharacterSelect8:
      .BYTE $00
      ; .BYTE $93, $9B
      .WORD MusicDataCharacterSelect8
      .BYTE $2F
      .BYTE $21
      .BYTE $38
MusicHeaderMushroomBonusChance:
      .BYTE $52
      ; .BYTE $BB, $A0
      .WORD MusicDataMushroomBonusChance
      .BYTE $00
      .BYTE $0A
      ; no noise channel, using $00 from below
MusicHeaderCharacterSelect7:
      .BYTE $00
      ; .BYTE $DF, $9A
      .WORD MusicDataCharacterSelect7
      .BYTE $97
      .BYTE $61
      .BYTE $B0
MusicHeaderDeath:
      .BYTE $28
      ; .BYTE $6F, $A1
      .WORD MusicDataDeath
      .BYTE $17
      .BYTE $0C
      ; no noise channel, using $00 from below
MusicHeaderCharacterSelect6:
      .BYTE $00
      ; .BYTE $5D, $9A
      .WORD MusicDataCharacterSelect6
      .BYTE $6C
      .BYTE $45
      .BYTE $79
MusicHeaderTitleScreen2:
      .BYTE $1B
      ; .BYTE $A7, $96
      .WORD MusicDataTitleScreen2
      .BYTE $BC
      .BYTE $64
      .BYTE $59
MusicHeaderTitleScreen1:
      .BYTE $1B
      ; .BYTE $3E, $96
      .WORD MusicDataTitleScreen1
      .BYTE $43
      .BYTE $22
      .BYTE $57
MusicHeaderTitleScreen3:
      .BYTE $1B
      ; .BYTE $94, $97
      .WORD MusicDataTitleScreen3
      .BYTE $8D
      .BYTE $47
      .BYTE $BA
MusicHeaderTitleScreen4:
      .BYTE $1B
      ; .BYTE $78, $98
      .WORD MusicDataTitleScreen4
      .BYTE $24
      .BYTE $12
      .BYTE $29
MusicHeaderSubspace1:
      .BYTE $28
      ; .BYTE $50, $95
      .WORD MusicDataSubspace1
      .BYTE $38
      .BYTE $1C
      .BYTE $83
MusicHeaderSubspace2:
      .BYTE $28
      ; .BYTE $A3, $95
      .WORD MusicDataSubspace2
      .BYTE $24
      .BYTE $12
      .BYTE $30
MusicHeaderSubspace3:
      .BYTE $28
      ; .BYTE $E0, $95
      .WORD MusicDataSubspace3
      .BYTE $22
      .BYTE $10
      .BYTE $51
MusicHeaderSubspace4:
      .BYTE $28
      ; .BYTE $0F, $96
      .WORD MusicDataSubspace4
      .BYTE $17
      .BYTE $0A
      .BYTE $22
MusicHeaderEnding1:
      .BYTE $6E
      ; .BYTE $1E, $91
      .WORD MusicDataEnding1
      .BYTE $3D
      .BYTE $1F
      .BYTE $6D
MusicHeaderEnding3:
      .BYTE $6E
      ; .BYTE $9C, $91
      .WORD MusicDataEnding3
      .BYTE $41
      .BYTE $21
      .BYTE $8C
MusicHeaderEnding2:
      .BYTE $6E
      ; .BYTE $80, $92
      .WORD MusicDataEnding2
      .BYTE $2A
      .BYTE $5A
      .BYTE $19
MusicHeaderEnding5:
      .BYTE $6E
      ; .BYTE $F2, $92
      .WORD MusicDataEnding5
      .BYTE $4C
      .BYTE $14
      .BYTE $68
MusicHeaderEnding4:
      .BYTE $6E
      ; .BYTE $0D, $92
      .WORD MusicDataEnding4
      .BYTE $43
      .BYTE $29
      .BYTE $1B
MusicHeaderEnding6:
      .BYTE $6E
      ; .BYTE $76, $93
      .WORD MusicDataEnding6
      .BYTE $00
      .BYTE $72
      .BYTE $00

MusicPointersFirstPart:
      .BYTE $10 ; Overworld
      .BYTE $07 ; Character Select
      .BYTE $29 ; Underground
      .BYTE $17 ; Boss
      .BYTE $18 ; Star
      .BYTE $1E ; Subspace
      .BYTE $19 ; Wart
      .BYTE $1A ; Title Screen
      .BYTE $23 ; Ending

MusicPointersEndPart:
      .BYTE $16 ; Overworld
      .BYTE $0F ; Character Select
      .BYTE $29 ; Underground
      .BYTE $17 ; Boss
      .BYTE $18 ; Star
      .BYTE $22 ; Subspace
      .BYTE $19 ; Wart
      .BYTE $1D ; Title Screen
      .BYTE $28 ; Ending

MusicPointersLoopPart:
      .BYTE $11 ; Overworld
      .BYTE $08 ; Character Select
      .BYTE $29 ; Underground
      .BYTE $17 ; Boss
      .BYTE $18 ; Star
      .BYTE $1E ; Subspace
      .BYTE $19 ; Wart
      .BYTE $00 ; Title Screen
      .BYTE $28 ; Ending

MusicData:
MusicDataEnding1:
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
      .BYTE $50
      .BYTE $8A
      .BYTE $52
      .BYTE $88
      .BYTE $4C
      .BYTE $8A
      .BYTE $56
      .BYTE $82
      .BYTE $7E
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
      .BYTE $00
      .BYTE $8A
      .BYTE $3E
      .BYTE $84
      .BYTE $7E
      .BYTE $42
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
      .BYTE $00
MusicDataEnding3:
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
      .BYTE $4E
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
      .BYTE $00
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
MusicDataEnding4:
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
      .BYTE $00
      .BYTE $88
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
      .BYTE $00
      .BYTE $8A
      .BYTE $40
      .BYTE $84
      .BYTE $7E
      .BYTE $40
      .BYTE $40
      .BYTE $48
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
      .BYTE $26
      .BYTE $26
      .BYTE $83
      .BYTE $26
      .BYTE $84
      .BYTE $26
      .BYTE $26
      .BYTE $26
      .BYTE $26
MusicDataEnding2:
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
      .BYTE $00
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
      .BYTE $00
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
      .BYTE $82
      .BYTE $22
      .BYTE $22
      .BYTE $83
      .BYTE $22
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
MusicDataEnding5:
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
      .BYTE $00
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
      .BYTE $3A
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
      .BYTE $01
      .BYTE $8C
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
MusicDataEnding6:
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
      .BYTE $72
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
      .BYTE $6E
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
      .BYTE $7E
      .BYTE $5A
      .BYTE $5E
      .BYTE $60
      .BYTE $64
      .BYTE $7E
      .BYTE $8B
      .BYTE $7E
      .BYTE $00
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
      .BYTE $4C
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
      .BYTE $3E
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
MusicDataStar:
      .BYTE $98
      .BYTE $48
      .BYTE $48
      .BYTE $48
      .BYTE $94
      .BYTE $7E
      .BYTE $48
      .BYTE $7E
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
      .BYTE $00
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
      .BYTE $48
      .BYTE $98
      .BYTE $7E
      .BYTE $3E
      .BYTE $48
      .BYTE $94
      .BYTE $01
      .BYTE $98
      .BYTE $10
      .BYTE $94
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE $01
      .BYTE $01
      .BYTE $00
MusicDataUnderground:
      .BYTE $A4
      .BYTE $0A
      .BYTE $18
      .BYTE $22
      .BYTE $84
      .BYTE $40
      .BYTE $7E
      .BYTE $89
      .BYTE $42
      .BYTE $A4
      .BYTE $0A
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
      .BYTE $00
      .BYTE $B4
      .BYTE $0A
      .BYTE $18
      .BYTE $22
      .BYTE $84
      .BYTE $36
      .BYTE $7E
      .BYTE $89
      .BYTE $38
      .BYTE $B4
      .BYTE $0A
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
      .BYTE $01
      .BYTE $8D
      .BYTE $10
      .BYTE $8E
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $88
      .BYTE $10
      .BYTE $84
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $00
MusicDataSubspace1:
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
      .BYTE $00
      .BYTE $99
      .BYTE $38
      .BYTE $30
      .BYTE $26
      .BYTE $98
      .BYTE $30
      .BYTE $34
      .BYTE $94
      .BYTE $32
      .BYTE $98
      .BYTE $30
      .BYTE $96
      .BYTE $30
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
      .BYTE $38
      .BYTE $3A
      .BYTE $99
      .BYTE $34
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
      .BYTE $38
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
MusicDataSubspace2:
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
      .BYTE $7E
      .BYTE $42
      .BYTE $48
      .BYTE $4C
      .BYTE $00
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
      .BYTE $38
      .BYTE $3A
      .BYTE $3E
      .BYTE $7E
      .BYTE $30
      .BYTE $38
      .BYTE $3A
      .BYTE $99
      .BYTE $30
      .BYTE $3E
      .BYTE $98
      .BYTE $48
      .BYTE $99
      .BYTE $3A
      .BYTE $94
      .BYTE $48
      .BYTE $98
      .BYTE $48
      .BYTE $3A
      .BYTE $98
      .BYTE $04
      .BYTE $92
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $98
      .BYTE $06
      .BYTE $92
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $00
MusicDataSubspace3:
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
      .BYTE $7E
      .BYTE $60
      .BYTE $9A
      .BYTE $60
      .BYTE $00
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
      .BYTE $30
      .BYTE $38
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
MusicDataSubspace4:
      .BYTE $98
      .BYTE $7E
      .BYTE $99
      .BYTE $4E
      .BYTE $99
      .BYTE $4C
      .BYTE $9A
      .BYTE $48
      .BYTE $7E
      .BYTE $00
      .BYTE $98
      .BYTE $7E
      .BYTE $94
      .BYTE $40
      .BYTE $98
      .BYTE $7E
      .BYTE $94
      .BYTE $3A
      .BYTE $98
      .BYTE $7E
      .BYTE $9A
      .BYTE $38
      .BYTE $7E
      .BYTE $98
      .BYTE $30
      .BYTE $99
      .BYTE $40
      .BYTE $44
      .BYTE $48
      .BYTE $94
      .BYTE $3E
      .BYTE $98
      .BYTE $3E
      .BYTE $30
      .BYTE $98
      .BYTE $04
      .BYTE $92
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $98
      .BYTE $06
      .BYTE $92
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $00
MusicDataTitleScreen1:
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
      .BYTE $00
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
      .BYTE $0E
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
      .BYTE $7E
      .BYTE $7E
      .BYTE $E8
      .BYTE $4C
      .BYTE $7E
      .BYTE $89
      .BYTE $7E
      .BYTE $E8
      .BYTE $10
      .BYTE $02
      .BYTE $06
      .BYTE $10
      .BYTE $02
      .BYTE $06
      .BYTE $10
      .BYTE $02
      .BYTE $06
      .BYTE $10
      .BYTE $01
      .BYTE $10
      .BYTE $10
      .BYTE $01
      .BYTE $01
      .BYTE $EA
      .BYTE $01
MusicDataTitleScreen2:
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
      .BYTE $00
      .BYTE $B8
      .BYTE $02
      .BYTE $10
      .BYTE $10
      .BYTE $02
      .BYTE $B4
      .BYTE $10
      .BYTE $10
      .BYTE $B8
      .BYTE $10
      .BYTE $00
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
      .BYTE $38
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
MusicDataTitleScreen3:
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
      .BYTE $00
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
      .BYTE $02
      .BYTE $10
      .BYTE $10
      .BYTE $02
      .BYTE $10
      .BYTE $10
      .BYTE $02
      .BYTE $10
      .BYTE $10
      .BYTE $02
      .BYTE $10
      .BYTE $86
      .BYTE $01
      .BYTE $84
      .BYTE $01
      .BYTE $88
      .BYTE $02
      .BYTE $10
      .BYTE $10
      .BYTE $02
      .BYTE $10
      .BYTE $10
      .BYTE $02
      .BYTE $10
      .BYTE $10
      .BYTE $02
      .BYTE $10
      .BYTE $86
      .BYTE $01
      .BYTE $84
      .BYTE $01
      .BYTE $88
      .BYTE $02
      .BYTE $10
      .BYTE $10
      .BYTE $02
      .BYTE $10
      .BYTE $10
      .BYTE $02
      .BYTE $10
      .BYTE $10
MusicDataTitleScreen4:
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
      .BYTE $00
      .BYTE $30
      .BYTE $7E
      .BYTE $7E
      .BYTE $26
      .BYTE $20
      .BYTE $1C
      .BYTE $18
      .BYTE $7E
      .BYTE $7E
      .BYTE $0E
      .BYTE $08
      .BYTE $04
      .BYTE $E8
      .BYTE $18
      .BYTE $7E
      .BYTE $00
      .BYTE $2E
      .BYTE $38
      .BYTE $EB
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $30
      .BYTE $10
      .BYTE $01
      .BYTE $01
      .BYTE $10
      .BYTE $01
      .BYTE $01
      .BYTE $10
      .BYTE $01
      .BYTE $10
      .BYTE $10
      .BYTE $01
      .BYTE $01
MusicDataCharacterSelect1:
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
      .BYTE $50
      .BYTE $7E
      .BYTE $4C
      .BYTE $7E
      .BYTE $00
      .BYTE $96
      .BYTE $3E
      .BYTE $92
      .BYTE $3E
      .BYTE $96
      .BYTE $7E
      .BYTE $92
      .BYTE $3E
      .BYTE $96
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
      .BYTE $98
      .BYTE $3E
      .BYTE $7E
      .BYTE $46
      .BYTE $7E
      .BYTE $8A
      .BYTE $04
      .BYTE $01
      .BYTE $00
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
MusicDataCharacterSelect2:
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
      .BYTE $A6
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
      .BYTE $00
MusicDataCharacterSelect3:
      .BYTE $AA
      .BYTE $7E
      .BYTE $7E
      .BYTE $00
MusicDataCharacterSelect4:
      .BYTE $C8
      .BYTE $7E
      .BYTE $48
      .BYTE $4C
      .BYTE $4E
      .BYTE $00
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
      .BYTE $02
      .BYTE $04
      .BYTE $00
      .BYTE $82
      .BYTE $04
      .BYTE $82
      .BYTE $04
      .BYTE $82
      .BYTE $04
      .BYTE $86
      .BYTE $04
      .BYTE $82
      .BYTE $04
      .BYTE $82
      .BYTE $04
      .BYTE $82
      .BYTE $01
      .BYTE $82
      .BYTE $04
      .BYTE $82
      .BYTE $04
      .BYTE $82
      .BYTE $01
      .BYTE $82
      .BYTE $04
MusicDataCharacterSelect5:
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
      .BYTE $00
MusicDataCharacterSelect6:
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
      .BYTE $00
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
      .BYTE $02
      .BYTE $04
      .BYTE $00
      .BYTE $88
      .BYTE $02
      .BYTE $04
      .BYTE $04
      .BYTE $04
      .BYTE $02
      .BYTE $02
      .BYTE $7E
      .BYTE $06
MusicDataCharacterSelect7:
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
      .BYTE $96
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
      .BYTE $00
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
      .BYTE $02
      .BYTE $04
      .BYTE $00
MusicDataCharacterSelect8:
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
      .BYTE $96
      .BYTE $46
      .BYTE $92
      .BYTE $42
      .BYTE $96
      .BYTE $52
      .BYTE $92
      .BYTE $46
      .BYTE $96
      .BYTE $42
      .BYTE $92
      .BYTE $3E
      .BYTE $00
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
      .BYTE $02
      .BYTE $04
      .BYTE $04
      .BYTE $04
      .BYTE $02
      .BYTE $02
      .BYTE $7E
      .BYTE $06
MusicDataOverworld1:
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
      .BYTE $00
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
      .BYTE $01
      .BYTE $01
      .BYTE $88
      .BYTE $02
      .BYTE $82
      .BYTE $02
      .BYTE $02
      .BYTE $02
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $02
      .BYTE $02
      .BYTE $02
MusicDataOverworld2:
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
      .BYTE $60
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
      .BYTE $00
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
      .BYTE $4A
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
      .BYTE $01
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $88
      .BYTE $01
      .BYTE $02
      .BYTE $82
      .BYTE $02
      .BYTE $02
      .BYTE $02
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $00
MusicDataOverworld3:
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
      .BYTE $00
MusicDataOverworld4:
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
      .BYTE $00
      .BYTE $88
      .BYTE $06
      .BYTE $82
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $00
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
MusicDataOverworld5:
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
      .BYTE $00
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
      .BYTE $26
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
      .BYTE $06
      .BYTE $82
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $00
MusicDataOverworld6:
      .BYTE $E2
      .BYTE $7E
      .BYTE $7E
      .BYTE $52
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
      .BYTE $00
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
      .BYTE $46
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
      .BYTE $06
      .BYTE $82
      .BYTE $10
      .BYTE $01
      .BYTE $10
      .BYTE $00
MusicDataBoss:
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
      .BYTE $00
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
MusicDataWart:
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



; -------------------------------------------


; .segment BANK5
; * =  $A000
      .BYTE $4E ; This data continues from the end of bank 4
      .BYTE $52
      .BYTE $50
      .BYTE $52
      .BYTE $50
      .BYTE $52
      .BYTE $50
      .BYTE $52
      .BYTE $50
      .BYTE $54
      .BYTE $52
      .BYTE $54
      .BYTE $52
      .BYTE $54
      .BYTE $52
      .BYTE $54
      .BYTE $52
      .BYTE $00
      .BYTE $A9
      .BYTE $44
      .BYTE $42
      .BYTE $A8
      .BYTE $3A
      .BYTE $A9
      .BYTE $42
      .BYTE $40
      .BYTE $A8
      .BYTE $38
      .BYTE $A9
      .BYTE $40
      .BYTE $3E
      .BYTE $A8
      .BYTE $36
      .BYTE $A4
      .BYTE $3C
      .BYTE $AB
      .BYTE $3A
      .BYTE $A4
      .BYTE $7E
      .BYTE $A9
      .BYTE $48
      .BYTE $46
      .BYTE $A8
      .BYTE $3E
      .BYTE $A9
      .BYTE $46
      .BYTE $44
      .BYTE $A8
      .BYTE $3C
      .BYTE $A9
      .BYTE $44
      .BYTE $42
      .BYTE $A8
      .BYTE $3A
      .BYTE $A4
      .BYTE $42
      .BYTE $AB
      .BYTE $40
      .BYTE $A4
      .BYTE $7E
      .BYTE $A4
      .BYTE $42
      .BYTE $40
      .BYTE $42
      .BYTE $40
      .BYTE $42
      .BYTE $40
      .BYTE $42
      .BYTE $40
      .BYTE $44
      .BYTE $42
      .BYTE $44
      .BYTE $42
      .BYTE $44
      .BYTE $42
      .BYTE $44
      .BYTE $42
      .BYTE $46
      .BYTE $44
      .BYTE $46
      .BYTE $44
      .BYTE $46
      .BYTE $44
      .BYTE $46
      .BYTE $44
      .BYTE $48
      .BYTE $46
      .BYTE $48
      .BYTE $46
      .BYTE $48
      .BYTE $46
      .BYTE $48
      .BYTE $46
      .BYTE $84
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $3E
      .BYTE $44
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $3E
      .BYTE $44
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $3E
      .BYTE $44
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $3E
      .BYTE $44
      .BYTE $3C
      .BYTE $40
      .BYTE $42
      .BYTE $3C
      .BYTE $40
      .BYTE $42
      .BYTE $3C
      .BYTE $42
      .BYTE $3C
      .BYTE $40
      .BYTE $42
      .BYTE $3C
      .BYTE $40
      .BYTE $42
      .BYTE $3C
      .BYTE $42
      .BYTE $3C
      .BYTE $40
      .BYTE $42
      .BYTE $3C
      .BYTE $40
      .BYTE $42
      .BYTE $3C
      .BYTE $42
      .BYTE $3C
      .BYTE $40
      .BYTE $42
      .BYTE $3C
      .BYTE $40
      .BYTE $42
      .BYTE $3C
      .BYTE $42
      .BYTE $84
      .BYTE $3A
      .BYTE $88
      .BYTE $3A
      .BYTE $3A
      .BYTE $3A
      .BYTE $84
      .BYTE $3A
      .BYTE $3C
      .BYTE $88
      .BYTE $3C
      .BYTE $3C
      .BYTE $3C
      .BYTE $84
      .BYTE $3C
      .BYTE $3E
      .BYTE $88
      .BYTE $3E
      .BYTE $3E
      .BYTE $3E
      .BYTE $84
      .BYTE $3E
      .BYTE $40
      .BYTE $88
      .BYTE $40
      .BYTE $40
      .BYTE $40
      .BYTE $84
      .BYTE $40
MusicDataMushroomBonusChance:
      .BYTE $82
      .BYTE $46
      .BYTE $48
      .BYTE $4A
      .BYTE $4C
      .BYTE $7E
      .BYTE $56
      .BYTE $88
      .BYTE $52
      .BYTE $00
      .BYTE $82
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $46
      .BYTE $7E
      .BYTE $50
      .BYTE $88
      .BYTE $4C
MusicDataGameOver:
      .BYTE $94
      .BYTE $56
      .BYTE $5A
      .BYTE $60
      .BYTE $3E
      .BYTE $42
      .BYTE $48
      .BYTE $26
      .BYTE $2A
      .BYTE $98
      .BYTE $30
      .BYTE $26
      .BYTE $30
      .BYTE $00
      .BYTE $98
      .BYTE $7E
      .BYTE $94
      .BYTE $30
      .BYTE $98
      .BYTE $7E
      .BYTE $94
      .BYTE $30
      .BYTE $98
      .BYTE $7E
      .BYTE $30
      .BYTE $3A
      .BYTE $38 ; 8
      .BYTE $88
      .BYTE $7E
      .BYTE $89
      .BYTE $60
      .BYTE $48
      .BYTE $88
      .BYTE $30
      .BYTE $3E
      .BYTE $30
MusicDataBossBeaten:
      .BYTE $94
      .BYTE $42
      .BYTE $48
      .BYTE $4C
      .BYTE $42
      .BYTE $48
      .BYTE $4C
      .BYTE $3E
      .BYTE $42
      .BYTE $50
      .BYTE $3E
      .BYTE $42
      .BYTE $52
      .BYTE $50
      .BYTE $48
      .BYTE $42
      .BYTE $7E
      .BYTE $3A
      .BYTE $42
      .BYTE $48
      .BYTE $50
      .BYTE $4C
      .BYTE $3E
      .BYTE $42
      .BYTE $7E
      .BYTE $30
      .BYTE $7E
      .BYTE $26
      .BYTE $2A
      .BYTE $7E
      .BYTE $26
      .BYTE $20
      .BYTE $7E
      .BYTE $98
      .BYTE $18
      .BYTE $26
      .BYTE $30
      .BYTE $7E
      .BYTE $00
      .BYTE $88
      .BYTE $7E
      .BYTE $30
      .BYTE $7E
      .BYTE $30
      .BYTE $7E
      .BYTE $34
      .BYTE $7E
      .BYTE $38
      .BYTE $7E
      .BYTE $42
      .BYTE $7E
      .BYTE $46
      .BYTE $48
      .BYTE $94
      .BYTE $3E
      .BYTE $98
      .BYTE $42
      .BYTE $94
      .BYTE $3E
      .BYTE $98
      .BYTE $38
      .BYTE $30
      .BYTE $7E
      .BYTE $9A
      .BYTE $48
      .BYTE $88
      .BYTE $3A
      .BYTE $52
      .BYTE $3C
      .BYTE $54
      .BYTE $3E
      .BYTE $56
      .BYTE $42
      .BYTE $5A
      .BYTE $4C
      .BYTE $3A
      .BYTE $3E
      .BYTE $4C
      .BYTE $48
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $48
      .BYTE $3E
      .BYTE $30
      .BYTE $7E
MusicDataCrystal:
      .BYTE $89
      .BYTE $40
      .BYTE $84
      .BYTE $40
      .BYTE $88
      .BYTE $40
      .BYTE $88
      .BYTE $56
      .BYTE $56
      .BYTE $52
      .BYTE $8B
      .BYTE $50
      .BYTE $00
      .BYTE $89
      .BYTE $36
      .BYTE $84
      .BYTE $36
      .BYTE $88
      .BYTE $36
      .BYTE $88
      .BYTE $44
      .BYTE $88
      .BYTE $44
      .BYTE $88
      .BYTE $40
      .BYTE $8B
      .BYTE $3E
      .BYTE $89
      .BYTE $40
      .BYTE $84
      .BYTE $40
      .BYTE $88
      .BYTE $40
      .BYTE $88
      .BYTE $4E
      .BYTE $4E
      .BYTE $4A
      .BYTE $8B
      .BYTE $48
MusicDataDeath:
      .BYTE $84
      .BYTE $7E
      .BYTE $82
      .BYTE $4E
      .BYTE $7E
      .BYTE $46
      .BYTE $3E
      .BYTE $7E
      .BYTE $3A
      .BYTE $8A
      .BYTE $38
      .BYTE $00
      .BYTE $84
      .BYTE $7E
      .BYTE $82
      .BYTE $3E
      .BYTE $7E
      .BYTE $34
      .BYTE $2E
      .BYTE $7E
      .BYTE $2A
      .BYTE $8A
      .BYTE $26
      .BYTE $84
      .BYTE $7E
      .BYTE $88
      .BYTE $46
      .BYTE $3E
      .BYTE $8A
      .BYTE $30
byte_BANK5_A18D:
      .BYTE $90

InstrumentSoundData:
      .BYTE $95 ; @TODO Should this label be moved up? oops
      .BYTE $95
      .BYTE $95
      .BYTE $95
      .BYTE $95
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $97
      .BYTE $97
      .BYTE $97
      .BYTE $97
      .BYTE $98
      .BYTE $98
byte_BANK5_A1CD:
      .BYTE $90

      .BYTE $92
      .BYTE $94
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $96
      .BYTE $97
      .BYTE $97
      .BYTE $97
      .BYTE $97
      .BYTE $98
      .BYTE $98
byte_BANK5_A1E4:
      .BYTE $51

      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $52
      .BYTE $53
      .BYTE $54
      .BYTE $55
      .BYTE $56
      .BYTE $57
      .BYTE $58
      .BYTE $59
      .BYTE $5A
      .BYTE $5B
byte_BANK5_A224:
      .BYTE $51

      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $52
      .BYTE $53
      .BYTE $54
      .BYTE $55
      .BYTE $56
      .BYTE $57
      .BYTE $58
      .BYTE $59
      .BYTE $5A
      .BYTE $5B
byte_BANK5_A23B:
      .BYTE $10

      .BYTE $11
      .BYTE $11
      .BYTE $11
      .BYTE $12
      .BYTE $12
      .BYTE $12
      .BYTE $13
      .BYTE $13
      .BYTE $14
      .BYTE $14
      .BYTE $14
      .BYTE $14
      .BYTE $15
      .BYTE $15
      .BYTE $15
      .BYTE $15
      .BYTE $16
      .BYTE $16
      .BYTE $16
      .BYTE $17
      .BYTE $17
      .BYTE $17
      .BYTE $17
      .BYTE $17
      .BYTE $17
      .BYTE $17
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $19
      .BYTE $19
      .BYTE $19
      .BYTE $1A
      .BYTE $1A
      .BYTE $1B
      .BYTE $1B
      .BYTE $1C
byte_BANK5_A27B:
      .BYTE $10

      .BYTE $11
      .BYTE $12
      .BYTE $13
      .BYTE $14
      .BYTE $15
      .BYTE $16
      .BYTE $17
      .BYTE $17
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $18
      .BYTE $19
      .BYTE $19
      .BYTE $19
      .BYTE $1A
      .BYTE $1A
      .BYTE $1B
      .BYTE $1B
      .BYTE $1C
byte_BANK5_A293:
      .BYTE $51

      .BYTE $52
      .BYTE $52
      .BYTE $52
      .BYTE $52
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $55
      .BYTE $55
      .BYTE $55
      .BYTE $55
      .BYTE $55
      .BYTE $55
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $55
      .BYTE $55
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $56
byte_BANK5_A2D3:
      .BYTE $51

      .BYTE $52
      .BYTE $52
      .BYTE $52
      .BYTE $52
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $55
      .BYTE $55
      .BYTE $56
      .BYTE $56
byte_BANK5_A2EA:
      .BYTE $51

      .BYTE $52
      .BYTE $53
      .BYTE $54
      .BYTE $54
      .BYTE $55
      .BYTE $56
      .BYTE $56
      .BYTE $57
      .BYTE $58
      .BYTE $59
      .BYTE $5A
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5A
      .BYTE $59
      .BYTE $58
      .BYTE $56
      .BYTE $55
      .BYTE $55
byte_BANK5_A301:
      .BYTE $51

      .BYTE $52
      .BYTE $52
      .BYTE $51
      .BYTE $52
      .BYTE $52
      .BYTE $52
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $53
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $54
      .BYTE $55
      .BYTE $55
      .BYTE $55
      .BYTE $55
      .BYTE $55
      .BYTE $56
      .BYTE $56
      .BYTE $56
      .BYTE $57
      .BYTE $57
      .BYTE $57
      .BYTE $57
      .BYTE $57
      .BYTE $58
      .BYTE $58
      .BYTE $58
      .BYTE $58
      .BYTE $58
      .BYTE $58
      .BYTE $58
      .BYTE $58
      .BYTE $58
      .BYTE $58
      .BYTE $59
      .BYTE $59
      .BYTE $59
      .BYTE $59
      .BYTE $5A
      .BYTE $5A
      .BYTE $5A
      .BYTE $5A
      .BYTE $5A
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5A
      .BYTE $59
      .BYTE $58
      .BYTE $56
      .BYTE $55
      .BYTE $55
unk_BANK5_A341:
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $52
      .BYTE $53
      .BYTE $54
      .BYTE $55
      .BYTE $56
      .BYTE $57
      .BYTE $58
      .BYTE $19
      .BYTE $DA
      .BYTE $9B
unk_BANK5_A381:
      .BYTE $50
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $52
      .BYTE $53
      .BYTE $54
      .BYTE $55
      .BYTE $56
      .BYTE $57
      .BYTE $58
      .BYTE $19
      .BYTE $DA
      .BYTE $9B
byte_BANK5_A398:
      .BYTE $50

      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $52
      .BYTE $52
      .BYTE $52
      .BYTE $53
      .BYTE $53
      .BYTE $54
      .BYTE $55
byte_BANK5_A3AF:
      .BYTE $50

      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $50
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $51
      .BYTE $52
      .BYTE $52
      .BYTE $52
      .BYTE $53
      .BYTE $53
      .BYTE $54
      .BYTE $55
; The rest of this bank is empty
