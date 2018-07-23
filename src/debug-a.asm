
; Custom debug menu for SMB2, probably to help with speedrunners
; or just testing this disassembly.
; @TODO Should probably save a handful of important memory values,
; like the nametable scroll position, maybe some other stuff like
; the contents of $00 and $01 since we clobber those.
; The ability to "abort" is a huuuuge gamble since the game will
; most likely take it *extremely* poorly.

Debug_CurrentMenuOption = $7FE0
Debug_InMenu = $7FEF
Debug_MenuOptionCount = #$4

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

      LDA     #CHRBank_TitleScreenBG1
      STA     BackgroundCHR1
      LDA     #CHRBank_TitleScreenBG2
      STA     BackgroundCHR2
      LDA     #CHRBank_EnemiesDesert
      STA     SpriteCHR1

      JSR EnableNMI
      JSR WaitForNMI_TurnOnPPU

      ; Draw debug menu text
      LDA #$00 ; DEBUG MENU
      JSR Debug_BufferText
      JSR WaitForNMI
      LDA #$01 ; WORLD ?
      JSR Debug_BufferText
      JSR WaitForNMI
      LDA #$02 ; LEVEL ?
      JSR Debug_BufferText
      JSR WaitForNMI
      LDA #$03 ; AREA ?
      JSR Debug_BufferText
      JSR WaitForNMI
      LDA #$04 ; CHARACTER ?
      JSR Debug_BufferText
      JSR WaitForNMI
      LDA #$05 ; B BUTTON ... ABORT
      JSR Debug_BufferText
      JSR WaitForNMI

      JSR Debug_UpdateWorld ; Draw in the actual values...
      JSR WaitForNMI
      JSR Debug_UpdateLevel
      JSR WaitForNMI
      JSR Debug_UpdateArea
      JSR WaitForNMI
      JSR Debug_UpdateCharacter
      JSR WaitForNMI

      ; Add the goofy smiley cursor
      LDA #$4a ; Y
      STA SpriteDMAArea
      LDA #$38 ; Tile
      STA SpriteDMAArea+1
      LDA #$0 ; Attributes
      STA SpriteDMAArea+2
      LDA #$1b ; X
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

      LDA Debug_CurrentMenuOption ; Update cursor sprite
      ASL A
      ASL A
      ASL A
      ASL A
      CLC
      ADC #$4a ; Move the cursor
      STA SpriteDMAArea
      STA SpriteDMAArea+4

      LDA Player1JoypadPress ; Check if we should abort
      CMP #ControllerInput_B
      BEQ Debug_DoAbort

      LDA Player1JoypadPress ; Check if we should abort
      CMP #ControllerInput_A
      BEQ Debug_DoActivate

      CMP #ControllerInput_Down ; Otherwise, move the cursor down?
      BEQ Debug_MenuDown

      CMP #ControllerInput_Up ; Maybe up instead?
      BEQ Debug_MenuUp

      LDA Debug_CurrentMenuOption
      JSR JumpToTableAfterJump
      .word DebugMenu_World
      .word DebugMenu_Level
      .word DebugMenu_Area
      .word DebugMenu_Character


Debug_DoAbort:
      JMP Debug_Abort

Debug_DoActivate:
      JMP Debug_Activate

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

+  LDA #SoundEffect1_CherryGet
      STA SoundEffectQueue1
      JMP Debug_MenuLoop



DebugMenu_DoNothing:
-f    LDA #SoundEffect1_HawkOpen_WartBarf
      STA SoundEffectQueue1
-q  JMP Debug_MenuLoop

DebugMenu_World:
      LDA Player1JoypadPress
      CMP #ControllerInput_Left ; If left, decrease
      BEQ +l
      CMP #ControllerInput_Right ; If right, increase
      BEQ +r
      BNE -q
+l    LDA CurrentWorld ; Check current world...
      BEQ -f ; World is already 1, go away
      DEC CurrentWorld ; Decrease
      JMP +s ; Skip ahead
+r    LDA CurrentWorld
      CMP #$06 ; bug: lets you go one too high lol oops
      BEQ -f ; Already at world 7, go away
      INC CurrentWorld ; Otherwise increase
+s    LDA #SoundEffect2_CoinGet
      STA SoundEffectQueue2
      JSR Debug_UpdateWorld
      JMP Debug_MenuLoop


DebugMenu_Level:
      LDA Player1JoypadPress
      CMP #ControllerInput_Left ; If left, decrease
      BEQ +l
      CMP #ControllerInput_Right ; If right, increase
      BEQ +r
      BNE -q
+l    LDA CurrentLevel ; Check current world...
      BEQ -f ; Level is already 0, go away
      DEC CurrentLevel ; Decrease
      JMP +s ; Skip ahead
+r    LDA CurrentLevel
      CMP #WorldStartingLevel+7
      BEQ -f ; Already at last level, go away
      INC CurrentLevel ; Otherwise increase
+s    LDA #SoundEffect2_CoinGet
      STA SoundEffectQueue2
      JSR Debug_UpdateLevel
      JMP Debug_MenuLoop


DebugMenu_Area:
      LDA Player1JoypadPress
      CMP #ControllerInput_Left ; If left, decrease
      BEQ +l
      CMP #ControllerInput_Right ; If right, increase
      BEQ +r
      BNE +q
+l    LDA CurrentLevelArea ; Check current area...
      BEQ +f ; Area is already 0, go away
      DEC CurrentLevelArea ; Decrease
      JMP +s ; Skip ahead
+r    LDA CurrentLevelArea
      CMP #$9
      BEQ +f ; Already at area 9, go away
      INC CurrentLevelArea ; Otherwise increase
+s    LDA #SoundEffect2_CoinGet
      STA SoundEffectQueue2
      JSR Debug_UpdateArea
      JMP Debug_MenuLoop

-f
+f
      LDA #SoundEffect1_HawkOpen_WartBarf
      STA SoundEffectQueue1
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
+l    LDA CurrentCharacter ; Check current character...
      BEQ -f ; Character is already 0, go away
      DEC CurrentCharacter ; Decrease
      JMP +s ; Skip ahead
+r    LDA CurrentCharacter
      CMP #3
      BEQ -f ; Already at character 3, go away
      INC CurrentCharacter ; Otherwise increase
+s    LDA #SoundEffect2_CoinGet
      STA SoundEffectQueue2
      JSR Debug_UpdateCharacter
      JMP Debug_MenuLoop






; Part of update menu screen loop pls ignore
-:
      JSR Debug_BufferText ; Draw requested text
      PLA ; Pull the value to update...
      CLC
      ADC #$D0 ; Move to character offset
      STA PPUBuffer_301+3
      RTS

Debug_UpdateWorld:
      LDX CurrentWorld ; Load current world
      INX
      TXA
      PHA ; Push onto stack
      LDA #$06 ; Load text to update
      BNE - ; Go do that.

Debug_UpdateArea:
      LDA CurrentLevelArea ; Load current world
      PHA ; Push onto stack
      LDA #$08 ; Load text to update
      BNE - ; Go do that.

Debug_UpdateCharacter:
      LDA #$09 ; Load text offset of Mario (0)
      CLC
      ADC CurrentCharacter ; Add the character index ...
      JSR Debug_BufferText ; ...and draw it.
      RTS


Debug_UpdateLevel:
      LDX #$00 ; Set X to 0
-
      LDA CurrentLevel ; Get the starting level index
      CMP WorldStartingLevel, X ; Is it higher than our current level?
      BCC + ; Yep, jump outta here
      INX ; No, try next index
      BNE -
; At this point, X has the index we used
+
      DEX ; Go down one
      TXA ; This is current world - 1
      PHA ; Stuff onto stack
      LDA CurrentLevel
      SEC
      SBC WorldStartingLevel, X ; Get the starting level index
      PHA

      LDA #$07 ; Load text offset of Mario (0)
      JSR Debug_BufferText ; ...and draw it.
      PLA ; Then draw the level number...
      CLC
      ADC #$D1
      STA PPUBuffer_301+9
      PLA ; ...and the world number...
      CLC
      ADC #$D1
      STA PPUBuffer_301+7
      LDA CurrentLevel ; ...and the internal level number high nybble...
      LSR
      LSR
      LSR
      LSR
      CLC
      ADC #$D0
      STA PPUBuffer_301+3
      LDA CurrentLevel ; ...and the internal level number low nybble.
      AND #$0F
      CLC
      ADC #$D0
      STA PPUBuffer_301+4
      RTS

; WorldStartingLevel


Debug_BufferText:
      ASL A ; Rotate A left one
      TAX ; A->X
      LDA DebugPPU_TextPointers,X ; Load low pointer
      STA $0 ; Store one byte to low address
      LDA DebugPPU_TextPointers+1,X ; Store high pointer
      STA $1 ; Store one byte to low address
      LDA ($0), Y ; Load the length of data to copy
      TAY
-
      LDA ($0), Y ; Load our PPU data...
      STA PPUBuffer_301-1, Y ; ...and store it in the buffer
      DEY
      BNE -
      RTS







DebugPPU_TextPointers:
      .word DebugPPU_DebugText ; 0
      .word DebugPPU_WorldText ; 1
      .word DebugPPU_LevelText ; 2
      .word DebugPPU_AreaText ; 3
      .word DebugPPU_CharacterText ; 4
      .word DebugPPU_AbortText ; 5

      .word DebugPPU_UpdateWorld ; 6
      .word DebugPPU_UpdateLevel ; 7
      .word DebugPPU_UpdateArea ; 8
      .word DebugPPU_UpdateCharacter0 ; 9
      .word DebugPPU_UpdateCharacter1 ; 10
      .word DebugPPU_UpdateCharacter2 ; 11
      .word DebugPPU_UpdateCharacter3 ; 12


DebugPPU_DebugText: ; DEBUG
      .db #10+4, #$20, #$CB, #$A, #$DD, #$DE, #$DB, #$EE, #$E0, #$FB, #$E6, #$DE, #$E7, #$EE, #0

DebugPPU_WorldText: ; WORLD ?
      .db #$08+4, #$21, #$46, #$8, #$F0, #$E8, #$EB, #$E5, #$DD, #$FB, #$FB, #$F5, #0

DebugPPU_LevelText: ; LEVEL ?
      .db #$08+4, #$21, #$86, #$8, #$E5, #$DE, #$EF, #$DE, #$E5, #$FB, #$FB, #$F5, #0

DebugPPU_AreaText: ; AREA  ?
      .db #$08+4, #$21, #$C6, #$8, #$DA, #$EB, #$DE, #$DA, #$FB, #$FB, #$FB, #$F5, #0

DebugPPU_CharacterText: ; CHARACTER ?
      .db #13+4, #$22, #$06, #$C, #$DC, #$E1, #$DA, #$EB, #$DA, #$DC, #$ED, #$DE, #$EB, #$FB, #$FB, #$F5, #0

DebugPPU_AbortText: ; B BUTTON...ABORT
      .db #$12+4, #$23, #$27, #$12, #$DB, #$FB, #$DB, #$EE, #$ED, #$ED, #$E8, #$E7, #$FB, #$CF, #$CF, #$CF, #$FB,#$DA, #$DB, #$E8, #$EB, #$ED, #$00

DebugPPU_UpdateWorld: ; ?
      .db  #$01+4, #$21, #$4D, #$01, #$FB, #0
DebugPPU_UpdateLevel: ; ?
      .db  #$06+7, #$21, #$8C, #$07, #$F5, #$F5, #$FB, #$FB, #$F5, #$F4, #$F5, #0
DebugPPU_UpdateArea: ; ?
      .db  #$01+4, #$21, #$CD, #$01, #$FB, #0
DebugPPU_UpdateCharacter0: ; 0 MARIO
      .db  #$A+4, #$22, #$11, #$A, #$D0, #$FB, #$E6, #$DA, #$EB, #$E2, #$E8, #$FB, #$FB, #$FB, #0
DebugPPU_UpdateCharacter1: ; 1 PRINCESS
      .db  #$A+4, #$22, #$11, #$A, #$D1, #$FB, #$E9, #$EB, #$E2, #$E7, #$DC, #$DE, #$EC, #$EC, #0
DebugPPU_UpdateCharacter2: ; 2 TOAD
      .db  #$A+4, #$22, #$11, #$A, #$D2, #$FB, #$ED, #$E8, #$DA, #$DD, #$FB, #$FB, #$FB, #$FB, #0
DebugPPU_UpdateCharacter3: ; 3 LUIGI
      .db  #$A+4, #$22, #$11, #$A, #$D3, #$FB, #$E5, #$EE, #$E2, #$E0, #$E2, #$FB, #$FB, #$FB, #0
