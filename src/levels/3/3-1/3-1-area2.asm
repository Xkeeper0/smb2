; Level 3-1, Area 2

LevelData_3_1_Area2:
      .BYTE $89, $EA, $20, $11
      .BYTE $87, $13
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $06, $19
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $06, $19
ENDIF
      .BYTE $F0, $D1
      .BYTE $F2
      .BYTE $94, $5E
      .BYTE $0D, $26
      .BYTE $F2
      .BYTE $BB, $08
      .BYTE $0D, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $06, $16
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $06, $16
ENDIF
      .BYTE $F1, $10
      .BYTE $F1, $CA
      .BYTE $FF