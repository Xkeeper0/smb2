; Level 2-3, Area 2

LevelData_2_3_Area2:
      .BYTE $91, $EA, $10, $19
      .BYTE $8A, $2D
      .BYTE $0D, $13
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $05, $13
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $05, $13
ENDIF
      .BYTE $18, $54
      .BYTE $0B, $21
      .BYTE $F1, $0F
      .BYTE $F2
      .BYTE $90, $26
      .BYTE $01, $52
      .BYTE $F0, $8A
      .BYTE $FF