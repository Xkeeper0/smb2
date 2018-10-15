; Level 4-3, Area 3

LevelData_4_3_Area3:
      .BYTE $20, $E0, $62, $09
      .BYTE $37, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $42
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $42
ENDIF
      .BYTE $26, $33
      .BYTE $44, $3A
      .BYTE $31, $78
      .BYTE $F0, $41
      .BYTE $F1, $BA
      .BYTE $F1, $C1
      .BYTE $5A, $74
      .BYTE $37, $29
      .BYTE $99, $29
      .BYTE $F0, $77
      .BYTE $68, $29
      .BYTE $D9, $29
      .BYTE $88, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $50
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $50
ENDIF
      .BYTE $12, $29
      .BYTE $15, $35
      .BYTE $F0, $D3
      .BYTE $20, $35
      .BYTE $0A, $35
      .BYTE $45, $35
      .BYTE $32, $3B
      .BYTE $41, $3A
      .BYTE $F0, $21
      .BYTE $44, $3A
      .BYTE $41, $3A
      .BYTE $34, $3A
      .BYTE $31, $3A
      .BYTE $3C, $32
      .BYTE $38, $33
      .BYTE $34, $33
      .BYTE $31, $32
      .BYTE $16, $09
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $17
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $17
ENDIF
      .BYTE $0B, $33
      .BYTE $21, $38
      .BYTE $F1, $7A
      .BYTE $F1, $C0
      .BYTE $FF