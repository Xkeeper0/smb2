; Level 2-2, Area 0

LevelData_2_2_Area0:
      .BYTE $89, $EA, $10, $19
      .BYTE $8E, $81
      .BYTE $0F, $81
      .BYTE $F0, $B0
      .BYTE $F1, $6F
      .BYTE $BD, $14
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $04, $10
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $04, $10
ENDIF
      .BYTE $40, $81
      .BYTE $F0, $2E
      .BYTE $F1, $CA
      .BYTE $FF