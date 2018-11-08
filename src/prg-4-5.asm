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


;
; Sound effect data
;
.include "src/music/sound-effect-data.asm"


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
IFDEF EXPAND_MUSIC
	CMP #$7E
	BNE ProcessDPCMQueue_LookUpSample

	LDA #$A0
	STA DPCMTimer
	RTS

ProcessDPCMQueue_LookUpSample:
ENDIF
	LDY #$00

IFNDEF EXPAND_MUSIC
ProcessDPCMQueue_PointerLoop:
	INY
	LSR A
	BCC ProcessDPCMQueue_PointerLoop
ELSE
	TAY
ENDIF

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

IFNDEF EXPAND_MUSIC
ProcessMusicQueue_FirstPointerLoop:
	INY
	LSR A
	BCC ProcessMusicQueue_FirstPointerLoop
ELSE
	TAY
	DEY
ENDIF

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

IFNDEF EXPAND_MUSIC
ProcessMusicQueue_PointerLoop:
	INY
	LSR A
	BCC ProcessMusicQueue_PointerLoop
ELSE
	TAY
ENDIF

IFNDEF EXPAND_MUSIC
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
IFDEF PROTOTYPE_MUSIC_UNDERGROUND
	LDA MusicPartPointers + 6, Y
ENDIF
	STA CurrentMusicDPCMOffset
	STA CurrentMusicDPCMStartOffset
ENDIF

IFDEF EXPAND_MUSIC
ProcessMusicQueue_ReadHeader:
	LDA MusicPartPointers - 1, Y
	TAY

	LDA MusicHeaderPointersLo, Y
	STA byte_RAM_0
	LDA MusicHeaderPointersHi, Y
	STA byte_RAM_0+1

	LDY #$00

	LDA (byte_RAM_0), Y
	STA MusicTempoSetting
	INY
	LDA (byte_RAM_0), Y
	STA CurrentMusicPointer
	INY
	LDA (byte_RAM_0), Y
	STA CurrentMusicPointer + 1
	INY
	LDA (byte_RAM_0), Y
	STA CurrentMusicTriangleOffset
	INY
	LDA (byte_RAM_0), Y
	STA CurrentMusicSquare1Offset
	INY
	LDA (byte_RAM_0), Y
	STA CurrentMusicNoiseOffset
	STA CurrentMusicNoiseStartOffset
	INY
	LDA (byte_RAM_0), Y
	STA CurrentMusicDPCMOffset
	STA CurrentMusicDPCMStartOffset
ENDIF

	LDA #$01
	STA MusicSquare2NoteLength
	STA MusicSquare1NoteLength
	STA MusicTriangleNoteLength
	STA MusicNoiseNoteLength
	STA MusicDPCMNoteLength

	LDA #$00
	STA CurrentMusicSquare2Offset
	STA MusicSquare1NoteSweep
IFDEF EXPAND_MUSIC
	STA MusicSquare1NoteBend
	STA MusicSquare2NoteBend
ENDIF

	LDA #%00001011
	STA SND_CHN
	LDA #%00001111
	STA SND_CHN

ProcessMusicQueue_ReadNoteData:
	DEC MusicSquare2NoteLength
	BNE ProcessMusicQueue_Square2SustainNote

	LDY CurrentMusicSquare2Offset
	INC CurrentMusicSquare2Offset
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

IFNDEF EXPAND_MUSIC
	AND #Music1_Overworld | Music1_Inside | Music1_Subspace
ELSE
	JSR CheckStopMusic
ENDIF
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

ProcessMusicQueue_Square2NextOffset:
	LDY CurrentMusicSquare2Offset
	INC CurrentMusicSquare2Offset
	LDA (CurrentMusicPointer), Y

ProcessMusicQueue_Square2Note:
	LDX SoundEffectPlaying1
	BNE ProcessMusicQueue_Square2ContinueNote

	JSR PlaySquare2Note

	TAY
	BNE ProcessMusicQueue_Square2StartNote

	LDA MusicSquareInstrumentStartOffset
	JMP ProcessMusicQueue_Square2UpdateNoteOffset

ProcessMusicQueue_Square2StartNote:
	LDA MusicSquare2NoteStartLength
	; seems like the next line should be LDX MusicSquareEnvelope based on the equivalent code for square 1?
	LDX MusicSquareInstrumentStartOffset ; always overridden in the following subroutine...?
	JSR SetInstrumentStartOffset

ProcessMusicQueue_Square2UpdateNoteOffset:
	STA MusicSquare2InstrumentOffset

IFDEF EXPAND_MUSIC
	JSR CheckSquare2NoteBend
ENDIF

	JSR SetSquare2VolumeAndSweep

ProcessMusicQueue_Square2ContinueNote:
	LDA MusicSquare2NoteStartLength
	STA MusicSquare2NoteLength

ProcessMusicQueue_Square2SustainNote:
	LDX SoundEffectPlaying1
	BNE ProcessMusicQueue_Square1

IFDEF EXPAND_MUSIC
	LDA MusicSquare2NoteBend
	BEQ ProcessMusicQueue_LoadSquare2InstrumentOffset

	LDA MusicSquare2NoteStartLength
	LDX #$04
	JSR UpdateNoteBend
ENDIF

ProcessMusicQueue_LoadSquare2InstrumentOffset:
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

ProcessMusicQueue_Square1NextOffset:
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

	LDA MusicSquareInstrumentStartOffset
	JMP ProcessMusicQueue_Square1UpdateNoteOffset

ProcessMusicQueue_Square1StartNote:
	LDA MusicSquare1NoteStartLength
	LDX MusicSquareEnvelope ; always overridden in the following subroutine...?
	JSR SetInstrumentStartOffset

ProcessMusicQueue_Square1UpdateNoteOffset:
	STA MusicSquare1InstrumentOffset

IFDEF EXPAND_MUSIC
	JSR CheckSquare1NoteBend
ENDIF

	JSR SetSquare1VolumeAndSweep

ProcessMusicQueue_Square1ContinueNote:
	LDA MusicSquare1NoteStartLength
	STA MusicSquare1NoteLength

ProcessMusicQueue_Square1SustainNote:
	LDA SoundEffectPlaying2
	BNE ProcessMusicQueue_Triangle

IFDEF EXPAND_MUSIC
	LDA MusicSquare1NoteBend
	BEQ ProcessMusicQueue_LoadSquare1InstrumentOffset

	LDX #$00
	LDA MusicSquare1NoteStartLength
	JSR UpdateNoteBend
ENDIF

ProcessMusicQueue_LoadSquare1InstrumentOffset:
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
IFNDEF EXPAND_MUSIC
	IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
		IFNDEF PROTOTYPE_MUSIC_STARMAN
			; skip to DPCM for underground/invincibility music
			LDA MusicPlaying1
			AND #Music1_Inside | Music1_Invincible
			BNE ProcessMusicQueue_DPCM
		ELSE
			; skip to DPCM for underground music ONLY
			LDA MusicPlaying1
			AND #Music1_Inside
			BNE ProcessMusicQueue_DPCM
		ENDIF
	ELSE
		IFNDEF PROTOTYPE_MUSIC_STARMAN
			; no starman, underground
			LDA MusicPlaying1
			AND #Music1_Invincible
			BNE ProcessMusicQueue_DPCM
		ENDIF
	ENDIF
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
IFNDEF EXPAND_MUSIC
	LDA MusicPlaying1
	IFNDEF PROTOTYPE_MUSIC_STARMAN
		AND #Music1_Inside | Music1_Invincible
	ELSE
		AND #Music1_Inside
	ENDIF
	BNE ProcessMusicQueue_DPCM

	RTS
ENDIF

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
	; POI: This left shift precludes using the first DPCM sample (bomb explosion) in the DPCM track.
	; This could be to allow $80 for a "rest" note on the DPCM track, but none of the in-game music
	; takes advantage of that.
IFNDEF EXPAND_MUSIC
	ASL A
ENDIF
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
	AND #$0F
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
;   A = $00 for rest, hi frequency otherwise
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

IFDEF EXPAND_MUSIC
	LDA MusicSquare1NoteBend, X
	BNE NoteBendStashFrequency
ENDIF

PlayNote_SetFrequency:
	LDA NextFrequencyLo
	STA SQ1_LO, X
	STA MusicSquare1Lo, X ; unused
	LDA NextFrequencyHi
	ORA #$08
	STA SQ1_HI, X
	RTS

PlayNote_SetFrequency_Square2Detuned:
	LDA NextFrequencyLo
	SEC
	SBC #$02
	STA SQ2_LO
	STA MusicSquare2Lo
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


IFDEF EXPAND_MUSIC
;
; Determines whether the currently playing track should stop
;
; Input
;   A = MusicPlaying2
;
CheckStopMusic:
	CMP #Music1_Overworld
	BEQ CheckStopMusic_Resume
	CMP #Music1_Inside
	BEQ CheckStopMusic_Resume
	CMP #Music1_Subspace
	BEQ CheckStopMusic_Resume

CheckStopMusic_Stop:
	LDA #$00
	RTS

CheckStopMusic_Resume:
	LDA #$01
	RTS


;
; Reads ahead to see if we have a note bend
;
CheckSquare2NoteBend:
	LDY CurrentMusicSquare2Offset
	LDA (CurrentMusicPointer), Y
	CMP #$FF
	BNE CheckSquare2NoteBend_Exit

	INC CurrentMusicSquare2Offset

	LDA MusicSquare2Lo
	STA MusicSquare2NoteBend

	PLA
	PLA
	JMP ProcessMusicQueue_Square2NextOffset

CheckSquare2NoteBend_Exit:
	RTS


;
; Reads ahead to see if we have a note bend
;
CheckSquare1NoteBend:
	LDY CurrentMusicSquare1Offset
	LDA (CurrentMusicPointer), Y
	CMP #$FF
	BNE CheckSquare1NoteBend_Exit

	INC CurrentMusicSquare1Offset

	LDA MusicSquare1Lo
	STA MusicSquare1NoteBend

	PLA
	PLA
	JMP ProcessMusicQueue_Square1NextOffset

CheckSquare1NoteBend_Exit:
	RTS


NoteBendStashFrequency:
	; If bend is in effect, this stores the last set frequency
	LDA <NextFrequencyLo
	STA MusicSquare1Lo, X
	RTS


;
; Updates note bend
;
; Input
;   A = rest time remaining
;   X = channel
;       $00: square 1
;       $04: square 2
;
UpdateNoteBend:
	AND #%00000011
	CMP #$03
	BEQ UpdateNoteBend_AfterDecrement

	DEC MusicSquare1NoteBend, X

UpdateNoteBend_AfterDecrement:
	LDA MusicSquare1NoteBend, X
	CMP MusicSquare1Lo, X
	BCS UpdateNoteBend_Exit

	LDA #$00
	STA MusicSquare1NoteBend, X
	LDA MusicSquare1Lo, X

UpdateNoteBend_Exit:
	STA SQ1_LO, X
	RTS
ENDIF


;
; -------------------------------------------------------------------------
; Various bits of the music engine have been extracted into separate files;
; see the individual files for details on the formats within
;

; Frequency table for notes; standard between various Mario games
.include "src/music/frequency-table.asm";

; Unused space in the original ($875F - $8EFF)
unusedSpace $8F00, $FF

; Note lengths for various BPM settings
.include "src/music/note-lengths.asm";

; Unused space in the original ($8FB3 - $8FFF)
unusedSpace $9000, $FF

; Pointers to music segments
IFNDEF EXPAND_MUSIC
	.include "src/music/music-part-pointers.asm"
ELSE
	.include "src/music/music-part-pointers-expanded.asm"
ENDIF

; Headers for songs (BPM, tracks to use, etc)
.include "src/music/music-headers.asm"

; More music pointers
.include "src/music/music-pointers.asm"

; Music and track data
.include "src/music/music-data.asm"

; Instrument data and definitions
.include "src/music/instruments.asm"
