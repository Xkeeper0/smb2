
; .segment BANK8
; * =  $8000
LevelAreaStartIndexes:
      .BYTE $00
; Table to determine what "total" index a given
; level + area is. Get the starting area from this
; table (based on CurrentLevel) and add the area to it
;
; Level 1-1
      .BYTE $0A ; Level 1-2
      .BYTE $14 ; Level 1-3
      .BYTE $1E ; Level 2-1
      .BYTE $28 ; Level 2-2
      .BYTE $32 ; Level 2-3
      .BYTE $3C ; Level 3-1
      .BYTE $46 ; Level 3-2
      .BYTE $50 ; Level 3-3
      .BYTE $5A ; Level 4-1
      .BYTE $64 ; Level 4-2
      .BYTE $6E ; Level 4-3
      .BYTE $78 ; Level 5-1
      .BYTE $82 ; Level 5-2
      .BYTE $8C ; Level 5-3
      .BYTE $96 ; Level 6-1
      .BYTE $A0 ; Level 6-2
      .BYTE $AA ; Level 6-3
      .BYTE $B4 ; Level 7-1
      .BYTE $BE ; Level 7-2
      .BYTE $C8 ; Level 7-3 (unused)
LevelDataPointersLo:
      .BYTE <LevelData_1_1_Area0
; Stuff below here ------
      .BYTE <LevelData_1_1_Area1
      .BYTE <LevelData_1_1_Area2
      .BYTE <LevelData_1_1_Area3
      .BYTE <LevelData_1_1_Area4
      .BYTE <LevelData_1_1_Area5
      .BYTE <LevelData_1_1_Area5
      .BYTE <LevelData_1_1_Area5
      .BYTE <LevelData_1_1_Area5
      .BYTE <LevelData_1_1_Area5
      .BYTE <LevelData_1_2_Area0
      .BYTE <LevelData_1_2_Area1
      .BYTE <LevelData_1_2_Area2
      .BYTE <LevelData_1_2_Area3
      .BYTE <LevelData_1_2_Area4
      .BYTE <LevelData_1_2_Area5
      .BYTE <LevelData_1_2_Area5
      .BYTE <LevelData_1_2_Area5
      .BYTE <LevelData_1_2_Area5
      .BYTE <LevelData_1_2_Area5
      .BYTE <LevelData_1_2_Area5
      .BYTE <LevelData_1_3_Area0
      .BYTE <LevelData_1_3_Area1
      .BYTE <LevelData_1_3_Area2
      .BYTE <LevelData_1_3_Area3
      .BYTE <LevelData_1_3_Area3
      .BYTE <LevelData_1_3_Area3
      .BYTE <LevelData_1_3_Area3
      .BYTE <LevelData_1_3_Area3
      .BYTE <LevelData_1_3_Area3
      .BYTE <LevelData_2_1_Area0
      .BYTE <LevelData_2_1_Area1
      .BYTE <LevelData_2_1_Area4
      .BYTE <LevelData_2_1_Area4
      .BYTE <LevelData_2_1_Area3
      .BYTE <LevelData_2_1_Area4
      .BYTE <LevelData_2_1_Area4
      .BYTE <LevelData_2_1_Area4
      .BYTE <LevelData_2_1_Area4
      .BYTE <LevelData_2_1_Area4
      .BYTE <LevelData_2_2_Area0
      .BYTE <LevelData_2_2_Area1
      .BYTE <LevelData_2_2_Area2
      .BYTE <LevelData_2_2_Area3
      .BYTE <LevelData_2_2_Area4
      .BYTE <LevelData_2_2_Area5
      .BYTE <LevelData_2_2_Area5
      .BYTE <LevelData_2_2_Area5
      .BYTE <LevelData_2_2_Area5
      .BYTE <LevelData_2_2_Area5
      .BYTE <LevelData_2_3_Area0
      .BYTE <LevelData_2_3_Area1
      .BYTE <LevelData_2_3_Area2
      .BYTE <LevelData_2_3_Area3
      .BYTE <LevelData_2_3_Area4
      .BYTE <LevelData_2_3_Area5
      .BYTE <LevelData_2_3_Area6
      .BYTE <LevelData_2_3_Area7
      .BYTE <LevelData_2_3_Area7
      .BYTE <LevelData_2_3_Area7
      .BYTE <LevelData_3_1_Area0
      .BYTE <LevelData_3_1_Area1
      .BYTE <LevelData_3_1_Area2
      .BYTE <LevelData_3_1_Area3
      .BYTE <LevelData_3_1_Area4
      .BYTE <LevelData_3_1_Area5
      .BYTE <LevelData_3_1_Area5
      .BYTE <LevelData_3_1_Area5
      .BYTE <LevelData_3_1_Area5
      .BYTE <LevelData_3_1_Area5
      .BYTE <LevelData_3_1_Area5
      .BYTE <LevelData_3_2_Area0
      .BYTE <LevelData_3_2_Area1
      .BYTE <LevelData_3_2_Area2
      .BYTE <LevelData_3_2_Area2
      .BYTE <LevelData_3_2_Area2
      .BYTE <LevelData_3_2_Area2
      .BYTE <LevelData_3_2_Area2
      .BYTE <LevelData_3_2_Area2
      .BYTE <LevelData_3_2_Area2
      .BYTE <LevelData_3_2_Area2
      .BYTE <LevelData_3_3_Area0
      .BYTE <LevelData_3_3_Area1
      .BYTE <LevelData_3_3_Area2
      .BYTE <LevelData_3_3_Area3
      .BYTE <LevelData_3_3_Area4
      .BYTE <LevelData_3_3_Area5
      .BYTE <LevelData_3_3_Area6
      .BYTE <LevelData_3_3_Area7
      .BYTE <LevelData_3_3_Area7
      .BYTE <LevelData_4_1_Area0
      .BYTE <LevelData_4_1_Area1
      .BYTE <LevelData_4_1_Area2
      .BYTE <LevelData_4_1_Area2
      .BYTE <LevelData_4_1_Area2
      .BYTE <LevelData_4_1_Area2
      .BYTE <LevelData_4_1_Area2
      .BYTE <LevelData_4_1_Area2
      .BYTE <LevelData_4_1_Area2
      .BYTE <LevelData_4_1_Area2
      .BYTE <LevelData_4_1_Area2
      .BYTE <LevelData_4_2_Area0
      .BYTE <LevelData_4_2_Area1
      .BYTE <LevelData_4_2_Area2
      .BYTE <LevelData_4_2_Area3
      .BYTE <LevelData_4_2_Area3
      .BYTE <LevelData_4_2_Area3
      .BYTE <LevelData_4_2_Area3
      .BYTE <LevelData_4_2_Area3
      .BYTE <LevelData_4_2_Area3
      .BYTE <LevelData_4_3_Area0
      .BYTE <LevelData_4_3_Area1
      .BYTE <LevelData_4_3_Area2
      .BYTE <LevelData_4_3_Area3
      .BYTE <LevelData_4_3_Area4
      .BYTE <LevelData_4_3_Area5
      .BYTE <LevelData_4_3_Area6
      .BYTE <LevelData_4_3_Area7
      .BYTE <LevelData_4_3_Area8
      .BYTE <LevelData_4_3_Area8
      .BYTE <LevelData_4_3_Area8
      .BYTE <LevelData_5_1_Area0
      .BYTE <LevelData_5_1_Area1
      .BYTE <LevelData_5_1_Area2
      .BYTE <LevelData_5_1_Area2
      .BYTE <LevelData_5_1_Area2
      .BYTE <LevelData_5_1_Area2
      .BYTE <LevelData_5_1_Area2
      .BYTE <LevelData_5_1_Area2
      .BYTE <LevelData_5_1_Area2
      .BYTE <LevelData_5_1_Area2
      .BYTE <LevelData_5_2_Area0
      .BYTE <LevelData_5_2_Area1
      .BYTE <LevelData_5_2_Area2
      .BYTE <LevelData_5_2_Area3
      .BYTE <LevelData_5_2_Area4
      .BYTE <LevelData_5_2_Area5
      .BYTE <LevelData_5_2_Area5
      .BYTE <LevelData_5_2_Area5
      .BYTE <LevelData_5_2_Area5
      .BYTE <LevelData_5_2_Area5
      .BYTE <LevelData_5_3_Area0
      .BYTE <LevelData_5_3_Area1
      .BYTE <LevelData_5_3_Area2
      .BYTE <LevelData_5_3_Area3
      .BYTE <LevelData_5_3_Area4
      .BYTE <LevelData_5_3_Area4
      .BYTE <LevelData_5_3_Area4
      .BYTE <LevelData_5_3_Area4
      .BYTE <LevelData_5_3_Area4
      .BYTE <LevelData_6_1_Area0
      .BYTE <LevelData_6_1_Area1
      .BYTE <LevelData_6_1_Area2
      .BYTE <LevelData_6_1_Area3
      .BYTE <LevelData_6_1_Area4
      .BYTE <LevelData_6_1_Area5
      .BYTE <LevelData_6_1_Area6
      .BYTE <LevelData_6_1_Area6
      .BYTE <LevelData_6_1_Area6
      .BYTE <LevelData_6_1_Area6
      .BYTE <LevelData_6_2_Area0
      .BYTE <LevelData_6_2_Area1
      .BYTE <LevelData_6_2_Area2
      .BYTE <LevelData_6_2_Area2
      .BYTE <LevelData_6_2_Area2
      .BYTE <LevelData_6_2_Area2
      .BYTE <LevelData_6_2_Area2
      .BYTE <LevelData_6_2_Area2
      .BYTE <LevelData_6_2_Area2
      .BYTE <LevelData_6_2_Area2
      .BYTE <LevelData_6_3_Area0
      .BYTE <LevelData_6_3_Area1
      .BYTE <LevelData_6_3_Area2
      .BYTE <LevelData_6_3_Area3
      .BYTE <LevelData_6_3_Area4
      .BYTE <LevelData_6_3_Area5
      .BYTE <LevelData_6_3_Area6
      .BYTE <LevelData_6_3_Area6
      .BYTE <LevelData_6_3_Area6
      .BYTE <LevelData_6_3_Area6
      .BYTE <LevelData_7_1_Area0
      .BYTE <LevelData_7_1_Area1
      .BYTE <LevelData_7_1_Area2
      .BYTE <LevelData_7_1_Area3
      .BYTE <LevelData_7_1_Area4
      .BYTE <LevelData_7_1_Area5
      .BYTE <LevelData_7_1_Area5
      .BYTE <LevelData_7_1_Area5
      .BYTE <LevelData_7_1_Area5
      .BYTE <LevelData_7_1_Area5
      .BYTE <LevelData_7_2_Area0
      .BYTE <LevelData_7_2_Area1
      .BYTE <LevelData_7_2_Area2
      .BYTE <LevelData_7_2_Area3
      .BYTE <LevelData_7_2_Area4
      .BYTE <LevelData_7_2_Area5
      .BYTE <LevelData_7_2_Area6
      .BYTE <LevelData_7_2_Area7
      .BYTE <LevelData_7_2_Area8
      .BYTE <LevelData_7_2_Area9
      .BYTE <LevelData_7_3_Area0
      .BYTE <LevelData_7_3_Area0
      .BYTE <LevelData_7_3_Area0
      .BYTE <LevelData_7_3_Area0
      .BYTE <LevelData_7_3_Area0
      .BYTE <LevelData_7_3_Area0
      .BYTE <LevelData_7_3_Area0
      .BYTE <LevelData_7_3_Area0
      .BYTE <LevelData_7_3_Area0
      .BYTE <LevelData_7_3_Area0
LevelDataPointersHi:
      .BYTE >LevelData_1_1_Area0

      .BYTE >LevelData_1_1_Area1
      .BYTE >LevelData_1_1_Area2
      .BYTE >LevelData_1_1_Area3
      .BYTE >LevelData_1_1_Area4
      .BYTE >LevelData_1_1_Area5
      .BYTE >LevelData_1_1_Area5
      .BYTE >LevelData_1_1_Area5
      .BYTE >LevelData_1_1_Area5
      .BYTE >LevelData_1_1_Area5
      .BYTE >LevelData_1_2_Area0
      .BYTE >LevelData_1_2_Area1
      .BYTE >LevelData_1_2_Area2
      .BYTE >LevelData_1_2_Area3
      .BYTE >LevelData_1_2_Area4
      .BYTE >LevelData_1_2_Area5
      .BYTE >LevelData_1_2_Area5
      .BYTE >LevelData_1_2_Area5
      .BYTE >LevelData_1_2_Area5
      .BYTE >LevelData_1_2_Area5
      .BYTE >LevelData_1_2_Area5
      .BYTE >LevelData_1_3_Area0
      .BYTE >LevelData_1_3_Area1
      .BYTE >LevelData_1_3_Area2
      .BYTE >LevelData_1_3_Area3
      .BYTE >LevelData_1_3_Area3
      .BYTE >LevelData_1_3_Area3
      .BYTE >LevelData_1_3_Area3
      .BYTE >LevelData_1_3_Area3
      .BYTE >LevelData_1_3_Area3
      .BYTE >LevelData_2_1_Area0
      .BYTE >LevelData_2_1_Area1
      .BYTE >LevelData_2_1_Area4
      .BYTE >LevelData_2_1_Area4
      .BYTE >LevelData_2_1_Area3
      .BYTE >LevelData_2_1_Area4
      .BYTE >LevelData_2_1_Area4
      .BYTE >LevelData_2_1_Area4
      .BYTE >LevelData_2_1_Area4
      .BYTE >LevelData_2_1_Area4
      .BYTE >LevelData_2_2_Area0
      .BYTE >LevelData_2_2_Area1
      .BYTE >LevelData_2_2_Area2
      .BYTE >LevelData_2_2_Area3
      .BYTE >LevelData_2_2_Area4
      .BYTE >LevelData_2_2_Area5
      .BYTE >LevelData_2_2_Area5
      .BYTE >LevelData_2_2_Area5
      .BYTE >LevelData_2_2_Area5
      .BYTE >LevelData_2_2_Area5
      .BYTE >LevelData_2_3_Area0
      .BYTE >LevelData_2_3_Area1
      .BYTE >LevelData_2_3_Area2
      .BYTE >LevelData_2_3_Area3
      .BYTE >LevelData_2_3_Area4
      .BYTE >LevelData_2_3_Area5
      .BYTE >LevelData_2_3_Area6
      .BYTE >LevelData_2_3_Area7
      .BYTE >LevelData_2_3_Area7
      .BYTE >LevelData_2_3_Area7
      .BYTE >LevelData_3_1_Area0
      .BYTE >LevelData_3_1_Area1
      .BYTE >LevelData_3_1_Area2
      .BYTE >LevelData_3_1_Area3
      .BYTE >LevelData_3_1_Area4
      .BYTE >LevelData_3_1_Area5
      .BYTE >LevelData_3_1_Area5
      .BYTE >LevelData_3_1_Area5
      .BYTE >LevelData_3_1_Area5
      .BYTE >LevelData_3_1_Area5
      .BYTE >LevelData_3_1_Area5
      .BYTE >LevelData_3_2_Area0
      .BYTE >LevelData_3_2_Area1
      .BYTE >LevelData_3_2_Area2
      .BYTE >LevelData_3_2_Area2
      .BYTE >LevelData_3_2_Area2
      .BYTE >LevelData_3_2_Area2
      .BYTE >LevelData_3_2_Area2
      .BYTE >LevelData_3_2_Area2
      .BYTE >LevelData_3_2_Area2
      .BYTE >LevelData_3_2_Area2
      .BYTE >LevelData_3_3_Area0
      .BYTE >LevelData_3_3_Area1
      .BYTE >LevelData_3_3_Area2
      .BYTE >LevelData_3_3_Area3
      .BYTE >LevelData_3_3_Area4
      .BYTE >LevelData_3_3_Area5
      .BYTE >LevelData_3_3_Area6
      .BYTE >LevelData_3_3_Area7
      .BYTE >LevelData_3_3_Area7
      .BYTE >LevelData_4_1_Area0
      .BYTE >LevelData_4_1_Area1
      .BYTE >LevelData_4_1_Area2
      .BYTE >LevelData_4_1_Area2
      .BYTE >LevelData_4_1_Area2
      .BYTE >LevelData_4_1_Area2
      .BYTE >LevelData_4_1_Area2
      .BYTE >LevelData_4_1_Area2
      .BYTE >LevelData_4_1_Area2
      .BYTE >LevelData_4_1_Area2
      .BYTE >LevelData_4_1_Area2
      .BYTE >LevelData_4_2_Area0
      .BYTE >LevelData_4_2_Area1
      .BYTE >LevelData_4_2_Area2
      .BYTE >LevelData_4_2_Area3
      .BYTE >LevelData_4_2_Area3
      .BYTE >LevelData_4_2_Area3
      .BYTE >LevelData_4_2_Area3
      .BYTE >LevelData_4_2_Area3
      .BYTE >LevelData_4_2_Area3
      .BYTE >LevelData_4_3_Area0
      .BYTE >LevelData_4_3_Area1
      .BYTE >LevelData_4_3_Area2
      .BYTE >LevelData_4_3_Area3
      .BYTE >LevelData_4_3_Area4
      .BYTE >LevelData_4_3_Area5
      .BYTE >LevelData_4_3_Area6
      .BYTE >LevelData_4_3_Area7
      .BYTE >LevelData_4_3_Area8
      .BYTE >LevelData_4_3_Area8
      .BYTE >LevelData_4_3_Area8
      .BYTE >LevelData_5_1_Area0
      .BYTE >LevelData_5_1_Area1
      .BYTE >LevelData_5_1_Area2
      .BYTE >LevelData_5_1_Area2
      .BYTE >LevelData_5_1_Area2
      .BYTE >LevelData_5_1_Area2
      .BYTE >LevelData_5_1_Area2
      .BYTE >LevelData_5_1_Area2
      .BYTE >LevelData_5_1_Area2
      .BYTE >LevelData_5_1_Area2
      .BYTE >LevelData_5_2_Area0
      .BYTE >LevelData_5_2_Area1
      .BYTE >LevelData_5_2_Area2
      .BYTE >LevelData_5_2_Area3
      .BYTE >LevelData_5_2_Area4
      .BYTE >LevelData_5_2_Area5
      .BYTE >LevelData_5_2_Area5
      .BYTE >LevelData_5_2_Area5
      .BYTE >LevelData_5_2_Area5
      .BYTE >LevelData_5_2_Area5
      .BYTE >LevelData_5_3_Area0
      .BYTE >LevelData_5_3_Area1
      .BYTE >LevelData_5_3_Area2
      .BYTE >LevelData_5_3_Area3
      .BYTE >LevelData_5_3_Area4
      .BYTE >LevelData_5_3_Area4
      .BYTE >LevelData_5_3_Area4
      .BYTE >LevelData_5_3_Area4
      .BYTE >LevelData_5_3_Area4
      .BYTE >LevelData_6_1_Area0
      .BYTE >LevelData_6_1_Area1
      .BYTE >LevelData_6_1_Area2
      .BYTE >LevelData_6_1_Area3
      .BYTE >LevelData_6_1_Area4
      .BYTE >LevelData_6_1_Area5
      .BYTE >LevelData_6_1_Area6
      .BYTE >LevelData_6_1_Area6
      .BYTE >LevelData_6_1_Area6
      .BYTE >LevelData_6_1_Area6
      .BYTE >LevelData_6_2_Area0
      .BYTE >LevelData_6_2_Area1
      .BYTE >LevelData_6_2_Area2
      .BYTE >LevelData_6_2_Area2
      .BYTE >LevelData_6_2_Area2
      .BYTE >LevelData_6_2_Area2
      .BYTE >LevelData_6_2_Area2
      .BYTE >LevelData_6_2_Area2
      .BYTE >LevelData_6_2_Area2
      .BYTE >LevelData_6_2_Area2
      .BYTE >LevelData_6_3_Area0
      .BYTE >LevelData_6_3_Area1
      .BYTE >LevelData_6_3_Area2
      .BYTE >LevelData_6_3_Area3
      .BYTE >LevelData_6_3_Area4
      .BYTE >LevelData_6_3_Area5
      .BYTE >LevelData_6_3_Area6
      .BYTE >LevelData_6_3_Area6
      .BYTE >LevelData_6_3_Area6
      .BYTE >LevelData_6_3_Area6
      .BYTE >LevelData_7_1_Area0
      .BYTE >LevelData_7_1_Area1
      .BYTE >LevelData_7_1_Area2
      .BYTE >LevelData_7_1_Area3
      .BYTE >LevelData_7_1_Area4
      .BYTE >LevelData_7_1_Area5
      .BYTE >LevelData_7_1_Area5
      .BYTE >LevelData_7_1_Area5
      .BYTE >LevelData_7_1_Area5
      .BYTE >LevelData_7_1_Area5
      .BYTE >LevelData_7_2_Area0
      .BYTE >LevelData_7_2_Area1
      .BYTE >LevelData_7_2_Area2
      .BYTE >LevelData_7_2_Area3
      .BYTE >LevelData_7_2_Area4
      .BYTE >LevelData_7_2_Area5
      .BYTE >LevelData_7_2_Area6
      .BYTE >LevelData_7_2_Area7
      .BYTE >LevelData_7_2_Area8
      .BYTE >LevelData_7_2_Area9
      .BYTE >LevelData_7_3_Area0
      .BYTE >LevelData_7_3_Area0
      .BYTE >LevelData_7_3_Area0
      .BYTE >LevelData_7_3_Area0
      .BYTE >LevelData_7_3_Area0
      .BYTE >LevelData_7_3_Area0
      .BYTE >LevelData_7_3_Area0
      .BYTE >LevelData_7_3_Area0
      .BYTE >LevelData_7_3_Area0
      .BYTE >LevelData_7_3_Area0
LevelData_1_1_Area0:
      .BYTE $09, $F3, $30, $00, $B7, $0A, $00, $00, $56, $10, $1A,	$10, $D6, $C2, $29, $10
      .BYTE $75, $C4, $5A, $21,	$12, $C9, $75, $C7, $1E, $C1, $3E, $0A, $00, $20, $20, $CF ; $10
      .BYTE $FF ; $20
LevelData_1_1_Area1:
      .BYTE $00, $F3, $30, $00, $F5, $00, $50, $34, $E1, $19, $E2, $B5,	$12, $0A, $12, $17
      .BYTE $12, $16, $E5, $32,	$E1, $26, $E3, $57, $E5, $38, $C2, $27,	$22, $0C, $E2, $17 ; $10
      .BYTE $C1, $11, $E2, $16,	$22, $16, $C3, $2B, $21, $18, $C4, $37,	$C2, $36, $C7, $12 ; $20
      .BYTE $E2, $35, $C8, $3B,	$C3, $24, $22, $12, $0C,	$F5, $00,	$29, $04,	$C4, $30, $E1 ; $30
      .BYTE $02, $03, $03, $EC, $F4, $07, $0D, $45, $0D, $1A, $0D,	$26, $E3, $BA, $0C, $FF ; $40
LevelData_1_1_Area2:
      .BYTE $80, $E0, $92, $00, $79, $16, $10, $C2,	7, $16,	$31, $0A, $00, $03, $15, $21
      .BYTE $08, $22, $0F,	$22, $8A, $2B, $0B, $52,	$E, $26, $10, $10, $0A, $C5, $63, $21 ; $10
      .BYTE $60, $0C, $44, $29, $3E, $0F,	$14, $0F, $09, $01, $19, $0F,	$78, $51, $17, $DC ; $20
      .BYTE $15, $C2, $14, $22,	$10, $29, $03, $C2, $18, $FA, $15, $C3, $21, $22,	$F0, $C8 ; $30
      .BYTE $5A, $10, $1E, $10,	$33, $C2, $16, $F9, $B8, $27, $0A, $01, $17, $C3, $11, $22 ; $40
      .BYTE $0F,	$29, $10, $C2, $17, $C5, $33, $22, $07, $C6, $11,	$C3, $1F, $25, $F0, $E0 ; $50
      .BYTE $8D, $21, $0F, $27, $43, $C1, $06, $29, $0A, $29, $31, $24, $06, $21, $0A,	$51 ; $60
      .BYTE $51, $CF, $06, $F3, $30, $22,	$75, $D5, $51, $CB, $28, $0B, $00,	$32, $1E, $26 ; $70
      .BYTE $1A, $CD, $9F, $C0,	$50, $21, $01, $21, $03, $2D, $08, $54, $0D, $12, $F5,	0 ; $80
      .BYTE $13, $18, $C6, $F4,	$F3, $F3, $DF, $C6, $F3, $6D, $C8, $F2,	$6A, $CF, $5E, $0B ; $90
      .BYTE $00, $41, $F4, $F3, $F3, $F3,	$2E, $16, $FF ; $A0
LevelData_1_1_Area3:
      .BYTE $91, $EA, $22, $11, $47, $A8,	$19, $25, $0B, $25, $16,	$83, $24, $0A, $00, $54
      .BYTE $13, $25, $F0, $71,	$F0, $FC, $F0, $0E, $F1,	$8F, $F1, $B1, $F1, $F4, $64, $F3 ; $10
      .BYTE $98, $0C, $F5, $00, $40, $48, $03, $18, $03, $C7, $13, $00, $28, $F0, $B2, $F1 ; $20
      .BYTE $4A, $FF ; $30
LevelData_1_1_Area4:
      .BYTE $91, $EA, $22, $11, $03, $F3, $97, $12,	$F5, $00,	$31, $34, $80, $05, $80, $E
      .BYTE $21, $0F, $21, $F0, $EC, $F1, $0F, $F1, $50, $E1, $13, $00, $27, $F0, $8A, $FF ; $10
LevelData_1_1_Area5:
      .BYTE $80, $E8, $40, $12, $7C, $10,	$18, $0C, $F5, $00, $10, $12, $10,	$15, $11, $30
      .BYTE $E7, $08, $03, $09, $E6, $9C, $10, $1F, $11, $50,	$E7, $0A, $91, $F1, $60,	$7E ; $10
      .BYTE $10, $43, $48, $F5,	1, $00, $F0, $4C,	$F1, $EB, $F2, $F0, $2A, $F2, $24, $83 ; $20
      .BYTE $25, $81, $4B, $0B, $00, $30, $F0, $8B, $F1, $8C, $F1,	$CA, $FF ; $30
LevelData_1_2_Area0:
      .BYTE $80, $EA, $70, $10, $8E, $C3,	$3B, $C1, $F0, $CD, $F1, $48, $DD, $10,	$13, $C2
      .BYTE $EB, $10, $10, $11,	6, $10,	$E, $11, $2E, $C1, $7F,	$29, $5D, $16, $0E, $16 ; $10
      .BYTE $2A, $07, $0F,	6, $F5,	1, $30,	$18, $26, $0C, $2B, $12,	$C2, $F0, $E0, $F6 ; $20
      .BYTE $00, $43, $10, $15, $11, $1A,	$CD, $35, $16, $31, $16, $08, $29, $1D, $09, $01 ; $30
      .BYTE $10, $10, $22, $02, $51, $40,	$29, $0B, $10, $1C, $11,	$12, $26, $18, $CC, $F0 ; $40
      .BYTE $08, $F1, $C2, $F2, $3C, $16,	$1D, $16, $13, $0B, $01, $13, $15,	$56, $0E, $51 ; $50
      .BYTE $9C, $8C, $0D, $8C, $0E, $8C,	$F, $8C, $27, $10, $15,	$11, $4A, $16, $14, $16 ; $60
      .BYTE $0C,	$B, $01, $20, $26, $16, $09, $82, $0A, $82, $0B, $82,	$F0, $00,	$FF ; $70
LevelData_1_2_Area1:
      .BYTE $89, $EA, $32, $11, $99, $29,	$16, $29, $0C, $29, $12,	$13, $01,	4, $1A,	$25
      .BYTE $0C,	$21, $0E, $21, $F0, $30,	$F1, $F7, $7D, $A8, $1C, $25, $0E, $26, $1D, $05 ; $10
      .BYTE $3A, $83, $32, $25,	3, $25,	6, $25,	7, $25,	9, $80,	$F, $21, $F0, $30 ; $20
      .BYTE $F0, $97, $F0, $D0,	$F1, $35, $80, $25, $02, $25, $17, $82, $1E, $29,	$24, $83 ; $30
      .BYTE $37, $2D, $F0, $F0,	$F1, $1B, $F1, $51, $7C, $14, $01, $06, $F0, $0F, $F1, $4E ; $40
      .BYTE $F1, $CA, $FF ; $50
LevelData_1_2_Area2:
      .BYTE $80, $E0, $20, $02, $00, $8C, $01, $8C, $02, $8C, $03, $8C, $28, $10, $1B, $11
      .BYTE $53, $0B, $01,	7, $1F,	$16, $14, $82, $05, $82, $0D, $16,	$79, $11, $16, $10 ; $10
      .BYTE $36, $16, $31, $16,	4, $48,	$13, $82, $04, $82, $05, $82, $06, $82, $07, $82 ; $20
      .BYTE $08, $82, $09, $82, $0A,	$82, $0B, $82, $0C, $82, $F2, $F0, $01, $F6, $02, $F0 ; $30
      .BYTE $59, $F0, $8A, $F5,	2, $00, $FF ; $40
LevelData_1_2_Area3:
      .BYTE $18, $E3, $01, $01, $64, $32, $09, $32, $32, $32, $0B, $32, $14, $2C, $06, $32
      .BYTE $0A,	$2C, $F0, $44, $F0, $65, $F0, $86, $F0,	$A7, $F1, $66, $F1, $83, $F1, $A0 ; $10
      .BYTE $F5, $01, $03, $FF ; $20
LevelData_1_2_Area4:
      .BYTE $18, $E3, $01, $01, $64, $32, $09, $32, $32, $32, $0B, $32, $24, $31, $0A, $31
      .BYTE $17, $27, $F0, $44,	$F0, $65, $F0, $86, $F0, $A7, $F1, $86,	$F1, $A8, $F1, $C4 ; $10
      .BYTE $FF ; $20
LevelData_1_2_Area5:
      .BYTE $80, $E1, $90, $00, $00, $8A, $01, $8A, $02, $8A, $2D, $29, $1A, $29,	$28, $C5
      .BYTE $2E, $F2, $F1, $C8,	$A6, $29, $0E, $10, $13,	$29, $21, $C2, $07, $C5, $24, $F2 ; $10
      .BYTE $0D,	$F2, $26, $C7, $20, $C4, $79, $29, $0B, $29, $18, $2B, $11, $22,	2, $26 ; $20
      .BYTE $03, $DB, $10, $C3, $0E, $C1, $14, $F9, $3E, $C4, $1A,	$C3, $10, $C6, $56, $10 ; $30
      .BYTE $1A, $11, $4C, $D3,	$15, $D3, $0D, $C1, $16,	$C1, $0F, $F3, $18, $F4,	$13, $F2 ; $40
      .BYTE $64, $10, $28, $D3,	$19, $C1, $12, $D3, $0B,	$FE, $13, $C1, $15, $F3, $A7, $11 ; $50
      .BYTE $11, $29, $05, $29, $0B, $21, $0C, $21,	$D, $21, $0E, $21, $0F, $21, $1A,	$C6 ; $60
      .BYTE $60, $C1, $04, $C1, $08, $CA, $80, $2D,	$A, $10, $42, $29, $43,	$F9, $F1, $A1 ; $70
      .BYTE $3E, $18, $23, $11,	$18, $10, $16, $29, $24, $22, $06, $21, $08, $22, $13, $D5 ; $80
      .BYTE $12, $C1, $08, $C1, $24, $26,	6, $22,	$2B, $F1, $F1, $68, $F1, $A1, $34, $18 ; $90
      .BYTE $0A,	$18, $9C, $0A, $02, $23, $98, $10,	$55, $C1, $12, $08, $10, $51, $F0, $E8 ; $A0
      .BYTE $FF ; $B0
LevelData_1_3_Area0:
      .BYTE $20, $E0, $03, $19, $55, $2C, $0B, $2C, $33, $2C, $0D, $2C, $16, $34, $27, $A
      .BYTE $02, $20, $F0, $54, $F1, $A0,	$FF ; $10
LevelData_1_3_Area1:
      .BYTE $20, $E0, $67, $19, $58, $0A, $02, $10, $23, $39, $32, $32, $0B, $32, $35, $33
      .BYTE $0A,	$30, $1A, $AF, $F0, $54, $34, $31, $0C, $30, $1C, $AC, $12, $31,	$34, $31 ; $10
      .BYTE $32, $31, $34, $31,	$F0, $5C, $32, $31, $0C,	$30, $34, $37, $62, $37, $18, $A9 ; $20
      .BYTE $0D,	0, $0E, $00, $1D, $00, $0E, $00, $14, $31, $09, $35, $F0,	$14, $6A, $33 ; $30
      .BYTE $3C, $31, $13, $13,	2, $08, $2C, $31,	$27, $32, $F1, $5B, $F1, $74, $44, $35 ; $40
      .BYTE $36, $35, $34, $35,	$19, $A6, $27, $31, $0A,	$31, $17, $AF, $08, $AD, $F0, $16 ; $50
      .BYTE $49, $AE, $65, $A9,	$B, $AB, $51, $33, $0C, $32, $12, $AC, $0D, $A8, $F0, $17 ; $60
      .BYTE $F0, $D4, $63, $31,	$14, $A7, $2C, $09, $02, $30, $26, $31, $51, $73, $06, $73 ; $70
      .BYTE $F1, $18, $F1, $C0,	$FF ; $80
LevelData_1_3_Area2:
      .BYTE $A0, $EA, $57, $19, $39, $29,	$13, $13, $02, $26, $6B, $32, $28, $77, $F0, $4B
      .BYTE $F1, $0D, $7F, $30, $16, $31, $0A, $32, $23, $31, $0F,	$30, $20, $31, $1F, $30 ; $10
      .BYTE $F0, $08, $90, $66, $07, $31, $17, $31,	9, $66,	$20, $66, $07, $30, $08, $01 ; $20
      .BYTE $17, $31, $09, $66, $20, $66,	7, $31,	$17, $31, $09, $66, $80, $29, $10, $30 ; $30
      .BYTE $0A,	$29, $20, $29, $10, $30, $09, $82, $0A, $82, $0B, $82, $0E, $82, $0F,	$82 ; $40
      .BYTE $20, $29, $10, $30,	$F0, $4D, $F0, $A8, $F0, $CC, $F1, $08, $93, $29,	$32, $81 ; $50
      .BYTE $03, $81, $06, $81, $F0, $B0, $F1, $0F, $F0, $31, $F2, $99, $42,	$F1, $0F, $F1 ; $60
      .BYTE $CA, $F5, $02, $40, $FF ; $70
LevelData_1_3_Area3:
      .BYTE $AA, $F8, $16, $22, $6E, $25,	$F, $25, $1E, $32, $3F,	$25, $F0, $50, $F0, $BD
      .BYTE $F1, $5B, $F1, $9A,	$B0, $25, $04, $84, $33, $81, $0A,	$33, $11, $25, $05, $80 ; $10
      .BYTE $F0, $99, $F0, $DC,	$F1, $F8, $FF ; $20
LevelData_2_1_Area0:
      .BYTE $80, $EC, $90, $00, $00, $0E, $14,	$11, $12, $10, $1C, $10, $4A, $17, $12,	$17
      .BYTE $8A, $10, $27, $17,	$E2, $10, $14, $11, $4A, $07, $0F,	$D3, $11, $D5, $0E, $D1 ; $10
      .BYTE $10, $D1, $06, $D1, $0D, $D1, $77, $10, $19, $11, $48,	$29, $1C, $D3, $12, $D1 ; $20
      .BYTE $0B,	$D1, $0F, $D1, $13, $D1,	$A, $D1, $B8, $26, $0A, $22, $0B,	$2B, $0C, $22 ; $30
      .BYTE $0D,	$22, $17, $36, $14, $07, $08, $34, $17, $36, $10, $D1, $08, $34, $8E,	$10 ; $40
      .BYTE $39, $29, $37, $0F, $A, $0F, $1D, $D2, $F0, $0C, $F6, $01, $93, $11, $47, $0F ; $50
      .BYTE $0F,	$37, $1E, $39, $1D, $3B, $F1, $8C, $F6,	0, $89,	$10, $10, $29, $05, $29 ; $60
      .BYTE $1F, $29, $11, $33,	$10, $35, $1C, $0F, $F2,	$7D, $0F, $F0, $0C, $F6, $01, $F1 ; $70
      .BYTE $8C, $F6, $00, $A3, $10, $11,	$11, $07,	$17, $59, $0B, $03, $10, $FF ; $80
LevelData_2_1_Area1:
      .BYTE $09, $F6, $31, $09, $66, $13, $03, $09, $7D, $29, $F0, $55, $F1, $1C,	$F1, $4D
      .BYTE $83, $29, $F2, $72,	$29, $1D, $29, $32, $A3, $32, $05, $F1, $C0, $12,	$AA, $AC ; $10
      .BYTE $0A,	3, $20,	$F0, $F4, $F1, $98, $F1, $A0, $FF ; $20
LevelData_2_1_Area4:
      .BYTE $91, $EA, $20, $1A, $97, $80,	$23, $0A, $03, $13, $F0, $4D, $F0,	$CC, $F1, 2
      .BYTE $F2, $F0, $48, $F0,	$8C, $F2, $84, $86, $05, $86, $F0, $48, $F1, $0B, $F1, $CA ; $10
      .BYTE $F5, $04, $00, $FF ; $20
LevelData_2_1_Area3:
      .BYTE $18, $E3, $01, $01, $54, $32, $09, $32, $15, $30, $0A, $30, $27, $31, $24, $31
      .BYTE $0A,	$31, $15, $31, $09, $31, $16, $33, $1B, $24, $F0,	$44, $F0, $65, $F0, $86 ; $10
      .BYTE $F0, $A7, $F1, $86,	$F1, $A3, $F1, $C8, $FF ; $20
LevelData_2_2_Area0:
      .BYTE $89, $EA, $10, $19, $8E, $81,	$F, $81, $F0, $B0, $F1,	$6F, $BD, $14, $04, $10
      .BYTE $40, $81, $F0, $2E,	$F1, $CA, $FF ; $10
LevelData_2_2_Area1:
      .BYTE $80, $EA, $90, $18, $2D, $10,	$1B, $11, $56, $16, $0D,	$16, $32, $0B, $04, 1
      .BYTE $F0, $6D, $F0, $8D,	$F6, $00,	$7C, $10, $8F, $0F, $11,	$D1, $0C, $F, $F0, $8D ; $10
      .BYTE $F6, $01, $5A, $10, $26, $11,	$33, $29, $10, $29, $22, $0F, $F, $07, $F0, $8D ; $20
      .BYTE $F6, $00, $74, $10, $45, $29,	9, $29,	$34, $26, $08, $21, $0C, $21, $0D, $2B ; $30
      .BYTE $F0, $0C, $AC, $0F, $17, $0F, $19, $0F,	$13, $07,	4, $97,	$30, $07,	$F0, $0D ; $40
      .BYTE $F0, $A2, $F6, $01, $68, $10,	$41, $07,	$3F, $0B, $04, $22, $F0, $A2, $F6,	2 ; $50
      .BYTE $F1, $C2, $F6, $03, $F2, $7E,	7, $15,	7, $0A, $07, $F0, $0C, $F5,	4, $22 ; $60
      .BYTE $F6, $00, $83, $11, $10, $10,	$4D, $0F, $15, $07, $09, $07, $12, $07, $86, $11 ; $70
      .BYTE $12, $10, $4A, $37,	$19, $39, $18, $3B, $17, $3D, $9D, $0C, $F5, $04, $30, $4A ; $80
      .BYTE $87, $0B, $87, $0C, $87, $0D, $03, $0E, $87, $0F, $87, $7D, $03, $F1, $48, $FF ; $90
LevelData_2_2_Area2:
      .BYTE $89, $EA, $20, $19, $8B, $28,	$D, $26, $0E, $2D, $0F, $22, $1A,	$36, $19, $21
      .BYTE $0A,	$36, $19, $38, $18, $3A, $F0, $B7, $F0,	$F0, $5D, $02, $1D, $02, $1D, $02 ; $10
      .BYTE $1D, $02, $3C, $02, $1C, $02, $11, $22, $F0, $97,	$F0, $D0, $F1, $4F, $F1, $AE ; $20
      .BYTE $F5, $04, $15, $90, $13, $04, $15, $24,	$29, $33, $25, $04, $25, $05, $25, $37 ; $30
      .BYTE $27, $F0, $6F, $F0,	$D4, $F1, $4A, $FF ; $40
LevelData_2_2_Area3:
      .BYTE $09, $F2, $31, $09, $02, $8A, $03, $8A, $04, $8A, $05, $8A, $06, $8A, $07, $8A
      .BYTE $08, $8A, $09, $8A, $62, $12, $77, $80,	7, $29,	$F5, $04,	$19, $AC, $80, $0C ; $10
      .BYTE $29, $54, $80, $04, $29, $F0,	$51, $F1, $6D, $3B, $80, $0B, $29, $52, $82, $03 ; $20
      .BYTE $82, $04, $82, $05, $82, $23, $29, $F1,	$6E, $F2, $9A, $83, $0B,	$83, $0C, $83 ; $30
      .BYTE $0D,	$83, $0E, $83, $2C, $0A, $04, $50, $F1, $A0, $FF ; $40
LevelData_2_2_Area4:
      .BYTE $18, $E3, $01, $01, $54, $32, $09, $32, $15, $30, $0A, $30, $27, $31, $24, $31
      .BYTE $0A,	$31, $15, $31, $09, $31, $16, $33, $1B, $24, $F0,	$44, $F0, $65, $F0, $86 ; $10
      .BYTE $F0, $A7, $F1, $86,	$F1, $A3, $F1, $C8, $FF ; $20
LevelData_2_2_Area5:
      .BYTE $89, $EA, $22, $1A, $43, $0A, $04, $33, $F0, $4E, $F1, $4F, $F1,	$BC, $F2, $64
      .BYTE $4E, $64, $00, $07, $00, $08, $00, $F0, $13, $F0, $8D, $70, $46, $10,	$42, $F0 ; $10
      .BYTE $88, $F0, $EC, $F1,	$2B, $F1, $8A, $F5, $05, $00, $FF ; $20
LevelData_2_3_Area0:
      .BYTE $89, $EA, $00, $01, $09, $A9, $F5, $05, $11, $F0, $2F, $F0, $CC, $F1,	$8F, $F1
      .BYTE $EA, $FF ; $10
LevelData_2_3_Area1:
      .BYTE $80, $EC, $90, $00, $00, $89, $01, $89, $02, $89, $03, $89, $25, $29, $1C, $29
      .BYTE $18, $2B, $16, $C4,	$2B, $21, $1A, $C2, $95, $11, $08, $10, $66, $A6,	$F5, $05 ; $10
      .BYTE $00, $12, $32, $09, $32, $0D, $26, $0E, $21, $0F, $21, $14, $31, $06, $05, $07 ; $20
      .BYTE $32, $14, $31, $07, $32, $14,	$31, $07,	$32, $14, $31, $07, $32, $14, $31, $06 ; $30
      .BYTE $05, $07, $32, $53, $29, $31, $0F, $F, $29, $23,	$21, $05,	$21, $71, $C2, $1E ; $40
      .BYTE $29, $02, $0B,	5, $20,	$16, $22, $09, $22, $11, $C2, $05, $C3, $09, $C2, $0E ; $50
      .BYTE $C3, $DD, $11, $5D,	$F, $C3, $29, $39, $0F, $13, $0F,	$E, $0F,	$F1, $4C, $F6 ; $60
      .BYTE $01, $F1, $CC, $F6, $00, $90, $10, $0E, $10, $12, $11, $52, $0F, $06, $0F, $A ; $70
      .BYTE $0F,	$1E, $D1, $F0, $6C, $F6, $01, $F0, $CC, $F6, $00, $86, $11,	$31, $29, $08 ; $80
      .BYTE $29, $43, $D2, $0A, $D1, $F0, $0C, $F6, $02, $F0, $6C, $F6, $00, $F0, $CC, $F6 ; $90
      .BYTE $02, $F1, $4C, $F6, $00, $84, $10, $52,	$F, $0E,	$F, $C8, $17, $47, $0B, $05 ; $A0
      .BYTE $30, $F4, $26, $16,	9, $16,	$FF ; $B0
LevelData_2_3_Area2:
      .BYTE $91, $EA, $10, $19, $8A, $2D,	$D, $13, $05, $13, $18, $54, $0B, $21, $F1, $F
      .BYTE $F2, $90, $26, $01, $52, $F0,	$8A, $FF ; $10
LevelData_2_3_Area3:
      .BYTE $09, $E1, $61, $09, $68, $14, $05, $19, $5C, $31, $13, $31,	$F0, $35, $F1, $1C
      .BYTE $6B, $29, $9D, $29,	$A8, $28, $3A, $34, $F0, $75, $F1, $1C,	$F1, $75, $82, $2C ; $10
      .BYTE $06, $2C, $09, $2C, $0D,	$2C, $24, $2C, $0B, $2C,	$5C, $09,	5, $50,	$F1, $33 ; $20
      .BYTE $F1, $92, $BB, $29,	$54, $29, $F0, $6F, $92, $29, $5D, $29,	$F0, $0D, $B6, $83 ; $30
      .BYTE $07, $83, $08, $83, $09, $83, $28, $0A, $05,	$70, $1B, $29, $F0, $0E,	$F0, $CD ; $40
      .BYTE $F1, $4E, $F1, $A0,	$FF ; $50
LevelData_2_3_Area4:
      .BYTE $18, $E3, $01, $01, $54, $31, $0A,	$31, $15, $31, $09, $31, $26, $33, $15, $31
      .BYTE $09, $31, $14, $30, $0B, $30, $28, $28, $F0, $44, $F0,	$65, $F0, $86, $F0, $A7 ; $10
      .BYTE $F1, $66, $F1, $84,	$F1, $A0, $FF ; $20
LevelData_2_3_Area5:
      .BYTE $89, $EA, $62, $1A, $43, $0A, $05, $33, $2C, $35, $1C, $35, $1C,	$35, $1C, $35
      .BYTE $0D,	$29, $F0, $4E, $F1, $8F, $C2, $3F, $12,	$3F, $12, $3F, $0B, $29,	$12, $3F ; $10
      .BYTE $10, $3F, $03, $29, $10, $3F,	$10, $3F, $08, $29, $F0, $1C, $62, $29, $2F, $34 ; $20
      .BYTE $1F, $34, $1F, $34,	$1E, $36, $1D, $38, $1C, $3A, $1B, $3C,	$1A, $3E, $F0, $0F ; $30
      .BYTE $F0, $4E, $F0, $CF,	$F1, $0D, $F2, $F1, $CC,	$F2, $73, $0F, $06, $07, $11, $0F ; $40
      .BYTE $F1, $2D, $F2, $A0,	7, $06, $07, $22, $42, $F0,	$10, $F2, $F0, $CF, $F1, $4A ; $50
      .BYTE $F5, $05, $60, $FF ; $60
LevelData_2_3_Area6:
      .BYTE $AA, $EA, $13, $2A, $8E, $30,	$F0, $CD, $F1, $52, $F1, $CD, $E4, $32,	$1A, $33
      .BYTE $1C, $83, $0D, $83, $10, $00, $01, $00, $02,	0, $03, $33, $10,	0, $01, $00 ; $10
      .BYTE $02, $00, $F0, $16, $F0, $6D, $F1, $CA,	$FF ; $20
LevelData_2_3_Area7:
      .BYTE $09, $E0, $03, $11, $32, $2C, $0D,	$2C, $22, $2C, $0D, $2C,	$22, $2C, $0D, $2C
      .BYTE $15, $35, $27, $0A, $05, $36, $F0, $41, $F1, $80, $FF ; $10
LevelData_3_1_Area0:
      .BYTE $80, $EA, $10, $10, $13, $10,	$14, $11, $1A, $16, $0B,	$16, $F0, $42, $EA, $C2
      .BYTE $16, $C1, $18, $F1,	$C, $C3, $14, $C4, $0D, $B, $06, $16, $F1,	$28, $F1, $42 ; $10
      .BYTE $FF ; $20
LevelData_3_1_Area1:
      .BYTE $00, $F3, $90, $08, $6C, $10, $52, $10, $18, $12,	$F5, $06,	$31, $C3, $10, $46
      .BYTE $10, $9C, $10, $34,	$10, $70, $FF, $B4, $E2, $F0, $6C, $34,	$E2, $38, $E1, $3A ; $10
      .BYTE $E1, $3C, $E2, $3A,	$E1, $38, $E1, $35, $E1, $32, $E3, $37,	$E1, $37, $E4, $3B ; $20
      .BYTE $E2, $10, $C2, $2B,	$E2, $20, $C3, $1B, $E2, $20, $C4, $12,	$B, $06, $01, $08 ; $30
      .BYTE $E3, $F1, $91, $F2,	$F1, $8A, $F3, $76, $C1, $27, $C2, $18,	$B, $06, $20, $F1 ; $40
      .BYTE $8B, $F1, $AB, $F6,	7, $FF ; $50
LevelData_3_1_Area2:
      .BYTE $89, $EA, $20, $11, $87, $13,	6, $19,	$F0, $D1, $F2, $94, $5E, $0D, $26, $F2
      .BYTE $BB, $08, $0D,	$A, $06, $16, $F1, $10, $F1, $CA,	$FF ; $10
LevelData_3_1_Area3:
      .BYTE $80, $E8, $53, $10, $56, $10,	$2A, $11, $2E, $10, $12, $0A, $06,	$43, $17, $11
      .BYTE $10, $E4, $08, $10, $1C, $10,	$7C, $00,	$1C, $E2, $27, $0C, $F5,	6, $10,	$1F ; $10
      .BYTE $E2, $2F, $00, $10, $E6, $07, $03, $08, $EA, $60, $E2, $26,	$E2, $12, $2B, $26 ; $20
      .BYTE $26, $07, $22, $0D, $E2, $16, $C1, $20, $00, $01, $00, $0A, $E3, $79,	$E3, $22 ; $30
      .BYTE $00, $10, $E3, $07, $E3, $36, $E2, $34,	$C1, $0A, $E2, $50, $2D,	$29, $A8, $18 ; $40
      .BYTE $21, $19, $05, $31, $21, $3D,	$26, $0E, $21, $0F, $21, $F0, $0C,	$F0, $4B, $F0 ; $50
      .BYTE $95, $F2, $4E, $0B, $06, $40, $80, $21, $01, $21, $02, $21, $F0, $8B, $F1,	$28 ; $60
      .BYTE $F1, $8B, $F1, $CA,	$FF ; $70
LevelData_3_1_Area4:
      .BYTE $91, $EA, $32, $12, $41, $13,	6, $35,	$F0, $2E, $F2, $67, $36, $3D, $00, $1D
      .BYTE $00, $14, $35, $10, $31, $F0,	8, $F1,	$59, $F1, $CA, $F5, $07, $00, $F3, $26 ; $10
      .BYTE $83, $20, $81, $0D, $14, $06, $30, $18, $25, $09, $25, $F0, $0B, $F0, $4E, $F1 ; $20
      .BYTE $EA, $FF ; $30
LevelData_3_1_Area5:
      .BYTE $80, $EA, $98, $10, $2F, $16,	$9C, $0A, $07, $23, $F0, $82, $F6,	0, $F1,	4
      .BYTE $66, $16, $0D, $16, $2A, $0F,	$17, $0F, $53, $A4, $33,	5, $F5,	7, $11,	$F0 ; $10
      .BYTE $62, $44, $16, $1C,	$CD, $11, $0F, $16, $0F, $09, $C4, $52, $A4, $32, $05, $F5 ; $20
      .BYTE $07, $12, $F0, $64, $7C, $0F, $1E, $51, $42, $A4, $32,	5, $F5,	7, $13,	$F0 ; $30
      .BYTE $42, $46, $16, $0B, $16, $31, $0F, $52, $A4, $32, $05, $F5, $07, $14, $F0, $64 ; $40
      .BYTE $40, $16, $05, $16, $92, $A3,	$22, $05,	$F5, $07,	$15, $F0, $C6, $F2, $2A, $16 ; $50
      .BYTE $1D, $16, $44, $01, $05, $01, $F0, $04, $F0, $85, $F0, $C4,	$F1, $03,	$F1, $44 ; $60
      .BYTE $A3, $16, $0C, $16, $26, $0F,	$11, $0F, $A, $0F, $F1, $83, $F1,	$C4, $F2, $25 ; $70
      .BYTE $16, $17, $16, $3E,	$25, $52, $A3, $22, $05, $F5, $07, $17, $57, $26, $09, $22 ; $80
      .BYTE $0B,	$22, $0C, $2B, $16, $C6,	$20, $25, $12, $02, $03, $02,	$F0, $45, $F0, $82 ; $90
      .BYTE $F1, $AA, $F6, $02, $FF ; $A0
LevelData_3_2_Area0:
      .BYTE $91, $EA, $72, $11, $97, $25,	9, $21,	$B, $21, $0D, $26, $13, $02, $04, 2
      .BYTE $05, $02, $06, $02,	$E, $02, $0F, $02, $2F, $2D,	$F0, $70, $F0, $EF, $F1, $D0 ; $10
      .BYTE $3C, $AC, $F5, $07, $01, $6C, $05, $40, $02, $01, $02, $0C, $05, $F0, $4F,	$F0 ; $20
      .BYTE $8E, $F1, $B1, $5D,	$AC, $F5, $07, $02,	$56, $25, $08, $25, $0A, $25, $14,	$83 ; $30
      .BYTE $0D,	5, $F0,	$BC, $F0, $D5, $9D, $A9, $F5, $07, $03, $F0, $17, $F1, $8F,	$F1 ; $40
      .BYTE $F7, $F2, $0D, $A9, $F5, $07, $04, $86, $41, $16, $41, $F0, $2F,	$F0, $97, $F0 ; $50
      .BYTE $CF, $F1, $17, $F1,	$4F, $F1, $CA, $6D, $A5, $F5, $07, $05, $65, $32, $3F, $83 ; $60
      .BYTE $F0, $4F, $F0, $BC,	$F1, $15, $F1, $D3, $89, $83, $23, $A8,	$E, $A8, $11, $01 ; $70
      .BYTE $05, $25, $06, $25, $0C,	$25, $0D, $25, $13, $05, $0E, $05, $32, $83, $05, $83 ; $80
      .BYTE $0D,	$83, $37, $25, $09, $25, $F0, $15, $3D, $A5, $50,	$25, $F5, $07, $08,	$F0 ; $90
      .BYTE $7C, $F0, $88, $F0,	$CC, $F1, $0E, $F1, $CA,	$FF ; $A0
LevelData_3_2_Area1:
      .BYTE $91, $EA, $30, $12, $83, $00, $04, $00, $05, $00, $06, $00,	7, $00, $08, $49
      .BYTE $F0, $7C, $D8, $47,	$F0, $55, $F1, $1C, $F5, $08, $00, $F2, $F0, $0E, $F2, $43 ; $10
      .BYTE $0A,	7, $00, $F0, $CA,	$FF ; $20
LevelData_3_2_Area2:
      .BYTE $91, $EA, $10, $11, $F0, $94,	$F2, $48, $13, $08, $10, $54, $83, $13, $82, $F0
      .BYTE $50, $F0, $AE, $F1,	$8A, $FF ; $10
LevelData_3_3_Area0:
      .BYTE $80, $E1, $30, $00, $35, $10, $29, $11,	$36, $C2, $17, $0B, $08, $01, $1E, $F
      .BYTE $8B, $11, $17, $10,	$32, $2B, $12, $0F, $10,	$F, $13, $01, $05, $52, $08, $26 ; $10
      .BYTE $5C, $18, $45, $10,	$49, $0F, $72, $18, $08, $18, $96,	$A, $08, $23, $FF ; $20
LevelData_3_3_Area1:
      .BYTE $A0, $EA, $33, $19, $55, $01, $0B, $2D, $6C, $09, $08, $39, $F0, $5C, $F0, $75
      .BYTE $F1, $1C, $F1, $55,	$82, $A8, $22, $05, $55, $0A, $08, $46, $F1,	$9C, $F1, $D5 ; $10
      .BYTE $AC, $0A, $08,	$53, $0D, $82, $19, $81,	$1A, $80, $0B, $80, $0C, $80, $F0, $5C ; $20
      .BYTE $F0, $95, $F0, $FC,	$F2, $B9, $14, $08, $13, $11, $2A, $03, $26, $05, $24, $0C ; $30
      .BYTE $28, $F0, $14, $F1,	$CA, $FF ; $40
LevelData_3_3_Area2:
      .BYTE $20, $E0, $93, $19, $15, $AB,	$18, $0A, $08, $70, $26, $80, $07, $80, $08, $80
      .BYTE $09, $80, $0A,	$80, $F0, $35, $C4, $31, $36, $33, $3A,	$32, $34, $29, $16, $33 ; $10
      .BYTE $33, $32, $36, $33,	$3A, $33, $36, $33, $42, $34, $12, $30,	3, $29,	5, $29 ; $20
      .BYTE $06, $30, $0D,	$29, $12, $30, $F0, $14, $12, $30, $04, $28, $09, $32, $12,	$34 ; $30
      .BYTE $1A, $29, $16, $29,	$C, $84, $0D, $84, $28, $83, $09, $83, $24, $81, $05, $81 ; $40
      .BYTE $42, $38, $0D, $A, $08, $40, $0E, $A8, $2E, $05, $F1, $B7, $87, $2C, $69,	$AF ; $50
      .BYTE $F0, $54, $F1, $D6,	$76, $AE, $99, $A5, $F0, $57, $83, $00, $0C, $00, $17, $31 ; $60
      .BYTE $16, $33, $15, $35,	$16, $33, $1D, $0A, $08, $43, $3D,	$AC, $F0, $56, $F0, $94 ; $70
      .BYTE $F1, $B6, $F1, $D5,	$16, $33, $45, $35, $15, $30, $0A, $30, $15, $30, $0A, $30 ; $80
      .BYTE $15, $35, $46, $33,	$38, $82, $11, $A9, $07, $80, $09, $80, $3B, $84, $29, $80 ; $90
      .BYTE $0A,	$80, $0C, $80, $0D, $80, $37, $84, $25, $80, $06, $80, $08, $80, $09, $80 ; $A0
      .BYTE $32, $31, $F0, $14,	$3C, $82, $1B, $80, $0D,	$80, $3D, $31, $3C, $82, $1B, $80 ; $B0
      .BYTE $0D,	$80, $23, $0A, $08, $20, $F0, $1A,	$F1, $74, $F1, $A0, $FF ; $C0
LevelData_3_3_Area3:
      .BYTE $20, $E0, $67, $19, $AE, $30,	$12, $0A, $08, $33, $0E, $AE, $2A, $87, $0B,	$87
      .BYTE $F0, $94, $F1, $BA,	$2C, $31, $1C, $A9, $52, $AF, $04, $A4, $06, $A4, $08, $A4 ; $10
      .BYTE $0A,	$A4, $F0, $D4, $93, $3B, $AA, $31, $3A,	$32, $F1, $5A, $3C, $32, $68, $31 ; $20
      .BYTE $36, $33, $12, $0A, $08, $36, $F0, $1B, $F0, $98, $F1,	$BB, $A6, $31, $48, $31 ; $30
      .BYTE $36, $33, $F0, $F8,	$66, $31, $36, $33, $68, $31, $F0, $3B,	$F1, $58, $36, $33 ; $40
      .BYTE $66, $31, $36, $33,	$1A, $0A, $08, $21, $F0, $9B, $F1,	$A0, $FF ; $50
LevelData_3_3_Area4:
      .BYTE $20, $E0, $37, $19, $A0, $37,	$1B, $0A, $08, $60, $27, $38, $F0,	$9E, $F0, $F3
      .BYTE $F1, $5E, $F1, $D3,	$26, $04,	$10, $37, $37, $38, $26, $04, $10, $37, $37, $38 ; $10
      .BYTE $26, $04, $10, $37, $F0, $3E,	$F0, $B3, $F0, $FE, $F1, $73, $F1, $BE,	$37, $38 ; $20
      .BYTE $26, $04, $10, $37, $37, $38,	$26, $04,	$10, $37, $37, $38, $F0, $53, $F0, $9E ; $30
      .BYTE $F1, $13, $F1, $5E,	$F1, $D3, $26, $04, $10, $37, $37, $38, $26, $04, $10, $37 ; $40
      .BYTE $43, $0A, $08,	$22, $F0, $3E, $F0, $B3, $F0, $FE, $F1,	$59, $F1, $A0, $FF ; $50
LevelData_3_3_Area5:
      .BYTE $20, $E0, $07, $19, $54, $2C, $0C, $2C, $57, $32, $14, $0A, $08, $50, $F0, $41
      .BYTE $F1, $A0, $FF ; $10
LevelData_3_3_Area6:
      .BYTE $80, $FD, $40, $1A, $3A, $10,	$27, $11, $35, $34, $15, $34, $15, $34,	$15, $34
      .BYTE $07, $0A, $08, $30, $15,	$31, $08,	$31, $0E, $24, $6A, $10,	$25, $11, $54, $40 ; $10
      .BYTE $05, $6B, $8A, $10, $2E, $11,	$50, $6F, $F0, $08, $98, $10, $60, $63, $06, $68 ; $20
      .BYTE $0F,	$40, $F2, $29, $10, $14, $10, $95, $42,	$F0, $4D, $F1, $6B, $F1, $E8, $F5 ; $30
      .BYTE $08, $80, $FF ; $40
LevelData_3_3_Area7:
      .BYTE $AA, $F8, $17, $22, $6E, $A4,	$F0, $5C, $F0, $DD, $F1, $5C, $F1, $D9,	$F2, $65
      .BYTE $A4, $2A, $33, $F0,	$DC, $F1, $F8, $FF ; $10
LevelData_4_1_Area0:
      .BYTE $80, $EA, $90, $10, $2C, $10,	$1E, $11, $44, $39, $0E,	$3F, $F0, $82, $F1, $D6
      .BYTE $F6, $05, $9A, $10, $6E, $32,	$A8, $11, $1B, $10, $43, $34, $31, $32,	8, $3F ; $10
      .BYTE $6B, $11, $68, $3F,	$38, $36, $7C, $11, $4E, $2D, $1E, $37,	$2A, $3C, $F2, $84 ; $20
      .BYTE $26, $0A, $54, $18, $39, $72, $10, $16, $11,	$45, $3A, $0A, $3B, $32,	$3F, $78 ; $30
      .BYTE $10, $57, $3F, $CE,	$10, $37, $33, $1A, $31, $1B, $31, $1B,	$32, $1B, $33, $5E ; $40
      .BYTE $8B, $0F, $8B, $21, $11, $27, $26, $08, $21, $16, $F3,	$A, $32, $24, $21, $11 ; $50
      .BYTE $2B, $03, $F6, $10, $32, $0B, $23, $F5, $09, $10, $1A, $F2, $FF ; $60
LevelData_4_1_Area1:
      .BYTE $80, $E8, $90, $12, $22, $10,	$17, $11, $52, $39, $F1, $82, $B8, $10,	$2C, $11
      .BYTE $F0, $C1, $F6, $01, $E1, $10,	$3B, $0F, $F1, $A2, $F6,	2, $A3,	$10, $1A, $11 ; $10
      .BYTE $1E, $0F, $2A, $0F, $18, $0F, $D, $0F, $26, $0F,	$F0, $81, $F6, $01, $99, $10 ; $20
      .BYTE $1E, $11, $3E, $0F, $B0, $10, $1A, $10, $4A,	$F, $28, $0F, $F0, $80, $83, $11 ; $30
      .BYTE $17, $10, $4D, $83,	$E, $83, $0F, $83, $1C, $82, $1B, $81, $1A, $80,	$F1, $4D ; $40
      .BYTE $F6, $02, $6B, $10, $F0, $02, $F1, $40,	$F6, $01,	$F2, $47, $10, $1A, $11, $4E ; $50
      .BYTE $80, $0F, $80, $35, $80, $06, $80, $07, $80, $F0, $A0, $F6, $02, $F1, $01, $F1 ; $60
      .BYTE $6C, $65, $11, $37,	$42, $30, $80, $F0, $22, $F1, $CA, $F5,	$A, $00, $FF ; $70
LevelData_4_1_Area2:
      .BYTE $80, $EA, $10, $10, $AC, $3C,	$F0, $8C, $F1, $88, $C8, $12, $F5, $0A, $10, $F1
      .BYTE $2A, $FF ; $10
LevelData_4_2_Area0:
      .BYTE $80, $E8, $90, $10, $32, $10,	$14, $11, $17, $0C, $F5,	$A, $01, $0C, $10,	$4F
      .BYTE $38, $2B, $34, $23,	$33, $07,	3, $08, $33, $4C,	$10, $78, $3F, $22, $10, $0A ; $10
      .BYTE $11, $7C, $10, $68,	$3F, $A0, $11, $58, $3F, $26, $10, $74,	$10, $12, $11, $58 ; $20
      .BYTE $3F, $2C, $10, $76,	$10, $3E, $10, $38, $3F, $88, $10, $1A,	$11, $96, $3F, $74 ; $30
      .BYTE $10, $52, $3F, $3C,	$10, $54, $10, $17, $11, $62, $3A, $19,	$34, $1A, $34, $1B ; $40
      .BYTE $35, $62, $10, $0B, $10, $1A, $11, $27, $0A, $A, $21,	$26, $E2, $33, $37, $FF ; $50
LevelData_4_2_Area1:
      .BYTE $80, $F6, $90, $28, $4C, $10,	$1E, $11, $49, $26, $0A,	$21, $0B, $21, $18, $B5
      .BYTE $0F,	$2B, $19, $2E, $78, $0A,	$A, $19, $26, $E4, $1F,	$34, $42, $BD, $15, $2E ; $10
      .BYTE $67, $29, $0B, $29, $2A, $32, $20, $33, $45,	$B4, $0D, $B4, $16, $2E,	$E, $2E ; $20
      .BYTE $63, $29, $22, $33,	$3B, $52, $16, $52, $0B,	$F2, $16, $F2, $9D, $29, $12, $26 ; $30
      .BYTE $10, $F2, $14, $30,	$14, $31, $15, $31, $27, $31, $0B, $B4, $1C, $2E, $56, $29 ; $40
      .BYTE $12, $10, $0E, $10, $18, $11, $19, $34, $54,	$B6, $25, $2E, $6F, $11, $1B, $29 ; $50
      .BYTE $0C,	$10, $70, $B4, $09, $B5, $11, $2E, $0A, $2E, $65, $34, $2C, $33, $52, $B8 ; $60
      .BYTE $25, $2E, $80, $3F,	$43, $08,	$18, $B5, $12, $F3, $19, $2E, $75, $10,	$2C, $10 ; $70
      .BYTE $18, $23, $F5, $0A, $30, $0B,	$11, $10, $31, $07, $42, $15, $46, $15, $F6, $FF ; $80
LevelData_4_2_Area2:
      .BYTE $80, $E8, $30, $30, $28, $10,	$1C, $11, $52, $39, $F1, $87, $A6, $10,	$53, $F
      .BYTE $12, $29, $0D, $26, $3E, $7F, $F0, $4C, $F1,	$CD, $C3, $29, $06, $29, $09, $29 ; $10
      .BYTE $0C,	$29, $3E, $77, $F0, $33, $BE, $0B, $A, $40, $18,	$2D, $F0, $5B, $F0, $D1 ; $20
      .BYTE $F1, $CA, $FF ; $30
LevelData_4_2_Area3:
      .BYTE $91, $EA, $20, $32, $81, $13,	$A, $33, $F0, $4C, $F0,	$AB, $F1, $E8, $F2, $A3
      .BYTE $3B, $F0, $0D, $F0, $48, $F0, $70, $F1, $F7,	$F2, $F0, $30, $F0, $77, $F0, $8F ; $10
      .BYTE $F1, $10, $F1, $8A,	$F5, $0B, $00, $FF ; $20
LevelData_4_3_Area0:
      .BYTE $91, $EA, $02, $11, $4B, $14, $0B, $11, $0D, $A8,	$F0, $54, $F0, $D3, $F1, $15
      .BYTE $F1, $CA, $FF ; $10
LevelData_4_3_Area1:
      .BYTE $80, $E1, $91, $00, $00, $8A, $2A, $10, $1D, $11,	$14, $2B, $14, $0F, $33,	$F
      .BYTE $05, $0F, $AA,	$CB, $27, $21, $16, $C8, $12, $26, $04, $21, $11,	$C6, $14, $0B ; $10
      .BYTE $0B,	0, $AC,	$10, $F1, $16, $F6, $05, $E0, $11, $25, $10, $D4,	$10, $0C, $10 ; $20
      .BYTE $18, $11, $F2, $57,	$51, $0A, $50, $16, $F4,	$14, $51, $14, $F1, $13, $50, $12 ; $30
      .BYTE $F1, $0E, $64, $53, $18, $09, $18, $8B, $0A, $B, $26, $23, $69,	$F0, $68, $F1 ; $40
      .BYTE $F6, $54, $18, $0A, $18, $89, $0A, $B, $36, $28, $6C,	$F0, $88, $55, $18, $0B ; $50
      .BYTE $18, $89, $0A, $B, $60, $25,	$6B, $F0, $16, $F0, $A8, $51, $18, $A1,	$62, $F0 ; $60
      .BYTE $D6, $FF ; $70
LevelData_4_3_Area2:
      .BYTE $20, $E0, $60, $09, $44, $0A, $B, $41, $21, $34,	$A, $34, $27, $31, $31,	$35
      .BYTE $08, $36, $21, $33, $06, $32, $0A, $34, $F0, $54, $24, $3A, $31,	$3A, $25, $35 ; $10
      .BYTE $2B, $33, $37, $33,	$34, $34, $31, $34, $08, $36, $2A, $34, $11, $32,	$1C, $32 ; $20
      .BYTE $12, $33, $23, $34,	$31, $39, $2C, $32, $39, $32, $34, $32,	$31, $33, $0B, $33 ; $30
      .BYTE $37, $31, $0D, $31, $21, $78, $1D, $31, $F1,	$BA, $F1, $D4, $36, $35, $31, $3A ; $40
      .BYTE $34, $3A, $31, $33,	$33, $33, $1D, $31, $25, $33, $0C, $32, $38, $33, $35, $33 ; $50
      .BYTE $33, $32, $0D, $31, $21, $36, $2A, $32, $35,	$32, $0C, $31, $23, $32,	$21, $31 ; $60
      .BYTE $09, $33, $14, $0A, $B, $16, $66, $78,	$F1, $3B, $F1, $C0, $FF ; $70
LevelData_4_3_Area3:
      .BYTE $20, $E0, $62, $09, $37, $0A, $B, $42, $26, $33,	$44, $3A, $31, $78, $F0, $41
      .BYTE $F1, $BA, $F1, $C1,	$5A, $74, $37, $29, $99, $29, $F0, $77,	$68, $29, $D9, $29 ; $10
      .BYTE $88, $0A, $B, $50, $12, $29,	$15, $35, $F0, $D3, $20, $35, $0A, $35, $45, $35 ; $20
      .BYTE $32, $3B, $41, $3A,	$F0, $21, $44, $3A, $41, $3A, $34, $3A,	$31, $3A, $3C, $32 ; $30
      .BYTE $38, $33, $34, $33,	$31, $32, $16, $09, $0B, $17, $0B, $33, $21, $38, $F1, $7A ; $40
      .BYTE $F1, $C0, $FF ; $50
LevelData_4_3_Area4:
      .BYTE $80, $E8, $32, $18, $5D, $E2,	$4F, $E1, $91, $41, $04, $41, $07, $41, $0A,	$41
      .BYTE $0D,	$41, $12, $18, $08, $18, $5B, $0A,	$B, $20, $1F, $26, $13,	$6C, $6F, $2D ; $10
      .BYTE $12, $41, $05, $41, $08, $41, $0B, $41, $0E, $41,	$13, $18, $09, $18, $58, $0A ; $20
      .BYTE $0B,	$30, $11, $22, $10, $6C, $FF ; $30
LevelData_4_3_Area5:
      .BYTE $20, $E0, $02, $09, $56, $32, $34, $36, $27, $0A, $B, $33,	$21, $3D, $F0, $21
      .BYTE $F1, $A0, $FF ; $10
LevelData_4_3_Area6:
      .BYTE $A0, $EA, $10, $1A, $62, $3D,	$46, $0A, $B, $18, $22, $3D, $F0, $50, $90, $34
      .BYTE $51, $42, $10, $34,	$F0, $B7, $F0, $EF, $F1, $2E, $F1, $6F,	$F1, $97, $F1, $CA ; $10
      .BYTE $F5, $0B, $70, $FF ; $20
LevelData_4_3_Area7:
      .BYTE $2A, $F5, $0F,	$12, $54, $32, $09, $32, $07, $00, $08,	0, $43,	$31, $0B, $31
      .BYTE $32, $40, $07, $00, $08, $00, $09, $00,	$D, $40, $F0, $35, $F6,	4, $F0,	$53 ; $10
      .BYTE $F0, $D5, $F6, $02, $F0, $F5,	$F6, $04,	$F1, $13, $F1, $95, $F6, $05, $F1, $A0 ; $20
      .BYTE $F6, $02, $F1, $C0, $F6, $04, $FF ; $30
LevelData_4_3_Area8:
      .BYTE $81, $E2, $20, $00, $00, $86, $01, $86, $02, $86, $1B, $10, $25, $16,	$1C, $C5
      .BYTE $E8, $16, $4A, $C8,	$3C, $0B, $C, $10, $2B, $82, $0C,	$82, $0D, $82, $0E, $82 ; $10
      .BYTE $0F,	$82, $F1, $48, $41, $10, $0E, $10, $13, $11, $53, $C8, $50, $82,	1, $82 ; $20
      .BYTE $04, $82, $05, $82, $06, $82, $09, $82, $0A,	$82, $0B, $82, $0C, $82, $0D, $82 ; $30
      .BYTE $F4, $F2, $3C, $16,	$F2, $37, $16, $FF ; $40
LevelData_5_1_Area0:
      .BYTE $91, $EA, $80, $11, $83, $13,	$C, $01, $1B, $2A, $0D, $26, $3E, $54, $F0, $71
      .BYTE $F1, $D4, $73, $FC,	$38, $87, $09, $87, $0A, $87, $35,	$84, $06,	$84, $07,	$84 ; $10
      .BYTE $F0, $68, $90, $FF,	$F2, $40, $FF, $62, $84, $03, $84, $04, $84, $05, $84, $06 ; $20
      .BYTE $84, $07, $84, $90, $FF, $2D,	$88, $0E, $88, $0F, $88, $24, $86, $05, $86, $06 ; $30
      .BYTE $86, $07, $86, $B0, $FF, $20,	$88, $01,	$88, $4F, $84, $79, $2B, $11, $27, $02 ; $40
      .BYTE $26, $10, $FF, $00, $81, $01, $81, $02, $81, $2D,	$88, $0E, $88, $0F, $88, $40 ; $50
      .BYTE $84, $01, $84, $02, $84, $03, $84, $26, $82, $07, $82, $08, $82, $09, $82, $70 ; $60
      .BYTE $FF, $23, $88, $04, $88, $05, $88, $9A,	$2D, $36, $00, $0A, $00, $10, $F0, $32 ; $70
      .BYTE $80, $03, $82, $04, $80, $08, $81, $4E, $0B, $C, $20, $14,	$26, $06,	$53, $F0 ; $80
      .BYTE $34, $F0, $CD, $F0,	$F4, $F1, $4D, $F1, $74, $F1, $92, $FF ; $90
LevelData_5_1_Area1:
      .BYTE $91, $F0, $13, $12, $6B, $32,	$51, $0B, $C, $18, $D1, $00, $F0, $0F, $F0,	$B0
      .BYTE $F1, $AA, $F5, $0D, $00, $FF ; $10
LevelData_5_1_Area2:
      .BYTE $91, $EA, $10, $11, $F0, $5B,	$F2, $F0, $11, $F1, $AA, $0C, $A9, $F5, $0D, $10
      .BYTE $FF ; $10
LevelData_5_2_Area0:
      .BYTE $81, $E0, $90, $00, $24, $10, $17, $11,	$59, $2A, $0A, $52, $18,	$C5, $13, $A4
      .BYTE $33, $05, $F5, $0D, $01,	$52, $10, $09, $16, $27, $16, $08, $16, $1B, $16, $F1 ; $10
      .BYTE $21, $AD, $16, $0F, $16, $15, $10, $0E, $16, $88, $21, $F1, $A2, $5D,	$2B, $3C ; $20
      .BYTE $10, $1F, $11, $17,	6, $F5,	$D, $40, $15, $2A, $08, $22, $09, $22, $0A, $21 ; $30
      .BYTE $F1, $88, $F1, $A0,	$C7, $11, $0B, $10, $1A,	$10, $F2, $18, $16, $1B, $16, $2F ; $40
      .BYTE $11, $22, $16, $14,	$16, $5C, $2A, $F0, $01, $F1, $28, $F1, $60, $F1,	$A8, $F1 ; $50
      .BYTE $E2, $49, $16, $22,	$10, $05,	$16, $5F, $86, $55, $81, $09, $81, $F0, $48, $F1 ; $60
      .BYTE $62, $F1, $C8, $3C,	$10, $1F, $11, $21, $16, $05, $16, $0B, $21, $0C, $2A, $0D ; $70
      .BYTE $21, $0E, $2D, $1A, $C4, $43, $85, $15, $84,	$21, $82, $F0, $E2, $95, $22, $06 ; $80
      .BYTE $28, $F1, $88, $9D,	$8A, $0E, $8A, $0F, $8A, $22, $10, $25, $11, $1B,	$16, $27 ; $90
      .BYTE $12, $F5, $0D, $23, $F0, $01, $FF ; $A0
LevelData_5_2_Area1:
      .BYTE $01, $F3, $30, $28, $0F,	$85, $48, $0C, $4E, $0B, $D, $30,	$29, $E2, $0C, $84
      .BYTE $0D,	$84, $32, $10, $F0, $DE, $24, $11, $2F,	$85, $1A, $10, $52, $E1, $F0, $53 ; $10
      .BYTE $F1, $1E, $78, $0D, $1D, $8C, $23, $10, $24,	$11, $39, $10, $0C, $83,	$12, $E1 ; $20
      .BYTE $55, $E1, $52, $10,	$6A, $10, $25, $11, $10, $E7, $08, $03, $09, $E4, $F5, $0D ; $30
      .BYTE $19, $F4, $46, $0C, $F3, $06, $0D, $FF ; $40
LevelData_5_2_Area2:
      .BYTE $01, $F5, $60, $29, $14, $10, $2C, $11,	$11, $0B, $D, $20, $22, $6B, $07, 1
      .BYTE $36, $10, $29, $11,	$32, $70, $0D, $70, $12,	$8E, $0D, $8E, $E3, $70,	$C, $70 ; $10
      .BYTE $2B, $70, $1B, $83,	$4B, $8F, $17, $70, $17, $86, $18, $70,	$18, $87, $04, $70 ; $20
      .BYTE $14, $81, $3A, $70,	$F0, $16, $1A, $89, $74, $70, $0B, $82, $14, $81, $15, $70 ; $30
      .BYTE $36, $70, $16, $85,	$F1, $57, $99, $70, $19, $88, $48, $70,	$18, $83, $F2, $F0 ; $40
      .BYTE $96, $F0, $D5, $F1,	$14, $F2, $3E, $70, $1E, $85, $2D, $81,	$2D, $0B, $D, $50 ; $50
      .BYTE $11, $70, $14, $60,	7, $60,	$A, $60, $24, $F7, $F1,	$56, $FF ; $60
LevelData_5_2_Area3:
      .BYTE $18, $E3, $11, $01, $F5, $0D, $13, $64, $31, $0A,	$31, $13, $30, $06, $30, 9
      .BYTE $30, $0C, $30, $35, $35, $28, $25, $F0, $44,	$F0, $65, $F0, $86, $F0, $A7, $F1 ; $10
      .BYTE $86, $F1, $A8, $F1,	$C4, $45, $35, $23, $32, $0A, $32, $25, $21, $08, $26, $F0 ; $20
      .BYTE $02, $F0, $21, $F0, $C0, $FF ; $30
LevelData_5_2_Area4:
      .BYTE $81, $EA, $20, $12, $82, $0B, $D, $36,	$2A, $67, $2A, $FF, $F0, $6C, $F1, $48
      .BYTE $53, $10, $26, $11,	$3E, $6D, $34, $69, $2A, $F3, $F1, $CC,	$55, $10, $A0, $F9 ; $10
      .BYTE $F0, $08, $F1, $4C, $F1, $8A,	$F5, $0E, $00, $FF ; $20
LevelData_5_2_Area5:
      .BYTE $91, $EA, $10, $11, $F0, $70,	$F2, $09,	$A9, $F5, $0E, $10, $F0,	$F, $F1, $8A
      .BYTE $FF ; $10
LevelData_5_3_Area0:
      .BYTE $81, $E8, $92, $00, $22, $10, $16, $11,	$28, $08,	$15, $21, $06, $21, $0B, $26
      .BYTE $46, $A4, $F5, $0E, $01, $26, $05, $F0, $82, $F0, $C3, $F1, $84,	$F1, $C0, $7D ; $10
      .BYTE $11, $3F, $29, $1D,	$29, $13, $16, $04, $16, $18, $29, $0C, $82, $0D, $82, $27 ; $20
      .BYTE $26, $08, $21, $09, $21, $52, $10, $16,	$11, $55, $29, $21, $82, $04, $82, $0A ; $30
      .BYTE $82, $0C, $29, $0F, $26, $17,	$81, $09,	$29, $1C, $2B, $F1, $C1, $58, $10, $1B ; $40
      .BYTE $11, $1C, $10, $60,	$21, $01,	$21, $02,	$21, $03,	$21, $0C, $D2, $17, $29,	$D ; $50
      .BYTE $0F,	$F0, $C0, $44, $1F, $9C, $D5, $6C, $1F,	$32, $10, $18, $11, $3B, $21, $11 ; $60
      .BYTE $21, $0A, $D3, $25, $C2, $F0, $88, $F1, $20,	$F2, $9A, $16, $0B, $16,	$90, $10 ; $70
      .BYTE $13, $11, $08, $10, $5D, $83,	$3F, $25, $F1, $C4, $3C, $1F, $63, $2A,	5, $26 ; $80
      .BYTE $07, $2A, $34, $83, $0C, $DC, $28, $A3, $F5, $0E, $24, $11, $2D, $18, $05, $F1 ; $90
      .BYTE $80, $5B, $10, $1E,	$11, $5A, $16, $F1, $88, $FF ; $A0
LevelData_5_3_Area1:
      .BYTE $91, $EA, $42, $11, $04, $1F, $7E, $D7,	$18, $0B, $E, $33, $F0, $4C, $7C, $1F
      .BYTE $6A, $21, $18, $DB,	$F0, $88, $F1, $2C, $F2, $7D, $32, $12,	$D2, $13, $D2, $09 ; $10
      .BYTE $21, $3E, $24, $F1,	$68, $F1, $8D, $C2, $83, $35, $25, $08, $21, $0A, $21, $0C ; $20
      .BYTE $21, $0E, $21, $F0, $15, $37, $A5, $F5, $0E, $18, $4A, $00, $1A, $04, $12, $80 ; $30
      .BYTE $03, $80, $60, $26, $F0, $5A,	$F0, $95, $F0, $EE, $F1, $CA, $FF ; $40
LevelData_5_3_Area2:
      .BYTE $18, $E0, $61, $11, $68, $13,	$E, $40, $28, $33, $12,	$31, $24, $31, $26, $31
      .BYTE $F0, $8A, $F0, $B3,	$F1, $2A, $F1, $D3, $29, $31, $2C, $31,	$12, $31, $25, $31 ; $10
      .BYTE $27, $32, $22, $32,	$C, $31, $35, $31, $28,	$32, $F0, $4A, $F0, $D3, $F1, $2A ; $20
      .BYTE $F1, $B3, $2C, $31,	$12, $32, $25, $32, $38, $32, $3B, $32,	$14, $34, $F0, $2A ; $30
      .BYTE $F0, $F3, $F1, $4A,	$4C, $00,	$D, $00, $1A, $33, $33, $31, $26,	$81, $07,	$13 ; $40
      .BYTE $0E,	$20, $23, $32, $23, $32, $33, $32, $0A, $33, $0D,	0, $16,	$85, $07,	$85 ; $50
      .BYTE $F0, $99, $F0, $CA,	$F1, $0B, $F1, $D5, $23,	$32, $1B, $32, $23, $31, $28, $04 ; $60
      .BYTE $14, $38, $0D, $00, $33, $31, $1A, $00, $0B, $32,	$23, $31, $F1, $0B, $33,	$31 ; $70
      .BYTE $06, $86, $07, $86, $08, $34, $0D,	0, $33,	$31, $1B, $32, $23, $31, $28, $04 ; $80
      .BYTE $14, $39, $0B, $00, $32, $00, $12, $00, $F0, $2A, $12, $00, $16, $33, $F0, $36 ; $90
      .BYTE $F0, $80, $FF ; $A0
LevelData_5_3_Area3:
      .BYTE $81, $E8, $90, $12, $02, $1F, $67, $0B, $E, $30,	$1F, $21, $16, $DF, $7A, $1F
      .BYTE $21, $10, $15, $11,	$38, $D9, $10, $21, $01, $21, $02, $21, $AD, $10, $63, $D6 ; $10
      .BYTE $E3, $11, $50, $10,	$D, $11, $3A, $1F, $B4,	$10, $C7, $21, $09, $21, $0B, $21 ; $20
      .BYTE $14, $D9, $98, $E2,	$49, $E2, $13, $E3, $0F,	$E2, $30, $E1, $A4, $E3, $1A, $D3 ; $30
      .BYTE $1C, $0F, $38, $10, $0E, $D2,	$1F, $0F, $54, $10, $28,	$11, $52, $DE, $1A, $0F ; $40
      .BYTE $5C, $89, $0D, $89, $0E, $89,	$F, $89, $8A, $81, $0B, $81, $F0, $8D, $F1, $0C ; $50
      .BYTE $F5, $0E, $50, $FF ; $60
LevelData_5_3_Area4:
      .BYTE $AA, $EA, $12, $22, $F0, $4F,	$F0, $CC, $F1, $4F, $F1, $D7, $F1, $EF,	$F2, $F0
      .BYTE $16, $F0, $88, $F0,	$B6, $F0, $C1, $F0, $EC, $F1, $EA, $7D,	$91, $0E, $91, $1C ; $10
      .BYTE $90, $18, $37, $FF ; $20
LevelData_6_1_Area0:
      .BYTE $80, $ED, $90, $18, $00, $8C, $01, $8C, $02, $8C, $03, $8C, $4C, $10,	$59, $16
      .BYTE $F1, $6D, $F6, $01, $AD, $10,	$2C, $11, $64, $D1, $09, $D1, $68, $2B, $2A, $10 ; $10
      .BYTE $55, $06, $2A, $D1, $F5, $0F, $60, $F1, $CD, $F6, $00, $66, $10,	$79, $0F, $10 ; $20
      .BYTE $0F,	$11, $0F, $07, $0F,	$F1, $8D, $F6, $02, $64, $11, $6F, $16, $32, $D1,	7 ; $30
      .BYTE $D1, $F1, $CD, $F6,	0, $68,	$10, $7E, $07, $2A, $D1, $F0, $4D, $F6, $01, $72 ; $40
      .BYTE $11, $14, $10, $51,	7, $0E, $94, $26, $D1, $F0, $0D, $F6, $00, $F1, $EC, $F6 ; $50
      .BYTE $03, $56, $10, $43, $0F, $09, $0F, $16, $0F, $11, $0F, $07, $0F, $14, $21, $08 ; $60
      .BYTE $26, $05, $0F,	$A, $0F,	$F0, $0C, $F6, $00, $94, $10, $2D,	$F, $2F, $0F, $17 ; $70
      .BYTE $0F,	$B, $0F,	$7C, $89, $0D, $89, $0E, $89, $0F,	$89, $44, $10, $17, $54, $09 ; $80
      .BYTE $2D, $17, $34, $18,	$33, $17, $34, $09, $0B, $F5, $0F, $10, $16, $32, $0A, $31 ; $90
      .BYTE $FF ; $A0
LevelData_6_1_Area1:
      .BYTE $89, $EA, $30, $19, $46, $13,	$F5, $0F, $09, $2D, $81, $0E, $81, $0F, $80,	$3B
      .BYTE $81, $F0, $4E, $F1,	$75, $F1, $BC, $C0, $80, $01, $80, $44, $00, $09, $06, $0F ; $10
      .BYTE $00, $10, $07, $02, $07, $04,	6, $05, $08, $06, $08, $07, $07, $0A, $07, $0B ; $20
      .BYTE $08, $0C, $06, $0D, $07, $0E, $07, $0F,	8, $F5,	$F, $50, $E7, $00, $10, $07 ; $30
      .BYTE $01, $07, $02, $08,	3, $06, $04, $07, $05, $07, $06, $08,	7, $08, $F5, $0F ; $40
      .BYTE $30, $F1, $71, $AB,	$32, $1B, $32, $1B, $32, $0C, $09,	$F5, $0F, $20, $1B, $30 ; $50
      .BYTE $0D,	$30, $F1, $4F, $F1, $CA, $FF ; $60
LevelData_6_1_Area2:
      .BYTE $89, $EA, $20, $1A, $83, $13,	$F5, $0F, $13, $F0, $51,	$B7, $83, $26, $81, $25
      .BYTE $32, $12, $00, $03, $00, $04, $00, $05,	$32, $F0, $0C, $F2, $F0,	$F, $F0, $6A ; $10
      .BYTE $F5, $10, $00, $FF ; $20
LevelData_6_1_Area3:
      .BYTE $18, $E3, $21, $19, $F5, $0F, $12, $65, $31, $09, $31, $36, $33,	$24, $31, $A
      .BYTE $31, $F0, $44, $F0,	$65, $F0, $86, $F0, $A7, $F1, $86, $F1,	$A8, $F1, $CF, $F2 ; $10
      .BYTE $F0, $4A, $F0, $CD,	$F1, $6B, $F1, $A0, $FF ; $20
LevelData_6_1_Area4:
      .BYTE $18, $E3, $01, $01, $64, $32, $09, $32, $34, $30, $0B, $30, $15, $35, $28, $24
      .BYTE $F0, $44, $F0, $65,	$F0, $86, $F0, $A7, $F1, $66, $F1, $83,	$F1, $A0, $FF ; $10
LevelData_6_1_Area5:
      .BYTE $18, $E3, $21, $19, $F5, $0F, $11, $65, $31, $09, $31, $36, $33,	$24, $31, $A
      .BYTE $31, $F0, $44, $F0,	$65, $F0, $86, $F0, $A7, $F1, $86, $F1,	$A8, $F1, $CF, $C6 ; $10
      .BYTE $82, $07, $82, $08, $82, $09, $82, $26, $27, $07, $22, $08, $22, $09, $27, $F0 ; $20
      .BYTE $4A, $F0, $CD, $F1,	$6B, $F1, $A0, $FF ; $30
LevelData_6_1_Area6:
      .BYTE $18, $E3, $01, $01, $65, $31, $09, $31, $33, $31, $0B, $31, $17, $31, $26, $26
      .BYTE $F5, $0F, $02,	$F0, $44, $F0, $65, $F0, $86, $F0, $A7,	$F1, $86, $F1, $A8, $F1 ; $10
      .BYTE $CF, $F6, $04, $FF ; $20
LevelData_6_2_Area0:
      .BYTE $91, $EA, $10, $19, $F0, $54,	$F1, $8F, $F2, $4C, $14, $F5, $10, $10,	$F0, $CE
      .BYTE $F1, $EA, $FF ; $10
LevelData_6_2_Area1:
      .BYTE $91, $EA, $90, $18, $00, $0E, $93, $0B, $F5, $10,	1, $19,	$21, $F0, $81, $F1
      .BYTE $88, $F1, $E0, $F2,	$F0, $88, $F2, $C9, $82, $0A, $82, $0B, $82, $F3,	$8F, $86 ; $10
      .BYTE $F2, $70, $26, $01, $21, $04, $2B, $10,	$86, $01,	$86, $04,	$86, $05,	$86, $F3 ; $20
      .BYTE $F3, $4C, $0B, $F5, $10, $20, $40, $21, $10,	$85, $01,	$85, $F0, $8B, $F1, $8A ; $30
      .BYTE $FF ; $40
LevelData_6_2_Area2:
      .BYTE $91, $EA, $20, $1A, $43, $13,	$F5, $10, $19, $F0, $4E, $F2, $6A, $00, $18, $32
      .BYTE $0E,	$31, $34, $31, $28, $00, $09, $44, $F0, $90, $AA, $82, $0B, $82, $0C,	$82 ; $10
      .BYTE $0D,	$82, $F5, $11, $00, $F0, $0E, $F1,	$F, $F1, $CA, $FF ; $20
LevelData_6_3_Area0:
      .BYTE $89, $EA, $00, $01, $07, $A9, $F5, $11, $11, $F0, $50, $F1,	$CA, $FF
LevelData_6_3_Area1:
      .BYTE $80, $EC, $40, $00, $00, $89, $01, $89, $0A,	$89, $0B, $89, $0C, $89, $0D, $89
      .BYTE $0E,	$89, $0F, $89, $75, $0A, $F5, $11, $44, $24, $42,	$F1, $0C, $F6, $01, $60 ; $10
      .BYTE $89, $01, $89, $02, $89, $03, $89, $28, $10, $1A,	$11, $3E, $0F, $28, $A6,	$C ; $20
      .BYTE $0F,	$F, $0F,	$F5, $11, $00, $1A, $26, $18, $05, $38, $05, $F0, $CC, $F6, $00 ; $30
      .BYTE $48, $11, $1D, $11,	$14, $10, $54, $D1, $08, $D1, $0D,	$F, $F0, $4C, $F6, $02 ; $40
      .BYTE $8A, $10, $14, $10,	$D, $11, $50, $2B, $10,	$F, $04, $D1, $0B,	$D1, $0F, $2A ; $50
      .BYTE $F1, $CC, $F6, $00, $6B, $89,	$C, $89, $0D, $89, $0E, $89, $0F, $89, $0A,	$97 ; $60
      .BYTE $19, $1E, $F5, $11,	$20, $FF ; $70
LevelData_6_3_Area2:
      .BYTE $91, $EA, $72, $19, $65, $15,	6, $13,	$F5, $11, $14, $F0, $8F, $C4, $A4, $13
      .BYTE $29, $05, $29, $2D, $A1, $34,	4, $0F, $04, $1A, $39, $1A, $39, $1A, $39,	$F1 ; $10
      .BYTE $5B, $95, $A1, $0A, $A1, $3C, $04, $18, $36, $18, $36,	$18, $36, $02, $29, $0E ; $20
      .BYTE $29, $F0, $91, $F1,	$1B, $F1, $F1, $5D, $83, $36, $25, $07, $25, $12,	$31, $12 ; $30
      .BYTE $31, $12, $31, $10,	$41, $02,	$31, $04,	$83, $12, $31, $07, $29, $12, $31, $05 ; $40
      .BYTE $3A, $12, $31, $05, $3A, $F0,	$5C, $F0, $95, $90, $37, $10, $37, $10,	$37, $10 ; $50
      .BYTE $37, $08, $83, $09, $83, $0F, $83, $10, $37, $10, $37, $1A, $54,	0, $37,	$F0 ; $60
      .BYTE $1C, $F1, $15, $34,	$88, $0D, $88, $50, $25,	2, $25,	6, $26,	$A, $25, $0C ; $70
      .BYTE $25, $0E, $25, $38, $80, $19, $83, $0A, $83, $32, $25, $0F, $25, $F0, $88, $F0 ; $80
      .BYTE $B5, $F1, $1C, $F1,	$35, $F1, $A8, $F1, $D5, $7D, $A8, $17,	$25, $1D, $05, $12 ; $90
      .BYTE $81, $23, $83, $31,	$25, $00,	$2D, $04,	$52, $08,	$52, $F0, $5C, $F0, $75, $F1 ; $A0
      .BYTE $BC, $F1, $D1, $B8,	$12, $F1, $0C, $F1, $2A,	$F5, $11, $39, $FF ; $B0
LevelData_6_3_Area3:
      .BYTE $00, $F3, $90, $08, $34, $E1, $48, $E1, $67, $12,	$F5, $11, $40, $32, $E1, 9
      .BYTE $E4, $54, $12, $18,	$12, $09,	$12, $0A, $12, $0B, $12, $0C, $12,	$84, $E1, $3A ; $10
      .BYTE $E2, $22, $12, $1D,	$12, $16, $E1, $54, $12, $3C, $12, $2B,	$12, $26, $12, $0A ; $20
      .BYTE $12, $44, $E7, $34,	$12, $05,	$12, $16, $12, $27, $12, $08, $12, $0C, $E1, $24 ; $30
      .BYTE $00, $0A, $00, $13, $E1,	$A, $E2, $55, $E4, $36,	$E2, $21, $E1, $4A, $12, $0D ; $40
      .BYTE $12, $34, $12, $16,	$E2, $52, $12, $04, $E1, $40, $EB, $0C, $03,	$D, $E2, $51 ; $50
      .BYTE $EA, $0C, $03,	$D, $E1, $32, $12, $03, $12, $04, $12, $05, $12, $08, $12, $09 ; $60
      .BYTE $12, $0A, $12, $2C, $12, $17, $12, $87, $E1,	$11, $12, $0D, $12, $32,	$E2, $09 ; $70
      .BYTE $E2, $36, $E1, $18,	$12, $59, $E1, $55, $12, $46, $12, $29,	$12, $F0, $34, $F2 ; $80
      .BYTE $07, $0C, $F5,	$11, $27, $F0, $18, $F0, $57, $F4, $44,	$D, $48, $0D, $92, $0D ; $90
      .BYTE $0D,	$D, $F2, $4A, $0D, $B, $0D, $C, $0D, $46, $0D, $B3,	$C, $BD, $0D, $34 ; $A0
      .BYTE $0D,	$A, $0D,	$A2, $0D, $BC, $0C, $6C, $0D, $51,	$D, $0D,	$D, $B5, $0C, $19 ; $B0
      .BYTE $0C,	$A, $0C,	$B, $0C,	$96, $0D, $CE, $86, $2D,	$84, $2B, $82, $0C, $82,	$59 ; $C0
      .BYTE $8C, $26, $8A, $08, $8A, $97,	3, $17,	3, $FF ; $D0
LevelData_6_3_Area4:
      .BYTE $80, $E8, $40, $00, $24, $10, $28, $0C, $F5, $11, $30, $0E, $11, $90, $E7, 8
      .BYTE $03, $09, $EF, $50, $10, $28, $11, $6C,	$3F, $1A, $3E, $1E, $3F, $40, $10, $22 ; $10
      .BYTE $11, $07, $17, $59, $0B, $F5, $11, $50, $2C, $37, $19,	$3C, $1E, $33, $13, $39 ; $20
      .BYTE $48, $11, $19, $E2,	$12, $10, $F2, $2A, $0A,	$F5, $11, $10, $20, $E1, $04, $E1 ; $30
      .BYTE $09, $E2, $4D, $11, $13, $10,	$28, $11, $FF ; $40
LevelData_6_3_Area5:
      .BYTE $A0, $EA, $13, $22, $86, $13,	$F5, $11, $42, $F0, $AF, $C3, $32, $07, $36, $46
      .BYTE $00, $F0, $11, $F0, $6C, $F1,	$4B, $F1, $CA, $F5, $11, $60, $FF ; $10
LevelData_6_3_Area6:
      .BYTE $AA, $F8, $13, $2A, $F0, $50,	$F0, $CD, $F1, $0C, $F1,	$4F, $F1, $8E, $F2, $8B
      .BYTE $81, $15, $32, $32,	0, $03, $00, $04, $00, $05, $00, $06,	0, $07, $00, $08 ; $10
      .BYTE $00, $F0, $50, $F1, $37, $F1,	$6F, $F1, $97, $F1, $CA, $FF ; $20
LevelData_7_1_Area0:
      .BYTE $00, $F3, $00, $00,	3, $A3,	$F5, $12, $12, $43, $E5, $20, $86, $01, $86, $18
      .BYTE $E3, $3A, $E3, $30,	$EF, $FF ; $10
LevelData_7_1_Area1:
      .BYTE $80, $E8, $63, $00, $27, $A9, $74, $23,	$F5, $12, $20, $13, $81, $04, $81, 5
      .BYTE $81, $0A, $E3, $22, $E9, $64, $E3, $B6, $80,	$C, $80, $3E, $11, $6C,	$A6, $F5 ; $10
      .BYTE $12, $00, $2D, $E2, $36, $E5,	$C, $05, $0D, $E4,	$41, $10, $7E, $01, $31, $3C ; $20
      .BYTE $0F,	$33, $2E, $80, $34, $10, $17, $11, $76,	$52, $07,	$2B, $0A, $22, $15, $C6 ; $30
      .BYTE $1E, $3A, $23, $80,	$D, $80, $3D, $10, $69,	$26, $1D, $00, $1C, $E7, $49, $80 ; $40
      .BYTE $57, $21, $33, $04, $13, $00, $11, $EE,	$F4, $42, $0F, $06, $0F, $DC, $0F, $26 ; $50
      .BYTE $0F,	$E7, $0F, $F2, $90, $0F, $1E, $0F,	$E3, $0F, $1D, $0F, $E9, $0F, $B6,	$C4 ; $60
      .BYTE $1D, $0F, $18, $0A, $F5, $12,	$50, $FF ; $70
LevelData_7_1_Area2:
      .BYTE $80, $E8, $30, $00, $3C, $11, $19, $10,	$5F, $EB, $34, $E7, $0C,	$E9, $54, $10
      .BYTE $1B, $29, $5C, $E6,	$31, $29, $02, $E8, $19, $EA, $5C, $29, $43, $ED,	$23, $04 ; $10
      .BYTE $06, $EA, $10, $EE, $18, $E7,	$12, $EF, $23, $EC, $2C, $A7, $F5, $12,	$33, $71 ; $20
      .BYTE $29, $12, $EB, $20,	$29, $02,	$E5, $28, $E5, $10, $E3, $F4, $95, $0F, $DB, $0F ; $30
      .BYTE $CF, $0F, $12, $0F, $AB, $0F, $81, $0F,	$FF ; $40
LevelData_7_1_Area3:
      .BYTE $00, $F3, $30, $00, $64, $A6, $0A,	$A6, $22, $E1, $04, $05, $05,	$E4, $0A, 5
      .BYTE $0B,	$E1, $37, $AA, $21, $E5, $07, $05, $08, $E5, $66, $AB, $08, $AB, $14, $AA ; $10
      .BYTE $0A,	$AA, $21, $E2, $0B, $E2,	$80, $EF, $76, $00, $07, $00,	8, $00, $09, $00 ; $20
      .BYTE $12, $A7, $05, $00, $0A,	0, $15,	0, $0A, $00, $10, $E1, $02, $05, $03, $EC ; $30
      .BYTE $85, $00, $0A,	0, $0C, $00, $10, $EF, $30, $EF, $3A, $E3,	$13, $A3, $F5, $12 ; $40
      .BYTE $23, $20, $E2, $03, $05, $04, $EB, $F4, $35, $C4,	$23, $0F, $B, $0F, $17, $0A ; $50
      .BYTE $F5, $12, $40, $C2,	$F, $0C,	$F, $FF ; $60
LevelData_7_1_Area4:
      .BYTE $A1, $EA, $10, $02, $48, $0A ; end of 'BANK8'                                  ; Data continues at the start of bank 9

; ===========================================================================



; -------------------------------------------


; .segment BANK9
; * =  $A000
      .BYTE $F5, $12, $30, $0C, $33, $F0, $8B, $F1, $6C,	$F2, $74, $39, $1A, $43, $1A, $43 ; Data continues from LevelData_7_1_Area4
      .BYTE $00, $00, $F0, $8D, $F1, $4C, $F1, $CA,	$F5, $13, $00, $FF ; $10 ; in bank 8
LevelData_7_1_Area5:
      .BYTE $A1, $EA, $00, $01, $4C, $00, $21, $2D, $02, $21, $03, $21, $04, $21, $05, $21
      .BYTE $06, $26, $07, $51, $11, $38, $3A, $32,	$17, $0A, $F5, $12, $16,	$F0, $3C, $F1 ; $10
      .BYTE $EA, $FF ; $20
LevelData_7_2_Area0:
      .BYTE $80, $FF, $20, $00, $80, $E5, $0D, $E5, $2A, $E5, $36, $E5, $52,	$10, $1A, $10
      .BYTE $1C, $10, $63, $E6,	$B, $E6, $62, $10, $47,	$B5, $52, $65, $27, $E8, $F5, $13 ; $10
      .BYTE $10, $F4, $20, $C4,	$4F, $0F, $F2, $95, $0F, $E, $0F, $68, $19, $0E, $19, $3B ; $20
      .BYTE $1D, $0E, $1D, $27, $40, $28, $1C, $28, $0B, $FF ; $30
LevelData_7_2_Area1:
      .BYTE $A1, $EA, $65, $01, $87, $13, $F5, $13,	2, $22,	$3D, $F0, $50, $85, $84, $B
      .BYTE $84, $6F, $04, $10, $3E, $F0,	$34, $F0, $70, $F1, $14, $F1, $50, $F1,	$94, $F1 ; $10
      .BYTE $B0, $F1, $EF, $D1,	$4E, $42, $7D, $F0, $17, $F0, $50, $CD,	4, $10,	$4C, $0D ; $20
      .BYTE $82, $0E, $43, $20, $7C, $0E,	$75, $F1, $14, $F1, $50, $A2, $3D, $27,	$80, $17 ; $30
      .BYTE $A4, $F5, $13, $60,	$E, $4F, $14, $81, $27,	3, $90,	$35, $3E, $46, $24, $76 ; $40
      .BYTE $0C,	$78, $38, $A6, $F5, $13, $22, $86, $84,	7, $84,	8, $84,	$45, $80, $F1 ; $50
      .BYTE $2A, $FF ; $60
LevelData_7_2_Area2:
      .BYTE $A1, $EA, $95, $01, $88, $0A, $F5, $13, $93, $13, $2B, $05, $0F, $B, $0F, $13
      .BYTE $0F,	$D, $0F,	$24, $2A, $0C, $26, $F0,	$50, $F0, $EF, $F1, $50, $F1, $EA, $38 ; $10
      .BYTE $A9, $F5, $13, $86,	$3C, $81, $0D, $80, $3A,	$A3, $5C, $81, $1D, $80, $F0, $10 ; $20
      .BYTE $F0, $91, $F1, $90,	$62, $80, $03, $81, $35, $A3, $07, $A8, $F5, $13, $16, $47 ; $30
      .BYTE $03, $13, $81, $12, $80, $17,	3, $F0,	$91, $F1, $0A, $28, $A9,	$F5, $13, $73 ; $40
      .BYTE $3C, $81, $0D, $80, $3A, $A3, $5C, $81, $1D,	$80, $F1, $11, $F1, $90, $62, $80 ; $50
      .BYTE $03, $81, $35, $A3, $53, $81,	8, $0A, $F5, $13, $66, $12, $80,	$F0, $91, $F0 ; $60
      .BYTE $FB, $F1, $4A, $38,	$A7, $F5, $13, $41, $98, $4E, $F1, $11,	$F1, $CF, $97, $AB ; $70
      .BYTE $F5, $13, $70, $A7,	3, $F0,	$F0, $F1, $CA, $98, $0A,	$F5, $13, $43, $25, $3D ; $80
      .BYTE $F0, $AF, $62, $A7,	$F5, $13, $44, $86, $2D, $16, $0F, $19, $0F, $F, $0F, $1C ; $90
      .BYTE $0F,	$1B, $26, $0D, $2A, $F0,	$6A, $F0, $DC, $7C, $0A,	$F5, $13, $32, $52, $0F ; $A0
      .BYTE $F0, $6E, $F1, $CA,	$FF ; $B0
LevelData_7_2_Area3:
      .BYTE $A1, $EA, $34, $01, $5C, $40, $1C, $A4,	$25, $0A, $F5, $13, $63,	$24, $33, $F0
      .BYTE $50, $80, $4F, $10,	$A7, $05,	$A7, $0C, $A7, $80, $4F,	$60, $4F, $10, $4F, $10 ; $10
      .BYTE $A5, $35, $35, $13,	$A, $F5, $13, $29, $20,	$4F, $10, $4F, $90, $A3, $28, $0A ; $20
      .BYTE $F5, $13, $69, $F0,	$11, $F1, $4A, $FF ; $30
LevelData_7_2_Area4:
      .BYTE $A1, $EA, $95, $02, $3F, $A7, $36, $80,	$16, $A3, $43, $0A, $F5,	$13, $80, $19
      .BYTE $01, $F0, $50, $80, $87, $01, $87, $02, $3D, $47,	$80, $0B, $81, $0E, $81, $0F ; $10
      .BYTE $81, $17, $A4, $F5,	$13, $25, $37, $03, $70, $3F, $55, $0F, $B, $0F, $14, $0F ; $20
      .BYTE $08, $09, $F5, $13, $47, $0C, $F, $90, $3F, $52,	$80, $05,	$80, $17, $0A, $F5 ; $30
      .BYTE $13, $27, $7A, $A6,	$D, $AB, $20, $37, $08, $87, $09, $87, $8D,	3, $F5,	$13 ; $40
      .BYTE $28, $F1, $CA, $F3,	$F2, $B7, $0A, $F5, $13,	$42, $F0, $50, $E3, $00, $08, $00 ; $50
      .BYTE $13, $0F, $08,	$F, $F2, $A4, $0F, $12, $0F, $03, $0F, $05, $0F, $06, $0F,	$F1 ; $60
      .BYTE $4F, $F1, $8A, $F5,	$13, $50, $FF ; $70
LevelData_7_2_Area5:
      .BYTE $AA, $EA, $22, $0B, $3D, $2C, $62, $48, $F0, $4F, $F0,	$AC, $F1, $6E, $90, $2C
      .BYTE $03, $2C, $06, $2C, $1D, $2C, $4F, $32,	$29, $44, $F1, $3A, $F1, $DC, $90, $2C ; $10
      .BYTE $03, $2C, $06, $2C, $09, $2C, $34, $32, $22, $1A,	$10, $1A, $04, $1A, $08, $0F ; $20
      .BYTE $09, $44, $12, $41, $10, $45,	$F1, $7A, $F1, $D8, $FF ; $30
LevelData_7_2_Area6:
      .BYTE $21, $E0, $97, $01, $08, $A5, $F5, $13, $14, $92,	$4B, $42, $4B, $F0, $55, $F1
      .BYTE $DC, $33, $29, $22,	$4B, $42, $4B, $3C, $29, $22, $4B, $F0,	$75, $F1, $1C, $F1 ; $10
      .BYTE $95, $42, $4B, $3C,	$29, $22, $4B, $42, $4B, $33, $29, $F0,	$5C, $F0, $D5, $F1 ; $20
      .BYTE $7C, $22, $4B, $37,	$29, $12, $4B, $7A, $0A,	$F5, $13, $30, $F0, $15, $F1, $A0 ; $30
      .BYTE $F3, $F2, $48, $AA,	$27, $0A, $F5, $13, $24,	$28, $03,	$F0, $97, $F1, $00, $78 ; $40
      .BYTE $AE, $5A, $29, $15,	$29, $38, $03, $3A, $29, $16, $29, $F0, $76, $F1,	$20, $F1 ; $50
      .BYTE $56, $28, $A4, $18,	3, $3B,	$29, $14, $29, $18, $A5, $28, $03, $46, $29, $0A ; $60
      .BYTE $29, $18, $AB, $F0,	$20, $F0, $56, $F1, $00, $F1, $36, $28, $03, $B7, $0A, $F5 ; $70
      .BYTE $13, $33, $F0, $00, $F1, $17,	$F1, $A0, $FF ; $80
LevelData_7_2_Area7:
      .BYTE $21, $E0, $35, $01, $08, $A4, $F5, $13, $26, $76,	$33, $34, $37, $31, $33, $B
      .BYTE $43, $F0, $54, $35,	$36, $15, $46, $25, $46, $15, $36, $22,	$42, $33, $44, $38 ; $10
      .BYTE $33, $F0, $F5, $3B,	$42, $26, $73, $0C, $31,	$46, $35, $33, $39, $36, $33, $F0 ; $20
      .BYTE $9C, $F0, $B4, $33,	$49, $32, $49, $2C, $42, $24, $37, $17,	$80, $11, $32, $07 ; $30
      .BYTE $A4, $F5, $13, $23,	$37, $03,	$F1, $A0, $FF ; $40
LevelData_7_2_Area8:
      .BYTE $21, $E0, $64, $01, $28, $A8, $2C, $0A, $F5, $13, $40, $29, $45,	$F0, $54, $95
      .BYTE $35, $52, $32, $45,	$33, $48, $34, $34, $37, $32, $33, $2C,	$31, $46, $32, $38 ; $10
      .BYTE $33, $F0, $95, $35,	$35, $52, $33, $15, $AD, $07, $33, $12, $0A, $F5, $13, $90 ; $20
      .BYTE $22, $32, $05, $03, $0A,	$31, $1A, $A9, $2A, $03, $0B, $32,	$F1, $5C, $81, $86 ; $30
      .BYTE $14, $30, $06, $33, $0B, $30, $34, $36, $31, $AF, $04, $36, $F0,	$D4, $31, $03 ; $40
      .BYTE $74, $A6, $06, $A6, $07, $82, $08, $A6, $0A, $A6, $0D, $AE,	$F0, $20, $F1, $14 ; $50
      .BYTE $7D, $03, $4E, $A8, $37, $40,	$17, $A6, $F5, $13, $21, $57, $03, $F0, $00, $F0 ; $60
      .BYTE $94, $F1, $A0, $F4,	$D6, $0F, $09, $0F,	$53, $0F, $46, $0F, $3A, $0F, $B7,	$F ; $70
      .BYTE $2A, $0F, $B6, $0F, $FF ; $80
LevelData_7_2_Area9:
      .BYTE $01, $FE, $30, $00, $28, $10, $4D, $81, $2B, $AD,	$D, $0A,	$F5, $13, $83, $2B
      .BYTE $05, $0C, $41,	$22, $10, $46, $10, $4C, $AA, $2B, $80,	$C, $05, $11, $10, $28 ; $10
      .BYTE $11, $4B, $AA, $15,	$10, $1B, $05, $0C, $80, $7C, $AA,	$11, $10, $1B, $80, $0C ; $20
      .BYTE $05, $24, $35, $14, $35, $14,	$35, $14, $35, $14, $33, $08, $AB, $14, $33, $14 ; $30
      .BYTE $33, $18, $05, $77, $0A, $F5, $13, $20, $F0, $80, $F1,	$57, $F1, $A0, $FF ; $40
LevelData_7_3_Area0:
      .BYTE $FF
; [000000E0 BYTES: BEGIN OF AREA UNUSED-BANK9:A420. PRESS KEYPAD "-" TO COLLAPSE]
_empty_12420:
      .BYTE $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $40
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $50
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $70
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $80
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $90
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF ; $D0
; [000000E0 BYTES: END OF AREA UNUSED-BANK9:A420. PRESS KEYPAD "-" TO COLLAPSE]
EnemyPointersByLevel_HiHi:
      .BYTE	>EnemyPointers_Level_1_1_Hi

      .BYTE >EnemyPointers_Level_1_2_Hi
      .BYTE >EnemyPointers_Level_1_3_Hi
      .BYTE >EnemyPointers_Level_2_1_Hi
      .BYTE >EnemyPointers_Level_2_2_Hi
      .BYTE >EnemyPointers_Level_2_3_Hi
      .BYTE >EnemyPointers_Level_3_1_Hi
      .BYTE >EnemyPointers_Level_3_2_Hi
      .BYTE >EnemyPointers_Level_3_3_Hi
      .BYTE >EnemyPointers_Level_4_1_Hi
      .BYTE >EnemyPointers_Level_4_2_Hi
      .BYTE >EnemyPointers_Level_4_3_Hi
      .BYTE >EnemyPointers_Level_5_1_Hi
      .BYTE >EnemyPointers_Level_5_2_Hi
      .BYTE >EnemyPointers_Level_5_3_Hi
      .BYTE >EnemyPointers_Level_6_1_Hi
      .BYTE >EnemyPointers_Level_6_2_Hi
      .BYTE >EnemyPointers_Level_6_3_Hi
      .BYTE >EnemyPointers_Level_7_1_Hi
      .BYTE >EnemyPointers_Level_7_2_Hi
      .BYTE >EnemyPointers_Level_7_3_Hi
EnemyPointersByLevel_HiLo:
      .BYTE	<EnemyPointers_Level_1_1_Hi

      .BYTE <EnemyPointers_Level_1_2_Hi
      .BYTE <EnemyPointers_Level_1_3_Hi
      .BYTE <EnemyPointers_Level_2_1_Hi
      .BYTE <EnemyPointers_Level_2_2_Hi
      .BYTE <EnemyPointers_Level_2_3_Hi
      .BYTE <EnemyPointers_Level_3_1_Hi
      .BYTE <EnemyPointers_Level_3_2_Hi
      .BYTE <EnemyPointers_Level_3_3_Hi
      .BYTE <EnemyPointers_Level_4_1_Hi
      .BYTE <EnemyPointers_Level_4_2_Hi
      .BYTE <EnemyPointers_Level_4_3_Hi
      .BYTE <EnemyPointers_Level_5_1_Hi
      .BYTE <EnemyPointers_Level_5_2_Hi
      .BYTE <EnemyPointers_Level_5_3_Hi
      .BYTE <EnemyPointers_Level_6_1_Hi
      .BYTE <EnemyPointers_Level_6_2_Hi
      .BYTE <EnemyPointers_Level_6_3_Hi
      .BYTE <EnemyPointers_Level_7_1_Hi
      .BYTE <EnemyPointers_Level_7_2_Hi
      .BYTE <EnemyPointers_Level_7_3_Hi
EnemyPointersByLevel_LoHi:
      .BYTE	>EnemyPointers_Level_1_1_Lo

      .BYTE >EnemyPointers_Level_1_2_Lo
      .BYTE >EnemyPointers_Level_1_3_Lo
      .BYTE >EnemyPointers_Level_2_1_Lo
      .BYTE >EnemyPointers_Level_2_2_Lo
      .BYTE >EnemyPointers_Level_2_3_Lo
      .BYTE >EnemyPointers_Level_3_1_Lo
      .BYTE >EnemyPointers_Level_3_2_Lo
      .BYTE >EnemyPointers_Level_3_3_Lo
      .BYTE >EnemyPointers_Level_4_1_Lo
      .BYTE >EnemyPointers_Level_4_2_Lo
      .BYTE >EnemyPointers_Level_4_3_Lo
      .BYTE >EnemyPointers_Level_5_1_Lo
      .BYTE >EnemyPointers_Level_5_2_Lo
      .BYTE >EnemyPointers_Level_5_3_Lo
      .BYTE >EnemyPointers_Level_6_1_Lo
      .BYTE >EnemyPointers_Level_6_2_Lo
      .BYTE >EnemyPointers_Level_6_3_Lo
      .BYTE >EnemyPointers_Level_7_1_Lo
      .BYTE >EnemyPointers_Level_7_2_Lo
      .BYTE >EnemyPointers_Level_7_3_Lo
EnemyPointersByLevel_LoLo:
      .BYTE	<EnemyPointers_Level_1_1_Lo

      .BYTE <EnemyPointers_Level_1_2_Lo
      .BYTE <EnemyPointers_Level_1_3_Lo
      .BYTE <EnemyPointers_Level_2_1_Lo
      .BYTE <EnemyPointers_Level_2_2_Lo
      .BYTE <EnemyPointers_Level_2_3_Lo
      .BYTE <EnemyPointers_Level_3_1_Lo
      .BYTE <EnemyPointers_Level_3_2_Lo
      .BYTE <EnemyPointers_Level_3_3_Lo
      .BYTE <EnemyPointers_Level_4_1_Lo
      .BYTE <EnemyPointers_Level_4_2_Lo
      .BYTE <EnemyPointers_Level_4_3_Lo
      .BYTE <EnemyPointers_Level_5_1_Lo
      .BYTE <EnemyPointers_Level_5_2_Lo
      .BYTE <EnemyPointers_Level_5_3_Lo
      .BYTE <EnemyPointers_Level_6_1_Lo
      .BYTE <EnemyPointers_Level_6_2_Lo
      .BYTE <EnemyPointers_Level_6_3_Lo
      .BYTE <EnemyPointers_Level_7_1_Lo
      .BYTE <EnemyPointers_Level_7_2_Lo
      .BYTE <EnemyPointers_Level_7_3_Lo
EnemyPointers_Level_1_1_Hi:
      .BYTE >EnemyPointers_Level_1_1_Area0

      .BYTE >EnemyPointers_Level_1_1_Area1
      .BYTE >EnemyPointers_Level_1_1_Area2
      .BYTE >EnemyPointers_Level_1_1_Area3
      .BYTE >EnemyPointers_Level_1_1_Area4
      .BYTE >EnemyPointers_Level_1_1_Area5
      .BYTE >EnemyPointers_Level_1_1_Area5
      .BYTE >EnemyPointers_Level_1_1_Area5
      .BYTE >EnemyPointers_Level_1_1_Area5
      .BYTE >EnemyPointers_Level_1_1_Area5
EnemyPointers_Level_1_1_Lo:
      .BYTE <EnemyPointers_Level_1_1_Area0

      .BYTE <EnemyPointers_Level_1_1_Area1
      .BYTE <EnemyPointers_Level_1_1_Area2
      .BYTE <EnemyPointers_Level_1_1_Area3
      .BYTE <EnemyPointers_Level_1_1_Area4
      .BYTE <EnemyPointers_Level_1_1_Area5
      .BYTE <EnemyPointers_Level_1_1_Area5
      .BYTE <EnemyPointers_Level_1_1_Area5
      .BYTE <EnemyPointers_Level_1_1_Area5
      .BYTE <EnemyPointers_Level_1_1_Area5
EnemyPointers_Level_1_2_Hi:
      .BYTE >EnemyPointers_Level_1_2_Area0

      .BYTE >EnemyPointers_Level_1_2_Area1
      .BYTE >EnemyPointers_Level_1_2_Area2
off_BANK9_A56B:
      .BYTE >EnemyPointers_Level_1_2_Area3
      .BYTE >EnemyPointers_Level_1_2_Area4
      .BYTE >EnemyPointers_Level_1_2_Area5
      .BYTE >EnemyPointers_Level_1_2_Area5
      .BYTE >EnemyPointers_Level_1_2_Area5
      .BYTE >EnemyPointers_Level_1_2_Area5
      .BYTE >EnemyPointers_Level_1_2_Area5
EnemyPointers_Level_1_2_Lo:
      .BYTE <EnemyPointers_Level_1_2_Area0

      .BYTE <EnemyPointers_Level_1_2_Area1
      .BYTE <EnemyPointers_Level_1_2_Area2
      .BYTE <EnemyPointers_Level_1_2_Area3
      .BYTE <EnemyPointers_Level_1_2_Area4
      .BYTE <EnemyPointers_Level_1_2_Area5
      .BYTE <EnemyPointers_Level_1_2_Area5
      .BYTE <EnemyPointers_Level_1_2_Area5
      .BYTE <EnemyPointers_Level_1_2_Area5
      .BYTE <EnemyPointers_Level_1_2_Area5
EnemyPointers_Level_1_3_Hi:
      .BYTE >EnemyPointers_Level_1_3_Area0

      .BYTE >EnemyPointers_Level_1_3_Area1
      .BYTE >EnemyPointers_Level_1_3_Area2
      .BYTE >EnemyPointers_Level_1_3_Area3
      .BYTE >EnemyPointers_Level_1_3_Area4
      .BYTE >EnemyPointers_Level_1_3_Area4
      .BYTE >EnemyPointers_Level_1_3_Area4
      .BYTE >EnemyPointers_Level_1_3_Area4
      .BYTE >EnemyPointers_Level_1_3_Area4
      .BYTE >EnemyPointers_Level_1_3_Area4
EnemyPointers_Level_1_3_Lo:
      .BYTE <EnemyPointers_Level_1_3_Area0

      .BYTE <EnemyPointers_Level_1_3_Area1
      .BYTE <EnemyPointers_Level_1_3_Area2
      .BYTE <EnemyPointers_Level_1_3_Area3
      .BYTE <EnemyPointers_Level_1_3_Area4
      .BYTE <EnemyPointers_Level_1_3_Area4
      .BYTE <EnemyPointers_Level_1_3_Area4
      .BYTE <EnemyPointers_Level_1_3_Area4
      .BYTE <EnemyPointers_Level_1_3_Area4
      .BYTE <EnemyPointers_Level_1_3_Area4
EnemyPointers_Level_2_1_Hi:
      .BYTE >EnemyPointers_Level_2_1_Area0

      .BYTE >EnemyPointers_Level_2_1_Area1
      .BYTE >EnemyPointers_Level_2_1_Area2
      .BYTE >EnemyPointers_Level_2_1_Area2
      .BYTE >EnemyPointers_Level_2_1_Area4
      .BYTE >EnemyPointers_Level_2_1_Area2
      .BYTE >EnemyPointers_Level_2_1_Area2
      .BYTE >EnemyPointers_Level_2_1_Area2
      .BYTE >EnemyPointers_Level_2_1_Area2
      .BYTE >EnemyPointers_Level_2_1_Area2
EnemyPointers_Level_2_1_Lo:
      .BYTE <EnemyPointers_Level_2_1_Area0

      .BYTE <EnemyPointers_Level_2_1_Area1
      .BYTE <EnemyPointers_Level_2_1_Area2
      .BYTE <EnemyPointers_Level_2_1_Area2
      .BYTE <EnemyPointers_Level_2_1_Area4
      .BYTE <EnemyPointers_Level_2_1_Area2
      .BYTE <EnemyPointers_Level_2_1_Area2
      .BYTE <EnemyPointers_Level_2_1_Area2
      .BYTE <EnemyPointers_Level_2_1_Area2
      .BYTE <EnemyPointers_Level_2_1_Area2
EnemyPointers_Level_2_2_Hi:
      .BYTE >EnemyPointers_Level_2_2_Area0

      .BYTE >EnemyPointers_Level_2_2_Area1
      .BYTE >EnemyPointers_Level_2_2_Area2
      .BYTE >EnemyPointers_Level_2_2_Area3
      .BYTE >EnemyPointers_Level_2_2_Area4
      .BYTE >EnemyPointers_Level_2_2_Area5
      .BYTE >EnemyPointers_Level_2_2_Area5
      .BYTE >EnemyPointers_Level_2_2_Area5
      .BYTE >EnemyPointers_Level_2_2_Area5
      .BYTE >EnemyPointers_Level_2_2_Area5
EnemyPointers_Level_2_2_Lo:
      .BYTE <EnemyPointers_Level_2_2_Area0

      .BYTE <EnemyPointers_Level_2_2_Area1
      .BYTE <EnemyPointers_Level_2_2_Area2
      .BYTE <EnemyPointers_Level_2_2_Area3
      .BYTE <EnemyPointers_Level_2_2_Area4
      .BYTE <EnemyPointers_Level_2_2_Area5
      .BYTE <EnemyPointers_Level_2_2_Area5
      .BYTE <EnemyPointers_Level_2_2_Area5
      .BYTE <EnemyPointers_Level_2_2_Area5
      .BYTE <EnemyPointers_Level_2_2_Area5
EnemyPointers_Level_2_3_Hi:
      .BYTE >EnemyPointers_Level_2_3_Area0

      .BYTE >EnemyPointers_Level_2_3_Area1
      .BYTE >EnemyPointers_Level_2_3_Area2
      .BYTE >EnemyPointers_Level_2_3_Area3
      .BYTE >EnemyPointers_Level_2_3_Area4
      .BYTE >EnemyPointers_Level_2_3_Area5
      .BYTE >EnemyPointers_Level_2_3_Area6
      .BYTE >EnemyPointers_Level_2_3_Area7
      .BYTE >EnemyPointers_Level_2_3_Area7
      .BYTE >EnemyPointers_Level_2_3_Area7
EnemyPointers_Level_2_3_Lo:
      .BYTE <EnemyPointers_Level_2_3_Area0

      .BYTE <EnemyPointers_Level_2_3_Area1
      .BYTE <EnemyPointers_Level_2_3_Area2
      .BYTE <EnemyPointers_Level_2_3_Area3
      .BYTE <EnemyPointers_Level_2_3_Area4
      .BYTE <EnemyPointers_Level_2_3_Area5
      .BYTE <EnemyPointers_Level_2_3_Area6
      .BYTE <EnemyPointers_Level_2_3_Area7
      .BYTE <EnemyPointers_Level_2_3_Area7
      .BYTE <EnemyPointers_Level_2_3_Area7
EnemyPointers_Level_3_1_Hi:
      .BYTE >EnemyPointers_Level_3_1_Area0

      .BYTE >EnemyPointers_Level_3_1_Area1
      .BYTE >EnemyPointers_Level_3_1_Area2
      .BYTE >EnemyPointers_Level_3_1_Area3
      .BYTE >EnemyPointers_Level_3_1_Area4
      .BYTE >EnemyPointers_Level_3_2_Area0
      .BYTE >EnemyPointers_Level_3_2_Area0
      .BYTE >EnemyPointers_Level_3_2_Area0
      .BYTE >EnemyPointers_Level_3_2_Area0
      .BYTE >EnemyPointers_Level_3_2_Area0
EnemyPointers_Level_3_1_Lo:
      .BYTE <EnemyPointers_Level_3_1_Area0

      .BYTE <EnemyPointers_Level_3_1_Area1
      .BYTE <EnemyPointers_Level_3_1_Area2
      .BYTE <EnemyPointers_Level_3_1_Area3
      .BYTE <EnemyPointers_Level_3_1_Area4
      .BYTE <EnemyPointers_Level_3_2_Area0
      .BYTE <EnemyPointers_Level_3_2_Area0
      .BYTE <EnemyPointers_Level_3_2_Area0
      .BYTE <EnemyPointers_Level_3_2_Area0
      .BYTE <EnemyPointers_Level_3_2_Area0
EnemyPointers_Level_3_2_Hi:
      .BYTE >EnemyPointers_Level_3_2_Area0
      .BYTE >EnemyPointers_Level_3_2_Area1
      .BYTE >EnemyPointers_Level_3_2_Area2
      .BYTE >EnemyPointers_Level_3_2_Area3 ; Unused? Boss-flag Birdo
      .BYTE >EnemyPointers_Level_3_3_Area0
      .BYTE >EnemyPointers_Level_3_3_Area0
      .BYTE >EnemyPointers_Level_3_3_Area0
      .BYTE >EnemyPointers_Level_3_3_Area0
      .BYTE >EnemyPointers_Level_3_3_Area0
      .BYTE >EnemyPointers_Level_3_3_Area0
EnemyPointers_Level_3_2_Lo:
      .BYTE <EnemyPointers_Level_3_2_Area0
      .BYTE <EnemyPointers_Level_3_2_Area1
      .BYTE <EnemyPointers_Level_3_2_Area2
      .BYTE <EnemyPointers_Level_3_2_Area3 ; Unused? Boss-flag Birdo
      .BYTE <EnemyPointers_Level_3_3_Area0
      .BYTE <EnemyPointers_Level_3_3_Area0
      .BYTE <EnemyPointers_Level_3_3_Area0
      .BYTE <EnemyPointers_Level_3_3_Area0
      .BYTE <EnemyPointers_Level_3_3_Area0
      .BYTE <EnemyPointers_Level_3_3_Area0
EnemyPointers_Level_3_3_Hi:
      .BYTE >EnemyPointers_Level_3_3_Area0

      .BYTE >EnemyPointers_Level_3_3_Area1
      .BYTE >EnemyPointers_Level_3_3_Area2
      .BYTE >EnemyPointers_Level_3_3_Area3
      .BYTE >EnemyPointers_Level_3_3_Area4
      .BYTE >EnemyPointers_Level_3_3_Area5
      .BYTE >EnemyPointers_Level_3_3_Area6
      .BYTE >EnemyPointers_Level_3_3_Area7
      .BYTE >EnemyPointers_Level_3_3_Area8
      .BYTE >EnemyPointers_Level_3_3_Area8
EnemyPointers_Level_3_3_Lo:
      .BYTE <EnemyPointers_Level_3_3_Area0

      .BYTE <EnemyPointers_Level_3_3_Area1
      .BYTE <EnemyPointers_Level_3_3_Area2
      .BYTE <EnemyPointers_Level_3_3_Area3
      .BYTE <EnemyPointers_Level_3_3_Area4
      .BYTE <EnemyPointers_Level_3_3_Area5
      .BYTE <EnemyPointers_Level_3_3_Area6
      .BYTE <EnemyPointers_Level_3_3_Area7
      .BYTE <EnemyPointers_Level_3_3_Area8
      .BYTE <EnemyPointers_Level_3_3_Area8
EnemyPointers_Level_4_1_Hi:
      .BYTE >EnemyPointers_Level_4_1_Area0

      .BYTE >EnemyPointers_Level_4_1_Area1
      .BYTE >EnemyPointers_Level_4_1_Area2 ; ??? Unused area with another Boss Birdo.
      .BYTE >EnemyPointers_Level_4_1_Area2
      .BYTE >EnemyPointers_Level_4_1_Area2
      .BYTE >EnemyPointers_Level_4_1_Area2
      .BYTE >EnemyPointers_Level_4_1_Area2
      .BYTE >EnemyPointers_Level_4_1_Area2
      .BYTE >EnemyPointers_Level_4_1_Area2
      .BYTE >EnemyPointers_Level_4_1_Area2
EnemyPointers_Level_4_1_Lo:
      .BYTE <EnemyPointers_Level_4_1_Area0

      .BYTE <EnemyPointers_Level_4_1_Area1
      .BYTE <EnemyPointers_Level_4_1_Area2
      .BYTE <EnemyPointers_Level_4_1_Area2
      .BYTE <EnemyPointers_Level_4_1_Area2
      .BYTE <EnemyPointers_Level_4_1_Area2
      .BYTE <EnemyPointers_Level_4_1_Area2
      .BYTE <EnemyPointers_Level_4_1_Area2
      .BYTE <EnemyPointers_Level_4_1_Area2
      .BYTE <EnemyPointers_Level_4_1_Area2
EnemyPointers_Level_4_2_Hi:
      .BYTE >EnemyPointers_Level_4_2_Area0

      .BYTE >EnemyPointers_Level_4_2_Area1
      .BYTE >EnemyPointers_Level_4_2_Area2
      .BYTE >EnemyPointers_Level_4_2_Area3
      .BYTE >EnemyPointers_Level_4_2_Area4
      .BYTE >EnemyPointers_Level_4_2_Area4
      .BYTE >EnemyPointers_Level_4_2_Area4
      .BYTE >EnemyPointers_Level_4_2_Area4
      .BYTE >EnemyPointers_Level_4_2_Area4
      .BYTE >EnemyPointers_Level_4_2_Area4
EnemyPointers_Level_4_2_Lo:
      .BYTE <EnemyPointers_Level_4_2_Area0

      .BYTE <EnemyPointers_Level_4_2_Area1
      .BYTE <EnemyPointers_Level_4_2_Area2
      .BYTE <EnemyPointers_Level_4_2_Area3
      .BYTE <EnemyPointers_Level_4_2_Area4
      .BYTE <EnemyPointers_Level_4_2_Area4
      .BYTE <EnemyPointers_Level_4_2_Area4
      .BYTE <EnemyPointers_Level_4_2_Area4
      .BYTE <EnemyPointers_Level_4_2_Area4
      .BYTE <EnemyPointers_Level_4_2_Area4
EnemyPointers_Level_4_3_Hi:
      .BYTE >EnemyPointers_Level_4_3_Area0

      .BYTE >EnemyPointers_Level_4_3_Area1
      .BYTE >EnemyPointers_Level_4_3_Area2
      .BYTE >EnemyPointers_Level_4_3_Area3
      .BYTE >EnemyPointers_Level_4_3_Area4
      .BYTE >EnemyPointers_Level_4_3_Area5
      .BYTE >EnemyPointers_Level_4_3_Area6
      .BYTE >EnemyPointers_Level_4_3_Area7
      .BYTE >EnemyPointers_Level_4_3_Area8
      .BYTE >EnemyPointers_Level_4_3_Area9
EnemyPointers_Level_4_3_Lo:
      .BYTE <EnemyPointers_Level_4_3_Area0

      .BYTE <EnemyPointers_Level_4_3_Area1
      .BYTE <EnemyPointers_Level_4_3_Area2
      .BYTE <EnemyPointers_Level_4_3_Area3
      .BYTE <EnemyPointers_Level_4_3_Area4
      .BYTE <EnemyPointers_Level_4_3_Area5
      .BYTE <EnemyPointers_Level_4_3_Area6
      .BYTE <EnemyPointers_Level_4_3_Area7
      .BYTE <EnemyPointers_Level_4_3_Area8
      .BYTE <EnemyPointers_Level_4_3_Area9
EnemyPointers_Level_5_1_Hi:
      .BYTE >EnemyPointers_Level_5_1_Area0

      .BYTE >EnemyPointers_Level_5_1_Area1
      .BYTE >EnemyPointers_Level_5_1_Area2
      .BYTE >EnemyPointers_Level_5_2_Area0
      .BYTE >EnemyPointers_Level_5_2_Area0
      .BYTE >EnemyPointers_Level_5_2_Area0
      .BYTE >EnemyPointers_Level_5_2_Area0
      .BYTE >EnemyPointers_Level_5_2_Area0
      .BYTE >EnemyPointers_Level_5_2_Area0
      .BYTE >EnemyPointers_Level_5_2_Area0
EnemyPointers_Level_5_1_Lo:
      .BYTE <EnemyPointers_Level_5_1_Area0

      .BYTE <EnemyPointers_Level_5_1_Area1
      .BYTE <EnemyPointers_Level_5_1_Area2
      .BYTE <EnemyPointers_Level_5_2_Area0
      .BYTE <EnemyPointers_Level_5_2_Area0
      .BYTE <EnemyPointers_Level_5_2_Area0
      .BYTE <EnemyPointers_Level_5_2_Area0
      .BYTE <EnemyPointers_Level_5_2_Area0
      .BYTE <EnemyPointers_Level_5_2_Area0
      .BYTE <EnemyPointers_Level_5_2_Area0
EnemyPointers_Level_5_2_Hi:
      .BYTE >EnemyPointers_Level_5_2_Area0

      .BYTE >EnemyPointers_Level_5_2_Area1
      .BYTE >EnemyPointers_Level_5_2_Area2
      .BYTE >EnemyPointers_Level_5_2_Area3
      .BYTE >EnemyPointers_Level_5_2_Area4
      .BYTE >EnemyPointers_Level_5_2_Area5
      .BYTE >EnemyPointers_Level_5_3_Area0
      .BYTE >EnemyPointers_Level_5_3_Area0
      .BYTE >EnemyPointers_Level_5_3_Area0
      .BYTE >EnemyPointers_Level_5_3_Area0
EnemyPointers_Level_5_2_Lo:
      .BYTE <EnemyPointers_Level_5_2_Area0

      .BYTE <EnemyPointers_Level_5_2_Area1
      .BYTE <EnemyPointers_Level_5_2_Area2
      .BYTE <EnemyPointers_Level_5_2_Area3
      .BYTE <EnemyPointers_Level_5_2_Area4
      .BYTE <EnemyPointers_Level_5_2_Area5
      .BYTE <EnemyPointers_Level_5_3_Area0
      .BYTE <EnemyPointers_Level_5_3_Area0
      .BYTE <EnemyPointers_Level_5_3_Area0
      .BYTE <EnemyPointers_Level_5_3_Area0
EnemyPointers_Level_5_3_Hi:
      .BYTE >EnemyPointers_Level_5_3_Area0

      .BYTE >EnemyPointers_Level_5_3_Area1
      .BYTE >EnemyPointers_Level_5_3_Area2
      .BYTE >EnemyPointers_Level_5_3_Area3
      .BYTE >EnemyPointers_Level_5_3_Area4
      .BYTE >EnemyPointers_Level_5_3_Area5
      .BYTE >EnemyPointers_Level_5_3_Area5
      .BYTE >EnemyPointers_Level_5_3_Area5
      .BYTE >EnemyPointers_Level_5_3_Area5
      .BYTE >EnemyPointers_Level_5_3_Area5
EnemyPointers_Level_5_3_Lo:
      .BYTE <EnemyPointers_Level_5_3_Area0

      .BYTE <EnemyPointers_Level_5_3_Area1
      .BYTE <EnemyPointers_Level_5_3_Area2
      .BYTE <EnemyPointers_Level_5_3_Area3
      .BYTE <EnemyPointers_Level_5_3_Area4
      .BYTE <EnemyPointers_Level_5_3_Area5
      .BYTE <EnemyPointers_Level_5_3_Area5
      .BYTE <EnemyPointers_Level_5_3_Area5
      .BYTE <EnemyPointers_Level_5_3_Area5
      .BYTE <EnemyPointers_Level_5_3_Area5
EnemyPointers_Level_6_1_Hi:
      .BYTE >EnemyPointers_Level_6_1_Area0

      .BYTE >EnemyPointers_Level_6_1_Area1
      .BYTE >EnemyPointers_Level_6_1_Area2
      .BYTE >EnemyPointers_Level_6_1_Area3
      .BYTE >EnemyPointers_Level_6_1_Area4
      .BYTE >EnemyPointers_Level_6_1_Area5
      .BYTE >EnemyPointers_Level_6_1_Area6
      .BYTE >EnemyPointers_Level_6_1_Area6
      .BYTE >EnemyPointers_Level_6_1_Area6
      .BYTE >EnemyPointers_Level_6_1_Area6
EnemyPointers_Level_6_1_Lo:
      .BYTE <EnemyPointers_Level_6_1_Area0

      .BYTE <EnemyPointers_Level_6_1_Area1
      .BYTE <EnemyPointers_Level_6_1_Area2
      .BYTE <EnemyPointers_Level_6_1_Area3
      .BYTE <EnemyPointers_Level_6_1_Area4
      .BYTE <EnemyPointers_Level_6_1_Area5
      .BYTE <EnemyPointers_Level_6_1_Area6
      .BYTE <EnemyPointers_Level_6_1_Area6
      .BYTE <EnemyPointers_Level_6_1_Area6
      .BYTE <EnemyPointers_Level_6_1_Area6
EnemyPointers_Level_6_2_Hi:
      .BYTE >EnemyPointers_Level_6_2_Area0

      .BYTE >EnemyPointers_Level_6_2_Area1
      .BYTE >EnemyPointers_Level_6_2_Area2
      .BYTE >EnemyPointers_Level_6_2_Area2
      .BYTE >EnemyPointers_Level_6_2_Area2
      .BYTE >EnemyPointers_Level_6_2_Area2
      .BYTE >EnemyPointers_Level_6_2_Area2
      .BYTE >EnemyPointers_Level_6_2_Area2
      .BYTE >EnemyPointers_Level_6_2_Area2
      .BYTE >EnemyPointers_Level_6_2_Area2
EnemyPointers_Level_6_2_Lo:
      .BYTE <EnemyPointers_Level_6_2_Area0

      .BYTE <EnemyPointers_Level_6_2_Area1
      .BYTE <EnemyPointers_Level_6_2_Area2
      .BYTE <EnemyPointers_Level_6_2_Area2
      .BYTE <EnemyPointers_Level_6_2_Area2
      .BYTE <EnemyPointers_Level_6_2_Area2
      .BYTE <EnemyPointers_Level_6_2_Area2
      .BYTE <EnemyPointers_Level_6_2_Area2
      .BYTE <EnemyPointers_Level_6_2_Area2
      .BYTE <EnemyPointers_Level_6_2_Area2
EnemyPointers_Level_6_3_Hi:
      .BYTE >EnemyPointers_Level_6_3_Area0

      .BYTE >EnemyPointers_Level_6_3_Area1
      .BYTE >EnemyPointers_Level_6_3_Area2
      .BYTE >EnemyPointers_Level_6_3_Area3
      .BYTE >EnemyPointers_Level_6_3_Area4
      .BYTE >EnemyPointers_Level_6_3_Area5
      .BYTE >EnemyPointers_Level_6_3_Area6
      .BYTE >EnemyPointers_Level_6_3_Area6
      .BYTE >EnemyPointers_Level_6_3_Area6
      .BYTE >EnemyPointers_Level_6_3_Area6
EnemyPointers_Level_6_3_Lo:
      .BYTE <EnemyPointers_Level_6_3_Area0

      .BYTE <EnemyPointers_Level_6_3_Area1
      .BYTE <EnemyPointers_Level_6_3_Area2
      .BYTE <EnemyPointers_Level_6_3_Area3
      .BYTE <EnemyPointers_Level_6_3_Area4
      .BYTE <EnemyPointers_Level_6_3_Area5
      .BYTE <EnemyPointers_Level_6_3_Area6
      .BYTE <EnemyPointers_Level_6_3_Area6
      .BYTE <EnemyPointers_Level_6_3_Area6
      .BYTE <EnemyPointers_Level_6_3_Area6
EnemyPointers_Level_7_1_Hi:
      .BYTE >EnemyPointers_Level_7_1_Area0

      .BYTE >EnemyPointers_Level_7_1_Area1
      .BYTE >EnemyPointers_Level_7_1_Area2
      .BYTE >EnemyPointers_Level_7_1_Area3
      .BYTE >EnemyPointers_Level_7_1_Area4
      .BYTE >EnemyPointers_Level_7_1_Area5
      .BYTE >EnemyPointers_Level_7_1_Area5
      .BYTE >EnemyPointers_Level_7_1_Area5
      .BYTE >EnemyPointers_Level_7_1_Area5
      .BYTE >EnemyPointers_Level_7_1_Area5
EnemyPointers_Level_7_1_Lo:
      .BYTE <EnemyPointers_Level_7_1_Area0

      .BYTE <EnemyPointers_Level_7_1_Area1
      .BYTE <EnemyPointers_Level_7_1_Area2
      .BYTE <EnemyPointers_Level_7_1_Area3
      .BYTE <EnemyPointers_Level_7_1_Area4
      .BYTE <EnemyPointers_Level_7_1_Area5
      .BYTE <EnemyPointers_Level_7_1_Area5
      .BYTE <EnemyPointers_Level_7_1_Area5
      .BYTE <EnemyPointers_Level_7_1_Area5
      .BYTE <EnemyPointers_Level_7_1_Area5
EnemyPointers_Level_7_2_Hi:
      .BYTE >EnemyPointers_Level_7_2_Area0

      .BYTE >EnemyPointers_Level_7_2_Area1
      .BYTE >EnemyPointers_Level_7_2_Area2
      .BYTE >EnemyPointers_Level_7_2_Area3
      .BYTE >EnemyPointers_Level_7_2_Area4
      .BYTE >EnemyPointers_Level_7_2_Area5
      .BYTE >EnemyPointers_Level_7_2_Area6
      .BYTE >EnemyPointers_Level_7_2_Area7
      .BYTE >EnemyPointers_Level_7_2_Area8
      .BYTE >EnemyPointers_Level_7_2_Area9
EnemyPointers_Level_7_2_Lo:
      .BYTE <EnemyPointers_Level_7_2_Area0

      .BYTE <EnemyPointers_Level_7_2_Area1
      .BYTE <EnemyPointers_Level_7_2_Area2
      .BYTE <EnemyPointers_Level_7_2_Area3
      .BYTE <EnemyPointers_Level_7_2_Area4
      .BYTE <EnemyPointers_Level_7_2_Area5
      .BYTE <EnemyPointers_Level_7_2_Area6
      .BYTE <EnemyPointers_Level_7_2_Area7
      .BYTE <EnemyPointers_Level_7_2_Area8
      .BYTE <EnemyPointers_Level_7_2_Area9
EnemyPointers_Level_7_3_Hi:
      .BYTE >EnemyPointers_Level_7_3_Area0
; Normally totally unused (game ends at 7-2)
      .BYTE >EnemyPointers_Level_7_3_Area1 ; Interestingly, the first 4 areas are unique
      .BYTE >EnemyPointers_Level_7_3_Area2 ; though completely empty
      .BYTE >EnemyPointers_Level_7_3_Area3 ; Wonder if they intended on having a full 7-3
      .BYTE >EnemyPointers_Level_7_3_Area4 ; at some point...
      .BYTE >EnemyPointers_Level_7_3_Area4
      .BYTE >EnemyPointers_Level_7_3_Area4
      .BYTE >EnemyPointers_Level_7_3_Area4
      .BYTE >EnemyPointers_Level_7_3_Area4
      .BYTE >EnemyPointers_Level_7_3_Area4
EnemyPointers_Level_7_3_Lo:
      .BYTE <EnemyPointers_Level_7_3_Area0
      .BYTE <EnemyPointers_Level_7_3_Area1
      .BYTE <EnemyPointers_Level_7_3_Area2
      .BYTE <EnemyPointers_Level_7_3_Area3
      .BYTE <EnemyPointers_Level_7_3_Area4
      .BYTE <EnemyPointers_Level_7_3_Area4
      .BYTE <EnemyPointers_Level_7_3_Area4
      .BYTE <EnemyPointers_Level_7_3_Area4
      .BYTE <EnemyPointers_Level_7_3_Area4
      .BYTE <EnemyPointers_Level_7_3_Area4

;
; Enemy Data
; ==========
;
; This data is broken down by page (ie. screen), where the first byte indicates
; the number of bytes for this page. Each enemy is two bytes, where the first
; byte is the enemy, and the second byte is YX position.
;
; Examples:
;   $01 - an empty page
;   $03,$01,$47 - a page with a single pink shyguy ($01) at Y=4, X=7
;
EnemyPointers_Level_1_1_Area0:
      .BYTE $01
      .BYTE $01
      .BYTE $05,$03,$76,$03,$6C
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_1_1_Area1:
      .BYTE $05,$14,$56,$14,$AD
      .BYTE $03,$03,$9D
      .BYTE $07,$0E,$83,$0E,$79,$03,$BC
      .BYTE $05,$0E,$90,$0E,$75
      .BYTE $01
EnemyPointers_Level_1_1_Area2:
      .BYTE $03,$01,$EC
      .BYTE $07,$01,$1C,$02,$5C,$03,$E5
      .BYTE $07,$01,$6C,$02,$8C,$01,$CC
      .BYTE $05,$03,$79,$01,$D4
      .BYTE $09,$01,$04,$02,$34,$3B,$87,$3B,$C7
      .BYTE $07,$03,$A9,$03,$BC,$03,$C6
      .BYTE $05,$01,$9C,$03,$E5
      .BYTE $05,$01,$2C,$02,$4C
      .BYTE $07,$01,$1C,$03,$45,$02,$4C
      .BYTE $05,$01,$95,$14,$D1
      .BYTE $01
EnemyPointers_Level_1_1_Area3:
      .BYTE $03,$03,$85
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_1_1_Area4:
      .BYTE $03,$0E,$BC
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_1_1_Area5:
      .BYTE $01

      .BYTE $01
      .BYTE $07,$1C,$A7,$44,$A8,$43,$E7
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_1_2_Area0:
      .BYTE $03,$42,$6A
      .BYTE $03,$12,$22
      .BYTE $09,$0F,$00,$0F,$40,$0F,$90,$0F,$E0
      .BYTE $01
      .BYTE $05,$0E,$3C,$0E,$6C
      .BYTE $05,$06,$53,$0D,$83
      .BYTE $05,$01,$B6,$01,$F6
      .BYTE $01
EnemyPointers_Level_1_2_Area1:
      .BYTE $03,$01,$DC
      .BYTE $03,$07,$3C
      .BYTE $03,$06,$2C
      .BYTE $05,$0D,$79,$0D,$89
      .BYTE $01
EnemyPointers_Level_1_2_Area2:
      .BYTE $01

      .BYTE $05,$1C,$A7,$44,$A8
      .BYTE $03,$43,$38
      .BYTE $01
EnemyPointers_Level_1_2_Area3:
      .BYTE $05,$3D,$79,$17,$77
      .BYTE $01
EnemyPointers_Level_1_2_Area4:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $03,$02,$28
EnemyPointers_Level_1_2_Area5:
      .BYTE $01

      .BYTE $01
      .BYTE $01
EnemyPointers_Level_1_3_Area0:
      .BYTE $03,$42,$38
      .BYTE $05,$07,$94,$07,$B4
      .BYTE $03,$01,$74
      .BYTE $05,$13,$34,$13,$A4
      .BYTE $07,$13,$02,$13,$62,$3B,$E6
      .BYTE $05,$3B,$26,$3B,$66
      .BYTE $09,$13,$4A,$3B,$5C,$13,$8A,$3B,$9C
      .BYTE $05,$03,$2A,$03,$7A
      .BYTE $09,$0D,$29,$0D,$49,$02,$7A,$02,$9A
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_1_3_Area1:
      .BYTE $07,$17,$83,$3D,$88,$2E,$8A
      .BYTE $01
EnemyPointers_Level_1_3_Area2:
      .BYTE $07,$2E,$4B,$30,$7C,$30,$C9
      .BYTE $01
      .BYTE $07,$30,$61,$31,$5A,$03,$BA
      .BYTE $03,$01,$DB
      .BYTE $03,$06,$4A
      .BYTE $03,$03,$35
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_1_3_Area3:
      .BYTE $03,$31,$C9
      .BYTE $03,$2F,$C6
      .BYTE $09,$02,$56,$07,$D4,$07,$D7,$07,$DA
      .BYTE $05,$30,$A7,$30,$F7
      .BYTE $05,$2E,$3A,$2E,$6A
      .BYTE $09,$0D,$09,$0D,$29,$44,$A8,$43,$D7
      .BYTE $01
EnemyPointers_Level_1_3_Area4:
      .BYTE $03,$30,$F6
      .BYTE $03,$5D,$D7
      .BYTE $01
EnemyPointers_Level_2_1_Area0:
      .BYTE $01

      .BYTE $03,$19,$FA
      .BYTE $03,$18,$A7
      .BYTE $05,$01,$69,$03,$99
      .BYTE $03,$18,$47
      .BYTE $03,$03,$F8
      .BYTE $01
      .BYTE $07,$23,$24,$01,$27,$01,$49
      .BYTE $03,$19,$4A
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_2_1_Area1:
      .BYTE $05,$01,$49,$01,$6D
      .BYTE $03,$01,$D3
      .BYTE $07,$01,$40,$06,$16,$01,$C8
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_2_1_Area2:
      .BYTE $01

      .BYTE $05,$1C,$A8,$44,$A9
      .BYTE $03,$43,$D3
      .BYTE $01
EnemyPointers_Level_2_1_Area4:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $03,$06,$6C
EnemyPointers_Level_2_2_Area0:
      .BYTE $03,$42,$5A
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_2_2_Area1:
      .BYTE $01

      .BYTE $03,$19,$8D
      .BYTE $05,$0F,$50,$18,$FA
      .BYTE $03,$01,$99
      .BYTE $05,$18,$0A,$18,$37
      .BYTE $07,$0F,$10,$18,$15,$3B,$97
      .BYTE $07,$18,$58,$18,$A8,$18,$E7
      .BYTE $09,$18,$28,$18,$57,$1A,$86,$18,$97
      .BYTE $03,$23,$B5
      .BYTE $03,$23,5
      .BYTE $01
EnemyPointers_Level_2_2_Area2:
      .BYTE $07,$03,$B8,$03,$F8,$03,$FB
      .BYTE $01
      .BYTE $01
      .BYTE $01					  ; ??? This area only has 3 pages, so this should stop here
      .BYTE $01					  ; But for some reason it continues for several more pages
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_2_2_Area3:
      .BYTE $03,$01,$8A
      .BYTE $05,$01,$C2,$01,$67
      .BYTE $07,$0E,$A0,$01,$78,$01,$BD
      .BYTE $03,$06,$E2
      .BYTE $01
EnemyPointers_Level_2_2_Area4:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $03,$01,$B9
EnemyPointers_Level_2_2_Area5:
      .BYTE $01

      .BYTE $05,$1C,$B4,$44,$B4
byte_BANK9_A8F0:
      .BYTE $03,$43,$B3
      .BYTE $01
EnemyPointers_Level_2_3_Area0:
      .BYTE $03,$42,$17
      .BYTE $01
EnemyPointers_Level_2_3_Area1:
      .BYTE $03,$03,$C7
      .BYTE $03,$49,$20
      .BYTE $05,$0F,$20,$48,$A0
      .BYTE $01
      .BYTE $01
      .BYTE $03,$48,$80
      .BYTE $01
      .BYTE $03,$49,0
      .BYTE $05,$19,$7A,$1A,$D6
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_2_3_Area2:
      .BYTE $01

      .BYTE $01
      .BYTE $01
EnemyPointers_Level_2_3_Area3:
      .BYTE $03,$03,$4B
      .BYTE $05,$01,$D5,$01,$AA
      .BYTE $05,$03,$D2,$01,$D5
      .BYTE $03,$02,$88
      .BYTE $07,$01,$83,$01,$A9,$01,$1D
      .BYTE $07,$01,$B1,$01,$89,$01,$3D
      .BYTE $03,$01,$E3
      .BYTE $01
EnemyPointers_Level_2_3_Area4:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $03,$01,$B9
EnemyPointers_Level_2_3_Area5:
      .BYTE $01

      .BYTE $09,$01,$15,$01,$08,$01,$F8,$01,$CB
      .BYTE $01
      .BYTE $07,$23,$14,$03,$39,$03,$7B
      .BYTE $03,$18,$67
      .BYTE $07,$18,$0A,$44,$3B,$18,$6A
      .BYTE $03,$43,$97
      .BYTE $01
EnemyPointers_Level_2_3_Area6:
      .BYTE $01

      .BYTE $05,$5F,$C5,$02,$D0
      .BYTE $01
EnemyPointers_Level_2_3_Area7:
      .BYTE $07,$17,$83,$3D,$87,$2F,$A9
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_1_Area0:
      .BYTE $01

      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_1_Area1:
      .BYTE $03,$49,8
      .BYTE $03,$48,$E
      .BYTE $03,$48,2
      .BYTE $05,$12,$92,$49,9
      .BYTE $03,$03,$E5
      .BYTE $05,$03,$21,$03,$87
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_1_Area2:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_1_Area3:
      .BYTE $01

      .BYTE $03,$03,$2B
      .BYTE $03,$25,$12
      .BYTE $03,$23,$95
      .BYTE $03,$03,$65
      .BYTE $03,$24,5
      .BYTE $01
EnemyPointers_Level_3_1_Area4:
      .BYTE $01

      .BYTE $07,$43,$93,$1C,$B9,$44,$BA
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_2_Area0:
      .BYTE $05,$42,$42,$49,$40
      .BYTE $05,$08,$25,$48,$C0
      .BYTE $01
      .BYTE $03,$48,0
      .BYTE $05,$25,$E6,$49,$80
      .BYTE $01
      .BYTE $05,$08,$35,$08,$55
      .BYTE $05,$06,$A4,$06,$CB
      .BYTE $01
      .BYTE $03,$06,$96
      .BYTE $01
EnemyPointers_Level_3_2_Area1:
      .BYTE $07,$04,$3C,$04,$6C,$04,$EC
      .BYTE $03,$04,$1C
      .BYTE $01
      .BYTE $01
      .BYTE $03,$03,$29
      .BYTE $07,$02,$29,$02,$49,$02,$6C
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_2_Area2:
      .BYTE $05,$1C,$B6,$44,$B6
      .BYTE $03,$43,$FA
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_2_Area3:
      .BYTE $01

      .BYTE $03,$5C,$C7
      .BYTE $01
EnemyPointers_Level_3_3_Area0:
      .BYTE $03,$42,$4A
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_3_Area1:
      .BYTE $01

      .BYTE $01
      .BYTE $07,$0A,$14,$08,$58,$0A,$84
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_3_Area2:
      .BYTE $03,$31,$65
      .BYTE $05,$0E,$75,$0E,$95
      .BYTE $09,$30,$05,$31,$55,$0D,$AC,$0D,$CC
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_3_Area3:
      .BYTE $01

      .BYTE $09,$31,$72,$2E,$84,$2E,$B7,$30,$4C
      .BYTE $07,$2E,$81,$2F,$1A,$31,$DF
      .BYTE $07,$2E,$35,$2E,$96,$2E,$18
      .BYTE $03,$31,$71
      .BYTE $03,$31,$CF
      .BYTE $07,$2F,$20,$31,$70,$2E,$7E
      .BYTE $07,$2F,$71,$30,$8D,$31,$7F
      .BYTE $05,$30,$34,$30,$C7
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_3_3_Area4:
      .BYTE $03,$06,$6C
      .BYTE $05,$23,$8D,$23,$CD
      .BYTE $05,$02,$57,$02,$ED
      .BYTE $01
      .BYTE $05,$05,$C2,$07,$3B
      .BYTE $05,$07,$C4,$03,$3D
      .BYTE $03,$0E,$D6
      .BYTE $01
EnemyPointers_Level_3_3_Area5:
      .BYTE $03,$15,$6F
      .BYTE $03,$15,$6B
      .BYTE $03,$15,$67
      .BYTE $03,$15,$63
      .BYTE $01
EnemyPointers_Level_3_3_Area6:
      .BYTE $0B,$31,$73,$2F,$84,$31,$79,$17,$87,$3D,$89
      .BYTE $01
EnemyPointers_Level_3_3_Area7:
      .BYTE $01

      .BYTE $05,$0E,$C9,$0E,$E9
      .BYTE $03,$0D,$E9
      .BYTE $05,$0D,$09,$0D,$29
      .BYTE $05,$44,$6B,$43,$AA
      .BYTE $01
EnemyPointers_Level_3_3_Area8:
      .BYTE $03,$2F,$22
      .BYTE $05,$2F,$62,$5D,$D6
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_1_Area0:
      .BYTE $01

      .BYTE $05,$29,$96,$13,$B2
      .BYTE $03,$13,$22
      .BYTE $0B,$29,$09,$29,$29,$13,$35,$29,$D9,$29,$F6
      .BYTE $01
      .BYTE $09,$29,$46,$29,$98,$29,$A6,$29,$F8
      .BYTE $05,$13,$13,$29,$B8
      .BYTE $05,$29,$08,$29,$B5
      .BYTE $05,$29,$35,$13,$41
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_1_Area1:
      .BYTE $01

      .BYTE $01
      .BYTE $03,$26,$58
      .BYTE $01
      .BYTE $07,$29,$0A,$26,$58,$29,$9A
      .BYTE $05,$29,$3A,$29,$DC
      .BYTE $03,$26,$F6
      .BYTE $01
      .BYTE $05,$29,$3C,$26,$D7
      .BYTE $05,$44,$85,$43,$D4
      .BYTE $01
EnemyPointers_Level_4_1_Area2:
      .BYTE $01
; This area is unused...
      .BYTE $03,$5C,$B8 ; it has another lonely Boss Birdo...
      .BYTE $01					  ; and a fucking billion empty pages.
      .BYTE $01 ; Nintendo, what were you on???
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_2_Area0:
      .BYTE $03,$42,$47
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_2_Area1:
      .BYTE $05,$10,$D3,$10,$F5
      .BYTE $03,$10,$D8
      .BYTE $09,$10,$16,$10,$37,$10,$44,$10,$78
      .BYTE $0B,$10,$67,$10,$98,$10,$C7,$10,$E4,$10,$F8
      .BYTE $07,$29,$C8,$29,$E8,$10,$F3
      .BYTE $05,$10,$A6,$10,$D8
      .BYTE $0B,$10,$37,$10,$53,$10,$95,$10,$D8,$10,$F4
      .BYTE $0B,$10,$3A,$10,$56,$10,$7B,$10,$84,$10,$F7
      .BYTE $07,$10,$23,$10,$66,$29,$B8
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_2_Area2:
      .BYTE $01

      .BYTE $03,$28,$6A
      .BYTE $05,$28,$7A,$28,$FA
      .BYTE $01
      .BYTE $03,$28,$DA
      .BYTE $05,$28,$69,$07,$98
      .BYTE $09,$28,$2A,$03,$39,$28,$BA,$03,$C9
      .BYTE $05,$28,$69,$03,$88
      .BYTE $05,$28,$A9,$29,$D3
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_2_Area3:
      .BYTE $01

      .BYTE $03,$26,$C7
      .BYTE $01
      .BYTE $05,$04,$99,$04,$C9
      .BYTE $01
EnemyPointers_Level_4_2_Area4:
      .BYTE $01

      .BYTE $05,$1C,$B8,$44,$B9
      .BYTE $03,$43,$BA
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_3_Area0:
      .BYTE $03,$42,$2A
      .BYTE $01
EnemyPointers_Level_4_3_Area1:
      .BYTE $01

      .BYTE $03,$1C,$A9
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $03,$10,$18
      .BYTE $01
EnemyPointers_Level_4_3_Area2:
      .BYTE $09,$29,$EA,$29,$EC,$29,$DE,$29,$EE
      .BYTE $03,$29,$EE
      .BYTE $05,$29,$E0,$29,$E2
      .BYTE $03,$29,$8C
      .BYTE $09,$29,$92,$29,$B2,$29,$E9,$29,$EB
      .BYTE $05,$29,$71,$29,$E4
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_3_Area3:
      .BYTE $07,$01,$C8,$03,$D8,$02,$E8
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $07,$29,$72,$29,$82,$29,$7E
      .BYTE $01
      .BYTE $03,$29,$C1
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_3_Area4:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_3_Area5:
      .BYTE $09,$17,$72,$3D,$74,$29,$57,$29,$97
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_3_Area6:
      .BYTE $05,$29,$65,$29,$95
      .BYTE $05,$44,$2A,$43,$87
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_3_Area7:
      .BYTE $03,$6A,$24
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_3_Area8:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_4_3_Area9:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_5_1_Area0:
      .BYTE $03,$42,$31
      .BYTE $03,$08,$45
      .BYTE $03,$23,$56
      .BYTE $01
EnemyPointers_Level_5_1_Area1:
      .BYTE $01

byte_BANK9_AC69:
      .BYTE $03,$3B,$E4
      .BYTE $09,$3B,$34,$3B,$84,$13,$B2,$3B,$D4
      .BYTE $05,$13,$82,$13,$C2
      .BYTE $05,$13,$02,$3B,$A4
      .BYTE $07,$13,$42,$13,$82,$13,$C2
      .BYTE $03,$13,$B2
      .BYTE $05,$3B,$94,$3B,$E4
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_5_1_Area2:
      .BYTE $05,$1C,$C4,$44,$C5
      .BYTE $03,$43,$CA
      .BYTE $01
EnemyPointers_Level_5_2_Area0:
      .BYTE $03,$42,$2A
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_5_2_Area1:
      .BYTE $01

      .BYTE $07,$14,$78,$14,$96,$14,$B8
      .BYTE $09,$08,$29,$14,$D6,$14,$E6,$14,$F6
      .BYTE $01
      .BYTE $09,$04,$8C,$04,$9C,$08,$AB,$04,$BC
      .BYTE $05,$14,$89,$14,$B9
      .BYTE $05,$14,$55,$14,$95
      .BYTE $07,$14,$17,$25,$38,$14,$57
      .BYTE $05,$0D,$26,$0D,$46
      .BYTE $05,$04,$6A,$08,$99
      .BYTE $01
EnemyPointers_Level_5_2_Area2:
      .BYTE $03,$14,$8B
      .BYTE $09,$10,$F2,$14,$68,$14,$8E,$06,$DE
      .BYTE $0B,$10,$02,$06,$C5,$06,$36,$10,$8E,$10,$DE
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_5_2_Area3:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $05,$13,$55,$13,$85
      .BYTE $01
EnemyPointers_Level_5_2_Area4:
      .BYTE $03,$01,$2B
      .BYTE $05,$04,$24,$04,$B4
      .BYTE $01
EnemyPointers_Level_5_2_Area5:
      .BYTE $01

      .BYTE $07,$13,$73,$1C,$B8,$44,$B9
      .BYTE $03,$43,$B4
      .BYTE $01
EnemyPointers_Level_5_3_Area0:
      .BYTE $03,$42,$3A
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_5_3_Area1:
      .BYTE $03,$49,$80
      .BYTE $01
      .BYTE $03,$47,0
      .BYTE $01
      .BYTE $03,$47,$40
      .BYTE $03,$49,$C0
      .BYTE $03,$49,$C0
      .BYTE $07,$09,$2C,$09,$7C,$09,$AC
      .BYTE $01
      .BYTE $05,$09,$58,$09,$78
      .BYTE $01
EnemyPointers_Level_5_3_Area2:
      .BYTE $01

      .BYTE $05,$23,$36,$09,$C6
      .BYTE $03,$09,$36
      .BYTE $05,$09,$25,$09,$45
      .BYTE $03,$16,$A5
      .BYTE $01
EnemyPointers_Level_5_3_Area3:
      .BYTE $01

      .BYTE $05,$24,$52,$24,$3D
      .BYTE $01
      .BYTE $09,$09,$90,$09,$B0,$2F,$D5,$30,$4F
      .BYTE $05,$15,$82,$2F,$A8
      .BYTE $07,$30,$41,$15,$84,$31,$8A
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_5_3_Area4:
      .BYTE $01

      .BYTE $01
      .BYTE $05,$07,$67,$12,$D2
      .BYTE $01
      .BYTE $03,$12,$F2
      .BYTE $01
      .BYTE $07,$0F,$60,$03,$92,$03,$A6
      .BYTE $05,$03,$07,$03,$55
      .BYTE $05,$1C,$B7,$44,$B8
      .BYTE $03,$43,$B5
      .BYTE $01
EnemyPointers_Level_5_3_Area5:
      .BYTE $01

      .BYTE $03,$61,$A7
      .BYTE $01
EnemyPointers_Level_6_1_Area0:
      .BYTE $03,$42,$4A
      .BYTE $07,$19,$1D,$03,$AB,$19,$DD
      .BYTE $03,$18,$5A
      .BYTE $03,$1A,$49
      .BYTE $07,$19,$1D,$19,$5D,$03,$7B
      .BYTE $03,$18,$EA
      .BYTE $07,$18,$1A,$19,$AD,$19,$BD
      .BYTE $03,$1A,$E6
      .BYTE $05,$1A,$36,$24,$99
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_6_1_Area1:
      .BYTE $01

      .BYTE $07,$18,$4B,$18,$9A,$15,$FB
      .BYTE $05,$18,$2B,$18,$7B
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_6_1_Area2:
      .BYTE $01

      .BYTE $05,$1C,$C8,$44,$C8
      .BYTE $03,$43,$27
      .BYTE $01
EnemyPointers_Level_6_1_Area3:
      .BYTE $03,$01,$5A
      .BYTE $09,$01,$41,$01,$B4,$17,$85,$3D,$69
      .BYTE $01
EnemyPointers_Level_6_1_Area4:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $05,$01,$2A,$01,$DA
EnemyPointers_Level_6_1_Area5:
      .BYTE $03,$01,$5A
      .BYTE $05,$01,$41,$01,$B4
      .BYTE $01
EnemyPointers_Level_6_1_Area6:
      .BYTE $03,$01,$B8
      .BYTE $01
EnemyPointers_Level_6_2_Area0:
      .BYTE $03,$42,$2A
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_6_2_Area1:
      .BYTE $05,$0B,$C,$0B,$26
      .BYTE $07,$0C,$AB,$0C,$C9,$0C,$E7
      .BYTE $03,$25,$AB
      .BYTE $07,$10,$55,$10,$85,$10,$A5
      .BYTE $05,$0C,$98,$0C,$C8
      .BYTE $03,$10,$A3
      .BYTE $07,$0C,$63,$0C,$65,$0C,$67
      .BYTE $07,$0C,$65,$0C,$93,$0C,$C4
      .BYTE $03,$0C,$EB
      .BYTE $05,$0C,$29,$0C,$A9
      .BYTE $01
EnemyPointers_Level_6_2_Area2:
      .BYTE $01

      .BYTE $05,$1C,$CA,$44,$CB
      .BYTE $03,$43,$D4
      .BYTE $01
EnemyPointers_Level_6_3_Area0:
      .BYTE $03,$42,$2A
      .BYTE $01
EnemyPointers_Level_6_3_Area1:
      .BYTE $01

      .BYTE $01
      .BYTE $03,$03,$98
      .BYTE $07,$03,$48,$1A,$66,$19,$AA
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_6_3_Area2:
      .BYTE $01

      .BYTE $05,$16,$49,$16,$F9
      .BYTE $05,$09,$A9,$16,$C9
      .BYTE $03,$0D,$F5
      .BYTE $07,$0D,$27,$0D,$38,$0D,$56
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_6_3_Area3:
      .BYTE $01

      .BYTE $09,$14,$95,$14,$A4,$14,$B3,$14,$C2
      .BYTE $07,$14,$A7,$14,$BA,$14,$C8
      .BYTE $03,$14,$34
      .BYTE $07,$14,$4A,$06,$75,$06,$7E
      .BYTE $03,$01,$28
      .BYTE $07,$14,$9C,$14,$AD,$14,$BE
      .BYTE $03,$14,$5C
      .BYTE $03,$14,$93
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_6_3_Area4:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_6_3_Area5:
      .BYTE $01

      .BYTE $07,$43,$97,$1C,$B3,$44,$B4
      .BYTE $01
EnemyPointers_Level_6_3_Area6:
      .BYTE $01

      .BYTE $03,$5F,$B5
      .BYTE $01
EnemyPointers_Level_7_1_Area0:
      .BYTE $03,$42,$2A
      .BYTE $01
EnemyPointers_Level_7_1_Area1:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $0D,$09,$8B,$0C,$94,$09,$94,$0D,$B8,$0C,$E4,$09,$E4
      .BYTE $07,$09,$2B,$0C,$E4,$09,$E4
      .BYTE $0D,$0E,$3B,$0C,$54,$09,$54,$09,$6B,$0C,$94,$09,$94
      .BYTE $07,$15,$37,$0C,$F3,$09,$F3
      .BYTE $01
EnemyPointers_Level_7_1_Area2:
      .BYTE $01

      .BYTE $07,$02,$A8,$06,$B6,$06,$CB
      .BYTE $07,$15,$38,$03,$DC,$06,$F3
      .BYTE $05,$0D,$59,$06,$AB
      .BYTE $01
EnemyPointers_Level_7_1_Area3:
      .BYTE $01

      .BYTE $07,$06,$21,$14,$66,$14,$8B
      .BYTE $07,$31,$87,$31,$D7,$2F,$D9
      .BYTE $05,$31,$E0,$31,$63
      .BYTE $01
EnemyPointers_Level_7_1_Area4:
      .BYTE $01

      .BYTE $07,$43,$9A,$1C,$C5,$44,$C6
      .BYTE $01
EnemyPointers_Level_7_1_Area5:
      .BYTE $05,$31,$B9,$31,$C3
      .BYTE $01
EnemyPointers_Level_7_2_Area0:
      .BYTE $03,$06,$F5
      .BYTE $05,$06,$58,$06,$E8
      .BYTE $03,$0E,$74
      .BYTE $01
EnemyPointers_Level_7_2_Area1:
      .BYTE $01

      .BYTE $07,$01,$99,$01,$D9,$15,$F9
      .BYTE $07,$0E,$77,$0E,$A7,$0E,$C7
      .BYTE $03,$16,$D9
      .BYTE $01
      .BYTE $05,$25,$1C,$25,$BC
      .BYTE $03,$25,$5B
      .BYTE $01
EnemyPointers_Level_7_2_Area2:
      .BYTE $01

      .BYTE $05,$31,$99,$31,$EC
      .BYTE $05,$31,$24,$31,$69
      .BYTE $05,$2F,$96,$2F,$E3
      .BYTE $03,$2F,$3A
      .BYTE $03,$1C,$B7
      .BYTE $01
      .BYTE $07,$1C,$B7,$17,$A4,$3D,$B8
      .BYTE $01
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_7_2_Area3:
      .BYTE $07,$2F,$B8,$30,$F3,$2E,$FC
      .BYTE $09,$2F,$34,$2F,$74,$2F,$A4,$30,$AB
      .BYTE $07,$30,$1A,$2F,$79,$30,$F5
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_7_2_Area4:
      .BYTE $09,$2F,$23,$2F,$83,$2F,$E3,$31,$CC
      .BYTE $05,$2F,$BB,$2F,$FB
      .BYTE $03,$2F,$53
      .BYTE $09,$31,$29,$2E,$43,$2F,$A3,$31,$59
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $05,$44,$49,$2D,$B7
      .BYTE $01
EnemyPointers_Level_7_2_Area5:
      .BYTE $01

      .BYTE $01
      .BYTE $05,$4A,$1A,$6C,$A7
      .BYTE $01
EnemyPointers_Level_7_2_Area6:
      .BYTE $03,$2F,$8A
      .BYTE $07,$2E,$73,$31,$85,$2F,$8C
      .BYTE $05,$31,$87,$2F,$8E
      .BYTE $05,$31,$50,$30,$A0
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $0D,$31,$61,$31,$A1,$2F,$A3,$31,$68,$2F,$5A,$2F,$AA
      .BYTE $05,$2F,$61,$2F,$A1
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_7_2_Area7:
      .BYTE $09,$03,$76,$07,$69,$07,$99,$30,$8F
      .BYTE $09,$2F,$A2,$31,$73,$31,$68,$2E,$AD
byte_BANK9_AFDD:
      .BYTE $07,$31,$80,$31,$97,$2E,$7F
      .BYTE $05,$07,$80,$01,$84
      .BYTE $01
EnemyPointers_Level_7_2_Area8:
      .BYTE $05,$31,$9C,$30,$7E
      .BYTE $07,$2F,$35,$30,$77,$31,$A8
      .BYTE $05,$31,$67,$31,$BA
      .BYTE $01
      .BYTE $09,$30,$42,$31,$82,$30,$B2,$2F,$74
      .BYTE $09,$2F,$53,$2F,$93,$30,$54,$2F,$76
      .BYTE $01
      .BYTE $01
EnemyPointers_Level_7_2_Area9:
      .BYTE $01

      .BYTE $01
      .BYTE $03,$23,$79
      .BYTE $05,$02,$20,$02,$D0
      .BYTE $01
EnemyPointers_Level_7_3_Area0:
      .BYTE $01

EnemyPointers_Level_7_3_Area1:
      .BYTE $01

EnemyPointers_Level_7_3_Area2:
      .BYTE $01

EnemyPointers_Level_7_3_Area3:
      .BYTE $01

EnemyPointers_Level_7_3_Area4:
      .BYTE $01

      .BYTE $01 ; Unused
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
; The rest of this bank is empty

; [00000FDB BYTES: END OF AREA UNUSED-BANK9:B025. PRESS KEYPAD "-" TO COLLAPSE]
; ===========================================================================

