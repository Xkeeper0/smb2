; Level 4-2, Area 1

LevelData_4_2_Area1:
      .BYTE $80, $E8, $90, $10
      .BYTE $32, $10
      .BYTE $14, $11
      .BYTE $17, $0C
      .BYTE $F5, $0A, $01
      .BYTE $0C, $10
      .BYTE $4F, $38
      .BYTE $2B, $34
      .BYTE $23, $33
      .BYTE $07, $03
      .BYTE $08, $33
      .BYTE $4C, $10
      .BYTE $78, $3F
      .BYTE $22, $10
      .BYTE $0A, $11
      .BYTE $7C, $10
      .BYTE $68, $3F
      .BYTE $A0, $11
      .BYTE $58, $3F
      .BYTE $26, $10
      .BYTE $74, $10
      .BYTE $12, $11
      .BYTE $58, $3F
      .BYTE $2C, $10
      .BYTE $76, $10
      .BYTE $3E, $10
      .BYTE $38, $3F
      .BYTE $88, $10
      .BYTE $1A, $11
      .BYTE $96, $3F
      .BYTE $74, $10
      .BYTE $52, $3F
      .BYTE $3C, $10
      .BYTE $54, $10
      .BYTE $17, $11
      .BYTE $62, $3A
      .BYTE $19, $34
      .BYTE $1A, $34
      .BYTE $1B, $35
      .BYTE $62, $10
      .BYTE $0B, $10
      .BYTE $1A, $11
      .BYTE $27, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0A, $21
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0A, $21
ENDIF
      .BYTE $26, $E2
      .BYTE $33, $37
      .BYTE $FF