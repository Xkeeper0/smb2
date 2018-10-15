; Level 1-3, Area 1

LevelData_1_3_Area1:
      .BYTE $20, $E0, $03, $19
      .BYTE $55, $2C
      .BYTE $0B, $2C
      .BYTE $33, $2C
      .BYTE $0D, $2C
      .BYTE $16, $34
      .BYTE $27, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $02, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $02, $20
ENDIF
      .BYTE $F0, $54
      .BYTE $F1, $A0
      .BYTE $FF