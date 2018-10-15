; Level 2-1, Area 1

LevelData_2_1_Area1:
      .BYTE $09, $F6, $31, $09
      .BYTE $66, $13
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $03, $09
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $03, $09
ENDIF
      .BYTE $7D, $29
      .BYTE $F0, $55
      .BYTE $F1, $1C
      .BYTE $F1, $4D
      .BYTE $83, $29
      .BYTE $F2
      .BYTE $72, $29
      .BYTE $1D, $29
      .BYTE $32, $A3
      .BYTE $32, $05
      .BYTE $F1, $C0
      .BYTE $12, $AA
      .BYTE $AC, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $03, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $03, $20
ENDIF
      .BYTE $F0, $F4
      .BYTE $F1, $98
      .BYTE $F1, $A0
      .BYTE $FF