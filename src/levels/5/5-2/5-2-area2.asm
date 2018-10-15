; Level 5-2, Area 2

LevelData_5_2_Area2:
      .BYTE $01, $F3, $30, $28
      .BYTE $0F, $85
      .BYTE $48, $0C
      .BYTE $4E, $0B
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0D, $30
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0D, $30
ENDIF
      .BYTE $29, $E2
      .BYTE $0C, $84
      .BYTE $0D, $84
      .BYTE $32, $10
      .BYTE $F0, $DE
      .BYTE $24, $11
      .BYTE $2F, $85
      .BYTE $1A, $10
      .BYTE $52, $E1
      .BYTE $F0, $53
      .BYTE $F1, $1E
      .BYTE $78, $0D
      .BYTE $1D, $8C
      .BYTE $23, $10
      .BYTE $24, $11
      .BYTE $39, $10
      .BYTE $0C, $83
      .BYTE $12, $E1
      .BYTE $55, $E1
      .BYTE $52, $10
      .BYTE $6A, $10
      .BYTE $25, $11
      .BYTE $10, $E7
      .BYTE $08, $03
      .BYTE $09, $E4
      .BYTE $F5, $0D, $19
      .BYTE $F4
      .BYTE $46, $0C
      .BYTE $F3
      .BYTE $06, $0D
      .BYTE $FF