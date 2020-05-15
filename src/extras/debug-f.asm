
DebugHook_Exit:
	JMP NMI_Exit

DoSoundProcessingAndCheckDebug:
	JSR DoSoundProcessing

	; Are you pressing select?
	LDA Player1JoypadPress
	CMP #ControllerInput_Select
	BNE DebugHook_Exit

	; And you're not holding start?
	LDA Player1JoypadHeld
	AND #ControllerInput_Start
	BNE DebugHook_Exit

	JSR DebugHook_CheckEligibility
	BCS DebugHook_Exit

	; Hijack the NMI and show the debug menu
	LDA #>DebugHook_Hijack
	PHA
	LDA #<DebugHook_Hijack
	PHA
	PHP
	RTI


DebugHook_Hijack:
	; Stash the current bank
	LDA MMC3PRGBankTemp
	PHA

	; Enable the debug menu flag
	LDA #$01
	STA Debug_InMenu

	; Stash a bunch of stuff
	JSR DebugHook_BackupScroll
	JSR DebugHook_BackupRAM

	; Swap to the debug/credits bank
	LDA #PRGBank_A_B
	JSR ChangeMappedPRGBank

	; And off we go
	JMP DebugMenu_Init


;
; Similar idea to JumpToTableAfterJump
;
DebugHook_ExitToAddressAfterJump:
	STA Debug_StashA
	STX Debug_StashX
	STY Debug_StashY
	PHP
	PLA
	STA Debug_StashP

	; Save the source address
	PLA
	STA byte_RAM_A
	PLA
	STA byte_RAM_B

	; Determine the jump address
	LDY #$01
	LDA (byte_RAM_A), Y
	STA Debug_JumpAddressLo
	INY
	LDA (byte_RAM_A), Y
	STA Debug_JumpAddressHi

DebugHook_ExitToJumpAddress:
	LDA #$00
	STA Debug_InMenu

	JSR DebugHook_RestoreRAM

	; Restore the previous bank
	PLA
	; JSR ChangeMappedPRGBank

	; Forget about all those registers and processor flags
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP

	; Forget that RTI
	PLA
	PLA
	PLA

	; And forget whatever this address was
	PLA
	PLA

	; Restore the registers and processor flags
	LDA Debug_StashP
	PHP
	LDA Debug_StashA
	LDX Debug_StashX
	LDY Debug_StashY
	PLP

	; Jump to the destination
	JMP (Debug_JumpAddressLo)


;
; Check if the game conditions are good for entering the debug menu.
; If the menu can be accessed, carry will be clear.
;
DebugHook_CheckEligibility:
	; Not already in debug menu
	LDA Debug_InMenu
	BNE +f

	; Require current mode to be normal gameplay
	LDA StackArea
	CMP #Stack100_Gameplay
	BNE +f

	; Disable while scrolling
	LDA NeedsScroll
	AND #%00000100
	BNE +f

	; Disable the background is drawing
	LDA byte_RAM_537
	BEQ +f

	; Disable while in subspace/jar
	LDA InSubspaceOrJar
	BNE +f

	; Disable while player is busy
	LDA PlayerState
	CMP #PlayerState_ClimbingAreaTransition
	BCS +f

	CLC
	RTS

+f
	SEC
	RTS


;
; Stash the scroll information so that unpause can restore it later.
;
; Similar to StashScreenScrollPosition in Bank 0 except that it doesn't change
; the current PPU scroll position.
;
DebugHook_BackupScroll:
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


;
; The table below contains a bunch of RAM addresses to save/restore when
; entering and exiting the debug menu.
;
DebugPreserveAddresses:
	.dw MMC3PRGBankTemp
	; .dw MusicPlaying1
DebugPreserveAddresses_End:


DebugHook_BackupRAM:
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


DebugHook_RestoreRAM:
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

