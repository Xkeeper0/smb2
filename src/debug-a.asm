
Debug_InitMenu:

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
	LDA #0
	JSR Debug_BufferText
	JSR WaitForNMI
	LDA #1
	JSR Debug_BufferText
	JSR WaitForNMI
	LDA #2
	JSR Debug_BufferText
	JSR WaitForNMI
	LDA #3
	JSR Debug_BufferText
	JSR WaitForNMI
	LDA #4
	JSR Debug_BufferText
	JSR WaitForNMI
	LDA #5
	JSR Debug_BufferText

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


-	JSR WaitForNMI
	LDA Player1JoypadPress
	CMP #ControllerInput_B
	BEQ +
	BNE -

+	JMP Debug_Abort

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
