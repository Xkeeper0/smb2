; Level 5-2, Area 5

LevelData_5_2_Area5:
      .BYTE $81, $EA, $20, $12
      .BYTE $82, $0B
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0D, $36
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0D, $36
ENDIF
      .BYTE $2A, $67
      .BYTE $2A, $FF
      .BYTE $F0, $6C
      .BYTE $F1, $48
      .BYTE $53, $10
      .BYTE $26, $11
      .BYTE $3E, $6D
      .BYTE $34, $69
      .BYTE $2A, $F3
      .BYTE $F1, $CC
      .BYTE $55, $10
      .BYTE $A0, $F9
      .BYTE $F0, $08
      .BYTE $F1, $4C
      .BYTE $F1, $8A
      .BYTE $F5, $0E, $00
      .BYTE $FF