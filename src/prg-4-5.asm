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
	LDA #$FF
	STA JOY2
	LDA StackArea
	CMP #Stack100_Pause
	BNE ProcessMusicAndSfxQueues

	LDA #%00001100 ; Mute the two square channels
	STA SND_CHN
	; You would think you could skip processing,
	; since if the game is paused, nothing should
	; be setting new music or whatever.
	;
	; You would be correct, except for the suicide code!
	; That sets MusicQueue2.
	;
	; If not for processing it, the music would not
	; change (or stop) when you used the code. Welp!
	JMP ProcessOnlyMusicQueue2


ProcessMusicAndSfxQueues:
	JSR ProcessSoundEffectQueue2

	JSR ProcessSoundEffectQueue1

	JSR ProcessSoundEffectQueue3

	JSR ProcessDPCMQueue

ProcessOnlyMusicQueue2:
	JSR ProcessMusicQueue

	; Reset queues
	LDA #$00
	STA SoundEffectQueue2
	STA MusicQueue2
	STA SoundEffectQueue1
	STA DPCMQueue
	STA MusicQueue1
	STA SoundEffectQueue3
	RTS


ProcessSoundEffectQueue2_Jump:
	LDA #$42
	LDX #$82
	LDY #$A8
	JSR PlaySquare1Sweep

	LDA #$22
	STA SoundEffectTimer2

ProcessSoundEffectQueue2_JumpPart2:
	LDA SoundEffectTimer2
	CMP #$20
	BNE ProcessSoundEffectQueue2_JumpPart3

	LDX #$DF
	LDY #$F6
	BNE ProcessSoundEffectQueue2_SetSquare1ThenDecrementTimer

ProcessSoundEffectQueue2_JumpPart3:
	CMP #$1A
	BNE ProcessSoundEffectQueue2_ThenDecrementTimer

	LDX #$C1
	LDY #$BC

ProcessSoundEffectQueue2_SetSquare1ThenDecrementTimer:
	JSR SetSquare1VolumeAndSweep

	BNE ProcessSoundEffectQueue2_ThenDecrementTimer

ProcessSoundEffectQueue2_CoinGet:
	LDA #$35
	LDX #$8D
	STA SoundEffectTimer2

	LDY #$7F
	LDA #$5E
	JSR PlaySquare1Sweep

ProcessSoundEffectQueue2_CoinGetPart2:
	LDA SoundEffectTimer2
	CMP #$30
	BNE ProcessSoundEffectQueue2_ThenDecrementTimer

	LDA #$54
	STA SQ1_LO

ProcessSoundEffectQueue2_ThenDecrementTimer:
	BNE ProcessSoundEffectQueue2_DecrementTimer

ProcessSoundEffectQueue2:
	LDA SoundEffectPlaying2
	CMP #SoundEffect2_Climbing
	BEQ ProcessSoundEffectQueue2_DecrementTimer

	LDY SoundEffectQueue2
	BEQ ProcessSoundEffectQueue2_None

	STY SoundEffectPlaying2
	LSR SoundEffectQueue2
	BCS ProcessSoundEffectQueue2_Jump

	LSR SoundEffectQueue2
	BCS ProcessSoundEffectQueue2_Climbing

	LSR SoundEffectQueue2
	BCS ProcessSoundEffectQueue2_CoinGet

	LSR SoundEffectQueue2
	BCS ProcessSoundEffectQueue2_Shrinking

	LSR SoundEffectQueue2
	BCS ProcessSoundEffectQueue2_IntroFallSlide

	LSR SoundEffectQueue2
	BCS ProcessSoundEffectQueue2_Growing

ProcessSoundEffectQueue2_None:
	LDA SoundEffectPlaying2
	BEQ ProcessSoundEffectQueue2_NoneExit

	; Jumping
	LSR A
	BCS ProcessSoundEffectQueue2_JumpPart2

	; Climbing
	LSR A
	BCS ProcessSoundEffectQueue2_DecrementTimer

	; CoinGet
	LSR A
	BCS ProcessSoundEffectQueue2_CoinGetPart2

	; Shrinking
	LSR A
	BCS ProcessSoundEffectQueue2_ShrinkingPart2

	; IntroFallSlide
	LSR A
	BCS ProcessSoundEffectQueue2_DecrementTimer

	; Growing
	LSR A
	BCS ProcessSoundEffectQueue2_GrowingPart2

ProcessSoundEffectQueue2_NoneExit:
	RTS

ProcessSoundEffectQueue2_IntroFallSlide:
	LDA #$60
	LDY #$A5
	BNE ProcessSoundEffectQueue2_SingleSweep

ProcessSoundEffectQueue2_Climbing:
	STY SoundEffectPlaying2
	LDA #$05
	LDY #$9C

; A = timer
; Y = sweep
ProcessSoundEffectQueue2_SingleSweep:
	LDX #$9E
	STA SoundEffectTimer2
	LDA #$60
	JSR PlaySquare1Sweep

ProcessSoundEffectQueue2_DecrementTimer:
	DEC SoundEffectTimer2
	BNE ProcessSoundEffectQueue2_Exit

	LDX #%00001110
	STX SND_CHN
	LDX #%00001111
	STX SND_CHN
	LDX #$00
	STX SoundEffectPlaying2

ProcessSoundEffectQueue2_Exit:
	RTS

ProcessSoundEffectQueue2_Shrinking:
	LDA #$2F
	STA SoundEffectTimer2

ProcessSoundEffectQueue2_ShrinkingPart2:
	LDA SoundEffectTimer2
	LSR A
	BCS ProcessSoundEffectQueue2_ShrinkingPart3

	LSR A
	BCS ProcessSoundEffectQueue2_ShrinkingPart3

	AND #$02
	BEQ ProcessSoundEffectQueue2_ShrinkingPart3

	LDY #$91
	LDX #$9A
	LDA #$68
	JSR PlaySquare1Sweep

ProcessSoundEffectQueue2_ShrinkingPart3:
	JMP ProcessSoundEffectQueue2_DecrementTimer

ProcessSoundEffectQueue2_Growing:
	LDA #$36
	STA SoundEffectTimer2

ProcessSoundEffectQueue2_GrowingPart2:
	LDA SoundEffectTimer2
	LSR A
	BCS ProcessSoundEffectQueue2_DecrementTimer

	TAY
	LDA MushroomSoundData - 1, Y
	LDX #$5D
	LDY #$7F
	JSR PlaySquare1Sweep

	JMP ProcessSoundEffectQueue2_DecrementTimer

MushroomSoundData:
	.db $6A, $74, $6A, $64, $5C, $52, $5C, $52, $4C, $44, $66, $70, $66, $60, $58, $4E
	.db $58, $4E, $48, $40, $56, $60, $56, $50, $48, $3E, $48, $3E, $38, $30 ; $10


ProcessSoundEffectQueue1:
	LDA SoundEffectQueue1
	BEQ ProcessSoundEffectQueue1_None

	CMP #SoundEffect1_StopwatchTick
	BNE ProcessSoundEffectQueue1_Part2

	LDX SoundEffectPlaying1
	BEQ ProcessSoundEffectQueue1_Part2

ProcessSoundEffectQueue1_None:
	LDA SoundEffectPlaying1
	BNE ProcessSoundEffectQueue1_Part3

	RTS

ProcessSoundEffectQueue1_Part2:
	STA SoundEffectPlaying1
	LDY #$00

ProcessSoundEffectQueue1_PointerLoop:
	INY
	LSR A
	BCC ProcessSoundEffectQueue1_PointerLoop

	LDA SoundEffectPointers - 1, Y
	STA SoundEffect1DataOffset

ProcessSoundEffectQueue1_Part3:
	LDY SoundEffect1DataOffset
	INC SoundEffect1DataOffset
	LDA SoundEffectPointers, Y
	BMI ProcessSoundEffectQueue1_Patch

	BNE ProcessSoundEffectQueue1_Note

	; if it was $00, we're at the end of the data for this sound effect
	LDX #$90
	STX SQ2_VOL
	LDX #$18
	STX SQ2_HI
	LDX #$00
	STX SQ2_LO
	STX SoundEffectPlaying1
	RTS

ProcessSoundEffectQueue1_Patch:
	STA SQ2_VOL
	LDY SoundEffect1DataOffset
	INC SoundEffect1DataOffset
	LDA SoundEffectPointers, Y

ProcessSoundEffectQueue1_Note:
	CMP #$7E
	BEQ ProcessSoundEffectQueue1_Exit

	JSR PlaySquare2Note

ProcessSoundEffectQueue1_Exit:
	LDA #$7F
	STA SQ2_SWEEP

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
	LDA #$02
	STA SoundEffectTimer3

ProcessSoundEffectQueue3_ShortNoisePart2:
	LDA #$1A
	STA NOISE_VOL
	LDA #$04
	STA NOISE_LO
	STA NOISE_HI
	BNE ProcessSoundEffectQueue3_DecrementTimer

ProcessSoundEffectQueue3:
	LDY SoundEffectQueue3
	BEQ ProcessSoundEffectQueue3_Part2

	STY SoundEffectPlaying3
	LSR SoundEffectQueue3
	BCS ProcessSoundEffectQueue3_ShortNoise

	LSR SoundEffectQueue3
	BCS ProcessSoundEffectQueue3_Rumble

	LSR SoundEffectQueue3
	BCS ProcessSoundEffectQueue3_Rumble

ProcessSoundEffectQueue3_Part2:
	LDA SoundEffectPlaying3
	LSR A
	BCS ProcessSoundEffectQueue3_ShortNoisePart2

	LSR A
	BCS ProcessSoundEffectQueue3_RumblePart2

	LSR A
	BCS ProcessSoundEffectQueue3_RumblePart2

	RTS

ProcessSoundEffectQueue3_Rumble:
	LDA #$7F
	STA SoundEffectTimer3

ProcessSoundEffectQueue3_RumblePart2:
	LDY SoundEffectTimer3
	LDA ProcessMusicQueue, Y ; weird, but i guess that's one way to get "random" noise
	ORA #$0C
	STA NOISE_LO
	LDA SoundEffectTimer3
	LSR A
	LSR A
	LSR A
	AND #$1F
	ORA #$10
	STA NOISE_VOL
	LDA #$18
	STA NOISE_HI

ProcessSoundEffectQueue3_DecrementTimer:
	DEC SoundEffectTimer3
	BNE ProcessSoundEffectQueue3_Exit

	LDX #$07
	STX SND_CHN
	LDX #$0F
	STX SND_CHN
	LDX #$00
	STX SoundEffectPlaying3

ProcessSoundEffectQueue3_Exit:
	RTS


ProcessDPCMQueue:
	LDA DPCMQueue
	BNE ProcessDPCMQueue_Part2

	LDA DPCMPlaying
	BEQ ProcessDPCMQueue_None

	DEC DPCMTimer
	BNE ProcessDPCMQueue_Exit

ProcessDPCMQueue_None:
	LDA #$00
	STA DPCMPlaying
	LDA #%00001111
	STA SND_CHN

ProcessDPCMQueue_Exit:
	RTS

ProcessDPCMQueue_Part2:
	STA DPCMPlaying
	LDY #$00

ProcessDPCMQueue_PointerLoop:
	INY
	LSR A
	BCC ProcessDPCMQueue_PointerLoop

	LDA DMCFreqTable - 1, Y
	STA DMC_FREQ

	LDA DMCStartTable - 1, Y
	STA DMC_START
	LDA DMCLengthTable - 1, Y
	STA DMC_LEN
	LDA #$A0
	STA DPCMTimer
	LDA #%00001111
	STA SND_CHN
	LDA #%00011111
	STA SND_CHN
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
	JMP ProcessMusicQueue_ReadNoteData

ProcessMusicQueue_StopMusic:
	JMP StopMusic

ProcessMusicQueue:
	LDA MusicQueue2
	BMI ProcessMusicQueue_StopMusic

	CMP #Music2_EndingAndCast
	BEQ ProcessMusicQueue_EndingAndCast

	LDA MusicQueue2
	BNE ProcessMusicQueue_Part2

	LDA MusicQueue1
	BNE ProcessMusicQueue_MusicQueue1

	LDA MusicPlaying2
	ORA MusicPlaying1
	BNE ProcessMusicQueue_ThenReadNoteData

	RTS

ProcessMusicQueue_EndingAndCast:
	STA MusicPlaying2
	LDY #$00
	STY MusicPlaying1
	LDY #$08 ; index of ending music pointer
	BNE ProcessMusicQueue_ReadFirstPointer

ProcessMusicQueue_MusicQueue1:
	STA MusicPlaying1
	LDY #$00
	STY MusicPlaying2
	LDY #$FF

ProcessMusicQueue_FirstPointerLoop:
	INY
	LSR A
	BCC ProcessMusicQueue_FirstPointerLoop

ProcessMusicQueue_ReadFirstPointer:
	LDA MusicPointersFirstPart, Y
	STA MusicPointerFirstPart
	LDA MusicPointersEndPart, Y
	CLC
	ADC #$02
	STA MusicPointerEndPart
	LDA MusicPointersLoopPart, Y
	STA MusicPointerLoopPart
	LDA MusicPointerFirstPart

ProcessMusicQueue_SetCurrentPart:
	STA MusicPointerCurrentPart

ProcessMusicQueue_SetNextPart:
	INC MusicPointerCurrentPart
	LDY MusicPointerCurrentPart
	CPY MusicPointerEndPart
	BNE ProcessMusicQueue_ReadHeader

	LDA MusicPointerLoopPart
	BNE ProcessMusicQueue_SetCurrentPart

	JMP StopMusic

ProcessMusicQueue_Part2:
	STA MusicPlaying2
	LDY MusicPlaying1
	STY MusicResume1
	LDY #$00
	STY MusicPlaying1

ProcessMusicQueue_PointerLoop:
	INY
	LSR A
	BCC ProcessMusicQueue_PointerLoop

ProcessMusicQueue_ReadHeader:
	LDA MusicPartPointers - 1, Y
	TAY
	LDA MusicPartPointers, Y
	STA MusicTempoSetting
	LDA MusicPartPointers + 1, Y
	STA CurrentMusicPointer
	LDA MusicPartPointers + 2, Y
	STA CurrentMusicPointer + 1
	LDA MusicPartPointers + 3, Y
	STA CurrentMusicTriangleOffset
	LDA MusicPartPointers + 4, Y
	STA CurrentMusicSquare1Offset
	LDA MusicPartPointers + 5, Y
	STA CurrentMusicNoiseOffset
	STA CurrentMusicNoiseStartOffset
IFDEF PROTOTYPE_MUSIC
	LDA MusicPartPointers + 6, Y
ENDIF
	STA CurrentMusicDPCMOffset
	STA CurrentMusicDPCMStartOffset
	LDA #$01
	STA MusicSquare2NoteLength
	STA MusicSquare1NoteLength
	STA MusicTriangleNoteLength
	STA MusicNoiseNoteLength
	STA MusicDPCMNoteLength
	LDA #$00
	STA MusicSquare1NoteOffset
	STA MusicSquare1NoteSweep

	LDA #%00001011
	STA SND_CHN
	LDA #%00001111
	STA SND_CHN

ProcessMusicQueue_ReadNoteData:
	DEC MusicSquare2NoteLength
	BNE ProcessMusicQueue_Square2SustainNote

	LDY MusicSquare1NoteOffset
	INC MusicSquare1NoteOffset
	LDA (CurrentMusicPointer), Y
	BEQ ProcessMusicQueue_EndOfSegment

	BPL ProcessMusicQueue_Square2Note

	BNE ProcessMusicQueue_Square2Patch

ProcessMusicQueue_EndOfSegment:
	LDA MusicPlaying1
	BNE ProcessMusicQueue_ThenSetNextPart

	LDA MusicPlaying2
	CMP #Music2_EndingAndCast
	BEQ ProcessMusicQueue_ThenSetNextPart

	AND #Music1_Overworld | Music1_Inside | Music1_Subspace
	BEQ StopMusic

	LDA MusicResume1
	BNE ProcessMusicQueue_ResumeMusicQueue1

StopMusic:
	LDA #$00
	STA MusicPlaying2
	STA MusicPlaying1
	STA SND_CHN
	LDX #%00001111
	STX SND_CHN
	RTS

ProcessMusicQueue_ThenSetNextPart:
	JMP ProcessMusicQueue_SetNextPart

ProcessMusicQueue_ResumeMusicQueue1:
	JMP ProcessMusicQueue_MusicQueue1

ProcessMusicQueue_Square2Patch:
	TAX
	AND #$F0
	STA MusicSquare2Patch
	TXA
	JSR ProcessMusicQueue_PatchNoteLength

	STA MusicSquare2NoteStartLength
	LDY MusicSquare1NoteOffset
	INC MusicSquare1NoteOffset
	LDA (CurrentMusicPointer), Y

ProcessMusicQueue_Square2Note:
	LDX SoundEffectPlaying1
	BNE ProcessMusicQueue_Square2ContinueNote

	JSR PlaySquare2Note

	TAY
	BNE ProcessMusicQueue_Square2StartNote

	LDA UNINITIALIZED_MusicSquare2Volume
	JMP ProcessMusicQueue_Square2UpdateNoteOffset

ProcessMusicQueue_Square2StartNote:
	LDA MusicSquare2NoteStartLength
	LDX UNINITIALIZED_MusicSquare2Volume ; always overridden in the following subroutine...?
	JSR SetInstrumentStartOffset

ProcessMusicQueue_Square2UpdateNoteOffset:
	STA MusicSquare2InstrumentOffset
	JSR SetSquare2VolumeAndSweep

ProcessMusicQueue_Square2ContinueNote:
	LDA MusicSquare2NoteStartLength
	STA MusicSquare2NoteLength

ProcessMusicQueue_Square2SustainNote:
	LDX SoundEffectPlaying1
	BNE ProcessMusicQueue_Square1

	LDY MusicSquare2InstrumentOffset
	BEQ ProcessMusicQueue_LoadSquare2Instrument

	DEC MusicSquare2InstrumentOffset

ProcessMusicQueue_LoadSquare2Instrument:
	LDA MusicSquare2NoteStartLength
	LDX MusicSquare2Patch
	JSR LoadSquareInstrumentDVE

	STA SQ2_VOL
	LDX #$7F
	STX SQ2_SWEEP

ProcessMusicQueue_Square1:
	DEC MusicSquare1NoteLength
	BNE ProcessMusicQueue_Square1SustainNote

ProcessMusicQueue_Square1Patch:
	LDY CurrentMusicSquare1Offset
	INC CurrentMusicSquare1Offset
	LDA (CurrentMusicPointer), Y
	BPL ProcessMusicQueue_Square1AfterPatch

	TAX
	AND #$F0
	STA MusicSquare1Patch
	TXA
	JSR ProcessMusicQueue_PatchNoteLength

	STA MusicSquare1NoteStartLength
	LDY CurrentMusicSquare1Offset
	INC CurrentMusicSquare1Offset
	LDA (CurrentMusicPointer), Y

ProcessMusicQueue_Square1AfterPatch:
	TAY
	BNE ProcessMusicQueue_Square1Note

	LDA #$83
	STA SQ1_VOL
	LDA #$94
	STA SQ1_SWEEP
	STA MusicSquare1NoteSweep
	BNE ProcessMusicQueue_Square1Patch

ProcessMusicQueue_Square1Note:
	LDY SoundEffectPlaying2
	BNE ProcessMusicQueue_Square1ContinueNote

	JSR PlaySquare1Note

	BNE ProcessMusicQueue_Square1StartNote

	LDA UNINITIALIZED_MusicSquare2Volume
	JMP ProcessMusicQueue_Square1UpdateNoteOffset

ProcessMusicQueue_Square1StartNote:
	LDA MusicSquare1NoteStartLength
	LDX UNINITIALIZED_MusicSquare1Volume ; always overridden in the following subroutine...?
	JSR SetInstrumentStartOffset

ProcessMusicQueue_Square1UpdateNoteOffset:
	STA MusicSquare1InstrumentOffset
	JSR SetSquare1VolumeAndSweep

ProcessMusicQueue_Square1ContinueNote:
	LDA MusicSquare1NoteStartLength
	STA MusicSquare1NoteLength

ProcessMusicQueue_Square1SustainNote:
	LDA SoundEffectPlaying2
	BNE ProcessMusicQueue_Triangle

	LDY MusicSquare1InstrumentOffset
	BEQ ProcessMusicQueue_Square1AfterDecrementInstrumentOffset

	DEC MusicSquare1InstrumentOffset

ProcessMusicQueue_Square1AfterDecrementInstrumentOffset:
	LDA MusicSquare1NoteStartLength
	LDX MusicSquare1Patch
	JSR LoadSquareInstrumentDVE

	STA SQ1_VOL
	LDA MusicSquare1NoteSweep
	BNE ProcessMusicQueue_Square1Sweep

	LDA #$7F

ProcessMusicQueue_Square1Sweep:
	STA SQ1_SWEEP

ProcessMusicQueue_Triangle:
	LDA CurrentMusicTriangleOffset
	BEQ ProcessMusicQueue_NoiseDPCM

	DEC MusicTriangleNoteLength
	BNE ProcessMusicQueue_NoiseDPCM

	LDY CurrentMusicTriangleOffset
	INC CurrentMusicTriangleOffset
	LDA (CurrentMusicPointer), Y
	BEQ ProcessMusicQueue_TriangleSetLength

	BPL ProcessMusicQueue_TriangleNote

	JSR ProcessMusicQueue_PatchNoteLength

	STA MusicTriangleNoteStartLength
	LDA #$1F
	STA TRI_LINEAR
	LDY CurrentMusicTriangleOffset
	INC CurrentMusicTriangleOffset
	LDA (CurrentMusicPointer), Y
	BEQ ProcessMusicQueue_TriangleSetLength

ProcessMusicQueue_TriangleNote:
	JSR PlayTriangleNote

	LDX MusicTriangleNoteStartLength
	STX MusicTriangleNoteLength
	TXA
	CMP #$0A
	BCC ProcessMusicQueue_TriangleNoteShort

	CMP #$1E
	BCS ProcessMusicQueue_TriangleNoteLong

ProcessMusicQueue_TriangleNoteMedium:
	LDA #$24
	BNE ProcessMusicQueue_TriangleSetLength

ProcessMusicQueue_TriangleNoteShort:
	LDA #$18
	BNE ProcessMusicQueue_TriangleSetLength

ProcessMusicQueue_TriangleNoteLong:
	LDA #$6F

ProcessMusicQueue_TriangleSetLength:
	STA TRI_LINEAR

ProcessMusicQueue_NoiseDPCM:
IFNDEF PROTOTYPE_MUSIC
	LDA MusicPlaying1
	AND #Music1_Inside | Music1_Invincible
	BNE ProcessMusicQueue_DPCM
ENDIF

ProcessMusicQueue_Noise:
	LDA CurrentMusicNoiseOffset
	BEQ ProcessMusicQueue_ThenNoiseEnd

	DEC MusicNoiseNoteLength
	BNE ProcessMusicQueue_ThenNoiseEnd

ProcessMusicQueue_NoiseByte:
	LDY CurrentMusicNoiseOffset
	INC CurrentMusicNoiseOffset
	LDA (CurrentMusicPointer), Y
	BEQ ProcessMusicQueue_NoiseLoopSegment

	BPL ProcessMusicQueue_NoiseNote

	JSR ProcessMusicQueue_PatchNoteLength

	STA MusicNoiseNoteStartLength
	LDY CurrentMusicNoiseOffset
	INC CurrentMusicNoiseOffset
	LDA (CurrentMusicPointer), Y
	BEQ ProcessMusicQueue_NoiseLoopSegment

ProcessMusicQueue_NoiseNote:
	LSR A
	TAY
	LDA NoiseVolTable, Y
	STA NOISE_VOL
	LDA NoiseLoTable, Y
	STA NOISE_LO
	LDA NoiseHiTable, Y
	STA NOISE_HI
	LDA MusicNoiseNoteStartLength
	STA MusicNoiseNoteLength

ProcessMusicQueue_ThenNoiseEnd:
	JMP ProcessMusicQueue_NoiseEnd

ProcessMusicQueue_NoiseLoopSegment:
	LDA CurrentMusicNoiseStartOffset
	STA CurrentMusicNoiseOffset
	JMP ProcessMusicQueue_NoiseByte

ProcessMusicQueue_NoiseEnd:
	LDA MusicPlaying1
IFNDEF PROTOTYPE_MUSIC
	AND #Music1_Inside | Music1_Invincible
ENDIF
IFDEF PROTOTYPE_MUSIC
	AND #Music1_Inside
ENDIF
	BNE ProcessMusicQueue_DPCM

	RTS

ProcessMusicQueue_DPCM:
	LDA CurrentMusicDPCMOffset
	BEQ ProcessMusicQueue_DPCMEnd

	DEC MusicDPCMNoteLength
	BNE ProcessMusicQueue_DPCMEnd

ProcessMusicQueue_DPCMByte:
	LDY CurrentMusicDPCMOffset
	INC CurrentMusicDPCMOffset
	LDA (CurrentMusicPointer), Y
	BEQ ProcessMusicQueue_DPCMLoopSegment

	BPL ProcessMusicQueue_DPCMNote

	JSR ProcessMusicQueue_PatchNoteLength

	STA MusicDPCMNoteStartLength
	LDY CurrentMusicDPCMOffset
	INC CurrentMusicDPCMOffset
	LDA (CurrentMusicPointer), Y
	BEQ ProcessMusicQueue_DPCMLoopSegment

ProcessMusicQueue_DPCMNote:
	ASL A
	STA DPCMQueue
	JSR ProcessDPCMQueue

	LDA MusicDPCMNoteStartLength
	STA MusicDPCMNoteLength

ProcessMusicQueue_DPCMEnd:
	RTS

ProcessMusicQueue_DPCMLoopSegment:
	LDA CurrentMusicDPCMStartOffset
	STA CurrentMusicDPCMOffset
	JMP ProcessMusicQueue_DPCMByte


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
	AND #$F
	CLC
	ADC MusicTempoSetting
	TAY
	LDA NoteLengthTable, Y
	RTS

; Input
;   A = note start length, >= $13 for table A, < $13 for instrument table B
; Ouput
;   A = starting instrument offset ($16 for short, $3F for long)
;   X = duty/volume/envelope ($82)
;   Y = sweep ($7F)
;
SetInstrumentStartOffset:
	CMP #$13
	BCC SetInstrumentStartOffset_Short
	LDA #$3F
	BNE SetInstrumentStartOffset_Exit
SetInstrumentStartOffset_Short:
	LDA #$16
SetInstrumentStartOffset_Exit:
	LDX #$82
	LDY #$7F
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
	CPX #$90
	BEQ LoadSquareInstrumentDVE_90_E0

	CPX #$E0
	BEQ LoadSquareInstrumentDVE_90_E0

	CPX #$A0
	BEQ LoadSquareInstrumentDVE_A0

	CPX #$B0
	BEQ LoadSquareInstrumentDVE_B0

	CPX #$C0
	BEQ LoadSquareInstrumentDVE_C0

	CPX #$D0
	BEQ LoadSquareInstrumentDVE_D0

	CPX #$F0
	BEQ LoadSquareInstrumentDVE_F0

LoadSquareInstrumentDVE_80:
	CMP #$13
	BCC LoadSquareInstrumentDVE_80_Short
	LDA InstrumentDVE_80, Y
	BNE LoadSquareInstrumentDVE_80_Exit
LoadSquareInstrumentDVE_80_Short:
	LDA InstrumentDVE_80_Short, Y
LoadSquareInstrumentDVE_80_Exit:
	RTS

LoadSquareInstrumentDVE_90_E0:
	CMP #$13
	BCC LoadSquareInstrumentDVE_90_E0_Short
	LDA InstrumentDVE_90_E0, Y
	BNE LoadSquareInstrumentDVE_90_E0_Exit
LoadSquareInstrumentDVE_90_E0_Short:
	LDA InstrumentDVE_90_E0_Short, Y
LoadSquareInstrumentDVE_90_E0_Exit:
	RTS

LoadSquareInstrumentDVE_A0:
	CMP #$13
	BCC LoadSquareInstrumentDVE_A0_Short
	LDA InstrumentDVE_A0, Y
	BNE LoadSquareInstrumentDVE_A0_Exit
LoadSquareInstrumentDVE_A0_Short:
	LDA InstrumentDVE_A0_Short, Y
LoadSquareInstrumentDVE_A0_Exit:
	RTS

LoadSquareInstrumentDVE_B0:
	CMP #$13
	BCC LoadSquareInstrumentDVE_B0_Short
	LDA InstrumentDVE_B0, Y
	BNE LoadSquareInstrumentDVE_B0_Exit
LoadSquareInstrumentDVE_B0_Short:
	LDA InstrumentDVE_B0_Short, Y
LoadSquareInstrumentDVE_B0_Exit:
	RTS

LoadSquareInstrumentDVE_C0:
	CMP #$13
	BCC LoadSquareInstrumentDVE_C0_Short
	LDA InstrumentDVE_C0, Y
	BNE LoadSquareInstrumentDVE_C0_Exit
LoadSquareInstrumentDVE_C0_Short:
	LDA InstrumentDVE_C0_Short, Y
LoadSquareInstrumentDVE_C0_Exit:
	RTS

LoadSquareInstrumentDVE_F0:
	CMP #$13
	BCC LoadSquareInstrumentDVE_F0_Short
	LDA InstrumentDVE_F0, Y
	BNE LoadSquareInstrumentDVE_F0_Exit
LoadSquareInstrumentDVE_F0_Short:
	LDA InstrumentDVE_F0_Short, Y
LoadSquareInstrumentDVE_F0_Exit:
	RTS

LoadSquareInstrumentDVE_D0:
	CMP #$13
	BCC LoadSquareInstrumentDVE_D0_Short
	LDA InstrumentDVE_D0, Y
	BNE LoadSquareInstrumentDVE_D0_Exit
LoadSquareInstrumentDVE_D0_Short:
	LDA InstrumentDVE_D0_Short, Y
LoadSquareInstrumentDVE_D0_Exit:
	RTS


; Sets volume/sweep on Square 1 channel
;
; Input
;   X = duty/volume/envelope
;   Y = sweep
SetSquare1VolumeAndSweep:
	STY SQ1_SWEEP
	STX SQ1_VOL
	RTS

; Sets volume/sweep on Square 2 channel
;
; Input
;   X = duty/volume/envelope
;   Y = sweep
SetSquare2VolumeAndSweep:
	STX SQ2_VOL
	STY SQ2_SWEEP
	RTS

; Sets volume/sweep on Square 1 channel and plays a note
;
; Input
;   A = note
;   X = duty/volume/envelope
;   Y = sweep
PlaySquare1Sweep:
	STX SQ1_VOL
	STY SQ1_SWEEP

; Play a note on the Square 1 channel
;
; Input
;   A = note
PlaySquare1Note:
	LDX #$00

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
	CMP #$7E
	BNE PlayNote_NotRest

	LDA #$10
	STA SQ1_VOL, X
	LDA #$00
	RTS

PlayNote_NotRest:
	LDY #$01
	STY NextOctave
	PHA
	TAY
	BMI PlayNote_LoadFrequencyData

PlayNote_IncrementOctave:
	INC NextOctave
	SEC
	SBC #$18
	BPL PlayNote_IncrementOctave

PlayNote_LoadFrequencyData:
	CLC
	ADC #$18
	TAY
	LDA NoteFrequencyData, Y
	STA NextFrequencyLo
	LDA NoteFrequencyData + 1, Y
	STA NextFrequencyHi

PlayNote_FrequencyOctaveLoop:
	LSR NextFrequencyHi
	ROR NextFrequencyLo
	DEC NextOctave
	BNE PlayNote_FrequencyOctaveLoop

	PLA
	CMP #$38
	BCC PlayNote_CheckSquareChorus

	; tweak the frequency for notes >= $38
	DEC NextFrequencyLo

;
; Square 2 plays slightly detuned when Square 1 is using instrument E0
;
; This can be used to achieve a honky tonk piano effect, which is used for the
; title screen as well as the bridge of the overworld theme.
;
PlayNote_CheckSquareChorus:
	TXA
	CMP #APUOffset_Square2
	BNE PlayNote_SetFrequency

	LDA MusicSquare1Patch
	CMP #$E0
	BEQ PlayNote_SetFrequency_Square2Detuned

PlayNote_SetFrequency:
	LDA NextFrequencyLo
	STA SQ1_LO, X
	STA UNUSED_MusicSquare1Lo, X ; unused?
	LDA NextFrequencyHi
	ORA #$08
	STA SQ1_HI, X
	RTS

PlayNote_SetFrequency_Square2Detuned:
	LDA NextFrequencyLo
	SEC
	SBC #$02
	STA SQ2_LO
	STA UNINITIALIZED_MusicSquare2Lo ; unused?
	LDA NextFrequencyHi
	ORA #$08
	STA SQ2_HI
	RTS

; (not referenced)
; Sets volume/sweep on Square 2 channel and plays a note
;
; Input
;   A = note
;   X = duty/volume/envelope
;   Y = sweep
PlaySquare2Sweep:
	STX SQ2_VOL
	STY SQ2_SWEEP

; Play a note on the Square 2 channel
;
; Input
;   A = note
PlaySquare2Note:
	LDX #APUOffset_Square2
	BNE PlayNote

; Play a note on the Triangle channel
;
; Input
;   A = note
PlayTriangleNote:
	LDX #APUOffset_Triangle
	BNE PlayNote

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
; $x7: 1/2 note triplet (rounding up)
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
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $03, $03, $04, $04, $06, $09, $08, $08, $0C, $12, $18, $24, $30

NoteLengthTable_257bpm: ; rounded
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $03, $04, $05, $04, $07, $0A, $09, $0A, $0E, $15, $1C, $2A, $38
	.db $0B ; junk?

; Title Screen
NoteLengthTable_225bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $04, $04, $05, $06, $08, $0C, $0B, $0A, $10, $18, $20, $30, $40

; Overworld
; Boss
; Wart
; Death
; Subspace
NoteLengthTable_200bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $04, $05, $06, $06, $09, $0D, $0C, $0C, $12, $1B, $24, $36, $48
	.db $0E, $03 ; junk?

NoteLengthTable_180bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $05, $05, $07, $06, $0A, $0F, $0D, $0E, $14, $1E, $28, $3C, $50

NoteLengthTable_164bpm: ; rounded, 163.64 bpm
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $05, $06, $07, $08, $0B, $10, $0F, $0E, $16, $21, $2C, $42, $58
	.db $11 ; junk?

; Bonus Chance
NoteLengthTable_150bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $06, $06, $08, $08, $0C, $12, $10, $10, $18, $24, $30, $48, $60
	.db $02 ; junk?

NoteLengthTable_138bpm: ; rounded, 138.46 bpm
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $06, $07, $09, $08, $0D, $13, $11, $12, $1A, $27, $34, $4E, $68
	.db $14 ; junk?

; Underground
; Ending
NoteLengthTable_129bpm: ; rounded, 128.57
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $07, $07, $09, $0A, $0E, $15, $13, $12, $1C, $2A, $38, $54, $70
	.db $03, $04 ; junk?

NoteLengthTable_120bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $07, $08, $0A, $0A, $0F, $16, $14, $14, $1E, $2D, $3C, $5A, $78
	.db $17 ; junk?

NoteLengthTable_112bpm: ; rounded, 112.5 bpm
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $08, $08, $0B, $0A, $10, $18, $15, $16, $20, $30, $40, $60, $80

NoteLengthTable_106bpm: ; rounded, 105.88 bpm
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
	.db $08, $09, $0B, $0C, $11, $19, $15, $16, $22, $33, $44, $60, $88
	.db $1A ; junk?

NoteLengthTable_100bpm:
	;   $0   $1   $2   $3   $4   $5   $6   $7   $8   $9   $A   $B   $C
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
	musicPart MusicHeaderMushroomBonusChance

MusicPartPointers_BossBeaten:
	musicPart MusicHeaderBossBeaten

; This version of the crystal fanfare is unused, because special logic in
; ProcessMusicQueue uses this slot for the ending theme instead.
MusicPartPointers_CrystalUnused:
	musicPart MusicHeaderCrystal

MusicPartPointers_Death:
	musicPart MusicHeaderDeath

MusicPartPointers_GameOver:
	musicPart MusicHeaderGameOver

MusicPartPointers_Crystal:
	musicPart MusicHeaderCrystal

MusicPartPointers_BonusChance:
	musicPart MusicHeaderMushroomBonusChance

; The rest of the pointers correspond to music that uses the pointer tables
; with support for segment-based looping.
MusicPartPointers_CharacterSelect:
	musicPart MusicHeaderCharacterSelect1
MusicPartPointers_CharacterSelectLoop:
	musicPart MusicHeaderCharacterSelect2
	musicPart MusicHeaderCharacterSelect3
	musicPart MusicHeaderCharacterSelect2
	musicPart MusicHeaderCharacterSelect4
	musicPart MusicHeaderCharacterSelect5
	musicPart MusicHeaderCharacterSelect6
	musicPart MusicHeaderCharacterSelect7
MusicPartPointers_CharacterSelectEnd:
	musicPart MusicHeaderCharacterSelect8


MusicPartPointers_Overworld:
	musicPart MusicHeaderOverworld1
MusicPartPointers_OverworldLoop:
	musicPart MusicHeaderOverworld2
	musicPart MusicHeaderOverworld3
	musicPart MusicHeaderOverworld4
	musicPart MusicHeaderOverworld3
	musicPart MusicHeaderOverworld5
MusicPartPointers_OverworldEnd:
	musicPart MusicHeaderOverworld6


MusicPartPointers_Boss:
MusicPartPointers_BossLoop:
MusicPartPointers_BossEnd:
	musicPart MusicHeaderBoss


MusicPartPointers_Star:
MusicPartPointers_StarLoop:
MusicPartPointers_StarEnd:
	musicPart MusicHeaderStar


MusicPartPointers_Wart:
MusicPartPointers_WartLoop:
MusicPartPointers_WartEnd:
	musicPart MusicHeaderWart


MusicPartPointers_TitleScreen:
	musicPart MusicHeaderTitleScreen1
	musicPart MusicHeaderTitleScreen2
	musicPart MusicHeaderTitleScreen3
MusicPartPointers_TitleScreenEnd:
	musicPart MusicHeaderTitleScreen4


MusicPartPointers_SubSpace:
MusicPartPointers_SubSpaceLoop:
	musicPart MusicHeaderSubspace1
	musicPart MusicHeaderSubspace2
	musicPart MusicHeaderSubspace3
	musicPart MusicHeaderSubspace2
MusicPartPointers_SubSpaceEnd:
	musicPart MusicHeaderSubspace4


MusicPartPointers_Ending:
	musicPart MusicHeaderEnding1
	musicPart MusicHeaderEnding2
	musicPart MusicHeaderEnding3
	musicPart MusicHeaderEnding4
IFNDEF PROTOTYPE_MUSIC
	musicPart MusicHeaderEnding5
MusicPartPointers_EndingLoop:
MusicPartPointers_EndingEnd:
	musicPart MusicHeaderEnding6
ENDIF
IFDEF PROTOTYPE_MUSIC
MusicPartPointers_EndingEnd:
	musicPart MusicHeaderEnding5
ENDIF


IFNDEF PROTOTYPE_MUSIC
MusicPartPointers_Underground:
MusicPartPointers_UndergroundLoop:
MusicPartPointers_UndergroundEnd:
	musicPart MusicHeaderUnderground
ENDIF

IFDEF PROTOTYPE_MUSIC
MusicPartPointers_Underground:
MusicPartPointers_UndergroundLoop:
	musicPart MusicHeaderUndergroundBeta1
	musicPart MusicHeaderUndergroundBeta1
	musicPart MusicHeaderUndergroundBeta2
MusicPartPointers_UndergroundEnd:
	musicPart MusicHeaderUndergroundBeta2
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
;   05: Noise/DPCM offset from main
;
; For the musicHeader macro, specifying $00 is "none", -1 for noise/pcm is "omit".
; Some of the music headers use the $00 from the next header's note length table,
; to save one byte (in a ROM /full/ of unused space...)
;
MusicPartHeaders:

; ----------------------------------------
; Character select segments 1 through 5
; (6 through 8 are a ways below this)
MusicHeaderCharacterSelect1:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect1, MusicDataCharacterSelect1_Triangle, MusicDataCharacterSelect1_Square1, MusicDataCharacterSelect1_Noise

MusicHeaderCharacterSelect2:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect2, MusicDataCharacterSelect2_Triangle, MusicDataCharacterSelect2_Square1, MusicDataCharacterSelect2_Noise

MusicHeaderCharacterSelect3:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect3, MusicDataCharacterSelect3_Triangle, MusicDataCharacterSelect3_Square1, MusicDataCharacterSelect3_Noise

MusicHeaderCharacterSelect4:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect4, MusicDataCharacterSelect4_Triangle, MusicDataCharacterSelect4_Square1, MusicDataCharacterSelect4_Noise

MusicHeaderCharacterSelect5:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect5, MusicDataCharacterSelect5_Triangle, MusicDataCharacterSelect5_Square1, MusicDataCharacterSelect5_Noise

; ----------------------------------------
; Overworld music headers
MusicHeaderOverworld1:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld1, MusicDataOverworld1_Triangle, MusicDataOverworld1_Square1, MusicDataOverworld1_Noise

MusicHeaderOverworld2:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld2, MusicDataOverworld2_Triangle, MusicDataOverworld2_Square1, MusicDataOverworld2_Noise

MusicHeaderOverworld3:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld3, MusicDataOverworld3_Triangle, MusicDataOverworld3_Square1, MusicDataOverworld3_Noise

MusicHeaderOverworld4:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld4, MusicDataOverworld4_Triangle, MusicDataOverworld4_Square1, MusicDataOverworld4_Noise

MusicHeaderOverworld5:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld5, MusicDataOverworld5_Triangle, MusicDataOverworld5_Square1, MusicDataOverworld5_Noise

MusicHeaderOverworld6:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld6, MusicDataOverworld6_Triangle, MusicDataOverworld6_Square1, MusicDataOverworld6_Noise

; ----------------------------------------
; Underground music
IFNDEF PROTOTYPE_MUSIC
MusicHeaderUnderground:
	musicHeader NoteLengthTable_129bpm, MusicDataUnderground, MusicDataUnderground_Triangle, MusicDataUnderground_Square1, MusicDataUnderground_DPCM
ENDIF

IFDEF PROTOTYPE_MUSIC
; Much cooler SMB3-esque underground music...
; apparently using /both/ noise and DPCM (!)
MusicHeaderUndergroundBeta1:
	musicHeader NoteLengthTable_200bpm, MusicDataUndergroundBeta1, MusicDataUndergroundBeta1_Triangle, MusicDataUndergroundBeta1_Square1, MusicDataUndergroundBeta1_Noise
	.db MusicDataUndergroundBeta1_DPCM - MusicDataUndergroundBeta1
MusicHeaderUndergroundBeta2:
	musicHeader NoteLengthTable_200bpm, MusicDataUndergroundBeta2, MusicDataUndergroundBeta2_Triangle, MusicDataUndergroundBeta2_Square1, MusicDataUndergroundBeta2_Noise
	.db MusicDataUndergroundBeta2_DPCM - MusicDataUndergroundBeta2
ENDIF

; ----------------------------------------
; Boss and boss area music
MusicHeaderBoss:
	musicHeader NoteLengthTable_200bpm, MusicDataBoss, MusicDataBoss_Triangle, MusicDataBoss_Square1, -1
IFNDEF PROTOTYPE_MUSIC
	.db $00 ; no noise channel
	; @todo ? this should be covered by MusicHeaderStar's first byte, unless
	;       this was some weird space-saver in the original. shrug
ENDIF

; ----------------------------------------
; Starman music
MusicHeaderStar:
IFNDEF PROTOTYPE_MUSIC
	musicHeader NoteLengthTable_300bpm, MusicDataStar, MusicDataStar_Triangle, MusicDataStar_Square1, MusicDataStar_DPCM
ENDIF
IFDEF PROTOTYPE_MUSIC
	musicHeader NoteLengthTable_300bpm, MusicDataStar, MusicDataStar_Triangle, MusicDataStar_Square1, MusicDataStar_Noise
ENDIF

; ----------------------------------------
; Wart's final boss music
MusicHeaderWart:
	musicHeader NoteLengthTable_200bpm, MusicDataWart, MusicDataWart_Triangle, MusicDataWart_Square1, -1
IFNDEF PROTOTYPE_MUSIC
	.db $00 ; no noise channel
	; @todo same note as above chunk
ENDIF

; ----------------------------------------
; Various shorter jingles, extra character select segments (8, 7, 6), and other potpourri

MusicHeaderCrystal:
	musicHeader NoteLengthTable_300bpm, MusicDataCrystal, MusicDataCrystal_Triangle, MusicDataCrystal_Square1, -1

MusicHeaderGameOver:
 	musicHeader NoteLengthTable_300bpm, MusicDataGameOver, MusicDataGameOver_Triangle, MusicDataGameOver_Square1, -1

MusicHeaderBossBeaten:
 	musicHeader NoteLengthTable_300bpm, MusicDataBossBeaten, MusicDataBossBeaten_Triangle, MusicDataBossBeaten_Square1, -1

MusicHeaderCharacterSelect8:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect8, MusicDataCharacterSelect8_Triangle, MusicDataCharacterSelect8_Square1, MusicDataCharacterSelect8_Noise

MusicHeaderMushroomBonusChance:
 	musicHeader NoteLengthTable_150bpm, MusicDataMushroomBonusChance, $00, MusicDataMushroomBonusChance_Square1, -1

MusicHeaderCharacterSelect7:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect7, MusicDataCharacterSelect7_Triangle, MusicDataCharacterSelect7_Square1, MusicDataCharacterSelect7_Noise

MusicHeaderDeath:
 	musicHeader NoteLengthTable_200bpm, MusicDataDeath, MusicDataDeath_Triangle, MusicDataDeath_Square1, -1

MusicHeaderCharacterSelect6:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect6, MusicDataCharacterSelect6_Triangle, MusicDataCharacterSelect6_Square1, MusicDataCharacterSelect6_Noise

; ----------------------------------------
; Title screen segments

MusicHeaderTitleScreen2:
	musicHeader NoteLengthTable_225bpm, MusicDataTitleScreen2, MusicDataTitleScreen2_Triangle, MusicDataTitleScreen2_Square1, MusicDataTitleScreen2_Noise

MusicHeaderTitleScreen1:
	musicHeader NoteLengthTable_225bpm, MusicDataTitleScreen1, MusicDataTitleScreen1_Triangle, MusicDataTitleScreen1_Square1, MusicDataTitleScreen1_Noise

MusicHeaderTitleScreen3:
	musicHeader NoteLengthTable_225bpm, MusicDataTitleScreen3, MusicDataTitleScreen3_Triangle, MusicDataTitleScreen3_Square1, MusicDataTitleScreen3_Noise

MusicHeaderTitleScreen4:
	musicHeader NoteLengthTable_225bpm, MusicDataTitleScreen4, MusicDataTitleScreen4_Triangle, MusicDataTitleScreen4_Square1, MusicDataTitleScreen4_Noise

; ----------------------------------------
; Subspace music, quite longer than normally heard

MusicHeaderSubspace1:
	musicHeader NoteLengthTable_200bpm, MusicDataSubspace1, MusicDataSubspace1_Triangle, MusicDataSubspace1_Square1, MusicDataSubspace1_Noise

MusicHeaderSubspace2:
	musicHeader NoteLengthTable_200bpm, MusicDataSubspace2, MusicDataSubspace2_Triangle, MusicDataSubspace2_Square1, MusicDataSubspace2_Noise

MusicHeaderSubspace3:
	musicHeader NoteLengthTable_200bpm, MusicDataSubspace3, MusicDataSubspace3_Triangle, MusicDataSubspace3_Square1, MusicDataSubspace3_Noise

MusicHeaderSubspace4:
	musicHeader NoteLengthTable_200bpm, MusicDataSubspace4, MusicDataSubspace4_Triangle, MusicDataSubspace4_Square1, MusicDataSubspace4_Noise

; ----------------------------------------
; Ending music

MusicHeaderEnding1:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding1, MusicDataEnding1_Triangle, MusicDataEnding1_Square1, MusicDataEnding1_Noise

MusicHeaderEnding3:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding3, MusicDataEnding3_Triangle, MusicDataEnding3_Square1, MusicDataEnding3_Noise

MusicHeaderEnding2:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding2, MusicDataEnding2_Triangle, MusicDataEnding2_Square1, MusicDataEnding2_Noise

MusicHeaderEnding5:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding5, MusicDataEnding5_Triangle, MusicDataEnding5_Square1, MusicDataEnding5_Noise

MusicHeaderEnding4:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding4, MusicDataEnding4_Triangle, MusicDataEnding4_Square1, MusicDataEnding4_Noise

IFNDEF PROTOTYPE_MUSIC
MusicHeaderEnding6:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding6, $00, MusicDataEnding6_Square1, $00
ENDIF



MusicPointersFirstPart:
	musicPart MusicPartPointers_Overworld
	musicPart MusicPartPointers_CharacterSelect
	musicPart MusicPartPointers_Underground
	musicPart MusicPartPointers_Boss
	musicPart MusicPartPointers_Star
	musicPart MusicPartPointers_SubSpace
	musicPart MusicPartPointers_Wart
	musicPart MusicPartPointers_TitleScreen
	musicPart MusicPartPointers_Ending

MusicPointersEndPart:
	musicPart MusicPartPointers_OverworldEnd
	musicPart MusicPartPointers_CharacterSelectEnd
	musicPart MusicPartPointers_UndergroundEnd
	musicPart MusicPartPointers_BossEnd
	musicPart MusicPartPointers_StarEnd
	musicPart MusicPartPointers_SubSpaceEnd
	musicPart MusicPartPointers_WartEnd
	musicPart MusicPartPointers_TitleScreenEnd
	musicPart MusicPartPointers_EndingEnd

MusicPointersLoopPart:
	musicPart MusicPartPointers_OverworldLoop
	musicPart MusicPartPointers_CharacterSelectLoop
	musicPart MusicPartPointers_UndergroundLoop
	musicPart MusicPartPointers_BossLoop
	musicPart MusicPartPointers_StarLoop
	musicPart MusicPartPointers_SubSpaceLoop
	musicPart MusicPartPointers_WartEnd
	.db $00 ; no loop
IFNDEF PROTOTYPE_MUSIC
	musicPart MusicPartPointers_EndingLoop
ENDIF
IFDEF PROTOTYPE_MUSIC
	.db $00 ; no loop
ENDIF


; Include music/track data; see this file for format details
.include "src/music/music-data.asm"

; Include instruent data; see this file for format details
.include "src/music/instruments.asm"
