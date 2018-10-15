; Level 5-1, Area 2

LevelData_5_1_Area2:
      .BYTE $91, $F0, $13, $12
      .BYTE $6B, $32
      .BYTE $51, $0B
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0C, $18
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0C, $18
ENDIF
      .BYTE $D1, $00
      .BYTE $F0, $0F
      .BYTE $F0, $B0
      .BYTE $F1, $AA
      .BYTE $F5, $0D, $00
      .BYTE $FF