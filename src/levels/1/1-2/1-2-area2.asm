; Level 1-2, Area 2

LevelData_1_2_Area2:
      .BYTE $80, $E0, $20, $02
      .BYTE $00, $8C
      .BYTE $01, $8C
      .BYTE $02, $8C
      .BYTE $03, $8C
      .BYTE $28, $10
      .BYTE $1B, $11
      .BYTE $53, $0B
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $01, $07
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $01, $07
ENDIF
      .BYTE $1F, $16
      .BYTE $14, $82
      .BYTE $05, $82
      .BYTE $0D, $16
      .BYTE $79, $11
      .BYTE $16, $10
      .BYTE $36, $16
      .BYTE $31, $16
      .BYTE $04, $48
      .BYTE $13, $82
      .BYTE $04, $82
      .BYTE $05, $82
      .BYTE $06, $82
      .BYTE $07, $82
      .BYTE $08, $82
      .BYTE $09, $82
      .BYTE $0A, $82
      .BYTE $0B, $82
      .BYTE $0C, $82
      .BYTE $F2
      .BYTE $F0, $01
      .BYTE $F6, $02
      .BYTE $F0, $59
      .BYTE $F0, $8A
      .BYTE $F5, $02, $00
      .BYTE $FF