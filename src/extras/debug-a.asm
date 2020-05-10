
; Custom debug menu for SMB2, probably to help with speedrunners
; or just testing this disassembly.
; @TODO Should probably save a handful of important memory values,
; like the nametable scroll position, maybe some other stuff like
; the contents of $00 and $01 since we clobber those.
; The ability to "abort" is a huuuuge gamble since the game will
; most likely take it *extremely* poorly.

Debug_Stash = $7F30

Debug_Level = $7FD0
Debug_Area = $7FD1
; @TODO: page, X/Y, transition type
Debug_Character = $7FD2
Debug_Lives = $7FD3
Debug_ExtraHealth = $7FD4

Debug_PPUPointerOffset = $7FED
Debug_CurrentMenuOption = $7FEE
Debug_InMenu = $7FEF

.ignorenl

Debug_MenuOptionCount = #$05

.endinl

Debug_InitMenu:
	LDA #$00
	STA Debug_CurrentMenuOption

	; Copy current stats
	LDA CurrentCharacter
	STA Debug_Character
	LDA ExtraLives
	STA Debug_Lives
	LDA PlayerMaxHealth
	STA Debug_ExtraHealth

	; Set current level
	LDA CurrentLevel
	STA Debug_Level
	; Set current area
	LDA CurrentLevelArea
	LDY InSubspaceOrJar
	BEQ +
	LDA CurrentLevelArea_Init
	BPL +
	+
	STA Debug_Area

	JSR EnableNMI

	; @TODO: There's on glitched scroll frame from this...?
	JSR WaitForNMI_TurnOffPPU

	JSR WaitForNMI

	; Fun little sound
	JSR Debug_MenuStart

	JSR DisableNMI

	JSR SetScrollXYTo0
	JSR SetBlackAndWhitePalette
	JSR ClearNametablesAndSprites

	LDA #CHRBank_TitleScreenBG1
	STA BackgroundCHR1
	LDA #CHRBank_TitleScreenBG2
	STA BackgroundCHR2
	LDA #CHRBank_EnemiesDesert
	STA SpriteCHR1

	JSR EnableNMI

	; Draw debug menu text
	LDA #$00
	STA Debug_PPUPointerOffset

	-
	JSR Debug_BufferText
	JSR WaitForNMI
	INC Debug_PPUPointerOffset
	LDA Debug_PPUPointerOffset
	CMP #$09
	BCC -

	JSR Debug_UpdateLevel
	JSR WaitForNMI
	JSR Debug_UpdateArea
	JSR WaitForNMI
	JSR Debug_UpdateCharacter
	JSR WaitForNMI
	JSR Debug_UpdateLives
	JSR WaitForNMI
	JSR Debug_UpdateHealth
	JSR WaitForNMI

	; Add the goofy smiley cursor
	LDA #$4A ; Y
	STA SpriteDMAArea
	LDA #$38 ; Tile
	STA SpriteDMAArea + 1
	LDA #$00 ; Attributes
	STA SpriteDMAArea + 2
	LDA #$1B ; X
	STA SpriteDMAArea + 3
	LDA #$4A ; Y
	STA SpriteDMAArea + 4
	LDA #$3A ; Tile
	STA SpriteDMAArea + 5
	LDA #$00 ; Attributes
	STA SpriteDMAArea + 6
	LDA #$23 ; X
	STA SpriteDMAArea + 7

	JSR WaitForNMI_TurnOnPPU

Debug_MenuLoop:
	JSR WaitForNMI

	LDA Debug_CurrentMenuOption ; Update cursor sprite
	ASL A
	ASL A
	ASL A
	ASL A
	CLC
	ADC #$4A ; Move the cursor
	STA SpriteDMAArea
	STA SpriteDMAArea + 4

	LDA Player1JoypadPress ; Check if we should abort
	CMP #ControllerInput_B
	BEQ Debug_DoAbort

	LDA Player1JoypadPress ; Check if we should activate
	CMP #ControllerInput_A
	BEQ Debug_DoActivate

	LDA Player1JoypadPress ; Check if we should activate
	CMP #ControllerInput_Start
	BEQ Debug_DoActivate

	CMP #ControllerInput_Down ; Otherwise, move the cursor down?
	BEQ Debug_MenuDown

	CMP #ControllerInput_Up ; Maybe up instead?
	BEQ Debug_MenuUp

	LDA Debug_CurrentMenuOption

	JSR JumpToTableAfterJump

	.dw DebugMenu_Level
	.dw DebugMenu_Area
	.dw DebugMenu_Character
	.dw DebugMenu_Lives
	.dw DebugMenu_Health


Debug_DoAbort:
	JMP Debug_Abort

Debug_DoActivate:
	JSR Debug_MenuConfirm

	JSR Debug_Reset

	; Update stats and level
	LDA Debug_Character
	STA CurrentCharacter
	LDA Debug_Lives
	STA ExtraLives

	LDA Debug_ExtraHealth
	STA PlayerMaxHealth

	; Set the current level/area
	LDA Debug_Level
	STA CurrentLevel
	STA CurrentLevel_Init
	LDA Debug_Area
	STA CurrentLevelArea
	STA CurrentLevelArea_Init
	LDA #$00
	STA CurrentLevelPage
	STA CurrentLevelEntryPage
	STA CurrentLevelEntryPage_Init


	; Determine the world the level is in
	LDA Debug_Level
	LDY #$00
-
	INY
	CMP WorldStartingLevel, Y
	BCS -

	DEY
	STY CurrentWorld

	; Activate!
	JMP Debug_Activate


Debug_MenuUp:
	DEC Debug_CurrentMenuOption
	BPL +

	LDA #Debug_MenuOptionCount - 1
	STA Debug_CurrentMenuOption

	BNE +

Debug_MenuDown:
	INC Debug_CurrentMenuOption

	LDA Debug_CurrentMenuOption
	CMP #Debug_MenuOptionCount
	BCC +

	LDA #$00
	STA Debug_CurrentMenuOption

+
	JSR Debug_MenuMove
	JMP Debug_MenuLoop


DebugMenu_DoNothing:
-f
	JSR Debug_MenuError
-q
	JMP Debug_MenuLoop


DebugMenu_Level:
	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, decrease
	BEQ +l
	CMP #ControllerInput_Right ; If right, increase
	BEQ +r
	BNE -q
+l	LDA Debug_Level ; Check current world...
	BEQ -f ; Level is already 0, go away
	DEC Debug_Level ; Decrease
	JMP +s ; Skip ahead
+r	LDA Debug_Level
	CMP #WorldStartingLevel + 7
	BEQ -f ; Already at last level, go away
	INC Debug_Level ; Otherwise increase
+s
	LDA #$00
	STA Debug_Area
	JSR Debug_MenuChange
	JSR Debug_UpdateLevel
	JMP Debug_MenuLoop


DebugMenu_Area:
	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, decrease
	BEQ +l
	CMP #ControllerInput_Right ; If right, increase
	BEQ +r
	BNE +q
+l
	LDA Debug_Area ; Check current area...
	BEQ +f ; Area is already 0, go away
	DEC Debug_Area ; Decrease
	JMP +s ; Skip ahead
+r
	LDA Debug_Area
	CMP #$09
	BEQ +f ; Already at area 9, go away
	INC Debug_Area ; Otherwise increase
+s
	JSR Debug_MenuChange
	JSR Debug_UpdateArea
	JMP Debug_MenuLoop

-f
+f
	JSR Debug_MenuError
+q
-q
	JMP Debug_MenuLoop


DebugMenu_Character:
	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, decrease
	BEQ +l
	CMP #ControllerInput_Right ; If right, increase
	BEQ +r
	BNE -q
+l
	LDA Debug_Character ; Check current character...
	BEQ -f ; Character is already 0, go away
	DEC Debug_Character ; Decrease
	JMP +s ; Skip ahead
+r
	LDA Debug_Character
	CMP #$03
	BEQ -f ; Already at character 3, go away
	INC Debug_Character ; Otherwise increase
+s
	JSR Debug_MenuChange
	JSR Debug_UpdateCharacter
	JMP Debug_MenuLoop

DebugMenu_Lives:
	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, decrease
	BEQ +l
	CMP #ControllerInput_Right ; If right, increase
	BEQ +r
	BNE -q
+l
	LDA Debug_Lives
	CMP #$02
	BCC -f
	DEC Debug_Lives ; Decrease
	JMP +s ; Skip ahead
+r
	LDA Debug_Lives
	CMP #$64
	BEQ -f ; Already maxed out
	INC Debug_Lives ; Otherwise increase
+s
	JSR Debug_MenuChange
	JSR Debug_UpdateLives
	JMP Debug_MenuLoop

DebugMenu_Health:
	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, decrease
	BEQ +l
	CMP #ControllerInput_Right ; If right, increase
	BEQ +r
	BNE -q
+l	LDA Debug_ExtraHealth ; Check current character...
	BEQ -f ; Already 2 max health
	DEC Debug_ExtraHealth ; Decrease
	JMP +s ; Skip ahead
+r	LDA Debug_ExtraHealth
	CMP #$02
	BEQ -f ; Already 4 max health
	INC Debug_ExtraHealth ; Otherwise increase
+s
	JSR Debug_MenuChange
	JSR Debug_UpdateHealth
	JMP Debug_MenuLoop


Debug_MenuStart:
	LDA #DPCM_PlayerDeath
	STA DPCMQueue
	RTS

Debug_MenuMove:
Debug_MenuChange:
	LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1
	RTS

Debug_MenuConfirm:
	LDA #SoundEffect2_CoinGet
	STA SoundEffectQueue2
	RTS

Debug_MenuError:
	LDA #DPCM_PlayerHurt
	STA DPCMQueue
	; LDA #SoundEffect1_HawkOpen_WartBarf
	; STA SoundEffectQueue1
	RTS

Debug_Reset:
	LDA #$00

	; Reset some player stuff
	STA InSubspaceOrJar
	STA InJarType
	STA PlayerLock
	STA PlayerState
	STA PlayerStateTimer
	STA ObjectBeingCarriedIndex
	STA HoldingItem
	STA PlayerRidingCarpet
	STA PlayerAnimationFrame

	; Destroy the enemies
	LDX #$08
-
	STA EnemyState, X
	DEX
	BPL -

	; Reset the area
	JSR DoAreaReset

	; Initialize level stuff before custom updates
	JSR InitializeSomeLevelStuff

	RTS

; Part of update menu screen loop pls ignore
-:
	JSR Debug_BufferText ; Draw requested text
	PLA ; Pull the value to update...
	CLC
	ADC #$D0 ; Move to character offset
	STA PPUBuffer_301 + 3
	RTS

Debug_UpdateArea:
	LDA Debug_Area ; Load current area
	PHA ; Push onto stack
	LDA #$0B ; Load text to update
	BNE - ; Go do that.

Debug_UpdateCharacter:
	LDA #$0C ; Load text offset of Mario (0)
	CLC
	ADC Debug_Character ; Add the character index ...
	JSR Debug_BufferText ; ...and draw it.
	RTS

Debug_UpdateLives:
	LDA #$10
	JSR Debug_BufferText
	LDA Debug_Lives
	SEC
	SBC #$01
	JSR GetTwoDigitNumberTiles
	STY PPUBuffer_301 + 3
	STA PPUBuffer_301 + 4
	RTS


Debug_UpdateHealth:
	LDA Debug_ExtraHealth ; Load current area
	CLC
	ADC #$02
	PHA ; Push onto stack
	LDA #$11 ; Load text offset
	BNE - ; Go do that.

Debug_UpdateLevel:
	LDX #$00 ; Set X to 0
-
	LDA Debug_Level ; Get the starting level index
	CMP WorldStartingLevel, X ; Is it higher than our current level?
	BCC + ; Yep, jump outta here
	INX ; No, try next index
	BNE -
; At this point, X has the index we used
+
	DEX ; Go down one
	TXA ; This is current world - 1
	PHA ; Stuff onto stack
	LDA Debug_Level
	SEC
	SBC WorldStartingLevel, X ; Get the starting level index
	PHA

	LDA #$0A ; Load text to update
	JSR Debug_BufferText ; ...and draw it.
	PLA ; Then draw the level number...
	CLC
	ADC #$D1
	STA PPUBuffer_301 + 9
	PLA ; ...and the world number...
	CLC
	ADC #$D1
	STA PPUBuffer_301 + 7
	LDA Debug_Level ; ...and the internal level number high nybble...
	LSR
	LSR
	LSR
	LSR
	CLC
	ADC #$D0
	STA PPUBuffer_301 + 3
	LDA Debug_Level ; ...and the internal level number low nybble.
	AND #$0F
	CLC
	ADC #$D0
	STA PPUBuffer_301 + 4

	LDA Debug_Area ; Load current area
	CLC
	ADC #$D0
	STA PPUBuffer_301 + 13

	RTS

; WorldStartingLevel


Debug_BufferText:
	ASL A ; Rotate A left one
	TAX ; A->X
	LDA DebugPPU_TextPointers, X ; Load low pointer
	STA byte_RAM_0 ; Store one byte to low address
	LDA DebugPPU_TextPointers + 1, X ; Store high pointer
	STA byte_RAM_1 ; Store one byte to low address
	LDY #$00
	LDA (byte_RAM_0), Y ; Load the length of data to copy
	TAY
-
	LDA (byte_RAM_0), Y ; Load our PPU data...
	STA PPUBuffer_301 - 1, Y ; ...and store it in the buffer
	DEY
	BNE -
	RTS


DebugPPU_TextPointers:
	.dw DebugPPU_DebugText ; $00
	.dw DebugPPU_StartText ; $01
	.dw DebugPPU_CancelText ; $02

	.dw DebugPPU_Nothing ; $03
	.dw DebugPPU_LevelText ; $04
	.dw DebugPPU_AreaText ; $05
	.dw DebugPPU_CharacterText ; $06
	.dw DebugPPU_LivesText ; $07
	.dw DebugPPU_HealthText ; $08

	.dw DebugPPU_Nothing ; $09
	.dw DebugPPU_UpdateLevelArea ; $0A
	.dw DebugPPU_UpdateArea ; $0B
	.dw DebugPPU_UpdateCharacter0 ; $0C
	.dw DebugPPU_UpdateCharacter1 ; $0D
	.dw DebugPPU_UpdateCharacter2 ; $0E
	.dw DebugPPU_UpdateCharacter3 ; $0F
	.dw DebugPPU_UpdateLives ; $10
	.dw DebugPPU_UpdateHealth ; $11


DebugPPU_Nothing:
	.db $02, $00


DebugPPU_DebugText:
	.db $0A+4
	.db $20, $8B, $0A
	.db $DD, $DE, $DB, $EE, $E0, $FB, $E6, $DE, $E7, $EE ; DEBUG MENU
	.db $00

DebugPPU_LevelText:
	.db $05+4
	.db $21, $46, $05
	.db $E5, $DE, $EF, $DE, $E5 ; LEVEL
	.db $00

DebugPPU_AreaText:
	.db $04+4
	.db $21, $86, $04
	.db $DA, $EB, $DE, $DA ; AREA
	.db $00

DebugPPU_CharacterText:
	.db $09+4
	.db $21, $C6, $09
	.db $DC, $E1, $DA, $EB, $DA, $DC, $ED, $DE, $EB ; CHARACTER
	.db $00

DebugPPU_LivesText:
	.db $0A+4
	.db $22, $06, $0A
	.db $DE, $F1, $ED, $EB, $DA, $FB, $E5, $E2, $DF, $DE ; EXTRA LIFE
	.db $00

DebugPPU_HealthText:
	.db $06+4
	.db $22, $46, $06
	.db $E1, $DE, $DA, $E5, $ED, $E1 ; HEALTH
	.db $00

DebugPPU_StartText:
	.db $12+4
	.db $23, $07, $12
	.db $DA, $FB, $DB, $EE, $ED, $ED, $E8, $E7  ; A BUTTON
	.db $FB, $CF, $CF, $CF, $FB  ; ...
	.db $EC, $ED, $DA, $EB, $ED ; START
	.db $00

DebugPPU_CancelText:
	.db $13+4
	.db $23, $27, $13
	.db $DB, $FB, $DB, $EE, $ED, $ED, $E8, $E7  ; B BUTTON
	.db $FB, $CF, $CF, $CF, $FB  ; ...
	.db $DC, $DA, $E7, $DC, $DE, $E5 ; CANCEL
	.db $00

DebugPPU_UpdateLevelArea:
	.db $08+7+1
	.db $21, $54, $07
	.db $F5, $F5, $FB, $FB, $F5, $F4, $F5 ; ??  ?-?
	.db $21, $9A, $01
	.db $F5 ; ?
	.db $00

DebugPPU_UpdateLevel:
	.db $07+4
	.db $21, $54, $07
	.db $F5, $F5, $FB, $FB, $F5, $F4, $F5 ; ??  ?-?
	.db $00

DebugPPU_UpdateArea:
	.db $01+4
	.db $21, $9A, $01
	.db $F5 ; ?
	.db $00

DebugPPU_UpdateCharacter0:
	.db $0A+4
	.db $21, $D3, $08
	.db $FB, $FB, $FB, $E6, $DA, $EB, $E2, $E8 ; MARIO
	.db $00

DebugPPU_UpdateCharacter1:
	.db $0A+4
	.db $21, $D3, $08
	.db $E9, $EB, $E2, $E7, $DC, $DE, $EC, $EC ; PRINCESS
	.db $00

DebugPPU_UpdateCharacter2:
	.db $0A+4
	.db $21, $D3, $08
	.db $FB, $FB, $FB, $FB, $ED, $E8, $DA, $DD ; TOAD
	.db $00

DebugPPU_UpdateCharacter3:
	.db $0A+4
	.db $21, $D3, $08
	.db $FB, $FB, $FB, $E5, $EE, $E2, $E0, $E2 ; LUIGI
	.db $00

DebugPPU_UpdateLives:
	.db $02+4
	.db $22, $19, $02
	.db $F5, $F5 ; ??
	.db $00

DebugPPU_UpdateHealth:
	.db $01+4
	.db $22, $5A, $01
	.db $D2 ; 2
	.db $00
