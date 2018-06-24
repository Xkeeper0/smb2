
      ;.segment	BANK8
;       *	=  $8000
LevelAreaStartIndexes:
      .BYTE $00
						  ; Table to determine what "total" index a given
						  ; level + area is. Get the starting area from	this
						  ; table (based on CurrentLevel) and add the area to it
						  ;
						  ; Level 1-1
      .BYTE $0A					  ; Level 1-2
      .BYTE $14					  ; Level 1-3
      .BYTE $1E					  ; Level 2-1
      .BYTE $28					  ; Level 2-2
      .BYTE $32					  ; Level 2-3
      .BYTE $3C					  ; Level 3-1
      .BYTE $46					  ; Level 3-2
      .BYTE $50					  ; Level 3-3
      .BYTE $5A					  ; Level 4-1
      .BYTE $64					  ; Level 4-2
      .BYTE $6E					  ; Level 4-3
      .BYTE $78					  ; Level 5-1
      .BYTE $82					  ; Level 5-2
      .BYTE $8C					  ; Level 5-3
      .BYTE $96					  ; Level 6-1
      .BYTE $A0					  ; Level 6-2
      .BYTE $AA					  ; Level 6-3
      .BYTE $B4					  ; Level 7-1
      .BYTE $BE					  ; Level 7-2
      .BYTE $C8					  ; Level 7-3 (unused)
LevelDataPointersLo:
      .BYTE <LevelData_1_1_Area0
						  ; Stuff below	here ------
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
      .BYTE 9, $F3, $30, 0, $B7, $A, 0, 0, $56, $10, $1A,	$10, $D6, $C2, $29, $10
      .BYTE $75, $C4, $5A, $21,	$12, $C9, $75, $C7, $1E, $C1, $3E, $A, 0, $20, $20, $CF; $10
      .BYTE $FF					  ; $20
LevelData_1_1_Area1:
      .BYTE 0, $F3, $30, 0, $F5, 0, $50, $34, $E1, $19, $E2, $B5,	$12, $A, $12, $17
      .BYTE $12, $16, $E5, $32,	$E1, $26, $E3, $57, $E5, $38, $C2, $27,	$22, $C, $E2, $17; $10
      .BYTE $C1, $11, $E2, $16,	$22, $16, $C3, $2B, $21, $18, $C4, $37,	$C2, $36, $C7, $12; $20
      .BYTE $E2, $35, $C8, $3B,	$C3, $24, $22, $12, $C,	$F5, 0,	$29, 4,	$C4, $30, $E1; $30
      .BYTE 2, 3, 3, $EC, $F4, 7, $D, $45, $D, $1A, $D,	$26, $E3, $BA, $C, $FF;	$40
LevelData_1_1_Area2:
      .BYTE $80, $E0, $92, 0, $79, $16, $10, $C2,	7, $16,	$31, $A, 0, 3, $15, $21
      .BYTE 8, $22, $F,	$22, $8A, $2B, $B, $52,	$E, $26, $10, $10, $A, $C5, $63, $21; $10
      .BYTE $60, $C, $44, $29, $3E, $F,	$14, $F, 9, 1, $19, $F,	$78, $51, $17, $DC; $20
      .BYTE $15, $C2, $14, $22,	$10, $29, 3, $C2, $18, $FA, $15, $C3, $21, $22,	$F0, $C8; $30
      .BYTE $5A, $10, $1E, $10,	$33, $C2, $16, $F9, $B8, $27, $A, 1, $17, $C3, $11, $22; $40
      .BYTE $F,	$29, $10, $C2, $17, $C5, $33, $22, 7, $C6, $11,	$C3, $1F, $25, $F0, $E0; $50
      .BYTE $8D, $21, $F, $27, $43, $C1, 6, $29, $A, $29, $31, $24, 6, $21, $A,	$51; $60
      .BYTE $51, $CF, 6, $F3, $30, $22,	$75, $D5, $51, $CB, $28, $B, 0,	$32, $1E, $26; $70
      .BYTE $1A, $CD, $9F, $C0,	$50, $21, 1, $21, 3, $2D, 8, $54, $D, $12, $F5,	0; $80
      .BYTE $13, $18, $C6, $F4,	$F3, $F3, $DF, $C6, $F3, $6D, $C8, $F2,	$6A, $CF, $5E, $B; $90
      .BYTE 0, $41, $F4, $F3, $F3, $F3,	$2E, $16, $FF; $A0
LevelData_1_1_Area3:
      .BYTE $91, $EA, $22, $11, $47, $A8,	$19, $25, $B, $25, $16,	$83, $24, $A, 0, $54
      .BYTE $13, $25, $F0, $71,	$F0, $FC, $F0, $E, $F1,	$8F, $F1, $B1, $F1, $F4, $64, $F3; $10
      .BYTE $98, $C, $F5, 0, $40, $48, 3, $18, 3, $C7, $13, 0, $28, $F0, $B2, $F1; $20
      .BYTE $4A, $FF				  ; $30
LevelData_1_1_Area4:
      .BYTE $91, $EA, $22, $11, 3, $F3, $97, $12,	$F5, 0,	$31, $34, $80, 5, $80, $E
      .BYTE $21, $F, $21, $F0, $EC, $F1, $F, $F1, $50, $E1, $13, 0, $27, $F0, $8A, $FF;	$10
LevelData_1_1_Area5:
      .BYTE $80, $E8, $40, $12, $7C, $10,	$18, $C, $F5, 0, $10, $12, $10,	$15, $11, $30
      .BYTE $E7, 8, 3, 9, $E6, $9C, $10, $1F, $11, $50,	$E7, $A, $91, $F1, $60,	$7E; $10
      .BYTE $10, $43, $48, $F5,	1, 0, $F0, $4C,	$F1, $EB, $F2, $F0, $2A, $F2, $24, $83;	$20
      .BYTE $25, $81, $4B, $B, 0, $30, $F0, $8B, $F1, $8C, $F1,	$CA, $FF; $30
LevelData_1_2_Area0:
      .BYTE $80, $EA, $70, $10, $8E, $C3,	$3B, $C1, $F0, $CD, $F1, $48, $DD, $10,	$13, $C2
      .BYTE $EB, $10, $10, $11,	6, $10,	$E, $11, $2E, $C1, $7F,	$29, $5D, $16, $E, $16;	$10
      .BYTE $2A, 7, $F,	6, $F5,	1, $30,	$18, $26, $C, $2B, $12,	$C2, $F0, $E0, $F6; $20
      .BYTE 0, $43, $10, $15, $11, $1A,	$CD, $35, $16, $31, $16, 8, $29, $1D, 9, 1; $30
      .BYTE $10, $10, $22, 2, $51, $40,	$29, $B, $10, $1C, $11,	$12, $26, $18, $CC, $F0; $40
      .BYTE 8, $F1, $C2, $F2, $3C, $16,	$1D, $16, $13, $B, 1, $13, $15,	$56, $E, $51; $50
      .BYTE $9C, $8C, $D, $8C, $E, $8C,	$F, $8C, $27, $10, $15,	$11, $4A, $16, $14, $16; $60
      .BYTE $C,	$B, 1, $20, $26, $16, 9, $82, $A, $82, $B, $82,	$F0, 0,	$FF; $70
LevelData_1_2_Area1:
      .BYTE $89, $EA, $32, $11, $99, $29,	$16, $29, $C, $29, $12,	$13, 1,	4, $1A,	$25
      .BYTE $C,	$21, $E, $21, $F0, $30,	$F1, $F7, $7D, $A8, $1C, $25, $E, $26, $1D, 5; $10
      .BYTE $3A, $83, $32, $25,	3, $25,	6, $25,	7, $25,	9, $80,	$F, $21, $F0, $30; $20
      .BYTE $F0, $97, $F0, $D0,	$F1, $35, $80, $25, 2, $25, $17, $82, $1E, $29,	$24, $83; $30
      .BYTE $37, $2D, $F0, $F0,	$F1, $1B, $F1, $51, $7C, $14, 1, 6, $F0, $F, $F1, $4E; $40
      .BYTE $F1, $CA, $FF			  ; $50
LevelData_1_2_Area2:
      .BYTE $80, $E0, $20, 2, 0, $8C, 1, $8C, 2, $8C, 3, $8C, $28, $10, $1B, $11
      .BYTE $53, $B, 1,	7, $1F,	$16, $14, $82, 5, $82, $D, $16,	$79, $11, $16, $10; $10
      .BYTE $36, $16, $31, $16,	4, $48,	$13, $82, 4, $82, 5, $82, 6, $82, 7, $82; $20
      .BYTE 8, $82, 9, $82, $A,	$82, $B, $82, $C, $82, $F2, $F0, 1, $F6, 2, $F0; $30
      .BYTE $59, $F0, $8A, $F5,	2, 0, $FF	  ; $40
LevelData_1_2_Area3:
      .BYTE $18, $E3, 1, 1, $64, $32, 9, $32, $32, $32, $B, $32, $14, $2C, 6, $32
      .BYTE $A,	$2C, $F0, $44, $F0, $65, $F0, $86, $F0,	$A7, $F1, $66, $F1, $83, $F1, $A0; $10
      .BYTE $F5, 1, 3, $FF			  ; $20
LevelData_1_2_Area4:
      .BYTE $18, $E3, 1, 1, $64, $32, 9, $32, $32, $32, $B, $32, $24, $31, $A, $31
      .BYTE $17, $27, $F0, $44,	$F0, $65, $F0, $86, $F0, $A7, $F1, $86,	$F1, $A8, $F1, $C4; $10
      .BYTE $FF					  ; $20
LevelData_1_2_Area5:
      .BYTE $80, $E1, $90, 0, 0, $8A, 1, $8A, 2, $8A, $2D, $29, $1A, $29,	$28, $C5
      .BYTE $2E, $F2, $F1, $C8,	$A6, $29, $E, $10, $13,	$29, $21, $C2, 7, $C5, $24, $F2; $10
      .BYTE $D,	$F2, $26, $C7, $20, $C4, $79, $29, $B, $29, $18, $2B, $11, $22,	2, $26;	$20
      .BYTE 3, $DB, $10, $C3, $E, $C1, $14, $F9, $3E, $C4, $1A,	$C3, $10, $C6, $56, $10; $30
      .BYTE $1A, $11, $4C, $D3,	$15, $D3, $D, $C1, $16,	$C1, $F, $F3, $18, $F4,	$13, $F2; $40
      .BYTE $64, $10, $28, $D3,	$19, $C1, $12, $D3, $B,	$FE, $13, $C1, $15, $F3, $A7, $11; $50
      .BYTE $11, $29, 5, $29, $B, $21, $C, $21,	$D, $21, $E, $21, $F, $21, $1A,	$C6; $60
      .BYTE $60, $C1, 4, $C1, 8, $CA, $80, $2D,	$A, $10, $42, $29, $43,	$F9, $F1, $A1; $70
      .BYTE $3E, $18, $23, $11,	$18, $10, $16, $29, $24, $22, 6, $21, 8, $22, $13, $D5;	$80
      .BYTE $12, $C1, 8, $C1, $24, $26,	6, $22,	$2B, $F1, $F1, $68, $F1, $A1, $34, $18;	$90
      .BYTE $A,	$18, $9C, $A, 2, $23, $98, $10,	$55, $C1, $12, 8, $10, $51, $F0, $E8; $A0
      .BYTE $FF					  ; $B0
LevelData_1_3_Area0:
      .BYTE $20, $E0, 3, $19, $55, $2C, $B, $2C, $33, $2C, $D, $2C, $16, $34, $27, $A
      .BYTE 2, $20, $F0, $54, $F1, $A0,	$FF	  ; $10
LevelData_1_3_Area1:
      .BYTE $20, $E0, $67, $19, $58, $A, 2, $10, $23, $39, $32, $32, $B, $32, $35, $33
      .BYTE $A,	$30, $1A, $AF, $F0, $54, $34, $31, $C, $30, $1C, $AC, $12, $31,	$34, $31; $10
      .BYTE $32, $31, $34, $31,	$F0, $5C, $32, $31, $C,	$30, $34, $37, $62, $37, $18, $A9; $20
      .BYTE $D,	0, $E, 0, $1D, 0, $E, 0, $14, $31, 9, $35, $F0,	$14, $6A, $33; $30
      .BYTE $3C, $31, $13, $13,	2, 8, $2C, $31,	$27, $32, $F1, $5B, $F1, $74, $44, $35;	$40
      .BYTE $36, $35, $34, $35,	$19, $A6, $27, $31, $A,	$31, $17, $AF, 8, $AD, $F0, $16; $50
      .BYTE $49, $AE, $65, $A9,	$B, $AB, $51, $33, $C, $32, $12, $AC, $D, $A8, $F0, $17; $60
      .BYTE $F0, $D4, $63, $31,	$14, $A7, $2C, 9, 2, $30, $26, $31, $51, $73, 6, $73; $70
      .BYTE $F1, $18, $F1, $C0,	$FF		  ; $80
LevelData_1_3_Area2:
      .BYTE $A0, $EA, $57, $19, $39, $29,	$13, $13, 2, $26, $6B, $32, $28, $77, $F0, $4B
      .BYTE $F1, $D, $7F, $30, $16, $31, $A, $32, $23, $31, $F,	$30, $20, $31, $1F, $30; $10
      .BYTE $F0, 8, $90, $66, 7, $31, $17, $31,	9, $66,	$20, $66, 7, $30, 8, 1;	$20
      .BYTE $17, $31, 9, $66, $20, $66,	7, $31,	$17, $31, 9, $66, $80, $29, $10, $30; $30
      .BYTE $A,	$29, $20, $29, $10, $30, 9, $82, $A, $82, $B, $82, $E, $82, $F,	$82; $40
      .BYTE $20, $29, $10, $30,	$F0, $4D, $F0, $A8, $F0, $CC, $F1, 8, $93, $29,	$32, $81; $50
      .BYTE 3, $81, 6, $81, $F0, $B0, $F1, $F, $F0, $31, $F2, $99, $42,	$F1, $F, $F1; $60
      .BYTE $CA, $F5, 2, $40, $FF		  ; $70
LevelData_1_3_Area3:
      .BYTE $AA, $F8, $16, $22, $6E, $25,	$F, $25, $1E, $32, $3F,	$25, $F0, $50, $F0, $BD
      .BYTE $F1, $5B, $F1, $9A,	$B0, $25, 4, $84, $33, $81, $A,	$33, $11, $25, 5, $80; $10
      .BYTE $F0, $99, $F0, $DC,	$F1, $F8, $FF	  ; $20
LevelData_2_1_Area0:
      .BYTE $80, $EC, $90, 0, 0, $E, $14,	$11, $12, $10, $1C, $10, $4A, $17, $12,	$17
      .BYTE $8A, $10, $27, $17,	$E2, $10, $14, $11, $4A, 7, $F,	$D3, $11, $D5, $E, $D1;	$10
      .BYTE $10, $D1, 6, $D1, $D, $D1, $77, $10, $19, $11, $48,	$29, $1C, $D3, $12, $D1; $20
      .BYTE $B,	$D1, $F, $D1, $13, $D1,	$A, $D1, $B8, $26, $A, $22, $B,	$2B, $C, $22; $30
      .BYTE $D,	$22, $17, $36, $14, 7, 8, $34, $17, $36, $10, $D1, 8, $34, $8E,	$10; $40
      .BYTE $39, $29, $37, $F, $A, $F, $1D, $D2, $F0, $C, $F6, 1, $93, $11, $47, $F; $50
      .BYTE $F,	$37, $1E, $39, $1D, $3B, $F1, $8C, $F6,	0, $89,	$10, $10, $29, 5, $29; $60
      .BYTE $1F, $29, $11, $33,	$10, $35, $1C, $F, $F2,	$7D, $F, $F0, $C, $F6, 1, $F1; $70
      .BYTE $8C, $F6, 0, $A3, $10, $11,	$11, 7,	$17, $59, $B, 3, $10, $FF; $80
LevelData_2_1_Area1:
      .BYTE 9, $F6, $31, 9, $66, $13, 3, 9, $7D, $29, $F0, $55, $F1, $1C,	$F1, $4D
      .BYTE $83, $29, $F2, $72,	$29, $1D, $29, $32, $A3, $32, 5, $F1, $C0, $12,	$AA, $AC; $10
      .BYTE $A,	3, $20,	$F0, $F4, $F1, $98, $F1, $A0, $FF; $20
LevelData_2_1_Area4:
      .BYTE $91, $EA, $20, $1A, $97, $80,	$23, $A, 3, $13, $F0, $4D, $F0,	$CC, $F1, 2
      .BYTE $F2, $F0, $48, $F0,	$8C, $F2, $84, $86, 5, $86, $F0, $48, $F1, $B, $F1, $CA; $10
      .BYTE $F5, 4, 0, $FF			  ; $20
LevelData_2_1_Area3:
      .BYTE $18, $E3, 1, 1, $54, $32, 9, $32, $15, $30, $A, $30, $27, $31, $24, $31
      .BYTE $A,	$31, $15, $31, 9, $31, $16, $33, $1B, $24, $F0,	$44, $F0, $65, $F0, $86; $10
      .BYTE $F0, $A7, $F1, $86,	$F1, $A3, $F1, $C8, $FF; $20
LevelData_2_2_Area0:
      .BYTE $89, $EA, $10, $19, $8E, $81,	$F, $81, $F0, $B0, $F1,	$6F, $BD, $14, 4, $10
      .BYTE $40, $81, $F0, $2E,	$F1, $CA, $FF	  ; $10
LevelData_2_2_Area1:
      .BYTE $80, $EA, $90, $18, $2D, $10,	$1B, $11, $56, $16, $D,	$16, $32, $B, 4, 1
      .BYTE $F0, $6D, $F0, $8D,	$F6, 0,	$7C, $10, $8F, $F, $11,	$D1, $C, $F, $F0, $8D; $10
      .BYTE $F6, 1, $5A, $10, $26, $11,	$33, $29, $10, $29, $22, $F, $F, 7, $F0, $8D; $20
      .BYTE $F6, 0, $74, $10, $45, $29,	9, $29,	$34, $26, 8, $21, $C, $21, $D, $2B; $30
      .BYTE $F0, $C, $AC, $F, $17, $F, $19, $F,	$13, 7,	4, $97,	$30, 7,	$F0, $D; $40
      .BYTE $F0, $A2, $F6, 1, $68, $10,	$41, 7,	$3F, $B, 4, $22, $F0, $A2, $F6,	2; $50
      .BYTE $F1, $C2, $F6, 3, $F2, $7E,	7, $15,	7, $A, 7, $F0, $C, $F5,	4, $22;	$60
      .BYTE $F6, 0, $83, $11, $10, $10,	$4D, $F, $15, 7, 9, 7, $12, 7, $86, $11; $70
      .BYTE $12, $10, $4A, $37,	$19, $39, $18, $3B, $17, $3D, $9D, $C, $F5, 4, $30, $4A; $80
      .BYTE $87, $B, $87, $C, $87, $D, 3, $E, $87, $F, $87, $7D, 3, $F1, $48, $FF; $90
LevelData_2_2_Area2:
      .BYTE $89, $EA, $20, $19, $8B, $28,	$D, $26, $E, $2D, $F, $22, $1A,	$36, $19, $21
      .BYTE $A,	$36, $19, $38, $18, $3A, $F0, $B7, $F0,	$F0, $5D, 2, $1D, 2, $1D, 2; $10
      .BYTE $1D, 2, $3C, 2, $1C, 2, $11, $22, $F0, $97,	$F0, $D0, $F1, $4F, $F1, $AE; $20
      .BYTE $F5, 4, $15, $90, $13, 4, $15, $24,	$29, $33, $25, 4, $25, 5, $25, $37; $30
      .BYTE $27, $F0, $6F, $F0,	$D4, $F1, $4A, $FF; $40
LevelData_2_2_Area3:
      .BYTE 9, $F2, $31, 9, 2, $8A, 3, $8A, 4, $8A, 5, $8A, 6, $8A, 7, $8A
      .BYTE 8, $8A, 9, $8A, $62, $12, $77, $80,	7, $29,	$F5, 4,	$19, $AC, $80, $C; $10
      .BYTE $29, $54, $80, 4, $29, $F0,	$51, $F1, $6D, $3B, $80, $B, $29, $52, $82, 3; $20
      .BYTE $82, 4, $82, 5, $82, $23, $29, $F1,	$6E, $F2, $9A, $83, $B,	$83, $C, $83; $30
      .BYTE $D,	$83, $E, $83, $2C, $A, 4, $50, $F1, $A0, $FF; $40
LevelData_2_2_Area4:
      .BYTE $18, $E3, 1, 1, $54, $32, 9, $32, $15, $30, $A, $30, $27, $31, $24, $31
      .BYTE $A,	$31, $15, $31, 9, $31, $16, $33, $1B, $24, $F0,	$44, $F0, $65, $F0, $86; $10
      .BYTE $F0, $A7, $F1, $86,	$F1, $A3, $F1, $C8, $FF; $20
LevelData_2_2_Area5:
      .BYTE $89, $EA, $22, $1A, $43, $A, 4, $33, $F0, $4E, $F1, $4F, $F1,	$BC, $F2, $64
      .BYTE $4E, $64, 0, 7, 0, 8, 0, $F0, $13, $F0, $8D, $70, $46, $10,	$42, $F0; $10
      .BYTE $88, $F0, $EC, $F1,	$2B, $F1, $8A, $F5, 5, 0, $FF; $20
LevelData_2_3_Area0:
      .BYTE $89, $EA, 0, 1, 9, $A9, $F5, 5, $11, $F0, $2F, $F0, $CC, $F1,	$8F, $F1
      .BYTE $EA, $FF				  ; $10
LevelData_2_3_Area1:
      .BYTE $80, $EC, $90, 0, 0, $89, 1, $89, 2, $89, 3, $89, $25, $29, $1C, $29
      .BYTE $18, $2B, $16, $C4,	$2B, $21, $1A, $C2, $95, $11, 8, $10, $66, $A6,	$F5, 5;	$10
      .BYTE 0, $12, $32, 9, $32, $D, $26, $E, $21, $F, $21, $14, $31, 6, 5, 7; $20
      .BYTE $32, $14, $31, 7, $32, $14,	$31, 7,	$32, $14, $31, 7, $32, $14, $31, 6; $30
      .BYTE 5, 7, $32, $53, $29, $31, $F, $F, $29, $23,	$21, 5,	$21, $71, $C2, $1E; $40
      .BYTE $29, 2, $B,	5, $20,	$16, $22, 9, $22, $11, $C2, 5, $C3, 9, $C2, $E;	$50
      .BYTE $C3, $DD, $11, $5D,	$F, $C3, $29, $39, $F, $13, $F,	$E, $F,	$F1, $4C, $F6; $60
      .BYTE 1, $F1, $CC, $F6, 0, $90, $10, $E, $10, $12, $11, $52, $F, 6, $F, $A; $70
      .BYTE $F,	$1E, $D1, $F0, $6C, $F6, 1, $F0, $CC, $F6, 0, $86, $11,	$31, $29, 8; $80
      .BYTE $29, $43, $D2, $A, $D1, $F0, $C, $F6, 2, $F0, $6C, $F6, 0, $F0, $CC, $F6; $90
      .BYTE 2, $F1, $4C, $F6, 0, $84, $10, $52,	$F, $E,	$F, $C8, $17, $47, $B, 5; $A0
      .BYTE $30, $F4, $26, $16,	9, $16,	$FF	  ; $B0
LevelData_2_3_Area2:
      .BYTE $91, $EA, $10, $19, $8A, $2D,	$D, $13, 5, $13, $18, $54, $B, $21, $F1, $F
      .BYTE $F2, $90, $26, 1, $52, $F0,	$8A, $FF  ; $10
LevelData_2_3_Area3:
      .BYTE 9, $E1, $61, 9, $68, $14, 5, $19, $5C, $31, $13, $31,	$F0, $35, $F1, $1C
      .BYTE $6B, $29, $9D, $29,	$A8, $28, $3A, $34, $F0, $75, $F1, $1C,	$F1, $75, $82, $2C; $10
      .BYTE 6, $2C, 9, $2C, $D,	$2C, $24, $2C, $B, $2C,	$5C, 9,	5, $50,	$F1, $33; $20
      .BYTE $F1, $92, $BB, $29,	$54, $29, $F0, $6F, $92, $29, $5D, $29,	$F0, $D, $B6, $83; $30
      .BYTE 7, $83, 8, $83, 9, $83, $28, $A, 5,	$70, $1B, $29, $F0, $E,	$F0, $CD; $40
      .BYTE $F1, $4E, $F1, $A0,	$FF		  ; $50
LevelData_2_3_Area4:
      .BYTE $18, $E3, 1, 1, $54, $31, $A,	$31, $15, $31, 9, $31, $26, $33, $15, $31
      .BYTE 9, $31, $14, $30, $B, $30, $28, $28, $F0, $44, $F0,	$65, $F0, $86, $F0, $A7; $10
      .BYTE $F1, $66, $F1, $84,	$F1, $A0, $FF	  ; $20
LevelData_2_3_Area5:
      .BYTE $89, $EA, $62, $1A, $43, $A, 5, $33, $2C, $35, $1C, $35, $1C,	$35, $1C, $35
      .BYTE $D,	$29, $F0, $4E, $F1, $8F, $C2, $3F, $12,	$3F, $12, $3F, $B, $29,	$12, $3F; $10
      .BYTE $10, $3F, 3, $29, $10, $3F,	$10, $3F, 8, $29, $F0, $1C, $62, $29, $2F, $34;	$20
      .BYTE $1F, $34, $1F, $34,	$1E, $36, $1D, $38, $1C, $3A, $1B, $3C,	$1A, $3E, $F0, $F; $30
      .BYTE $F0, $4E, $F0, $CF,	$F1, $D, $F2, $F1, $CC,	$F2, $73, $F, 6, 7, $11, $F; $40
      .BYTE $F1, $2D, $F2, $A0,	7, 6, 7, $22, $42, $F0,	$10, $F2, $F0, $CF, $F1, $4A; $50
      .BYTE $F5, 5, $60, $FF			  ; $60
LevelData_2_3_Area6:
      .BYTE $AA, $EA, $13, $2A, $8E, $30,	$F0, $CD, $F1, $52, $F1, $CD, $E4, $32,	$1A, $33
      .BYTE $1C, $83, $D, $83, $10, 0, 1, 0, 2,	0, 3, $33, $10,	0, 1, 0; $10
      .BYTE 2, 0, $F0, $16, $F0, $6D, $F1, $CA,	$FF; $20
LevelData_2_3_Area7:
      .BYTE 9, $E0, 3, $11, $32, $2C, $D,	$2C, $22, $2C, $D, $2C,	$22, $2C, $D, $2C
      .BYTE $15, $35, $27, $A, 5, $36, $F0, $41, $F1, $80, $FF;	$10
LevelData_3_1_Area0:
      .BYTE $80, $EA, $10, $10, $13, $10,	$14, $11, $1A, $16, $B,	$16, $F0, $42, $EA, $C2
      .BYTE $16, $C1, $18, $F1,	$C, $C3, $14, $C4, $D, $B, 6, $16, $F1,	$28, $F1, $42; $10
      .BYTE $FF					  ; $20
LevelData_3_1_Area1:
      .BYTE 0, $F3, $90, 8, $6C, $10, $52, $10, $18, $12,	$F5, 6,	$31, $C3, $10, $46
      .BYTE $10, $9C, $10, $34,	$10, $70, $FF, $B4, $E2, $F0, $6C, $34,	$E2, $38, $E1, $3A; $10
      .BYTE $E1, $3C, $E2, $3A,	$E1, $38, $E1, $35, $E1, $32, $E3, $37,	$E1, $37, $E4, $3B; $20
      .BYTE $E2, $10, $C2, $2B,	$E2, $20, $C3, $1B, $E2, $20, $C4, $12,	$B, 6, 1, 8; $30
      .BYTE $E3, $F1, $91, $F2,	$F1, $8A, $F3, $76, $C1, $27, $C2, $18,	$B, 6, $20, $F1; $40
      .BYTE $8B, $F1, $AB, $F6,	7, $FF		  ; $50
LevelData_3_1_Area2:
      .BYTE $89, $EA, $20, $11, $87, $13,	6, $19,	$F0, $D1, $F2, $94, $5E, $D, $26, $F2
      .BYTE $BB, 8, $D,	$A, 6, $16, $F1, $10, $F1, $CA,	$FF; $10
LevelData_3_1_Area3:
      .BYTE $80, $E8, $53, $10, $56, $10,	$2A, $11, $2E, $10, $12, $A, 6,	$43, $17, $11
      .BYTE $10, $E4, 8, $10, $1C, $10,	$7C, 0,	$1C, $E2, $27, $C, $F5,	6, $10,	$1F; $10
      .BYTE $E2, $2F, 0, $10, $E6, 7, 3, 8, $EA, $60, $E2, $26,	$E2, $12, $2B, $26; $20
      .BYTE $26, 7, $22, $D, $E2, $16, $C1, $20, 0, 1, 0, $A, $E3, $79,	$E3, $22; $30
      .BYTE 0, $10, $E3, 7, $E3, $36, $E2, $34,	$C1, $A, $E2, $50, $2D,	$29, $A8, $18; $40
      .BYTE $21, $19, 5, $31, $21, $3D,	$26, $E, $21, $F, $21, $F0, $C,	$F0, $4B, $F0; $50
      .BYTE $95, $F2, $4E, $B, 6, $40, $80, $21, 1, $21, 2, $21, $F0, $8B, $F1,	$28; $60
      .BYTE $F1, $8B, $F1, $CA,	$FF		  ; $70
LevelData_3_1_Area4:
      .BYTE $91, $EA, $32, $12, $41, $13,	6, $35,	$F0, $2E, $F2, $67, $36, $3D, 0, $1D
      .BYTE 0, $14, $35, $10, $31, $F0,	8, $F1,	$59, $F1, $CA, $F5, 7, 0, $F3, $26; $10
      .BYTE $83, $20, $81, $D, $14, 6, $30, $18, $25, 9, $25, $F0, $B, $F0, $4E, $F1; $20
      .BYTE $EA, $FF				  ; $30
LevelData_3_1_Area5:
      .BYTE $80, $EA, $98, $10, $2F, $16,	$9C, $A, 7, $23, $F0, $82, $F6,	0, $F1,	4
      .BYTE $66, $16, $D, $16, $2A, $F,	$17, $F, $53, $A4, $33,	5, $F5,	7, $11,	$F0; $10
      .BYTE $62, $44, $16, $1C,	$CD, $11, $F, $16, $F, 9, $C4, $52, $A4, $32, 5, $F5; $20
      .BYTE 7, $12, $F0, $64, $7C, $F, $1E, $51, $42, $A4, $32,	5, $F5,	7, $13,	$F0; $30
      .BYTE $42, $46, $16, $B, $16, $31, $F, $52, $A4, $32, 5, $F5, 7, $14, $F0, $64; $40
      .BYTE $40, $16, 5, $16, $92, $A3,	$22, 5,	$F5, 7,	$15, $F0, $C6, $F2, $2A, $16; $50
      .BYTE $1D, $16, $44, 1, 5, 1, $F0, 4, $F0, $85, $F0, $C4,	$F1, 3,	$F1, $44; $60
      .BYTE $A3, $16, $C, $16, $26, $F,	$11, $F, $A, $F, $F1, $83, $F1,	$C4, $F2, $25; $70
      .BYTE $16, $17, $16, $3E,	$25, $52, $A3, $22, 5, $F5, 7, $17, $57, $26, 9, $22; $80
      .BYTE $B,	$22, $C, $2B, $16, $C6,	$20, $25, $12, 2, 3, 2,	$F0, $45, $F0, $82; $90
      .BYTE $F1, $AA, $F6, 2, $FF		  ; $A0
LevelData_3_2_Area0:
      .BYTE $91, $EA, $72, $11, $97, $25,	9, $21,	$B, $21, $D, $26, $13, 2, 4, 2
      .BYTE 5, 2, 6, 2,	$E, 2, $F, 2, $2F, $2D,	$F0, $70, $F0, $EF, $F1, $D0; $10
      .BYTE $3C, $AC, $F5, 7, 1, $6C, 5, $40, 2, 1, 2, $C, 5, $F0, $4F,	$F0; $20
      .BYTE $8E, $F1, $B1, $5D,	$AC, $F5, 7, 2,	$56, $25, 8, $25, $A, $25, $14,	$83; $30
      .BYTE $D,	5, $F0,	$BC, $F0, $D5, $9D, $A9, $F5, 7, 3, $F0, $17, $F1, $8F,	$F1; $40
      .BYTE $F7, $F2, $D, $A9, $F5, 7, 4, $86, $41, $16, $41, $F0, $2F,	$F0, $97, $F0; $50
      .BYTE $CF, $F1, $17, $F1,	$4F, $F1, $CA, $6D, $A5, $F5, 7, 5, $65, $32, $3F, $83;	$60
      .BYTE $F0, $4F, $F0, $BC,	$F1, $15, $F1, $D3, $89, $83, $23, $A8,	$E, $A8, $11, 1; $70
      .BYTE 5, $25, 6, $25, $C,	$25, $D, $25, $13, 5, $E, 5, $32, $83, 5, $83; $80
      .BYTE $D,	$83, $37, $25, 9, $25, $F0, $15, $3D, $A5, $50,	$25, $F5, 7, 8,	$F0; $90
      .BYTE $7C, $F0, $88, $F0,	$CC, $F1, $E, $F1, $CA,	$FF; $A0
LevelData_3_2_Area1:
      .BYTE $91, $EA, $30, $12, $83, 0, 4, 0, 5, 0, 6, 0,	7, 0, 8, $49
      .BYTE $F0, $7C, $D8, $47,	$F0, $55, $F1, $1C, $F5, 8, 0, $F2, $F0, $E, $F2, $43; $10
      .BYTE $A,	7, 0, $F0, $CA,	$FF		  ; $20
LevelData_3_2_Area2:
      .BYTE $91, $EA, $10, $11, $F0, $94,	$F2, $48, $13, 8, $10, $54, $83, $13, $82, $F0
      .BYTE $50, $F0, $AE, $F1,	$8A, $FF	  ; $10
LevelData_3_3_Area0:
      .BYTE $80, $E1, $30, 0, $35, $10, $29, $11,	$36, $C2, $17, $B, 8, 1, $1E, $F
      .BYTE $8B, $11, $17, $10,	$32, $2B, $12, $F, $10,	$F, $13, 1, 5, $52, 8, $26; $10
      .BYTE $5C, $18, $45, $10,	$49, $F, $72, $18, 8, $18, $96,	$A, 8, $23, $FF; $20
LevelData_3_3_Area1:
      .BYTE $A0, $EA, $33, $19, $55, 1, $B, $2D, $6C, 9, 8, $39, $F0, $5C, $F0, $75
      .BYTE $F1, $1C, $F1, $55,	$82, $A8, $22, 5, $55, $A, 8, $46, $F1,	$9C, $F1, $D5; $10
      .BYTE $AC, $A, 8,	$53, $D, $82, $19, $81,	$1A, $80, $B, $80, $C, $80, $F0, $5C; $20
      .BYTE $F0, $95, $F0, $FC,	$F2, $B9, $14, 8, $13, $11, $2A, 3, $26, 5, $24, $C; $30
      .BYTE $28, $F0, $14, $F1,	$CA, $FF	  ; $40
LevelData_3_3_Area2:
      .BYTE $20, $E0, $93, $19, $15, $AB,	$18, $A, 8, $70, $26, $80, 7, $80, 8, $80
      .BYTE 9, $80, $A,	$80, $F0, $35, $C4, $31, $36, $33, $3A,	$32, $34, $29, $16, $33; $10
      .BYTE $33, $32, $36, $33,	$3A, $33, $36, $33, $42, $34, $12, $30,	3, $29,	5, $29;	$20
      .BYTE 6, $30, $D,	$29, $12, $30, $F0, $14, $12, $30, 4, $28, 9, $32, $12,	$34; $30
      .BYTE $1A, $29, $16, $29,	$C, $84, $D, $84, $28, $83, 9, $83, $24, $81, 5, $81; $40
      .BYTE $42, $38, $D, $A, 8, $40, $E, $A8, $2E, 5, $F1, $B7, $87, $2C, $69,	$AF; $50
      .BYTE $F0, $54, $F1, $D6,	$76, $AE, $99, $A5, $F0, $57, $83, 0, $C, 0, $17, $31; $60
      .BYTE $16, $33, $15, $35,	$16, $33, $1D, $A, 8, $43, $3D,	$AC, $F0, $56, $F0, $94; $70
      .BYTE $F1, $B6, $F1, $D5,	$16, $33, $45, $35, $15, $30, $A, $30, $15, $30, $A, $30; $80
      .BYTE $15, $35, $46, $33,	$38, $82, $11, $A9, 7, $80, 9, $80, $3B, $84, $29, $80;	$90
      .BYTE $A,	$80, $C, $80, $D, $80, $37, $84, $25, $80, 6, $80, 8, $80, 9, $80; $A0
      .BYTE $32, $31, $F0, $14,	$3C, $82, $1B, $80, $D,	$80, $3D, $31, $3C, $82, $1B, $80; $B0
      .BYTE $D,	$80, $23, $A, 8, $20, $F0, $1A,	$F1, $74, $F1, $A0, $FF; $C0
LevelData_3_3_Area3:
      .BYTE $20, $E0, $67, $19, $AE, $30,	$12, $A, 8, $33, $E, $AE, $2A, $87, $B,	$87
      .BYTE $F0, $94, $F1, $BA,	$2C, $31, $1C, $A9, $52, $AF, 4, $A4, 6, $A4, 8, $A4; $10
      .BYTE $A,	$A4, $F0, $D4, $93, $3B, $AA, $31, $3A,	$32, $F1, $5A, $3C, $32, $68, $31; $20
      .BYTE $36, $33, $12, $A, 8, $36, $F0, $1B, $F0, $98, $F1,	$BB, $A6, $31, $48, $31; $30
      .BYTE $36, $33, $F0, $F8,	$66, $31, $36, $33, $68, $31, $F0, $3B,	$F1, $58, $36, $33; $40
      .BYTE $66, $31, $36, $33,	$1A, $A, 8, $21, $F0, $9B, $F1,	$A0, $FF; $50
LevelData_3_3_Area4:
      .BYTE $20, $E0, $37, $19, $A0, $37,	$1B, $A, 8, $60, $27, $38, $F0,	$9E, $F0, $F3
      .BYTE $F1, $5E, $F1, $D3,	$26, 4,	$10, $37, $37, $38, $26, 4, $10, $37, $37, $38;	$10
      .BYTE $26, 4, $10, $37, $F0, $3E,	$F0, $B3, $F0, $FE, $F1, $73, $F1, $BE,	$37, $38; $20
      .BYTE $26, 4, $10, $37, $37, $38,	$26, 4,	$10, $37, $37, $38, $F0, $53, $F0, $9E;	$30
      .BYTE $F1, $13, $F1, $5E,	$F1, $D3, $26, 4, $10, $37, $37, $38, $26, 4, $10, $37;	$40
      .BYTE $43, $A, 8,	$22, $F0, $3E, $F0, $B3, $F0, $FE, $F1,	$59, $F1, $A0, $FF; $50
LevelData_3_3_Area5:
      .BYTE $20, $E0, 7, $19, $54, $2C, $C, $2C, $57, $32, $14, $A, 8, $50, $F0, $41
      .BYTE $F1, $A0, $FF			  ; $10
LevelData_3_3_Area6:
      .BYTE $80, $FD, $40, $1A, $3A, $10,	$27, $11, $35, $34, $15, $34, $15, $34,	$15, $34
      .BYTE 7, $A, 8, $30, $15,	$31, 8,	$31, $E, $24, $6A, $10,	$25, $11, $54, $40; $10
      .BYTE 5, $6B, $8A, $10, $2E, $11,	$50, $6F, $F0, 8, $98, $10, $60, $63, 6, $68; $20
      .BYTE $F,	$40, $F2, $29, $10, $14, $10, $95, $42,	$F0, $4D, $F1, $6B, $F1, $E8, $F5; $30
      .BYTE 8, $80, $FF				  ; $40
LevelData_3_3_Area7:
      .BYTE $AA, $F8, $17, $22, $6E, $A4,	$F0, $5C, $F0, $DD, $F1, $5C, $F1, $D9,	$F2, $65
      .BYTE $A4, $2A, $33, $F0,	$DC, $F1, $F8, $FF; $10
LevelData_4_1_Area0:
      .BYTE $80, $EA, $90, $10, $2C, $10,	$1E, $11, $44, $39, $E,	$3F, $F0, $82, $F1, $D6
      .BYTE $F6, 5, $9A, $10, $6E, $32,	$A8, $11, $1B, $10, $43, $34, $31, $32,	8, $3F;	$10
      .BYTE $6B, $11, $68, $3F,	$38, $36, $7C, $11, $4E, $2D, $1E, $37,	$2A, $3C, $F2, $84; $20
      .BYTE $26, $A, $54, $18, $39, $72, $10, $16, $11,	$45, $3A, $A, $3B, $32,	$3F, $78; $30
      .BYTE $10, $57, $3F, $CE,	$10, $37, $33, $1A, $31, $1B, $31, $1B,	$32, $1B, $33, $5E; $40
      .BYTE $8B, $F, $8B, $21, $11, $27, $26, 8, $21, $16, $F3,	$A, $32, $24, $21, $11;	$50
      .BYTE $2B, 3, $F6, $10, $32, $B, $23, $F5, 9, $10, $1A, $F2, $FF;	$60
LevelData_4_1_Area1:
      .BYTE $80, $E8, $90, $12, $22, $10,	$17, $11, $52, $39, $F1, $82, $B8, $10,	$2C, $11
      .BYTE $F0, $C1, $F6, 1, $E1, $10,	$3B, $F, $F1, $A2, $F6,	2, $A3,	$10, $1A, $11; $10
      .BYTE $1E, $F, $2A, $F, $18, $F, $D, $F, $26, $F,	$F0, $81, $F6, 1, $99, $10; $20
      .BYTE $1E, $11, $3E, $F, $B0, $10, $1A, $10, $4A,	$F, $28, $F, $F0, $80, $83, $11; $30
      .BYTE $17, $10, $4D, $83,	$E, $83, $F, $83, $1C, $82, $1B, $81, $1A, $80,	$F1, $4D; $40
      .BYTE $F6, 2, $6B, $10, $F0, 2, $F1, $40,	$F6, 1,	$F2, $47, $10, $1A, $11, $4E; $50
      .BYTE $80, $F, $80, $35, $80, 6, $80, 7, $80, $F0, $A0, $F6, 2, $F1, 1, $F1; $60
      .BYTE $6C, $65, $11, $37,	$42, $30, $80, $F0, $22, $F1, $CA, $F5,	$A, 0, $FF; $70
LevelData_4_1_Area2:
      .BYTE $80, $EA, $10, $10, $AC, $3C,	$F0, $8C, $F1, $88, $C8, $12, $F5, $A, $10, $F1
      .BYTE $2A, $FF				  ; $10
LevelData_4_2_Area0:
      .BYTE $80, $E8, $90, $10, $32, $10,	$14, $11, $17, $C, $F5,	$A, 1, $C, $10,	$4F
      .BYTE $38, $2B, $34, $23,	$33, 7,	3, 8, $33, $4C,	$10, $78, $3F, $22, $10, $A; $10
      .BYTE $11, $7C, $10, $68,	$3F, $A0, $11, $58, $3F, $26, $10, $74,	$10, $12, $11, $58; $20
      .BYTE $3F, $2C, $10, $76,	$10, $3E, $10, $38, $3F, $88, $10, $1A,	$11, $96, $3F, $74; $30
      .BYTE $10, $52, $3F, $3C,	$10, $54, $10, $17, $11, $62, $3A, $19,	$34, $1A, $34, $1B; $40
      .BYTE $35, $62, $10, $B, $10, $1A, $11, $27, $A, $A, $21,	$26, $E2, $33, $37, $FF; $50
LevelData_4_2_Area1:
      .BYTE $80, $F6, $90, $28, $4C, $10,	$1E, $11, $49, $26, $A,	$21, $B, $21, $18, $B5
      .BYTE $F,	$2B, $19, $2E, $78, $A,	$A, $19, $26, $E4, $1F,	$34, $42, $BD, $15, $2E; $10
      .BYTE $67, $29, $B, $29, $2A, $32, $20, $33, $45,	$B4, $D, $B4, $16, $2E,	$E, $2E; $20
      .BYTE $63, $29, $22, $33,	$3B, $52, $16, $52, $B,	$F2, $16, $F2, $9D, $29, $12, $26; $30
      .BYTE $10, $F2, $14, $30,	$14, $31, $15, $31, $27, $31, $B, $B4, $1C, $2E, $56, $29; $40
      .BYTE $12, $10, $E, $10, $18, $11, $19, $34, $54,	$B6, $25, $2E, $6F, $11, $1B, $29; $50
      .BYTE $C,	$10, $70, $B4, 9, $B5, $11, $2E, $A, $2E, $65, $34, $2C, $33, $52, $B8;	$60
      .BYTE $25, $2E, $80, $3F,	$43, 8,	$18, $B5, $12, $F3, $19, $2E, $75, $10,	$2C, $10; $70
      .BYTE $18, $23, $F5, $A, $30, $B,	$11, $10, $31, 7, $42, $15, $46, $15, $F6, $FF;	$80
LevelData_4_2_Area2:
      .BYTE $80, $E8, $30, $30, $28, $10,	$1C, $11, $52, $39, $F1, $87, $A6, $10,	$53, $F
      .BYTE $12, $29, $D, $26, $3E, $7F, $F0, $4C, $F1,	$CD, $C3, $29, 6, $29, 9, $29; $10
      .BYTE $C,	$29, $3E, $77, $F0, $33, $BE, $B, $A, $40, $18,	$2D, $F0, $5B, $F0, $D1; $20
      .BYTE $F1, $CA, $FF			  ; $30
LevelData_4_2_Area3:
      .BYTE $91, $EA, $20, $32, $81, $13,	$A, $33, $F0, $4C, $F0,	$AB, $F1, $E8, $F2, $A3
      .BYTE $3B, $F0, $D, $F0, $48, $F0, $70, $F1, $F7,	$F2, $F0, $30, $F0, $77, $F0, $8F; $10
      .BYTE $F1, $10, $F1, $8A,	$F5, $B, 0, $FF	  ; $20
LevelData_4_3_Area0:
      .BYTE $91, $EA, 2, $11, $4B, $14, $B, $11, $D, $A8,	$F0, $54, $F0, $D3, $F1, $15
      .BYTE $F1, $CA, $FF			  ; $10
LevelData_4_3_Area1:
      .BYTE $80, $E1, $91, 0, 0, $8A, $2A, $10, $1D, $11,	$14, $2B, $14, $F, $33,	$F
      .BYTE 5, $F, $AA,	$CB, $27, $21, $16, $C8, $12, $26, 4, $21, $11,	$C6, $14, $B; $10
      .BYTE $B,	0, $AC,	$10, $F1, $16, $F6, 5, $E0, $11, $25, $10, $D4,	$10, $C, $10; $20
      .BYTE $18, $11, $F2, $57,	$51, $A, $50, $16, $F4,	$14, $51, $14, $F1, $13, $50, $12; $30
      .BYTE $F1, $E, $64, $53, $18, 9, $18, $8B, $A, $B, $26, $23, $69,	$F0, $68, $F1; $40
      .BYTE $F6, $54, $18, $A, $18, $89, $A, $B, $36, $28, $6C,	$F0, $88, $55, $18, $B;	$50
      .BYTE $18, $89, $A, $B, $60, $25,	$6B, $F0, $16, $F0, $A8, $51, $18, $A1,	$62, $F0; $60
      .BYTE $D6, $FF				  ; $70
LevelData_4_3_Area2:
      .BYTE $20, $E0, $60, 9, $44, $A, $B, $41, $21, $34,	$A, $34, $27, $31, $31,	$35
      .BYTE 8, $36, $21, $33, 6, $32, $A, $34, $F0, $54, $24, $3A, $31,	$3A, $25, $35; $10
      .BYTE $2B, $33, $37, $33,	$34, $34, $31, $34, 8, $36, $2A, $34, $11, $32,	$1C, $32; $20
      .BYTE $12, $33, $23, $34,	$31, $39, $2C, $32, $39, $32, $34, $32,	$31, $33, $B, $33; $30
      .BYTE $37, $31, $D, $31, $21, $78, $1D, $31, $F1,	$BA, $F1, $D4, $36, $35, $31, $3A; $40
      .BYTE $34, $3A, $31, $33,	$33, $33, $1D, $31, $25, $33, $C, $32, $38, $33, $35, $33; $50
      .BYTE $33, $32, $D, $31, $21, $36, $2A, $32, $35,	$32, $C, $31, $23, $32,	$21, $31; $60
      .BYTE 9, $33, $14, $A, $B, $16, $66, $78,	$F1, $3B, $F1, $C0, $FF; $70
LevelData_4_3_Area3:
      .BYTE $20, $E0, $62, 9, $37, $A, $B, $42, $26, $33,	$44, $3A, $31, $78, $F0, $41
      .BYTE $F1, $BA, $F1, $C1,	$5A, $74, $37, $29, $99, $29, $F0, $77,	$68, $29, $D9, $29; $10
      .BYTE $88, $A, $B, $50, $12, $29,	$15, $35, $F0, $D3, $20, $35, $A, $35, $45, $35; $20
      .BYTE $32, $3B, $41, $3A,	$F0, $21, $44, $3A, $41, $3A, $34, $3A,	$31, $3A, $3C, $32; $30
      .BYTE $38, $33, $34, $33,	$31, $32, $16, 9, $B, $17, $B, $33, $21, $38, $F1, $7A;	$40
      .BYTE $F1, $C0, $FF			  ; $50
LevelData_4_3_Area4:
      .BYTE $80, $E8, $32, $18, $5D, $E2,	$4F, $E1, $91, $41, 4, $41, 7, $41, $A,	$41
      .BYTE $D,	$41, $12, $18, 8, $18, $5B, $A,	$B, $20, $1F, $26, $13,	$6C, $6F, $2D; $10
      .BYTE $12, $41, 5, $41, 8, $41, $B, $41, $E, $41,	$13, $18, 9, $18, $58, $A; $20
      .BYTE $B,	$30, $11, $22, $10, $6C, $FF	  ; $30
LevelData_4_3_Area5:
      .BYTE $20, $E0, 2, 9, $56, $32, $34, $36, $27, $A, $B, $33,	$21, $3D, $F0, $21
      .BYTE $F1, $A0, $FF			  ; $10
LevelData_4_3_Area6:
      .BYTE $A0, $EA, $10, $1A, $62, $3D,	$46, $A, $B, $18, $22, $3D, $F0, $50, $90, $34
      .BYTE $51, $42, $10, $34,	$F0, $B7, $F0, $EF, $F1, $2E, $F1, $6F,	$F1, $97, $F1, $CA; $10
      .BYTE $F5, $B, $70, $FF			  ; $20
LevelData_4_3_Area7:
      .BYTE $2A, $F5, $F,	$12, $54, $32, 9, $32, 7, 0, 8,	0, $43,	$31, $B, $31
      .BYTE $32, $40, 7, 0, 8, 0, 9, 0,	$D, $40, $F0, $35, $F6,	4, $F0,	$53; $10
      .BYTE $F0, $D5, $F6, 2, $F0, $F5,	$F6, 4,	$F1, $13, $F1, $95, $F6, 5, $F1, $A0; $20
      .BYTE $F6, 2, $F1, $C0, $F6, 4, $FF	  ; $30
LevelData_4_3_Area8:
      .BYTE $81, $E2, $20, 0, 0, $86, 1, $86, 2, $86, $1B, $10, $25, $16,	$1C, $C5
      .BYTE $E8, $16, $4A, $C8,	$3C, $B, $C, $10, $2B, $82, $C,	$82, $D, $82, $E, $82; $10
      .BYTE $F,	$82, $F1, $48, $41, $10, $E, $10, $13, $11, $53, $C8, $50, $82,	1, $82;	$20
      .BYTE 4, $82, 5, $82, 6, $82, 9, $82, $A,	$82, $B, $82, $C, $82, $D, $82;	$30
      .BYTE $F4, $F2, $3C, $16,	$F2, $37, $16, $FF; $40
LevelData_5_1_Area0:
      .BYTE $91, $EA, $80, $11, $83, $13,	$C, 1, $1B, $2A, $D, $26, $3E, $54, $F0, $71
      .BYTE $F1, $D4, $73, $FC,	$38, $87, 9, $87, $A, $87, $35,	$84, 6,	$84, 7,	$84; $10
      .BYTE $F0, $68, $90, $FF,	$F2, $40, $FF, $62, $84, 3, $84, 4, $84, 5, $84, 6; $20
      .BYTE $84, 7, $84, $90, $FF, $2D,	$88, $E, $88, $F, $88, $24, $86, 5, $86, 6; $30
      .BYTE $86, 7, $86, $B0, $FF, $20,	$88, 1,	$88, $4F, $84, $79, $2B, $11, $27, 2; $40
      .BYTE $26, $10, $FF, 0, $81, 1, $81, 2, $81, $2D,	$88, $E, $88, $F, $88, $40; $50
      .BYTE $84, 1, $84, 2, $84, 3, $84, $26, $82, 7, $82, 8, $82, 9, $82, $70;	$60
      .BYTE $FF, $23, $88, 4, $88, 5, $88, $9A,	$2D, $36, 0, $A, 0, $10, $F0, $32; $70
      .BYTE $80, 3, $82, 4, $80, 8, $81, $4E, $B, $C, $20, $14,	$26, 6,	$53, $F0; $80
      .BYTE $34, $F0, $CD, $F0,	$F4, $F1, $4D, $F1, $74, $F1, $92, $FF;	$90
LevelData_5_1_Area1:
      .BYTE $91, $F0, $13, $12, $6B, $32,	$51, $B, $C, $18, $D1, 0, $F0, $F, $F0,	$B0
      .BYTE $F1, $AA, $F5, $D, 0, $FF		  ; $10
LevelData_5_1_Area2:
      .BYTE $91, $EA, $10, $11, $F0, $5B,	$F2, $F0, $11, $F1, $AA, $C, $A9, $F5, $D, $10
      .BYTE $FF					  ; $10
LevelData_5_2_Area0:
      .BYTE $81, $E0, $90, 0, $24, $10, $17, $11,	$59, $2A, $A, $52, $18,	$C5, $13, $A4
      .BYTE $33, 5, $F5, $D, 1,	$52, $10, 9, $16, $27, $16, 8, $16, $1B, $16, $F1; $10
      .BYTE $21, $AD, $16, $F, $16, $15, $10, $E, $16, $88, $21, $F1, $A2, $5D,	$2B, $3C; $20
      .BYTE $10, $1F, $11, $17,	6, $F5,	$D, $40, $15, $2A, 8, $22, 9, $22, $A, $21; $30
      .BYTE $F1, $88, $F1, $A0,	$C7, $11, $B, $10, $1A,	$10, $F2, $18, $16, $1B, $16, $2F; $40
      .BYTE $11, $22, $16, $14,	$16, $5C, $2A, $F0, 1, $F1, $28, $F1, $60, $F1,	$A8, $F1; $50
      .BYTE $E2, $49, $16, $22,	$10, 5,	$16, $5F, $86, $55, $81, 9, $81, $F0, $48, $F1;	$60
      .BYTE $62, $F1, $C8, $3C,	$10, $1F, $11, $21, $16, 5, $16, $B, $21, $C, $2A, $D; $70
      .BYTE $21, $E, $2D, $1A, $C4, $43, $85, $15, $84,	$21, $82, $F0, $E2, $95, $22, 6; $80
      .BYTE $28, $F1, $88, $9D,	$8A, $E, $8A, $F, $8A, $22, $10, $25, $11, $1B,	$16, $27; $90
      .BYTE $12, $F5, $D, $23, $F0, 1, $FF	  ; $A0
LevelData_5_2_Area1:
      .BYTE 1, $F3, $30, $28, $F,	$85, $48, $C, $4E, $B, $D, $30,	$29, $E2, $C, $84
      .BYTE $D,	$84, $32, $10, $F0, $DE, $24, $11, $2F,	$85, $1A, $10, $52, $E1, $F0, $53; $10
      .BYTE $F1, $1E, $78, $D, $1D, $8C, $23, $10, $24,	$11, $39, $10, $C, $83,	$12, $E1; $20
      .BYTE $55, $E1, $52, $10,	$6A, $10, $25, $11, $10, $E7, 8, 3, 9, $E4, $F5, $D; $30
      .BYTE $19, $F4, $46, $C, $F3, 6, $D, $FF	  ; $40
LevelData_5_2_Area2:
      .BYTE 1, $F5, $60, $29, $14, $10, $2C, $11,	$11, $B, $D, $20, $22, $6B, 7, 1
      .BYTE $36, $10, $29, $11,	$32, $70, $D, $70, $12,	$8E, $D, $8E, $E3, $70,	$C, $70; $10
      .BYTE $2B, $70, $1B, $83,	$4B, $8F, $17, $70, $17, $86, $18, $70,	$18, $87, 4, $70; $20
      .BYTE $14, $81, $3A, $70,	$F0, $16, $1A, $89, $74, $70, $B, $82, $14, $81, $15, $70; $30
      .BYTE $36, $70, $16, $85,	$F1, $57, $99, $70, $19, $88, $48, $70,	$18, $83, $F2, $F0; $40
      .BYTE $96, $F0, $D5, $F1,	$14, $F2, $3E, $70, $1E, $85, $2D, $81,	$2D, $B, $D, $50; $50
      .BYTE $11, $70, $14, $60,	7, $60,	$A, $60, $24, $F7, $F1,	$56, $FF; $60
LevelData_5_2_Area3:
      .BYTE $18, $E3, $11, 1, $F5, $D, $13, $64, $31, $A,	$31, $13, $30, 6, $30, 9
      .BYTE $30, $C, $30, $35, $35, $28, $25, $F0, $44,	$F0, $65, $F0, $86, $F0, $A7, $F1; $10
      .BYTE $86, $F1, $A8, $F1,	$C4, $45, $35, $23, $32, $A, $32, $25, $21, 8, $26, $F0; $20
      .BYTE 2, $F0, $21, $F0, $C0, $FF		  ; $30
LevelData_5_2_Area4:
      .BYTE $81, $EA, $20, $12, $82, $B, $D, $36,	$2A, $67, $2A, $FF, $F0, $6C, $F1, $48
      .BYTE $53, $10, $26, $11,	$3E, $6D, $34, $69, $2A, $F3, $F1, $CC,	$55, $10, $A0, $F9; $10
      .BYTE $F0, 8, $F1, $4C, $F1, $8A,	$F5, $E, 0, $FF; $20
LevelData_5_2_Area5:
      .BYTE $91, $EA, $10, $11, $F0, $70,	$F2, 9,	$A9, $F5, $E, $10, $F0,	$F, $F1, $8A
      .BYTE $FF					  ; $10
LevelData_5_3_Area0:
      .BYTE $81, $E8, $92, 0, $22, $10, $16, $11,	$28, 8,	$15, $21, 6, $21, $B, $26
      .BYTE $46, $A4, $F5, $E, 1, $26, 5, $F0, $82, $F0, $C3, $F1, $84,	$F1, $C0, $7D; $10
      .BYTE $11, $3F, $29, $1D,	$29, $13, $16, 4, $16, $18, $29, $C, $82, $D, $82, $27;	$20
      .BYTE $26, 8, $21, 9, $21, $52, $10, $16,	$11, $55, $29, $21, $82, 4, $82, $A; $30
      .BYTE $82, $C, $29, $F, $26, $17,	$81, 9,	$29, $1C, $2B, $F1, $C1, $58, $10, $1B;	$40
      .BYTE $11, $1C, $10, $60,	$21, 1,	$21, 2,	$21, 3,	$21, $C, $D2, $17, $29,	$D; $50
      .BYTE $F,	$F0, $C0, $44, $1F, $9C, $D5, $6C, $1F,	$32, $10, $18, $11, $3B, $21, $11; $60
      .BYTE $21, $A, $D3, $25, $C2, $F0, $88, $F1, $20,	$F2, $9A, $16, $B, $16,	$90, $10; $70
      .BYTE $13, $11, 8, $10, $5D, $83,	$3F, $25, $F1, $C4, $3C, $1F, $63, $2A,	5, $26;	$80
      .BYTE 7, $2A, $34, $83, $C, $DC, $28, $A3, $F5, $E, $24, $11, $2D, $18, 5, $F1; $90
      .BYTE $80, $5B, $10, $1E,	$11, $5A, $16, $F1, $88, $FF; $A0
LevelData_5_3_Area1:
      .BYTE $91, $EA, $42, $11, 4, $1F, $7E, $D7,	$18, $B, $E, $33, $F0, $4C, $7C, $1F
      .BYTE $6A, $21, $18, $DB,	$F0, $88, $F1, $2C, $F2, $7D, $32, $12,	$D2, $13, $D2, 9; $10
      .BYTE $21, $3E, $24, $F1,	$68, $F1, $8D, $C2, $83, $35, $25, 8, $21, $A, $21, $C;	$20
      .BYTE $21, $E, $21, $F0, $15, $37, $A5, $F5, $E, $18, $4A, 0, $1A, 4, $12, $80; $30
      .BYTE 3, $80, $60, $26, $F0, $5A,	$F0, $95, $F0, $EE, $F1, $CA, $FF; $40
LevelData_5_3_Area2:
      .BYTE $18, $E0, $61, $11, $68, $13,	$E, $40, $28, $33, $12,	$31, $24, $31, $26, $31
      .BYTE $F0, $8A, $F0, $B3,	$F1, $2A, $F1, $D3, $29, $31, $2C, $31,	$12, $31, $25, $31; $10
      .BYTE $27, $32, $22, $32,	$C, $31, $35, $31, $28,	$32, $F0, $4A, $F0, $D3, $F1, $2A; $20
      .BYTE $F1, $B3, $2C, $31,	$12, $32, $25, $32, $38, $32, $3B, $32,	$14, $34, $F0, $2A; $30
      .BYTE $F0, $F3, $F1, $4A,	$4C, 0,	$D, 0, $1A, $33, $33, $31, $26,	$81, 7,	$13; $40
      .BYTE $E,	$20, $23, $32, $23, $32, $33, $32, $A, $33, $D,	0, $16,	$85, 7,	$85; $50
      .BYTE $F0, $99, $F0, $CA,	$F1, $B, $F1, $D5, $23,	$32, $1B, $32, $23, $31, $28, 4; $60
      .BYTE $14, $38, $D, 0, $33, $31, $1A, 0, $B, $32,	$23, $31, $F1, $B, $33,	$31; $70
      .BYTE 6, $86, 7, $86, 8, $34, $D,	0, $33,	$31, $1B, $32, $23, $31, $28, 4; $80
      .BYTE $14, $39, $B, 0, $32, 0, $12, 0, $F0, $2A, $12, 0, $16, $33, $F0, $36; $90
      .BYTE $F0, $80, $FF			  ; $A0
LevelData_5_3_Area3:
      .BYTE $81, $E8, $90, $12, 2, $1F, $67, $B, $E, $30,	$1F, $21, $16, $DF, $7A, $1F
      .BYTE $21, $10, $15, $11,	$38, $D9, $10, $21, 1, $21, 2, $21, $AD, $10, $63, $D6;	$10
      .BYTE $E3, $11, $50, $10,	$D, $11, $3A, $1F, $B4,	$10, $C7, $21, 9, $21, $B, $21;	$20
      .BYTE $14, $D9, $98, $E2,	$49, $E2, $13, $E3, $F,	$E2, $30, $E1, $A4, $E3, $1A, $D3; $30
      .BYTE $1C, $F, $38, $10, $E, $D2,	$1F, $F, $54, $10, $28,	$11, $52, $DE, $1A, $F;	$40
      .BYTE $5C, $89, $D, $89, $E, $89,	$F, $89, $8A, $81, $B, $81, $F0, $8D, $F1, $C; $50
      .BYTE $F5, $E, $50, $FF			  ; $60
LevelData_5_3_Area4:
      .BYTE $AA, $EA, $12, $22, $F0, $4F,	$F0, $CC, $F1, $4F, $F1, $D7, $F1, $EF,	$F2, $F0
      .BYTE $16, $F0, $88, $F0,	$B6, $F0, $C1, $F0, $EC, $F1, $EA, $7D,	$91, $E, $91, $1C; $10
      .BYTE $90, $18, $37, $FF			  ; $20
LevelData_6_1_Area0:
      .BYTE $80, $ED, $90, $18, 0, $8C, 1, $8C, 2, $8C, 3, $8C, $4C, $10,	$59, $16
      .BYTE $F1, $6D, $F6, 1, $AD, $10,	$2C, $11, $64, $D1, 9, $D1, $68, $2B, $2A, $10;	$10
      .BYTE $55, 6, $2A, $D1, $F5, $F, $60, $F1, $CD, $F6, 0, $66, $10,	$79, $F, $10; $20
      .BYTE $F,	$11, $F, 7, $F,	$F1, $8D, $F6, 2, $64, $11, $6F, $16, $32, $D1,	7; $30
      .BYTE $D1, $F1, $CD, $F6,	0, $68,	$10, $7E, 7, $2A, $D1, $F0, $4D, $F6, 1, $72; $40
      .BYTE $11, $14, $10, $51,	7, $E, $94, $26, $D1, $F0, $D, $F6, 0, $F1, $EC, $F6; $50
      .BYTE 3, $56, $10, $43, $F, 9, $F, $16, $F, $11, $F, 7, $F, $14, $21, 8; $60
      .BYTE $26, 5, $F,	$A, $F,	$F0, $C, $F6, 0, $94, $10, $2D,	$F, $2F, $F, $17; $70
      .BYTE $F,	$B, $F,	$7C, $89, $D, $89, $E, $89, $F,	$89, $44, $10, $17, $54, 9; $80
      .BYTE $2D, $17, $34, $18,	$33, $17, $34, 9, $B, $F5, $F, $10, $16, $32, $A, $31; $90
      .BYTE $FF					  ; $A0
LevelData_6_1_Area1:
      .BYTE $89, $EA, $30, $19, $46, $13,	$F5, $F, 9, $2D, $81, $E, $81, $F, $80,	$3B
      .BYTE $81, $F0, $4E, $F1,	$75, $F1, $BC, $C0, $80, 1, $80, $44, 0, 9, 6, $F; $10
      .BYTE 0, $10, 7, 2, 7, 4,	6, 5, 8, 6, 8, 7, 7, $A, 7, $B;	$20
      .BYTE 8, $C, 6, $D, 7, $E, 7, $F,	8, $F5,	$F, $50, $E7, 0, $10, 7; $30
      .BYTE 1, 7, 2, 8,	3, 6, 4, 7, 5, 7, 6, 8,	7, 8, $F5, $F; $40
      .BYTE $30, $F1, $71, $AB,	$32, $1B, $32, $1B, $32, $C, 9,	$F5, $F, $20, $1B, $30;	$50
      .BYTE $D,	$30, $F1, $4F, $F1, $CA, $FF	  ; $60
LevelData_6_1_Area2:
      .BYTE $89, $EA, $20, $1A, $83, $13,	$F5, $F, $13, $F0, $51,	$B7, $83, $26, $81, $25
      .BYTE $32, $12, 0, 3, 0, 4, 0, 5,	$32, $F0, $C, $F2, $F0,	$F, $F0, $6A; $10
      .BYTE $F5, $10, 0, $FF			  ; $20
LevelData_6_1_Area3:
      .BYTE $18, $E3, $21, $19, $F5, $F, $12, $65, $31, 9, $31, $36, $33,	$24, $31, $A
      .BYTE $31, $F0, $44, $F0,	$65, $F0, $86, $F0, $A7, $F1, $86, $F1,	$A8, $F1, $CF, $F2; $10
      .BYTE $F0, $4A, $F0, $CD,	$F1, $6B, $F1, $A0, $FF; $20
LevelData_6_1_Area4:
      .BYTE $18, $E3, 1, 1, $64, $32, 9, $32, $34, $30, $B, $30, $15, $35, $28, $24
      .BYTE $F0, $44, $F0, $65,	$F0, $86, $F0, $A7, $F1, $66, $F1, $83,	$F1, $A0, $FF; $10
LevelData_6_1_Area5:
      .BYTE $18, $E3, $21, $19, $F5, $F, $11, $65, $31, 9, $31, $36, $33,	$24, $31, $A
      .BYTE $31, $F0, $44, $F0,	$65, $F0, $86, $F0, $A7, $F1, $86, $F1,	$A8, $F1, $CF, $C6; $10
      .BYTE $82, 7, $82, 8, $82, 9, $82, $26, $27, 7, $22, 8, $22, 9, $27, $F0;	$20
      .BYTE $4A, $F0, $CD, $F1,	$6B, $F1, $A0, $FF; $30
LevelData_6_1_Area6:
      .BYTE $18, $E3, 1, 1, $65, $31, 9, $31, $33, $31, $B, $31, $17, $31, $26, $26
      .BYTE $F5, $F, 2,	$F0, $44, $F0, $65, $F0, $86, $F0, $A7,	$F1, $86, $F1, $A8, $F1; $10
      .BYTE $CF, $F6, 4, $FF			  ; $20
LevelData_6_2_Area0:
      .BYTE $91, $EA, $10, $19, $F0, $54,	$F1, $8F, $F2, $4C, $14, $F5, $10, $10,	$F0, $CE
      .BYTE $F1, $EA, $FF			  ; $10
LevelData_6_2_Area1:
      .BYTE $91, $EA, $90, $18, 0, $E, $93, $B, $F5, $10,	1, $19,	$21, $F0, $81, $F1
      .BYTE $88, $F1, $E0, $F2,	$F0, $88, $F2, $C9, $82, $A, $82, $B, $82, $F3,	$8F, $86; $10
      .BYTE $F2, $70, $26, 1, $21, 4, $2B, $10,	$86, 1,	$86, 4,	$86, 5,	$86, $F3; $20
      .BYTE $F3, $4C, $B, $F5, $10, $20, $40, $21, $10,	$85, 1,	$85, $F0, $8B, $F1, $8A; $30
      .BYTE $FF					  ; $40
LevelData_6_2_Area2:
      .BYTE $91, $EA, $20, $1A, $43, $13,	$F5, $10, $19, $F0, $4E, $F2, $6A, 0, $18, $32
      .BYTE $E,	$31, $34, $31, $28, 0, 9, $44, $F0, $90, $AA, $82, $B, $82, $C,	$82; $10
      .BYTE $D,	$82, $F5, $11, 0, $F0, $E, $F1,	$F, $F1, $CA, $FF; $20
LevelData_6_3_Area0:
      .BYTE $89, $EA, 0, 1, 7, $A9, $F5, $11, $11, $F0, $50, $F1,	$CA, $FF
LevelData_6_3_Area1:
      .BYTE $80, $EC, $40, 0, 0, $89, 1, $89, $A,	$89, $B, $89, $C, $89, $D, $89
      .BYTE $E,	$89, $F, $89, $75, $A, $F5, $11, $44, $24, $42,	$F1, $C, $F6, 1, $60; $10
      .BYTE $89, 1, $89, 2, $89, 3, $89, $28, $10, $1A,	$11, $3E, $F, $28, $A6,	$C; $20
      .BYTE $F,	$F, $F,	$F5, $11, 0, $1A, $26, $18, 5, $38, 5, $F0, $CC, $F6, 0; $30
      .BYTE $48, $11, $1D, $11,	$14, $10, $54, $D1, 8, $D1, $D,	$F, $F0, $4C, $F6, 2; $40
      .BYTE $8A, $10, $14, $10,	$D, $11, $50, $2B, $10,	$F, 4, $D1, $B,	$D1, $F, $2A; $50
      .BYTE $F1, $CC, $F6, 0, $6B, $89,	$C, $89, $D, $89, $E, $89, $F, $89, $A,	$97; $60
      .BYTE $19, $1E, $F5, $11,	$20, $FF	  ; $70
LevelData_6_3_Area2:
      .BYTE $91, $EA, $72, $19, $65, $15,	6, $13,	$F5, $11, $14, $F0, $8F, $C4, $A4, $13
      .BYTE $29, 5, $29, $2D, $A1, $34,	4, $F, 4, $1A, $39, $1A, $39, $1A, $39,	$F1; $10
      .BYTE $5B, $95, $A1, $A, $A1, $3C, 4, $18, $36, $18, $36,	$18, $36, 2, $29, $E; $20
      .BYTE $29, $F0, $91, $F1,	$1B, $F1, $F1, $5D, $83, $36, $25, 7, $25, $12,	$31, $12; $30
      .BYTE $31, $12, $31, $10,	$41, 2,	$31, 4,	$83, $12, $31, 7, $29, $12, $31, 5; $40
      .BYTE $3A, $12, $31, 5, $3A, $F0,	$5C, $F0, $95, $90, $37, $10, $37, $10,	$37, $10; $50
      .BYTE $37, 8, $83, 9, $83, $F, $83, $10, $37, $10, $37, $1A, $54,	0, $37,	$F0; $60
      .BYTE $1C, $F1, $15, $34,	$88, $D, $88, $50, $25,	2, $25,	6, $26,	$A, $25, $C; $70
      .BYTE $25, $E, $25, $38, $80, $19, $83, $A, $83, $32, $25, $F, $25, $F0, $88, $F0; $80
      .BYTE $B5, $F1, $1C, $F1,	$35, $F1, $A8, $F1, $D5, $7D, $A8, $17,	$25, $1D, 5, $12; $90
      .BYTE $81, $23, $83, $31,	$25, 0,	$2D, 4,	$52, 8,	$52, $F0, $5C, $F0, $75, $F1; $A0
      .BYTE $BC, $F1, $D1, $B8,	$12, $F1, $C, $F1, $2A,	$F5, $11, $39, $FF; $B0
LevelData_6_3_Area3:
      .BYTE 0, $F3, $90, 8, $34, $E1, $48, $E1, $67, $12,	$F5, $11, $40, $32, $E1, 9
      .BYTE $E4, $54, $12, $18,	$12, 9,	$12, $A, $12, $B, $12, $C, $12,	$84, $E1, $3A; $10
      .BYTE $E2, $22, $12, $1D,	$12, $16, $E1, $54, $12, $3C, $12, $2B,	$12, $26, $12, $A; $20
      .BYTE $12, $44, $E7, $34,	$12, 5,	$12, $16, $12, $27, $12, 8, $12, $C, $E1, $24; $30
      .BYTE 0, $A, 0, $13, $E1,	$A, $E2, $55, $E4, $36,	$E2, $21, $E1, $4A, $12, $D; $40
      .BYTE $12, $34, $12, $16,	$E2, $52, $12, 4, $E1, $40, $EB, $C, 3,	$D, $E2, $51; $50
      .BYTE $EA, $C, 3,	$D, $E1, $32, $12, 3, $12, 4, $12, 5, $12, 8, $12, 9; $60
      .BYTE $12, $A, $12, $2C, $12, $17, $12, $87, $E1,	$11, $12, $D, $12, $32,	$E2, 9;	$70
      .BYTE $E2, $36, $E1, $18,	$12, $59, $E1, $55, $12, $46, $12, $29,	$12, $F0, $34, $F2; $80
      .BYTE 7, $C, $F5,	$11, $27, $F0, $18, $F0, $57, $F4, $44,	$D, $48, $D, $92, $D; $90
      .BYTE $D,	$D, $F2, $4A, $D, $B, $D, $C, $D, $46, $D, $B3,	$C, $BD, $D, $34; $A0
      .BYTE $D,	$A, $D,	$A2, $D, $BC, $C, $6C, $D, $51,	$D, $D,	$D, $B5, $C, $19; $B0
      .BYTE $C,	$A, $C,	$B, $C,	$96, $D, $CE, $86, $2D,	$84, $2B, $82, $C, $82,	$59; $C0
      .BYTE $8C, $26, $8A, 8, $8A, $97,	3, $17,	3, $FF;	$D0
LevelData_6_3_Area4:
      .BYTE $80, $E8, $40, 0, $24, $10, $28, $C, $F5, $11, $30, $E, $11, $90, $E7, 8
      .BYTE 3, 9, $EF, $50, $10, $28, $11, $6C,	$3F, $1A, $3E, $1E, $3F, $40, $10, $22;	$10
      .BYTE $11, 7, $17, $59, $B, $F5, $11, $50, $2C, $37, $19,	$3C, $1E, $33, $13, $39; $20
      .BYTE $48, $11, $19, $E2,	$12, $10, $F2, $2A, $A,	$F5, $11, $10, $20, $E1, 4, $E1; $30
      .BYTE 9, $E2, $4D, $11, $13, $10,	$28, $11, $FF; $40
LevelData_6_3_Area5:
      .BYTE $A0, $EA, $13, $22, $86, $13,	$F5, $11, $42, $F0, $AF, $C3, $32, 7, $36, $46
      .BYTE 0, $F0, $11, $F0, $6C, $F1,	$4B, $F1, $CA, $F5, $11, $60, $FF; $10
LevelData_6_3_Area6:
      .BYTE $AA, $F8, $13, $2A, $F0, $50,	$F0, $CD, $F1, $C, $F1,	$4F, $F1, $8E, $F2, $8B
      .BYTE $81, $15, $32, $32,	0, 3, 0, 4, 0, 5, 0, 6,	0, 7, 0, 8; $10
      .BYTE 0, $F0, $50, $F1, $37, $F1,	$6F, $F1, $97, $F1, $CA, $FF; $20
LevelData_7_1_Area0:
      .BYTE 0, $F3, 0, 0,	3, $A3,	$F5, $12, $12, $43, $E5, $20, $86, 1, $86, $18
      .BYTE $E3, $3A, $E3, $30,	$EF, $FF	  ; $10
LevelData_7_1_Area1:
      .BYTE $80, $E8, $63, 0, $27, $A9, $74, $23,	$F5, $12, $20, $13, $81, 4, $81, 5
      .BYTE $81, $A, $E3, $22, $E9, $64, $E3, $B6, $80,	$C, $80, $3E, $11, $6C,	$A6, $F5; $10
      .BYTE $12, 0, $2D, $E2, $36, $E5,	$C, 5, $D, $E4,	$41, $10, $7E, 1, $31, $3C; $20
      .BYTE $F,	$33, $2E, $80, $34, $10, $17, $11, $76,	$52, 7,	$2B, $A, $22, $15, $C6;	$30
      .BYTE $1E, $3A, $23, $80,	$D, $80, $3D, $10, $69,	$26, $1D, 0, $1C, $E7, $49, $80; $40
      .BYTE $57, $21, $33, 4, $13, 0, $11, $EE,	$F4, $42, $F, 6, $F, $DC, $F, $26; $50
      .BYTE $F,	$E7, $F, $F2, $90, $F, $1E, $F,	$E3, $F, $1D, $F, $E9, $F, $B6,	$C4; $60
      .BYTE $1D, $F, $18, $A, $F5, $12,	$50, $FF  ; $70
LevelData_7_1_Area2:
      .BYTE $80, $E8, $30, 0, $3C, $11, $19, $10,	$5F, $EB, $34, $E7, $C,	$E9, $54, $10
      .BYTE $1B, $29, $5C, $E6,	$31, $29, 2, $E8, $19, $EA, $5C, $29, $43, $ED,	$23, 4;	$10
      .BYTE 6, $EA, $10, $EE, $18, $E7,	$12, $EF, $23, $EC, $2C, $A7, $F5, $12,	$33, $71; $20
      .BYTE $29, $12, $EB, $20,	$29, 2,	$E5, $28, $E5, $10, $E3, $F4, $95, $F, $DB, $F;	$30
      .BYTE $CF, $F, $12, $F, $AB, $F, $81, $F,	$FF; $40
LevelData_7_1_Area3:
      .BYTE 0, $F3, $30, 0, $64, $A6, $A,	$A6, $22, $E1, 4, 5, 5,	$E4, $A, 5
      .BYTE $B,	$E1, $37, $AA, $21, $E5, 7, 5, 8, $E5, $66, $AB, 8, $AB, $14, $AA; $10
      .BYTE $A,	$AA, $21, $E2, $B, $E2,	$80, $EF, $76, 0, 7, 0,	8, 0, 9, 0; $20
      .BYTE $12, $A7, 5, 0, $A,	0, $15,	0, $A, 0, $10, $E1, 2, 5, 3, $EC; $30
      .BYTE $85, 0, $A,	0, $C, 0, $10, $EF, $30, $EF, $3A, $E3,	$13, $A3, $F5, $12; $40
      .BYTE $23, $20, $E2, 3, 5, 4, $EB, $F4, $35, $C4,	$23, $F, $B, $F, $17, $A; $50
      .BYTE $F5, $12, $40, $C2,	$F, $C,	$F, $FF	  ; $60
LevelData_7_1_Area4:
      .BYTE $A1, $EA, $10, 2, $48, $A		; end of 'BANK8'                                  ; Data continues at the start of bank 9

; ===========================================================================



; -------------------------------------------


      ;.segment	BANK9
;       *	=  $A000
      .BYTE $F5, $12, $30, $C, $33, $F0, $8B, $F1, $6C,	$F2, $74, $39, $1A, $43, $1A, $43; Data continues from LevelData_7_1_Area4
      .BYTE 0, 0, $F0, $8D, $F1, $4C, $F1, $CA,	$F5, $13, 0, $FF; $10 ;	in bank	8
LevelData_7_1_Area5:
      .BYTE $A1, $EA, 0, 1, $4C, 0, $21, $2D, 2, $21, 3, $21, 4, $21, 5, $21
      .BYTE 6, $26, 7, $51, $11, $38, $3A, $32,	$17, $A, $F5, $12, $16,	$F0, $3C, $F1; $10
      .BYTE $EA, $FF				  ; $20
LevelData_7_2_Area0:
      .BYTE $80, $FF, $20, 0, $80, $E5, $D, $E5, $2A, $E5, $36, $E5, $52,	$10, $1A, $10
      .BYTE $1C, $10, $63, $E6,	$B, $E6, $62, $10, $47,	$B5, $52, $65, $27, $E8, $F5, $13; $10
      .BYTE $10, $F4, $20, $C4,	$4F, $F, $F2, $95, $F, $E, $F, $68, $19, $E, $19, $3B; $20
      .BYTE $1D, $E, $1D, $27, $40, $28, $1C, $28, $B, $FF; $30
LevelData_7_2_Area1:
      .BYTE $A1, $EA, $65, 1, $87, $13, $F5, $13,	2, $22,	$3D, $F0, $50, $85, $84, $B
      .BYTE $84, $6F, 4, $10, $3E, $F0,	$34, $F0, $70, $F1, $14, $F1, $50, $F1,	$94, $F1; $10
      .BYTE $B0, $F1, $EF, $D1,	$4E, $42, $7D, $F0, $17, $F0, $50, $CD,	4, $10,	$4C, $D; $20
      .BYTE $82, $E, $43, $20, $7C, $E,	$75, $F1, $14, $F1, $50, $A2, $3D, $27,	$80, $17; $30
      .BYTE $A4, $F5, $13, $60,	$E, $4F, $14, $81, $27,	3, $90,	$35, $3E, $46, $24, $76; $40
      .BYTE $C,	$78, $38, $A6, $F5, $13, $22, $86, $84,	7, $84,	8, $84,	$45, $80, $F1; $50
      .BYTE $2A, $FF				  ; $60
LevelData_7_2_Area2:
      .BYTE $A1, $EA, $95, 1, $88, $A, $F5, $13, $93, $13, $2B, 5, $F, $B, $F, $13
      .BYTE $F,	$D, $F,	$24, $2A, $C, $26, $F0,	$50, $F0, $EF, $F1, $50, $F1, $EA, $38;	$10
      .BYTE $A9, $F5, $13, $86,	$3C, $81, $D, $80, $3A,	$A3, $5C, $81, $1D, $80, $F0, $10; $20
      .BYTE $F0, $91, $F1, $90,	$62, $80, 3, $81, $35, $A3, 7, $A8, $F5, $13, $16, $47;	$30
      .BYTE 3, $13, $81, $12, $80, $17,	3, $F0,	$91, $F1, $A, $28, $A9,	$F5, $13, $73; $40
      .BYTE $3C, $81, $D, $80, $3A, $A3, $5C, $81, $1D,	$80, $F1, $11, $F1, $90, $62, $80; $50
      .BYTE 3, $81, $35, $A3, $53, $81,	8, $A, $F5, $13, $66, $12, $80,	$F0, $91, $F0; $60
      .BYTE $FB, $F1, $4A, $38,	$A7, $F5, $13, $41, $98, $4E, $F1, $11,	$F1, $CF, $97, $AB; $70
      .BYTE $F5, $13, $70, $A7,	3, $F0,	$F0, $F1, $CA, $98, $A,	$F5, $13, $43, $25, $3D; $80
      .BYTE $F0, $AF, $62, $A7,	$F5, $13, $44, $86, $2D, $16, $F, $19, $F, $F, $F, $1C;	$90
      .BYTE $F,	$1B, $26, $D, $2A, $F0,	$6A, $F0, $DC, $7C, $A,	$F5, $13, $32, $52, $F;	$A0
      .BYTE $F0, $6E, $F1, $CA,	$FF		  ; $B0
LevelData_7_2_Area3:
      .BYTE $A1, $EA, $34, 1, $5C, $40, $1C, $A4,	$25, $A, $F5, $13, $63,	$24, $33, $F0
      .BYTE $50, $80, $4F, $10,	$A7, 5,	$A7, $C, $A7, $80, $4F,	$60, $4F, $10, $4F, $10; $10
      .BYTE $A5, $35, $35, $13,	$A, $F5, $13, $29, $20,	$4F, $10, $4F, $90, $A3, $28, $A; $20
      .BYTE $F5, $13, $69, $F0,	$11, $F1, $4A, $FF; $30
LevelData_7_2_Area4:
      .BYTE $A1, $EA, $95, 2, $3F, $A7, $36, $80,	$16, $A3, $43, $A, $F5,	$13, $80, $19
      .BYTE 1, $F0, $50, $80, $87, 1, $87, 2, $3D, $47,	$80, $B, $81, $E, $81, $F; $10
      .BYTE $81, $17, $A4, $F5,	$13, $25, $37, 3, $70, $3F, $55, $F, $B, $F, $14, $F; $20
      .BYTE 8, 9, $F5, $13, $47, $C, $F, $90, $3F, $52,	$80, 5,	$80, $17, $A, $F5; $30
      .BYTE $13, $27, $7A, $A6,	$D, $AB, $20, $37, 8, $87, 9, $87, $8D,	3, $F5,	$13; $40
      .BYTE $28, $F1, $CA, $F3,	$F2, $B7, $A, $F5, $13,	$42, $F0, $50, $E3, 0, 8, 0; $50
      .BYTE $13, $F, 8,	$F, $F2, $A4, $F, $12, $F, 3, $F, 5, $F, 6, $F,	$F1; $60
      .BYTE $4F, $F1, $8A, $F5,	$13, $50, $FF	  ; $70
LevelData_7_2_Area5:
      .BYTE $AA, $EA, $22, $B, $3D, $2C, $62, $48, $F0, $4F, $F0,	$AC, $F1, $6E, $90, $2C
      .BYTE 3, $2C, 6, $2C, $1D, $2C, $4F, $32,	$29, $44, $F1, $3A, $F1, $DC, $90, $2C;	$10
      .BYTE 3, $2C, 6, $2C, 9, $2C, $34, $32, $22, $1A,	$10, $1A, 4, $1A, 8, $F; $20
      .BYTE 9, $44, $12, $41, $10, $45,	$F1, $7A, $F1, $D8, $FF; $30
LevelData_7_2_Area6:
      .BYTE $21, $E0, $97, 1, 8, $A5, $F5, $13, $14, $92,	$4B, $42, $4B, $F0, $55, $F1
      .BYTE $DC, $33, $29, $22,	$4B, $42, $4B, $3C, $29, $22, $4B, $F0,	$75, $F1, $1C, $F1; $10
      .BYTE $95, $42, $4B, $3C,	$29, $22, $4B, $42, $4B, $33, $29, $F0,	$5C, $F0, $D5, $F1; $20
      .BYTE $7C, $22, $4B, $37,	$29, $12, $4B, $7A, $A,	$F5, $13, $30, $F0, $15, $F1, $A0; $30
      .BYTE $F3, $F2, $48, $AA,	$27, $A, $F5, $13, $24,	$28, 3,	$F0, $97, $F1, 0, $78; $40
      .BYTE $AE, $5A, $29, $15,	$29, $38, 3, $3A, $29, $16, $29, $F0, $76, $F1,	$20, $F1; $50
      .BYTE $56, $28, $A4, $18,	3, $3B,	$29, $14, $29, $18, $A5, $28, 3, $46, $29, $A; $60
      .BYTE $29, $18, $AB, $F0,	$20, $F0, $56, $F1, 0, $F1, $36, $28, 3, $B7, $A, $F5; $70
      .BYTE $13, $33, $F0, 0, $F1, $17,	$F1, $A0, $FF; $80
LevelData_7_2_Area7:
      .BYTE $21, $E0, $35, 1, 8, $A4, $F5, $13, $26, $76,	$33, $34, $37, $31, $33, $B
      .BYTE $43, $F0, $54, $35,	$36, $15, $46, $25, $46, $15, $36, $22,	$42, $33, $44, $38; $10
      .BYTE $33, $F0, $F5, $3B,	$42, $26, $73, $C, $31,	$46, $35, $33, $39, $36, $33, $F0; $20
      .BYTE $9C, $F0, $B4, $33,	$49, $32, $49, $2C, $42, $24, $37, $17,	$80, $11, $32, 7; $30
      .BYTE $A4, $F5, $13, $23,	$37, 3,	$F1, $A0, $FF; $40
LevelData_7_2_Area8:
      .BYTE $21, $E0, $64, 1, $28, $A8, $2C, $A, $F5, $13, $40, $29, $45,	$F0, $54, $95
      .BYTE $35, $52, $32, $45,	$33, $48, $34, $34, $37, $32, $33, $2C,	$31, $46, $32, $38; $10
      .BYTE $33, $F0, $95, $35,	$35, $52, $33, $15, $AD, 7, $33, $12, $A, $F5, $13, $90; $20
      .BYTE $22, $32, 5, 3, $A,	$31, $1A, $A9, $2A, 3, $B, $32,	$F1, $5C, $81, $86; $30
      .BYTE $14, $30, 6, $33, $B, $30, $34, $36, $31, $AF, 4, $36, $F0,	$D4, $31, 3; $40
      .BYTE $74, $A6, 6, $A6, 7, $82, 8, $A6, $A, $A6, $D, $AE,	$F0, $20, $F1, $14; $50
      .BYTE $7D, 3, $4E, $A8, $37, $40,	$17, $A6, $F5, $13, $21, $57, 3, $F0, 0, $F0; $60
      .BYTE $94, $F1, $A0, $F4,	$D6, $F, 9, $F,	$53, $F, $46, $F, $3A, $F, $B7,	$F; $70
      .BYTE $2A, $F, $B6, $F, $FF		  ; $80
LevelData_7_2_Area9:
      .BYTE 1, $FE, $30, 0, $28, $10, $4D, $81, $2B, $AD,	$D, $A,	$F5, $13, $83, $2B
      .BYTE 5, $C, $41,	$22, $10, $46, $10, $4C, $AA, $2B, $80,	$C, 5, $11, $10, $28; $10
      .BYTE $11, $4B, $AA, $15,	$10, $1B, 5, $C, $80, $7C, $AA,	$11, $10, $1B, $80, $C;	$20
      .BYTE 5, $24, $35, $14, $35, $14,	$35, $14, $35, $14, $33, 8, $AB, $14, $33, $14;	$30
      .BYTE $33, $18, 5, $77, $A, $F5, $13, $20, $F0, $80, $F1,	$57, $F1, $A0, $FF; $40
LevelData_7_3_Area0:
      .BYTE $FF
; [000000E0 BYTES: BEGIN OF AREA UNUSED-BANK9:A420. PRESS KEYPAD "-" TO	COLLAPSE]
_empty_12420:
      .BYTE $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $40
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $50
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $70
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $80
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $90
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $D0
; [000000E0 BYTES: END OF AREA UNUSED-BANK9:A420. PRESS	KEYPAD "-" TO COLLAPSE]
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
      .BYTE >EnemyPointers_Level_3_2_Area3  ; Unused? Boss-flag Birdo
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
      .BYTE <EnemyPointers_Level_3_2_Area3	  ; Unused? Boss-flag Birdo
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
      .BYTE >EnemyPointers_Level_4_1_Area2  ; ???	Unused area with another Boss Birdo.
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
      .BYTE >EnemyPointers_Level_7_3_Area1  ; Interestingly, the first 4 areas are unique
      .BYTE >EnemyPointers_Level_7_3_Area2  ; though completely empty
      .BYTE >EnemyPointers_Level_7_3_Area3  ; Wonder if they intended on having a	full 7-3
      .BYTE >EnemyPointers_Level_7_3_Area4  ; at some point...
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
      .BYTE $07,$03,$A9,$03,$BC,3,$C6
      .BYTE $05,$01,$9C,$03,$E5
      .BYTE $05,$01,$2C,$02,$4C
      .BYTE $07,$01,$1C,$03,$45,$02,$4C
      .BYTE $05,$01,$95,$14,$D1
      .BYTE $01
EnemyPointers_Level_1_1_Area3:
      .BYTE 3,3,$85
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_1_1_Area4:
      .BYTE 3,$E,$BC
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_1_1_Area5:
      .BYTE 1

      .BYTE 1
      .BYTE 7,$1C,$A7,$44,$A8,$43,$E7
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_1_2_Area0:
      .BYTE 3,$42,$6A
      .BYTE 3,$12,$22
      .BYTE 9,$F,0,$F,$40,$F,$90,$F,$E0
      .BYTE 1
      .BYTE 5,$E,$3C,$E,$6C
      .BYTE 5,6,$53,$D,$83
      .BYTE 5,1,$B6,1,$F6
      .BYTE 1
EnemyPointers_Level_1_2_Area1:
      .BYTE 3,1,$DC
      .BYTE 3,7,$3C
      .BYTE 3,6,$2C
      .BYTE 5,$D,$79,$D,$89
      .BYTE 1
EnemyPointers_Level_1_2_Area2:
      .BYTE 1

      .BYTE 5,$1C,$A7,$44,$A8
      .BYTE 3,$43,$38
      .BYTE 1
EnemyPointers_Level_1_2_Area3:
      .BYTE 5,$3D,$79,$17,$77
      .BYTE 1
EnemyPointers_Level_1_2_Area4:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 3,2,$28
EnemyPointers_Level_1_2_Area5:
      .BYTE 1

      .BYTE 1
      .BYTE 1
EnemyPointers_Level_1_3_Area0:
      .BYTE 3,$42,$38
      .BYTE 5,7,$94,7,$B4
      .BYTE 3,1,$74
      .BYTE 5,$13,$34,$13,$A4
      .BYTE 7,$13,2,$13,$62,$3B,$E6
      .BYTE 5,$3B,$26,$3B,$66
      .BYTE 9,$13,$4A,$3B,$5C,$13,$8A,$3B,$9C
      .BYTE 5,3,$2A,3,$7A
      .BYTE 9,$D,$29,$D,$49,2,$7A,2,$9A
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_1_3_Area1:
      .BYTE 7,$17,$83,$3D,$88,$2E,$8A
      .BYTE 1
EnemyPointers_Level_1_3_Area2:
      .BYTE 7,$2E,$4B,$30,$7C,$30,$C9
      .BYTE 1
      .BYTE 7,$30,$61,$31,$5A,3,$BA
      .BYTE 3,1,$DB
      .BYTE 3,6,$4A
      .BYTE 3,3,$35
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_1_3_Area3:
      .BYTE 3,$31,$C9
      .BYTE 3,$2F,$C6
      .BYTE 9,2,$56,7,$D4,7,$D7,7,$DA
      .BYTE 5,$30,$A7,$30,$F7
      .BYTE 5,$2E,$3A,$2E,$6A
      .BYTE 9,$D,9,$D,$29,$44,$A8,$43,$D7
      .BYTE 1
EnemyPointers_Level_1_3_Area4:
      .BYTE 3,$30,$F6
      .BYTE 3,$5D,$D7
      .BYTE 1
EnemyPointers_Level_2_1_Area0:
      .BYTE 1

      .BYTE 3,$19,$FA
      .BYTE 3,$18,$A7
      .BYTE 5,1,$69,3,$99
      .BYTE 3,$18,$47
      .BYTE 3,3,$F8
      .BYTE 1
      .BYTE 7,$23,$24,1,$27,1,$49
      .BYTE 3,$19,$4A
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_2_1_Area1:
      .BYTE 5,1,$49,1,$6D
      .BYTE 3,1,$D3
      .BYTE 7,1,$40,6,$16,1,$C8
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_2_1_Area2:
      .BYTE 1

      .BYTE 5,$1C,$A8,$44,$A9
      .BYTE 3,$43,$D3
      .BYTE 1
EnemyPointers_Level_2_1_Area4:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 3,6,$6C
EnemyPointers_Level_2_2_Area0:
      .BYTE 3,$42,$5A
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_2_2_Area1:
      .BYTE 1

      .BYTE 3,$19,$8D
      .BYTE 5,$F,$50,$18,$FA
      .BYTE 3,1,$99
      .BYTE 5,$18,$A,$18,$37
      .BYTE 7,$F,$10,$18,$15,$3B,$97
      .BYTE 7,$18,$58,$18,$A8,$18,$E7
      .BYTE 9,$18,$28,$18,$57,$1A,$86,$18,$97
      .BYTE 3,$23,$B5
      .BYTE 3,$23,5
      .BYTE 1
EnemyPointers_Level_2_2_Area2:
      .BYTE 7,3,$B8,3,$F8,3,$FB
      .BYTE 1
      .BYTE 1
      .BYTE 1					  ; ???	This area only has 3 pages, so this should stop	here
      .BYTE 1					  ; But	for some reason	it continues for several more pages
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_2_2_Area3:
      .BYTE 3,1,$8A
      .BYTE 5,1,$C2,1,$67
      .BYTE 7,$E,$A0,1,$78,1,$BD
      .BYTE 3,6,$E2
      .BYTE 1
EnemyPointers_Level_2_2_Area4:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 3,1,$B9
EnemyPointers_Level_2_2_Area5:
      .BYTE 1

      .BYTE 5,$1C,$B4,$44,$B4
byte_BANK9_A8F0:
      .BYTE 3,$43,$B3
      .BYTE 1
EnemyPointers_Level_2_3_Area0:
      .BYTE 3,$42,$17
      .BYTE 1
EnemyPointers_Level_2_3_Area1:
      .BYTE 3,3,$C7
      .BYTE 3,$49,$20
      .BYTE 5,$F,$20,$48,$A0
      .BYTE 1
      .BYTE 1
      .BYTE 3,$48,$80
      .BYTE 1
      .BYTE 3,$49,0
      .BYTE 5,$19,$7A,$1A,$D6
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_2_3_Area2:
      .BYTE 1

      .BYTE 1
      .BYTE 1
EnemyPointers_Level_2_3_Area3:
      .BYTE 3,3,$4B
      .BYTE 5,1,$D5,1,$AA
      .BYTE 5,3,$D2,1,$D5
      .BYTE 3,2,$88
      .BYTE 7,1,$83,1,$A9,1,$1D
      .BYTE 7,1,$B1,1,$89,1,$3D
      .BYTE 3,1,$E3
      .BYTE 1
EnemyPointers_Level_2_3_Area4:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 3,1,$B9
EnemyPointers_Level_2_3_Area5:
      .BYTE 1

      .BYTE 9,1,$15,1,8,1,$F8,1,$CB
      .BYTE 1
      .BYTE 7,$23,$14,3,$39,3,$7B
      .BYTE 3,$18,$67
      .BYTE 7,$18,$A,$44,$3B,$18,$6A
      .BYTE 3,$43,$97
      .BYTE 1
EnemyPointers_Level_2_3_Area6:
      .BYTE 1

      .BYTE 5,$5F,$C5,2,$D0
      .BYTE 1
EnemyPointers_Level_2_3_Area7:
      .BYTE 7,$17,$83,$3D,$87,$2F,$A9
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_1_Area0:
      .BYTE 1

      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_1_Area1:
      .BYTE 3,$49,8
      .BYTE 3,$48,$E
      .BYTE 3,$48,2
      .BYTE 5,$12,$92,$49,9
      .BYTE 3,3,$E5
      .BYTE 5,3,$21,3,$87
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_1_Area2:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_1_Area3:
      .BYTE 1

      .BYTE 3,3,$2B
      .BYTE 3,$25,$12
      .BYTE 3,$23,$95
      .BYTE 3,3,$65
      .BYTE 3,$24,5
      .BYTE 1
EnemyPointers_Level_3_1_Area4:
      .BYTE 1

      .BYTE 7,$43,$93,$1C,$B9,$44,$BA
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_2_Area0:
      .BYTE 5,$42,$42,$49,$40
      .BYTE 5,8,$25,$48,$C0
      .BYTE 1
      .BYTE 3,$48,0
      .BYTE 5,$25,$E6,$49,$80
      .BYTE 1
      .BYTE 5,8,$35,8,$55
      .BYTE 5,6,$A4,6,$CB
      .BYTE 1
      .BYTE 3,6,$96
      .BYTE 1
EnemyPointers_Level_3_2_Area1:
      .BYTE 7,4,$3C,4,$6C,4,$EC
      .BYTE 3,4,$1C
      .BYTE 1
      .BYTE 1
      .BYTE 3,3,$29
      .BYTE 7,2,$29,2,$49,2,$6C
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_2_Area2:
      .BYTE 5,$1C,$B6,$44,$B6
      .BYTE 3,$43,$FA
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_2_Area3:
      .BYTE 1

      .BYTE 3,$5C,$C7
      .BYTE 1
EnemyPointers_Level_3_3_Area0:
      .BYTE 3,$42,$4A
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_3_Area1:
      .BYTE 1

      .BYTE 1
      .BYTE 7,$A,$14,8,$58,$A,$84
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_3_Area2:
      .BYTE 3,$31,$65
      .BYTE 5,$E,$75,$E,$95
      .BYTE 9,$30,5,$31,$55,$D,$AC,$D,$CC
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_3_Area3:
      .BYTE 1

      .BYTE 9,$31,$72,$2E,$84,$2E,$B7,$30,$4C
      .BYTE 7,$2E,$81,$2F,$1A,$31,$DF
      .BYTE 7,$2E,$35,$2E,$96,$2E,$18
      .BYTE 3,$31,$71
      .BYTE 3,$31,$CF
      .BYTE 7,$2F,$20,$31,$70,$2E,$7E
      .BYTE 7,$2F,$71,$30,$8D,$31,$7F
      .BYTE 5,$30,$34,$30,$C7
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_3_3_Area4:
      .BYTE 3,6,$6C
      .BYTE 5,$23,$8D,$23,$CD
      .BYTE 5,2,$57,2,$ED
      .BYTE 1
      .BYTE 5,5,$C2,7,$3B
      .BYTE 5,7,$C4,3,$3D
      .BYTE 3,$E,$D6
      .BYTE 1
EnemyPointers_Level_3_3_Area5:
      .BYTE 3,$15,$6F
      .BYTE 3,$15,$6B
      .BYTE 3,$15,$67
      .BYTE 3,$15,$63
      .BYTE 1
EnemyPointers_Level_3_3_Area6:
      .BYTE $B,$31,$73,$2F,$84,$31,$79,$17,$87,$3D,$89
      .BYTE 1
EnemyPointers_Level_3_3_Area7:
      .BYTE 1

      .BYTE 5,$E,$C9,$E,$E9
      .BYTE 3,$D,$E9
      .BYTE 5,$D,9,$D,$29
      .BYTE 5,$44,$6B,$43,$AA
      .BYTE 1
EnemyPointers_Level_3_3_Area8:
      .BYTE 3,$2F,$22
      .BYTE 5,$2F,$62,$5D,$D6
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_1_Area0:
      .BYTE 1

      .BYTE 5,$29,$96,$13,$B2
      .BYTE 3,$13,$22
      .BYTE $B,$29,9,$29,$29,$13,$35,$29,$D9,$29,$F6
      .BYTE 1
      .BYTE 9,$29,$46,$29,$98,$29,$A6,$29,$F8
      .BYTE 5,$13,$13,$29,$B8
      .BYTE 5,$29,8,$29,$B5
      .BYTE 5,$29,$35,$13,$41
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_1_Area1:
      .BYTE 1

      .BYTE 1
      .BYTE 3,$26,$58
      .BYTE 1
      .BYTE 7,$29,$A,$26,$58,$29,$9A
      .BYTE 5,$29,$3A,$29,$DC
      .BYTE 3,$26,$F6
      .BYTE 1
      .BYTE 5,$29,$3C,$26,$D7
      .BYTE 5,$44,$85,$43,$D4
      .BYTE 1
EnemyPointers_Level_4_1_Area2:
      .BYTE 1
						  ; This area is unused...
      .BYTE 3,$5C,$B8				  ;	it has another lonely Boss Birdo...
      .BYTE 1					  ; and	a fucking billion empty	pages.
      .BYTE 1					  ; Nintendo, what were	you on???
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_2_Area0:
      .BYTE 3,$42,$47
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_2_Area1:
      .BYTE 5,$10,$D3,$10,$F5
      .BYTE 3,$10,$D8
      .BYTE 9,$10,$16,$10,$37,$10,$44,$10,$78
      .BYTE $B,$10,$67,$10,$98,$10,$C7,$10,$E4,$10,$F8
      .BYTE 7,$29,$C8,$29,$E8,$10,$F3
      .BYTE 5,$10,$A6,$10,$D8
      .BYTE $B,$10,$37,$10,$53,$10,$95,$10,$D8,$10,$F4
      .BYTE $B,$10,$3A,$10,$56,$10,$7B,$10,$84,$10,$F7
      .BYTE 7,$10,$23,$10,$66,$29,$B8
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_2_Area2:
      .BYTE 1

      .BYTE 3,$28,$6A
      .BYTE 5,$28,$7A,$28,$FA
      .BYTE 1
      .BYTE 3,$28,$DA
      .BYTE 5,$28,$69,7,$98
      .BYTE 9,$28,$2A,3,$39,$28,$BA,3,$C9
      .BYTE 5,$28,$69,3,$88
      .BYTE 5,$28,$A9,$29,$D3
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_2_Area3:
      .BYTE 1

      .BYTE 3,$26,$C7
      .BYTE 1
      .BYTE 5,4,$99,4,$C9
      .BYTE 1
EnemyPointers_Level_4_2_Area4:
      .BYTE 1

      .BYTE 5,$1C,$B8,$44,$B9
      .BYTE 3,$43,$BA
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_3_Area0:
      .BYTE 3,$42,$2A
      .BYTE 1
EnemyPointers_Level_4_3_Area1:
      .BYTE 1

      .BYTE 3,$1C,$A9
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 3,$10,$18
      .BYTE 1
EnemyPointers_Level_4_3_Area2:
      .BYTE 9,$29,$EA,$29,$EC,$29,$DE,$29,$EE
      .BYTE 3,$29,$EE
      .BYTE 5,$29,$E0,$29,$E2
      .BYTE 3,$29,$8C
      .BYTE 9,$29,$92,$29,$B2,$29,$E9,$29,$EB
      .BYTE 5,$29,$71,$29,$E4
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_3_Area3:
      .BYTE 7,1,$C8,3,$D8,2,$E8
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 7,$29,$72,$29,$82,$29,$7E
      .BYTE 1
      .BYTE 3,$29,$C1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_3_Area4:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_3_Area5:
      .BYTE 9,$17,$72,$3D,$74,$29,$57,$29,$97
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_3_Area6:
      .BYTE 5,$29,$65,$29,$95
      .BYTE 5,$44,$2A,$43,$87
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_3_Area7:
      .BYTE 3,$6A,$24
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_3_Area8:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_4_3_Area9:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_5_1_Area0:
      .BYTE 3,$42,$31
      .BYTE 3,8,$45
      .BYTE 3,$23,$56
      .BYTE 1
EnemyPointers_Level_5_1_Area1:
      .BYTE 1

byte_BANK9_AC69:
      .BYTE 3,$3B,$E4
      .BYTE 9,$3B,$34,$3B,$84,$13,$B2,$3B,$D4
      .BYTE 5,$13,$82,$13,$C2
      .BYTE 5,$13,2,$3B,$A4
      .BYTE 7,$13,$42,$13,$82,$13,$C2
      .BYTE 3,$13,$B2
      .BYTE 5,$3B,$94,$3B,$E4
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_5_1_Area2:
      .BYTE 5,$1C,$C4,$44,$C5
      .BYTE 3,$43,$CA
      .BYTE 1
EnemyPointers_Level_5_2_Area0:
      .BYTE 3,$42,$2A
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_5_2_Area1:
      .BYTE 1

      .BYTE 7,$14,$78,$14,$96,$14,$B8
      .BYTE 9,8,$29,$14,$D6,$14,$E6,$14,$F6
      .BYTE 1
      .BYTE 9,4,$8C,4,$9C,8,$AB,4,$BC
      .BYTE 5,$14,$89,$14,$B9
      .BYTE 5,$14,$55,$14,$95
      .BYTE 7,$14,$17,$25,$38,$14,$57
      .BYTE 5,$D,$26,$D,$46
      .BYTE 5,4,$6A,8,$99
      .BYTE 1
EnemyPointers_Level_5_2_Area2:
      .BYTE 3,$14,$8B
      .BYTE 9,$10,$F2,$14,$68,$14,$8E,6,$DE
      .BYTE $B,$10,2,6,$C5,6,$36,$10,$8E,$10,$DE
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_5_2_Area3:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 5,$13,$55,$13,$85
      .BYTE 1
EnemyPointers_Level_5_2_Area4:
      .BYTE 3,1,$2B
      .BYTE 5,4,$24,4,$B4
      .BYTE 1
EnemyPointers_Level_5_2_Area5:
      .BYTE 1

      .BYTE 7,$13,$73,$1C,$B8,$44,$B9
      .BYTE 3,$43,$B4
      .BYTE 1
EnemyPointers_Level_5_3_Area0:
      .BYTE 3,$42,$3A
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_5_3_Area1:
      .BYTE 3,$49,$80
      .BYTE 1
      .BYTE 3,$47,0
      .BYTE 1
      .BYTE 3,$47,$40
      .BYTE 3,$49,$C0
      .BYTE 3,$49,$C0
      .BYTE 7,9,$2C,9,$7C,9,$AC
      .BYTE 1
      .BYTE 5,9,$58,9,$78
      .BYTE 1
EnemyPointers_Level_5_3_Area2:
      .BYTE 1

      .BYTE 5,$23,$36,9,$C6
      .BYTE 3,9,$36
      .BYTE 5,9,$25,9,$45
      .BYTE 3,$16,$A5
      .BYTE 1
EnemyPointers_Level_5_3_Area3:
      .BYTE 1

      .BYTE 5,$24,$52,$24,$3D
      .BYTE 1
      .BYTE 9,9,$90,9,$B0,$2F,$D5,$30,$4F
      .BYTE 5,$15,$82,$2F,$A8
      .BYTE 7,$30,$41,$15,$84,$31,$8A
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_5_3_Area4:
      .BYTE 1

      .BYTE 1
      .BYTE 5,7,$67,$12,$D2
      .BYTE 1
      .BYTE 3,$12,$F2
      .BYTE 1
      .BYTE 7,$F,$60,3,$92,3,$A6
      .BYTE 5,3,7,3,$55
      .BYTE 5,$1C,$B7,$44,$B8
      .BYTE 3,$43,$B5
      .BYTE 1
EnemyPointers_Level_5_3_Area5:
      .BYTE 1

      .BYTE 3,$61,$A7
      .BYTE 1
EnemyPointers_Level_6_1_Area0:
      .BYTE 3,$42,$4A
      .BYTE 7,$19,$1D,3,$AB,$19,$DD
      .BYTE 3,$18,$5A
      .BYTE 3,$1A,$49
      .BYTE 7,$19,$1D,$19,$5D,3,$7B
      .BYTE 3,$18,$EA
      .BYTE 7,$18,$1A,$19,$AD,$19,$BD
      .BYTE 3,$1A,$E6
      .BYTE 5,$1A,$36,$24,$99
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_6_1_Area1:
      .BYTE 1

      .BYTE 7,$18,$4B,$18,$9A,$15,$FB
      .BYTE 5,$18,$2B,$18,$7B
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_6_1_Area2:
      .BYTE 1

      .BYTE 5,$1C,$C8,$44,$C8
      .BYTE 3,$43,$27
      .BYTE 1
EnemyPointers_Level_6_1_Area3:
      .BYTE 3,1,$5A
      .BYTE 9,1,$41,1,$B4,$17,$85,$3D,$69
      .BYTE 1
EnemyPointers_Level_6_1_Area4:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 5,1,$2A,1,$DA
EnemyPointers_Level_6_1_Area5:
      .BYTE 3,1,$5A
      .BYTE 5,1,$41,1,$B4
      .BYTE 1
EnemyPointers_Level_6_1_Area6:
      .BYTE 3,1,$B8
      .BYTE 1
EnemyPointers_Level_6_2_Area0:
      .BYTE 3,$42,$2A
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_6_2_Area1:
      .BYTE 5,$B,$C,$B,$26
      .BYTE 7,$C,$AB,$C,$C9,$C,$E7
      .BYTE 3,$25,$AB
      .BYTE 7,$10,$55,$10,$85,$10,$A5
      .BYTE 5,$C,$98,$C,$C8
      .BYTE 3,$10,$A3
      .BYTE 7,$C,$63,$C,$65,$C,$67
      .BYTE 7,$C,$65,$C,$93,$C,$C4
      .BYTE 3,$C,$EB
      .BYTE 5,$C,$29,$C,$A9
      .BYTE 1
EnemyPointers_Level_6_2_Area2:
      .BYTE 1

      .BYTE 5,$1C,$CA,$44,$CB
      .BYTE 3,$43,$D4
      .BYTE 1
EnemyPointers_Level_6_3_Area0:
      .BYTE 3,$42,$2A
      .BYTE 1
EnemyPointers_Level_6_3_Area1:
      .BYTE 1

      .BYTE 1
      .BYTE 3,3,$98
      .BYTE 7,3,$48,$1A,$66,$19,$AA
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_6_3_Area2:
      .BYTE 1

      .BYTE 5,$16,$49,$16,$F9
      .BYTE 5,9,$A9,$16,$C9
      .BYTE 3,$D,$F5
      .BYTE 7,$D,$27,$D,$38,$D,$56
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_6_3_Area3:
      .BYTE 1

      .BYTE 9,$14,$95,$14,$A4,$14,$B3,$14,$C2
      .BYTE 7,$14,$A7,$14,$BA,$14,$C8
      .BYTE 3,$14,$34
      .BYTE 7,$14,$4A,6,$75,6,$7E
      .BYTE 3,1,$28
      .BYTE 7,$14,$9C,$14,$AD,$14,$BE
      .BYTE 3,$14,$5C
      .BYTE 3,$14,$93
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_6_3_Area4:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_6_3_Area5:
      .BYTE 1

      .BYTE 7,$43,$97,$1C,$B3,$44,$B4
      .BYTE 1
EnemyPointers_Level_6_3_Area6:
      .BYTE 1

      .BYTE 3,$5F,$B5
      .BYTE 1
EnemyPointers_Level_7_1_Area0:
      .BYTE 3,$42,$2A
      .BYTE 1
EnemyPointers_Level_7_1_Area1:
      .BYTE 1

      .BYTE 1
      .BYTE 1
      .BYTE $D,9,$8B,$C,$94,9,$94,$D,$B8,$C,$E4,9,$E4
      .BYTE 7,9,$2B,$C,$E4,9,$E4
      .BYTE $D,$E,$3B,$C,$54,9,$54,9,$6B,$C,$94,9,$94
      .BYTE 7,$15,$37,$C,$F3,9,$F3
      .BYTE 1
EnemyPointers_Level_7_1_Area2:
      .BYTE 1

      .BYTE 7,2,$A8,6,$B6,6,$CB
      .BYTE 7,$15,$38,3,$DC,6,$F3
      .BYTE 5,$D,$59,6,$AB
      .BYTE 1
EnemyPointers_Level_7_1_Area3:
      .BYTE 1

      .BYTE 7,6,$21,$14,$66,$14,$8B
      .BYTE 7,$31,$87,$31,$D7,$2F,$D9
      .BYTE 5,$31,$E0,$31,$63
      .BYTE 1
EnemyPointers_Level_7_1_Area4:
      .BYTE 1

      .BYTE 7,$43,$9A,$1C,$C5,$44,$C6
      .BYTE 1
EnemyPointers_Level_7_1_Area5:
      .BYTE 5,$31,$B9,$31,$C3
      .BYTE 1
EnemyPointers_Level_7_2_Area0:
      .BYTE 3,6,$F5
      .BYTE 5,6,$58,6,$E8
      .BYTE 3,$E,$74
      .BYTE 1
EnemyPointers_Level_7_2_Area1:
      .BYTE 1

      .BYTE 7,1,$99,1,$D9,$15,$F9
      .BYTE 7,$E,$77,$E,$A7,$E,$C7
      .BYTE 3,$16,$D9
      .BYTE 1
      .BYTE 5,$25,$1C,$25,$BC
      .BYTE 3,$25,$5B
      .BYTE 1
EnemyPointers_Level_7_2_Area2:
      .BYTE 1

      .BYTE 5,$31,$99,$31,$EC
      .BYTE 5,$31,$24,$31,$69
      .BYTE 5,$2F,$96,$2F,$E3
      .BYTE 3,$2F,$3A
      .BYTE 3,$1C,$B7
      .BYTE 1
      .BYTE 7,$1C,$B7,$17,$A4,$3D,$B8
      .BYTE 1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_7_2_Area3:
      .BYTE 7,$2F,$B8,$30,$F3,$2E,$FC
      .BYTE 9,$2F,$34,$2F,$74,$2F,$A4,$30,$AB
      .BYTE 7,$30,$1A,$2F,$79,$30,$F5
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_7_2_Area4:
      .BYTE 9,$2F,$23,$2F,$83,$2F,$E3,$31,$CC
      .BYTE 5,$2F,$BB,$2F,$FB
      .BYTE 3,$2F,$53
      .BYTE 9,$31,$29,$2E,$43,$2F,$A3,$31,$59
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 5,$44,$49,$2D,$B7
      .BYTE 1
EnemyPointers_Level_7_2_Area5:
      .BYTE 1

      .BYTE 1
      .BYTE 5,$4A,$1A,$6C,$A7
      .BYTE 1
EnemyPointers_Level_7_2_Area6:
      .BYTE 3,$2F,$8A
      .BYTE 7,$2E,$73,$31,$85,$2F,$8C
      .BYTE 5,$31,$87,$2F,$8E
      .BYTE 5,$31,$50,$30,$A0
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE $D,$31,$61,$31,$A1,$2F,$A3,$31,$68,$2F,$5A,$2F,$AA
      .BYTE 5,$2F,$61,$2F,$A1
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_7_2_Area7:
      .BYTE 9,3,$76,7,$69,7,$99,$30,$8F
      .BYTE 9,$2F,$A2,$31,$73,$31,$68,$2E,$AD
byte_BANK9_AFDD:
      .BYTE 7,$31,$80,$31,$97,$2E,$7F
      .BYTE 5,7,$80,1,$84
      .BYTE 1
EnemyPointers_Level_7_2_Area8:
      .BYTE 5,$31,$9C,$30,$7E
      .BYTE 7,$2F,$35,$30,$77,$31,$A8
      .BYTE 5,$31,$67,$31,$BA
      .BYTE 1
      .BYTE 9,$30,$42,$31,$82,$30,$B2,$2F,$74
      .BYTE 9,$2F,$53,$2F,$93,$30,$54,$2F,$76
      .BYTE 1
      .BYTE 1
EnemyPointers_Level_7_2_Area9:
      .BYTE 1

      .BYTE 1
      .BYTE 3,$23,$79
      .BYTE 5,2,$20,2,$D0
      .BYTE 1
EnemyPointers_Level_7_3_Area0:
      .BYTE 1

EnemyPointers_Level_7_3_Area1:
      .BYTE 1

EnemyPointers_Level_7_3_Area2:
      .BYTE 1

EnemyPointers_Level_7_3_Area3:
      .BYTE 1

EnemyPointers_Level_7_3_Area4:
      .BYTE 1

      .BYTE 1					  ; Unused
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
; The rest of this bank	is empty

; [00000FDB BYTES: END OF AREA UNUSED-BANK9:B025. PRESS	KEYPAD "-" TO COLLAPSE]
; ===========================================================================

