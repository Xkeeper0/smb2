
; Custom debug menu for SMB2, probably to help with speedrunners
; or just testing this disassembly.
; @TODO Shoudl probably save a handful of important memory values,
; like the nametable scroll position, maybe some other stuff like
; the contents of $00 and $01 since we clobber those.
; The ability to "abort" is a huuuuge gamble since the game will
; most likely take it *extremely* poorly.

Debug_CurrentMenuOption	= $7FE0
Debug_InMenu			= $7FEF
Debug_MenuOptionCount	= #$4

Debug_InitMenu:
	LDA #0
	STA Debug_CurrentMenuOption

	JSR EnableNMI
	JSR WaitForNMI_TurnOffPPU
	JSR DisableNMI
	JSR SetScrollXYTo0
	JSR SetBlackAndWhitePalette
	JSR ClearNametablesAndSprites
	JSR DisableNMI

	LDA     #$28
	STA     BackgroundCHR1
	LDA     #$2A
	STA     BackgroundCHR2
	LDA     #$0D
	STA     SpriteCHR1

	JSR EnableNMI
	JSR WaitForNMI_TurnOnPPU

	; Draw debug meu text
	LDA #0						; DEBUG MENU
	JSR Debug_BufferText
	JSR WaitForNMI
	LDA #1						; WORLD ?
	JSR Debug_BufferText
	JSR WaitForNMI
	LDA #2						; LEVEL ?
	JSR Debug_BufferText
	JSR WaitForNMI
	LDA #3						; AREA ?
	JSR Debug_BufferText
	JSR WaitForNMI
	LDA #4						; CHARACTER ?
	JSR Debug_BufferText
	JSR WaitForNMI
	LDA #5						; B BUTTON ... ABORT
	JSR Debug_BufferText

	JSR Debug_UpdateWorld		; Draw in the actual values...
	JSR WaitForNMI
	JSR Debug_UpdateLevel
	JSR WaitForNMI
	JSR Debug_UpdateArea
	JSR WaitForNMI
	JSR Debug_UpdateCharacter
	JSR WaitForNMI

	; Add the goofy smiley cursor
	LDA #$4a				; Y
	STA SpriteDMAArea
	LDA #$38				; Tile
	STA SpriteDMAArea+1
	LDA #$0					; Attributes
	STA SpriteDMAArea+2
	LDA #$1b				; X
	STA SpriteDMAArea+3
	LDA #$4a
	STA SpriteDMAArea+4
	LDA #$3A
	STA SpriteDMAArea+5
	LDA #$0
	STA SpriteDMAArea+6
	LDA #$23
	STA SpriteDMAArea+7


Debug_MenuLoop:
	JSR WaitForNMI

	LDA Debug_CurrentMenuOption		; Update cursor sprite
	ASL A
	ASL A
	ASL A
	ASL A
	CLC
	ADC #$4a						; Move the cursor
	STA SpriteDMAArea
	STA SpriteDMAArea+4

	LDA Player1JoypadPress			; Check if we should abort
	CMP #ControllerInput_B
	BEQ Debug_DoAbort

	CMP #ControllerInput_Down		; Otherwise, move the cursor down?
	BEQ Debug_MenuDown

	CMP #ControllerInput_Up			; Maybe up instead?
	BEQ Debug_MenuUp

	BNE Debug_MenuLoop				; No? Wait more, then...

Debug_DoAbort:
	JMP Debug_Abort


Debug_MenuUp:
	LDA Debug_CurrentMenuOption
	BEQ Debug_MenuLoop
	DEC Debug_CurrentMenuOption
	JMP +

Debug_MenuDown:
	LDA Debug_CurrentMenuOption
	CMP #Debug_MenuOptionCount - 1
	BEQ Debug_MenuLoop
	INC Debug_CurrentMenuOption

+	LDA #SoundEffect1_CherryGet
	STA SoundEffect1Queue
	JMP Debug_MenuLoop



-:
	JSR Debug_BufferText	; Draw requested text
	PLA						; Pull the value to update...
	CLC
	ADC #$D0				; Move to character offset
	STA PPUBuffer_301+3
	RTS

Debug_UpdateWorld:
	LDX CurrentWorld		; Load current world
	INX
	TXA
	PHA						; Push onto stack
	LDA #6					; Load text to update
	BNE -					; Go do that.

Debug_UpdateLevel:
	LDA CurrentLevel		; Load current world
	PHA						; Push onto stack
	LDA #7					; Load text to update
	BNE -					; Go do that.

Debug_UpdateArea:
	LDA CurrentLevelArea	; Load current world
	PHA						; Push onto stack
	LDA #8					; Load text to update
	BNE -					; Go do that.

Debug_UpdateCharacter:
	LDA #9					; Load text offset of Mario (0)
	CLC
	ADC CurrentCharacter	; Add the character index ...
	JSR Debug_BufferText	; ...and draw it.
	RTS


Debug_BufferText:
	ASL A							; Rotate A left one
	TAX								; A->X
	LDA DebugPPU_TextPointers,X		; Load low pointer
	STA $0							; Store one byte to low address
	LDA DebugPPU_TextPointers+1,X	; Store high pointer
	STA $1							; Store one byte to low address
	LDA ($0), Y						; Load the length of data to copy
	TAY
-
	LDA ($0), Y						; Load our PPU data...
	STA PPUBuffer_301-1, Y			; ...and store it in the buffer
	DEY
	BNE -
	RTS







DebugPPU_TextPointers:
	.word DebugPPU_DebugText			; 0
	.word DebugPPU_WorldText			; 1
	.word DebugPPU_LevelText			; 2
	.word DebugPPU_AreaText				; 3
	.word DebugPPU_CharacterText		; 4
	.word DebugPPU_AbortText			; 5

	.word DebugPPU_UpdateWorld			; 6
	.word DebugPPU_UpdateLevel			; 7
	.word DebugPPU_UpdateArea			; 8
	.word DebugPPU_UpdateCharacter0		; 9
	.word DebugPPU_UpdateCharacter1		; 10
	.word DebugPPU_UpdateCharacter2		; 11
	.word DebugPPU_UpdateCharacter3		; 12


DebugPPU_DebugText:			; DEBUG
	.db # 10+4, #$20, #$CB, #$A, #$DD, #$DE, #$DB, #$EE, #$E0, #$FB, #$E6, #$DE, #$E7, #$EE, #0

DebugPPU_WorldText:			; WORLD ?
	.db #  7+4, #$21, #$46, #$7, #$F0, #$E8, #$EB, #$E5, #$DD, #$FB, #$F5, #0

DebugPPU_LevelText:			; LEVEL ?
	.db #  7+4, #$21, #$86, #$7, #$E5, #$DE, #$EF, #$DE, #$E5, #$FB, #$F5, #0

DebugPPU_AreaText:			; AREA  ?
	.db #  7+4, #$21, #$C6, #$7, #$DA, #$EB, #$DE, #$DA, #$FB, #$FB, #$F5, #0

DebugPPU_CharacterText:		; CHARACTER ?
	.db # 12+4, #$22, #$06, #$B, #$DC, #$E1, #$DA, #$EB, #$DA, #$DC, #$ED, #$DE, #$EB, #$FB, #$F5, #0

DebugPPU_AbortText:			; B BUTTON...ABORT
	.db #$12+4, #$23, #$27, #$12, #$DB, #$FB, #$DB, #$EE, #$ED, #$ED, #$E8, #$E7, #$FB, #$CF, #$CF, #$CF, #$FB,#$DA, #$DB, #$E8, #$EB, #$ED, #$00

DebugPPU_UpdateWorld:		; ?
	.db	#1+4, #$21, #$4C, #1, #$FB, #0
DebugPPU_UpdateLevel:		; ?
	.db	#1+4, #$21, #$8C, #1, #$FB, #0
DebugPPU_UpdateArea:		; ?
	.db	#1+4, #$21, #$cC, #1, #$FB, #0
DebugPPU_UpdateCharacter0:	; 0 MARIO
	.db	#$A+4, #$22, #$10, #$A, #$D0, #$FB, #$E6, #$DA, #$EB, #$E2, #$E8, #$FB, #$FB, #$FB, #0
DebugPPU_UpdateCharacter1:	; 1 PRINCESS
	.db	#$A+4, #$22, #$10, #$A, #$D1, #$FB, #$E9, #$EB, #$E2, #$E7, #$DC, #$DE, #$EC, #$EC, #0
DebugPPU_UpdateCharacter2:	; 2 TOAD
	.db	#$A+4, #$22, #$10, #$A, #$D2, #$FB, #$ED, #$E8, #$DA, #$DD, #$FB, #$FB, #$FB, #$FB, #0
DebugPPU_UpdateCharacter3:	; 3 LUIGI
	.db	#$A+4, #$22, #$10, #$A, #$D3, #$FB, #$E5, #$EE, #$E2, #$E0, #$E2, #$FB, #$FB, #$FB, #0
