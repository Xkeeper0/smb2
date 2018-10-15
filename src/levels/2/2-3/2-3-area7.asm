; Level 2-3, Area 7

LevelData_2_3_Area7:
      .BYTE $09, $E0, $03, $11
      .BYTE $32, $2C
      .BYTE $0D, $2C
      .BYTE $22, $2C
      .BYTE $0D, $2C
      .BYTE $22, $2C
      .BYTE $0D, $2C
      .BYTE $15, $35
      .BYTE $27, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $05, $36
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $05, $36
ENDIF
      .BYTE $F0, $41
      .BYTE $F1, $80
      .BYTE $FF