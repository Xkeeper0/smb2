; Level 3-3, Area 2

LevelData_3_3_Area2:
      .BYTE $A0, $EA, $33, $19
      .BYTE $55, $01
      .BYTE $0B, $2D
      .BYTE $6C, $09
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $08, $39
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $08, $39
ENDIF
      .BYTE $F0, $5C
      .BYTE $F0, $75
      .BYTE $F1, $1C
      .BYTE $F1, $55
      .BYTE $82, $A8
      .BYTE $22, $05
      .BYTE $55, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $08, $46
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $08, $46
ENDIF
      .BYTE $F1, $9C
      .BYTE $F1, $D5
      .BYTE $AC, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $08, $53
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $08, $53
ENDIF
      .BYTE $0D, $82
      .BYTE $19, $81
      .BYTE $1A, $80
      .BYTE $0B, $80
      .BYTE $0C, $80
      .BYTE $F0, $5C
      .BYTE $F0, $95
      .BYTE $F0, $FC
      .BYTE $F2
      .BYTE $B9, $14
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $08, $13
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $08, $13
ENDIF
      .BYTE $11, $2A
      .BYTE $03, $26
      .BYTE $05, $24
      .BYTE $0C, $28
      .BYTE $F0, $14
      .BYTE $F1, $CA
      .BYTE $FF