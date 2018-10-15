; Level 2-3, Area 3

LevelData_2_3_Area3:
      .BYTE $09, $E1, $61, $09
      .BYTE $68, $14
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $05, $19
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $05, $19
ENDIF
      .BYTE $5C, $31
      .BYTE $13, $31
      .BYTE $F0, $35
      .BYTE $F1, $1C
      .BYTE $6B, $29
      .BYTE $9D, $29
      .BYTE $A8, $28
      .BYTE $3A, $34
      .BYTE $F0, $75
      .BYTE $F1, $1C
      .BYTE $F1, $75
      .BYTE $82, $2C
      .BYTE $06, $2C
      .BYTE $09, $2C
      .BYTE $0D, $2C
      .BYTE $24, $2C
      .BYTE $0B, $2C
      .BYTE $5C, $09
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $05, $50
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $05, $50
ENDIF
      .BYTE $F1, $33
      .BYTE $F1, $92
      .BYTE $BB, $29
      .BYTE $54, $29
      .BYTE $F0, $6F
      .BYTE $92, $29
      .BYTE $5D, $29
      .BYTE $F0, $0D
      .BYTE $B6, $83
      .BYTE $07, $83
      .BYTE $08, $83
      .BYTE $09, $83
      .BYTE $28, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $05, $70
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $05, $70
ENDIF
      .BYTE $1B, $29
      .BYTE $F0, $0E
      .BYTE $F0, $CD
      .BYTE $F1, $4E
      .BYTE $F1, $A0
      .BYTE $FF