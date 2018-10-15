; Level 1-1, Area 4

LevelData_1_1_Area4:
      .BYTE $91, $EA, $22, $11
      .BYTE $03, $F3
      .BYTE $97, $12
      .BYTE $F5, $00, $31
      .BYTE $34, $80
      .BYTE $05, $80
      .BYTE $0E, $21
      .BYTE $0F, $21
      .BYTE $F0, $EC
      .BYTE $F1, $0F
      .BYTE $F1, $50
      .BYTE $E1, $13
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $00, $27
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $00, $27
ENDIF
      .BYTE $F0, $8A
      .BYTE $FF