; Level 4-3, Area 2

LevelData_4_3_Area2:
      .BYTE $20, $E0, $60, $09
      .BYTE $44, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $41
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $41
ENDIF
      .BYTE $21, $34
      .BYTE $0A, $34
      .BYTE $27, $31
      .BYTE $31, $35
      .BYTE $08, $36
      .BYTE $21, $33
      .BYTE $06, $32
      .BYTE $0A, $34
      .BYTE $F0, $54
      .BYTE $24, $3A
      .BYTE $31, $3A
      .BYTE $25, $35
      .BYTE $2B, $33
      .BYTE $37, $33
      .BYTE $34, $34
      .BYTE $31, $34
      .BYTE $08, $36
      .BYTE $2A, $34
      .BYTE $11, $32
      .BYTE $1C, $32
      .BYTE $12, $33
      .BYTE $23, $34
      .BYTE $31, $39
      .BYTE $2C, $32
      .BYTE $39, $32
      .BYTE $34, $32
      .BYTE $31, $33
      .BYTE $0B, $33
      .BYTE $37, $31
      .BYTE $0D, $31
      .BYTE $21, $78
      .BYTE $1D, $31
      .BYTE $F1, $BA
      .BYTE $F1, $D4
      .BYTE $36, $35
      .BYTE $31, $3A
      .BYTE $34, $3A
      .BYTE $31, $33
      .BYTE $33, $33
      .BYTE $1D, $31
      .BYTE $25, $33
      .BYTE $0C, $32
      .BYTE $38, $33
      .BYTE $35, $33
      .BYTE $33, $32
      .BYTE $0D, $31
      .BYTE $21, $36
      .BYTE $2A, $32
      .BYTE $35, $32
      .BYTE $0C, $31
      .BYTE $23, $32
      .BYTE $21, $31
      .BYTE $09, $33
      .BYTE $14, $0A
IFNDEF DISABLE_DOOR_POINTERS
      .BYTE $0B, $16
ENDIF
IFDEF DISABLE_DOOR_POINTERS
      .BYTE $F5, $0B, $16
ENDIF
      .BYTE $66, $78
      .BYTE $F1, $3B
      .BYTE $F1, $C0
      .BYTE $FF