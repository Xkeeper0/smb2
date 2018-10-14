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
      .db $6A, $74, $6A, $64, $5C, $52, $5C, $52, $4C, $44, $66, $70, $66, $60, $58, $4E
      .db $58, $4E, $48, $40, $56, $60, $56, $50, $48, $3E, $48, $3E, $38, $30 ; $10


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
      .db SoundEffect1Data_BirdoShot - SoundEffectPointers
      .db SoundEffect1Data_PotionDoorBong - SoundEffectPointers
      .db SoundEffect1Data_CherryGet - SoundEffectPointers
      .db SoundEffect1Data_ThrowItem - SoundEffectPointers
      .db SoundEffect1Data_1UP - SoundEffectPointers
      .db SoundEffect1Data_EnemyHit - SoundEffectPointers
      .db SoundEffect1Data_StopwatchTick - SoundEffectPointers
      .db SoundEffect1Data_HawkOpen_WartBarf - SoundEffectPointers

SoundEffect1Data_PotionDoorBong:
      .db $9F
      .db $10, $0E, $0C, $7E, $7E, $7E
      .db $10, $0E, $0C, $7E, $7E, $7E
      .db $86
      .db $10, $0E, $0C, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
      .db $00

SoundEffect1Data_ThrowItem:
      .db $9F, $64, $7E, $7E
      .db $9E, $68, $7E, $7E
      .db $9D, $6A, $7E, $7E
      .db $9C, $6E, $7E, $7E
      .db $9B, $72, $7E, $7E
      .db $9A, $76, $7E, $7E
      .db $84, $78, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
      .db $00

SoundEffect1Data_BirdoShot:
      .db $9F, $30, $34, $36, $38
      .db $9F, $3C, $3E, $40, $42
      .db $9A, $3A, $3C, $3E, $40
      .db $9C, $38, $3A, $3C, $3E
      .db $96, $36, $38, $3A, $3C
      .db $98, $34, $36, $38, $36
      .db $00

SoundEffect1Data_CherryGet:
      .db $81, $56, $7E, $64, $7E, $68
      .db $00

SoundEffect1Data_EnemyHit:
      .db $99, $18, $1A, $18, $1C, $18, $1A
      .db $9B, $18, $1C, $18, $20, $18, $22
      .db $9F, $18, $3C, $24, $30, $3C, $18, $30
      .db $00

SoundEffect1Data_StopwatchTick:
      .db $80
      .db $68, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
      .db $60, $7E, $7E
      .db $64, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
      .db $56, $7E, $7E
      .db $00

SoundEffect1Data_HawkOpen_WartBarf:
      .db $80, $1E, $1C, $1E, $1A, $18, $16, $1C, $18, $1A, $1E, $18
      .db $16, $14, $12, $14, $16, $14, $12, $2C, $2C, $2A, $2E, $2C
      .db $2A, $28, $26, $28, $24, $22, $20, $1E, $1C, $1A, $18, $16
      .db $14, $14, $12, $10, $0E, $0C, $0A, $08, $08, $06, $04, $02, $02
      .db $00

SoundEffect1Data_1UP:
      .db $81
      .db $5E, $7E, $7E, $7E, $7E, $7E, $7E
      .db $64, $7E, $7E, $7E, $7E, $7E, $7E
      .db $76, $7E, $7E, $7E, $7E, $7E, $7E
      .db $6E, $7E, $7E, $7E, $7E, $7E, $7E
      .db $72, $7E, $7E, $7E, $7E, $7E, $7E
      .db $7C, $7E, $7E
      .db $00


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
      .db (DPCMSampleData_DoorOpenBombBom - DPCMSampleData)/64 ; $4F
      .db (DPCMSampleData_DrumSample - DPCMSampleData)/64 ; $60
      .db (DPCMSampleData_PlayerHurt - DPCMSampleData)/64 ; $4B
      .db (DPCMSampleData_ItemPull - DPCMSampleData)/64 ; $00
      .db (DPCMSampleData_BossDeath - DPCMSampleData)/64 ; $31
      .db (DPCMSampleData_DrumSample - DPCMSampleData)/64 ; $60
      .db (DPCMSampleData_BossHurt - DPCMSampleData)/64 ; $0E
      .db (DPCMSampleData_PlayerDeath - DPCMSampleData)/64 ; $1D

DMCLengthTable:
      .db (DPCMSampleDataEnd_DoorOpenBombBom - DPCMSampleData_DoorOpenBombBom)/16 ; $43
      .db (DPCMSampleDataEnd_DrumSample_A - DPCMSampleData_DrumSample)/16 ; $14
      .db (DPCMSampleDataEnd_PlayerHurt - DPCMSampleData_PlayerHurt)/16 ; $10
      .db (DPCMSampleDataEnd_ItemPull - DPCMSampleData_ItemPull)/16 ; $38
      .db (DPCMSampleDataEnd_BossDeath - DPCMSampleData_BossDeath)/16 ; $48
      .db (DPCMSampleDataEnd_DrumSample_B - DPCMSampleData_DrumSample)/16 ; $28
      .db (DPCMSampleDataEnd_BossHurt - DPCMSampleData_BossHurt)/16 ; $3C
      .db (DPCMSampleDataEnd_PlayerDeath - DPCMSampleData_PlayerDeath)/16 ; $50

DMCFreqTable:
      .db $0E
      .db $0E
      .db $0F
      .db $0F
      .db $0F
      .db $0F
      .db $0F
      .db $0F
      .db $60 ; ???


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
      .db $10
      .db $1E
      .db $1F
      .db $16

NoiseLoTable:
      .db $00
      .db $03
      .db $0A
      .db $02

NoiseHiTable:
      .db $00
      .db $18
      .db $18
      .db $58


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
      .dw $1AB8 ; C
      .dw $1938 ; C# / Db
      .dw $17CC ; D
      .dw $1678 ; D# / Eb
      .dw $1534 ; E
      .dw $1404 ; F
      .dw $12E4 ; F# / Gb
      .dw $11D4 ; G
      .dw $10D4 ; G# / Ab
      .dw $0FE0 ; A
      .dw $0EFC ; A# / Bb
      .dw $0E24 ; B


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
      .db $03, $03, $04, $04, $06, $09, $08, $08, $0C, $12, $18, $24, $30

NoteLengthTable_257bpm: ; rounded
      .db $03, $04, $05, $04, $07, $0A, $09, $0A, $0E, $15, $1C, $2A, $38

      .db $0B ; junk?

; Title Screen
NoteLengthTable_225bpm:
      .db $04, $04, $05, $06, $08, $0C, $0B, $0A, $10, $18, $20, $30, $40

; Overworld
; Boss
; Wart
; Death
; Subspace
NoteLengthTable_200bpm:
      .db $04, $05, $06, $06, $09, $0D, $0C, $0C, $12, $1B, $24, $36, $48

      .db $0E, $03 ; junk?

NoteLengthTable_180bpm:
      .db $05, $05, $07, $06, $0A, $0F, $0D, $0E, $14, $1E, $28, $3C, $50

NoteLengthTable_164bpm: ; rounded, 163.64 bpm
      .db $05, $06, $07, $08, $0B, $10, $0F, $0E, $16, $21, $2C, $42, $58

      .db $11 ; junk?

; Bonus Chance
NoteLengthTable_150bpm:
      .db $06, $06, $08, $08, $0C, $12, $10, $10, $18, $24, $30, $48, $60

      .db $02 ; junk?

NoteLengthTable_138bpm: ; rounded, 138.46 bpm
      .db $06, $07, $09, $08, $0D, $13, $11, $12, $1A, $27, $34, $4E, $68

      .db $14 ; junk?

; Underground
; Ending
NoteLengthTable_129bpm: ; rounded, 128.57
      .db $07, $07, $09, $0A, $0E, $15, $13, $12, $1C, $2A, $38, $54, $70

      .db $03, $04 ; junk?

NoteLengthTable_120bpm:
      .db $07, $08, $0A, $0A, $0F, $16, $14, $14, $1E, $2D, $3C, $5A, $78

      .db $17 ; junk?

NoteLengthTable_112bpm: ; rounded, 112.5 bpm
      .db $08, $08, $0B, $0A, $10, $18, $15, $16, $20, $30, $40, $60, $80

NoteLengthTable_106bpm: ; rounded, 105.88 bpm
      .db $08, $09, $0B, $0C, $11, $19, $15, $16, $22, $33, $44, $60, $88

      .db $1A ; junk?

NoteLengthTable_100bpm:
      .db $09, $09, $0C, $0C, $12, $1B, $18, $18, $24, $36, $48, $6C, $90


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
      .db MusicHeaderMushroomBonusChance - MusicPartPointers

MusicPartPointers_BossBeaten:
      .db MusicHeaderBossBeaten - MusicPartPointers

; This version of the crystal fanfare is unused, because special logic in
; ProcessMusicQueue uses this slot for the ending theme instead.
MusicPartPointers_CrystalUnused:
      .db MusicHeaderCrystal - MusicPartPointers

MusicPartPointers_Death:
      .db MusicHeaderDeath - MusicPartPointers

MusicPartPointers_GameOver:
      .db MusicHeaderGameOver - MusicPartPointers

MusicPartPointers_Crystal:
      .db MusicHeaderCrystal - MusicPartPointers

MusicPartPointers_BonusChance:
      .db MusicHeaderMushroomBonusChance - MusicPartPointers

; The rest of the pointers correspond to music that uses the pointer tables
; with support for segment-based looping.
MusicPartPointers_CharacterSelect:
      .db MusicHeaderCharacterSelect1 - MusicPartPointers
MusicPartPointers_CharacterSelectLoop:
      .db MusicHeaderCharacterSelect2 - MusicPartPointers
      .db MusicHeaderCharacterSelect3 - MusicPartPointers
      .db MusicHeaderCharacterSelect2 - MusicPartPointers
      .db MusicHeaderCharacterSelect4 - MusicPartPointers
      .db MusicHeaderCharacterSelect5 - MusicPartPointers
      .db MusicHeaderCharacterSelect6 - MusicPartPointers
      .db MusicHeaderCharacterSelect7 - MusicPartPointers
MusicPartPointers_CharacterSelectEnd:
      .db MusicHeaderCharacterSelect8 - MusicPartPointers

MusicPartPointers_Overworld:
      .db MusicHeaderOverworld1 - MusicPartPointers
MusicPartPointers_OverworldLoop:
      .db MusicHeaderOverworld2 - MusicPartPointers
      .db MusicHeaderOverworld3 - MusicPartPointers
      .db MusicHeaderOverworld4 - MusicPartPointers
      .db MusicHeaderOverworld3 - MusicPartPointers
      .db MusicHeaderOverworld5 - MusicPartPointers
MusicPartPointers_OverworldEnd:
      .db MusicHeaderOverworld6 - MusicPartPointers

MusicPartPointers_Boss:
MusicPartPointers_BossLoop:
MusicPartPointers_BossEnd:
      .db MusicHeaderBoss - MusicPartPointers

MusicPartPointers_Star:
MusicPartPointers_StarLoop:
MusicPartPointers_StarEnd:
      .db MusicHeaderStar - MusicPartPointers

MusicPartPointers_Wart:
MusicPartPointers_WartLoop:
MusicPartPointers_WartEnd:
      .db MusicHeaderWart - MusicPartPointers

MusicPartPointers_TitleScreen:
      .db MusicHeaderTitleScreen1 - MusicPartPointers
      .db MusicHeaderTitleScreen2 - MusicPartPointers
      .db MusicHeaderTitleScreen3 - MusicPartPointers
MusicPartPointers_TitleScreenEnd:
      .db MusicHeaderTitleScreen4 - MusicPartPointers

MusicPartPointers_SubSpace:
MusicPartPointers_SubSpaceLoop:
      .db MusicHeaderSubspace1 - MusicPartPointers
      .db MusicHeaderSubspace2 - MusicPartPointers
      .db MusicHeaderSubspace3 - MusicPartPointers
      .db MusicHeaderSubspace2 - MusicPartPointers
MusicPartPointers_SubSpaceEnd:
      .db MusicHeaderSubspace4 - MusicPartPointers

MusicPartPointers_Ending:
      .db MusicHeaderEnding1 - MusicPartPointers
      .db MusicHeaderEnding2 - MusicPartPointers
      .db MusicHeaderEnding3 - MusicPartPointers
      .db MusicHeaderEnding4 - MusicPartPointers
IFNDEF PROTOTYPE_MUSIC
      .db MusicHeaderEnding5 - MusicPartPointers
MusicPartPointers_EndingLoop:
MusicPartPointers_EndingEnd:
      .db MusicHeaderEnding6 - MusicPartPointers
ENDIF
IFDEF PROTOTYPE_MUSIC
MusicPartPointers_EndingEnd:
      .db MusicHeaderEnding5 - MusicPartPointers
ENDIF

IFNDEF PROTOTYPE_MUSIC
MusicPartPointers_Underground:
MusicPartPointers_UndergroundLoop:
MusicPartPointers_UndergroundEnd:
      .db MusicHeaderUnderground - MusicPartPointers
ENDIF

IFDEF PROTOTYPE_MUSIC
MusicPartPointers_Underground:
MusicPartPointers_UndergroundLoop:
      .db MusicHeaderUndergroundBeta1 - MusicPartPointers
      .db MusicHeaderUndergroundBeta1 - MusicPartPointers
      .db MusicHeaderUndergroundBeta2 - MusicPartPointers
MusicPartPointers_UndergroundEnd:
      .db MusicHeaderUndergroundBeta2 - MusicPartPointers
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
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $AD, $98
      .dw MusicDataCharacterSelect1
      .db MusicDataCharacterSelect1_Triangle - MusicDataCharacterSelect1 ; $6B
      .db MusicDataCharacterSelect1_Square1 - MusicDataCharacterSelect1 ; $36
      .db MusicDataCharacterSelect1_Noise - MusicDataCharacterSelect1 ; $A0

MusicHeaderCharacterSelect2:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $5C, $99
      .dw MusicDataCharacterSelect2
      .db MusicDataCharacterSelect2_Triangle - MusicDataCharacterSelect2 ; $8E
      .db MusicDataCharacterSelect2_Square1 - MusicDataCharacterSelect2 ; $48
      .db MusicDataCharacterSelect2_Noise - MusicDataCharacterSelect2 ; $B0

MusicHeaderCharacterSelect3:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $9A, $99
      .dw MusicDataCharacterSelect3
      .db MusicDataCharacterSelect3_Triangle - MusicDataCharacterSelect3 ; $6F
      .db MusicDataCharacterSelect3_Square1 - MusicDataCharacterSelect3 ; $48
      .db MusicDataCharacterSelect3_Noise - MusicDataCharacterSelect3 ; $76

MusicHeaderCharacterSelect4:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $9E, $99
      .dw MusicDataCharacterSelect4
      .db MusicDataCharacterSelect4_Triangle - MusicDataCharacterSelect4 ; $6B
      .db MusicDataCharacterSelect4_Square1 - MusicDataCharacterSelect4 ; $47
      .db MusicDataCharacterSelect4_Noise - MusicDataCharacterSelect4 ; $72

MusicHeaderCharacterSelect5:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $26, $9A
      .dw MusicDataCharacterSelect5
      .db MusicDataCharacterSelect5_Triangle - MusicDataCharacterSelect5 ; $8A
      .db MusicDataCharacterSelect5_Square1 - MusicDataCharacterSelect5 ; $46
      .db MusicDataCharacterSelect5_Noise - MusicDataCharacterSelect5 ; $AC

MusicHeaderOverworld1:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $D4, $9B
      .dw MusicDataOverworld1
      .db MusicDataOverworld1_Triangle - MusicDataOverworld1 ; $2B
      .db MusicDataOverworld1_Square1 - MusicDataOverworld1 ; $16
      .db MusicDataOverworld1_Noise - MusicDataOverworld1 ; $3D

MusicHeaderOverworld2:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $20, $9C
      .dw MusicDataOverworld2
      .db MusicDataOverworld2_Triangle - MusicDataOverworld2 ; $A8
      .db MusicDataOverworld2_Square1 - MusicDataOverworld2 ; $54
      .db MusicDataOverworld2_Noise - MusicDataOverworld2 ; $C9

MusicHeaderOverworld3:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $F9, $9C
      .dw MusicDataOverworld3
      .db MusicDataOverworld3_Triangle - MusicDataOverworld3 ; $DD
      .db MusicDataOverworld3_Square1 - MusicDataOverworld3 ; $73
      .db MusicDataOverworld3_Noise - MusicDataOverworld3 ; $6C

MusicHeaderOverworld4:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $3F, $9D
      .dw MusicDataOverworld4
      .db MusicDataOverworld4_Triangle - MusicDataOverworld4 ; $B2
      .db MusicDataOverworld4_Square1 - MusicDataOverworld4 ; $73
      .db MusicDataOverworld4_Noise - MusicDataOverworld4 ; $26

MusicHeaderOverworld5:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $00, $9E
      .dw MusicDataOverworld5
      .db MusicDataOverworld5_Triangle - MusicDataOverworld5 ; $38
      .db MusicDataOverworld5_Square1 - MusicDataOverworld5 ; $1D
      .db MusicDataOverworld5_Noise - MusicDataOverworld5 ; $46

MusicHeaderOverworld6:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $4D, $9E
      .dw MusicDataOverworld6
      .db MusicDataOverworld6_Triangle - MusicDataOverworld6 ; $A7
      .db MusicDataOverworld6_Square1 - MusicDataOverworld6 ; $4F
      .db MusicDataOverworld6_Noise - MusicDataOverworld6 ; $C8

IFNDEF PROTOTYPE_MUSIC
MusicHeaderUnderground:
      .db NoteLengthTable_129bpm - NoteLengthTable
      ; .db $BD, $94
      .dw MusicDataUnderground
      .db MusicDataUnderground_Triangle - MusicDataUnderground ; $53
      .db MusicDataUnderground_Square1 - MusicDataUnderground ; $2A
      .db MusicDataUnderground_DPCM - MusicDataUnderground ; $84
ENDIF

IFDEF PROTOTYPE_MUSIC
MusicHeaderUndergroundBeta1:
      .db NoteLengthTable_200bpm - NoteLengthTable
      .dw MusicDataUndergroundBeta1
      .db MusicDataUndergroundBeta1_Triangle - MusicDataUndergroundBeta1
      .db MusicDataUndergroundBeta1_Square1 - MusicDataUndergroundBeta1
      .db MusicDataUndergroundBeta1_Noise - MusicDataUndergroundBeta1
      .db MusicDataUndergroundBeta1_DPCM - MusicDataUndergroundBeta1
MusicHeaderUndergroundBeta2:
      .db NoteLengthTable_200bpm - NoteLengthTable
      .dw MusicDataUndergroundBeta2
      .db MusicDataUndergroundBeta2_Triangle - MusicDataUndergroundBeta2
      .db MusicDataUndergroundBeta2_Square1 - MusicDataUndergroundBeta2
      .db MusicDataUndergroundBeta2_Noise - MusicDataUndergroundBeta2
      .db MusicDataUndergroundBeta2_DPCM - MusicDataUndergroundBeta2
ENDIF

MusicHeaderBoss:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $1C, $9F
      .dw MusicDataBoss
      .db MusicDataBoss_Triangle - MusicDataBoss ; $83
      .db MusicDataBoss_Square1 - MusicDataBoss ; $42
IFNDEF PROTOTYPE_MUSIC
      .db $00 ; no noise channel
ENDIF

MusicHeaderStar:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $69, $94
      .dw MusicDataStar
      .db MusicDataStar_Triangle - MusicDataStar ; $37
      .db MusicDataStar_Square1 - MusicDataStar ; $1A
IFNDEF PROTOTYPE_MUSIC
      .db MusicDataStar_DPCM - MusicDataStar ; $49
ENDIF
IFDEF PROTOTYPE_MUSIC
      .db MusicDataStar_Noise - MusicDataStar
ENDIF

MusicHeaderWart:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $C7, $9F
      .dw MusicDataWart
      .db MusicDataWart_Triangle - MusicDataWart ; $96
      .db MusicDataWart_Square1 - MusicDataWart ; $4B
IFNDEF PROTOTYPE_MUSIC
      .db $00 ; no noise channel
ENDIF

MusicHeaderCrystal:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $48, $A1
      .dw MusicDataCrystal
      .db MusicDataCrystal_Triangle - MusicDataCrystal ; $1B
      .db MusicDataCrystal_Square1 - MusicDataCrystal ; $0D
      ; no noise channel, using $00 from below

MusicHeaderGameOver:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $CE, $A0
      .dw MusicDataGameOver
      .db MusicDataGameOver_Triangle - MusicDataGameOver ; $1B
      .db MusicDataGameOver_Square1 - MusicDataGameOver ; $0E
      ; no noise channel, using $00 from below

MusicHeaderBossBeaten:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $F2, $A0
      .dw MusicDataBossBeaten
      .db MusicDataBossBeaten_Triangle - MusicDataBossBeaten ; $41
      .db MusicDataBossBeaten_Square1 - MusicDataBossBeaten ; $27
      ; no noise channel, using $00 from below

MusicHeaderCharacterSelect8:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $93, $9B
      .dw MusicDataCharacterSelect8
      .db MusicDataCharacterSelect8_Triangle - MusicDataCharacterSelect8 ; $2F
      .db MusicDataCharacterSelect8_Square1 - MusicDataCharacterSelect8 ; $21
      .db MusicDataCharacterSelect8_Noise - MusicDataCharacterSelect8 ; $38

MusicHeaderMushroomBonusChance:
      .db NoteLengthTable_150bpm - NoteLengthTable
      ; .db $BB, $A0
      .dw MusicDataMushroomBonusChance
      .db $00 ; no triangle channel
      .db MusicDataMushroomBonusChance_Square1 - MusicDataMushroomBonusChance ; $0A
      ; no noise channel, using $00 from below

MusicHeaderCharacterSelect7:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $DF, $9A
      .dw MusicDataCharacterSelect7
      .db MusicDataCharacterSelect7_Triangle - MusicDataCharacterSelect7 ; $97
      .db MusicDataCharacterSelect7_Square1 - MusicDataCharacterSelect7 ; $61
      .db MusicDataCharacterSelect7_Noise - MusicDataCharacterSelect7 ; $B0

MusicHeaderDeath:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $6F, $A1
      .dw MusicDataDeath
      .db MusicDataDeath_Triangle - MusicDataDeath ; $17
      .db MusicDataDeath_Square1 - MusicDataDeath ; $0C
      ; no noise channel, using $00 from below

MusicHeaderCharacterSelect6:
      .db NoteLengthTable_300bpm - NoteLengthTable
      ; .db $5D, $9A
      .dw MusicDataCharacterSelect6
      .db MusicDataCharacterSelect6_Triangle - MusicDataCharacterSelect6 ; $6C
      .db MusicDataCharacterSelect6_Square1 - MusicDataCharacterSelect6 ; $45
      .db MusicDataCharacterSelect6_Noise - MusicDataCharacterSelect6 ; $79

MusicHeaderTitleScreen2:
      .db NoteLengthTable_225bpm - NoteLengthTable
      ; .db $A7, $96
      .dw MusicDataTitleScreen2
      .db MusicDataTitleScreen2_Triangle - MusicDataTitleScreen2 ; $BC
      .db MusicDataTitleScreen2_Square1 - MusicDataTitleScreen2 ; $64
      .db MusicDataTitleScreen2_Noise - MusicDataTitleScreen2 ; $59

MusicHeaderTitleScreen1:
      .db NoteLengthTable_225bpm - NoteLengthTable
      ; .db $3E, $96
      .dw MusicDataTitleScreen1
      .db MusicDataTitleScreen1_Triangle - MusicDataTitleScreen1 ; $43
      .db MusicDataTitleScreen1_Square1 - MusicDataTitleScreen1 ; $22
      .db MusicDataTitleScreen1_Noise - MusicDataTitleScreen1 ; $57

MusicHeaderTitleScreen3:
      .db NoteLengthTable_225bpm - NoteLengthTable
      ; .db $94, $97
      .dw MusicDataTitleScreen3
      .db MusicDataTitleScreen3_Triangle - MusicDataTitleScreen3 ; $8D
      .db MusicDataTitleScreen3_Square1 - MusicDataTitleScreen3 ; $47
      .db MusicDataTitleScreen3_Noise - MusicDataTitleScreen3 ; $BA

MusicHeaderTitleScreen4:
      .db NoteLengthTable_225bpm - NoteLengthTable
      ; .db $78, $98
      .dw MusicDataTitleScreen4
      .db MusicDataTitleScreen4_Triangle - MusicDataTitleScreen4 ; $24
      .db MusicDataTitleScreen4_Square1 - MusicDataTitleScreen4 ; $12
      .db MusicDataTitleScreen4_Noise - MusicDataTitleScreen4 ; $29

MusicHeaderSubspace1:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $50, $95
      .dw MusicDataSubspace1
      .db MusicDataSubspace1_Triangle - MusicDataSubspace1 ; $38
      .db MusicDataSubspace1_Square1 - MusicDataSubspace1 ; $1C
      .db MusicDataSubspace1_Noise - MusicDataSubspace1 ; $83

MusicHeaderSubspace2:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $A3, $95
      .dw MusicDataSubspace2
      .db MusicDataSubspace2_Triangle - MusicDataSubspace2 ; $24
      .db MusicDataSubspace2_Square1 - MusicDataSubspace2 ; $12
      .db MusicDataSubspace2_Noise - MusicDataSubspace2 ; $30

MusicHeaderSubspace3:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $E0, $95
      .dw MusicDataSubspace3
      .db MusicDataSubspace3_Triangle - MusicDataSubspace3 ; $22
      .db MusicDataSubspace3_Square1 - MusicDataSubspace3 ; $10
      .db MusicDataSubspace3_Noise - MusicDataSubspace3 ; $51

MusicHeaderSubspace4:
      .db NoteLengthTable_200bpm - NoteLengthTable
      ; .db $0F, $96
      .dw MusicDataSubspace4
      .db MusicDataSubspace4_Triangle - MusicDataSubspace4 ; $17
      .db MusicDataSubspace4_Square1 - MusicDataSubspace4 ; $0A
      .db MusicDataSubspace4_Noise - MusicDataSubspace4 ; $22

MusicHeaderEnding1:
      .db NoteLengthTable_129bpm - NoteLengthTable
      ; .db $1E, $91
      .dw MusicDataEnding1
      .db MusicDataEnding1_Triangle - MusicDataEnding1 ; $3D
      .db MusicDataEnding1_Square1 - MusicDataEnding1; $1F
      .db MusicDataEnding1_Noise - MusicDataEnding1 ; $6D

MusicHeaderEnding3:
      .db NoteLengthTable_129bpm - NoteLengthTable
      ; .db $9C, $91
      .dw MusicDataEnding3
      .db MusicDataEnding3_Triangle - MusicDataEnding3 ; $41
      .db MusicDataEnding3_Square1 - MusicDataEnding3 ; $21
      .db MusicDataEnding3_Noise - MusicDataEnding3 ; $8C

MusicHeaderEnding2:
      .db NoteLengthTable_129bpm - NoteLengthTable
      ; .db $80, $92
      .dw MusicDataEnding2
      .db MusicDataEnding2_Triangle - MusicDataEnding2 ; $2A
      .db MusicDataEnding2_Square1 - MusicDataEnding2 ; $5A
      .db MusicDataEnding2_Noise - MusicDataEnding2 ; $19

MusicHeaderEnding5:
      .db NoteLengthTable_129bpm - NoteLengthTable
      ; .db $F2, $92
      .dw MusicDataEnding5
      .db MusicDataEnding5_Triangle - MusicDataEnding5 ; $4C
      .db MusicDataEnding5_Square1 - MusicDataEnding5 ; $14
      .db MusicDataEnding5_Noise - MusicDataEnding5 ; $68

MusicHeaderEnding4:
      .db NoteLengthTable_129bpm - NoteLengthTable
      ; .db $0D, $92
      .dw MusicDataEnding4
      .db MusicDataEnding4_Triangle - MusicDataEnding4 ; $43
      .db MusicDataEnding4_Square1 - MusicDataEnding4 ; $29
      .db MusicDataEnding4_Noise - MusicDataEnding4 ; $1B

IFNDEF PROTOTYPE_MUSIC
MusicHeaderEnding6:
      .db NoteLengthTable_129bpm - NoteLengthTable
      ; .db $76, $93
      .dw MusicDataEnding6
      .db $00 ; no triangle channel
      .db MusicDataEnding6_Square1 - MusicDataEnding6 ; $72
      .db $00 ; no square channel
ENDIF


MusicPointersFirstPart:
      .db MusicPartPointers_Overworld - MusicPartPointers
      .db MusicPartPointers_CharacterSelect - MusicPartPointers
      .db MusicPartPointers_Underground - MusicPartPointers
      .db MusicPartPointers_Boss - MusicPartPointers
      .db MusicPartPointers_Star - MusicPartPointers
      .db MusicPartPointers_SubSpace - MusicPartPointers
      .db MusicPartPointers_Wart - MusicPartPointers
      .db MusicPartPointers_TitleScreen - MusicPartPointers
      .db MusicPartPointers_Ending - MusicPartPointers

MusicPointersEndPart:
      .db MusicPartPointers_OverworldEnd - MusicPartPointers
      .db MusicPartPointers_CharacterSelectEnd - MusicPartPointers
      .db MusicPartPointers_UndergroundEnd - MusicPartPointers
      .db MusicPartPointers_BossEnd - MusicPartPointers
      .db MusicPartPointers_StarEnd - MusicPartPointers
      .db MusicPartPointers_SubSpaceEnd - MusicPartPointers
      .db MusicPartPointers_WartEnd - MusicPartPointers
      .db MusicPartPointers_TitleScreenEnd - MusicPartPointers
      .db MusicPartPointers_EndingEnd - MusicPartPointers

MusicPointersLoopPart:
      .db MusicPartPointers_OverworldLoop - MusicPartPointers
      .db MusicPartPointers_CharacterSelectLoop - MusicPartPointers
      .db MusicPartPointers_UndergroundLoop - MusicPartPointers
      .db MusicPartPointers_BossLoop - MusicPartPointers
      .db MusicPartPointers_StarLoop - MusicPartPointers
      .db MusicPartPointers_SubSpaceLoop - MusicPartPointers
      .db MusicPartPointers_WartEnd - MusicPartPointers
      .db $00 ; no loop
IFNDEF PROTOTYPE_MUSIC
      .db MusicPartPointers_EndingLoop - MusicPartPointers
ENDIF
IFDEF PROTOTYPE_MUSIC
      .db $00 ; no loop
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
      .db $8A
      .db $50
      .db $84
      .db $7E
      .db $52
      .db $50
      .db $48
      .db $82
      .db $4C
      .db $7E
      .db $83
      .db $50
      .db $8A
      .db $52
      .db $88
      .db $4C
      .db $8A
      .db $56
      .db $82
      .db $7E
      .db $7E
      .db $52
      .db $52
      .db $83
      .db $50
      .db $4C
      .db $8B
      .db $50
      .db $88
      .db $4C
      .db $00
MusicDataEnding1_Square1:
      .db $8A
      .db $3E
      .db $84
      .db $7E
      .db $42
      .db $3E
      .db $38
      .db $82
      .db $3A
      .db $7E
      .db $83
      .db $3E
      .db $8A
      .db $44
      .db $88
      .db $3A
      .db $8A
      .db $44
      .db $82
      .db $7E
      .db $7E
      .db $44
      .db $44
      .db $83
      .db $3E
      .db $3A
      .db $8B
      .db $3E
      .db $88
      .db $3A
MusicDataEnding1_Triangle:
      .db $88
      .db $30
      .db $82
      .db $30
      .db $30
      .db $83
      .db $30
      .db $84
      .db $30
      .db $30
      .db $30
      .db $30
      .db $88
      .db $30
      .db $82
      .db $30
      .db $30
      .db $83
      .db $30
      .db $84
      .db $30
      .db $30
      .db $30
      .db $30
      .db $88
      .db $30
      .db $82
      .db $30
      .db $30
      .db $83
      .db $30
      .db $84
      .db $30
      .db $30
      .db $30
      .db $30
      .db $88
      .db $30
      .db $82
      .db $30
      .db $30
      .db $83
      .db $30
      .db $84
      .db $30
      .db $30
      .db $2E
      .db $2E
MusicDataEnding1_Noise:
      .db $88
      .db $10
      .db $82
      .db $10
      .db $82
      .db $10
      .db $83
      .db $10
      .db $84
      .db $10
      .db $84
      .db $10
      .db $84
      .db $10
      .db $84
      .db $10
      .db $00

MusicDataEnding3:
MusicDataEnding3_Square2:
      .db $8A
      .db $50
      .db $84
      .db $7E
      .db $52
      .db $50
      .db $48
      .db $82
      .db $4C
      .db $7E
      .db $83
      .db $4C
      .db $8A
      .db $56
      .db $88
      .db $3E
      .db $8A
      .db $4C
      .db $84
      .db $7E
      .db $4E
      .db $4C
      .db $44
      .db $82
      .db $48
      .db $7E
      .db $83
      .db $48
      .db $8A
      .db $52
      .db $88
      .db $3A
      .db $00
MusicDataEnding3_Square1:
      .db $8A
      .db $48
      .db $84
      .db $7E
      .db $48
      .db $48
      .db $3E
      .db $82
      .db $46
      .db $7E
      .db $83
      .db $46
      .db $8A
      .db $4C
      .db $88
      .db $34
      .db $8A
      .db $44
      .db $84
      .db $7E
      .db $44
      .db $44
      .db $3A
      .db $82
      .db $42
      .db $7E
      .db $83
      .db $42
      .db $8A
      .db $48
      .db $88
      .db $30
MusicDataEnding3_Triangle:
      .db $88
      .db $30
      .db $82
      .db $30
      .db $30
      .db $83
      .db $30
      .db $84
      .db $30
      .db $30
      .db $30
      .db $30
      .db $88
      .db $2E
      .db $82
      .db $2E
      .db $2E
      .db $83
      .db $2E
      .db $84
      .db $2E
      .db $2E
      .db $2E
      .db $2E
      .db $88
      .db $2C
      .db $82
      .db $2C
      .db $2C
      .db $83
      .db $2C
      .db $84
      .db $2C
      .db $2C
      .db $2C
      .db $2C
      .db $88
      .db $2A
      .db $82
      .db $2A
      .db $2A
      .db $83
      .db $2A
      .db $84
      .db $2A
      .db $2A
      .db $2A
      .db $2A

MusicDataEnding4:
MusicDataEnding4_Square2:
      .db $8A
      .db $48
      .db $84
      .db $7E
      .db $48
      .db $4C
      .db $52
      .db $8A
      .db $50
      .db $88
      .db $48
      .db $3E
      .db $8A
      .db $42
      .db $84
      .db $7E
      .db $42
      .db $46
      .db $48
      .db $8A
      .db $42
      .db $84
      .db $7E
      .db $42
      .db $46
      .db $50
      .db $00
MusicDataEnding3_Noise:
MusicDataEnding4_Noise:
      .db $88
      .db $10
      .db $82
      .db $10
      .db $10
      .db $83
      .db $10
      .db $84
      .db $10
      .db $84
      .db $10
      .db $10
      .db $10
      .db $00
MusicDataEnding4_Square1:
      .db $8A
      .db $40
      .db $84
      .db $7E
      .db $40
      .db $40
      .db $48
      .db $8A
      .db $48
      .db $88
      .db $3E
      .db $38
      .db $8A
      .db $3A
      .db $84
      .db $7E
      .db $3A
      .db $3A
      .db $42
      .db $8A
      .db $3A
      .db $84
      .db $7E
      .db $3A
      .db $3A
      .db $3A
MusicDataEnding4_Triangle:
      .db $88
      .db $28
      .db $82
      .db $28
      .db $28
      .db $83
      .db $28
      .db $84
      .db $28
      .db $28
      .db $28
      .db $28
      .db $88
      .db $26
      .db $82
      .db $26
      .db $26
      .db $83
      .db $26
      .db $84
      .db $26
      .db $26
      .db $26
      .db $26
      .db $88
      .db $34
      .db $82
      .db $34
      .db $34
      .db $83
      .db $34
      .db $84
      .db $34
      .db $34
      .db $34
      .db $34
      .db $88
      .db $26
      .db $82
      .db $26
      .db $26
      .db $83
      .db $26
      .db $84
      .db $26
      .db $26
      .db $26
      .db $26

MusicDataEnding2:
MusicDataEnding2_Square2:
      .db $8A
      .db $48
      .db $84
      .db $7E
      .db $46
      .db $48
      .db $4C
      .db $8A
      .db $48
      .db $84
      .db $7E
      .db $46
      .db $48
      .db $4C
      .db $8A
      .db $48
      .db $84
      .db $7E
      .db $42
      .db $48
      .db $4C
      .db $8A
      .db $56
      .db $7E
      .db $00
MusicDataEnding2_Noise:
      .db $88
      .db $10
      .db $82
      .db $10
      .db $82
      .db $10
      .db $83
      .db $10
      .db $84
      .db $10
      .db $84
      .db $10
      .db $84
      .db $10
      .db $84
      .db $10
      .db $00
MusicDataEnding2_Triangle:
      .db $88
      .db $2A
      .db $82
      .db $2A
      .db $2A
      .db $83
      .db $2A
      .db $84
      .db $28
      .db $28
      .db $28
      .db $28
      .db $88
      .db $26
      .db $82
      .db $26
      .db $26
      .db $83
      .db $26
      .db $84
      .db $24
      .db $24
      .db $24
      .db $24
      .db $88
      .db $22
      .db $82
      .db $22
      .db $22
      .db $83
      .db $22
      .db $84
      .db $22
      .db $22
      .db $22
      .db $22
      .db $88
      .db $26
      .db $82
      .db $26
      .db $26
      .db $83
      .db $26
      .db $84
      .db $26
      .db $26
      .db $26
      .db $26
MusicDataEnding2_Square1:
      .db $8A
      .db $38
      .db $84
      .db $7E
      .db $3A
      .db $3A
      .db $3A
      .db $8A
      .db $38
      .db $84
      .db $7E
      .db $36
      .db $36
      .db $36
      .db $8A
      .db $34
      .db $84
      .db $7E
      .db $30
      .db $3A
      .db $3A
      .db $8A
      .db $48
      .db $46

MusicDataEnding5:
MusicDataEnding5_Square2:
      .db $8A
      .db $48
      .db $48
      .db $88
      .db $48
      .db $84
      .db $26
      .db $26
      .db $26
      .db $8A
      .db $26
IFNDEF PROTOTYPE_MUSIC
      .db $7E
      .db $8C
      .db $7E
      .db $88
      .db $7E
      .db $FC
      .db $7E
      .db $7E
ENDIF
      .db $00
MusicDataEnding5_Square1:
      .db $88
      .db $40
      .db $82
      .db $40
      .db $40
      .db $83
      .db $40
      .db $88
      .db $3A
      .db $82
      .db $3A
      .db $3A
      .db $83
      .db $3A
      .db $88
      .db $38
      .db $84
      .db $18
      .db $18
      .db $18
IFNDEF PROTOTYPE_MUSIC
      .db $88
      .db $18
      .db $F4
      .db $48
      .db $56
      .db $50
      .db $56
      .db $46
      .db $56
      .db $4C
      .db $56
      .db $42
      .db $56
      .db $50
      .db $56
      .db $46
      .db $56
      .db $4C
      .db $56
      .db $F4
      .db $48
      .db $56
      .db $50
      .db $56
      .db $46
      .db $56
      .db $4C
      .db $56
      .db $42
      .db $56
      .db $50
      .db $56
      .db $46
      .db $56
      .db $4C
      .db $56
ENDIF
IFDEF PROTOTYPE_MUSIC
      .db $8A
      .db $18
ENDIF
MusicDataEnding5_Triangle:
      .db $88
      .db $28
      .db $82
      .db $28
      .db $28
      .db $83
      .db $28
      .db $88
      .db $2C
      .db $82
      .db $2C
      .db $2C
      .db $83
      .db $2C
      .db $88
      .db $30
      .db $84
      .db $30
      .db $30
      .db $30
      .db $8A
      .db $30
IFNDEF PROTOTYPE_MUSIC
      .db $7E
      .db $8C
      .db $7E
      .db $7E
      .db $7E
      .db $7E
ENDIF
MusicDataEnding5_Noise:
      .db $88
      .db $10
      .db $82
      .db $10
      .db $10
      .db $83
      .db $10
      .db $88
      .db $10
      .db $82
      .db $10
      .db $10
      .db $83
      .db $10
      .db $88
      .db $10
      .db $84
      .db $10
      .db $10
      .db $10
      .db $8A
      .db $10
IFNDEF PROTOTYPE_MUSIC
      .db $01
      .db $8C
      .db $01
      .db $01
      .db $01
      .db $01
ENDIF

IFNDEF PROTOTYPE_MUSIC
MusicDataEnding6:
MusicDataEnding6_Square2:
      .db $F4
      .db $68
      .db $6A
      .db $6E
      .db $64
      .db $7E
      .db $64
      .db $7E
      .db $64
      .db $60
      .db $64
      .db $68
      .db $5E
      .db $7E
      .db $5E
      .db $7E
      .db $56
      .db $5A
      .db $5E
      .db $60
      .db $56
      .db $7E
      .db $56
      .db $54
      .db $56
      .db $5A
      .db $5E
      .db $60
      .db $5E
      .db $7E
      .db $60
      .db $64
      .db $7E
      .db $68
      .db $6A
      .db $6E
      .db $64
      .db $7E
      .db $64
      .db $6E
      .db $76
      .db $78
      .db $7C
      .db $78
      .db $76
      .db $7E
      .db $72
      .db $6E
      .db $6A
      .db $68
      .db $6A
      .db $6E
      .db $64
      .db $7E
      .db $64
      .db $60
      .db $5E
      .db $60
      .db $7E
      .db $FB
      .db $7E
      .db $F4
      .db $60
      .db $64
      .db $60
      .db $64
      .db $7E
      .db $66
      .db $6A
      .db $6E
      .db $FC
      .db $7E
      .db $F4
      .db $60
      .db $64
      .db $60
      .db $64
      .db $7E
      .db $66
      .db $7E
      .db $6A
      .db $6E
      .db $7E
      .db $FB
      .db $7E
      .db $F4
      .db $60
      .db $64
      .db $60
      .db $64
      .db $7E
      .db $66
      .db $6A
      .db $6E
      .db $7E
      .db $68
      .db $60
      .db $56
      .db $FA
      .db $7E
      .db $F4
      .db $60
      .db $64
      .db $60
      .db $64
      .db $7E
      .db $5A
      .db $5E
      .db $60
      .db $64
      .db $7E
      .db $8B
      .db $7E
      .db $00
MusicDataEnding6_Square1:
      .db $F4
      .db $48
      .db $56
      .db $50
      .db $56
      .db $46
      .db $56
      .db $4C
      .db $56
      .db $42
      .db $56
      .db $50
      .db $56
      .db $3E
      .db $56
      .db $4C
      .db $56
      .db $3A
      .db $52
      .db $48
      .db $52
      .db $38
      .db $50
      .db $46
      .db $50
      .db $34
      .db $4C
      .db $42
      .db $4C
      .db $3E
      .db $52
      .db $46
      .db $52
      .db $48
      .db $56
      .db $50
      .db $56
      .db $46
      .db $56
      .db $4C
      .db $56
      .db $44
      .db $52
      .db $4C
      .db $52
      .db $42
      .db $52
      .db $48
      .db $52
      .db $3E
      .db $50
      .db $48
      .db $50
      .db $3E
      .db $4C
      .db $46
      .db $4C
      .db $48
      .db $56
      .db $50
      .db $56
      .db $48
      .db $56
      .db $50
      .db $56
      .db $40
      .db $4E
      .db $48
      .db $4E
      .db $40
      .db $4E
      .db $48
      .db $4E
      .db $3E
      .db $50
      .db $48
      .db $50
      .db $3E
      .db $50
      .db $48
      .db $50
      .db $40
      .db $4E
      .db $48
      .db $4E
      .db $40
      .db $4E
      .db $48
      .db $4E
      .db $3E
      .db $50
      .db $48
      .db $50
      .db $3E
      .db $50
      .db $48
      .db $50
      .db $40
      .db $4E
      .db $48
      .db $4E
      .db $40
      .db $4E
      .db $48
      .db $4E
      .db $3E
      .db $50
      .db $48
      .db $50
      .db $3E
      .db $50
      .db $48
      .db $50
      .db $3C
      .db $4C
      .db $48
      .db $4C
      .db $3C
      .db $4C
      .db $48
      .db $4C
      .db $3E
      .db $4C
      .db $46
      .db $4C
      .db $3E
      .db $52
      .db $4C
      .db $5E
ENDIF

MusicDataStar:
MusicDataStar_Square2:
      .db $98
      .db $48
      .db $48
      .db $48
      .db $94
      .db $7E
      .db $48
      .db $7E
      .db $99
      .db $48
      .db $98
      .db $48
      .db $48
      .db $46
      .db $46
      .db $46
      .db $94
      .db $7E
      .db $46
      .db $7E
      .db $99
      .db $46
      .db $98
      .db $46
      .db $46
      .db $00
MusicDataStar_Square1:
      .db $98
      .db $3A
      .db $3A
      .db $3A
      .db $94
      .db $34
      .db $98
      .db $3A
      .db $3A
      .db $94
      .db $34
      .db $3A
      .db $34
      .db $98
      .db $3A
      .db $38
      .db $38
      .db $38
      .db $94
      .db $30
      .db $98
      .db $38
      .db $38
      .db $94
      .db $30
      .db $38
      .db $30
      .db $98
      .db $38
MusicDataStar_Triangle:
      .db $9A
      .db $34
      .db $99
      .db $42
      .db $4C
      .db $98
      .db $7E
      .db $42
      .db $4C
      .db $9A
      .db $30
      .db $99
      .db $3E
      .db $48
      .db $98
      .db $7E
      .db $3E
      .db $48
IFNDEF PROTOTYPE_MUSIC
MusicDataStar_DPCM:
      .db $94
      .db $01
      .db $98
      .db $10
      .db $94
      .db $10
      .db $10
      .db $10
      .db $01
      .db $01
      .db $00
ENDIF
IFDEF PROTOTYPE_MUSIC
MusicDataStar_Noise:
      .db $98
      .db $04
      .db $92
      .db $02
      .db $01
      .db $02
      .db $98
      .db $06
      .db $92
      .db $02
      .db $01
      .db $02
      .db $00
ENDIF

IFNDEF PROTOTYPE_MUSIC
MusicDataUnderground:
MusicDataUnderground_Square2:
      .db $A4
      .db $0A
      .db $18
      .db $22
      .db $84
      .db $40
      .db $7E
      .db $89
      .db $42
      .db $A4
      .db $0A
      .db $18
      .db $22
      .db $84
      .db $40
      .db $7E
      .db $89
      .db $3E
      .db $B8
      .db $7E
      .db $B9
      .db $48
      .db $44
      .db $B8
      .db $3A
      .db $B9
      .db $40
      .db $B8
      .db $44
      .db $B4
      .db $36
      .db $B8
      .db $3A
      .db $B9
      .db $30
      .db $B9
      .db $34
      .db $BB
      .db $36
      .db $B8
      .db $7E
      .db $00
MusicDataUnderground_Square1:
      .db $B4
      .db $0A
      .db $18
      .db $22
      .db $84
      .db $36
      .db $7E
      .db $89
      .db $38
      .db $B4
      .db $0A
      .db $18
      .db $22
      .db $84
      .db $36
      .db $7E
      .db $89
      .db $34
      .db $B8
      .db $7E
      .db $B9
      .db $3A
      .db $36
      .db $B8
      .db $30
      .db $B9
      .db $36
      .db $B8
      .db $3A
      .db $B4
      .db $2C
      .db $B8
      .db $30
      .db $B9
      .db $22
      .db $B9
      .db $26
      .db $BB
      .db $28
      .db $B8
      .db $7E
MusicDataUnderground_Triangle:
      .db $84
      .db $22
      .db $30
      .db $3A
      .db $42
      .db $7E
      .db $44
      .db $3A
      .db $30
      .db $22
      .db $30
      .db $3A
      .db $42
      .db $7E
      .db $40
      .db $3A
      .db $30
      .db $22
      .db $30
      .db $3A
      .db $30
      .db $7E
      .db $40
      .db $3A
      .db $30
      .db $22
      .db $30
      .db $3A
      .db $30
      .db $7E
      .db $40
      .db $3A
      .db $30
      .db $22
      .db $30
      .db $3A
      .db $30
      .db $7E
      .db $40
      .db $3A
      .db $30
      .db $22
      .db $30
      .db $3A
      .db $30
      .db $7E
      .db $40
      .db $3A
      .db $30
MusicDataUnderground_DPCM:
      .db $85
      .db $01
      .db $8D
      .db $10
      .db $8E
      .db $10
      .db $84
      .db $10
      .db $88
      .db $10
      .db $84
      .db $01
      .db $01
      .db $01
      .db $00
ENDIF

IFDEF PROTOTYPE_MUSIC
MusicDataUndergroundBeta1:
MusicDataUndergroundBeta2:
MusicDataUndergroundBeta1_Square2:
MusicDataUndergroundBeta2_Square2:
      .db $DC
      .db $7E
      .db $7E
      .db $7E
      .db $7E
      .db $D4
      .db $18
      .db $30
      .db $12
      .db $2A
      .db $14
      .db $2C
      .db $D8
      .db $7E
      .db $DC
      .db $7E
      .db $D4
      .db $18
      .db $30
      .db $12
      .db $2A
      .db $14
      .db $2C
      .db $D8
      .db $7E
      .db $DC
      .db $7E
      .db $D4
      .db $0A
      .db $22
      .db $04
      .db $1C
      .db $06
      .db $1E
      .db $D8
      .db $7E
      .db $DC
      .db $7E
      .db $D4
      .db $0A
      .db $22
      .db $04
      .db $1C
      .db $06
      .db $1E
      .db $DC
      .db $7E
      .db $D2
      .db $1E
      .db $1C
      .db $1A
      .db $D8
      .db $18
      .db $1E
      .db $1C
      .db $10
      .db $0E
      .db $1A
      .db $D2
      .db $18
      .db $24
      .db $22
      .db $20
      .db $2C
      .db $2A
      .db $D6
      .db $28
      .db $1E
      .db $16
      .db $14
      .db $12
      .db $10
      .db $DC
      .db $7E
      .db $00
MusicDataUndergroundBeta1_Square1:
MusicDataUndergroundBeta2_Square1:
MusicDataUndergroundBeta1_Triangle:
MusicDataUndergroundBeta2_Triangle:
      .db $8C
      .db $7E
      .db $7E
      .db $7E
      .db $7E
      .db $84
      .db $30
      .db $48
      .db $2A
      .db $42
      .db $2C
      .db $44
      .db $88
      .db $7E
      .db $8C
      .db $7E
      .db $84
      .db $30
      .db $48
      .db $2A
      .db $42
      .db $2C
      .db $44
      .db $88
      .db $7E
      .db $8C
      .db $7E
      .db $84
      .db $22
      .db $3A
      .db $1C
      .db $34
      .db $1E
      .db $36
      .db $88
      .db $7E
      .db $8C
      .db $7E
      .db $84
      .db $22
      .db $3A
      .db $1C
      .db $34
      .db $1E
      .db $36
      .db $8C
      .db $7E
      .db $82
      .db $36
      .db $34
      .db $32
      .db $88
      .db $30
      .db $36
      .db $34
      .db $28
      .db $26
      .db $32
      .db $82
      .db $30
      .db $3C
      .db $3A
      .db $38
      .db $44
      .db $42
      .db $86
      .db $40
      .db $36
      .db $2E
      .db $2C
      .db $2A
      .db $28
      .db $8C
      .db $7E
MusicDataUndergroundBeta1_DPCM:
      .db $8A
      .db $01
      .db $10
      .db $84
      .db $01
      .db $01
      .db $88
      .db $01
      .db $8A
      .db $10
      .db $8A
      .db $01
      .db $89
      .db $10
      .db $88
      .db $01
      .db $01
      .db $84
      .db $01
      .db $88
      .db $10
      .db $84
      .db $10
      .db $10
      .db $00
MusicDataUndergroundBeta2_DPCM:
      .db $88
      .db $01
      .db $10
      .db $84
      .db $01
      .db $01
      .db $88
      .db $10
      .db $84
      .db $01
      .db $01
      .db $10
      .db $88
      .db $01
      .db $84
      .db $01
      .db $88
      .db $10
      .db $00
MusicDataUndergroundBeta1_Noise:
      .db $8A
      .db $01
      .db $10
      .db $01
      .db $10
      .db $01
      .db $10
      .db $01
      .db $88
      .db $10
      .db $84
      .db $10
      .db $10
      .db $00
MusicDataUndergroundBeta2_Noise:
      .db $84
      .db $02
      .db $02
      .db $10
      .db $02
      .db $00
ENDIF

MusicDataSubspace1:
MusicDataSubspace1_Square2:
      .db $99
      .db $48
      .db $3E
      .db $38
      .db $98
      .db $42
      .db $46
      .db $94
      .db $44
      .db $42
      .db $7E
      .db $96
      .db $3E
      .db $50
      .db $56
      .db $94
      .db $5A
      .db $7E
      .db $52
      .db $98
      .db $56
      .db $50
      .db $94
      .db $48
      .db $4C
      .db $99
      .db $46
      .db $00
MusicDataSubspace1_Square1:
      .db $99
      .db $38
      .db $30
      .db $26
      .db $98
      .db $30
      .db $34
      .db $94
      .db $32
      .db $98
      .db $30
      .db $96
      .db $30
      .db $3E
      .db $46
      .db $98
      .db $48
      .db $94
      .db $42
      .db $98
      .db $46
      .db $98
      .db $42
      .db $94
      .db $38
      .db $3A
      .db $99
      .db $34
MusicDataSubspace1_Triangle:
      .db $99
      .db $3E
      .db $38
      .db $30
      .db $98
      .db $3A
      .db $3E
      .db $94
      .db $3C
      .db $3A
      .db $7E
      .db $96
      .db $38
      .db $48
      .db $50
      .db $94
      .db $52
      .db $7E
      .db $4C
      .db $50
      .db $7E
      .db $48
      .db $7E
      .db $42
      .db $46
      .db $99
      .db $3E

MusicDataSubspace2:
MusicDataSubspace2_Square2:
      .db $98
      .db $7E
      .db $94
      .db $56
      .db $54
      .db $52
      .db $4E
      .db $7E
      .db $50
      .db $7E
      .db $40
      .db $42
      .db $48
      .db $7E
      .db $42
      .db $48
      .db $4C
      .db $00
MusicDataSubspace2_Square1:
      .db $98
      .db $7E
      .db $94
      .db $50
      .db $4E
      .db $4C
      .db $98
      .db $46
      .db $94
      .db $48
      .db $7E
      .db $38
      .db $3A
      .db $3E
      .db $7E
      .db $30
      .db $38
      .db $3A
MusicDataSubspace2_Triangle:
      .db $99
      .db $30
      .db $3E
      .db $98
      .db $48
      .db $99
      .db $3A
      .db $94
      .db $48
      .db $98
      .db $48
      .db $3A
MusicDataSubspace1_Noise:
MusicDataSubspace2_Noise:
      .db $98
      .db $04
      .db $92
      .db $02
      .db $01
      .db $02
      .db $98
      .db $06
      .db $92
      .db $02
      .db $01
      .db $02
      .db $00

MusicDataSubspace3:
MusicDataSubspace3_Square2:
      .db $98
      .db $7E
      .db $94
      .db $56
      .db $54
      .db $52
      .db $4E
      .db $7E
      .db $50
      .db $7E
      .db $60
      .db $7E
      .db $60
      .db $9A
      .db $60
      .db $00
MusicDataSubspace3_Square1:
      .db $98
      .db $7E
      .db $94
      .db $50
      .db $4E
      .db $4C
      .db $98
      .db $46
      .db $94
      .db $48
      .db $7E
      .db $98
      .db $52
      .db $94
      .db $52
      .db $52
      .db $99
      .db $7E
MusicDataSubspace3_Triangle:
      .db $99
      .db $30
      .db $38
      .db $94
      .db $3E
      .db $98
      .db $48
      .db $6E
      .db $94
      .db $6E
      .db $98
      .db $6E
      .db $3E

MusicDataSubspace4:
MusicDataSubspace4_Square2:
      .db $98
      .db $7E
      .db $99
      .db $4E
      .db $99
      .db $4C
      .db $9A
      .db $48
      .db $7E
      .db $00
MusicDataSubspace4_Square1:
      .db $98
      .db $7E
      .db $94
      .db $40
      .db $98
      .db $7E
      .db $94
      .db $3A
      .db $98
      .db $7E
      .db $9A
      .db $38
      .db $7E
MusicDataSubspace4_Triangle:
      .db $98
      .db $30
      .db $99
      .db $40
      .db $44
      .db $48
      .db $94
      .db $3E
      .db $98
      .db $3E
      .db $30
MusicDataSubspace3_Noise:
MusicDataSubspace4_Noise:
      .db $98
      .db $04
      .db $92
      .db $02
      .db $01
      .db $02
      .db $98
      .db $06
      .db $92
      .db $02
      .db $01
      .db $02
      .db $00

MusicDataTitleScreen1:
MusicDataTitleScreen1_Square2:
      .db $E4
      .db $6E
      .db $E8
      .db $6A
      .db $E4
      .db $64
      .db $E8
      .db $5E
      .db $E4
      .db $56
      .db $E8
      .db $52
      .db $E4
      .db $4C
      .db $E8
      .db $46
      .db $E4
      .db $3E
      .db $E8
      .db $3C
      .db $E4
      .db $3A
      .db $34
      .db $2E
      .db $E8
      .db $26
      .db $7E
      .db $3E
      .db $E8
      .db $56
      .db $7E
      .db $E9
      .db $3E
      .db $00
MusicDataTitleScreen1_Square1:
      .db $E4
      .db $56
      .db $E8
      .db $52
      .db $E4
      .db $4C
      .db $E8
      .db $46
      .db $E4
      .db $3E
      .db $E8
      .db $3A
      .db $E4
      .db $34
      .db $E8
      .db $2E
      .db $E4
      .db $26
      .db $E8
      .db $24
      .db $E4
      .db $22
      .db $1C
      .db $16
      .db $E8
      .db $0E
      .db $7E
      .db $26
      .db $E8
      .db $46
      .db $7E
      .db $E9
      .db $3E
MusicDataTitleScreen1_Triangle:
      .db $EB
      .db $7E
      .db $7E
      .db $E4
      .db $3E
      .db $E8
      .db $3C
      .db $E4
      .db $3A
      .db $34
      .db $2E
      .db $E8
      .db $3E
      .db $7E
      .db $7E
      .db $E8
      .db $4C
      .db $7E
      .db $89
      .db $7E
MusicDataTitleScreen1_Noise:
      .db $E8
      .db $10
      .db $02
      .db $06
      .db $10
      .db $02
      .db $06
      .db $10
      .db $02
      .db $06
      .db $10
      .db $01
      .db $10
      .db $10
      .db $01
      .db $01
      .db $EA
      .db $01

MusicDataTitleScreen2:
MusicDataTitleScreen2_Square2:
      .db $E4
      .db $50
      .db $3E
      .db $48
      .db $50
      .db $7E
      .db $3E
      .db $4E
      .db $3E
      .db $46
      .db $4E
      .db $7E
      .db $3E
      .db $EB
      .db $50
      .db $E4
      .db $7E
      .db $7E
      .db $42
      .db $46
      .db $48
      .db $4C
      .db $50
      .db $3E
      .db $48
      .db $50
      .db $7E
      .db $3E
      .db $4E
      .db $3E
      .db $46
      .db $52
      .db $7E
      .db $3E
      .db $E9
      .db $50
      .db $E4
      .db $26
      .db $2A
      .db $26
      .db $E8
      .db $2E
      .db $2A
      .db $26
      .db $E4
      .db $4C
      .db $3E
      .db $46
      .db $4C
      .db $7E
      .db $3E
      .db $4A
      .db $3E
      .db $44
      .db $4A
      .db $7E
      .db $3E
      .db $EB
      .db $4C
      .db $E4
      .db $7E
      .db $7E
      .db $42
      .db $46
      .db $48
      .db $4A
      .db $4C
      .db $3E
      .db $46
      .db $4C
      .db $7E
      .db $3E
      .db $46
      .db $3E
      .db $46
      .db $52
      .db $7E
      .db $46
      .db $E9
      .db $50
      .db $E4
      .db $26
      .db $2A
      .db $26
      .db $E8
      .db $2E
      .db $30
      .db $34
      .db $00
MusicDataTitleScreen2_Noise:
      .db $B8
      .db $02
      .db $10
      .db $10
      .db $02
      .db $B4
      .db $10
      .db $10
      .db $B8
      .db $10
      .db $00
MusicDataTitleScreen2_Square1:
      .db $E4
      .db $38
      .db $3E
      .db $48
      .db $38
      .db $7E
      .db $3E
      .db $36
      .db $3E
      .db $46
      .db $36
      .db $7E
      .db $3E
      .db $EB
      .db $38
      .db $E4
      .db $7E
      .db $7E
      .db $42
      .db $46
      .db $48
      .db $4C
      .db $38
      .db $3E
      .db $48
      .db $38
      .db $7E
      .db $3E
      .db $36
      .db $3E
      .db $46
      .db $3A
      .db $7E
      .db $3E
      .db $E9
      .db $48
      .db $E4
      .db $26
      .db $2A
      .db $26
      .db $E8
      .db $2E
      .db $2A
      .db $26
      .db $E4
      .db $34
      .db $3E
      .db $46
      .db $34
      .db $7E
      .db $3E
      .db $32
      .db $3E
      .db $44
      .db $32
      .db $7E
      .db $3E
      .db $EB
      .db $34
      .db $E4
      .db $7E
      .db $7E
      .db $42
      .db $46
      .db $48
      .db $4A
      .db $34
      .db $3E
      .db $46
      .db $34
      .db $7E
      .db $3E
      .db $2E
      .db $3E
      .db $46
      .db $3A
      .db $7E
      .db $46
      .db $E9
      .db $48
      .db $E4
      .db $26
      .db $2A
      .db $26
      .db $E8
      .db $2E
      .db $30
      .db $34
MusicDataTitleScreen2_Triangle:
      .db $88
      .db $48
      .db $56
      .db $56
      .db $46
      .db $56
      .db $56
      .db $48
      .db $56
      .db $56
      .db $3E
      .db $56
      .db $56
      .db $48
      .db $56
      .db $56
      .db $46
      .db $56
      .db $56
      .db $48
      .db $56
      .db $56
      .db $3E
      .db $56
      .db $56
      .db $4C
      .db $56
      .db $56
      .db $4A
      .db $54
      .db $54
      .db $4C
      .db $56
      .db $56
      .db $46
      .db $56
      .db $56
      .db $4C
      .db $56
      .db $56
      .db $46
      .db $56
      .db $56
      .db $48
      .db $56
      .db $56
      .db $3E
      .db $56
      .db $56

MusicDataTitleScreen3:
MusicDataTitleScreen3_Square2:
      .db $E4
      .db $56
      .db $48
      .db $7E
      .db $56
      .db $7E
      .db $48
      .db $56
      .db $46
      .db $7E
      .db $56
      .db $7E
      .db $46
      .db $56
      .db $44
      .db $7E
      .db $56
      .db $7E
      .db $44
      .db $56
      .db $7E
      .db $5A
      .db $7E
      .db $E6
      .db $7E
      .db $E4
      .db $56
      .db $52
      .db $42
      .db $7E
      .db $52
      .db $7E
      .db $42
      .db $52
      .db $42
      .db $7E
      .db $52
      .db $7E
      .db $42
      .db $52
      .db $42
      .db $7E
      .db $52
      .db $7E
      .db $42
      .db $52
      .db $7E
      .db $56
      .db $7E
      .db $E6
      .db $7E
      .db $E4
      .db $52
      .db $50
      .db $3E
      .db $3E
      .db $50
      .db $7E
      .db $3E
      .db $E8
      .db $42
      .db $46
      .db $52
      .db $E4
      .db $50
      .db $50
      .db $E9
      .db $50
      .db $E4
      .db $46
      .db $00
MusicDataTitleScreen3_Square1:
      .db $E4
      .db $50
      .db $48
      .db $7E
      .db $50
      .db $7E
      .db $48
      .db $4C
      .db $46
      .db $7E
      .db $4C
      .db $7E
      .db $46
      .db $4A
      .db $44
      .db $7E
      .db $4A
      .db $7E
      .db $44
      .db $4A
      .db $4A
      .db $4A
      .db $7E
      .db $E6
      .db $7E
      .db $E4
      .db $56
      .db $4C
      .db $42
      .db $7E
      .db $4C
      .db $7E
      .db $42
      .db $4A
      .db $42
      .db $7E
      .db $4A
      .db $7E
      .db $42
      .db $48
      .db $42
      .db $7E
      .db $48
      .db $7E
      .db $42
      .db $46
      .db $46
      .db $46
      .db $7E
      .db $E6
      .db $7E
      .db $E4
      .db $52
      .db $30
      .db $3E
      .db $3E
      .db $30
      .db $7E
      .db $3E
      .db $E8
      .db $3A
      .db $3E
      .db $46
      .db $E4
      .db $46
      .db $46
      .db $E9
      .db $46
      .db $E4
      .db $3A
MusicDataTitleScreen3_Triangle:
      .db $48
      .db $56
      .db $56
      .db $46
      .db $56
      .db $56
      .db $44
      .db $56
      .db $56
      .db $4A
      .db $56
      .db $86
      .db $7E
      .db $84
      .db $7E
      .db $88
      .db $4C
      .db $5A
      .db $5A
      .db $4A
      .db $5A
      .db $5A
      .db $48
      .db $5A
      .db $5A
      .db $46
      .db $56
      .db $86
      .db $7E
      .db $84
      .db $7E
      .db $88
      .db $48
      .db $56
      .db $56
      .db $3E
      .db $56
      .db $56
      .db $84
      .db $52
      .db $52
      .db $89
      .db $52
      .db $84
      .db $46
MusicDataTitleScreen3_Noise:
      .db $B8
      .db $02
      .db $10
      .db $10
      .db $02
      .db $10
      .db $10
      .db $02
      .db $10
      .db $10
      .db $02
      .db $10
      .db $86
      .db $01
      .db $84
      .db $01
      .db $88
      .db $02
      .db $10
      .db $10
      .db $02
      .db $10
      .db $10
      .db $02
      .db $10
      .db $10
      .db $02
      .db $10
      .db $86
      .db $01
      .db $84
      .db $01
      .db $88
      .db $02
      .db $10
      .db $10
      .db $02
      .db $10
      .db $10
      .db $02
      .db $10
      .db $10

MusicDataTitleScreen4:
MusicDataTitleScreen4_Square2:
      .db $48
      .db $7E
      .db $7E
      .db $3E
      .db $38
      .db $34
      .db $30
      .db $7E
      .db $7E
      .db $26
      .db $20
      .db $1C
      .db $E8
      .db $18
      .db $7E
      .db $3E
      .db $48
      .db $00
MusicDataTitleScreen4_Square1:
      .db $30
      .db $7E
      .db $7E
      .db $26
      .db $20
      .db $1C
      .db $18
      .db $7E
      .db $7E
      .db $0E
      .db $08
      .db $04
      .db $E8
      .db $18
      .db $7E
      .db $00
      .db $2E
      .db $38
MusicDataTitleScreen4_Triangle:
      .db $EB
      .db $7E
      .db $7E
      .db $7E
      .db $30
MusicDataTitleScreen4_Noise:
      .db $10
      .db $01
      .db $01
      .db $10
      .db $01
      .db $01
      .db $10
      .db $01
      .db $10
      .db $10
      .db $01
      .db $01

MusicDataCharacterSelect1:
MusicDataCharacterSelect1_Square2:
      .db $96
      .db $48
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $48
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $48
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $98
      .db $50
      .db $7E
      .db $4C
      .db $7E
      .db $00
MusicDataCharacterSelect1_Square1:
      .db $96
      .db $3E
      .db $92
      .db $3E
      .db $96
      .db $7E
      .db $92
      .db $3E
      .db $96
      .db $7E
      .db $92
      .db $3E
      .db $96
      .db $7E
      .db $92
      .db $3E
      .db $96
      .db $3C
      .db $92
      .db $3C
      .db $96
      .db $7E
      .db $92
      .db $3C
      .db $96
      .db $7E
      .db $92
      .db $3C
      .db $96
      .db $7E
      .db $92
      .db $3C
      .db $96
      .db $3A
      .db $92
      .db $3A
      .db $96
      .db $7E
      .db $92
      .db $3A
      .db $96
      .db $7E
      .db $92
      .db $3A
      .db $96
      .db $7E
      .db $92
      .db $3A
      .db $98
      .db $46
      .db $7E
      .db $3A
      .db $7E
MusicDataCharacterSelect1_Triangle:
      .db $96
      .db $48
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $48
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $48
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $96
      .db $7E
      .db $92
      .db $48
      .db $98
      .db $3E
      .db $7E
      .db $46
      .db $7E
MusicDataCharacterSelect1_Noise:
      .db $8A
      .db $04
      .db $01
      .db $00

; Seems to be a little duplicated chunk of MusicDataCharacterSelect2_Square2
MusicDataCharacterSelect_Square_UNUSED:
      .db $A6
      .db $7E
      .db $A2
      .db $48
      .db $A6
      .db $7E
      .db $A2
      .db $42
      .db $A8
      .db $50
      .db $50

MusicDataCharacterSelect2:
MusicDataCharacterSelect2_Square2:
      .db $A8
      .db $50
      .db $7E
      .db $50
      .db $A6
      .db $7E
      .db $A2
      .db $50
      .db $A6
      .db $7E
      .db $A2
      .db $48
      .db $A6
      .db $7E
      .db $A2
      .db $42
      .db $AA
      .db $3E
      .db $A8
      .db $48
      .db $7E
      .db $48
      .db $A6
      .db $7E
      .db $A2
      .db $48
      .db $A6
      .db $7E
      .db $A2
      .db $42
      .db $A6
      .db $7E
      .db $A2
      .db $3C
      .db $AA
      .db $38
      .db $A8
      .db $50
      .db $7E
      .db $50
      .db $A6
      .db $7E
      .db $A2
      .db $50
      .db $A6
      .db $7E
      .db $A2
      .db $48
      .db $A6
      .db $7E
      .db $A2
      .db $42
      .db $A8
      .db $50
      .db $50
      .db $A4
      .db $48
      .db $A9
      .db $7E
      .db $AA
      .db $7E
      .db $00

MusicDataCharacterSelect3:
MusicDataCharacterSelect3_Square2:
      .db $AA
      .db $7E
      .db $7E
      .db $00

MusicDataCharacterSelect4:
MusicDataCharacterSelect4_Square2:
      .db $C8
      .db $7E
      .db $48
      .db $4C
      .db $4E
      .db $00

MusicDataCharacterSelect2_Square1:
      .db $A8
      .db $3E
      .db $7E
      .db $A8
      .db $3E
      .db $A6
      .db $7E
      .db $A2
      .db $3E
      .db $A6
      .db $7E
      .db $A2
      .db $38
      .db $A6
      .db $7E
      .db $A2
      .db $38
      .db $AA
      .db $30
      .db $A8
      .db $3C
      .db $7E
      .db $3C
      .db $A6
      .db $7E
      .db $A2
      .db $3C
      .db $A6
      .db $7E
      .db $A2
      .db $34
      .db $A6
      .db $7E
      .db $A2
      .db $34
      .db $AA
      .db $30
      .db $A8
      .db $3A
      .db $7E
      .db $3A
      .db $A6
      .db $7E
      .db $A2
      .db $3A
      .db $A6
      .db $7E
      .db $A2
      .db $34
      .db $A6
      .db $7E
      .db $A2
      .db $2E
      .db $A8
      .db $3E
      .db $3E
      .db $A4
      .db $38
      .db $A9
      .db $7E
      .db $AA
      .db $7E

MusicDataCharacterSelect3_Square1:
      .db $AA
      .db $7E
      .db $7E

MusicDataCharacterSelect4_Square1:
      .db $C8
      .db $7E
      .db $38
      .db $3A
      .db $3C

MusicDataCharacterSelect2_Triangle:
      .db $88
      .db $30
      .db $7E
      .db $30
      .db $7E
      .db $30
      .db $7E
      .db $30
      .db $7E
      .db $34
      .db $7E
      .db $34
      .db $7E
      .db $34
      .db $7E
      .db $34
      .db $7E
      .db $3E
      .db $7E
      .db $3E
      .db $7E
      .db $3E
      .db $7E
      .db $3E
      .db $7E
      .db $30
      .db $7E
      .db $8A
      .db $7E
      .db $7E
      .db $7E

MusicDataCharacterSelect3_Triangle:
MusicDataCharacterSelect4_Triangle:
      .db $8A
      .db $7E
      .db $7E

MusicDataCharacterSelect2_Noise:
      .db $88
      .db $02
      .db $04
      .db $00

MusicDataCharacterSelect3_Noise:
MusicDataCharacterSelect4_Noise:
      .db $82
      .db $04
      .db $82
      .db $04
      .db $82
      .db $04
      .db $86
      .db $04
      .db $82
      .db $04
      .db $82
      .db $04
      .db $82
      .db $01
      .db $82
      .db $04
      .db $82
      .db $04
      .db $82
      .db $01
      .db $82
      .db $04

MusicDataCharacterSelect5:
MusicDataCharacterSelect5_Square2:
      .db $C8
      .db $50
      .db $7E
      .db $50
      .db $C6
      .db $7E
      .db $C2
      .db $50
      .db $C6
      .db $7E
      .db $C8
      .db $4C
      .db $C2
      .db $7E
      .db $C8
      .db $4C
      .db $50
      .db $C4
      .db $4C
      .db $7E
      .db $48
      .db $7E
      .db $C2
      .db $48
      .db $C6
      .db $46
      .db $7E
      .db $C8
      .db $48
      .db $C2
      .db $7E
      .db $C8
      .db $42
      .db $46
      .db $48
      .db $C8
      .db $4C
      .db $7E
      .db $4C
      .db $C6
      .db $7E
      .db $C2
      .db $4C
      .db $C6
      .db $7E
      .db $C8
      .db $48
      .db $C2
      .db $7E
      .db $C8
      .db $46
      .db $C4
      .db $42
      .db $7E
      .db $00

MusicDataCharacterSelect6:
MusicDataCharacterSelect6_Square2:
      .db $C8
      .db $7E
      .db $46
      .db $48
      .db $4A
      .db $C8
      .db $4C
      .db $7E
      .db $C6
      .db $7E
      .db $C8
      .db $3E
      .db $C2
      .db $7E
      .db $00

MusicDataCharacterSelect5_Square1:
      .db $C8
      .db $40
      .db $7E
      .db $40
      .db $C6
      .db $7E
      .db $C2
      .db $40
      .db $C6
      .db $7E
      .db $C8
      .db $3C
      .db $C2
      .db $7E
      .db $C8
      .db $3C
      .db $40
      .db $C4
      .db $38
      .db $7E
      .db $38
      .db $7E
      .db $C2
      .db $38
      .db $C6
      .db $34
      .db $7E
      .db $C8
      .db $38
      .db $C2
      .db $7E
      .db $C8
      .db $30
      .db $34
      .db $38
      .db $C8
      .db $3C
      .db $7E
      .db $3C
      .db $C6
      .db $7E
      .db $C2
      .db $3C
      .db $C6
      .db $7E
      .db $C8
      .db $38
      .db $C2
      .db $7E
      .db $C8
      .db $34
      .db $C4
      .db $30
      .db $7E

MusicDataCharacterSelect6_Square1:
      .db $C8
      .db $7E
      .db $34
      .db $38
      .db $3A
      .db $C8
      .db $3C
      .db $7E
      .db $C6
      .db $7E
      .db $C8
      .db $2E
      .db $C2
      .db $7E

MusicDataCharacterSelect5_Triangle:
      .db $88
      .db $38
      .db $7E
      .db $3C
      .db $7E
      .db $3E
      .db $7E
      .db $40
      .db $46
      .db $42
      .db $7E
      .db $46
      .db $7E
      .db $48
      .db $7E
      .db $46
      .db $42
      .db $34
      .db $7E
      .db $38
      .db $7E
      .db $3A
      .db $7E
      .db $3C
      .db $42

MusicDataCharacterSelect6_Triangle:
      .db $88
      .db $7E
      .db $3E
      .db $42
      .db $44
      .db $46
      .db $7E
      .db $8A
      .db $7E

MusicDataCharacterSelect5_Noise:
      .db $88
      .db $02
      .db $04
      .db $00

MusicDataCharacterSelect6_Noise:
      .db $88
      .db $02
      .db $04
      .db $04
      .db $04
      .db $02
      .db $02
      .db $7E
      .db $06

MusicDataCharacterSelect7:
MusicDataCharacterSelect7_Square2:
      .db $96
      .db $50
      .db $92
      .db $4E
      .db $96
      .db $50
      .db $92
      .db $5E
      .db $96
      .db $58
      .db $92
      .db $50
      .db $96
      .db $68
      .db $92
      .db $5E
      .db $96
      .db $64
      .db $92
      .db $5E
      .db $96
      .db $5A
      .db $92
      .db $5E
      .db $96
      .db $58
      .db $92
      .db $52
      .db $96
      .db $50
      .db $92
      .db $4C
      .db $96
      .db $48
      .db $92
      .db $46
      .db $96
      .db $48
      .db $92
      .db $4C
      .db $96
      .db $50
      .db $92
      .db $4E
      .db $96
      .db $50
      .db $92
      .db $5A
      .db $96
      .db $58
      .db $92
      .db $50
      .db $96
      .db $4C
      .db $92
      .db $4E
      .db $96
      .db $5A
      .db $92
      .db $50
      .db $96
      .db $56
      .db $92
      .db $54
      .db $96
      .db $52
      .db $92
      .db $50
      .db $96
      .db $52
      .db $92
      .db $5A
      .db $96
      .db $68
      .db $92
      .db $4C
      .db $96
      .db $5A
      .db $92
      .db $58
      .db $96
      .db $56
      .db $92
      .db $68
      .db $96
      .db $56
      .db $92
      .db $54
      .db $96
      .db $52
      .db $92
      .db $64
      .db $96
      .db $5A
      .db $92
      .db $5C
      .db $00
MusicDataCharacterSelect7_Square1:
      .db $C8
      .db $50
      .db $7E
      .db $50
      .db $C6
      .db $7E
      .db $C2
      .db $50
      .db $C6
      .db $7E
      .db $C8
      .db $4C
      .db $C2
      .db $7E
      .db $C8
      .db $4C
      .db $50
      .db $C4
      .db $4C
      .db $7E
      .db $48
      .db $7E
      .db $C2
      .db $48
      .db $C6
      .db $46
      .db $C6
      .db $7E
      .db $C8
      .db $48
      .db $C2
      .db $7E
      .db $C8
      .db $42
      .db $46
      .db $48
      .db $4C
      .db $7E
      .db $4C
      .db $C6
      .db $7E
      .db $C2
      .db $4C
      .db $C6
      .db $7E
      .db $C8
      .db $48
      .db $C2
      .db $7E
      .db $C8
      .db $46
      .db $C4
      .db $42
      .db $7E
MusicDataCharacterSelect7_Triangle:
      .db $88
      .db $38
      .db $7E
      .db $3C
      .db $7E
      .db $3E
      .db $7E
      .db $40
      .db $46
      .db $42
      .db $7E
      .db $46
      .db $7E
      .db $48
      .db $7E
      .db $46
      .db $42
      .db $34
      .db $7E
      .db $38
      .db $7E
      .db $3A
      .db $7E
      .db $3C
      .db $42
MusicDataCharacterSelect7_Noise:
      .db $88
      .db $02
      .db $04
      .db $00

MusicDataCharacterSelect8:
MusicDataCharacterSelect8_Square2:
      .db $96
      .db $5E
      .db $92
      .db $5C
      .db $96
      .db $5E
      .db $92
      .db $5A
      .db $96
      .db $56
      .db $92
      .db $52
      .db $96
      .db $42
      .db $92
      .db $46
      .db $96
      .db $56
      .db $92
      .db $52
      .db $96
      .db $46
      .db $92
      .db $42
      .db $96
      .db $52
      .db $92
      .db $46
      .db $96
      .db $42
      .db $92
      .db $3E
      .db $00
MusicDataCharacterSelect8_Square1:
      .db $C8
      .db $7E
      .db $46
      .db $48
      .db $4A
      .db $C8
      .db $4C
      .db $7E
      .db $C6
      .db $7E
      .db $C8
      .db $3E
      .db $C2
      .db $7E
MusicDataCharacterSelect8_Triangle:
      .db $88
      .db $7E
      .db $3E
      .db $42
      .db $44
      .db $46
      .db $7E
      .db $8A
      .db $7E
MusicDataCharacterSelect8_Noise:
      .db $88
      .db $02
      .db $04
      .db $04
      .db $04
      .db $02
      .db $02
      .db $7E
      .db $06

MusicDataOverworld1:
MusicDataOverworld1_Square2:
      .db $A2
      .db $7E
      .db $7E
      .db $56
      .db $54
      .db $7E
      .db $52
      .db $4C
      .db $7E
      .db $46
      .db $42
      .db $7E
      .db $40
      .db $A4
      .db $3E
      .db $7E
      .db $56
      .db $7E
      .db $A8
      .db $3E
      .db $7E
      .db $00
MusicDataOverworld1_Square1:
      .db $A2
      .db $7E
      .db $7E
      .db $46
      .db $44
      .db $7E
      .db $42
      .db $3A
      .db $7E
      .db $34
      .db $30
      .db $7E
      .db $2E
      .db $A4
      .db $2E
      .db $7E
      .db $46
      .db $7E
      .db $A8
      .db $3A
      .db $7E
MusicDataOverworld1_Triangle:
      .db $82
      .db $7E
      .db $7E
      .db $4C
      .db $4A
      .db $7E
      .db $48
      .db $46
      .db $7E
      .db $3E
      .db $3A
      .db $7E
      .db $38
      .db $88
      .db $34
      .db $4C
      .db $34
      .db $3E
MusicDataOverworld1_Noise:
      .db $8A
      .db $01
      .db $01
      .db $88
      .db $02
      .db $82
      .db $02
      .db $02
      .db $02
      .db $02
      .db $01
      .db $02
      .db $02
      .db $02
      .db $02

MusicDataOverworld2:
MusicDataOverworld2_Square2:
      .db $82
      .db $56
      .db $7E
      .db $48
      .db $50
      .db $7E
      .db $88
      .db $56
      .db $82
      .db $48
      .db $50
      .db $7E
      .db $56
      .db $46
      .db $4E
      .db $56
      .db $5E
      .db $7E
      .db $8A
      .db $5A
      .db $82
      .db $7E
      .db $56
      .db $7E
      .db $44
      .db $4C
      .db $7E
      .db $88
      .db $56
      .db $82
      .db $44
      .db $4C
      .db $7E
      .db $56
      .db $4A
      .db $50
      .db $56
      .db $5E
      .db $7E
      .db $8A
      .db $5A
      .db $82
      .db $5E
      .db $60
      .db $7E
      .db $5E
      .db $60
      .db $7E
      .db $88
      .db $5A
      .db $82
      .db $60
      .db $5E
      .db $7E
      .db $5A
      .db $56
      .db $7E
      .db $54
      .db $56
      .db $7E
      .db $88
      .db $50
      .db $82
      .db $4A
      .db $4C
      .db $7E
      .db $50
      .db $52
      .db $7E
      .db $50
      .db $52
      .db $7E
      .db $88
      .db $46
      .db $82
      .db $50
      .db $4C
      .db $7E
      .db $8A
      .db $48
      .db $7E
      .db $82
      .db $7E
      .db $00
MusicDataOverworld2_Square1:
      .db $82
      .db $48
      .db $7E
      .db $38
      .db $3E
      .db $7E
      .db $88
      .db $48
      .db $82
      .db $38
      .db $3E
      .db $7E
      .db $48
      .db $36
      .db $3E
      .db $46
      .db $4E
      .db $7E
      .db $8A
      .db $46
      .db $82
      .db $7E
      .db $44
      .db $7E
      .db $34
      .db $3E
      .db $7E
      .db $88
      .db $44
      .db $82
      .db $34
      .db $3E
      .db $7E
      .db $44
      .db $38
      .db $42
      .db $4A
      .db $50
      .db $7E
      .db $8A
      .db $4A
      .db $82
      .db $50
      .db $5A
      .db $7E
      .db $56
      .db $5A
      .db $7E
      .db $88
      .db $52
      .db $82
      .db $5A
      .db $56
      .db $7E
      .db $54
      .db $50
      .db $7E
      .db $4E
      .db $50
      .db $7E
      .db $88
      .db $48
      .db $82
      .db $42
      .db $46
      .db $7E
      .db $4A
      .db $4C
      .db $7E
      .db $48
      .db $4C
      .db $7E
      .db $88
      .db $3E
      .db $82
      .db $48
      .db $46
      .db $7E
      .db $8A
      .db $3E
      .db $8A
      .db $7E
      .db $82
      .db $7E
MusicDataOverworld2_Triangle:
      .db $88
      .db $30
      .db $3E
      .db $30
      .db $3E
      .db $2E
      .db $3E
      .db $2E
      .db $3E
      .db $2C
      .db $3E
      .db $2C
      .db $3E
      .db $2A
      .db $3E
      .db $2A
      .db $3E
      .db $22
      .db $3A
      .db $24
      .db $3C
      .db $26
      .db $3E
      .db $2A
      .db $42
      .db $34
      .db $3A
      .db $26
      .db $34
      .db $30
      .db $26
      .db $30
      .db $7E
MusicDataOverworld2_Noise:
      .db $88
      .db $01
      .db $02
      .db $01
      .db $02
      .db $88
      .db $01
      .db $02
      .db $82
      .db $02
      .db $02
      .db $02
      .db $02
      .db $01
      .db $02
      .db $00

MusicDataOverworld3:
MusicDataOverworld3_Square2:
      .db $92
      .db $7E
      .db $7E
      .db $98
      .db $50
      .db $92
      .db $7E
      .db $56
      .db $7E
      .db $7E
      .db $5A
      .db $7E
      .db $9A
      .db $60
      .db $92
      .db $7E
      .db $5A
      .db $7E
      .db $56
      .db $50
      .db $7E
      .db $48
      .db $4C
      .db $7E
      .db $50
      .db $4C
      .db $7E
      .db $50
      .db $4C
      .db $7E
      .db $42
      .db $7E
      .db $7E
      .db $98
      .db $4C
      .db $90
      .db $42
      .db $4C
      .db $42
      .db $4C
      .db $42
      .db $4C
      .db $42
      .db $4C
      .db $42
      .db $4C
      .db $42
      .db $4C
      .db $92
      .db $7E
      .db $98
      .db $4C
      .db $92
      .db $50
      .db $4C
      .db $7E
      .db $50
      .db $4C
      .db $7E
      .db $50
      .db $7E
      .db $7E
      .db $98
      .db $5A
      .db $92
      .db $56
      .db $5A
      .db $7E
      .db $56
      .db $00

MusicDataOverworld4:
MusicDataOverworld4_Square2:
      .db $92
      .db $50
      .db $7E
      .db $4C
      .db $48
      .db $7E
      .db $98
      .db $50
      .db $90
      .db $3E
      .db $50
      .db $3E
      .db $50
      .db $3E
      .db $50
      .db $3E
      .db $50
      .db $3E
      .db $50
      .db $3E
      .db $50
      .db $92
      .db $7E
      .db $7E
      .db $C2
      .db $7E
      .db $7E
      .db $56
      .db $7E
      .db $4E
      .db $7E
      .db $46
      .db $7E
      .db $42
      .db $7E
      .db $3E
      .db $7E
      .db $00

MusicDataOverworld3_Noise:
MusicDataOverworld4_Noise:
      .db $88
      .db $06
      .db $82
      .db $02
      .db $01
      .db $02
      .db $00

MusicDataOverworld3_Square1:
      .db $92
      .db $7E
      .db $7E
      .db $98
      .db $3E
      .db $92
      .db $7E
      .db $48
      .db $7E
      .db $7E
      .db $50
      .db $7E
      .db $9A
      .db $56
      .db $92
      .db $7E
      .db $50
      .db $7E
      .db $48
      .db $42
      .db $7E
      .db $3E
      .db $3C
      .db $7E
      .db $3E
      .db $3C
      .db $7E
      .db $3E
      .db $3C
      .db $7E
      .db $34
      .db $7E
      .db $7E
      .db $98
      .db $3C
      .db $90
      .db $34
      .db $3C
      .db $34
      .db $34
      .db $3C
      .db $34
      .db $3C
      .db $34
      .db $3C
      .db $90
      .db $34
      .db $3C
      .db $34
      .db $92
      .db $7E
      .db $98
      .db $3A
      .db $92
      .db $3E
      .db $3A
      .db $7E
      .db $3E
      .db $3A
      .db $7E
      .db $3E
      .db $7E
      .db $7E
      .db $98
      .db $48
      .db $92
      .db $46
      .db $48
      .db $7E
      .db $46

MusicDataOverworld4_Square1:
      .db $92
      .db $3E
      .db $7E
      .db $3A
      .db $38
      .db $7E
      .db $98
      .db $48
      .db $90
      .db $38
      .db $48
      .db $38
      .db $48
      .db $38
      .db $48
      .db $38
      .db $48
      .db $38
      .db $48
      .db $38
      .db $48
      .db $C2
      .db $7E
      .db $7E
      .db $7E
      .db $7E
      .db $46
      .db $7E
      .db $42
      .db $7E
      .db $3E
      .db $7E
      .db $3A
      .db $7E
      .db $36
      .db $7E

MusicDataOverworld3_Triangle:
      .db $88
      .db $30
      .db $34
      .db $38
      .db $3E
      .db $42
      .db $3E
      .db $38
      .db $30
      .db $34
      .db $38
      .db $3C
      .db $2A
      .db $82
      .db $34
      .db $7E
      .db $38
      .db $88
      .db $30
      .db $2E
      .db $2A
      .db $26
      .db $3E
      .db $3A
      .db $34
      .db $2E
      .db $26

MusicDataOverworld4_Triangle:
      .db $88
      .db $2A
      .db $2E
      .db $30
      .db $32
      .db $34
      .db $36
      .db $82
      .db $38
      .db $7E
      .db $2E
      .db $88
      .db $2A
      .db $26
      .db $2E

MusicDataOverworld5:
MusicDataOverworld5_Square2:
      .db $92
      .db $5A
      .db $7E
      .db $56
      .db $50
      .db $7E
      .db $9A
      .db $48
      .db $82
      .db $3C
      .db $3E
      .db $7E
      .db $40
      .db $42
      .db $7E
      .db $48
      .db $7E
      .db $7E
      .db $88
      .db $7E
      .db $82
      .db $48
      .db $88
      .db $7E
      .db $E2
      .db $7E
      .db $7E
      .db $50
      .db $00
MusicDataOverworld5_Square1:
      .db $92
      .db $48
      .db $7E
      .db $46
      .db $3E
      .db $7E
      .db $9A
      .db $38
      .db $88
      .db $7E
      .db $82
      .db $7E
      .db $3A
      .db $7E
      .db $38
      .db $7E
      .db $7E
      .db $88
      .db $7E
      .db $82
      .db $38
      .db $88
      .db $7E
      .db $E2
      .db $7E
      .db $7E
      .db $38
MusicDataOverworld5_Triangle:
      .db $2A
      .db $2E
      .db $30
      .db $26
      .db $2A
      .db $2E
      .db $30
      .db $82
      .db $7E
      .db $7E
      .db $30
      .db $88
      .db $7E
      .db $7E
MusicDataOverworld5_Noise:
      .db $88
      .db $06
      .db $82
      .db $02
      .db $01
      .db $02
      .db $00

MusicDataOverworld6:
MusicDataOverworld6_Square2:
      .db $E2
      .db $7E
      .db $7E
      .db $52
      .db $4E
      .db $7E
      .db $50
      .db $52
      .db $7E
      .db $4E
      .db $50
      .db $7E
      .db $E8
      .db $5E
      .db $E2
      .db $7E
      .db $E8
      .db $58
      .db $52
      .db $50
      .db $E2
      .db $4C
      .db $E0
      .db $50
      .db $4C
      .db $48
      .db $E2
      .db $46
      .db $7E
      .db $48
      .db $E2
      .db $4C
      .db $7E
      .db $48
      .db $46
      .db $7E
      .db $EA
      .db $48
      .db $E2
      .db $48
      .db $E8
      .db $46
      .db $48
      .db $E2
      .db $7E
      .db $7E
      .db $E8
      .db $4C
      .db $E2
      .db $7E
      .db $E8
      .db $4A
      .db $E2
      .db $4C
      .db $7E
      .db $E8
      .db $5A
      .db $E2
      .db $7E
      .db $E8
      .db $54
      .db $56
      .db $5A
      .db $EA
      .db $5E
      .db $5A
      .db $E8
      .db $58
      .db $E2
      .db $7E
      .db $7E
      .db $7E
      .db $56
      .db $7E
      .db $4C
      .db $46
      .db $7E
      .db $3E
      .db $00
MusicDataOverworld6_Square1:
      .db $E2
      .db $7E
      .db $7E
      .db $3A
      .db $36
      .db $7E
      .db $38
      .db $3A
      .db $7E
      .db $36
      .db $38
      .db $7E
      .db $E8
      .db $46
      .db $E2
      .db $7E
      .db $E8
      .db $40
      .db $3A
      .db $38
      .db $E2
      .db $34
      .db $E0
      .db $38
      .db $34
      .db $30
      .db $E2
      .db $2E
      .db $7E
      .db $30
      .db $E2
      .db $34
      .db $7E
      .db $30
      .db $2E
      .db $7E
      .db $EA
      .db $30
      .db $E2
      .db $30
      .db $E8
      .db $2E
      .db $30
      .db $E2
      .db $7E
      .db $7E
      .db $E8
      .db $34
      .db $E2
      .db $7E
      .db $E8
      .db $32
      .db $E2
      .db $34
      .db $7E
      .db $E8
      .db $42
      .db $E2
      .db $7E
      .db $E8
      .db $3C
      .db $3E
      .db $42
      .db $E2
      .db $46
      .db $7E
      .db $44
      .db $46
      .db $7E
      .db $5E
      .db $42
      .db $7E
      .db $40
      .db $42
      .db $7E
      .db $5A
      .db $40
      .db $7E
      .db $3E
      .db $40
      .db $7E
      .db $58
      .db $3E
      .db $7E
      .db $34
      .db $2E
      .db $7E
      .db $26
MusicDataOverworld6_Triangle:
      .db $88
      .db $38
      .db $46
      .db $40
      .db $3A
      .db $38
      .db $34
      .db $2E
      .db $28
      .db $2A
      .db $2E
      .db $30
      .db $34
      .db $38
      .db $30
      .db $2E
      .db $2A
      .db $34
      .db $38
      .db $3C
      .db $42
      .db $34
      .db $2A
      .db $34
      .db $3C
      .db $3E
      .db $3A
      .db $34
      .db $2E
      .db $34
      .db $2E
      .db $2A
      .db $26
MusicDataOverworld6_Noise:
      .db $88
      .db $06
      .db $82
      .db $10
      .db $01
      .db $10
      .db $00

MusicDataBoss:
MusicDataBoss_Square2:
      .db $94
      .db $34
      .db $36
      .db $36
      .db $34
      .db $36
      .db $36
      .db $34
      .db $36
      .db $34
      .db $36
      .db $36
      .db $34
      .db $36
      .db $36
      .db $34
      .db $36
      .db $34
      .db $36
      .db $36
      .db $34
      .db $36
      .db $36
      .db $34
      .db $36
      .db $34
      .db $36
      .db $36
      .db $34
      .db $36
      .db $36
      .db $34
      .db $36
      .db $38
      .db $3A
      .db $3A
      .db $38
      .db $3A
      .db $3A
      .db $38
      .db $3A
      .db $38
      .db $3A
      .db $3A
      .db $38
      .db $3A
      .db $3A
      .db $38
      .db $3A
      .db $38
      .db $3A
      .db $3A
      .db $38
      .db $3A
      .db $3A
      .db $38
      .db $3A
      .db $38
      .db $3A
      .db $3A
      .db $38
      .db $3A
      .db $3A
      .db $38
      .db $3A
      .db $00
MusicDataBoss_Square1:
      .db $94
      .db $7E
      .db $42
      .db $42
      .db $7E
      .db $42
      .db $42
      .db $7E
      .db $42
      .db $7E
      .db $42
      .db $42
      .db $7E
      .db $42
      .db $42
      .db $7E
      .db $42
      .db $7E
      .db $40
      .db $40
      .db $7E
      .db $40
      .db $40
      .db $7E
      .db $40
      .db $7E
      .db $40
      .db $40
      .db $7E
      .db $40
      .db $40
      .db $7E
      .db $40
      .db $7E
      .db $46
      .db $46
      .db $7E
      .db $46
      .db $46
      .db $7E
      .db $46
      .db $7E
      .db $46
      .db $46
      .db $7E
      .db $46
      .db $46
      .db $7E
      .db $46
      .db $7E
      .db $44
      .db $44
      .db $7E
      .db $44
      .db $44
      .db $7E
      .db $44
      .db $7E
      .db $44
      .db $44
      .db $7E
      .db $44
      .db $44
      .db $7E
      .db $44
MusicDataBoss_Triangle:
      .db $89
      .db $3C
      .db $3C
      .db $88
      .db $3C
      .db $89
      .db $3C
      .db $3C
      .db $88
      .db $3C
      .db $89
      .db $3A
      .db $3A
      .db $88
      .db $3A
      .db $89
      .db $3A
      .db $3A
      .db $88
      .db $3A
      .db $89
      .db $40
      .db $40
      .db $88
      .db $40
      .db $89
      .db $40
      .db $40
      .db $88
      .db $40
      .db $89
      .db $3E
      .db $3E
      .db $88
      .db $3E
      .db $89
      .db $3E
      .db $3E
      .db $88
      .db $3E

MusicDataWart:
MusicDataWart_Square2:
      .db $A9
      .db $56
      .db $54
      .db $A8
      .db $4C
      .db $A9
      .db $54
      .db $52
      .db $A8
      .db $4A
      .db $A9
      .db $52
      .db $50
      .db $A8
      .db $48
      .db $A4
      .db $4E
      .db $AB
      .db $4C
      .db $A4
      .db $7E
      .db $A9
      .db $5A
      .db $58
      .db $A8
      .db $50
      .db $A9
      .db $58
      .db $56
      .db $A8
      .db $4E
      .db $A9
      .db $56
      .db $54
      .db $A8
      .db $4C
      .db $A4
      .db $52
      .db $AB
      .db $50
      .db $A4
      .db $7E
      .db $4E
      .db $4C
      .db $4E
      .db $4C
      .db $4E
      .db $4C
      .db $4E
      .db $4C
      .db $50
      .db $4E
      .db $50
      .db $4E
      .db $50
      .db $4E
      .db $50
      .db $4E
      .db $52
      .db $50
      .db $52
      .db $50
      .db $52
      .db $50
      .db $52
      .db $50
      .db $54
      .db $52
      .db $54
      .db $52
      .db $54
      .db $52
      .db $54
      .db $52
      .db $00
MusicDataWart_Square1:
      .db $A9
      .db $44
      .db $42
      .db $A8
      .db $3A
      .db $A9
      .db $42
      .db $40
      .db $A8
      .db $38
      .db $A9
      .db $40
      .db $3E
      .db $A8
      .db $36
      .db $A4
      .db $3C
      .db $AB
      .db $3A
      .db $A4
      .db $7E
      .db $A9
      .db $48
      .db $46
      .db $A8
      .db $3E
      .db $A9
      .db $46
      .db $44
      .db $A8
      .db $3C
      .db $A9
      .db $44
      .db $42
      .db $A8
      .db $3A
      .db $A4
      .db $42
      .db $AB
      .db $40
      .db $A4
      .db $7E
      .db $A4
      .db $42
      .db $40
      .db $42
      .db $40
      .db $42
      .db $40
      .db $42
      .db $40
      .db $44
      .db $42
      .db $44
      .db $42
      .db $44
      .db $42
      .db $44
      .db $42
      .db $46
      .db $44
      .db $46
      .db $44
      .db $46
      .db $44
      .db $46
      .db $44
      .db $48
      .db $46
      .db $48
      .db $46
      .db $48
      .db $46
      .db $48
      .db $46
MusicDataWart_Triangle:
      .db $84
      .db $3E
      .db $42
      .db $44
      .db $3E
      .db $42
      .db $44
      .db $3E
      .db $44
      .db $3E
      .db $42
      .db $44
      .db $3E
      .db $42
      .db $44
      .db $3E
      .db $44
      .db $3E
      .db $42
      .db $44
      .db $3E
      .db $42
      .db $44
      .db $3E
      .db $44
      .db $3E
      .db $42
      .db $44
      .db $3E
      .db $42
      .db $44
      .db $3E
      .db $44
      .db $3C
      .db $40
      .db $42
      .db $3C
      .db $40
      .db $42
      .db $3C
      .db $42
      .db $3C
      .db $40
      .db $42
      .db $3C
      .db $40
      .db $42
      .db $3C
      .db $42
      .db $3C
      .db $40
      .db $42
      .db $3C
      .db $40
      .db $42
      .db $3C
      .db $42
      .db $3C
      .db $40
      .db $42
      .db $3C
      .db $40
      .db $42
      .db $3C
      .db $42
      .db $84
      .db $3A
      .db $88
      .db $3A
      .db $3A
      .db $3A
      .db $84
      .db $3A
      .db $3C
      .db $88
      .db $3C
      .db $3C
      .db $3C
      .db $84
      .db $3C
      .db $3E
      .db $88
      .db $3E
      .db $3E
      .db $3E
      .db $84
      .db $3E
      .db $40
      .db $88
      .db $40
      .db $40
      .db $40
      .db $84
      .db $40

MusicDataMushroomBonusChance:
MusicDataMushroomBonusChance_Square2:
      .db $82
      .db $46
      .db $48
      .db $4A
      .db $4C
      .db $7E
      .db $56
      .db $88
      .db $52
      .db $00
MusicDataMushroomBonusChance_Square1:
      .db $82
      .db $3E
      .db $42
      .db $44
      .db $46
      .db $7E
      .db $50
      .db $88
      .db $4C

MusicDataGameOver:
MusicDataGameOver_Square2:
      .db $94
      .db $56
      .db $5A
      .db $60
      .db $3E
      .db $42
      .db $48
      .db $26
      .db $2A
      .db $98
      .db $30
      .db $26
      .db $30
      .db $00
MusicDataGameOver_Square1:
      .db $98
      .db $7E
      .db $94
      .db $30
      .db $98
      .db $7E
      .db $94
      .db $30
      .db $98
      .db $7E
      .db $30
      .db $3A
      .db $38
MusicDataGameOver_Triangle:
      .db $88
      .db $7E
      .db $89
      .db $60
      .db $48
      .db $88
      .db $30
      .db $3E
      .db $30

MusicDataBossBeaten:
MusicDataBossBeaten_Square2:
      .db $94
      .db $42
      .db $48
      .db $4C
      .db $42
      .db $48
      .db $4C
      .db $3E
      .db $42
      .db $50
      .db $3E
      .db $42
      .db $52
      .db $50
      .db $48
      .db $42
      .db $7E
      .db $3A
      .db $42
      .db $48
      .db $50
      .db $4C
      .db $3E
      .db $42
      .db $7E
      .db $30
      .db $7E
      .db $26
      .db $2A
      .db $7E
      .db $26
      .db $20
      .db $7E
      .db $98
      .db $18
      .db $26
      .db $30
      .db $7E
      .db $00
MusicDataBossBeaten_Square1:
      .db $88
      .db $7E
      .db $30
      .db $7E
      .db $30
      .db $7E
      .db $34
      .db $7E
      .db $38
      .db $7E
      .db $42
      .db $7E
      .db $46
      .db $48
      .db $94
      .db $3E
      .db $98
      .db $42
      .db $94
      .db $3E
      .db $98
      .db $38
      .db $30
      .db $7E
      .db $9A
      .db $48
MusicDataBossBeaten_Triangle:
      .db $88
      .db $3A
      .db $52
      .db $3C
      .db $54
      .db $3E
      .db $56
      .db $42
      .db $5A
      .db $4C
      .db $3A
      .db $3E
      .db $4C
      .db $48
      .db $7E
      .db $7E
      .db $7E
      .db $48
      .db $3E
      .db $30
      .db $7E

MusicDataCrystal:
MusicDataCrystal_Square2:
      .db $89
      .db $40
      .db $84
      .db $40
      .db $88
      .db $40
      .db $88
      .db $56
      .db $56
      .db $52
      .db $8B
      .db $50
      .db $00
MusicDataCrystal_Square1:
      .db $89
      .db $36
      .db $84
      .db $36
      .db $88
      .db $36
      .db $88
      .db $44
      .db $88
      .db $44
      .db $88
      .db $40
      .db $8B
      .db $3E
MusicDataCrystal_Triangle:
      .db $89
      .db $40
      .db $84
      .db $40
      .db $88
      .db $40
      .db $88
      .db $4E
      .db $4E
      .db $4A
      .db $8B
      .db $48

MusicDataDeath:
MusicDataDeath_Square2:
      .db $84
      .db $7E
      .db $82
      .db $4E
      .db $7E
      .db $46
      .db $3E
      .db $7E
      .db $3A
      .db $8A
      .db $38
      .db $00
MusicDataDeath_Square1:
      .db $84
      .db $7E
      .db $82
      .db $3E
      .db $7E
      .db $34
      .db $2E
      .db $7E
      .db $2A
      .db $8A
      .db $26
MusicDataDeath_Triangle:
      .db $84
      .db $7E
      .db $88
      .db $46
      .db $3E
      .db $8A
      .db $30


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
      .db $90
      .db $95
      .db $95
      .db $95
      .db $95
      .db $95
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $97
      .db $97
      .db $97
      .db $97
      .db $98
      .db $98

; Long square
; 50% duty cycle (square) with slight decay
InstrumentDVE_80_Short: ; $A1CD
      .db $90
      .db $92
      .db $94
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $96
      .db $97
      .db $97
      .db $97
      .db $97
      .db $98
      .db $98

; Short square
; 25% duty cycle with pronounced decay
InstrumentDVE_90_E0: ; $A1E4
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $52
      .db $53
      .db $54
      .db $55
      .db $56
      .db $57
      .db $58
      .db $59
      .db $5A
      .db $5B

; Short square
; 25% duty cycle with pronounced decay
InstrumentDVE_90_E0_Short: ; $A224
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $52
      .db $53
      .db $54
      .db $55
      .db $56
      .db $57
      .db $58
      .db $59
      .db $5A
      .db $5B

; Electric Piano
; 12.5% duty cycle with pronounced decay
InstrumentDVE_A0: ; $A23B
      .db $10
      .db $11
      .db $11
      .db $11
      .db $12
      .db $12
      .db $12
      .db $13
      .db $13
      .db $14
      .db $14
      .db $14
      .db $14
      .db $15
      .db $15
      .db $15
      .db $15
      .db $16
      .db $16
      .db $16
      .db $17
      .db $17
      .db $17
      .db $17
      .db $17
      .db $17
      .db $17
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $19
      .db $19
      .db $19
      .db $1A
      .db $1A
      .db $1B
      .db $1B
      .db $1C

; Electric Piano
; 12.5% duty cycle with pronounced decay
InstrumentDVE_A0_Short: ; $A27B
      .db $10
      .db $11
      .db $12
      .db $13
      .db $14
      .db $15
      .db $16
      .db $17
      .db $17
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $18
      .db $19
      .db $19
      .db $19
      .db $1A
      .db $1A
      .db $1B
      .db $1B
      .db $1C

; Organ
; 25% duty cycle with slight decay
InstrumentDVE_B0: ; $A293
      .db $51
      .db $52
      .db $52
      .db $52
      .db $52
      .db $53
      .db $53
      .db $53
      .db $53
      .db $53
      .db $53
      .db $53
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $55
      .db $55
      .db $55
      .db $55
      .db $55
      .db $55
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $55
      .db $55
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56
      .db $56

; Organ
; 25% duty cycle with slight decay
InstrumentDVE_B0_Short: ; $A2D3
      .db $51
      .db $52
      .db $52
      .db $52
      .db $52
      .db $53
      .db $53
      .db $53
      .db $53
      .db $53
      .db $53
      .db $53
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $55
      .db $55
      .db $56
      .db $56

; Strings
; 25% duty cycle with slow attack
InstrumentDVE_C0_Short: ; $A2EA
      .db $51
      .db $52
      .db $53
      .db $54
      .db $54
      .db $55
      .db $56
      .db $56
      .db $57
      .db $58
      .db $59
      .db $5A
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5A
      .db $59
      .db $58
      .db $56
      .db $55
      .db $55

; Strings
; 25% duty cycle with slow attack
InstrumentDVE_C0: ; $A301
      .db $51
      .db $52
      .db $52
      .db $51
      .db $52
      .db $52
      .db $52
      .db $53
      .db $53
      .db $53
      .db $53
      .db $53
      .db $53
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $55
      .db $55
      .db $55
      .db $55
      .db $55
      .db $56
      .db $56
      .db $56
      .db $57
      .db $57
      .db $57
      .db $57
      .db $57
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $59
      .db $59
      .db $59
      .db $59
      .db $5A
      .db $5A
      .db $5A
      .db $5A
      .db $5A
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5A
      .db $59
      .db $58
      .db $56
      .db $55
      .db $55

; Pluck
; 50% to -25% to 12.5% to 12.5% duty cycle with pronounced decay
InstrumentDVE_D0: ; $A341
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $52
      .db $53
      .db $54
      .db $55
      .db $56
      .db $57
      .db $58
      .db $19
      .db $DA
      .db $9B

; Pluck
; 50% to -25% to 12.5% to 12.5% duty cycle with pronounced decay
InstrumentDVE_D0_Short: ; $A381
      .db $50
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $51
      .db $52
      .db $53
      .db $54
      .db $55
      .db $56
      .db $57
      .db $58
      .db $19
      .db $DA
      .db $9B

IFNDEF PROTOTYPE_MUSIC
; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0_Short: ; $A398
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $51
      .db $51
      .db $51
      .db $51
      .db $52
      .db $52
      .db $52
      .db $53
      .db $53
      .db $54
      .db $55

; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0: ; $A3AF
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $50
      .db $51
      .db $51
      .db $51
      .db $51
      .db $52
      .db $52
      .db $52
      .db $53
      .db $53
      .db $54
      .db $55
ENDIF

IFDEF PROTOTYPE_MUSIC
; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0_Short:
      .db $54
      .db $54
      .db $55
      .db $56
      .db $56
      .db $57
      .db $58
      .db $59
      .db $5A
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5D

; Soft pluck
; 25% duty cycle with pronounced decay
InstrumentDVE_F0:
      .db $51
      .db $51
      .db $51
      .db $51
      .db $52
      .db $52
      .db $52
      .db $53
      .db $53
      .db $53
      .db $53
      .db $53
      .db $53
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $54
      .db $55
      .db $55
      .db $55
      .db $55
      .db $55
      .db $56
      .db $56
      .db $56
      .db $57
      .db $57
      .db $57
      .db $57
      .db $57
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $58
      .db $59
      .db $59
      .db $59
      .db $59
      .db $5A
      .db $5A
      .db $5A
      .db $5A
      .db $5A
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5B
      .db $5C
      .db $5C
      .db $5C
      .db $5D
ENDIF
