; Level 1-1, Area 0

LevelData_1_1_Area0:
      .BYTE $09, $F3, $30, $00
      .BYTE $B7, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $00, $00
ENDIF
      .BYTE $56, $10
      .BYTE $1A, $10
      .BYTE $D6, $C2
      .BYTE $29, $10
      .BYTE $75, $C4
      .BYTE $5A, $21
      .BYTE $12, $C9
      .BYTE $75, $C7
      .BYTE $1E, $C1
      .BYTE $3E, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $00, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $00, $20
ENDIF
      .BYTE $20, $CF
      .BYTE $FF