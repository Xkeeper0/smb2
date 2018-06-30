ChangeCharacterOnSelect:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Select
      BEQ     ExitChangeCharacter
ChangeCharacter:
      ; LDA     PseudoRNGValues+1
      LDA     CurrentCharacter
      ADC     #$01
      AND     #$03
      STA     CurrentCharacter
LoadCharacterData:
      ; LDA     CurrentCharacter
      ASL     A
      ASL     A
      TAY
      LDX     #$00

      LDA     SwapPalette,Y
      STA     RestorePlayerPalette0,X
      INY
      INX
      CPX     #$04
      BCC     UpdateCharacterPaletteLoop
      ; janky way to force palette update
      LDA     #$01
      STA     SkyFlashTimer
      JSR     LoadCharacterCHRBanks ; update chr
ExitChangeCharacter:
      RTS

; Normally the palette is in the other bank
SwapPalette:
      .BYTE $0F,$01,$16,$27 ; Mario
      .BYTE $0F,$06,$25,$36 ; Princess
      .BYTE $0F,$01,$30,$27 ; Toad
      .BYTE $0F,$01,$2A,$36 ; Luigi
