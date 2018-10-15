; Level 3-3, Area 1

LevelData_3_3_Area1:
      .BYTE $80, $E1, $30, $00
      .BYTE $35, $10
      .BYTE $29, $11
      .BYTE $36, $C2
      .BYTE $17, $0B
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $08, $01
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $08, $01
ENDIF
      .BYTE $1E, $0F
      .BYTE $8B, $11
      .BYTE $17, $10
      .BYTE $32, $2B
      .BYTE $12, $0F
      .BYTE $10, $0F
      .BYTE $13, $01
      .BYTE $05, $52
      .BYTE $08, $26
      .BYTE $5C, $18
      .BYTE $45, $10
      .BYTE $49, $0F
      .BYTE $72, $18
      .BYTE $08, $18
      .BYTE $96, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $08, $23
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $08, $23
ENDIF
      .BYTE $FF