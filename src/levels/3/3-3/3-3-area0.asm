; Level 3-3, Area 0

LevelData_3_3_Area0:
      .BYTE $91, $EA, $10, $11
      .BYTE $F0, $94
      .BYTE $F2
      .BYTE $48, $13
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $08, $10
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $08, $10
ENDIF
      .BYTE $54, $83
      .BYTE $13, $82
      .BYTE $F0, $50
      .BYTE $F0, $AE
      .BYTE $F1, $8A
      .BYTE $FF