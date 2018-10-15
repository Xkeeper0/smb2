; Level 4-2, Area 4

LevelData_4_2_Area4:
      .BYTE $91, $EA, $20, $32
      .BYTE $81, $13
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0A, $33
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0A, $33
ENDIF
      .BYTE $F0, $4C
      .BYTE $F0, $AB
      .BYTE $F1, $E8
      .BYTE $F2
      .BYTE $A3, $3B
      .BYTE $F0, $0D
      .BYTE $F0, $48
      .BYTE $F0, $70
      .BYTE $F1, $F7
      .BYTE $F2
      .BYTE $F0, $30
      .BYTE $F0, $77
      .BYTE $F0, $8F
      .BYTE $F1, $10
      .BYTE $F1, $8A
      .BYTE $F5, $0B, $00
      .BYTE $FF