; Level 3-3, Area 6

LevelData_3_3_Area6:
      .BYTE $20, $E0, $07, $19
      .BYTE $54, $2C
      .BYTE $0C, $2C
      .BYTE $57, $32
      .BYTE $14, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $08, $50
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $08, $50
ENDIF
      .BYTE $F0, $41
      .BYTE $F1, $A0
      .BYTE $FF