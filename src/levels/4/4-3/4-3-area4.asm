; Level 4-3, Area 4

LevelData_4_3_Area4:
      .BYTE $80, $E8, $32, $18
      .BYTE $5D, $E2
      .BYTE $4F, $E1
      .BYTE $91, $41
      .BYTE $04, $41
      .BYTE $07, $41
      .BYTE $0A, $41
      .BYTE $0D, $41
      .BYTE $12, $18
      .BYTE $08, $18
      .BYTE $5B, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $20
ENDIF
      .BYTE $1F, $26
      .BYTE $13, $6C
      .BYTE $6F, $2D
      .BYTE $12, $41
      .BYTE $05, $41
      .BYTE $08, $41
      .BYTE $0B, $41
      .BYTE $0E, $41
      .BYTE $13, $18
      .BYTE $09, $18
      .BYTE $58, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $30
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $30
ENDIF
      .BYTE $11, $22
      .BYTE $10, $6C
      .BYTE $FF