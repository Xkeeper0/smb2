
; Custom debug menu for SMB2, probably to help with speedrunners
; or just testing this disassembly.

Debug_Stash = $7F30

Debug_World = $7FD0
Debug_Level = $7FD1
Debug_Area = $7FD2
; @TODO: page, X/Y, transition type
Debug_Character = $7FD3
Debug_Lives = $7FD4
Debug_Continues = $7FD5
Debug_Health = $7FD6
Debug_MaxHealth = $7FD7

Debug_JumpAddressLo = $7FE0
Debug_JumpAddressHi = $7FE1

Debug_StashA = $7FE2
Debug_StashX = $7FE3
Debug_StashY = $7FE4
Debug_StashP = $7FE5

Debug_CursorTileOffset = $7FEB
Debug_Temp = $7FEC
Debug_PPUPointerOffset = $7FED
Debug_CurrentMenuOption = $7FEE
Debug_InMenu = $7FEF

.ignorenl

Debug_MenuOptionCount = $08

.endinl


DebugMenu_Init:
	LDA #$00
	STA Debug_CursorTileOffset
	STA Debug_PPUPointerOffset
	LDA #$04
	STA Debug_CurrentMenuOption

	; Copy current stats
	LDA CurrentCharacter
	STA Debug_Character
	LDA ExtraLives
	STA Debug_Lives
	LDA Continues
	STA Debug_Continues
	LDA PlayerHealth
	LSR A
	LSR A
	LSR A
	LSR A
	STA Debug_Health
	LDA PlayerMaxHealth
	CLC
	ADC #$01
	CMP #$03
	BCC +
	LDA #$03
	+
	STA Debug_MaxHealth

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

	; Turn off the PPU immediately (avoids a glitched frame)
	LDA #$00
	STA PPUMaskMirror
	STA PPUMASK

	JSR WaitForNMI

	; Fun little sound
	JSR DebugMenu_MenuStart

	JSR DisableNMI

	JSR SetScrollXYTo0
	JSR DebugMenu_SetPalette
	JSR ClearNametablesAndSprites

	LDA #CHRBank_EnemiesIce
	STA BackgroundCHR1
	LDA #CHRBank_TitleScreenBG2
	STA BackgroundCHR2
	LDA #CHRBank_EnemiesGrass
	STA SpriteCHR1
	LDA #CHRBank_EnemiesDesert
	STA SpriteCHR2
	LDA #CHRBank_CharacterSelectSprites
	STA SpriteCHR3
	LDA #CHRBank_Animated1 + 1
	STA SpriteCHR4

	JSR EnableNMI

	; Draw debug menu text
	LDA #$00
	STA Debug_PPUPointerOffset
-
	JSR DebugMenu_BufferText
	JSR WaitForNMI
	INC Debug_PPUPointerOffset
	LDA Debug_PPUPointerOffset
	CMP #$0A
	BCC -

	JSR DebugMenu_UpdateCharacter
	JSR WaitForNMI
	JSR DebugMenu_UpdateHealth
	JSR WaitForNMI
	JSR DebugMenu_UpdateLives
	JSR WaitForNMI
	JSR DebugMenu_UpdateContinues
	JSR WaitForNMI
	JSR DebugMenu_UpdateLevel
	JSR WaitForNMI
	JSR DebugMenu_UpdateArea
	JSR WaitForNMI

	JSR DebugMenu_UpdateCursor
	JSR DebugMenu_InitCharacterSprite

	JSR WaitForNMI_TurnOnPPU


DebugMenu_MenuLoop:
	JSR WaitForNMI

	JSR DebugMenu_UpdateCursor
	JSR DebugMenu_UpdateCharacterSprite

	LDA Player1JoypadPress ; Check if we should abort
	CMP #ControllerInput_B
	BEQ DebugMenu_DoReturn

	CMP #ControllerInput_Down ; Otherwise, move the cursor down?
	BEQ DebugMenu_MenuDown

	CMP #ControllerInput_Up ; Maybe up instead?
	BEQ DebugMenu_MenuUp

	LDA Debug_CurrentMenuOption
	JSR JumpToTableAfterJump

	.dw DebugMenu_Character
	.dw DebugMenu_Health
	.dw DebugMenu_Lives
	.dw DebugMenu_Continues
	.dw DebugMenu_RestartArea
	.dw DebugMenu_Level
	.dw DebugMenu_Area
	.dw DebugMenu_StartLevel


DebugMenu_MenuUp:
	DEC Debug_CurrentMenuOption
	BPL +

	LDA #Debug_MenuOptionCount - 1
	STA Debug_CurrentMenuOption

	BNE +

DebugMenu_MenuDown:
	INC Debug_CurrentMenuOption

	LDA Debug_CurrentMenuOption
	CMP #Debug_MenuOptionCount
	BCC +

	LDA #$00
	STA Debug_CurrentMenuOption

+
	JSR DebugMenu_MenuMove
	JMP DebugMenu_MenuLoop


DebugMenu_CursorPosition:
	.db $1B, $3A, $78, $7A, %00000010 ; Character
	.db $1B, $4A, $78, $7A, %00000010 ; Health
	.db $1B, $5A, $78, $7A, %00000010 ; Extra Life
	.db $1B, $6A, $78, $7A, %00000010 ; Continues
	.db $3B, $82, $0E, $0C, %01000001 ; Restart Area
	.db $1B, $9A, $3C, $3C, %00001001 ; Level
	.db $8B, $9A, $3E, $3E, %00001001 ; Area
	.db $43, $B2, $16, $14, %01000011 ; Load Level

DebugMenu_WorldTileOffset:
	.db $00
	.db $40
	.db $00
	.db $01
	.db $00
	.db $40
	.db $41


DebugMenu_Return:
	LDA Player1JoypadPress
	CMP #ControllerInput_Start
	BEQ DebugMenu_DoReturn
DebugMenu_JumpMenuLoop:
	JMP DebugMenu_MenuLoop

DebugMenu_DoReturn:
	JSR DebugMenu_ApplyOptions

	JSR DebugMenu_LoadCharacter

	JSR DebugHook_ExitToAddressAfterJump
	.dw HidePauseScreen


DebugMenu_RestartArea:
	LDA Player1JoypadPress
	CMP #ControllerInput_Start
	BNE DebugMenu_JumpMenuLoop

DebugMenu_DoRestartArea:
	JSR DebugMenu_ApplyOptions

	JSR DebugMenu_LoadCharacter
	JSR DebugMenu_ResetArea

	JSR DebugHook_ExitToAddressAfterJump
	.dw StartLevel


DebugMenu_StartLevel:
	LDA Player1JoypadPress
	CMP #ControllerInput_Start
	BNE DebugMenu_JumpMenuLoop

DebugMenu_DoStartLevel:
	LDA #Music2_StopMusic
	STA MusicQueue2

	JSR WaitForNMI

	JSR DebugMenu_MenuConfirm

	JSR DebugMenu_FullReset

	JSR DebugMenu_ApplyOptions

	; Set the current character
	LDA Debug_Character
	STA CurrentCharacter

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
	JSR DebugMenu_GetWorld
	STY CurrentWorld

	LDY #GameMode_TitleCard
	JSR DebugHook_ExitToAddressAfterJump
	.dw ShowCardAfterTransition


DebugMenu_CursorRestartArea:
	LDA #$04
	STA Debug_CurrentMenuOption
	JMP DebugMenu_MenuLoop

DebugMenu_CursorStartLevel:
	LDA #$07
	STA Debug_CurrentMenuOption
	JMP DebugMenu_MenuLoop

DebugMenu_Level:
	LDA Player1JoypadPress
	CMP #ControllerInput_Start
	BEQ DebugMenu_CursorStartLevel

	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, decrease
	BEQ +l
	CMP #ControllerInput_Right ; If right, increase
	BEQ +r
	BNE +q
+l
	LDA Debug_Level ; Check current level...
	BEQ +f ; Level is already 0, go away
	DEC Debug_Level ; Decrease
	JMP +s ; Skip ahead
+r
	LDA Debug_Level
	CLC
	ADC #$01
	CMP #WorldStartingLevel + 7
	BEQ +f ; Already at last level, go away
	INC Debug_Level ; Otherwise increase
+s
	LDA Debug_Level
	JSR DebugMenu_GetWorld
	STY Debug_World

	LDA #$00
	STA Debug_Area

	JSR DebugMenu_MenuChange
	JSR DebugMenu_UpdateLevel

	JMP DebugMenu_MenuLoop

-f
+f
	JSR DebugMenu_MenuError
+q
-q
	JMP DebugMenu_MenuLoop


DebugMenu_Area:
	LDA Player1JoypadPress
	CMP #ControllerInput_Start
	BEQ DebugMenu_CursorStartLevel

	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, decrease
	BEQ +l
	CMP #ControllerInput_Right ; If right, increase
	BEQ +r
	BNE +q
+l
	LDA Debug_Area ; Check current area...
	BEQ -f ; Area is already 0, go away
	DEC Debug_Area ; Decrease
	JMP +s ; Skip ahead
+r
	LDA Debug_Area
	CMP #$09
	BEQ -f ; Already at area 9, go away
	INC Debug_Area ; Otherwise increase
+s
	JSR DebugMenu_MenuChange
	JSR DebugMenu_UpdateArea
+q
	JMP DebugMenu_MenuLoop


DebugMenu_Character:
	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, decrease
	BEQ +l
	CMP #ControllerInput_Right ; If right, increase
	BEQ +r
	BNE +q
+l
	DEC Debug_Character ; Decrease
	JMP +s ; Skip ahead
+r
	INC Debug_Character ; Otherwise increase
+s
	LDA Debug_Character
	AND #$03
	STA Debug_Character

	JSR DebugMenu_MenuChange
	JSR DebugMenu_UpdateCharacter
+q
	JMP DebugMenu_MenuLoop

DebugMenu_Lives:
	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, decrease
	BEQ +l
	CMP #ControllerInput_Right ; If right, increase
	BEQ +r
	BNE +q
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
	JSR DebugMenu_MenuChange
	JSR DebugMenu_UpdateLives
+q
	JMP DebugMenu_MenuLoop

DebugMenu_Continues:
	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, decrease
	BEQ +l
	CMP #ControllerInput_Right ; If right, increase
	BEQ +r
	BNE +q
+l
	LDA Debug_Continues
	BEQ +f
	DEC Debug_Continues ; Decrease
	JMP +s ; Skip ahead
+r
	LDA Debug_Continues
	CMP #$09
	BEQ +f ; Already maxed out
	INC Debug_Continues ; Otherwise increase
+s
	JSR DebugMenu_MenuChange
	JSR DebugMenu_UpdateContinues
+q
-q
	JMP DebugMenu_MenuLoop

DebugMenu_Health:
	LDA Player1JoypadPress
	CMP #ControllerInput_Left ; If left, increase
	BEQ +l
	CMP #ControllerInput_Right ; If right, decrease
	BEQ +r
	BNE +q
+l
	LDA Debug_Health
	CMP Debug_MaxHealth
	BCC +
	; Increase max health, if we can
	LDA Debug_MaxHealth
	CMP #$03
	BCS +f ; Already 4 max health
	INC Debug_MaxHealth
	LDA Debug_MaxHealth
	STA Debug_Health
	BNE +s ; Skip ahead
	+
	; Increase health
	INC Debug_Health
	BNE +s ; Skip ahead
+r
	LDA Debug_Health
	BEQ +
	; Decrease health
	DEC Debug_Health
	BPL +s ; Skip ahead
	+
	; Decrease max health, if we can
	LDA Debug_MaxHealth
	CMP #$02
	BCC +f ; Already 2 max hearts
	DEC Debug_MaxHealth
+s
	JSR DebugMenu_MenuChange
	JSR DebugMenu_UpdateHealth
	JMP DebugMenu_MenuLoop

-f
+f
	JSR DebugMenu_MenuError
+q
-q
	JMP DebugMenu_MenuLoop

DebugMenu_MenuStart:
	LDA #DPCM_PlayerDeath
	STA DPCMQueue
	RTS

DebugMenu_MenuMove:
DebugMenu_MenuChange:
	LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1
	RTS

DebugMenu_MenuConfirm:
	LDA #SoundEffect2_CoinGet
	STA SoundEffectQueue2
	RTS

DebugMenu_MenuError:
	LDA #DPCM_PlayerHurt
	STA DPCMQueue
	RTS


;
; Applies the current options to the player
;
DebugMenu_ApplyOptions:
	LDA Debug_Lives
	STA ExtraLives
	LDA Debug_Continues
	STA Continues

	LDA #PlayerHealth_2_HP
	LDA Debug_Health
	ASL A
	ASL A
	ASL A
	ASL A
	ORA #$0F
	STA PlayerHealth
	LDA Debug_MaxHealth
	SEC
	SBC #$01
	STA PlayerMaxHealth

	RTS


;
; Loads the the current character if there was a change
;
DebugMenu_LoadCharacter:
	LDA Debug_Character
	CMP CurrentCharacter
	BEQ +

	STA CurrentCharacter
	JSR CopyCharacterStatsAndStuff

+
	RTS


;
; Resets a bunch of stuff in the area so that the player can start from the
; previous transition
;
DebugMenu_ResetArea:
	JSR LoadWorldCHRBanks

	LDA CurrentLevel_Init
	STA CurrentLevel
	LDA CurrentLevelArea_Init
	STA CurrentLevelArea
	LDA CurrentLevelEntryPage_Init
	STA CurrentLevelEntryPage
	LDA TransitionType_Init
	STA TransitionType

	LDA PlayerXLo_Init
	STA PlayerXLo
	LDA PlayerYLo_Init
	STA PlayerYLo
	LDA PlayerScreenX_Init
	STA PlayerScreenX
	LDA PlayerScreenYLo_Init
	STA PlayerScreenYLo
	LDA PlayerYVelocity_Init
	STA PlayerYVelocity
	LDA PlayerState_Init
	STA PlayerState

	LDA #$00
	STA PlayerXVelocity

	JSR DoAreaReset

	RTS


DebugMenu_FullReset:
	; Reset a bunch of level flags
	LDA #$00
	STA KeyUsed
	STA Mushroom1upPulled
	STA Mushroom1Pulled
	STA Mushroom2Pulled
	STA SubspaceVisits
	STA EnemiesKilledForHeart

DebugMenu_Reset:
	; Reset (mainly) player-related flags
	LDA #$00
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
-
	JSR DebugMenu_BufferText ; Draw requested text
	PLA ; Pull the value to update...
	CLC
	ADC #$D0 ; Move to character offset
	STA PPUBuffer_301 + 3
	RTS

DebugMenu_UpdateArea:
	LDA Debug_Area ; Load current area
	PHA ; Push onto stack
	LDA #$0B ; Load text to update
	BNE - ; Go do that.

DebugMenu_UpdateCharacter:
	LDA #$0C ; Load text offset of Mario (0)
	CLC
	ADC Debug_Character ; Add the character index ...
	JSR DebugMenu_BufferText ; ...and draw it.
	RTS

DebugMenu_UpdateLives:
	LDA #$10
	JSR DebugMenu_BufferText
	LDA Debug_Lives
	SEC
	SBC #$01
	JSR GetTwoDigitNumberTiles
	STY PPUBuffer_301 + 3
	STA PPUBuffer_301 + 4
	RTS

DebugMenu_UpdateContinues:
	LDA #$12
	JSR DebugMenu_BufferText
	LDA Debug_Continues
	CLC
	ADC #$D0
	STA PPUBuffer_301 + 3
	RTS


DebugMenu_UpdateHealth:
	LDA #$13
	JSR DebugMenu_BufferText

	; Fill the dots
	LDY #$00
	LDX #$04
	-
	LDA #$FD
	CPY Debug_Health
	BCC +
	LDA #$FC
	CPY Debug_MaxHealth
	BCC +
	LDA #$CF
	+
	STA PPUBuffer_301 + 3, X
	INY
	DEX
	DEX
	BPL -

	RTS


DebugMenu_UpdateLevel:
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
	JSR DebugMenu_BufferText ; ...and draw it.
	PLA ; Then draw the level number...
	CLC
	ADC #$D1
	STA PPUBuffer_301 + 5
	PLA ; ...and the world number...
	CLC
	ADC #$D1
	STA PPUBuffer_301 + 3

	LDA Debug_Area ; Load current area
	CLC
	ADC #$D0
	STA PPUBuffer_301 + 9

	RTS


DebugMenu_BufferText:
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


DebugMenu_GetWorld:
	LDY #$00
-
	INY
	CMP WorldStartingLevel, Y
	BCS -

	DEY
	RTS


DebugMenu_UpdateCursor:
	LDA Debug_CurrentMenuOption
	JSR JumpToTableAfterJump

	.dw DebugMenu_UpdateCursorWithNoOffset ; Character
	.dw DebugMenu_UpdateCursorWithNoOffset ; Health
	.dw DebugMenu_UpdateCursorWithNoOffset ; Extra Life
	.dw DebugMenu_UpdateCursorWithNoOffset ; Continues
	.dw DebugMenu_UpdateCursorWithNoOffset ; Restart Area
	.dw DebugMenu_UpdateCursorWithWorldOffset ; Level
	.dw DebugMenu_UpdateCursorWithWorldOffset ; Area
	.dw DebugMenu_UpdateCursorWithNoOffset ; Load Level


DebugMenu_UpdateCursorWithNoOffset:
	LDA #$00
	STA Debug_CursorTileOffset
	BEQ DebugMenu_UpdateCursorWithTileOffset

DebugMenu_UpdateCursorWithWorldOffset:
	LDY Debug_World
	LDA DebugMenu_WorldTileOffset, Y
	STA Debug_CursorTileOffset

DebugMenu_UpdateCursorWithTileOffset:
	LDA Debug_CurrentMenuOption
	ASL A
	ASL A
	CLC
	ADC Debug_CurrentMenuOption

	; x-position
	TAX
	LDA DebugMenu_CursorPosition, X
	STA SpriteDMAArea + 3
	CLC
	ADC #$08
	STA SpriteDMAArea + 7

	; y-position
	INX
	LDA DebugMenu_CursorPosition, X
	STA SpriteDMAArea
	STA SpriteDMAArea + 4

	; tile
	INX
	LDA DebugMenu_CursorPosition, X
	CLC
	ADC Debug_CursorTileOffset
	STA SpriteDMAArea + 1
	INX
	LDA DebugMenu_CursorPosition, X
	CLC
	ADC Debug_CursorTileOffset
	STA SpriteDMAArea + 5

	; attributes
	INX
	LDA DebugMenu_CursorPosition, X
	AND #%11100011
	STA Debug_Temp
	STA SpriteDMAArea + 2
	LDA DebugMenu_CursorPosition, X
	ASL A
	ASL A
	ASL A
	EOR Debug_Temp
	STA SpriteDMAArea + 6

	RTS


DebugMenu_SetPalette:
	LDA PPUSTATUS
	LDA #$3F
	LDY #$00
	STA PPUADDR
	STY PPUADDR

-
	LDA DebugMenu_Palette, Y
	STA PPUDATA
	INY
	CPY #$20
	BCC -

	RTS

DebugMenu_InitCharacterSprite:
	; x-position
	LDA #$D8
	STA SpriteDMAArea + 11
	STA SpriteDMAArea + 19
	CLC
	ADC #$08
	STA SpriteDMAArea + 15
	STA SpriteDMAArea + 23

	; y-position
	LDA #$28
	STA SpriteDMAArea + 8
	STA SpriteDMAArea + 12
	CLC
	ADC #$10
	STA SpriteDMAArea + 16
	STA SpriteDMAArea + 20

	; attributes
	LDA #%00000000
	STA SpriteDMAArea + 10
	STA SpriteDMAArea + 18
	ORA #%01000000
	STA SpriteDMAArea + 14
	STA SpriteDMAArea + 22

	; tile
	LDX #$80
	STX SpriteDMAArea + 9
	STX SpriteDMAArea + 13
	INX
	INX
	STX SpriteDMAArea + 17
	STX SpriteDMAArea + 21

	RTS

DebugMenu_UpdateCharacterSprite:
	; tile
	LDX Debug_Character
	LDA DebugMenu_CharacterStartTile, X
	TAX
	STX SpriteDMAArea + 9
	STX SpriteDMAArea + 13
	INX
	INX
	STX SpriteDMAArea + 17
	STX SpriteDMAArea + 21

	RTS

DebugMenu_CharacterStartTile:
	.db $80 ; Mario
	.db $8C ; Princess
	.db $88 ; Toad
	.db $84 ; Luigi

DebugMenu_Palette:
	.db $22, $30, $16, $0F
	.db $22, $38, $38, $0F
	.db $22, $25, $16, $0F
	.db $22, $30, $1A, $0F
	.db $22, $30, $30, $0F
	.db $22, $30, $16, $0F
	.db $22, $38, $27, $0F
	.db $22, $30, $25, $0F


DebugPPU_TextPointers:
	.dw DebugPPU_DebugText ; $00
	.dw DebugPPU_Version ; $01
	.dw DebugPPU_RestartAreaText ; $02
	.dw DebugPPU_StartLevelText ; $03

	.dw DebugPPU_CharacterText ; $04
	.dw DebugPPU_HealthText ; $05
	.dw DebugPPU_LivesText ; $06
	.dw DebugPPU_ContinuesText ; $07
	.dw DebugPPU_LevelText ; $08
	.dw DebugPPU_AreaText ; $09

	.dw DebugPPU_UpdateLevelArea ; $0A
	.dw DebugPPU_UpdateArea ; $0B
	.dw DebugPPU_UpdateCharacter0 ; $0C
	.dw DebugPPU_UpdateCharacter1 ; $0D
	.dw DebugPPU_UpdateCharacter2 ; $0E
	.dw DebugPPU_UpdateCharacter3 ; $0F
	.dw DebugPPU_UpdateLives ; $10
	.dw DebugPPU_UpdateHealth ; $11
	.dw DebugPPU_UpdateContinues ; $12
	.dw DebugPPU_UpdateHealthBar ; $13


DebugPPU_Nothing:
	.db $02, $00

DebugPPU_DebugText:
	.db 3+$0E+1
	.db $20, $89, $0E
	.db $CF, $FB, $DD, $DE, $DB, $EE, $E0, $FB, $E6, $DE, $E7, $EE, $FB, $CF ; DEBUG MENU
	.db $00

DebugPPU_CharacterText:
	.db 3+$09+1
	.db $21, $06, $09
	.db $DC, $E1, $DA, $EB, $DA, $DC, $ED, $DE, $EB ; CHARACTER
	.db $00

DebugPPU_HealthText:
	.db 3+$06+1
	.db $21, $46, $06
	.db $E1, $DE, $DA, $E5, $ED, $E1 ; HEALTH
	.db $00

DebugPPU_LivesText:
	.db 3+$0A+1
	.db $21, $86, $0A
	.db $DE, $F1, $ED, $EB, $DA, $FB, $E5, $E2, $DF, $DE ; EXTRA LIFE
	.db $00

DebugPPU_ContinuesText:
	.db 3+$09+1
	.db $21, $C6, $09
	.db $DC, $E8, $E7, $ED, $E2, $E7, $EE, $DE, $EC ; CONTINUES
	.db $00

DebugPPU_RestartAreaText:
	.db 3+$0C+1
	.db $22, $2A, $0C
	.db $EB, $DE, $EC, $ED, $DA, $EB, $ED, $FB, $DA, $EB, $DE, $DA ; RESTART AREA
	.db $00

DebugPPU_LevelText:
	.db 3+$05+1
	.db $22, $86, $05
	.db $E5, $DE, $EF, $DE, $E5 ; LEVEL
	.db $00

DebugPPU_AreaText:
	.db 3+$04+1
	.db $22, $94, $04
	.db $DA, $EB, $DE, $DA ; AREA
	.db $00

DebugPPU_StartLevelText:
	.db 3+$0A+1
	.db $22, $EB, $0A
	.db $E5, $E8, $DA, $DD, $FB, $E5, $DE, $EF, $DE, $E5 ; LOAD LEVEL
	.db $00

DebugPPU_UpdateCharacter0:
	.db 3+$08+3+$03+1
	.db $21, $12, $08
	.db $FB, $FB, $FB, $E6, $DA, $EB, $E2, $E8 ; MARIO
	.db $3F, $11, $03
	.db $27, $16, $01
	.db $00

DebugPPU_UpdateCharacter1:
	.db 3+$08+3+$03+1
	.db $21, $12, $08
	.db $E9, $EB, $E2, $E7, $DC, $DE, $EC, $EC ; PRINCESS
	.db $3F, $11, $03
	.db $36, $25, $07
	.db $00

DebugPPU_UpdateCharacter2:
	.db 3+$08+3+$03+1
	.db $21, $12, $08
	.db $FB, $FB, $FB, $FB, $ED, $E8, $DA, $DD ; TOAD
	.db $3F, $11, $03
	.db $27, $30, $01
	.db $00

DebugPPU_UpdateCharacter3:
	.db 3+$08+3+$03+1
	.db $21, $12, $08
	.db $FB, $FB, $FB, $E5, $EE, $E2, $E0, $E2 ; LUIGI
	.db $3F, $11, $03
	.db $36, $2A, $01
	.db $00

DebugPPU_UpdateHealth:
	.db 3+$01+1
	.db $21, $59, $01
	.db $D2 ; 2
	.db $00

DebugPPU_UpdateHealthBar:
	.db 3+$07+1
	.db $21, $53, $07
	.db $CF, $FB, $CF, $FB, $FB, $FB, $FD ; . . . #
	.db $00

DebugPPU_UpdateHealthBarAttributes:
	.db $00, $00, $00 ; 0
	.db $00, $00, $20 ; 1
	.db $00, $80, $20 ; 2
	.db $00, $A0, $20 ; 3
	.db $80, $A0, $20 ; 4

DebugPPU_UpdateLives:
	.db 3+$02+1
	.db $21, $98, $02
	.db $F5, $F5 ; ??
	.db $00

DebugPPU_UpdateContinues:
	.db 3+$01+1
	.db $21, $D9, $01
	.db $F5 ; ?
	.db $00

DebugPPU_UpdateLevelArea:
	.db 3+$03+3+$01+1
	.db $22, $8C, $03
	.db $F5, $F4, $F5 ; ?? ?-?
	.db $22, $99, $01
	.db $F5 ; ?
	.db $00

DebugPPU_UpdateArea:
	.db 3+$01+1
	.db $22, $99, $01
	.db $F5 ; ?
	.db $00

DebugPPU_Version:
	.db 3+$04+1
	.db $23, $79, $04
	.db $EF, $F6, $D0, $D2 ; V.02
	.db $00
