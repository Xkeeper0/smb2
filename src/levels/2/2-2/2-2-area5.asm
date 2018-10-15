; Level 2-2, Area 5

LevelData_2_2_Area5:
      .BYTE $89, $EA, $22, $1A
      .BYTE $43, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $04, $33
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $04, $33
ENDIF
      .BYTE $F0, $4E
      .BYTE $F1, $4F
      .BYTE $F1, $BC
      .BYTE $F2
      .BYTE $64, $4E
      .BYTE $64, $00
      .BYTE $07, $00
      .BYTE $08, $00
      .BYTE $F0, $13
      .BYTE $F0, $8D
      .BYTE $70, $46
      .BYTE $10, $42
      .BYTE $F0, $88, $F0, $EC
      .BYTE $F1, $2B
      .BYTE $F1, $8A
      .BYTE $F5, $05, $00
      .BYTE $FF