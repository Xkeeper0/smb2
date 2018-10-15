; Level 4-3, Area 1

LevelData_4_3_Area1:
      .BYTE $80, $E1, $91, $00
      .BYTE $00, $8A
      .BYTE $2A, $10
      .BYTE $1D, $11
      .BYTE $14, $2B
      .BYTE $14, $0F
      .BYTE $33, $0F
      .BYTE $05, $0F
      .BYTE $AA, $CB
      .BYTE $27, $21
      .BYTE $16, $C8
      .BYTE $12, $26
      .BYTE $04, $21
      .BYTE $11, $C6
      .BYTE $14, $0B
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $00
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $00
ENDIF
      .BYTE $AC, $10
      .BYTE $F1, $16
      .BYTE $F6, $05
      .BYTE $E0, $11
      .BYTE $25, $10
      .BYTE $D4, $10
      .BYTE $0C, $10
      .BYTE $18, $11
      .BYTE $F2
      .BYTE $57, $51
      .BYTE $0A, $50
      .BYTE $16, $F4
      .BYTE $14, $51
      .BYTE $14, $F1
      .BYTE $13, $50
      .BYTE $12, $F1
      .BYTE $0E, $64
      .BYTE $53, $18
      .BYTE $09, $18
      .BYTE $8B, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $26
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $26
ENDIF
      .BYTE $23, $69
      .BYTE $F0, $68
      .BYTE $F1, $F6
      .BYTE $54, $18
      .BYTE $0A, $18
      .BYTE $89, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $36
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $36
ENDIF
      .BYTE $28, $6C
      .BYTE $F0, $88
      .BYTE $55, $18
      .BYTE $0B, $18
      .BYTE $89, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $60
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $60
ENDIF
      .BYTE $25, $6B
      .BYTE $F0, $16
      .BYTE $F0, $A8
      .BYTE $51, $18
      .BYTE $A1, $62
      .BYTE $F0, $D6
      .BYTE $FF