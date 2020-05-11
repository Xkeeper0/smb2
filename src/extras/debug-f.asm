CheckDebug_Exit:
	RTS

DoSoundProcessingAndCheckDebug:
	JSR DoSoundProcessing

CheckDebug:
	; Require select pressed
	LDA Player1JoypadPress
	CMP #ControllerInput_Select
	BNE CheckDebug_Exit

	; Not already in debug menu
	LDA Debug_InMenu
	BNE CheckDebug_Exit

	; Require current mode to be normal gameplay
	LDA StackArea
	CMP #Stack100_Gameplay
	BNE CheckDebug_Exit

	; Disable while scrolling
	LDA NeedsScroll
	AND #%00000100
	BNE CheckDebug_Exit

	; Disable while in subspace/jar
	LDA InSubspaceOrJar
	BNE CheckDebug_Exit

Debug_Init:
	; Enable the debug menu flag
	LDA #$01
	STA Debug_InMenu

	; Stash a bunch of stuff
	JSR DebugBackupScroll
	JSR DebugBackupRAM

	; Swap to the debug/credits bank
	LDA #PRGBank_A_B
	JSR ChangeMappedPRGBank

	; Stop the music
	LDA #Music2_StopMusic
	STA MusicQueue2

	; And off we go
	JMP Debug_InitMenu


Debug_Abort:
	; Disable the debug menu flag
	LDA #$00
	STA Debug_InMenu

	; Restore a bunch of stuff
	JSR DebugRestoreRAM

	; Restart the music
	STA MusicQueue1
	LDA #$00
	STA MusicPlaying1

	; Load character, maybe
	LDA Debug_Character
	CMP CurrentCharacter
	BEQ +

	STA CurrentCharacter
	LDA #PRGBank_A_B
	JSR ChangeMappedPRGBank

	JSR CopyCharacterStatsAndStuff
	+

	; Restore the original bank
	LDA MMC3PRGBankTemp
	JSR ChangeMappedPRGBank

	; It's just easier than trying to replicate all the same behavior
	JMP HidePauseScreen


Debug_Activate:
	; Disable the debug menu flag
	LDA #$00
	STA Debug_InMenu

	; Show the title card and number of lives
	LDY #GameMode_TitleCard
	JMP ShowCardAfterTransition


; Similar to StashScreenScrollPosition
DebugBackupScroll:
	LDA PPUScrollYMirror
	STA PPUScrollYMirror_Backup
	LDA PPUScrollXMirror
	STA PPUScrollXMirror_Backup
	LDA PPUScrollYHiMirror
	STA PPUScrollYHiMirror_Backup
	LDA PPUScrollXHiMirror
	STA PPUScrollXHiMirror_Backup
	LDA ScreenYHi
	STA ScreenYHi_Backup
	LDA ScreenYLo
	STA ScreenYLo_Backup
	LDA ScreenBoundaryLeftHi
	STA ScreenBoundaryLeftHi_Backup
	LDA byte_RAM_E1
	STA byte_RAM_517
	RTS

DebugBackupRAM:
	LDX #$00
-
	; Determine the RAM address
	TXA
	ASL
	TAY
	LDA DebugPreserveAddresses, Y
	STA byte_RAM_0
	LDA DebugPreserveAddresses + 1, Y
	STA byte_RAM_1
	; Stash the value
	LDY #$00
	LDA (byte_RAM_0), Y
	STA Debug_Stash, X
	; Next
	INX
	CPX #((DebugPreserveAddresses_End - DebugPreserveAddresses) / 2)
	BCC -
	RTS

DebugRestoreRAM:
	LDX #$00
-
	; Determine the RAM address
	TXA
	ASL
	TAY
	LDA DebugPreserveAddresses, Y
	STA byte_RAM_0
	LDA DebugPreserveAddresses + 1, Y
	STA byte_RAM_1
	; Stash the value
	LDY #$00
	LDA Debug_Stash, X
	STA (byte_RAM_0), Y
	; Next
	INX
	CPX #((DebugPreserveAddresses_End - DebugPreserveAddresses) / 2)
	BCC -
	RTS

; Here are a bunch of RAM addresses to save
DebugPreserveAddresses:
	.dw MMC3PRGBankTemp
	.dw MusicPlaying1
DebugPreserveAddresses_End:
