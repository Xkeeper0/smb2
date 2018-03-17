
Debug_CurrentMenuOption	= $7FE0
Debug_MenuOptionCount	= #$4
Debug_InMenu			= $7FEF

; Custom debug menu for SMB2, probably to help with speedrunners
; or just testing this disassembly.
; @TODO Shoudl probably save a handful of important memory values,
; like the nametable scroll position, maybe some other stuff like
; the contents of $00 and $01 since we clobber those.
; The ability to "abort" is a huuuuge gamble since the game will
; most likely take it *extremely* poorly.

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
	.word DebugPPU_DebugText
	.word DebugPPU_WorldText
	.word DebugPPU_LevelText
	.word DebugPPU_AreaText
	.word DebugPPU_CharacterText
	.word DebugPPU_AbortText


DebugPPU_DebugText:
	.db # 10+4, #$20, #$CB, #$A, #$DD, #$DE, #$DB, #$EE, #$E0, #$FB, #$E6, #$DE, #$E7, #$EE, #0

DebugPPU_WorldText:
                                ; WORLD ?
	.db #  7+4, #$21, #$46, #$7, #$F0, #$E8, #$EB, #$E5, #$DD, #$FB, #$F5, #0

DebugPPU_LevelText:
                                ; LEVEL ?
	.db #  7+4, #$21, #$86, #$7, #$E5, #$DE, #$EF, #$DE, #$E5, #$FB, #$F5, #0

DebugPPU_AreaText:
                                ; AREA  ?
	.db #  7+4, #$21, #$C6, #$7, #$DA, #$EB, #$DE, #$DA, #$FB, #$FB, #$F5, #0

DebugPPU_CharacterText:
                                ; CHARACTER ?
	.db # 12+4, #$22, #$06, #$B, #$DC, #$E1, #$DA, #$EB, #$DA, #$DC, #$ED, #$DE, #$EB, #$FB, #$F5, #0

DebugPPU_AbortText:
                                ; B BUTTON...ABORT
	.db #$12+4, #$23, #$27, #$12, #$DB, #$FB, #$DB, #$EE, #$ED, #$ED, #$E8, #$E7, #$FB, #$CF, #$CF, #$CF, #$FB,#$DA, #$DB, #$E8, #$EB, #$ED, #$00
