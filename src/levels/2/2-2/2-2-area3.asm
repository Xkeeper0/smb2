; Level 2-2, Area 3

LevelData_2_2_Area3:
      .BYTE $09, $F2, $31, $09
      .BYTE $02, $8A
      .BYTE $03, $8A
      .BYTE $04, $8A
      .BYTE $05, $8A
      .BYTE $06, $8A
      .BYTE $07, $8A
      .BYTE $08, $8A
      .BYTE $09, $8A
      .BYTE $62, $12
      .BYTE $77, $80
      .BYTE $07, $29
      .BYTE $F5, $04, $19
      .BYTE $AC, $80
      .BYTE $0C, $29
      .BYTE $54, $80
      .BYTE $04, $29
      .BYTE $F0, $51
      .BYTE $F1, $6D
      .BYTE $3B, $80
      .BYTE $0B, $29
      .BYTE $52, $82
      .BYTE $03, $82
      .BYTE $04, $82
      .BYTE $05, $82
      .BYTE $23, $29
      .BYTE $F1, $6E
      .BYTE $F2
      .BYTE $9A, $83
      .BYTE $0B, $83
      .BYTE $0C, $83
      .BYTE $0D, $83
      .BYTE $0E, $83
      .BYTE $2C, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $04, $50
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $04, $50
ENDIF
      .BYTE $F1, $A0
      .BYTE $FF