;
; Bank 8 & Bank 9
; ===============
;
; What's inside:
;
;   - Level and enemy data pointer tables
;   - Level data
;   - Enemy data
;

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

;
; Level Data
; ==========
;
; Levels are broken down by area. The first four bytes are a level header,
; specifying things like palettes, music, size, scrolling, and ground type.
; The rest is level objects. Levels are ended by the $FF special object.
;
; Regular object (2 bytes):
;   $YX - position
;   $TT - type
;
; Special objects (1-3 bytes):
;   @TODO
;
LevelData_1_1_Area0:
      .BYTE $09, $F3, $30, $00
      .BYTE $B7, $0A
      .BYTE $00, $00
      .BYTE $56, $10
      .BYTE $1A, $10
      .BYTE $D6, $C2
      .BYTE $29, $10
      .BYTE $75, $C4
      .BYTE $5A, $21
      .BYTE $12, $C9
      .BYTE $75, $C7
      .BYTE $1E, $C1
      .BYTE $3E, $0A
      .BYTE $00, $20
      .BYTE $20, $CF
      .BYTE $FF
LevelData_1_1_Area1:
      .BYTE $00, $F3, $30, $00
      .BYTE $F5, $00, $50
      .BYTE $34, $E1
      .BYTE $19, $E2
      .BYTE $B5, $12
      .BYTE $0A, $12
      .BYTE $17, $12
      .BYTE $16, $E5
      .BYTE $32, $E1
      .BYTE $26, $E3
      .BYTE $57, $E5
      .BYTE $38, $C2
      .BYTE $27, $22
      .BYTE $0C, $E2
      .BYTE $17, $C1
      .BYTE $11, $E2
      .BYTE $16, $22
      .BYTE $16, $C3
      .BYTE $2B, $21
      .BYTE $18, $C4
      .BYTE $37, $C2
      .BYTE $36, $C7
      .BYTE $12, $E2
      .BYTE $35, $C8
      .BYTE $3B, $C3
      .BYTE $24, $22
      .BYTE $12, $0C
      .BYTE $F5, $00, $29
      .BYTE $04, $C4
      .BYTE $30, $E1
      .BYTE $02, $03
      .BYTE $03, $EC
      .BYTE $F4
      .BYTE $07, $0D
      .BYTE $45, $0D
      .BYTE $1A, $0D
      .BYTE $26, $E3
      .BYTE $BA, $0C
      .BYTE $FF
LevelData_1_1_Area2:
      .BYTE $80, $E0, $92, $00
      .BYTE $79, $16
      .BYTE $10, $C2
      .BYTE $07, $16
      .BYTE $31, $0A
      .BYTE $00, $03
      .BYTE $15, $21
      .BYTE $08, $22
      .BYTE $0F, $22
      .BYTE $8A, $2B
      .BYTE $0B, $52
      .BYTE $0E, $26
      .BYTE $10, $10
      .BYTE $0A, $C5
      .BYTE $63, $21
      .BYTE $60, $0C
      .BYTE $44, $29
      .BYTE $3E, $0F
      .BYTE $14, $0F
      .BYTE $09, $01
      .BYTE $19, $0F
      .BYTE $78, $51
      .BYTE $17, $DC
      .BYTE $15, $C2
      .BYTE $14, $22
      .BYTE $10, $29
      .BYTE $03, $C2
      .BYTE $18, $FA
      .BYTE $15, $C3
      .BYTE $21, $22
      .BYTE $F0, $C8
      .BYTE $5A, $10
      .BYTE $1E, $10
      .BYTE $33, $C2
      .BYTE $16, $F9
      .BYTE $B8, $27
      .BYTE $0A, $01
      .BYTE $17, $C3
      .BYTE $11, $22
      .BYTE $0F, $29
      .BYTE $10, $C2
      .BYTE $17, $C5
      .BYTE $33, $22
      .BYTE $07, $C6
      .BYTE $11, $C3
      .BYTE $1F, $25
      .BYTE $F0, $E0
      .BYTE $8D, $21
      .BYTE $0F, $27
      .BYTE $43, $C1
      .BYTE $06, $29
      .BYTE $0A, $29
      .BYTE $31, $24
      .BYTE $06, $21
      .BYTE $0A, $51
      .BYTE $51, $CF
      .BYTE $06, $F3
      .BYTE $30, $22
      .BYTE $75, $D5
      .BYTE $51, $CB
      .BYTE $28, $0B
      .BYTE $00, $32
      .BYTE $1E, $26
      .BYTE $1A, $CD
      .BYTE $9F, $C0
      .BYTE $50, $21
      .BYTE $01, $21
      .BYTE $03, $2D
      .BYTE $08, $54
      .BYTE $0D, $12
      .BYTE $F5, $00, $13
      .BYTE $18, $C6
      .BYTE $F4, $F3
      .BYTE $F3, $DF
      .BYTE $C6, $F3
      .BYTE $6D, $C8
      .BYTE $F2
      .BYTE $6A, $CF
      .BYTE $5E, $0B
      .BYTE $00, $41
      .BYTE $F4
      .BYTE $F3
      .BYTE $F3
      .BYTE $F3
      .BYTE $2E, $16
      .BYTE $FF
LevelData_1_1_Area3:
      .BYTE $91, $EA, $22, $11
      .BYTE $47, $A8
      .BYTE $19, $25
      .BYTE $0B, $25
      .BYTE $16, $83
      .BYTE $24, $0A
      .BYTE $00, $54
      .BYTE $13, $25
      .BYTE $F0, $71
      .BYTE $F0, $FC
      .BYTE $F0, $0E
      .BYTE $F1, $8F
      .BYTE $F1, $B1
      .BYTE $F1, $F4
      .BYTE $64, $F3
      .BYTE $98, $0C
      .BYTE $F5, $00, $40
      .BYTE $48, $03
      .BYTE $18, $03
      .BYTE $C7, $13
      .BYTE $00, $28
      .BYTE $F0, $B2
      .BYTE $F1, $4A
      .BYTE $FF
LevelData_1_1_Area4:
      .BYTE $91, $EA, $22, $11
      .BYTE $03, $F3
      .BYTE $97, $12
      .BYTE $F5, $00, $31
      .BYTE $34, $80
      .BYTE $05, $80
      .BYTE $0E, $21
      .BYTE $0F, $21
      .BYTE $F0, $EC
      .BYTE $F1, $0F
      .BYTE $F1, $50
      .BYTE $E1, $13
      .BYTE $00, $27
      .BYTE $F0, $8A
      .BYTE $FF
LevelData_1_1_Area5:
      .BYTE $80, $E8, $40, $12
      .BYTE $7C, $10
      .BYTE $18, $0C
      .BYTE $F5, $00, $10
      .BYTE $12, $10
      .BYTE $15, $11
      .BYTE $30, $E7
      .BYTE $08, $03
      .BYTE $09, $E6
      .BYTE $9C, $10
      .BYTE $1F, $11
      .BYTE $50, $E7
      .BYTE $0A, $91
      .BYTE $F1, $60
      .BYTE $7E, $10
      .BYTE $43, $48
      .BYTE $F5, $01, $00
      .BYTE $F0, $4C
      .BYTE $F1, $EB
      .BYTE $F2
      .BYTE $F0, $2A
      .BYTE $F2
      .BYTE $24, $83
      .BYTE $25, $81
      .BYTE $4B, $0B
      .BYTE $00, $30
      .BYTE $F0, $8B
      .BYTE $F1, $8C
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_1_2_Area0:
      .BYTE $80, $EA, $70, $10
      .BYTE $8E, $C3
      .BYTE $3B, $C1
      .BYTE $F0, $CD
      .BYTE $F1, $48
      .BYTE $DD, $10
      .BYTE $13, $C2
      .BYTE $EB, $10
      .BYTE $10, $11
      .BYTE $06, $10
      .BYTE $0E, $11
      .BYTE $2E, $C1
      .BYTE $7F, $29
      .BYTE $5D, $16
      .BYTE $0E, $16
      .BYTE $2A, $07
      .BYTE $0F, $06
      .BYTE $F5, $01, $30
      .BYTE $18, $26
      .BYTE $0C, $2B
      .BYTE $12, $C2
      .BYTE $F0, $E0
      .BYTE $F6, $00
      .BYTE $43, $10
      .BYTE $15, $11
      .BYTE $1A, $CD
      .BYTE $35, $16
      .BYTE $31, $16
      .BYTE $08, $29
      .BYTE $1D, $09
      .BYTE $01, $10
      .BYTE $10, $22
      .BYTE $02, $51
      .BYTE $40, $29
      .BYTE $0B, $10
      .BYTE $1C, $11
      .BYTE $12, $26
      .BYTE $18, $CC
      .BYTE $F0, $08
      .BYTE $F1, $C2
      .BYTE $F2
      .BYTE $3C, $16
      .BYTE $1D, $16
      .BYTE $13, $0B
      .BYTE $01, $13
      .BYTE $15, $56
      .BYTE $0E, $51
      .BYTE $9C, $8C
      .BYTE $0D, $8C
      .BYTE $0E, $8C
      .BYTE $0F, $8C
      .BYTE $27, $10
      .BYTE $15, $11
      .BYTE $4A, $16
      .BYTE $14, $16
      .BYTE $0C, $0B
      .BYTE $01, $20
      .BYTE $26, $16
      .BYTE $09, $82
      .BYTE $0A, $82
      .BYTE $0B, $82
      .BYTE $F0, $00
      .BYTE $FF
LevelData_1_2_Area1:
      .BYTE $89, $EA, $32, $11
      .BYTE $99, $29
      .BYTE $16, $29
      .BYTE $0C, $29
      .BYTE $12, $13
      .BYTE $01, $04
      .BYTE $1A, $25
      .BYTE $0C, $21
      .BYTE $0E, $21
      .BYTE $F0, $30
      .BYTE $F1, $F7
      .BYTE $7D, $A8
      .BYTE $1C, $25
      .BYTE $0E, $26
      .BYTE $1D, $05
      .BYTE $3A, $83
      .BYTE $32, $25
      .BYTE $03, $25
      .BYTE $06, $25
      .BYTE $07, $25
      .BYTE $09, $80
      .BYTE $0F, $21
      .BYTE $F0, $30
      .BYTE $F0, $97
      .BYTE $F0, $D0
      .BYTE $F1, $35
      .BYTE $80, $25
      .BYTE $02, $25
      .BYTE $17, $82
      .BYTE $1E, $29
      .BYTE $24, $83
      .BYTE $37, $2D
      .BYTE $F0, $F0
      .BYTE $F1, $1B
      .BYTE $F1, $51
      .BYTE $7C, $14
      .BYTE $01, $06
      .BYTE $F0, $0F
      .BYTE $F1, $4E
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_1_2_Area2:
      .BYTE $80, $E0, $20, $02
      .BYTE $00, $8C
      .BYTE $01, $8C
      .BYTE $02, $8C
      .BYTE $03, $8C
      .BYTE $28, $10
      .BYTE $1B, $11
      .BYTE $53, $0B
      .BYTE $01, $07
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
LevelData_1_2_Area3:
      .BYTE $18, $E3, $01, $01
      .BYTE $64, $32
      .BYTE $09, $32
      .BYTE $32, $32
      .BYTE $0B, $32
      .BYTE $14, $2C
      .BYTE $06, $32
      .BYTE $0A, $2C
      .BYTE $F0, $44
      .BYTE $F0, $65
      .BYTE $F0, $86
      .BYTE $F0, $A7
      .BYTE $F1, $66
      .BYTE $F1, $83
      .BYTE $F1, $A0
      .BYTE $F5, $01, $03
      .BYTE $FF
LevelData_1_2_Area4:
      .BYTE $18, $E3, $01, $01
      .BYTE $64, $32
      .BYTE $09, $32
      .BYTE $32, $32
      .BYTE $0B, $32
      .BYTE $24, $31
      .BYTE $0A, $31
      .BYTE $17, $27
      .BYTE $F0, $44
      .BYTE $F0, $65
      .BYTE $F0, $86
      .BYTE $F0, $A7
      .BYTE $F1, $86
      .BYTE $F1, $A8
      .BYTE $F1, $C4
      .BYTE $FF
LevelData_1_2_Area5:
      .BYTE $80, $E1, $90, $00
      .BYTE $00, $8A
      .BYTE $01, $8A
      .BYTE $02, $8A
      .BYTE $2D, $29
      .BYTE $1A, $29
      .BYTE $28, $C5
      .BYTE $2E, $F2
      .BYTE $F1, $C8
      .BYTE $A6, $29
      .BYTE $0E, $10
      .BYTE $13, $29
      .BYTE $21, $C2
      .BYTE $07, $C5
      .BYTE $24, $F2
      .BYTE $0D, $F2
      .BYTE $26, $C7
      .BYTE $20, $C4
      .BYTE $79, $29
      .BYTE $0B, $29
      .BYTE $18, $2B
      .BYTE $11, $22
      .BYTE $02, $26
      .BYTE $03, $DB
      .BYTE $10, $C3
      .BYTE $0E, $C1
      .BYTE $14, $F9
      .BYTE $3E, $C4
      .BYTE $1A, $C3
      .BYTE $10, $C6
      .BYTE $56, $10
      .BYTE $1A, $11
      .BYTE $4C, $D3
      .BYTE $15, $D3
      .BYTE $0D, $C1
      .BYTE $16, $C1
      .BYTE $0F, $F3
      .BYTE $18, $F4
      .BYTE $13, $F2
      .BYTE $64, $10
      .BYTE $28, $D3
      .BYTE $19, $C1
      .BYTE $12, $D3
      .BYTE $0B, $FE
      .BYTE $13, $C1
      .BYTE $15, $F3
      .BYTE $A7, $11
      .BYTE $11, $29
      .BYTE $05, $29
      .BYTE $0B, $21
      .BYTE $0C, $21
      .BYTE $0D, $21
      .BYTE $0E, $21
      .BYTE $0F, $21
      .BYTE $1A, $C6
      .BYTE $60, $C1
      .BYTE $04, $C1
      .BYTE $08, $CA
      .BYTE $80, $2D
      .BYTE $0A, $10
      .BYTE $42, $29
      .BYTE $43, $F9
      .BYTE $F1, $A1
      .BYTE $3E, $18
      .BYTE $23, $11
      .BYTE $18, $10
      .BYTE $16, $29
      .BYTE $24, $22
      .BYTE $06, $21
      .BYTE $08, $22
      .BYTE $13, $D5
      .BYTE $12, $C1
      .BYTE $08, $C1
      .BYTE $24, $26
      .BYTE $06, $22
      .BYTE $2B, $F1
      .BYTE $F1, $68
      .BYTE $F1, $A1
      .BYTE $34, $18
      .BYTE $0A, $18
      .BYTE $9C, $0A
      .BYTE $02, $23
      .BYTE $98, $10
      .BYTE $55, $C1
      .BYTE $12, $08
      .BYTE $10, $51
      .BYTE $F0, $E8
      .BYTE $FF
LevelData_1_3_Area0:
      .BYTE $20, $E0, $03, $19
      .BYTE $55, $2C
      .BYTE $0B, $2C
      .BYTE $33, $2C
      .BYTE $0D, $2C
      .BYTE $16, $34
      .BYTE $27, $0A
      .BYTE $02, $20
      .BYTE $F0, $54
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_1_3_Area1:
      .BYTE $20, $E0, $67, $19
      .BYTE $58, $0A
      .BYTE $02, $10
      .BYTE $23, $39
      .BYTE $32, $32
      .BYTE $0B, $32
      .BYTE $35, $33
      .BYTE $0A, $30
      .BYTE $1A, $AF
      .BYTE $F0, $54
      .BYTE $34, $31
      .BYTE $0C, $30
      .BYTE $1C, $AC
      .BYTE $12, $31
      .BYTE $34, $31
      .BYTE $32, $31
      .BYTE $34, $31
      .BYTE $F0, $5C
      .BYTE $32, $31
      .BYTE $0C, $30
      .BYTE $34, $37
      .BYTE $62, $37
      .BYTE $18, $A9
      .BYTE $0D, $00
      .BYTE $0E, $00
      .BYTE $1D, $00
      .BYTE $0E, $00
      .BYTE $14, $31
      .BYTE $09, $35
      .BYTE $F0, $14
      .BYTE $6A, $33
      .BYTE $3C, $31
      .BYTE $13, $13
      .BYTE $02, $08
      .BYTE $2C, $31
      .BYTE $27, $32
      .BYTE $F1, $5B
      .BYTE $F1, $74
      .BYTE $44, $35
      .BYTE $36, $35
      .BYTE $34, $35
      .BYTE $19, $A6
      .BYTE $27, $31
      .BYTE $0A, $31
      .BYTE $17, $AF
      .BYTE $08, $AD
      .BYTE $F0, $16
      .BYTE $49, $AE
      .BYTE $65, $A9
      .BYTE $0B, $AB
      .BYTE $51, $33
      .BYTE $0C, $32
      .BYTE $12, $AC
      .BYTE $0D, $A8
      .BYTE $F0, $17
      .BYTE $F0, $D4
      .BYTE $63, $31
      .BYTE $14, $A7
      .BYTE $2C, $09
      .BYTE $02, $30
      .BYTE $26, $31
      .BYTE $51, $73
      .BYTE $06, $73
      .BYTE $F1, $18
      .BYTE $F1, $C0
      .BYTE $FF
LevelData_1_3_Area2:
      .BYTE $A0, $EA, $57, $19
      .BYTE $39, $29
      .BYTE $13, $13
      .BYTE $02, $26
      .BYTE $6B, $32
      .BYTE $28, $77
      .BYTE $F0, $4B
      .BYTE $F1, $0D
      .BYTE $7F, $30
      .BYTE $16, $31
      .BYTE $0A, $32
      .BYTE $23, $31
      .BYTE $0F, $30
      .BYTE $20, $31
      .BYTE $1F, $30
      .BYTE $F0, $08
      .BYTE $90, $66
      .BYTE $07, $31
      .BYTE $17, $31
      .BYTE $09, $66
      .BYTE $20, $66
      .BYTE $07, $30
      .BYTE $08, $01
      .BYTE $17, $31
      .BYTE $09, $66
      .BYTE $20, $66
      .BYTE $07, $31
      .BYTE $17, $31
      .BYTE $09, $66
      .BYTE $80, $29
      .BYTE $10, $30
      .BYTE $0A, $29
      .BYTE $20, $29
      .BYTE $10, $30
      .BYTE $09, $82
      .BYTE $0A, $82
      .BYTE $0B, $82
      .BYTE $0E, $82
      .BYTE $0F, $82
      .BYTE $20, $29
      .BYTE $10, $30
      .BYTE $F0, $4D
      .BYTE $F0, $A8
      .BYTE $F0, $CC
      .BYTE $F1, $08
      .BYTE $93, $29
      .BYTE $32, $81
      .BYTE $03, $81
      .BYTE $06, $81
      .BYTE $F0, $B0
      .BYTE $F1, $0F
      .BYTE $F0, $31
      .BYTE $F2
      .BYTE $99, $42
      .BYTE $F1, $0F
      .BYTE $F1, $CA
      .BYTE $F5, $02, $40
      .BYTE $FF
LevelData_1_3_Area3:
      .BYTE $AA, $F8, $16, $22
      .BYTE $6E, $25
      .BYTE $0F, $25
      .BYTE $1E, $32
      .BYTE $3F, $25
      .BYTE $F0, $50
      .BYTE $F0, $BD
      .BYTE $F1, $5B
      .BYTE $F1, $9A
      .BYTE $B0, $25
      .BYTE $04, $84
      .BYTE $33, $81
      .BYTE $0A, $33
      .BYTE $11, $25
      .BYTE $05, $80
      .BYTE $F0, $99
      .BYTE $F0, $DC
      .BYTE $F1, $F8
      .BYTE $FF
LevelData_2_1_Area0:
      .BYTE $80, $EC, $90, $00
      .BYTE $00, $0E, $14, $11, $12, $10, $1C, $10, $4A, $17, $12, $17
      .BYTE $8A, $10, $27, $17, $E2, $10, $14, $11, $4A, $07, $0F, $D3, $11, $D5, $0E, $D1 ; $10
      .BYTE $10, $D1, $06, $D1, $0D, $D1, $77, $10, $19, $11, $48, $29, $1C, $D3, $12, $D1 ; $20
      .BYTE $0B, $D1, $0F, $D1, $13, $D1, $0A, $D1, $B8, $26, $0A, $22, $0B, $2B, $0C, $22 ; $30
      .BYTE $0D, $22, $17, $36, $14, $07, $08, $34, $17, $36, $10, $D1, $08, $34, $8E, $10 ; $40
      .BYTE $39, $29, $37, $0F, $0A, $0F, $1D, $D2, $F0, $0C, $F6, $01, $93, $11, $47, $0F ; $50
      .BYTE $0F, $37, $1E, $39, $1D, $3B, $F1, $8C, $F6, $00, $89, $10, $10, $29, $05, $29 ; $60
      .BYTE $1F, $29, $11, $33, $10, $35, $1C, $0F, $F2, $7D, $0F, $F0, $0C, $F6, $01, $F1 ; $70
      .BYTE $8C, $F6, $00, $A3, $10, $11, $11, $07, $17, $59, $0B, $03, $10, $FF ; $80
LevelData_2_1_Area1:
      .BYTE $09, $F6, $31, $09
      .BYTE $66, $13, $03, $09, $7D, $29, $F0, $55, $F1, $1C, $F1, $4D
      .BYTE $83, $29, $F2, $72, $29, $1D, $29, $32, $A3, $32, $05, $F1, $C0, $12, $AA, $AC ; $10
      .BYTE $0A, $03, $20, $F0, $F4, $F1, $98, $F1, $A0, $FF ; $20
LevelData_2_1_Area4:
      .BYTE $91, $EA, $20, $1A
      .BYTE $97, $80, $23, $0A, $03, $13, $F0, $4D, $F0, $CC, $F1, $02
      .BYTE $F2, $F0, $48, $F0, $8C, $F2, $84, $86, $05, $86, $F0, $48, $F1, $0B, $F1, $CA ; $10
      .BYTE $F5, $04, $00, $FF ; $20
LevelData_2_1_Area3:
      .BYTE $18, $E3, $01, $01
      .BYTE $54, $32, $09, $32, $15, $30, $0A, $30, $27, $31, $24, $31
      .BYTE $0A, $31, $15, $31, $09, $31, $16, $33, $1B, $24, $F0, $44, $F0, $65, $F0, $86 ; $10
      .BYTE $F0, $A7, $F1, $86, $F1, $A3, $F1, $C8, $FF ; $20
LevelData_2_2_Area0:
      .BYTE $89, $EA, $10, $19
      .BYTE $8E, $81
      .BYTE $0F, $81
      .BYTE $F0, $B0
      .BYTE $F1, $6F
      .BYTE $BD, $14
      .BYTE $04, $10
      .BYTE $40, $81
      .BYTE $F0, $2E
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_2_2_Area1:
      .BYTE $80, $EA, $90, $18
      .BYTE $2D, $10
      .BYTE $1B, $11
      .BYTE $56, $16
      .BYTE $0D, $16
      .BYTE $32, $0B
      .BYTE $04, $01
      .BYTE $F0, $6D
      .BYTE $F0, $8D
      .BYTE $F6, $00
      .BYTE $7C, $10
      .BYTE $8F, $0F
      .BYTE $11, $D1
      .BYTE $0C, $0F
      .BYTE $F0, $8D
      .BYTE $F6, $01
      .BYTE $5A, $10
      .BYTE $26, $11
      .BYTE $33, $29
      .BYTE $10, $29
      .BYTE $22, $0F
      .BYTE $0F, $07
      .BYTE $F0, $8D
      .BYTE $F6, $00
      .BYTE $74, $10
      .BYTE $45, $29
      .BYTE $09, $29
      .BYTE $34, $26
      .BYTE $08, $21
      .BYTE $0C, $21
      .BYTE $0D, $2B
      .BYTE $F0, $0C
      .BYTE $AC, $0F
      .BYTE $17, $0F
      .BYTE $19, $0F
      .BYTE $13, $07
      .BYTE $04, $97
      .BYTE $30, $07
      .BYTE $F0, $0D
      .BYTE $F0, $A2
      .BYTE $F6, $01
      .BYTE $68, $10
      .BYTE $41, $07
      .BYTE $3F, $0B
      .BYTE $04, $22
      .BYTE $F0, $A2
      .BYTE $F6, $02
      .BYTE $F1, $C2
      .BYTE $F6, $03
      .BYTE $F2
      .BYTE $7E, $07
      .BYTE $15, $07
      .BYTE $0A, $07
      .BYTE $F0, $0C
      .BYTE $F5, $04, $22
      .BYTE $F6, $00
      .BYTE $83, $11
      .BYTE $10, $10
      .BYTE $4D, $0F
      .BYTE $15, $07
      .BYTE $09, $07
      .BYTE $12, $07
      .BYTE $86, $11
      .BYTE $12, $10
      .BYTE $4A, $37
      .BYTE $19, $39
      .BYTE $18, $3B
      .BYTE $17, $3D
      .BYTE $9D, $0C
      .BYTE $F5, $04, $30
      .BYTE $4A, $87
      .BYTE $0B, $87
      .BYTE $0C, $87
      .BYTE $0D, $03
      .BYTE $0E, $87
      .BYTE $0F, $87
      .BYTE $7D, $03
      .BYTE $F1, $48
      .BYTE $FF
LevelData_2_2_Area2:
      .BYTE $89, $EA, $20, $19
      .BYTE $8B, $28
      .BYTE $0D, $26
      .BYTE $0E, $2D
      .BYTE $0F, $22
      .BYTE $1A, $36
      .BYTE $19, $21
      .BYTE $0A, $36
      .BYTE $19, $38
      .BYTE $18, $3A
      .BYTE $F0, $B7
      .BYTE $F0, $F0
      .BYTE $5D, $02
      .BYTE $1D, $02
      .BYTE $1D, $02
      .BYTE $1D, $02
      .BYTE $3C, $02
      .BYTE $1C, $02
      .BYTE $11, $22
      .BYTE $F0, $97
      .BYTE $F0, $D0
      .BYTE $F1, $4F
      .BYTE $F1, $AE
      .BYTE $F5, $04, $15
      .BYTE $90, $13
      .BYTE $04, $15
      .BYTE $24, $29
      .BYTE $33, $25
      .BYTE $04, $25
      .BYTE $05, $25
      .BYTE $37, $27, $F0, $6F
      .BYTE $F0, $D4
      .BYTE $F1, $4A
      .BYTE $FF
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
      .BYTE $04, $50
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_2_2_Area4:
      .BYTE $18, $E3, $01, $01
      .BYTE $54, $32
      .BYTE $09, $32
      .BYTE $15, $30
      .BYTE $0A, $30
      .BYTE $27, $31
      .BYTE $24, $31
      .BYTE $0A, $31
      .BYTE $15, $31
      .BYTE $09, $31
      .BYTE $16, $33
      .BYTE $1B, $24
      .BYTE $F0, $44
      .BYTE $F0, $65
      .BYTE $F0, $86
      .BYTE $F0, $A7
      .BYTE $F1, $86
      .BYTE $F1, $A3
      .BYTE $F1, $C8
      .BYTE $FF
LevelData_2_2_Area5:
      .BYTE $89, $EA, $22, $1A
      .BYTE $43, $0A
      .BYTE $04, $33
      .BYTE $F0, $4E
      .BYTE $F1, $4F
      .BYTE $F1, $BC
      .BYTE $F2
      .BYTE $64, $4E
      .BYTE $64, $00
      .BYTE $07, $00
      .BYTE $08, $00
      .BYTE $F0, $13
      .BYTE $F0, $8D
      .BYTE $70, $46
      .BYTE $10, $42
      .BYTE $F0, $88, $F0, $EC
      .BYTE $F1, $2B
      .BYTE $F1, $8A
      .BYTE $F5, $05, $00
      .BYTE $FF
LevelData_2_3_Area0:
      .BYTE $89, $EA, $00, $01
      .BYTE $09, $A9
      .BYTE $F5, $05, $11
      .BYTE $F0, $2F
      .BYTE $F0, $CC
      .BYTE $F1, $8F
      .BYTE $F1, $EA
      .BYTE $FF
LevelData_2_3_Area1:
      .BYTE $80, $EC, $90, $00
      .BYTE $00, $89
      .BYTE $01, $89
      .BYTE $02, $89
      .BYTE $03, $89
      .BYTE $25, $29
      .BYTE $1C, $29
      .BYTE $18, $2B
      .BYTE $16, $C4
      .BYTE $2B, $21
      .BYTE $1A, $C2
      .BYTE $95, $11
      .BYTE $08, $10
      .BYTE $66, $A6
      .BYTE $F5, $05, $00
      .BYTE $12, $32
      .BYTE $09, $32
      .BYTE $0D, $26
      .BYTE $0E, $21
      .BYTE $0F, $21
      .BYTE $14, $31
      .BYTE $06, $05
      .BYTE $07, $32
      .BYTE $14, $31
      .BYTE $07, $32
      .BYTE $14, $31
      .BYTE $07, $32
      .BYTE $14, $31
      .BYTE $07, $32
      .BYTE $14, $31
      .BYTE $06, $05
      .BYTE $07, $32
      .BYTE $53, $29
      .BYTE $31, $0F
      .BYTE $0F, $29
      .BYTE $23, $21
      .BYTE $05, $21
      .BYTE $71, $C2
      .BYTE $1E, $29
      .BYTE $02, $0B
      .BYTE $05, $20
      .BYTE $16, $22
      .BYTE $09, $22
      .BYTE $11, $C2
      .BYTE $05, $C3
      .BYTE $09, $C2
      .BYTE $0E, $C3
      .BYTE $DD, $11
      .BYTE $5D, $0F
      .BYTE $C3, $29
      .BYTE $39, $0F
      .BYTE $13, $0F
      .BYTE $0E, $0F
      .BYTE $F1, $4C
      .BYTE $F6, $01
      .BYTE $F1, $CC
      .BYTE $F6, $00
      .BYTE $90, $10
      .BYTE $0E, $10
      .BYTE $12, $11
      .BYTE $52, $0F
      .BYTE $06, $0F
      .BYTE $0A, $0F
      .BYTE $1E, $D1
      .BYTE $F0, $6C
      .BYTE $F6, $01
      .BYTE $F0, $CC
      .BYTE $F6, $00
      .BYTE $86, $11
      .BYTE $31, $29
      .BYTE $08, $29
      .BYTE $43, $D2
      .BYTE $0A, $D1
      .BYTE $F0, $0C
      .BYTE $F6, $02
      .BYTE $F0, $6C
      .BYTE $F6, $00
      .BYTE $F0, $CC
      .BYTE $F6, $02
      .BYTE $F1, $4C
      .BYTE $F6, $00
      .BYTE $84, $10
      .BYTE $52, $0F
      .BYTE $0E, $0F
      .BYTE $C8, $17
      .BYTE $47, $0B
      .BYTE $05, $30
      .BYTE $F4
      .BYTE $26, $16
      .BYTE $09, $16
      .BYTE $FF
LevelData_2_3_Area2:
      .BYTE $91, $EA, $10, $19
      .BYTE $8A, $2D
      .BYTE $0D, $13
      .BYTE $05, $13
      .BYTE $18, $54
      .BYTE $0B, $21
      .BYTE $F1, $0F
      .BYTE $F2
      .BYTE $90, $26
      .BYTE $01, $52
      .BYTE $F0, $8A
      .BYTE $FF
LevelData_2_3_Area3:
      .BYTE $09, $E1, $61, $09
      .BYTE $68, $14
      .BYTE $05, $19
      .BYTE $5C, $31
      .BYTE $13, $31
      .BYTE $F0, $35
      .BYTE $F1, $1C
      .BYTE $6B, $29
      .BYTE $9D, $29
      .BYTE $A8, $28
      .BYTE $3A, $34
      .BYTE $F0, $75
      .BYTE $F1, $1C
      .BYTE $F1, $75
      .BYTE $82, $2C
      .BYTE $06, $2C
      .BYTE $09, $2C
      .BYTE $0D, $2C
      .BYTE $24, $2C
      .BYTE $0B, $2C
      .BYTE $5C, $09
      .BYTE $05, $50
      .BYTE $F1, $33
      .BYTE $F1, $92
      .BYTE $BB, $29
      .BYTE $54, $29
      .BYTE $F0, $6F
      .BYTE $92, $29
      .BYTE $5D, $29
      .BYTE $F0, $0D
      .BYTE $B6, $83
      .BYTE $07, $83
      .BYTE $08, $83
      .BYTE $09, $83
      .BYTE $28, $0A
      .BYTE $05, $70
      .BYTE $1B, $29
      .BYTE $F0, $0E
      .BYTE $F0, $CD
      .BYTE $F1, $4E
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_2_3_Area4:
      .BYTE $18, $E3, $01, $01
      .BYTE $54, $31
      .BYTE $0A, $31
      .BYTE $15, $31
      .BYTE $09, $31
      .BYTE $26, $33
      .BYTE $15, $31
      .BYTE $09, $31
      .BYTE $14, $30
      .BYTE $0B, $30
      .BYTE $28, $28
      .BYTE $F0, $44
      .BYTE $F0, $65
      .BYTE $F0, $86
      .BYTE $F0, $A7
      .BYTE $F1, $66
      .BYTE $F1, $84
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_2_3_Area5:
      .BYTE $89, $EA, $62, $1A
      .BYTE $43, $0A
      .BYTE $05, $33
      .BYTE $2C, $35
      .BYTE $1C, $35
      .BYTE $1C, $35
      .BYTE $1C, $35
      .BYTE $0D, $29
      .BYTE $F0, $4E
      .BYTE $F1, $8F
      .BYTE $C2, $3F
      .BYTE $12, $3F
      .BYTE $12, $3F
      .BYTE $0B, $29
      .BYTE $12, $3F
      .BYTE $10, $3F
      .BYTE $03, $29
      .BYTE $10, $3F
      .BYTE $10, $3F
      .BYTE $08, $29
      .BYTE $F0, $1C
      .BYTE $62, $29
      .BYTE $2F, $34
      .BYTE $1F, $34
      .BYTE $1F, $34
      .BYTE $1E, $36
      .BYTE $1D, $38
      .BYTE $1C, $3A
      .BYTE $1B, $3C
      .BYTE $1A, $3E
      .BYTE $F0, $0F
      .BYTE $F0, $4E
      .BYTE $F0, $CF
      .BYTE $F1, $0D
      .BYTE $F2
      .BYTE $F1, $CC
      .BYTE $F2, $73
      .BYTE $0F, $06
      .BYTE $07, $11
      .BYTE $0F, $F1
      .BYTE $2D, $F2
      .BYTE $A0, $07
      .BYTE $06, $07
      .BYTE $22, $42
      .BYTE $F0, $10
      .BYTE $F2
      .BYTE $F0, $CF
      .BYTE $F1, $4A
      .BYTE $F5, $05, $60
      .BYTE $FF
LevelData_2_3_Area6:
      .BYTE $AA, $EA, $13, $2A
      .BYTE $8E, $30
      .BYTE $F0, $CD
      .BYTE $F1, $52
      .BYTE $F1, $CD
      .BYTE $E4, $32
      .BYTE $1A, $33
      .BYTE $1C, $83
      .BYTE $0D, $83
      .BYTE $10, $00
      .BYTE $01, $00
      .BYTE $02, $00
      .BYTE $03, $33
      .BYTE $10, $00
      .BYTE $01, $00
      .BYTE $02, $00
      .BYTE $F0, $16
      .BYTE $F0, $6D
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_2_3_Area7:
      .BYTE $09, $E0, $03, $11
      .BYTE $32, $2C
      .BYTE $0D, $2C
      .BYTE $22, $2C
      .BYTE $0D, $2C
      .BYTE $22, $2C
      .BYTE $0D, $2C
      .BYTE $15, $35
      .BYTE $27, $0A
      .BYTE $05, $36
      .BYTE $F0, $41
      .BYTE $F1, $80
      .BYTE $FF
LevelData_3_1_Area0:
      .BYTE $80, $EA, $10, $10
      .BYTE $13, $10
      .BYTE $14, $11
      .BYTE $1A, $16
      .BYTE $0B, $16
      .BYTE $F0, $42
      .BYTE $EA, $C2
      .BYTE $16, $C1
      .BYTE $18, $F1
      .BYTE $0C, $C3
      .BYTE $14, $C4
      .BYTE $0D, $0B
      .BYTE $06, $16
      .BYTE $F1, $28
      .BYTE $F1, $42
      .BYTE $FF
LevelData_3_1_Area1:
      .BYTE $00, $F3, $90, $08
      .BYTE $6C, $10
      .BYTE $52, $10
      .BYTE $18, $12
      .BYTE $F5, $06, $31
      .BYTE $C3, $10
      .BYTE $46, $10
      .BYTE $9C, $10
      .BYTE $34, $10
      .BYTE $70, $FF
      .BYTE $B4, $E2
      .BYTE $F0, $6C
      .BYTE $34, $E2
      .BYTE $38, $E1
      .BYTE $3A, $E1
      .BYTE $3C, $E2
      .BYTE $3A, $E1
      .BYTE $38, $E1
      .BYTE $35, $E1
      .BYTE $32, $E3
      .BYTE $37, $E1
      .BYTE $37, $E4
      .BYTE $3B, $E2
      .BYTE $10, $C2
      .BYTE $2B, $E2
      .BYTE $20, $C3
      .BYTE $1B, $E2
      .BYTE $20, $C4
      .BYTE $12, $0B
      .BYTE $06, $01
      .BYTE $08, $E3
      .BYTE $F1, $91
      .BYTE $F2
      .BYTE $F1, $8A
      .BYTE $F3
      .BYTE $76, $C1
      .BYTE $27, $C2
      .BYTE $18, $0B
      .BYTE $06, $20
      .BYTE $F1, $8B
      .BYTE $F1, $AB
      .BYTE $F6, $07
      .BYTE $FF
LevelData_3_1_Area2:
      .BYTE $89, $EA, $20, $11
      .BYTE $87, $13
      .BYTE $06, $19
      .BYTE $F0, $D1
      .BYTE $F2
      .BYTE $94, $5E
      .BYTE $0D, $26
      .BYTE $F2
      .BYTE $BB, $08
      .BYTE $0D, $0A
      .BYTE $06, $16
      .BYTE $F1, $10
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_3_1_Area3:
      .BYTE $80, $E8, $53, $10
      .BYTE $56, $10
      .BYTE $2A, $11
      .BYTE $2E, $10
      .BYTE $12, $0A
      .BYTE $06, $43
      .BYTE $17, $11
      .BYTE $10, $E4
      .BYTE $08, $10
      .BYTE $1C, $10
      .BYTE $7C, $00
      .BYTE $1C, $E2
      .BYTE $27, $0C
      .BYTE $F5, $06, $10
      .BYTE $1F, $E2
      .BYTE $2F, $00
      .BYTE $10, $E6
      .BYTE $07, $03
      .BYTE $08, $EA
      .BYTE $60, $E2
      .BYTE $26, $E2
      .BYTE $12, $2B
      .BYTE $26, $26
      .BYTE $07, $22
      .BYTE $0D, $E2
      .BYTE $16, $C1
      .BYTE $20, $00
      .BYTE $01, $00
      .BYTE $0A, $E3
      .BYTE $79, $E3
      .BYTE $22, $00
      .BYTE $10, $E3
      .BYTE $07, $E3
      .BYTE $36, $E2
      .BYTE $34, $C1
      .BYTE $0A, $E2
      .BYTE $50, $2D
      .BYTE $29, $A8
      .BYTE $18, $21
      .BYTE $19, $05
      .BYTE $31, $21
      .BYTE $3D, $26
      .BYTE $0E, $21
      .BYTE $0F, $21
      .BYTE $F0, $0C
      .BYTE $F0, $4B
      .BYTE $F0, $95
      .BYTE $F2
      .BYTE $4E, $0B
      .BYTE $06, $40
      .BYTE $80, $21
      .BYTE $01, $21
      .BYTE $02, $21
      .BYTE $F0, $8B
      .BYTE $F1, $28
      .BYTE $F1, $8B
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_3_1_Area4:
      .BYTE $91, $EA, $32, $12
      .BYTE $41, $13
      .BYTE $06, $35
      .BYTE $F0, $2E
      .BYTE $F2
      .BYTE $67, $36
      .BYTE $3D, $00
      .BYTE $1D, $00
      .BYTE $14, $35
      .BYTE $10, $31
      .BYTE $F0, $08
      .BYTE $F1, $59
      .BYTE $F1, $CA
      .BYTE $F5, $07, $00
      .BYTE $F3
      .BYTE $26, $83
      .BYTE $20, $81
      .BYTE $0D, $14
      .BYTE $06, $30
      .BYTE $18, $25
      .BYTE $09, $25
      .BYTE $F0, $0B
      .BYTE $F0, $4E
      .BYTE $F1, $EA
      .BYTE $FF
LevelData_3_1_Area5:
      .BYTE $80, $EA, $98, $10
      .BYTE $2F, $16
      .BYTE $9C, $0A
      .BYTE $07, $23
      .BYTE $F0, $82
      .BYTE $F6, $00
      .BYTE $F1, $04
      .BYTE $66, $16
      .BYTE $0D, $16
      .BYTE $2A, $0F
      .BYTE $17, $0F
      .BYTE $53, $A4
      .BYTE $33, $05
      .BYTE $F5, $07, $11
      .BYTE $F0, $62
      .BYTE $44, $16
      .BYTE $1C, $CD
      .BYTE $11, $0F
      .BYTE $16, $0F
      .BYTE $09, $C4
      .BYTE $52, $A4
      .BYTE $32, $05
      .BYTE $F5, $07, $12
      .BYTE $F0, $64
      .BYTE $7C, $0F
      .BYTE $1E, $51
      .BYTE $42, $A4
      .BYTE $32, $05
      .BYTE $F5, $07, $13
      .BYTE $F0, $42
      .BYTE $46, $16
      .BYTE $0B, $16
      .BYTE $31, $0F
      .BYTE $52, $A4
      .BYTE $32, $05
      .BYTE $F5, $07, $14
      .BYTE $F0, $64
      .BYTE $40, $16
      .BYTE $05, $16
      .BYTE $92, $A3
      .BYTE $22, $05
      .BYTE $F5, $07, $15
      .BYTE $F0, $C6
      .BYTE $F2
      .BYTE $2A, $16
      .BYTE $1D, $16
      .BYTE $44, $01
      .BYTE $05, $01
      .BYTE $F0, $04
      .BYTE $F0, $85
      .BYTE $F0, $C4
      .BYTE $F1, $03
      .BYTE $F1, $44
      .BYTE $A3, $16
      .BYTE $0C, $16
      .BYTE $26, $0F
      .BYTE $11, $0F
      .BYTE $0A, $0F
      .BYTE $F1, $83
      .BYTE $F1, $C4
      .BYTE $F2
      .BYTE $25, $16
      .BYTE $17, $16
      .BYTE $3E, $25
      .BYTE $52, $A3
      .BYTE $22, $05
      .BYTE $F5, $07, $17
      .BYTE $57, $26
      .BYTE $09, $22
      .BYTE $0B, $22
      .BYTE $0C, $2B
      .BYTE $16, $C6
      .BYTE $20, $25
      .BYTE $12, $02
      .BYTE $03, $02
      .BYTE $F0, $45
      .BYTE $F0, $82
      .BYTE $F1, $AA
      .BYTE $F6, $02
      .BYTE $FF
LevelData_3_2_Area0:
      .BYTE $91, $EA, $72, $11
      .BYTE $97, $25
      .BYTE $09, $21
      .BYTE $0B, $21
      .BYTE $0D, $26
      .BYTE $13, $02
      .BYTE $04, $02
      .BYTE $05, $02
      .BYTE $06, $02
      .BYTE $0E, $02
      .BYTE $0F, $02
      .BYTE $2F, $2D
      .BYTE $F0, $70
      .BYTE $F0, $EF
      .BYTE $F1, $D0
      .BYTE $3C, $AC
      .BYTE $F5, $07, $01
      .BYTE $6C, $05
      .BYTE $40, $02
      .BYTE $01, $02
      .BYTE $0C, $05
      .BYTE $F0, $4F
      .BYTE $F0, $8E
      .BYTE $F1, $B1
      .BYTE $5D, $AC
      .BYTE $F5, $07, $02
      .BYTE $56, $25
      .BYTE $08, $25
      .BYTE $0A, $25
      .BYTE $14, $83
      .BYTE $0D, $05
      .BYTE $F0, $BC
      .BYTE $F0, $D5
      .BYTE $9D, $A9
      .BYTE $F5, $07, $03
      .BYTE $F0, $17
      .BYTE $F1, $8F
      .BYTE $F1, $F7
      .BYTE $F2
      .BYTE $0D, $A9
      .BYTE $F5, $07, $04
      .BYTE $86, $41
      .BYTE $16, $41
      .BYTE $F0, $2F
      .BYTE $F0, $97
      .BYTE $F0, $CF
      .BYTE $F1, $17
      .BYTE $F1, $4F
      .BYTE $F1, $CA
      .BYTE $6D, $A5
      .BYTE $F5, $07, $05
      .BYTE $65, $32
      .BYTE $3F, $83
      .BYTE $F0, $4F
      .BYTE $F0, $BC
      .BYTE $F1, $15
      .BYTE $F1, $D3
      .BYTE $89, $83
      .BYTE $23, $A8
      .BYTE $0E, $A8
      .BYTE $11, $01
      .BYTE $05, $25
      .BYTE $06, $25
      .BYTE $0C, $25
      .BYTE $0D, $25
      .BYTE $13, $05
      .BYTE $0E, $05
      .BYTE $32, $83
      .BYTE $05, $83
      .BYTE $0D, $83
      .BYTE $37, $25
      .BYTE $09, $25
      .BYTE $F0, $15
      .BYTE $3D, $A5
      .BYTE $50, $25
      .BYTE $F5, $07, $08
      .BYTE $F0, $7C
      .BYTE $F0, $88
      .BYTE $F0, $CC
      .BYTE $F1, $0E
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_3_2_Area1:
      .BYTE $91, $EA, $30, $12
      .BYTE $83, $00
      .BYTE $04, $00
      .BYTE $05, $00
      .BYTE $06, $00
      .BYTE $07, $00
      .BYTE $08, $49
      .BYTE $F0, $7C
      .BYTE $D8, $47
      .BYTE $F0, $55
      .BYTE $F1, $1C
      .BYTE $F5, $08, $00
      .BYTE $F2
      .BYTE $F0, $0E
      .BYTE $F2
      .BYTE $43, $0A
      .BYTE $07, $00
      .BYTE $F0, $CA
      .BYTE $FF
LevelData_3_2_Area2:
      .BYTE $91, $EA, $10, $11
      .BYTE $F0, $94
      .BYTE $F2
      .BYTE $48, $13
      .BYTE $08, $10
      .BYTE $54, $83
      .BYTE $13, $82
      .BYTE $F0, $50
      .BYTE $F0, $AE
      .BYTE $F1, $8A
      .BYTE $FF
LevelData_3_3_Area0:
      .BYTE $80, $E1, $30, $00
      .BYTE $35, $10
      .BYTE $29, $11
      .BYTE $36, $C2
      .BYTE $17, $0B
      .BYTE $08, $01
      .BYTE $1E, $0F
      .BYTE $8B, $11
      .BYTE $17, $10
      .BYTE $32, $2B
      .BYTE $12, $0F
      .BYTE $10, $0F
      .BYTE $13, $01
      .BYTE $05, $52
      .BYTE $08, $26
      .BYTE $5C, $18
      .BYTE $45, $10
      .BYTE $49, $0F
      .BYTE $72, $18
      .BYTE $08, $18
      .BYTE $96, $0A
      .BYTE $08, $23
      .BYTE $FF
LevelData_3_3_Area1:
      .BYTE $A0, $EA, $33, $19
      .BYTE $55, $01
      .BYTE $0B, $2D
      .BYTE $6C, $09
      .BYTE $08, $39
      .BYTE $F0, $5C
      .BYTE $F0, $75
      .BYTE $F1, $1C
      .BYTE $F1, $55
      .BYTE $82, $A8
      .BYTE $22, $05
      .BYTE $55, $0A
      .BYTE $08, $46
      .BYTE $F1, $9C
      .BYTE $F1, $D5
      .BYTE $AC, $0A
      .BYTE $08, $53
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
      .BYTE $08, $13
      .BYTE $11, $2A
      .BYTE $03, $26
      .BYTE $05, $24
      .BYTE $0C, $28
      .BYTE $F0, $14
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_3_3_Area2:
      .BYTE $20, $E0, $93, $19
      .BYTE $15, $AB
      .BYTE $18, $0A
      .BYTE $08, $70
      .BYTE $26, $80
      .BYTE $07, $80
      .BYTE $08, $80
      .BYTE $09, $80
      .BYTE $0A, $80
      .BYTE $F0, $35
      .BYTE $C4, $31
      .BYTE $36, $33
      .BYTE $3A, $32
      .BYTE $34, $29
      .BYTE $16, $33
      .BYTE $33, $32
      .BYTE $36, $33
      .BYTE $3A, $33
      .BYTE $36, $33
      .BYTE $42, $34
      .BYTE $12, $30
      .BYTE $03, $29
      .BYTE $05, $29
      .BYTE $06, $30
      .BYTE $0D, $29
      .BYTE $12, $30
      .BYTE $F0, $14
      .BYTE $12, $30
      .BYTE $04, $28
      .BYTE $09, $32
      .BYTE $12, $34
      .BYTE $1A, $29
      .BYTE $16, $29
      .BYTE $0C, $84
      .BYTE $0D, $84
      .BYTE $28, $83
      .BYTE $09, $83
      .BYTE $24, $81
      .BYTE $05, $81
      .BYTE $42, $38
      .BYTE $0D, $0A
      .BYTE $08, $40
      .BYTE $0E, $A8
      .BYTE $2E, $05
      .BYTE $F1, $B7
      .BYTE $87, $2C
      .BYTE $69, $AF
      .BYTE $F0, $54
      .BYTE $F1, $D6
      .BYTE $76, $AE
      .BYTE $99, $A5
      .BYTE $F0, $57
      .BYTE $83, $00
      .BYTE $0C, $00
      .BYTE $17, $31
      .BYTE $16, $33
      .BYTE $15, $35
      .BYTE $16, $33
      .BYTE $1D, $0A
      .BYTE $08, $43
      .BYTE $3D, $AC
      .BYTE $F0, $56
      .BYTE $F0, $94
      .BYTE $F1, $B6
      .BYTE $F1, $D5
      .BYTE $16, $33
      .BYTE $45, $35
      .BYTE $15, $30
      .BYTE $0A, $30
      .BYTE $15, $30
      .BYTE $0A, $30
      .BYTE $15, $35
      .BYTE $46, $33
      .BYTE $38, $82
      .BYTE $11, $A9
      .BYTE $07, $80
      .BYTE $09, $80
      .BYTE $3B, $84
      .BYTE $29, $80
      .BYTE $0A, $80
      .BYTE $0C, $80
      .BYTE $0D, $80
      .BYTE $37, $84
      .BYTE $25, $80
      .BYTE $06, $80
      .BYTE $08, $80
      .BYTE $09, $80
      .BYTE $32, $31
      .BYTE $F0, $14
      .BYTE $3C, $82
      .BYTE $1B, $80
      .BYTE $0D, $80
      .BYTE $3D, $31
      .BYTE $3C, $82
      .BYTE $1B, $80
      .BYTE $0D, $80
      .BYTE $23, $0A
      .BYTE $08, $20
      .BYTE $F0, $1A
      .BYTE $F1, $74
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_3_3_Area3:
      .BYTE $20, $E0, $67, $19
      .BYTE $AE, $30
      .BYTE $12, $0A
      .BYTE $08, $33
      .BYTE $0E, $AE
      .BYTE $2A, $87
      .BYTE $0B, $87
      .BYTE $F0, $94
      .BYTE $F1, $BA
      .BYTE $2C, $31
      .BYTE $1C, $A9
      .BYTE $52, $AF
      .BYTE $04, $A4
      .BYTE $06, $A4
      .BYTE $08, $A4
      .BYTE $0A, $A4
      .BYTE $F0, $D4
      .BYTE $93, $3B
      .BYTE $AA, $31
      .BYTE $3A, $32
      .BYTE $F1, $5A
      .BYTE $3C, $32
      .BYTE $68, $31
      .BYTE $36, $33
      .BYTE $12, $0A
      .BYTE $08, $36
      .BYTE $F0, $1B
      .BYTE $F0, $98
      .BYTE $F1, $BB
      .BYTE $A6, $31
      .BYTE $48, $31
      .BYTE $36, $33
      .BYTE $F0, $F8
      .BYTE $66, $31
      .BYTE $36, $33
      .BYTE $68, $31
      .BYTE $F0, $3B
      .BYTE $F1, $58
      .BYTE $36, $33
      .BYTE $66, $31
      .BYTE $36, $33
      .BYTE $1A, $0A
      .BYTE $08, $21
      .BYTE $F0, $9B
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_3_3_Area4:
      .BYTE $20, $E0, $37, $19
      .BYTE $A0, $37
      .BYTE $1B, $0A
      .BYTE $08, $60
      .BYTE $27, $38
      .BYTE $F0, $9E
      .BYTE $F0, $F3
      .BYTE $F1, $5E
      .BYTE $F1, $D3
      .BYTE $26, $04
      .BYTE $10, $37
      .BYTE $37, $38
      .BYTE $26, $04
      .BYTE $10, $37
      .BYTE $37, $38
      .BYTE $26, $04
      .BYTE $10, $37
      .BYTE $F0, $3E
      .BYTE $F0, $B3
      .BYTE $F0, $FE
      .BYTE $F1, $73
      .BYTE $F1, $BE
      .BYTE $37, $38
      .BYTE $26, $04
      .BYTE $10, $37
      .BYTE $37, $38
      .BYTE $26, $04
      .BYTE $10, $37
      .BYTE $37, $38
      .BYTE $F0, $53
      .BYTE $F0, $9E
      .BYTE $F1, $13
      .BYTE $F1, $5E
      .BYTE $F1, $D3
      .BYTE $26, $04
      .BYTE $10, $37
      .BYTE $37, $38
      .BYTE $26, $04
      .BYTE $10, $37
      .BYTE $43, $0A
      .BYTE $08, $22
      .BYTE $F0, $3E
      .BYTE $F0, $B3
      .BYTE $F0, $FE
      .BYTE $F1, $59
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_3_3_Area5:
      .BYTE $20, $E0, $07, $19
      .BYTE $54, $2C
      .BYTE $0C, $2C
      .BYTE $57, $32
      .BYTE $14, $0A
      .BYTE $08, $50
      .BYTE $F0, $41
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_3_3_Area6:
      .BYTE $80, $FD, $40, $1A
      .BYTE $3A, $10
      .BYTE $27, $11
      .BYTE $35, $34
      .BYTE $15, $34
      .BYTE $15, $34
      .BYTE $15, $34
      .BYTE $07, $0A
      .BYTE $08, $30
      .BYTE $15, $31
      .BYTE $08, $31
      .BYTE $0E, $24
      .BYTE $6A, $10
      .BYTE $25, $11
      .BYTE $54, $40
      .BYTE $05, $6B
      .BYTE $8A, $10
      .BYTE $2E, $11
      .BYTE $50, $6F
      .BYTE $F0, $08
      .BYTE $98, $10
      .BYTE $60, $63
      .BYTE $06, $68
      .BYTE $0F, $40
      .BYTE $F2
      .BYTE $29, $10
      .BYTE $14, $10
      .BYTE $95, $42
      .BYTE $F0, $4D
      .BYTE $F1, $6B
      .BYTE $F1, $E8
      .BYTE $F5, $08, $80
      .BYTE $FF
LevelData_3_3_Area7:
      .BYTE $AA, $F8, $17, $22
      .BYTE $6E, $A4
      .BYTE $F0, $5C
      .BYTE $F0, $DD
      .BYTE $F1, $5C
      .BYTE $F1, $D9
      .BYTE $F2
      .BYTE $65, $A4
      .BYTE $2A, $33
      .BYTE $F0, $DC
      .BYTE $F1, $F8
      .BYTE $FF
LevelData_4_1_Area0:
      .BYTE $80, $EA, $90, $10
      .BYTE $2C, $10
      .BYTE $1E, $11
      .BYTE $44, $39
      .BYTE $0E, $3F
      .BYTE $F0, $82
      .BYTE $F1, $D6
      .BYTE $F6, $05
      .BYTE $9A, $10
      .BYTE $6E, $32
      .BYTE $A8, $11
      .BYTE $1B, $10
      .BYTE $43, $34
      .BYTE $31, $32
      .BYTE $08, $3F
      .BYTE $6B, $11
      .BYTE $68, $3F
      .BYTE $38, $36
      .BYTE $7C, $11
      .BYTE $4E, $2D
      .BYTE $1E, $37
      .BYTE $2A, $3C
      .BYTE $F2
      .BYTE $84, $26
      .BYTE $0A, $54
      .BYTE $18, $39
      .BYTE $72, $10
      .BYTE $16, $11
      .BYTE $45, $3A
      .BYTE $0A, $3B
      .BYTE $32, $3F
      .BYTE $78, $10
      .BYTE $57, $3F
      .BYTE $CE, $10
      .BYTE $37, $33
      .BYTE $1A, $31
      .BYTE $1B, $31
      .BYTE $1B, $32
      .BYTE $1B, $33
      .BYTE $5E, $8B
      .BYTE $0F, $8B
      .BYTE $21, $11
      .BYTE $27, $26
      .BYTE $08, $21
      .BYTE $16, $F3
      .BYTE $0A, $32
      .BYTE $24, $21
      .BYTE $11, $2B
      .BYTE $03, $F6
      .BYTE $10, $32
      .BYTE $0B, $23
      .BYTE $F5, $09, $10
      .BYTE $1A, $F2
      .BYTE $FF
LevelData_4_1_Area1:
      .BYTE $80, $E8, $90, $12
      .BYTE $22, $10
      .BYTE $17, $11
      .BYTE $52, $39
      .BYTE $F1, $82
      .BYTE $B8, $10
      .BYTE $2C, $11
      .BYTE $F0, $C1
      .BYTE $F6, $01
      .BYTE $E1, $10
      .BYTE $3B, $0F
      .BYTE $F1, $A2
      .BYTE $F6, $02
      .BYTE $A3, $10
      .BYTE $1A, $11
      .BYTE $1E, $0F
      .BYTE $2A, $0F
      .BYTE $18, $0F
      .BYTE $0D, $0F
      .BYTE $26, $0F
      .BYTE $F0, $81
      .BYTE $F6, $01
      .BYTE $99, $10
      .BYTE $1E, $11
      .BYTE $3E, $0F
      .BYTE $B0, $10
      .BYTE $1A, $10
      .BYTE $4A, $0F
      .BYTE $28, $0F
      .BYTE $F0, $80
      .BYTE $83, $11
      .BYTE $17, $10
      .BYTE $4D, $83
      .BYTE $0E, $83
      .BYTE $0F, $83
      .BYTE $1C, $82
      .BYTE $1B, $81
      .BYTE $1A, $80
      .BYTE $F1, $4D
      .BYTE $F6, $02
      .BYTE $6B, $10
      .BYTE $F0, $02
      .BYTE $F1, $40
      .BYTE $F6, $01
      .BYTE $F2
      .BYTE $47, $10
      .BYTE $1A, $11
      .BYTE $4E, $80
      .BYTE $0F, $80
      .BYTE $35, $80
      .BYTE $06, $80
      .BYTE $07, $80
      .BYTE $F0, $A0
      .BYTE $F6, $02
      .BYTE $F1, $01
      .BYTE $F1, $6C
      .BYTE $65, $11
      .BYTE $37, $42
      .BYTE $30, $80
      .BYTE $F0, $22
      .BYTE $F1, $CA
      .BYTE $F5, $0A, $00
      .BYTE $FF
LevelData_4_1_Area2:
      .BYTE $80, $EA, $10, $10
      .BYTE $AC, $3C
      .BYTE $F0, $8C
      .BYTE $F1, $88
      .BYTE $C8, $12
      .BYTE $F5, $0A, $10
      .BYTE $F1, $2A
      .BYTE $FF
LevelData_4_2_Area0:
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
      .BYTE $0A, $21
      .BYTE $26, $E2
      .BYTE $33, $37
      .BYTE $FF
LevelData_4_2_Area1:
      .BYTE $80, $F6, $90, $28
      .BYTE $4C, $10
      .BYTE $1E, $11
      .BYTE $49, $26
      .BYTE $0A, $21
      .BYTE $0B, $21
      .BYTE $18, $B5
      .BYTE $0F, $2B
      .BYTE $19, $2E
      .BYTE $78, $0A
      .BYTE $0A, $19
      .BYTE $26, $E4
      .BYTE $1F, $34
      .BYTE $42, $BD
      .BYTE $15, $2E
      .BYTE $67, $29
      .BYTE $0B, $29
      .BYTE $2A, $32
      .BYTE $20, $33
      .BYTE $45, $B4
      .BYTE $0D, $B4
      .BYTE $16, $2E
      .BYTE $0E, $2E
      .BYTE $63, $29
      .BYTE $22, $33
      .BYTE $3B, $52
      .BYTE $16, $52
      .BYTE $0B, $F2
      .BYTE $16, $F2
      .BYTE $9D, $29
      .BYTE $12, $26
      .BYTE $10, $F2
      .BYTE $14, $30
      .BYTE $14, $31
      .BYTE $15, $31
      .BYTE $27, $31
      .BYTE $0B, $B4
      .BYTE $1C, $2E
      .BYTE $56, $29
      .BYTE $12, $10
      .BYTE $0E, $10
      .BYTE $18, $11
      .BYTE $19, $34
      .BYTE $54, $B6
      .BYTE $25, $2E
      .BYTE $6F, $11
      .BYTE $1B, $29
      .BYTE $0C, $10
      .BYTE $70, $B4
      .BYTE $09, $B5
      .BYTE $11, $2E
      .BYTE $0A, $2E
      .BYTE $65, $34
      .BYTE $2C, $33
      .BYTE $52, $B8
      .BYTE $25, $2E
      .BYTE $80, $3F
      .BYTE $43, $08
      .BYTE $18, $B5
      .BYTE $12, $F3
      .BYTE $19, $2E
      .BYTE $75, $10
      .BYTE $2C, $10
      .BYTE $18, $23
      .BYTE $F5, $0A, $30
      .BYTE $0B, $11
      .BYTE $10, $31
      .BYTE $07, $42
      .BYTE $15, $46
      .BYTE $15, $F6
      .BYTE $FF
LevelData_4_2_Area2:
      .BYTE $80, $E8, $30, $30
      .BYTE $28, $10
      .BYTE $1C, $11
      .BYTE $52, $39
      .BYTE $F1, $87
      .BYTE $A6, $10
      .BYTE $53, $0F
      .BYTE $12, $29
      .BYTE $0D, $26
      .BYTE $3E, $7F
      .BYTE $F0, $4C
      .BYTE $F1, $CD
      .BYTE $C3, $29
      .BYTE $06, $29
      .BYTE $09, $29
      .BYTE $0C, $29
      .BYTE $3E, $77
      .BYTE $F0, $33
      .BYTE $BE, $0B
      .BYTE $0A, $40
      .BYTE $18, $2D
      .BYTE $F0, $5B
      .BYTE $F0, $D1
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_4_2_Area3:
      .BYTE $91, $EA, $20, $32
      .BYTE $81, $13
      .BYTE $0A, $33
      .BYTE $F0, $4C
      .BYTE $F0, $AB
      .BYTE $F1, $E8
      .BYTE $F2
      .BYTE $A3, $3B
      .BYTE $F0, $0D
      .BYTE $F0, $48
      .BYTE $F0, $70
      .BYTE $F1, $F7
      .BYTE $F2
      .BYTE $F0, $30
      .BYTE $F0, $77
      .BYTE $F0, $8F
      .BYTE $F1, $10
      .BYTE $F1, $8A
      .BYTE $F5, $0B, $00
      .BYTE $FF
LevelData_4_3_Area0:
      .BYTE $91, $EA, $02, $11
      .BYTE $4B, $14
      .BYTE $0B, $11
      .BYTE $0D, $A8
      .BYTE $F0, $54
      .BYTE $F0, $D3
      .BYTE $F1, $15
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_4_3_Area1:
      .BYTE $80, $E1, $91, $00
      .BYTE $00, $8A
      .BYTE $2A, $10
      .BYTE $1D, $11
      .BYTE $14, $2B
      .BYTE $14, $0F
      .BYTE $33, $0F
      .BYTE $05, $0F
      .BYTE $AA, $CB
      .BYTE $27, $21
      .BYTE $16, $C8
      .BYTE $12, $26
      .BYTE $04, $21
      .BYTE $11, $C6
      .BYTE $14, $0B
      .BYTE $0B, $00
      .BYTE $AC, $10
      .BYTE $F1, $16
      .BYTE $F6, $05
      .BYTE $E0, $11
      .BYTE $25, $10
      .BYTE $D4, $10
      .BYTE $0C, $10
      .BYTE $18, $11
      .BYTE $F2
      .BYTE $57, $51
      .BYTE $0A, $50
      .BYTE $16, $F4
      .BYTE $14, $51
      .BYTE $14, $F1
      .BYTE $13, $50
      .BYTE $12, $F1
      .BYTE $0E, $64
      .BYTE $53, $18
      .BYTE $09, $18
      .BYTE $8B, $0A
      .BYTE $0B, $26
      .BYTE $23, $69
      .BYTE $F0, $68
      .BYTE $F1, $F6
      .BYTE $54, $18
      .BYTE $0A, $18
      .BYTE $89, $0A
      .BYTE $0B, $36
      .BYTE $28, $6C
      .BYTE $F0, $88
      .BYTE $55, $18
      .BYTE $0B, $18
      .BYTE $89, $0A
      .BYTE $0B, $60
      .BYTE $25, $6B
      .BYTE $F0, $16
      .BYTE $F0, $A8
      .BYTE $51, $18
      .BYTE $A1, $62
      .BYTE $F0, $D6
      .BYTE $FF
LevelData_4_3_Area2:
      .BYTE $20, $E0, $60, $09
      .BYTE $44, $0A
      .BYTE $0B, $41
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
      .BYTE $0B, $16
      .BYTE $66, $78
      .BYTE $F1, $3B
      .BYTE $F1, $C0
      .BYTE $FF
LevelData_4_3_Area3:
      .BYTE $20, $E0, $62, $09
      .BYTE $37, $0A
      .BYTE $0B, $42
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
      .BYTE $0B, $50
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
      .BYTE $0B, $17
      .BYTE $0B, $33
      .BYTE $21, $38
      .BYTE $F1, $7A
      .BYTE $F1, $C0
      .BYTE $FF
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
      .BYTE $0B, $20
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
      .BYTE $0B, $30
      .BYTE $11, $22
      .BYTE $10, $6C
      .BYTE $FF
LevelData_4_3_Area5:
      .BYTE $20, $E0, $02, $09
      .BYTE $56, $32
      .BYTE $34, $36
      .BYTE $27, $0A
      .BYTE $0B, $33
      .BYTE $21, $3D
      .BYTE $F0, $21
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_4_3_Area6:
      .BYTE $A0, $EA, $10, $1A
      .BYTE $62, $3D
      .BYTE $46, $0A
      .BYTE $0B, $18
      .BYTE $22, $3D
      .BYTE $F0, $50
      .BYTE $90, $34
      .BYTE $51, $42
      .BYTE $10, $34
      .BYTE $F0, $B7
      .BYTE $F0, $EF
      .BYTE $F1, $2E
      .BYTE $F1, $6F
      .BYTE $F1, $97
      .BYTE $F1, $CA
      .BYTE $F5, $0B, $70
      .BYTE $FF
LevelData_4_3_Area7:
      .BYTE $2A, $F5, $0F, $12
      .BYTE $54, $32
      .BYTE $09, $32
      .BYTE $07, $00
      .BYTE $08, $00
      .BYTE $43, $31
      .BYTE $0B, $31
      .BYTE $32, $40
      .BYTE $07, $00
      .BYTE $08, $00
      .BYTE $09, $00
      .BYTE $0D, $40
      .BYTE $F0, $35
      .BYTE $F6, $04
      .BYTE $F0, $53
      .BYTE $F0, $D5
      .BYTE $F6, $02
      .BYTE $F0, $F5
      .BYTE $F6, $04
      .BYTE $F1, $13
      .BYTE $F1, $95
      .BYTE $F6, $05
      .BYTE $F1, $A0
      .BYTE $F6, $02
      .BYTE $F1, $C0
      .BYTE $F6, $04
      .BYTE $FF
LevelData_4_3_Area8:
      .BYTE $81, $E2, $20, $00
      .BYTE $00, $86
      .BYTE $01, $86
      .BYTE $02, $86
      .BYTE $1B, $10
      .BYTE $25, $16
      .BYTE $1C, $C5
      .BYTE $E8, $16
      .BYTE $4A, $C8
      .BYTE $3C, $0B
      .BYTE $0C, $10
      .BYTE $2B, $82
      .BYTE $0C, $82
      .BYTE $0D, $82
      .BYTE $0E, $82
      .BYTE $0F, $82
      .BYTE $F1, $48
      .BYTE $41, $10
      .BYTE $0E, $10
      .BYTE $13, $11
      .BYTE $53, $C8
      .BYTE $50, $82
      .BYTE $01, $82
      .BYTE $04, $82
      .BYTE $05, $82
      .BYTE $06, $82
      .BYTE $09, $82
      .BYTE $0A, $82
      .BYTE $0B, $82
      .BYTE $0C, $82
      .BYTE $0D, $82
      .BYTE $F4
      .BYTE $F2, $3C
      .BYTE $16, $F2
      .BYTE $37, $16
      .BYTE $FF
LevelData_5_1_Area0:
      .BYTE $91, $EA, $80, $11
      .BYTE $83, $13
      .BYTE $0C, $01
      .BYTE $1B, $2A
      .BYTE $0D, $26
      .BYTE $3E, $54
      .BYTE $F0, $71
      .BYTE $F1, $D4
      .BYTE $73, $FC
      .BYTE $38, $87
      .BYTE $09, $87
      .BYTE $0A, $87
      .BYTE $35, $84
      .BYTE $06, $84
      .BYTE $07, $84
      .BYTE $F0, $68
      .BYTE $90, $FF
      .BYTE $F2
      .BYTE $40, $FF
      .BYTE $62, $84
      .BYTE $03, $84
      .BYTE $04, $84
      .BYTE $05, $84
      .BYTE $06, $84
      .BYTE $07, $84
      .BYTE $90, $FF
      .BYTE $2D, $88
      .BYTE $0E, $88
      .BYTE $0F, $88
      .BYTE $24, $86
      .BYTE $05, $86
      .BYTE $06, $86
      .BYTE $07, $86
      .BYTE $B0, $FF
      .BYTE $20, $88
      .BYTE $01, $88
      .BYTE $4F, $84
      .BYTE $79, $2B
      .BYTE $11, $27
      .BYTE $02, $26
      .BYTE $10, $FF
      .BYTE $00, $81
      .BYTE $01, $81
      .BYTE $02, $81
      .BYTE $2D, $88
      .BYTE $0E, $88
      .BYTE $0F, $88
      .BYTE $40, $84
      .BYTE $01, $84
      .BYTE $02, $84
      .BYTE $03, $84
      .BYTE $26, $82
      .BYTE $07, $82
      .BYTE $08, $82
      .BYTE $09, $82
      .BYTE $70, $FF
      .BYTE $23, $88
      .BYTE $04, $88
      .BYTE $05, $88
      .BYTE $9A, $2D
      .BYTE $36, $00
      .BYTE $0A, $00
      .BYTE $10, $F0
      .BYTE $32, $80
      .BYTE $03, $82
      .BYTE $04, $80
      .BYTE $08, $81
      .BYTE $4E, $0B
      .BYTE $0C, $20
      .BYTE $14, $26
      .BYTE $06, $53
      .BYTE $F0, $34
      .BYTE $F0, $CD
      .BYTE $F0, $F4
      .BYTE $F1, $4D
      .BYTE $F1, $74
      .BYTE $F1, $92
      .BYTE $FF
LevelData_5_1_Area1:
      .BYTE $91, $F0, $13, $12
      .BYTE $6B, $32
      .BYTE $51, $0B
      .BYTE $0C, $18
      .BYTE $D1, $00
      .BYTE $F0, $0F
      .BYTE $F0, $B0
      .BYTE $F1, $AA
      .BYTE $F5, $0D, $00
      .BYTE $FF
LevelData_5_1_Area2:
      .BYTE $91, $EA, $10, $11
      .BYTE $F0, $5B
      .BYTE $F2
      .BYTE $F0, $11
      .BYTE $F1, $AA
      .BYTE $0C, $A9
      .BYTE $F5, $0D, $10
      .BYTE $FF
LevelData_5_2_Area0:
      .BYTE $81, $E0, $90, $00
      .BYTE $24, $10
      .BYTE $17, $11
      .BYTE $59, $2A
      .BYTE $0A, $52
      .BYTE $18, $C5
      .BYTE $13, $A4
      .BYTE $33, $05
      .BYTE $F5, $0D, $01
      .BYTE $52, $10
      .BYTE $09, $16
      .BYTE $27, $16
      .BYTE $08, $16
      .BYTE $1B, $16
      .BYTE $F1, $21
      .BYTE $AD, $16
      .BYTE $0F, $16
      .BYTE $15, $10
      .BYTE $0E, $16
      .BYTE $88, $21
      .BYTE $F1, $A2
      .BYTE $5D, $2B
      .BYTE $3C, $10
      .BYTE $1F, $11
      .BYTE $17, $06
      .BYTE $F5, $0D, $40
      .BYTE $15, $2A
      .BYTE $08, $22
      .BYTE $09, $22
      .BYTE $0A, $21
      .BYTE $F1, $88
      .BYTE $F1, $A0
      .BYTE $C7, $11
      .BYTE $0B, $10
      .BYTE $1A, $10
      .BYTE $F2
      .BYTE $18, $16
      .BYTE $1B, $16
      .BYTE $2F, $11
      .BYTE $22, $16
      .BYTE $14, $16
      .BYTE $5C, $2A
      .BYTE $F0, $01
      .BYTE $F1, $28
      .BYTE $F1, $60
      .BYTE $F1, $A8
      .BYTE $F1, $E2
      .BYTE $49, $16
      .BYTE $22, $10
      .BYTE $05, $16
      .BYTE $5F, $86
      .BYTE $55, $81
      .BYTE $09, $81
      .BYTE $F0, $48
      .BYTE $F1, $62
      .BYTE $F1, $C8
      .BYTE $3C, $10
      .BYTE $1F, $11
      .BYTE $21, $16
      .BYTE $05, $16
      .BYTE $0B, $21
      .BYTE $0C, $2A
      .BYTE $0D, $21
      .BYTE $0E, $2D
      .BYTE $1A, $C4
      .BYTE $43, $85
      .BYTE $15, $84
      .BYTE $21, $82
      .BYTE $F0, $E2
      .BYTE $95, $22
      .BYTE $06, $28
      .BYTE $F1, $88
      .BYTE $9D, $8A
      .BYTE $0E, $8A
      .BYTE $0F, $8A
      .BYTE $22, $10
      .BYTE $25, $11
      .BYTE $1B, $16
      .BYTE $27, $12
      .BYTE $F5, $0D, $23
      .BYTE $F0, $01
      .BYTE $FF
LevelData_5_2_Area1:
      .BYTE $01, $F3, $30, $28
      .BYTE $0F, $85
      .BYTE $48, $0C
      .BYTE $4E, $0B
      .BYTE $0D, $30
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
LevelData_5_2_Area2:
      .BYTE $01, $F5, $60, $29
      .BYTE $14, $10
      .BYTE $2C, $11
      .BYTE $11, $0B
      .BYTE $0D, $20
      .BYTE $22, $6B
      .BYTE $07, $01
      .BYTE $36, $10
      .BYTE $29, $11
      .BYTE $32, $70
      .BYTE $0D, $70
      .BYTE $12, $8E
      .BYTE $0D, $8E
      .BYTE $E3, $70
      .BYTE $0C, $70
      .BYTE $2B, $70
      .BYTE $1B, $83
      .BYTE $4B, $8F
      .BYTE $17, $70
      .BYTE $17, $86
      .BYTE $18, $70
      .BYTE $18, $87
      .BYTE $04, $70
      .BYTE $14, $81
      .BYTE $3A, $70
      .BYTE $F0, $16
      .BYTE $1A, $89
      .BYTE $74, $70
      .BYTE $0B, $82
      .BYTE $14, $81
      .BYTE $15, $70
      .BYTE $36, $70
      .BYTE $16, $85
      .BYTE $F1, $57
      .BYTE $99, $70
      .BYTE $19, $88
      .BYTE $48, $70
      .BYTE $18, $83
      .BYTE $F2
      .BYTE $F0, $96
      .BYTE $F0, $D5
      .BYTE $F1, $14
      .BYTE $F2
      .BYTE $3E, $70
      .BYTE $1E, $85
      .BYTE $2D, $81
      .BYTE $2D, $0B
      .BYTE $0D, $50
      .BYTE $11, $70
      .BYTE $14, $60
      .BYTE $07, $60
      .BYTE $0A, $60
      .BYTE $24, $F7
      .BYTE $F1, $56
      .BYTE $FF
LevelData_5_2_Area3:
      .BYTE $18, $E3, $11, $01
      .BYTE $F5, $0D, $13
      .BYTE $64, $31
      .BYTE $0A, $31
      .BYTE $13, $30
      .BYTE $06, $30
      .BYTE $09, $30
      .BYTE $0C, $30
      .BYTE $35, $35
      .BYTE $28, $25
      .BYTE $F0, $44
      .BYTE $F0, $65
      .BYTE $F0, $86
      .BYTE $F0, $A7
      .BYTE $F1, $86
      .BYTE $F1, $A8
      .BYTE $F1, $C4
      .BYTE $45, $35
      .BYTE $23, $32
      .BYTE $0A, $32
      .BYTE $25, $21
      .BYTE $08, $26
      .BYTE $F0, $02
      .BYTE $F0, $21
      .BYTE $F0, $C0
      .BYTE $FF
LevelData_5_2_Area4:
      .BYTE $81, $EA, $20, $12
      .BYTE $82, $0B
      .BYTE $0D, $36
      .BYTE $2A, $67
      .BYTE $2A, $FF
      .BYTE $F0, $6C
      .BYTE $F1, $48
      .BYTE $53, $10
      .BYTE $26, $11
      .BYTE $3E, $6D
      .BYTE $34, $69
      .BYTE $2A, $F3
      .BYTE $F1, $CC
      .BYTE $55, $10
      .BYTE $A0, $F9
      .BYTE $F0, $08
      .BYTE $F1, $4C
      .BYTE $F1, $8A
      .BYTE $F5, $0E, $00
      .BYTE $FF
LevelData_5_2_Area5:
      .BYTE $91, $EA, $10, $11
      .BYTE $F0, $70
      .BYTE $F2
      .BYTE $09, $A9
      .BYTE $F5, $0E, $10
      .BYTE $F0, $0F
      .BYTE $F1, $8A
      .BYTE $FF
LevelData_5_3_Area0:
      .BYTE $81, $E8, $92, $00
      .BYTE $22, $10
      .BYTE $16, $11
      .BYTE $28, $08
      .BYTE $15, $21
      .BYTE $06, $21
      .BYTE $0B, $26
      .BYTE $46, $A4
      .BYTE $F5, $0E, $01
      .BYTE $26, $05
      .BYTE $F0, $82
      .BYTE $F0, $C3
      .BYTE $F1, $84
      .BYTE $F1, $C0
      .BYTE $7D, $11
      .BYTE $3F, $29
      .BYTE $1D, $29
      .BYTE $13, $16
      .BYTE $04, $16
      .BYTE $18, $29
      .BYTE $0C, $82
      .BYTE $0D, $82
      .BYTE $27, $26
      .BYTE $08, $21
      .BYTE $09, $21
      .BYTE $52, $10
      .BYTE $16, $11
      .BYTE $55, $29
      .BYTE $21, $82
      .BYTE $04, $82
      .BYTE $0A, $82
      .BYTE $0C, $29
      .BYTE $0F, $26
      .BYTE $17, $81
      .BYTE $09, $29
      .BYTE $1C, $2B
      .BYTE $F1, $C1
      .BYTE $58, $10
      .BYTE $1B, $11
      .BYTE $1C, $10
      .BYTE $60, $21
      .BYTE $01, $21
      .BYTE $02, $21
      .BYTE $03, $21
      .BYTE $0C, $D2
      .BYTE $17, $29
      .BYTE $0D, $0F
      .BYTE $F0, $C0
      .BYTE $44, $1F
      .BYTE $9C, $D5
      .BYTE $6C, $1F
      .BYTE $32, $10
      .BYTE $18, $11
      .BYTE $3B, $21
      .BYTE $11, $21
      .BYTE $0A, $D3
      .BYTE $25, $C2
      .BYTE $F0, $88
      .BYTE $F1, $20
      .BYTE $F2
      .BYTE $9A, $16
      .BYTE $0B, $16
      .BYTE $90, $10
      .BYTE $13, $11
      .BYTE $08, $10
      .BYTE $5D, $83
      .BYTE $3F, $25
      .BYTE $F1, $C4
      .BYTE $3C, $1F
      .BYTE $63, $2A
      .BYTE $05, $26
      .BYTE $07, $2A
      .BYTE $34, $83
      .BYTE $0C, $DC
      .BYTE $28, $A3
      .BYTE $F5, $0E, $24
      .BYTE $11, $2D
      .BYTE $18, $05
      .BYTE $F1, $80
      .BYTE $5B, $10
      .BYTE $1E, $11
      .BYTE $5A, $16
      .BYTE $F1, $88
      .BYTE $FF
LevelData_5_3_Area1:
      .BYTE $91, $EA, $42, $11
      .BYTE $04, $1F
      .BYTE $7E, $D7
      .BYTE $18, $0B
      .BYTE $0E, $33
      .BYTE $F0, $4C
      .BYTE $7C, $1F
      .BYTE $6A, $21
      .BYTE $18, $DB
      .BYTE $F0, $88
      .BYTE $F1, $2C
      .BYTE $F2
      .BYTE $7D, $32
      .BYTE $12, $D2
      .BYTE $13, $D2
      .BYTE $09, $21
      .BYTE $3E, $24
      .BYTE $F1, $68
      .BYTE $F1, $8D
      .BYTE $C2, $83
      .BYTE $35, $25
      .BYTE $08, $21
      .BYTE $0A, $21
      .BYTE $0C, $21
      .BYTE $0E, $21
      .BYTE $F0, $15
      .BYTE $37, $A5
      .BYTE $F5, $0E, $18
      .BYTE $4A, $00
      .BYTE $1A, $04
      .BYTE $12, $80
      .BYTE $03, $80
      .BYTE $60, $26
      .BYTE $F0, $5A
      .BYTE $F0, $95
      .BYTE $F0, $EE
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_5_3_Area2:
      .BYTE $18, $E0, $61, $11
      .BYTE $68, $13
      .BYTE $0E, $40
      .BYTE $28, $33
      .BYTE $12, $31
      .BYTE $24, $31
      .BYTE $26, $31
      .BYTE $F0, $8A
      .BYTE $F0, $B3
      .BYTE $F1, $2A
      .BYTE $F1, $D3
      .BYTE $29, $31
      .BYTE $2C, $31
      .BYTE $12, $31
      .BYTE $25, $31
      .BYTE $27, $32
      .BYTE $22, $32
      .BYTE $0C, $31
      .BYTE $35, $31
      .BYTE $28, $32
      .BYTE $F0, $4A
      .BYTE $F0, $D3
      .BYTE $F1, $2A
      .BYTE $F1, $B3
      .BYTE $2C, $31
      .BYTE $12, $32
      .BYTE $25, $32
      .BYTE $38, $32
      .BYTE $3B, $32
      .BYTE $14, $34
      .BYTE $F0, $2A
      .BYTE $F0, $F3
      .BYTE $F1, $4A
      .BYTE $4C, $00
      .BYTE $0D, $00
      .BYTE $1A, $33
      .BYTE $33, $31
      .BYTE $26, $81
      .BYTE $07, $13
      .BYTE $0E, $20
      .BYTE $23, $32
      .BYTE $23, $32
      .BYTE $33, $32
      .BYTE $0A, $33
      .BYTE $0D, $00
      .BYTE $16, $85
      .BYTE $07, $85
      .BYTE $F0, $99
      .BYTE $F0, $CA
      .BYTE $F1, $0B
      .BYTE $F1, $D5
      .BYTE $23, $32
      .BYTE $1B, $32
      .BYTE $23, $31
      .BYTE $28, $04
      .BYTE $14, $38
      .BYTE $0D, $00
      .BYTE $33, $31
      .BYTE $1A, $00
      .BYTE $0B, $32
      .BYTE $23, $31
      .BYTE $F1, $0B
      .BYTE $33, $31
      .BYTE $06, $86
      .BYTE $07, $86
      .BYTE $08, $34
      .BYTE $0D, $00
      .BYTE $33, $31
      .BYTE $1B, $32
      .BYTE $23, $31
      .BYTE $28, $04
      .BYTE $14, $39
      .BYTE $0B, $00
      .BYTE $32, $00
      .BYTE $12, $00
      .BYTE $F0, $2A
      .BYTE $12, $00
      .BYTE $16, $33
      .BYTE $F0, $36
      .BYTE $F0, $80
      .BYTE $FF
LevelData_5_3_Area3:
      .BYTE $81, $E8, $90, $12
      .BYTE $02, $1F
      .BYTE $67, $0B
      .BYTE $0E, $30
      .BYTE $1F, $21
      .BYTE $16, $DF
      .BYTE $7A, $1F
      .BYTE $21, $10
      .BYTE $15, $11
      .BYTE $38, $D9
      .BYTE $10, $21
      .BYTE $01, $21
      .BYTE $02, $21
      .BYTE $AD, $10
      .BYTE $63, $D6
      .BYTE $E3, $11
      .BYTE $50, $10
      .BYTE $0D, $11
      .BYTE $3A, $1F
      .BYTE $B4, $10
      .BYTE $C7, $21
      .BYTE $09, $21
      .BYTE $0B, $21
      .BYTE $14, $D9
      .BYTE $98, $E2
      .BYTE $49, $E2
      .BYTE $13, $E3
      .BYTE $0F, $E2
      .BYTE $30, $E1
      .BYTE $A4, $E3
      .BYTE $1A, $D3
      .BYTE $1C, $0F
      .BYTE $38, $10
      .BYTE $0E, $D2
      .BYTE $1F, $0F
      .BYTE $54, $10
      .BYTE $28, $11
      .BYTE $52, $DE
      .BYTE $1A, $0F
      .BYTE $5C, $89
      .BYTE $0D, $89
      .BYTE $0E, $89
      .BYTE $0F, $89
      .BYTE $8A, $81
      .BYTE $0B, $81
      .BYTE $F0, $8D
      .BYTE $F1, $0C
      .BYTE $F5, $0E, $50
      .BYTE $FF
LevelData_5_3_Area4:
      .BYTE $AA, $EA, $12, $22
      .BYTE $F0, $4F
      .BYTE $F0, $CC
      .BYTE $F1, $4F
      .BYTE $F1, $D7
      .BYTE $F1, $EF
      .BYTE $F2
      .BYTE $F0, $16
      .BYTE $F0, $88
      .BYTE $F0, $B6
      .BYTE $F0, $C1
      .BYTE $F0, $EC
      .BYTE $F1, $EA
      .BYTE $7D, $91
      .BYTE $0E, $91
      .BYTE $1C, $90
      .BYTE $18, $37
      .BYTE $FF
LevelData_6_1_Area0:
      .BYTE $80, $ED, $90, $18
      .BYTE $00, $8C
      .BYTE $01, $8C
      .BYTE $02, $8C
      .BYTE $03, $8C
      .BYTE $4C, $10
      .BYTE $59, $16
      .BYTE $F1, $6D
      .BYTE $F6, $01
      .BYTE $AD, $10
      .BYTE $2C, $11
      .BYTE $64, $D1
      .BYTE $09, $D1
      .BYTE $68, $2B
      .BYTE $2A, $10
      .BYTE $55, $06
      .BYTE $2A, $D1
      .BYTE $F5, $0F, $60
      .BYTE $F1, $CD
      .BYTE $F6, $00
      .BYTE $66, $10
      .BYTE $79, $0F
      .BYTE $10, $0F
      .BYTE $11, $0F
      .BYTE $07, $0F
      .BYTE $F1, $8D
      .BYTE $F6, $02
      .BYTE $64, $11
      .BYTE $6F, $16
      .BYTE $32, $D1
      .BYTE $07, $D1
      .BYTE $F1, $CD
      .BYTE $F6, $00
      .BYTE $68, $10
      .BYTE $7E, $07
      .BYTE $2A, $D1
      .BYTE $F0, $4D
      .BYTE $F6, $01
      .BYTE $72, $11
      .BYTE $14, $10
      .BYTE $51, $07
      .BYTE $0E, $94
      .BYTE $26, $D1
      .BYTE $F0, $0D
      .BYTE $F6, $00
      .BYTE $F1, $EC
      .BYTE $F6, $03
      .BYTE $56, $10
      .BYTE $43, $0F
      .BYTE $09, $0F
      .BYTE $16, $0F
      .BYTE $11, $0F
      .BYTE $07, $0F
      .BYTE $14, $21
      .BYTE $08, $26
      .BYTE $05, $0F
      .BYTE $0A, $0F
      .BYTE $F0, $0C
      .BYTE $F6, $00
      .BYTE $94, $10
      .BYTE $2D, $0F
      .BYTE $2F, $0F
      .BYTE $17, $0F
      .BYTE $0B, $0F
      .BYTE $7C, $89
      .BYTE $0D, $89
      .BYTE $0E, $89
      .BYTE $0F, $89
      .BYTE $44, $10
      .BYTE $17, $54
      .BYTE $09, $2D
      .BYTE $17, $34
      .BYTE $18, $33
      .BYTE $17, $34
      .BYTE $09, $0B
      .BYTE $F5, $0F, $10
      .BYTE $16, $32
      .BYTE $0A, $31
      .BYTE $FF
LevelData_6_1_Area1:
      .BYTE $89, $EA, $30, $19
      .BYTE $46, $13
      .BYTE $F5, $0F, $09
      .BYTE $2D, $81
      .BYTE $0E, $81
      .BYTE $0F, $80
      .BYTE $3B, $81
      .BYTE $F0, $4E
      .BYTE $F1, $75
      .BYTE $F1, $BC
      .BYTE $C0, $80
      .BYTE $01, $80
      .BYTE $44, $00
      .BYTE $09, $06
      .BYTE $0F, $00
      .BYTE $10, $07
      .BYTE $02, $07
      .BYTE $04, $06
      .BYTE $05, $08
      .BYTE $06, $08
      .BYTE $07, $07
      .BYTE $0A, $07
      .BYTE $0B, $08
      .BYTE $0C, $06
      .BYTE $0D, $07
      .BYTE $0E, $07
      .BYTE $0F, $08
      .BYTE $F5, $0F, $50
      .BYTE $E7, $00
      .BYTE $10, $07
      .BYTE $01, $07
      .BYTE $02, $08
      .BYTE $03, $06
      .BYTE $04, $07
      .BYTE $05, $07
      .BYTE $06, $08
      .BYTE $07, $08
      .BYTE $F5, $0F, $30
      .BYTE $F1, $71
      .BYTE $AB, $32
      .BYTE $1B, $32
      .BYTE $1B, $32
      .BYTE $0C, $09
      .BYTE $F5, $0F, $20
      .BYTE $1B, $30
      .BYTE $0D, $30
      .BYTE $F1, $4F
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_6_1_Area2:
      .BYTE $89, $EA, $20, $1A
      .BYTE $83, $13
      .BYTE $F5, $0F, $13
      .BYTE $F0, $51
      .BYTE $B7, $83
      .BYTE $26, $81
      .BYTE $25, $32
      .BYTE $12, $00
      .BYTE $03, $00
      .BYTE $04, $00
      .BYTE $05, $32
      .BYTE $F0, $0C
      .BYTE $F2
      .BYTE $F0, $0F
      .BYTE $F0, $6A
      .BYTE $F5, $10, $00
      .BYTE $FF
LevelData_6_1_Area3:
      .BYTE $18, $E3, $21, $19
      .BYTE $F5, $0F, $12
      .BYTE $65, $31
      .BYTE $09, $31
      .BYTE $36, $33
      .BYTE $24, $31
      .BYTE $0A, $31
      .BYTE $F0, $44
      .BYTE $F0, $65
      .BYTE $F0, $86
      .BYTE $F0, $A7
      .BYTE $F1, $86
      .BYTE $F1, $A8
      .BYTE $F1, $CF
      .BYTE $F2
      .BYTE $F0, $4A
      .BYTE $F0, $CD
      .BYTE $F1, $6B
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_6_1_Area4:
      .BYTE $18, $E3, $01, $01
      .BYTE $64, $32
      .BYTE $09, $32
      .BYTE $34, $30
      .BYTE $0B, $30
      .BYTE $15, $35
      .BYTE $28, $24
      .BYTE $F0, $44
      .BYTE $F0, $65
      .BYTE $F0, $86
      .BYTE $F0, $A7
      .BYTE $F1, $66
      .BYTE $F1, $83
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_6_1_Area5:
      .BYTE $18, $E3, $21, $19
      .BYTE $F5, $0F, $11
      .BYTE $65, $31
      .BYTE $09, $31
      .BYTE $36, $33
      .BYTE $24, $31
      .BYTE $0A, $31
      .BYTE $F0, $44
      .BYTE $F0, $65
      .BYTE $F0, $86
      .BYTE $F0, $A7
      .BYTE $F1, $86
      .BYTE $F1, $A8
      .BYTE $F1, $CF
      .BYTE $C6, $82
      .BYTE $07, $82
      .BYTE $08, $82
      .BYTE $09, $82
      .BYTE $26, $27
      .BYTE $07, $22
      .BYTE $08, $22
      .BYTE $09, $27
      .BYTE $F0, $4A
      .BYTE $F0, $CD
      .BYTE $F1, $6B
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_6_1_Area6:
      .BYTE $18, $E3, $01, $01
      .BYTE $65, $31
      .BYTE $09, $31
      .BYTE $33, $31
      .BYTE $0B, $31
      .BYTE $17, $31
      .BYTE $26, $26
      .BYTE $F5, $0F, $02
      .BYTE $F0, $44
      .BYTE $F0, $65
      .BYTE $F0, $86
      .BYTE $F0, $A7
      .BYTE $F1, $86
      .BYTE $F1, $A8
      .BYTE $F1, $CF
      .BYTE $F6, $04
      .BYTE $FF
LevelData_6_2_Area0:
      .BYTE $91, $EA, $10, $19
      .BYTE $F0, $54
      .BYTE $F1, $8F
      .BYTE $F2
      .BYTE $4C, $14
      .BYTE $F5, $10, $10
      .BYTE $F0, $CE
      .BYTE $F1, $EA
      .BYTE $FF
LevelData_6_2_Area1:
      .BYTE $91, $EA, $90, $18
      .BYTE $00, $0E
      .BYTE $93, $0B
      .BYTE $F5, $10, $01
      .BYTE $19, $21
      .BYTE $F0, $81
      .BYTE $F1, $88
      .BYTE $F1, $E0
      .BYTE $F2
      .BYTE $F0, $88
      .BYTE $F2
      .BYTE $C9, $82
      .BYTE $0A, $82
      .BYTE $0B, $82
      .BYTE $F3
      .BYTE $8F, $86
      .BYTE $F2
      .BYTE $70, $26
      .BYTE $01, $21
      .BYTE $04, $2B
      .BYTE $10, $86
      .BYTE $01, $86
      .BYTE $04, $86
      .BYTE $05, $86
      .BYTE $F3
      .BYTE $F3
      .BYTE $4C, $0B
      .BYTE $F5, $10, $20
      .BYTE $40, $21
      .BYTE $10, $85
      .BYTE $01, $85
      .BYTE $F0, $8B
      .BYTE $F1, $8A
      .BYTE $FF
LevelData_6_2_Area2:
      .BYTE $91, $EA, $20, $1A
      .BYTE $43, $13
      .BYTE $F5, $10, $19
      .BYTE $F0, $4E
      .BYTE $F2
      .BYTE $6A, $00
      .BYTE $18, $32
      .BYTE $0E, $31
      .BYTE $34, $31
      .BYTE $28, $00
      .BYTE $09, $44
      .BYTE $F0, $90
      .BYTE $AA, $82
      .BYTE $0B, $82
      .BYTE $0C, $82
      .BYTE $0D, $82
      .BYTE $F5, $11, $00
      .BYTE $F0, $0E
      .BYTE $F1, $0F
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_6_3_Area0:
      .BYTE $89, $EA, $00, $01
      .BYTE $07, $A9
      .BYTE $F5, $11, $11
      .BYTE $F0, $50
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_6_3_Area1:
      .BYTE $80, $EC, $40, $00
      .BYTE $00, $89
      .BYTE $01, $89
      .BYTE $0A, $89
      .BYTE $0B, $89
      .BYTE $0C, $89
      .BYTE $0D, $89
      .BYTE $0E, $89
      .BYTE $0F, $89
      .BYTE $75, $0A
      .BYTE $F5, $11, $44
      .BYTE $24, $42
      .BYTE $F1, $0C
      .BYTE $F6, $01
      .BYTE $60, $89
      .BYTE $01, $89
      .BYTE $02, $89
      .BYTE $03, $89
      .BYTE $28, $10
      .BYTE $1A, $11
      .BYTE $3E, $0F
      .BYTE $28, $A6
      .BYTE $0C, $0F
      .BYTE $0F, $0F
      .BYTE $F5, $11, $00
      .BYTE $1A, $26
      .BYTE $18, $05
      .BYTE $38, $05
      .BYTE $F0, $CC
      .BYTE $F6, $00
      .BYTE $48, $11
      .BYTE $1D, $11
      .BYTE $14, $10
      .BYTE $54, $D1
      .BYTE $08, $D1
      .BYTE $0D, $0F
      .BYTE $F0, $4C
      .BYTE $F6, $02
      .BYTE $8A, $10
      .BYTE $14, $10
      .BYTE $0D, $11
      .BYTE $50, $2B
      .BYTE $10, $0F
      .BYTE $04, $D1
      .BYTE $0B, $D1
      .BYTE $0F, $2A
      .BYTE $F1, $CC
      .BYTE $F6, $00
      .BYTE $6B, $89
      .BYTE $0C, $89
      .BYTE $0D, $89
      .BYTE $0E, $89
      .BYTE $0F, $89
      .BYTE $0A, $97
      .BYTE $19, $1E
      .BYTE $F5, $11, $20
      .BYTE $FF
LevelData_6_3_Area2:
      .BYTE $91, $EA, $72, $19
      .BYTE $65, $15
      .BYTE $06, $13
      .BYTE $F5, $11, $14
      .BYTE $F0, $8F
      .BYTE $C4, $A4
      .BYTE $13, $29
      .BYTE $05, $29
      .BYTE $2D, $A1
      .BYTE $34, $04
      .BYTE $0F, $04
      .BYTE $1A, $39
      .BYTE $1A, $39
      .BYTE $1A, $39
      .BYTE $F1, $5B
      .BYTE $95, $A1
      .BYTE $0A, $A1
      .BYTE $3C, $04
      .BYTE $18, $36
      .BYTE $18, $36
      .BYTE $18, $36
      .BYTE $02, $29
      .BYTE $0E, $29
      .BYTE $F0, $91
      .BYTE $F1, $1B
      .BYTE $F1, $F1
      .BYTE $5D, $83
      .BYTE $36, $25
      .BYTE $07, $25
      .BYTE $12, $31
      .BYTE $12, $31
      .BYTE $12, $31
      .BYTE $10, $41
      .BYTE $02, $31
      .BYTE $04, $83
      .BYTE $12, $31
      .BYTE $07, $29
      .BYTE $12, $31
      .BYTE $05, $3A
      .BYTE $12, $31
      .BYTE $05, $3A
      .BYTE $F0, $5C
      .BYTE $F0, $95
      .BYTE $90, $37
      .BYTE $10, $37
      .BYTE $10, $37
      .BYTE $10, $37
      .BYTE $08, $83
      .BYTE $09, $83
      .BYTE $0F, $83
      .BYTE $10, $37
      .BYTE $10, $37
      .BYTE $1A, $54
      .BYTE $00, $37
      .BYTE $F0, $1C
      .BYTE $F1, $15
      .BYTE $34, $88
      .BYTE $0D, $88
      .BYTE $50, $25
      .BYTE $02, $25
      .BYTE $06, $26
      .BYTE $0A, $25
      .BYTE $0C, $25
      .BYTE $0E, $25
      .BYTE $38, $80
      .BYTE $19, $83
      .BYTE $0A, $83
      .BYTE $32, $25
      .BYTE $0F, $25
      .BYTE $F0, $88
      .BYTE $F0, $B5
      .BYTE $F1, $1C
      .BYTE $F1, $35
      .BYTE $F1, $A8
      .BYTE $F1, $D5
      .BYTE $7D, $A8
      .BYTE $17, $25
      .BYTE $1D, $05
      .BYTE $12, $81
      .BYTE $23, $83
      .BYTE $31, $25
      .BYTE $00, $2D
      .BYTE $04, $52
      .BYTE $08, $52
      .BYTE $F0, $5C
      .BYTE $F0, $75
      .BYTE $F1, $BC
      .BYTE $F1, $D1
      .BYTE $B8, $12
      .BYTE $F1, $0C
      .BYTE $F1, $2A
      .BYTE $F5, $11, $39
      .BYTE $FF
LevelData_6_3_Area3:
      .BYTE $00, $F3, $90, $08
      .BYTE $34, $E1
      .BYTE $48, $E1
      .BYTE $67, $12
      .BYTE $F5, $11, $40
      .BYTE $32, $E1
      .BYTE $09, $E4
      .BYTE $54, $12
      .BYTE $18, $12
      .BYTE $09, $12
      .BYTE $0A, $12
      .BYTE $0B, $12
      .BYTE $0C, $12
      .BYTE $84, $E1
      .BYTE $3A, $E2
      .BYTE $22, $12
      .BYTE $1D, $12
      .BYTE $16, $E1
      .BYTE $54, $12
      .BYTE $3C, $12
      .BYTE $2B, $12
      .BYTE $26, $12
      .BYTE $0A, $12
      .BYTE $44, $E7
      .BYTE $34, $12
      .BYTE $05, $12
      .BYTE $16, $12
      .BYTE $27, $12
      .BYTE $08, $12
      .BYTE $0C, $E1
      .BYTE $24, $00
      .BYTE $0A, $00
      .BYTE $13, $E1
      .BYTE $0A, $E2
      .BYTE $55, $E4
      .BYTE $36, $E2
      .BYTE $21, $E1
      .BYTE $4A, $12
      .BYTE $0D, $12
      .BYTE $34, $12
      .BYTE $16, $E2
      .BYTE $52, $12
      .BYTE $04, $E1
      .BYTE $40, $EB
      .BYTE $0C, $03
      .BYTE $0D, $E2
      .BYTE $51, $EA
      .BYTE $0C, $03
      .BYTE $0D, $E1
      .BYTE $32, $12
      .BYTE $03, $12
      .BYTE $04, $12
      .BYTE $05, $12
      .BYTE $08, $12
      .BYTE $09, $12
      .BYTE $0A, $12
      .BYTE $2C, $12
      .BYTE $17, $12
      .BYTE $87, $E1
      .BYTE $11, $12
      .BYTE $0D, $12
      .BYTE $32, $E2
      .BYTE $09, $E2
      .BYTE $36, $E1
      .BYTE $18, $12
      .BYTE $59, $E1
      .BYTE $55, $12
      .BYTE $46, $12
      .BYTE $29, $12
      .BYTE $F0, $34
      .BYTE $F2
      .BYTE $07, $0C
      .BYTE $F5, $11, $27
      .BYTE $F0, $18
      .BYTE $F0, $57
      .BYTE $F4
      .BYTE $44, $0D
      .BYTE $48, $0D
      .BYTE $92, $0D
      .BYTE $0D, $0D
      .BYTE $F2
      .BYTE $4A, $0D
      .BYTE $0B, $0D
      .BYTE $0C, $0D
      .BYTE $46, $0D
      .BYTE $B3, $0C
      .BYTE $BD, $0D
      .BYTE $34, $0D
      .BYTE $0A, $0D
      .BYTE $A2, $0D
      .BYTE $BC, $0C
      .BYTE $6C, $0D
      .BYTE $51, $0D
      .BYTE $0D, $0D
      .BYTE $B5, $0C
      .BYTE $19, $0C
      .BYTE $0A, $0C
      .BYTE $0B, $0C
      .BYTE $96, $0D
      .BYTE $CE, $86
      .BYTE $2D, $84
      .BYTE $2B, $82
      .BYTE $0C, $82
      .BYTE $59, $8C
      .BYTE $26, $8A
      .BYTE $08, $8A
      .BYTE $97, $03
      .BYTE $17, $03
      .BYTE $FF
LevelData_6_3_Area4:
      .BYTE $80, $E8, $40, $00
      .BYTE $24, $10
      .BYTE $28, $0C
      .BYTE $F5, $11, $30
      .BYTE $0E, $11
      .BYTE $90, $E7
      .BYTE $08, $03
      .BYTE $09, $EF
      .BYTE $50, $10
      .BYTE $28, $11
      .BYTE $6C, $3F
      .BYTE $1A, $3E
      .BYTE $1E, $3F
      .BYTE $40, $10
      .BYTE $22, $11
      .BYTE $07, $17
      .BYTE $59, $0B
      .BYTE $F5, $11, $50
      .BYTE $2C, $37
      .BYTE $19, $3C
      .BYTE $1E, $33
      .BYTE $13, $39
      .BYTE $48, $11
      .BYTE $19, $E2
      .BYTE $12, $10
      .BYTE $F2
      .BYTE $2A, $0A
      .BYTE $F5, $11, $10
      .BYTE $20, $E1
      .BYTE $04, $E1
      .BYTE $09, $E2
      .BYTE $4D, $11
      .BYTE $13, $10
      .BYTE $28, $11
      .BYTE $FF
LevelData_6_3_Area5:
      .BYTE $A0, $EA, $13, $22
      .BYTE $86, $13
      .BYTE $F5, $11, $42
      .BYTE $F0, $AF
      .BYTE $C3, $32
      .BYTE $07, $36
      .BYTE $46, $00
      .BYTE $F0, $11
      .BYTE $F0, $6C
      .BYTE $F1, $4B
      .BYTE $F1, $CA
      .BYTE $F5, $11, $60
      .BYTE $FF
LevelData_6_3_Area6:
      .BYTE $AA, $F8, $13, $2A
      .BYTE $F0, $50
      .BYTE $F0, $CD
      .BYTE $F1, $0C
      .BYTE $F1, $4F
      .BYTE $F1, $8E
      .BYTE $F2
      .BYTE $8B, $81
      .BYTE $15, $32
      .BYTE $32, $00
      .BYTE $03, $00
      .BYTE $04, $00
      .BYTE $05, $00
      .BYTE $06, $00
      .BYTE $07, $00
      .BYTE $08, $00
      .BYTE $F0, $50
      .BYTE $F1, $37
      .BYTE $F1, $6F
      .BYTE $F1, $97
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_7_1_Area0:
      .BYTE $00, $F3, $00, $00
      .BYTE $03, $A3
      .BYTE $F5, $12, $12
      .BYTE $43, $E5
      .BYTE $20, $86
      .BYTE $01, $86
      .BYTE $18, $E3
      .BYTE $3A, $E3
      .BYTE $30, $EF
      .BYTE $FF
LevelData_7_1_Area1:
      .BYTE $80, $E8, $63, $00
      .BYTE $27, $A9
      .BYTE $74, $23
      .BYTE $F5, $12, $20
      .BYTE $13, $81
      .BYTE $04, $81
      .BYTE $05, $81
      .BYTE $0A, $E3
      .BYTE $22, $E9
      .BYTE $64, $E3
      .BYTE $B6, $80
      .BYTE $0C, $80
      .BYTE $3E, $11
      .BYTE $6C, $A6
      .BYTE $F5, $12, $00
      .BYTE $2D, $E2
      .BYTE $36, $E5
      .BYTE $0C, $05
      .BYTE $0D, $E4
      .BYTE $41, $10
      .BYTE $7E, $01
      .BYTE $31, $3C
      .BYTE $0F, $33
      .BYTE $2E, $80
      .BYTE $34, $10
      .BYTE $17, $11
      .BYTE $76, $52
      .BYTE $07, $2B
      .BYTE $0A, $22
      .BYTE $15, $C6
      .BYTE $1E, $3A
      .BYTE $23, $80
      .BYTE $0D, $80
      .BYTE $3D, $10
      .BYTE $69, $26
      .BYTE $1D, $00
      .BYTE $1C, $E7
      .BYTE $49, $80
      .BYTE $57, $21
      .BYTE $33, $04
      .BYTE $13, $00
      .BYTE $11, $EE
      .BYTE $F4
      .BYTE $42, $0F
      .BYTE $06, $0F
      .BYTE $DC, $0F
      .BYTE $26, $0F
      .BYTE $E7, $0F
      .BYTE $F2
      .BYTE $90, $0F
      .BYTE $1E, $0F
      .BYTE $E3, $0F
      .BYTE $1D, $0F
      .BYTE $E9, $0F
      .BYTE $B6, $C4
      .BYTE $1D, $0F
      .BYTE $18, $0A
      .BYTE $F5, $12, $50
      .BYTE $FF
LevelData_7_1_Area2:
      .BYTE $80, $E8, $30, $00
      .BYTE $3C, $11
      .BYTE $19, $10
      .BYTE $5F, $EB
      .BYTE $34, $E7
      .BYTE $0C, $E9
      .BYTE $54, $10
      .BYTE $1B, $29
      .BYTE $5C, $E6
      .BYTE $31, $29
      .BYTE $02, $E8
      .BYTE $19, $EA
      .BYTE $5C, $29
      .BYTE $43, $ED
      .BYTE $23, $04
      .BYTE $06, $EA
      .BYTE $10, $EE
      .BYTE $18, $E7
      .BYTE $12, $EF
      .BYTE $23, $EC
      .BYTE $2C, $A7
      .BYTE $F5, $12, $33
      .BYTE $71, $29
      .BYTE $12, $EB
      .BYTE $20, $29
      .BYTE $02, $E5
      .BYTE $28, $E5
      .BYTE $10, $E3
      .BYTE $F4
      .BYTE $95, $0F
      .BYTE $DB, $0F
      .BYTE $CF, $0F
      .BYTE $12, $0F
      .BYTE $AB, $0F
      .BYTE $81, $0F
      .BYTE $FF
LevelData_7_1_Area3:
      .BYTE $00, $F3, $30, $00
      .BYTE $64, $A6
      .BYTE $0A, $A6
      .BYTE $22, $E1
      .BYTE $04, $05
      .BYTE $05, $E4
      .BYTE $0A, $05
      .BYTE $0B, $E1
      .BYTE $37, $AA
      .BYTE $21, $E5
      .BYTE $07, $05
      .BYTE $08, $E5
      .BYTE $66, $AB
      .BYTE $08, $AB
      .BYTE $14, $AA
      .BYTE $0A, $AA
      .BYTE $21, $E2
      .BYTE $0B, $E2
      .BYTE $80, $EF
      .BYTE $76, $00
      .BYTE $07, $00
      .BYTE $08, $00
      .BYTE $09, $00
      .BYTE $12, $A7
      .BYTE $05, $00
      .BYTE $0A, $00
      .BYTE $15, $00
      .BYTE $0A, $00
      .BYTE $10, $E1
      .BYTE $02, $05
      .BYTE $03, $EC
      .BYTE $85, $00
      .BYTE $0A, $00
      .BYTE $0C, $00
      .BYTE $10, $EF
      .BYTE $30, $EF
      .BYTE $3A, $E3
      .BYTE $13, $A3
      .BYTE $F5, $12, $23
      .BYTE $20, $E2
      .BYTE $03, $05
      .BYTE $04, $EB
      .BYTE $F4
      .BYTE $35, $C4
      .BYTE $23, $0F
      .BYTE $0B, $0F
      .BYTE $17, $0A
      .BYTE $F5, $12, $40
      .BYTE $C2, $0F
      .BYTE $0C, $0F
      .BYTE $FF
LevelData_7_1_Area4:
      .BYTE $A1, $EA, $10, $02
      .BYTE $48, $0A
      .BYTE $F5, $12, $30
      .BYTE $0C, $33
      .BYTE $F0, $8B
      .BYTE $F1, $6C
      .BYTE $F2
      .BYTE $74, $39
      .BYTE $1A, $43
      .BYTE $1A, $43
      .BYTE $00, $00
      .BYTE $F0, $8D
      .BYTE $F1, $4C
      .BYTE $F1, $CA
      .BYTE $F5, $13, $00
      .BYTE $FF
LevelData_7_1_Area5:
      .BYTE $A1, $EA, $00, $01
      .BYTE $4C, $00
      .BYTE $21, $2D
      .BYTE $02, $21
      .BYTE $03, $21
      .BYTE $04, $21
      .BYTE $05, $21
      .BYTE $06, $26
      .BYTE $07, $51
      .BYTE $11, $38
      .BYTE $3A, $32
      .BYTE $17, $0A
      .BYTE $F5, $12, $16
      .BYTE $F0, $3C
      .BYTE $F1, $EA
      .BYTE $FF
LevelData_7_2_Area0:
      .BYTE $80, $FF, $20, $00
      .BYTE $80, $E5
      .BYTE $0D, $E5
      .BYTE $2A, $E5
      .BYTE $36, $E5
      .BYTE $52, $10
      .BYTE $1A, $10
      .BYTE $1C, $10
      .BYTE $63, $E6
      .BYTE $0B, $E6
      .BYTE $62, $10
      .BYTE $47, $B5
      .BYTE $52, $65
      .BYTE $27, $E8
      .BYTE $F5, $13, $10
      .BYTE $F4
      .BYTE $20, $C4, $4F, $0F
      .BYTE $F2
      .BYTE $95, $0F
      .BYTE $0E, $0F
      .BYTE $68, $19
      .BYTE $0E, $19
      .BYTE $3B, $1D
      .BYTE $0E, $1D
      .BYTE $27, $40
      .BYTE $28, $1C
      .BYTE $28, $0B
      .BYTE $FF
LevelData_7_2_Area1:
      .BYTE $A1, $EA, $65, $01
      .BYTE $87, $13
      .BYTE $F5, $13, $02
      .BYTE $22, $3D
      .BYTE $F0, $50
      .BYTE $85, $84
      .BYTE $0B, $84
      .BYTE $6F, $04
      .BYTE $10, $3E
      .BYTE $F0, $34
      .BYTE $F0, $70
      .BYTE $F1, $14
      .BYTE $F1, $50
      .BYTE $F1, $94
      .BYTE $F1, $B0
      .BYTE $F1, $EF
      .BYTE $D1, $4E
      .BYTE $42, $7D
      .BYTE $F0, $17
      .BYTE $F0, $50
      .BYTE $CD, $04
      .BYTE $10, $4C
      .BYTE $0D, $82
      .BYTE $0E, $43
      .BYTE $20, $7C
      .BYTE $0E, $75
      .BYTE $F1, $14
      .BYTE $F1, $50
      .BYTE $A2, $3D
      .BYTE $27, $80
      .BYTE $17, $A4
      .BYTE $F5, $13, $60
      .BYTE $0E, $4F
      .BYTE $14, $81
      .BYTE $27, $03
      .BYTE $90, $35
      .BYTE $3E, $46
      .BYTE $24, $76
      .BYTE $0C, $78
      .BYTE $38, $A6
      .BYTE $F5, $13, $22
      .BYTE $86, $84
      .BYTE $07, $84
      .BYTE $08, $84
      .BYTE $45, $80
      .BYTE $F1, $2A
      .BYTE $FF
LevelData_7_2_Area2:
      .BYTE $A1, $EA, $95, $01
      .BYTE $88, $0A
      .BYTE $F5, $13, $93
      .BYTE $13, $2B
      .BYTE $05, $0F
      .BYTE $0B, $0F
      .BYTE $13, $0F
      .BYTE $0D, $0F
      .BYTE $24, $2A
      .BYTE $0C, $26
      .BYTE $F0, $50
      .BYTE $F0, $EF
      .BYTE $F1, $50
      .BYTE $F1, $EA
      .BYTE $38, $A9
      .BYTE $F5, $13, $86
      .BYTE $3C, $81
      .BYTE $0D, $80
      .BYTE $3A, $A3
      .BYTE $5C, $81
      .BYTE $1D, $80
      .BYTE $F0, $10
      .BYTE $F0, $91
      .BYTE $F1, $90
      .BYTE $62, $80
      .BYTE $03, $81
      .BYTE $35, $A3
      .BYTE $07, $A8
      .BYTE $F5, $13, $16
      .BYTE $47, $03
      .BYTE $13, $81
      .BYTE $12, $80
      .BYTE $17, $03
      .BYTE $F0, $91
      .BYTE $F1, $0A
      .BYTE $28, $A9
      .BYTE $F5, $13, $73
      .BYTE $3C, $81
      .BYTE $0D, $80
      .BYTE $3A, $A3
      .BYTE $5C, $81
      .BYTE $1D, $80
      .BYTE $F1, $11
      .BYTE $F1, $90
      .BYTE $62, $80
      .BYTE $03, $81
      .BYTE $35, $A3
      .BYTE $53, $81
      .BYTE $08, $0A
      .BYTE $F5, $13, $66
      .BYTE $12, $80
      .BYTE $F0, $91
      .BYTE $F0, $FB
      .BYTE $F1, $4A
      .BYTE $38, $A7
      .BYTE $F5, $13, $41
      .BYTE $98, $4E
      .BYTE $F1, $11
      .BYTE $F1, $CF
      .BYTE $97, $AB
      .BYTE $F5, $13, $70
      .BYTE $A7, $03
      .BYTE $F0, $F0
      .BYTE $F1, $CA
      .BYTE $98, $0A
      .BYTE $F5, $13, $43
      .BYTE $25, $3D
      .BYTE $F0, $AF
      .BYTE $62, $A7
      .BYTE $F5, $13, $44
      .BYTE $86, $2D
      .BYTE $16, $0F
      .BYTE $19, $0F
      .BYTE $0F, $0F
      .BYTE $1C, $0F
      .BYTE $1B, $26
      .BYTE $0D, $2A
      .BYTE $F0, $6A
      .BYTE $F0, $DC
      .BYTE $7C, $0A
      .BYTE $F5, $13, $32
      .BYTE $52, $0F
      .BYTE $F0, $6E
      .BYTE $F1, $CA
      .BYTE $FF
LevelData_7_2_Area3:
      .BYTE $A1, $EA, $34, $01
      .BYTE $5C, $40
      .BYTE $1C, $A4
      .BYTE $25, $0A
      .BYTE $F5, $13, $63
      .BYTE $24, $33
      .BYTE $F0, $50
      .BYTE $80, $4F
      .BYTE $10, $A7
      .BYTE $05, $A7
      .BYTE $0C, $A7
      .BYTE $80, $4F
      .BYTE $60, $4F
      .BYTE $10, $4F
      .BYTE $10, $A5
      .BYTE $35, $35
      .BYTE $13, $0A
      .BYTE $F5, $13, $29
      .BYTE $20, $4F
      .BYTE $10, $4F
      .BYTE $90, $A3
      .BYTE $28, $0A
      .BYTE $F5, $13, $69
      .BYTE $F0, $11
      .BYTE $F1, $4A
      .BYTE $FF
LevelData_7_2_Area4:
      .BYTE $A1, $EA, $95, $02
      .BYTE $3F, $A7
      .BYTE $36, $80
      .BYTE $16, $A3
      .BYTE $43, $0A
      .BYTE $F5, $13, $80
      .BYTE $19, $01
      .BYTE $F0, $50
      .BYTE $80, $87
      .BYTE $01, $87
      .BYTE $02, $3D
      .BYTE $47, $80
      .BYTE $0B, $81
      .BYTE $0E, $81
      .BYTE $0F, $81
      .BYTE $17, $A4
      .BYTE $F5, $13, $25
      .BYTE $37, $03
      .BYTE $70, $3F
      .BYTE $55, $0F
      .BYTE $0B, $0F
      .BYTE $14, $0F
      .BYTE $08, $09
      .BYTE $F5, $13, $47
      .BYTE $0C, $0F
      .BYTE $90, $3F
      .BYTE $52, $80
      .BYTE $05, $80
      .BYTE $17, $0A
      .BYTE $F5, $13, $27
      .BYTE $7A, $A6
      .BYTE $0D, $AB
      .BYTE $20, $37
      .BYTE $08, $87
      .BYTE $09, $87
      .BYTE $8D, $03
      .BYTE $F5, $13, $28
      .BYTE $F1, $CA
      .BYTE $F3
      .BYTE $F2
      .BYTE $B7, $0A
      .BYTE $F5, $13, $42
      .BYTE $F0, $50
      .BYTE $E3, $00
      .BYTE $08, $00
      .BYTE $13, $0F
      .BYTE $08, $0F
      .BYTE $F2
      .BYTE $A4, $0F
      .BYTE $12, $0F
      .BYTE $03, $0F
      .BYTE $05, $0F
      .BYTE $06, $0F
      .BYTE $F1, $4F
      .BYTE $F1, $8A
      .BYTE $F5, $13, $50
      .BYTE $FF
LevelData_7_2_Area5:
      .BYTE $AA, $EA, $22, $0B
      .BYTE $3D, $2C
      .BYTE $62, $48
      .BYTE $F0, $4F
      .BYTE $F0, $AC
      .BYTE $F1, $6E
      .BYTE $90, $2C
      .BYTE $03, $2C
      .BYTE $06, $2C
      .BYTE $1D, $2C
      .BYTE $4F, $32
      .BYTE $29, $44
      .BYTE $F1, $3A
      .BYTE $F1, $DC
      .BYTE $90, $2C
      .BYTE $03, $2C
      .BYTE $06, $2C
      .BYTE $09, $2C
      .BYTE $34, $32
      .BYTE $22, $1A
      .BYTE $10, $1A
      .BYTE $04, $1A
      .BYTE $08, $0F
      .BYTE $09, $44
      .BYTE $12, $41
      .BYTE $10, $45
      .BYTE $F1, $7A
      .BYTE $F1, $D8
      .BYTE $FF
LevelData_7_2_Area6:
      .BYTE $21, $E0, $97, $01
      .BYTE $08, $A5
      .BYTE $F5, $13, $14
      .BYTE $92, $4B
      .BYTE $42, $4B
      .BYTE $F0, $55
      .BYTE $F1, $DC
      .BYTE $33, $29
      .BYTE $22, $4B
      .BYTE $42, $4B
      .BYTE $3C, $29
      .BYTE $22, $4B
      .BYTE $F0, $75
      .BYTE $F1, $1C
      .BYTE $F1, $95
      .BYTE $42, $4B
      .BYTE $3C, $29
      .BYTE $22, $4B
      .BYTE $42, $4B
      .BYTE $33, $29
      .BYTE $F0, $5C
      .BYTE $F0, $D5
      .BYTE $F1, $7C
      .BYTE $22, $4B
      .BYTE $37, $29
      .BYTE $12, $4B
      .BYTE $7A, $0A
      .BYTE $F5, $13, $30
      .BYTE $F0, $15
      .BYTE $F1, $A0
      .BYTE $F3
      .BYTE $F2
      .BYTE $48, $AA
      .BYTE $27, $0A
      .BYTE $F5, $13, $24
      .BYTE $28, $03
      .BYTE $F0, $97
      .BYTE $F1, $00
      .BYTE $78, $AE
      .BYTE $5A, $29
      .BYTE $15, $29
      .BYTE $38, $03
      .BYTE $3A, $29
      .BYTE $16, $29
      .BYTE $F0, $76
      .BYTE $F1, $20
      .BYTE $F1, $56
      .BYTE $28, $A4
      .BYTE $18, $03
      .BYTE $3B, $29
      .BYTE $14, $29
      .BYTE $18, $A5
      .BYTE $28, $03
      .BYTE $46, $29
      .BYTE $0A, $29
      .BYTE $18, $AB
      .BYTE $F0, $20
      .BYTE $F0, $56
      .BYTE $F1, $00
      .BYTE $F1, $36
      .BYTE $28, $03
      .BYTE $B7, $0A
      .BYTE $F5, $13, $33
      .BYTE $F0, $00
      .BYTE $F1, $17
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_7_2_Area7:
      .BYTE $21, $E0, $35, $01
      .BYTE $08, $A4
      .BYTE $F5, $13, $26
      .BYTE $76, $33
      .BYTE $34, $37
      .BYTE $31, $33
      .BYTE $0B, $43
      .BYTE $F0, $54
      .BYTE $35, $36
      .BYTE $15, $46
      .BYTE $25, $46
      .BYTE $15, $36
      .BYTE $22, $42
      .BYTE $33, $44
      .BYTE $38, $33
      .BYTE $F0, $F5
      .BYTE $3B, $42
      .BYTE $26, $73
      .BYTE $0C, $31
      .BYTE $46, $35
      .BYTE $33, $39
      .BYTE $36, $33
      .BYTE $F0, $9C
      .BYTE $F0, $B4
      .BYTE $33, $49
      .BYTE $32, $49
      .BYTE $2C, $42
      .BYTE $24, $37
      .BYTE $17, $80
      .BYTE $11, $32
      .BYTE $07, $A4
      .BYTE $F5, $13, $23
      .BYTE $37, $03
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_7_2_Area8:
      .BYTE $21, $E0, $64, $01
      .BYTE $28, $A8
      .BYTE $2C, $0A
      .BYTE $F5, $13, $40
      .BYTE $29, $45
      .BYTE $F0, $54
      .BYTE $95, $35
      .BYTE $52, $32
      .BYTE $45, $33
      .BYTE $48, $34
      .BYTE $34, $37
      .BYTE $32, $33
      .BYTE $2C, $31
      .BYTE $46, $32
      .BYTE $38, $33
      .BYTE $F0, $95
      .BYTE $35, $35
      .BYTE $52, $33
      .BYTE $15, $AD
      .BYTE $07, $33
      .BYTE $12, $0A
      .BYTE $F5, $13, $90
      .BYTE $22, $32
      .BYTE $05, $03
      .BYTE $0A, $31
      .BYTE $1A, $A9
      .BYTE $2A, $03
      .BYTE $0B, $32
      .BYTE $F1, $5C
      .BYTE $81, $86
      .BYTE $14, $30
      .BYTE $06, $33
      .BYTE $0B, $30
      .BYTE $34, $36
      .BYTE $31, $AF
      .BYTE $04, $36
      .BYTE $F0, $D4
      .BYTE $31, $03
      .BYTE $74, $A6
      .BYTE $06, $A6
      .BYTE $07, $82
      .BYTE $08, $A6
      .BYTE $0A, $A6
      .BYTE $0D, $AE
      .BYTE $F0, $20
      .BYTE $F1, $14
      .BYTE $7D, $03
      .BYTE $4E, $A8
      .BYTE $37, $40
      .BYTE $17, $A6
      .BYTE $F5, $13, $21
      .BYTE $57, $03
      .BYTE $F0, $00
      .BYTE $F0, $94
      .BYTE $F1, $A0
      .BYTE $F4
      .BYTE $D6, $0F
      .BYTE $09, $0F
      .BYTE $53, $0F
      .BYTE $46, $0F
      .BYTE $3A, $0F
      .BYTE $B7, $0F
      .BYTE $2A, $0F
      .BYTE $B6, $0F
      .BYTE $FF
LevelData_7_2_Area9:
      .BYTE $01, $FE, $30, $00
      .BYTE $28, $10
      .BYTE $4D, $81
      .BYTE $2B, $AD
      .BYTE $0D, $0A
      .BYTE $F5, $13, $83
      .BYTE $2B, $05
      .BYTE $0C, $41
      .BYTE $22, $10
      .BYTE $46, $10
      .BYTE $4C, $AA
      .BYTE $2B, $80
      .BYTE $0C, $05
      .BYTE $11, $10
      .BYTE $28, $11
      .BYTE $4B, $AA
      .BYTE $15, $10
      .BYTE $1B, $05
      .BYTE $0C, $80
      .BYTE $7C, $AA
      .BYTE $11, $10
      .BYTE $1B, $80
      .BYTE $0C, $05
      .BYTE $24, $35
      .BYTE $14, $35
      .BYTE $14, $35
      .BYTE $14, $35
      .BYTE $14, $33
      .BYTE $08, $AB
      .BYTE $14, $33
      .BYTE $14, $33
      .BYTE $18, $05
      .BYTE $77, $0A
      .BYTE $F5, $13, $20
      .BYTE $F0, $80
      .BYTE $F1, $57
      .BYTE $F1, $A0
      .BYTE $FF
LevelData_7_3_Area0:
      .BYTE $FF
LevelData_Unused:
      .PAD $A500,$FF
EnemyPointersByLevel_HiHi:
      .BYTE >EnemyPointers_Level_1_1_Hi

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
      .BYTE <EnemyPointers_Level_1_1_Hi

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
      .BYTE >EnemyPointers_Level_1_1_Lo

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
      .BYTE <EnemyPointers_Level_1_1_Lo

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
      .BYTE $03,$23,$05
      .BYTE $01
EnemyPointers_Level_2_2_Area2:
      .BYTE $07,$03,$B8,$03,$F8,$03,$FB
      .BYTE $01
      .BYTE $01
      .BYTE $01 ; ??? This area only has 3 pages, so this should stop here
      .BYTE $01 ; But for some reason it continues for several more pages
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
      .BYTE $03,$49,$00
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
      .BYTE $03,$49,$08
      .BYTE $03,$48,$0E
      .BYTE $03,$48,$02
      .BYTE $05,$12,$92,$49,$09
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
      .BYTE $03,$24,$05
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
      .BYTE $03,$48,$00
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
      .BYTE $01 ; and a fucking billion empty pages.
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
      .BYTE $03,$47,$00
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
      .BYTE $05,$0B,$0C,$0B,$26
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
