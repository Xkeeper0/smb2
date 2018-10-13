;
; Bank 4 & Bank 5
; ===============
;
; What's inside:
;
;   - Music engine
;   - Sound effects engine
;   - Sound effect pointers and data
;   - Song pointers and data
;   - Note length tables (tempos)
;   - Instrument tables and data
;

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
      JSR     ProcessMusicQueue

      ; Reset queues
      LDA     #$00
      STA     SoundEffectQueue2
      STA     MusicQueue2
      STA     SoundEffectQueue1
      STA     DPCMQueue
      STA     MusicQueue1
      STA     SoundEffectQueue3
      RTS


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
      LDA     ProcessMusicQueue,Y ; weird, but i guess that's one way to get "random" noise
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
      .BYTE (DPCMSampleData_DoorOpenBombBom - DPCMSampleData)/64 ; $4F
      .BYTE (DPCMSampleData_DrumSample - DPCMSampleData)/64 ; $60
      .BYTE (DPCMSampleData_PlayerHurt - DPCMSampleData)/64 ; $4B
      .BYTE (DPCMSampleData_ItemPull - DPCMSampleData)/64 ; $00
      .BYTE (DPCMSampleData_BossDeath - DPCMSampleData)/64 ; $31
      .BYTE (DPCMSampleData_DrumSample - DPCMSampleData)/64 ; $60
      .BYTE (DPCMSampleData_BossHurt - DPCMSampleData)/64 ; $0E
      .BYTE (DPCMSampleData_PlayerDeath - DPCMSampleData)/64 ; $1D

DMCLengthTable:
      .BYTE (DPCMSampleDataEnd_DoorOpenBombBom - DPCMSampleData_DoorOpenBombBom)/16 ; $43
      .BYTE (DPCMSampleDataEnd_DrumSample_A - DPCMSampleData_DrumSample)/16 ; $14
      .BYTE (DPCMSampleDataEnd_PlayerHurt - DPCMSampleData_PlayerHurt)/16 ; $10
      .BYTE (DPCMSampleDataEnd_ItemPull - DPCMSampleData_ItemPull)/16 ; $38
      .BYTE (DPCMSampleDataEnd_BossDeath - DPCMSampleData_BossDeath)/16 ; $48
      .BYTE (DPCMSampleDataEnd_DrumSample_B - DPCMSampleData_DrumSample)/16 ; $28
      .BYTE (DPCMSampleDataEnd_BossHurt - DPCMSampleData_BossHurt)/16 ; $3C
      .BYTE (DPCMSampleDataEnd_PlayerDeath - DPCMSampleData_PlayerDeath)/16 ; $50

DMCFreqTable:
      .BYTE $0E
      .BYTE $0E
      .BYTE $0F
      .BYTE $0F
      .BYTE $0F
      .BYTE $0F
      .BYTE $0F
      .BYTE $0F
      .BYTE $60 ; ???


ProcessMusicQueue_ThenReadNoteData:
      JMP     ProcessMusicQueue_ReadNoteData

ProcessMusicQueue_StopMusic:
      JMP     StopMusic

ProcessMusicQueue:
      LDA     MusicQueue2
      BMI     ProcessMusicQueue_StopMusic

      CMP     #Music2_EndingAndCast
      BEQ     ProcessMusicQueue_EndingAndCast

      LDA     MusicQueue2
      BNE     ProcessMusicQueue_Part2

      LDA     MusicQueue1
      BNE     ProcessMusicQueue_MusicQueue1

      LDA     MusicPlaying2
      ORA     MusicPlaying1
      BNE     ProcessMusicQueue_ThenReadNoteData

      RTS

ProcessMusicQueue_EndingAndCast:
      STA     MusicPlaying2
      LDY     #$00
      STY     MusicPlaying1
      LDY     #$08 ; index of ending music pointer
      BNE     ProcessMusicQueue_ReadFirstPointer

ProcessMusicQueue_MusicQueue1:
      STA     MusicPlaying1
      LDY     #$00
      STY     MusicPlaying2
      LDY     #$FF

ProcessMusicQueue_FirstPointerLoop:
      INY
      LSR     A
      BCC     ProcessMusicQueue_FirstPointerLoop

ProcessMusicQueue_ReadFirstPointer:
      LDA     MusicPointersFirstPart,Y
      STA     MusicPointerFirstPart
      LDA     MusicPointersEndPart,Y
      CLC
      ADC     #$02
      STA     MusicPointerEndPart
      LDA     MusicPointersLoopPart,Y
      STA     MusicPointerLoopPart
      LDA     MusicPointerFirstPart

ProcessMusicQueue_SetCurrentPart:
      STA     MusicPointerCurrentPart

ProcessMusicQueue_SetNextPart:
      INC     MusicPointerCurrentPart
      LDY     MusicPointerCurrentPart
      CPY     MusicPointerEndPart
      BNE     ProcessMusicQueue_ReadHeader

      LDA     MusicPointerLoopPart
      BNE     ProcessMusicQueue_SetCurrentPart

      JMP     StopMusic

ProcessMusicQueue_Part2:
      STA     MusicPlaying2
      LDY     MusicPlaying1
      STY     MusicResume1
      LDY     #$00
      STY     MusicPlaying1

ProcessMusicQueue_PointerLoop:
      INY
      LSR     A
      BCC     ProcessMusicQueue_PointerLoop

ProcessMusicQueue_ReadHeader:
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
IFDEF PROTOTYPE_MUSIC
      LDA     MusicPartPointers+6,Y
ENDIF
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

ProcessMusicQueue_ReadNoteData:
      DEC     MusicSquare2NoteLength
      BNE     ProcessMusicQueue_Square2SustainNote

      LDY     MusicSquare1NoteOffset
      INC     MusicSquare1NoteOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     ProcessMusicQueue_EndOfSegment

      BPL     ProcessMusicQueue_Square2Note

      BNE     ProcessMusicQueue_Square2Patch

ProcessMusicQueue_EndOfSegment:
      LDA     MusicPlaying1
      BNE     ProcessMusicQueue_ThenSetNextPart

      LDA     MusicPlaying2
      CMP     #Music2_EndingAndCast
      BEQ     ProcessMusicQueue_ThenSetNextPart

      AND     #Music1_Overworld|Music1_Inside|Music1_Subspace
      BEQ     StopMusic

      LDA     MusicResume1
      BNE     ProcessMusicQueue_ResumeMusicQueue1

StopMusic:
      LDA     #$00
      STA     MusicPlaying2
      STA     MusicPlaying1
      STA     SND_CHN
      LDX     #%00001111
      STX     SND_CHN
      RTS

ProcessMusicQueue_ThenSetNextPart:
      JMP     ProcessMusicQueue_SetNextPart

ProcessMusicQueue_ResumeMusicQueue1:
      JMP     ProcessMusicQueue_MusicQueue1

ProcessMusicQueue_Square2Patch:
      TAX
      AND     #$F0
      STA     MusicSquare2Patch
      TXA
      JSR     ProcessMusicQueue_PatchNoteLength

      STA     MusicSquare2NoteStartLength
      LDY     MusicSquare1NoteOffset
      INC     MusicSquare1NoteOffset
      LDA     (CurrentMusicPointer),Y

ProcessMusicQueue_Square2Note:
      LDX     SoundEffectPlaying1
      BNE     ProcessMusicQueue_Square2ContinueNote

      JSR     PlaySquare2Note

      TAY
      BNE     ProcessMusicQueue_Square2StartNote

      LDA     UNINITIALIZED_MusicSquare2Volume
      JMP     ProcessMusicQueue_Square2UpdateNoteOffset

ProcessMusicQueue_Square2StartNote:
      LDA     MusicSquare2NoteStartLength
      LDX     UNINITIALIZED_MusicSquare2Volume ; always overridden in the following subroutine...?
      JSR     SetInstrumentStartOffset

ProcessMusicQueue_Square2UpdateNoteOffset:
      STA     MusicSquare2InstrumentOffset
      JSR     SetSquare2VolumeAndSweep

ProcessMusicQueue_Square2ContinueNote:
      LDA     MusicSquare2NoteStartLength
      STA     MusicSquare2NoteLength

ProcessMusicQueue_Square2SustainNote:
      LDX     SoundEffectPlaying1
      BNE     ProcessMusicQueue_Square1

      LDY     MusicSquare2InstrumentOffset
      BEQ     ProcessMusicQueue_LoadSquare2Instrument

      DEC     MusicSquare2InstrumentOffset

ProcessMusicQueue_LoadSquare2Instrument:
      LDA     MusicSquare2NoteStartLength
      LDX     MusicSquare2Patch
      JSR     LoadSquareInstrumentDVE

      STA     SQ2_VOL
      LDX     #$7F
      STX     SQ2_SWEEP

ProcessMusicQueue_Square1:
      DEC     MusicSquare1NoteLength
      BNE     ProcessMusicQueue_Square1SustainNote

ProcessMusicQueue_Square1Patch:
      LDY     CurrentMusicSquare1Offset
      INC     CurrentMusicSquare1Offset
      LDA     (CurrentMusicPointer),Y
      BPL     ProcessMusicQueue_Square1AfterPatch

      TAX
      AND     #$F0
      STA     MusicSquare1Patch
      TXA
      JSR     ProcessMusicQueue_PatchNoteLength

      STA     MusicSquare1NoteStartLength
      LDY     CurrentMusicSquare1Offset
      INC     CurrentMusicSquare1Offset
      LDA     (CurrentMusicPointer),Y

ProcessMusicQueue_Square1AfterPatch:
      TAY
      BNE     ProcessMusicQueue_Square1Note

      LDA     #$83
      STA     SQ1_VOL
      LDA     #$94
      STA     SQ1_SWEEP
      STA     MusicSquare1NoteSweep
      BNE     ProcessMusicQueue_Square1Patch

ProcessMusicQueue_Square1Note:
      LDY     SoundEffectPlaying2
      BNE     ProcessMusicQueue_Square1ContinueNote

      JSR     PlaySquare1Note

      BNE     ProcessMusicQueue_Square1StartNote

      LDA     UNINITIALIZED_MusicSquare2Volume
      JMP     ProcessMusicQueue_Square1UpdateNoteOffset

ProcessMusicQueue_Square1StartNote:
      LDA     MusicSquare1NoteStartLength
      LDX     UNINITIALIZED_MusicSquare1Volume ; always overridden in the following subroutine...?
      JSR     SetInstrumentStartOffset

ProcessMusicQueue_Square1UpdateNoteOffset:
      STA     MusicSquare1InstrumentOffset
      JSR     SetSquare1VolumeAndSweep

ProcessMusicQueue_Square1ContinueNote:
      LDA     MusicSquare1NoteStartLength
      STA     MusicSquare1NoteLength

ProcessMusicQueue_Square1SustainNote:
      LDA     SoundEffectPlaying2
      BNE     ProcessMusicQueue_Triangle

      LDY     MusicSquare1InstrumentOffset
      BEQ     ProcessMusicQueue_Square1AfterDecrementInstrumentOffset

      DEC     MusicSquare1InstrumentOffset

ProcessMusicQueue_Square1AfterDecrementInstrumentOffset:
      LDA     MusicSquare1NoteStartLength
      LDX     MusicSquare1Patch
      JSR     LoadSquareInstrumentDVE

      STA     SQ1_VOL
      LDA     MusicSquare1NoteSweep
      BNE     ProcessMusicQueue_Square1Sweep

      LDA     #$7F

ProcessMusicQueue_Square1Sweep:
      STA     SQ1_SWEEP

ProcessMusicQueue_Triangle:
      LDA     CurrentMusicTriangleOffset
      BEQ     ProcessMusicQueue_NoiseDPCM

      DEC     MusicTriangleNoteLength
      BNE     ProcessMusicQueue_NoiseDPCM

      LDY     CurrentMusicTriangleOffset
      INC     CurrentMusicTriangleOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     ProcessMusicQueue_TriangleSetLength

      BPL     ProcessMusicQueue_TriangleNote

      JSR     ProcessMusicQueue_PatchNoteLength

      STA     MusicTriangleNoteStartLength
      LDA     #$1F
      STA     TRI_LINEAR
      LDY     CurrentMusicTriangleOffset
      INC     CurrentMusicTriangleOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     ProcessMusicQueue_TriangleSetLength

ProcessMusicQueue_TriangleNote:
      JSR     PlayTriangleNote

      LDX     MusicTriangleNoteStartLength
      STX     MusicTriangleNoteLength
      TXA
      CMP     #$0A
      BCC     ProcessMusicQueue_TriangleNoteShort

      CMP     #$1E
      BCS     ProcessMusicQueue_TriangleNoteLong

ProcessMusicQueue_TriangleNoteMedium:
      LDA     #$24
      BNE     ProcessMusicQueue_TriangleSetLength

ProcessMusicQueue_TriangleNoteShort:
      LDA     #$18
      BNE     ProcessMusicQueue_TriangleSetLength

ProcessMusicQueue_TriangleNoteLong:
      LDA     #$6F

ProcessMusicQueue_TriangleSetLength:
      STA     TRI_LINEAR

ProcessMusicQueue_NoiseDPCM:
IFNDEF PROTOTYPE_MUSIC
      LDA     MusicPlaying1
      AND     #Music1_Inside|Music1_Invincible
      BNE     ProcessMusicQueue_DPCM
ENDIF

ProcessMusicQueue_Noise:
      LDA     CurrentMusicNoiseOffset
      BEQ     ProcessMusicQueue_ThenNoiseEnd

      DEC     MusicNoiseNoteLength
      BNE     ProcessMusicQueue_ThenNoiseEnd

ProcessMusicQueue_NoiseByte:
      LDY     CurrentMusicNoiseOffset
      INC     CurrentMusicNoiseOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     ProcessMusicQueue_NoiseLoopSegment

      BPL     ProcessMusicQueue_NoiseNote

      JSR     ProcessMusicQueue_PatchNoteLength

      STA     MusicNoiseNoteStartLength
      LDY     CurrentMusicNoiseOffset
      INC     CurrentMusicNoiseOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     ProcessMusicQueue_NoiseLoopSegment

ProcessMusicQueue_NoiseNote:
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

ProcessMusicQueue_ThenNoiseEnd:
      JMP     ProcessMusicQueue_NoiseEnd

ProcessMusicQueue_NoiseLoopSegment:
      LDA     CurrentMusicNoiseStartOffset
      STA     CurrentMusicNoiseOffset
      JMP     ProcessMusicQueue_NoiseByte

ProcessMusicQueue_NoiseEnd:
      LDA     MusicPlaying1
IFNDEF PROTOTYPE_MUSIC
      AND     #Music1_Inside|Music1_Invincible
ENDIF
IFDEF PROTOTYPE_MUSIC
      AND     #Music1_Inside
ENDIF
      BNE     ProcessMusicQueue_DPCM

      RTS

ProcessMusicQueue_DPCM:
      LDA     CurrentMusicDPCMOffset
      BEQ     ProcessMusicQueue_DPCMEnd

      DEC     MusicDPCMNoteLength
      BNE     ProcessMusicQueue_DPCMEnd

ProcessMusicQueue_DPCMByte:
      LDY     CurrentMusicDPCMOffset
      INC     CurrentMusicDPCMOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     ProcessMusicQueue_DPCMLoopSegment

      BPL     ProcessMusicQueue_DPCMNote

      JSR     ProcessMusicQueue_PatchNoteLength

      STA     MusicDPCMNoteStartLength
      LDY     CurrentMusicDPCMOffset
      INC     CurrentMusicDPCMOffset
      LDA     (CurrentMusicPointer),Y
      BEQ     ProcessMusicQueue_DPCMLoopSegment

ProcessMusicQueue_DPCMNote:
      ASL     A
      STA     DPCMQueue
      JSR     ProcessDPCMQueue

      LDA     MusicDPCMNoteStartLength
      STA     MusicDPCMNoteLength

ProcessMusicQueue_DPCMEnd:
      RTS

ProcessMusicQueue_DPCMLoopSegment:
      LDA     CurrentMusicDPCMStartOffset
      STA     CurrentMusicDPCMOffset
      JMP     ProcessMusicQueue_DPCMByte


NoiseVolTable:
      .BYTE $10
      .BYTE $1E
      .BYTE $1F
      .BYTE $16

NoiseLoTable:
      .BYTE $00
      .BYTE $03
      .BYTE $0A
      .BYTE $02

NoiseHiTable:
      .BYTE $00
      .BYTE $18
      .BYTE $18
      .BYTE $58


; Input
;   A = full patch byte
; Output
;   A = new note length
ProcessMusicQueue_PatchNoteLength:
      AND     #$F
      CLC
      ADC     MusicTempoSetting
      TAY
      LDA     NoteLengthTable,Y
      RTS

; Input
;   A = note start length, >= $13 for table A, < $13 for instrument table B
; Ouput
;   A = starting instrument offset ($16 for short, $3F for long)
;   X = duty/volume/envelope ($82)
;   Y = sweep ($7F)
;
SetInstrumentStartOffset:
      CMP     #$13
      BCC     SetInstrumentStartOffset_Short
      LDA     #$3F
      BNE     SetInstrumentStartOffset_Exit
SetInstrumentStartOffset_Short:
      LDA     #$16
SetInstrumentStartOffset_Exit:
      LDX     #$82
      LDY     #$7F
      RTS

;
; Loads instrument data for a square channel
;
; Each instrument has two lookup tables based on the note length.
;
; Input
;   A = note length, >= $13 for table A, < $13 for instrument table B
;   X = instrument patch
;   Y = instrument offset
; Output
;   A = duty/volume/envelope
;
LoadSquareInstrumentDVE:
      CPX     #$90
      BEQ     LoadSquareInstrumentDVE_90_E0

      CPX     #$E0
      BEQ     LoadSquareInstrumentDVE_90_E0

      CPX     #$A0
      BEQ     LoadSquareInstrumentDVE_A0

      CPX     #$B0
      BEQ     LoadSquareInstrumentDVE_B0

      CPX     #$C0
      BEQ     LoadSquareInstrumentDVE_C0

      CPX     #$D0
      BEQ     LoadSquareInstrumentDVE_D0

      CPX     #$F0
      BEQ     LoadSquareInstrumentDVE_F0

LoadSquareInstrumentDVE_80:
      CMP     #$13
      BCC     LoadSquareInstrumentDVE_80_Short
      LDA     InstrumentDVE_80,Y
      BNE     LoadSquareInstrumentDVE_80_Exit
LoadSquareInstrumentDVE_80_Short:
      LDA     InstrumentDVE_80_Short,Y
LoadSquareInstrumentDVE_80_Exit:
      RTS

LoadSquareInstrumentDVE_90_E0:
      CMP     #$13
      BCC     LoadSquareInstrumentDVE_90_E0_Short
      LDA     InstrumentDVE_90_E0,Y
      BNE     LoadSquareInstrumentDVE_90_E0_Exit
LoadSquareInstrumentDVE_90_E0_Short:
      LDA     InstrumentDVE_90_E0_Short,Y
LoadSquareInstrumentDVE_90_E0_Exit:
      RTS

LoadSquareInstrumentDVE_A0:
      CMP     #$13
      BCC     LoadSquareInstrumentDVE_A0_Short
      LDA     InstrumentDVE_A0,Y
      BNE     LoadSquareInstrumentDVE_A0_Exit
LoadSquareInstrumentDVE_A0_Short:
      LDA     InstrumentDVE_A0_Short,Y
LoadSquareInstrumentDVE_A0_Exit:
      RTS

LoadSquareInstrumentDVE_B0:
      CMP     #$13
      BCC     LoadSquareInstrumentDVE_B0_Short
      LDA     InstrumentDVE_B0,Y
      BNE     LoadSquareInstrumentDVE_B0_Exit
LoadSquareInstrumentDVE_B0_Short:
      LDA     InstrumentDVE_B0_Short,Y
LoadSquareInstrumentDVE_B0_Exit:
      RTS

LoadSquareInstrumentDVE_C0:
      CMP     #$13
      BCC     LoadSquareInstrumentDVE_C0_Short
      LDA     InstrumentDVE_C0,Y
      BNE     LoadSquareInstrumentDVE_C0_Exit
LoadSquareInstrumentDVE_C0_Short:
      LDA     InstrumentDVE_C0_Short,Y
LoadSquareInstrumentDVE_C0_Exit:
      RTS

LoadSquareInstrumentDVE_F0:
      CMP     #$13
      BCC     LoadSquareInstrumentDVE_F0_Short
      LDA     InstrumentDVE_F0,Y
      BNE     LoadSquareInstrumentDVE_F0_Exit
LoadSquareInstrumentDVE_F0_Short:
      LDA     InstrumentDVE_F0_Short,Y
LoadSquareInstrumentDVE_F0_Exit:
      RTS

LoadSquareInstrumentDVE_D0:
      CMP     #$13
      BCC     LoadSquareInstrumentDVE_D0_Short
      LDA     InstrumentDVE_D0,Y
      BNE     LoadSquareInstrumentDVE_D0_Exit
LoadSquareInstrumentDVE_D0_Short:
      LDA     InstrumentDVE_D0_Short,Y
LoadSquareInstrumentDVE_D0_Exit:
      RTS


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
; Output
;   A = $00
PlayNote:
      CMP     #$7E
      BNE     PlayNote_NotRest

      LDA     #$10
      STA     SQ1_VOL,X
      LDA     #$00
      RTS

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

      PLA
      CMP     #$38
      BCC     PlayNote_CheckSquareChorus

      ; tweak the frequency for notes >= $38
      DEC     NextFrequencyLo

;
; Square 2 plays slightly detuned when Square 1 is using instrument E0
;
; This can be used to achieve a honky tonk piano effect, which is used for the
; title screen as well as the bridge of the overworld theme.
;
PlayNote_CheckSquareChorus:
      TXA
      CMP     #APUOffset_Square2
      BNE     PlayNote_SetFrequency

      LDA     MusicSquare1Patch
      CMP     #$E0
      BEQ     PlayNote_SetFrequency_Square2Detuned

PlayNote_SetFrequency:
      LDA     NextFrequencyLo
      STA     SQ1_LO,X
      STA     UNUSED_MusicSquare1Lo,X ; unused?
      LDA     NextFrequencyHi
      ORA     #$08
      STA     SQ1_HI,X
      RTS

PlayNote_SetFrequency_Square2Detuned:
      LDA     NextFrequencyLo
      SEC
      SBC     #$02
      STA     SQ2_LO
      STA     UNINITIALIZED_MusicSquare2Lo ; unused?
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
      .pad $8F00, $FF
ENDIF

;
; Note Lengths
; ============
;
; These are lookup tables used to determine note lengths (in ticks).
;
; There are a few weird values floating around, but it's generally broken into
; groups of 13 note lengths that correspond to a tempo as follows:
;
; $x0: 1/16 note (rounding down)
; $x1: 1/16 note (rounding up)
; $x2: 1/4 note triplet (rounding down)
; $x3: 1/4 note triplet (rounding up)
; $x4: 1/8 note
; $x5: dotted 1/8 note
; $x6: 1/2 note triplet (rounding down)
; $x7: 1/2 not triplet (rounding up)
; $x8: 1/4 note
; $x9: dotted 1/4 note
; $xA: 1/2 note
; $xB: dotted 1/2 note
; $xC: whole note
; $xD: dotted whole note (usually not defined)
; $xE: double note (usually note defined)
; $xF: usually not defined
;
; 14400 is the number of ticks in a minute (4 ticks * 60 fps * 60 seconds), and
; you can work out the tempo by dividing 14400 by the length of a whole note.
;
NoteLengthTable:

; Character Select
; Star
; Crystal
; Game Over
; Boss Beaten
NoteLengthTable_300bpm:
      .BYTE $03, $03, $04, $04, $06, $09, $08, $08, $0C, $12, $18, $24, $30

NoteLengthTable_257bpm: ; rounded
      .BYTE $03, $04, $05, $04, $07, $0A, $09, $0A, $0E, $15, $1C, $2A, $38

      .BYTE $0B ; junk?

; Title Screen
NoteLengthTable_225bpm:
      .BYTE $04, $04, $05, $06, $08, $0C, $0B, $0A, $10, $18, $20, $30, $40

; Overworld
; Boss
; Wart
; Death
; Subspace
NoteLengthTable_200bpm:
      .BYTE $04, $05, $06, $06, $09, $0D, $0C, $0C, $12, $1B, $24, $36, $48

      .BYTE $0E, $03 ; junk?

NoteLengthTable_180bpm:
      .BYTE $05, $05, $07, $06, $0A, $0F, $0D, $0E, $14, $1E, $28, $3C, $50

NoteLengthTable_164bpm: ; rounded, 163.64 bpm
      .BYTE $05, $06, $07, $08, $0B, $10, $0F, $0E, $16, $21, $2C, $42, $58

      .BYTE $11 ; junk?

; Bonus Chance
NoteLengthTable_150bpm:
      .BYTE $06, $06, $08, $08, $0C, $12, $10, $10, $18, $24, $30, $48, $60

      .BYTE $02 ; junk?

NoteLengthTable_138bpm: ; rounded, 138.46 bpm
      .BYTE $06, $07, $09, $08, $0D, $13, $11, $12, $1A, $27, $34, $4E, $68

      .BYTE $14 ; junk?

; Underground
; Ending
NoteLengthTable_129bpm: ; rounded, 128.57
      .BYTE $07, $07, $09, $0A, $0E, $15, $13, $12, $1C, $2A, $38, $54, $70

      .BYTE $03, $04 ; junk?

NoteLengthTable_120bpm:
      .BYTE $07, $08, $0A, $0A, $0F, $16, $14, $14, $1E, $2D, $3C, $5A, $78

      .BYTE $17 ; junk?

NoteLengthTable_112bpm: ; rounded, 112.5 bpm
      .BYTE $08, $08, $0B, $0A, $10, $18, $15, $16, $20, $30, $40, $60, $80

NoteLengthTable_106bpm: ; rounded, 105.88 bpm
      .BYTE $08, $09, $0B, $0C, $11, $19, $15, $16, $22, $33, $44, $60, $88

      .BYTE $1A ; junk?

NoteLengthTable_100bpm:
      .BYTE $09, $09, $0C, $0C, $12, $1B, $18, $18, $24, $36, $48, $6C, $90


IFDEF PRESERVE_UNUSED_SPACE
      ; Unused space in the original
      ; $8FB3 - $8FFF
      .pad $9000, $FF
ENDIF


;
; Music Part Pointers
; ===================
;
; These are the pointers to various music segments used to cue those themes in
; the game as well as handle relative offsets for looping segments
;
MusicPartPointers:

; These pointers correspond to MusicQueue2 fanfares that temporarily interrupt
; the current background music
MusicPartPointers_Mushroom:
      .BYTE MusicHeaderMushroomBonusChance - MusicPartPointers

MusicPartPointers_BossBeaten:
      .BYTE MusicHeaderBossBeaten - MusicPartPointers

; This version of the crystal fanfare is unused, because special logic in
; ProcessMusicQueue uses this slot for the ending theme instead.
MusicPartPointers_CrystalUnused:
      .BYTE MusicHeaderCrystal - MusicPartPointers

MusicPartPointers_Death:
      .BYTE MusicHeaderDeath - MusicPartPointers

MusicPartPointers_GameOver:
      .BYTE MusicHeaderGameOver - MusicPartPointers

MusicPartPointers_Crystal:
      .BYTE MusicHeaderCrystal - MusicPartPointers

MusicPartPointers_BonusChance:
      .BYTE MusicHeaderMushroomBonusChance - MusicPartPointers

; The rest of the pointers correspond to music that uses the pointer tables
; with support for segment-based looping.
MusicPartPointers_CharacterSelect:
      .BYTE MusicHeaderCharacterSelect1 - MusicPartPointers
MusicPartPointers_CharacterSelectLoop:
      .BYTE MusicHeaderCharacterSelect2 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect3 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect2 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect4 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect5 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect6 - MusicPartPointers
      .BYTE MusicHeaderCharacterSelect7 - MusicPartPointers
MusicPartPointers_CharacterSelectEnd:
      .BYTE MusicHeaderCharacterSelect8 - MusicPartPointers

MusicPartPointers_Overworld:
      .BYTE MusicHeaderOverworld1 - MusicPartPointers
MusicPartPointers_OverworldLoop:
      .BYTE MusicHeaderOverworld2 - MusicPartPointers
      .BYTE MusicHeaderOverworld3 - MusicPartPointers
      .BYTE MusicHeaderOverworld4 - MusicPartPointers
      .BYTE MusicHeaderOverworld3 - MusicPartPointers
      .BYTE MusicHeaderOverworld5 - MusicPartPointers
MusicPartPointers_OverworldEnd:
      .BYTE MusicHeaderOverworld6 - MusicPartPointers

MusicPartPointers_Boss:
MusicPartPointers_BossLoop:
MusicPartPointers_BossEnd:
      .BYTE MusicHeaderBoss - MusicPartPointers

MusicPartPointers_Star:
MusicPartPointers_StarLoop:
MusicPartPointers_StarEnd:
      .BYTE MusicHeaderStar - MusicPartPointers

MusicPartPointers_Wart:
MusicPartPointers_WartLoop:
MusicPartPointers_WartEnd:
      .BYTE MusicHeaderWart - MusicPartPointers

MusicPartPointers_TitleScreen:
      .BYTE MusicHeaderTitleScreen1 - MusicPartPointers
      .BYTE MusicHeaderTitleScreen2 - MusicPartPointers
      .BYTE MusicHeaderTitleScreen3 - MusicPartPointers
MusicPartPointers_TitleScreenEnd:
      .BYTE MusicHeaderTitleScreen4 - MusicPartPointers

MusicPartPointers_SubSpace:
MusicPartPointers_SubSpaceLoop:
      .BYTE MusicHeaderSubspace1 - MusicPartPointers
      .BYTE MusicHeaderSubspace2 - MusicPartPointers
      .BYTE MusicHeaderSubspace3 - MusicPartPointers
      .BYTE MusicHeaderSubspace2 - MusicPartPointers
MusicPartPointers_SubSpaceEnd:
      .BYTE MusicHeaderSubspace4 - MusicPartPointers

MusicPartPointers_Ending:
      .BYTE MusicHeaderEnding1 - MusicPartPointers
      .BYTE MusicHeaderEnding2 - MusicPartPointers
      .BYTE MusicHeaderEnding3 - MusicPartPointers
      .BYTE MusicHeaderEnding4 - MusicPartPointers
IFNDEF PROTOTYPE_MUSIC
      .BYTE MusicHeaderEnding5 - MusicPartPointers
MusicPartPointers_EndingLoop:
MusicPartPointers_EndingEnd:
      .BYTE MusicHeaderEnding6 - MusicPartPointers
ENDIF
IFDEF PROTOTYPE_MUSIC
MusicPartPointers_EndingEnd:
      .BYTE MusicHeaderEnding5 - MusicPartPointers
ENDIF

IFNDEF PROTOTYPE_MUSIC
MusicPartPointers_Underground:
MusicPartPointers_UndergroundLoop:
MusicPartPointers_UndergroundEnd:
      .BYTE MusicHeaderUnderground - MusicPartPointers
ENDIF

IFDEF PROTOTYPE_MUSIC
MusicPartPointers_Underground:
MusicPartPointers_UndergroundLoop:
      .BYTE MusicHeaderUndergroundBeta1 - MusicPartPointers
      .BYTE MusicHeaderUndergroundBeta1 - MusicPartPointers
      .BYTE MusicHeaderUndergroundBeta2 - MusicPartPointers
MusicPartPointers_UndergroundEnd:
      .BYTE MusicHeaderUndergroundBeta2 - MusicPartPointers
ENDIF

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
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $AD, $98
      .WORD MusicDataCharacterSelect1
      .BYTE MusicDataCharacterSelect1_Triangle - MusicDataCharacterSelect1 ; $6B
      .BYTE MusicDataCharacterSelect1_Square1 - MusicDataCharacterSelect1 ; $36
      .BYTE MusicDataCharacterSelect1_Noise - MusicDataCharacterSelect1 ; $A0

MusicHeaderCharacterSelect2:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $5C, $99
      .WORD MusicDataCharacterSelect2
      .BYTE MusicDataCharacterSelect2_Triangle - MusicDataCharacterSelect2 ; $8E
      .BYTE MusicDataCharacterSelect2_Square1 - MusicDataCharacterSelect2 ; $48
      .BYTE MusicDataCharacterSelect2_Noise - MusicDataCharacterSelect2 ; $B0

MusicHeaderCharacterSelect3:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $9A, $99
      .WORD MusicDataCharacterSelect3
      .BYTE MusicDataCharacterSelect3_Triangle - MusicDataCharacterSelect3 ; $6F
      .BYTE MusicDataCharacterSelect3_Square1 - MusicDataCharacterSelect3 ; $48
      .BYTE MusicDataCharacterSelect3_Noise - MusicDataCharacterSelect3 ; $76

MusicHeaderCharacterSelect4:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $9E, $99
      .WORD MusicDataCharacterSelect4
      .BYTE MusicDataCharacterSelect4_Triangle - MusicDataCharacterSelect4 ; $6B
      .BYTE MusicDataCharacterSelect4_Square1 - MusicDataCharacterSelect4 ; $47
      .BYTE MusicDataCharacterSelect4_Noise - MusicDataCharacterSelect4 ; $72

MusicHeaderCharacterSelect5:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $26, $9A
      .WORD MusicDataCharacterSelect5
      .BYTE MusicDataCharacterSelect5_Triangle - MusicDataCharacterSelect5 ; $8A
      .BYTE MusicDataCharacterSelect5_Square1 - MusicDataCharacterSelect5 ; $46
      .BYTE MusicDataCharacterSelect5_Noise - MusicDataCharacterSelect5 ; $AC

MusicHeaderOverworld1:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $D4, $9B
      .WORD MusicDataOverworld1
      .BYTE MusicDataOverworld1_Triangle - MusicDataOverworld1 ; $2B
      .BYTE MusicDataOverworld1_Square1 - MusicDataOverworld1 ; $16
      .BYTE MusicDataOverworld1_Noise - MusicDataOverworld1 ; $3D

MusicHeaderOverworld2:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $20, $9C
      .WORD MusicDataOverworld2
      .BYTE MusicDataOverworld2_Triangle - MusicDataOverworld2 ; $A8
      .BYTE MusicDataOverworld2_Square1 - MusicDataOverworld2 ; $54
      .BYTE MusicDataOverworld2_Noise - MusicDataOverworld2 ; $C9

MusicHeaderOverworld3:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $F9, $9C
      .WORD MusicDataOverworld3
      .BYTE MusicDataOverworld3_Triangle - MusicDataOverworld3 ; $DD
      .BYTE MusicDataOverworld3_Square1 - MusicDataOverworld3 ; $73
      .BYTE MusicDataOverworld3_Noise - MusicDataOverworld3 ; $6C

MusicHeaderOverworld4:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $3F, $9D
      .WORD MusicDataOverworld4
      .BYTE MusicDataOverworld4_Triangle - MusicDataOverworld4 ; $B2
      .BYTE MusicDataOverworld4_Square1 - MusicDataOverworld4 ; $73
      .BYTE MusicDataOverworld4_Noise - MusicDataOverworld4 ; $26

MusicHeaderOverworld5:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $00, $9E
      .WORD MusicDataOverworld5
      .BYTE MusicDataOverworld5_Triangle - MusicDataOverworld5 ; $38
      .BYTE MusicDataOverworld5_Square1 - MusicDataOverworld5 ; $1D
      .BYTE MusicDataOverworld5_Noise - MusicDataOverworld5 ; $46

MusicHeaderOverworld6:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $4D, $9E
      .WORD MusicDataOverworld6
      .BYTE MusicDataOverworld6_Triangle - MusicDataOverworld6 ; $A7
      .BYTE MusicDataOverworld6_Square1 - MusicDataOverworld6 ; $4F
      .BYTE MusicDataOverworld6_Noise - MusicDataOverworld6 ; $C8

IFNDEF PROTOTYPE_MUSIC
MusicHeaderUnderground:
      .BYTE NoteLengthTable_129bpm - NoteLengthTable
      ; .BYTE $BD, $94
      .WORD MusicDataUnderground
      .BYTE MusicDataUnderground_Triangle - MusicDataUnderground ; $53
      .BYTE MusicDataUnderground_Square1 - MusicDataUnderground ; $2A
      .BYTE MusicDataUnderground_DPCM - MusicDataUnderground ; $84
ENDIF

IFDEF PROTOTYPE_MUSIC
MusicHeaderUndergroundBeta1:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      .WORD MusicDataUndergroundBeta1
      .BYTE MusicDataUndergroundBeta1_Triangle - MusicDataUndergroundBeta1
      .BYTE MusicDataUndergroundBeta1_Square1 - MusicDataUndergroundBeta1
      .BYTE MusicDataUndergroundBeta1_Noise - MusicDataUndergroundBeta1
      .BYTE MusicDataUndergroundBeta1_DPCM - MusicDataUndergroundBeta1
MusicHeaderUndergroundBeta2:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      .WORD MusicDataUndergroundBeta2
      .BYTE MusicDataUndergroundBeta2_Triangle - MusicDataUndergroundBeta2
      .BYTE MusicDataUndergroundBeta2_Square1 - MusicDataUndergroundBeta2
      .BYTE MusicDataUndergroundBeta2_Noise - MusicDataUndergroundBeta2
      .BYTE MusicDataUndergroundBeta2_DPCM - MusicDataUndergroundBeta2
ENDIF

MusicHeaderBoss:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $1C, $9F
      .WORD MusicDataBoss
      .BYTE MusicDataBoss_Triangle - MusicDataBoss ; $83
      .BYTE MusicDataBoss_Square1 - MusicDataBoss ; $42
IFNDEF PROTOTYPE_MUSIC
      .BYTE $00 ; no noise channel
ENDIF

MusicHeaderStar:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $69, $94
      .WORD MusicDataStar
      .BYTE MusicDataStar_Triangle - MusicDataStar ; $37
      .BYTE MusicDataStar_Square1 - MusicDataStar ; $1A
IFNDEF PROTOTYPE_MUSIC
      .BYTE MusicDataStar_DPCM - MusicDataStar ; $49
ENDIF
IFDEF PROTOTYPE_MUSIC
      .BYTE MusicDataStar_Noise - MusicDataStar
ENDIF

MusicHeaderWart:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $C7, $9F
      .WORD MusicDataWart
      .BYTE MusicDataWart_Triangle - MusicDataWart ; $96
      .BYTE MusicDataWart_Square1 - MusicDataWart ; $4B
IFNDEF PROTOTYPE_MUSIC
      .BYTE $00 ; no noise channel
ENDIF

MusicHeaderCrystal:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $48, $A1
      .WORD MusicDataCrystal
      .BYTE MusicDataCrystal_Triangle - MusicDataCrystal ; $1B
      .BYTE MusicDataCrystal_Square1 - MusicDataCrystal ; $0D
      ; no noise channel, using $00 from below

MusicHeaderGameOver:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $CE, $A0
      .WORD MusicDataGameOver
      .BYTE MusicDataGameOver_Triangle - MusicDataGameOver ; $1B
      .BYTE MusicDataGameOver_Square1 - MusicDataGameOver ; $0E
      ; no noise channel, using $00 from below

MusicHeaderBossBeaten:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $F2, $A0
      .WORD MusicDataBossBeaten
      .BYTE MusicDataBossBeaten_Triangle - MusicDataBossBeaten ; $41
      .BYTE MusicDataBossBeaten_Square1 - MusicDataBossBeaten ; $27
      ; no noise channel, using $00 from below

MusicHeaderCharacterSelect8:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $93, $9B
      .WORD MusicDataCharacterSelect8
      .BYTE MusicDataCharacterSelect8_Triangle - MusicDataCharacterSelect8 ; $2F
      .BYTE MusicDataCharacterSelect8_Square1 - MusicDataCharacterSelect8 ; $21
      .BYTE MusicDataCharacterSelect8_Noise - MusicDataCharacterSelect8 ; $38

MusicHeaderMushroomBonusChance:
      .BYTE NoteLengthTable_150bpm - NoteLengthTable
      ; .BYTE $BB, $A0
      .WORD MusicDataMushroomBonusChance
      .BYTE $00 ; no triangle channel
      .BYTE MusicDataMushroomBonusChance_Square1 - MusicDataMushroomBonusChance ; $0A
      ; no noise channel, using $00 from below

MusicHeaderCharacterSelect7:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $DF, $9A
      .WORD MusicDataCharacterSelect7
      .BYTE MusicDataCharacterSelect7_Triangle - MusicDataCharacterSelect7 ; $97
      .BYTE MusicDataCharacterSelect7_Square1 - MusicDataCharacterSelect7 ; $61
      .BYTE MusicDataCharacterSelect7_Noise - MusicDataCharacterSelect7 ; $B0

MusicHeaderDeath:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $6F, $A1
      .WORD MusicDataDeath
      .BYTE MusicDataDeath_Triangle - MusicDataDeath ; $17
      .BYTE MusicDataDeath_Square1 - MusicDataDeath ; $0C
      ; no noise channel, using $00 from below

MusicHeaderCharacterSelect6:
      .BYTE NoteLengthTable_300bpm - NoteLengthTable
      ; .BYTE $5D, $9A
      .WORD MusicDataCharacterSelect6
      .BYTE MusicDataCharacterSelect6_Triangle - MusicDataCharacterSelect6 ; $6C
      .BYTE MusicDataCharacterSelect6_Square1 - MusicDataCharacterSelect6 ; $45
      .BYTE MusicDataCharacterSelect6_Noise - MusicDataCharacterSelect6 ; $79

MusicHeaderTitleScreen2:
      .BYTE NoteLengthTable_225bpm - NoteLengthTable
      ; .BYTE $A7, $96
      .WORD MusicDataTitleScreen2
      .BYTE MusicDataTitleScreen2_Triangle - MusicDataTitleScreen2 ; $BC
      .BYTE MusicDataTitleScreen2_Square1 - MusicDataTitleScreen2 ; $64
      .BYTE MusicDataTitleScreen2_Noise - MusicDataTitleScreen2 ; $59

MusicHeaderTitleScreen1:
      .BYTE NoteLengthTable_225bpm - NoteLengthTable
      ; .BYTE $3E, $96
      .WORD MusicDataTitleScreen1
      .BYTE MusicDataTitleScreen1_Triangle - MusicDataTitleScreen1 ; $43
      .BYTE MusicDataTitleScreen1_Square1 - MusicDataTitleScreen1 ; $22
      .BYTE MusicDataTitleScreen1_Noise - MusicDataTitleScreen1 ; $57

MusicHeaderTitleScreen3:
      .BYTE NoteLengthTable_225bpm - NoteLengthTable
      ; .BYTE $94, $97
      .WORD MusicDataTitleScreen3
      .BYTE MusicDataTitleScreen3_Triangle - MusicDataTitleScreen3 ; $8D
      .BYTE MusicDataTitleScreen3_Square1 - MusicDataTitleScreen3 ; $47
      .BYTE MusicDataTitleScreen3_Noise - MusicDataTitleScreen3 ; $BA

MusicHeaderTitleScreen4:
      .BYTE NoteLengthTable_225bpm - NoteLengthTable
      ; .BYTE $78, $98
      .WORD MusicDataTitleScreen4
      .BYTE MusicDataTitleScreen4_Triangle - MusicDataTitleScreen4 ; $24
      .BYTE MusicDataTitleScreen4_Square1 - MusicDataTitleScreen4 ; $12
      .BYTE MusicDataTitleScreen4_Noise - MusicDataTitleScreen4 ; $29

MusicHeaderSubspace1:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $50, $95
      .WORD MusicDataSubspace1
      .BYTE MusicDataSubspace1_Triangle - MusicDataSubspace1 ; $38
      .BYTE MusicDataSubspace1_Square1 - MusicDataSubspace1 ; $1C
      .BYTE MusicDataSubspace1_Noise - MusicDataSubspace1 ; $83

MusicHeaderSubspace2:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $A3, $95
      .WORD MusicDataSubspace2
      .BYTE MusicDataSubspace2_Triangle - MusicDataSubspace2 ; $24
      .BYTE MusicDataSubspace2_Square1 - MusicDataSubspace2 ; $12
      .BYTE MusicDataSubspace2_Noise - MusicDataSubspace2 ; $30

MusicHeaderSubspace3:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $E0, $95
      .WORD MusicDataSubspace3
      .BYTE MusicDataSubspace3_Triangle - MusicDataSubspace3 ; $22
      .BYTE MusicDataSubspace3_Square1 - MusicDataSubspace3 ; $10
      .BYTE MusicDataSubspace3_Noise - MusicDataSubspace3 ; $51

MusicHeaderSubspace4:
      .BYTE NoteLengthTable_200bpm - NoteLengthTable
      ; .BYTE $0F, $96
      .WORD MusicDataSubspace4
      .BYTE MusicDataSubspace4_Triangle - MusicDataSubspace4 ; $17
      .BYTE MusicDataSubspace4_Square1 - MusicDataSubspace4 ; $0A
      .BYTE MusicDataSubspace4_Noise - MusicDataSubspace4 ; $22

MusicHeaderEnding1:
      .BYTE NoteLengthTable_129bpm - NoteLengthTable
      ; .BYTE $1E, $91
      .WORD MusicDataEnding1
      .BYTE MusicDataEnding1_Triangle - MusicDataEnding1 ; $3D
      .BYTE MusicDataEnding1_Square1 - MusicDataEnding1; $1F
      .BYTE MusicDataEnding1_Noise - MusicDataEnding1 ; $6D

MusicHeaderEnding3:
      .BYTE NoteLengthTable_129bpm - NoteLengthTable
      ; .BYTE $9C, $91
      .WORD MusicDataEnding3
      .BYTE MusicDataEnding3_Triangle - MusicDataEnding3 ; $41
      .BYTE MusicDataEnding3_Square1 - MusicDataEnding3 ; $21
      .BYTE MusicDataEnding3_Noise - MusicDataEnding3 ; $8C

MusicHeaderEnding2:
      .BYTE NoteLengthTable_129bpm - NoteLengthTable
      ; .BYTE $80, $92
      .WORD MusicDataEnding2
      .BYTE MusicDataEnding2_Triangle - MusicDataEnding2 ; $2A
      .BYTE MusicDataEnding2_Square1 - MusicDataEnding2 ; $5A
      .BYTE MusicDataEnding2_Noise - MusicDataEnding2 ; $19

MusicHeaderEnding5:
      .BYTE NoteLengthTable_129bpm - NoteLengthTable
      ; .BYTE $F2, $92
      .WORD MusicDataEnding5
      .BYTE MusicDataEnding5_Triangle - MusicDataEnding5 ; $4C
      .BYTE MusicDataEnding5_Square1 - MusicDataEnding5 ; $14
      .BYTE MusicDataEnding5_Noise - MusicDataEnding5 ; $68

MusicHeaderEnding4:
      .BYTE NoteLengthTable_129bpm - NoteLengthTable
      ; .BYTE $0D, $92
      .WORD MusicDataEnding4
      .BYTE MusicDataEnding4_Triangle - MusicDataEnding4 ; $43
      .BYTE MusicDataEnding4_Square1 - MusicDataEnding4 ; $29
      .BYTE MusicDataEnding4_Noise - MusicDataEnding4 ; $1B

IFNDEF PROTOTYPE_MUSIC
MusicHeaderEnding6:
      .BYTE NoteLengthTable_129bpm - NoteLengthTable
      ; .BYTE $76, $93
      .WORD MusicDataEnding6
      .BYTE $00 ; no triangle channel
      .BYTE MusicDataEnding6_Square1 - MusicDataEnding6 ; $72
      .BYTE $00 ; no square channel
ENDIF


MusicPointersFirstPart:
      .BYTE MusicPartPointers_Overworld - MusicPartPointers
      .BYTE MusicPartPointers_CharacterSelect - MusicPartPointers
      .BYTE MusicPartPointers_Underground - MusicPartPointers
      .BYTE MusicPartPointers_Boss - MusicPartPointers
      .BYTE MusicPartPointers_Star - MusicPartPointers
      .BYTE MusicPartPointers_SubSpace - MusicPartPointers
      .BYTE MusicPartPointers_Wart - MusicPartPointers
      .BYTE MusicPartPointers_TitleScreen - MusicPartPointers
      .BYTE MusicPartPointers_Ending - MusicPartPointers

MusicPointersEndPart:
      .BYTE MusicPartPointers_OverworldEnd - MusicPartPointers
      .BYTE MusicPartPointers_CharacterSelectEnd - MusicPartPointers
      .BYTE MusicPartPointers_UndergroundEnd - MusicPartPointers
      .BYTE MusicPartPointers_BossEnd - MusicPartPointers
      .BYTE MusicPartPointers_StarEnd - MusicPartPointers
      .BYTE MusicPartPointers_SubSpaceEnd - MusicPartPointers
      .BYTE MusicPartPointers_WartEnd - MusicPartPointers
      .BYTE MusicPartPointers_TitleScreenEnd - MusicPartPointers
      .BYTE MusicPartPointers_EndingEnd - MusicPartPointers

MusicPointersLoopPart:
      .BYTE MusicPartPointers_OverworldLoop - MusicPartPointers
      .BYTE MusicPartPointers_CharacterSelectLoop - MusicPartPointers
      .BYTE MusicPartPointers_UndergroundLoop - MusicPartPointers
      .BYTE MusicPartPointers_BossLoop - MusicPartPointers
      .BYTE MusicPartPointers_StarLoop - MusicPartPointers
      .BYTE MusicPartPointers_SubSpaceLoop - MusicPartPointers
      .BYTE MusicPartPointers_WartEnd - MusicPartPointers
      .BYTE $00 ; no loop
IFNDEF PROTOTYPE_MUSIC
      .BYTE MusicPartPointers_EndingLoop - MusicPartPointers
ENDIF
IFDEF PROTOTYPE_MUSIC
      .BYTE $00 ; no loop
ENDIF

;
; Music Data
; ==========
;
; Each segment of music is broken down into tracks for individual instruments.
;
; Square 2:
;   $00: End of segment
;   $01-$7D: Note On
;   $7E: Rest
;   $80-$FE: first nybble is the instrument, second nybble is the note length
;            as determined by the note length lookup table. The next byte is
;            expected to be a Note On.
;   $FF: activate bend if used after a Note On
;
; Square 1 is the same as Square 2, except for the following:
;   $00: Activate a ramp effect
;
; Triangle is the same as Square 2, except for the following:
;   $00: Mute output (triangle channel is constant volume otherwise)
;   $80-$FF: second nybble is the note length from the note length lookup table
;
; Noise/DPCM:
;   $00: Restart (used for looping percussion within a segment)
;   $01: Rest
;   $02-$7F: Various note-on values, low bit is ignored
;   $02: Closed Hi-Hat
;   $04: Kick
;   $06: Open Hi-Hat
;   $08: Quiet Hi-Hat
;   $0A: Crash Cymbal
;   $0C: Brushed Snare
;   $0E: Muted Crash
;   $10: Snare
;   $12: Deep Kick
;   $14: High Static
;   $16: Low Static
;   $18: Ride
;   $1A: Closed Hi-Hat
;   $1C: Medium Static
;   $1E: Obnoxious Crash
;   $80-$FF: second nybble is the note length from the note length lookup table
;
; DPCM is the same as Noise, except for the following:
;
; The SMB3 disassembly is a good reference, since the format is the same:
; http://sonicepoch.com/sm3mix/disassembly.html#TRACK
;
MusicData:

MusicDataEnding1:
MusicDataEnding1_Square2:
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
MusicDataEnding1_Square1:
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
MusicDataEnding1_Triangle:
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
MusicDataEnding1_Noise:
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
MusicDataEnding3_Square2:
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
MusicDataEnding3_Square1:
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
MusicDataEnding3_Triangle:
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
MusicDataEnding4_Square2:
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
MusicDataEnding3_Noise:
MusicDataEnding4_Noise:
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
MusicDataEnding4_Square1:
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
MusicDataEnding4_Triangle:
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
MusicDataEnding2_Square2:
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
MusicDataEnding2_Noise:
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
MusicDataEnding2_Triangle:
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
MusicDataEnding2_Square1:
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
MusicDataEnding5_Square2:
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
IFNDEF PROTOTYPE_MUSIC
      .BYTE $7E
      .BYTE $8C
      .BYTE $7E
      .BYTE $88
      .BYTE $7E
      .BYTE $FC
      .BYTE $7E
      .BYTE $7E
ENDIF
      .BYTE $00
MusicDataEnding5_Square1:
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
IFNDEF PROTOTYPE_MUSIC
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
ENDIF
IFDEF PROTOTYPE_MUSIC
      .BYTE $8A
      .BYTE $18
ENDIF
MusicDataEnding5_Triangle:
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
IFNDEF PROTOTYPE_MUSIC
      .BYTE $7E
      .BYTE $8C
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
ENDIF
MusicDataEnding5_Noise:
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
IFNDEF PROTOTYPE_MUSIC
      .BYTE $01
      .BYTE $8C
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
ENDIF

IFNDEF PROTOTYPE_MUSIC
MusicDataEnding6:
MusicDataEnding6_Square2:
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
MusicDataEnding6_Square1:
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
ENDIF

MusicDataStar:
MusicDataStar_Square2:
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
MusicDataStar_Square1:
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
MusicDataStar_Triangle:
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
IFNDEF PROTOTYPE_MUSIC
MusicDataStar_DPCM:
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
ENDIF
IFDEF PROTOTYPE_MUSIC
MusicDataStar_Noise:
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
ENDIF

IFNDEF PROTOTYPE_MUSIC
MusicDataUnderground:
MusicDataUnderground_Square2:
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
MusicDataUnderground_Square1:
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
MusicDataUnderground_Triangle:
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
MusicDataUnderground_DPCM:
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
ENDIF

IFDEF PROTOTYPE_MUSIC
MusicDataUndergroundBeta1:
MusicDataUndergroundBeta2:
MusicDataUndergroundBeta1_Square2:
MusicDataUndergroundBeta2_Square2:
      .BYTE $DC
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $D4
      .BYTE $18
      .BYTE $30
      .BYTE $12
      .BYTE $2A
      .BYTE $14
      .BYTE $2C
      .BYTE $D8
      .BYTE $7E
      .BYTE $DC
      .BYTE $7E
      .BYTE $D4
      .BYTE $18
      .BYTE $30
      .BYTE $12
      .BYTE $2A
      .BYTE $14
      .BYTE $2C
      .BYTE $D8
      .BYTE $7E
      .BYTE $DC
      .BYTE $7E
      .BYTE $D4
      .BYTE $0A
      .BYTE $22
      .BYTE $04
      .BYTE $1C
      .BYTE $06
      .BYTE $1E
      .BYTE $D8
      .BYTE $7E
      .BYTE $DC
      .BYTE $7E
      .BYTE $D4
      .BYTE $0A
      .BYTE $22
      .BYTE $04
      .BYTE $1C
      .BYTE $06
      .BYTE $1E
      .BYTE $DC
      .BYTE $7E
      .BYTE $D2
      .BYTE $1E
      .BYTE $1C
      .BYTE $1A
      .BYTE $D8
      .BYTE $18
      .BYTE $1E
      .BYTE $1C
      .BYTE $10
      .BYTE $0E
      .BYTE $1A
      .BYTE $D2
      .BYTE $18
      .BYTE $24
      .BYTE $22
      .BYTE $20
      .BYTE $2C
      .BYTE $2A
      .BYTE $D6
      .BYTE $28
      .BYTE $1E
      .BYTE $16
      .BYTE $14
      .BYTE $12
      .BYTE $10
      .BYTE $DC
      .BYTE $7E
      .BYTE $00
MusicDataUndergroundBeta1_Square1:
MusicDataUndergroundBeta2_Square1:
MusicDataUndergroundBeta1_Triangle:
MusicDataUndergroundBeta2_Triangle:
      .BYTE $8C
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $84
      .BYTE $30
      .BYTE $48
      .BYTE $2A
      .BYTE $42
      .BYTE $2C
      .BYTE $44
      .BYTE $88
      .BYTE $7E
      .BYTE $8C
      .BYTE $7E
      .BYTE $84
      .BYTE $30
      .BYTE $48
      .BYTE $2A
      .BYTE $42
      .BYTE $2C
      .BYTE $44
      .BYTE $88
      .BYTE $7E
      .BYTE $8C
      .BYTE $7E
      .BYTE $84
      .BYTE $22
      .BYTE $3A
      .BYTE $1C
      .BYTE $34
      .BYTE $1E
      .BYTE $36
      .BYTE $88
      .BYTE $7E
      .BYTE $8C
      .BYTE $7E
      .BYTE $84
      .BYTE $22
      .BYTE $3A
      .BYTE $1C
      .BYTE $34
      .BYTE $1E
      .BYTE $36
      .BYTE $8C
      .BYTE $7E
      .BYTE $82
      .BYTE $36
      .BYTE $34
      .BYTE $32
      .BYTE $88
      .BYTE $30
      .BYTE $36
      .BYTE $34
      .BYTE $28
      .BYTE $26
      .BYTE $32
      .BYTE $82
      .BYTE $30
      .BYTE $3C
      .BYTE $3A
      .BYTE $38
      .BYTE $44
      .BYTE $42
      .BYTE $86
      .BYTE $40
      .BYTE $36
      .BYTE $2E
      .BYTE $2C
      .BYTE $2A
      .BYTE $28
      .BYTE $8C
      .BYTE $7E
MusicDataUndergroundBeta1_DPCM:
      .BYTE $8A
      .BYTE $01
      .BYTE $10
      .BYTE $84
      .BYTE $01
      .BYTE $01
      .BYTE $88
      .BYTE $01
      .BYTE $8A
      .BYTE $10
      .BYTE $8A
      .BYTE $01
      .BYTE $89
      .BYTE $10
      .BYTE $88
      .BYTE $01
      .BYTE $01
      .BYTE $84
      .BYTE $01
      .BYTE $88
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $10
      .BYTE $00
MusicDataUndergroundBeta2_DPCM:
      .BYTE $88
      .BYTE $01
      .BYTE $10
      .BYTE $84
      .BYTE $01
      .BYTE $01
      .BYTE $88
      .BYTE $10
      .BYTE $84
      .BYTE $01
      .BYTE $01
      .BYTE $10
      .BYTE $88
      .BYTE $01
      .BYTE $84
      .BYTE $01
      .BYTE $88
      .BYTE $10
      .BYTE $00
MusicDataUndergroundBeta1_Noise:
      .BYTE $8A
      .BYTE $01
      .BYTE $10
      .BYTE $01
      .BYTE $10
      .BYTE $01
      .BYTE $10
      .BYTE $01
      .BYTE $88
      .BYTE $10
      .BYTE $84
      .BYTE $10
      .BYTE $10
      .BYTE $00
MusicDataUndergroundBeta2_Noise:
      .BYTE $84
      .BYTE $02
      .BYTE $02
      .BYTE $10
      .BYTE $02
      .BYTE $00
ENDIF

MusicDataSubspace1:
MusicDataSubspace1_Square2:
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
MusicDataSubspace1_Square1:
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
MusicDataSubspace1_Triangle:
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
MusicDataSubspace2_Square2:
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
MusicDataSubspace2_Square1:
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
MusicDataSubspace2_Triangle:
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
MusicDataSubspace1_Noise:
MusicDataSubspace2_Noise:
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
MusicDataSubspace3_Square2:
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
MusicDataSubspace3_Square1:
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
MusicDataSubspace3_Triangle:
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
MusicDataSubspace4_Square2:
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
MusicDataSubspace4_Square1:
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
MusicDataSubspace4_Triangle:
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
MusicDataSubspace3_Noise:
MusicDataSubspace4_Noise:
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
MusicDataTitleScreen1_Square2:
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
MusicDataTitleScreen1_Square1:
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
MusicDataTitleScreen1_Triangle:
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
MusicDataTitleScreen1_Noise:
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
MusicDataTitleScreen2_Square2:
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
MusicDataTitleScreen2_Noise:
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
MusicDataTitleScreen2_Square1:
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
MusicDataTitleScreen2_Triangle:
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
MusicDataTitleScreen3_Square2:
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
MusicDataTitleScreen3_Square1:
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
MusicDataTitleScreen3_Triangle:
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
MusicDataTitleScreen3_Noise:
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
MusicDataTitleScreen4_Square2:
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
MusicDataTitleScreen4_Square1:
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
MusicDataTitleScreen4_Triangle:
      .BYTE $EB
      .BYTE $7E
      .BYTE $7E
      .BYTE $7E
      .BYTE $30
MusicDataTitleScreen4_Noise:
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
MusicDataCharacterSelect1_Square2:
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
MusicDataCharacterSelect1_Square1:
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
MusicDataCharacterSelect1_Triangle:
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
MusicDataCharacterSelect1_Noise:
      .BYTE $8A
      .BYTE $04
      .BYTE $01
      .BYTE $00

; Seems to be a little duplicated chunk of MusicDataCharacterSelect2_Square2
MusicDataCharacterSelect_Square_UNUSED:
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
MusicDataCharacterSelect2_Square2:
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
MusicDataCharacterSelect3_Square2:
      .BYTE $AA
      .BYTE $7E
      .BYTE $7E
      .BYTE $00

MusicDataCharacterSelect4:
MusicDataCharacterSelect4_Square2:
      .BYTE $C8
      .BYTE $7E
      .BYTE $48
      .BYTE $4C
      .BYTE $4E
      .BYTE $00

MusicDataCharacterSelect2_Square1:
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

MusicDataCharacterSelect3_Square1:
      .BYTE $AA
      .BYTE $7E
      .BYTE $7E

MusicDataCharacterSelect4_Square1:
      .BYTE $C8
      .BYTE $7E
      .BYTE $38
      .BYTE $3A
      .BYTE $3C

MusicDataCharacterSelect2_Triangle:
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

MusicDataCharacterSelect3_Triangle:
MusicDataCharacterSelect4_Triangle:
      .BYTE $8A
      .BYTE $7E
      .BYTE $7E

MusicDataCharacterSelect2_Noise:
      .BYTE $88
      .BYTE $02
      .BYTE $04
      .BYTE $00

MusicDataCharacterSelect3_Noise:
MusicDataCharacterSelect4_Noise:
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
MusicDataCharacterSelect5_Square2:
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
MusicDataCharacterSelect6_Square2:
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

MusicDataCharacterSelect5_Square1:
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

MusicDataCharacterSelect6_Square1:
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

MusicDataCharacterSelect5_Triangle:
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

MusicDataCharacterSelect6_Triangle:
      .BYTE $88
      .BYTE $7E
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $46
      .BYTE $7E
      .BYTE $8A
      .BYTE $7E

MusicDataCharacterSelect5_Noise:
      .BYTE $88
      .BYTE $02
      .BYTE $04
      .BYTE $00

MusicDataCharacterSelect6_Noise:
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
MusicDataCharacterSelect7_Square2:
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
MusicDataCharacterSelect7_Square1:
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
MusicDataCharacterSelect7_Triangle:
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
MusicDataCharacterSelect7_Noise:
      .BYTE $88
      .BYTE $02
      .BYTE $04
      .BYTE $00

MusicDataCharacterSelect8:
MusicDataCharacterSelect8_Square2:
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
MusicDataCharacterSelect8_Square1:
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
MusicDataCharacterSelect8_Triangle:
      .BYTE $88
      .BYTE $7E
      .BYTE $3E
      .BYTE $42
      .BYTE $44
      .BYTE $46
      .BYTE $7E
      .BYTE $8A
      .BYTE $7E
MusicDataCharacterSelect8_Noise:
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
MusicDataOverworld1_Square2:
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
MusicDataOverworld1_Square1:
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
MusicDataOverworld1_Triangle:
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
MusicDataOverworld1_Noise:
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
MusicDataOverworld2_Square2:
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
MusicDataOverworld2_Square1:
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
MusicDataOverworld2_Triangle:
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
MusicDataOverworld2_Noise:
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
MusicDataOverworld3_Square2:
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
MusicDataOverworld4_Square2:
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

MusicDataOverworld3_Noise:
MusicDataOverworld4_Noise:
      .BYTE $88
      .BYTE $06
      .BYTE $82
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $00

MusicDataOverworld3_Square1:
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

MusicDataOverworld4_Square1:
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

MusicDataOverworld3_Triangle:
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

MusicDataOverworld4_Triangle:
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
MusicDataOverworld5_Square2:
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
MusicDataOverworld5_Square1:
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
MusicDataOverworld5_Triangle:
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
MusicDataOverworld5_Noise:
      .BYTE $88
      .BYTE $06
      .BYTE $82
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $00

MusicDataOverworld6:
MusicDataOverworld6_Square2:
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
MusicDataOverworld6_Square1:
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
MusicDataOverworld6_Triangle:
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
MusicDataOverworld6_Noise:
      .BYTE $88
      .BYTE $06
      .BYTE $82
      .BYTE $10
      .BYTE $01
      .BYTE $10
      .BYTE $00

MusicDataBoss:
MusicDataBoss_Square2:
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
MusicDataBoss_Square1:
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
MusicDataBoss_Triangle:
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
MusicDataWart_Square2:
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
      .BYTE $4E
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
MusicDataWart_Square1:
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
MusicDataWart_Triangle:
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
MusicDataMushroomBonusChance_Square2:
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
MusicDataMushroomBonusChance_Square1:
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
MusicDataGameOver_Square2:
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
MusicDataGameOver_Square1:
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
      .BYTE $38
MusicDataGameOver_Triangle:
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
MusicDataBossBeaten_Square2:
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
MusicDataBossBeaten_Square1:
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
MusicDataBossBeaten_Triangle:
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
MusicDataCrystal_Square2:
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
MusicDataCrystal_Square1:
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
MusicDataCrystal_Triangle:
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
MusicDataDeath_Square2:
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
MusicDataDeath_Square1:
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
MusicDataDeath_Triangle:
      .BYTE $84
      .BYTE $7E
      .BYTE $88
      .BYTE $46
      .BYTE $3E
      .BYTE $8A
      .BYTE $30


;
; Instrument Sound Data
; =====================
;
; Each "instrument" is a lookup table of duty/volume/envelope values that are
; read backwards from the end
;
; The normal version of an instrument is 64 bytes
; The shorter version of an instrument is 23 bytes
;
InstrumentSoundData:

; Long square
; 50% duty cycle (square) with slight decay
InstrumentDVE_80: ; $A18D
      .BYTE $90
      .BYTE $95
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

; Long square
; 50% duty cycle (square) with slight decay
InstrumentDVE_80_Short: ; $A1CD
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

; Short square
; 25% duty cycle with pronounced decay
InstrumentDVE_90_E0: ; $A1E4
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

; Short square
; 25% duty cycle with pronounced decay
InstrumentDVE_90_E0_Short: ; $A224
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

; Electric Piano
; 12.5% duty cycle with pronounced decay
InstrumentDVE_A0: ; $A23B
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

; Electric Piano
; 12.5% duty cycle with pronounced decay
InstrumentDVE_A0_Short: ; $A27B
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

; Organ
; 25% duty cycle with slight decay
InstrumentDVE_B0: ; $A293
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

; Organ
; 25% duty cycle with slight decay
InstrumentDVE_B0_Short: ; $A2D3
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

; Strings
; 25% duty cycle with slow attack
InstrumentDVE_C0_Short: ; $A2EA
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

; Strings
; 25% duty cycle with slow attack
InstrumentDVE_C0: ; $A301
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

; Pluck
; 50% to -25% to 12.5% to 12.5% duty cycle with pronounced decay
InstrumentDVE_D0: ; $A341
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

; Pluck
; 50% to -25% to 12.5% to 12.5% duty cycle with pronounced decay
InstrumentDVE_D0_Short: ; $A381
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

IFNDEF PROTOTYPE_MUSIC
; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0_Short: ; $A398
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

; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0: ; $A3AF
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
ENDIF

IFDEF PROTOTYPE_MUSIC
; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0_Short:
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
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5B
      .BYTE $5D

; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0:
      .BYTE $51
      .BYTE $51
      .BYTE $51
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
      .BYTE $5B
      .BYTE $5B
      .BYTE $5C
      .BYTE $5C
      .BYTE $5C
      .BYTE $5D
ENDIF
