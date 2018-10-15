; Level 4-3, Area 5

LevelData_4_3_Area5:
      .BYTE $20, $E0, $02, $09
      .BYTE $56, $32
      .BYTE $34, $36
      .BYTE $27, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $33
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $33
ENDIF
      .BYTE $21, $3D
      .BYTE $F0, $21
      .BYTE $F1, $A0
      .BYTE $FF