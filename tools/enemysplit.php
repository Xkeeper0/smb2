<?php

      $asm  = <<<'E'
EnemyData_Level_1_1_Area0:
      .BYTE $01
      .BYTE $01
      .BYTE $05,$03,$76,$03,$6C
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_1_1_Area1:
      .BYTE $05,$14,$56,$14,$AD
      .BYTE $03,$03,$9D
      .BYTE $07,$0E,$83,$0E,$79,$03,$BC
      .BYTE $05,$0E,$90,$0E,$75
      .BYTE $01
;---
EnemyData_Level_1_1_Area2:
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
;---
EnemyData_Level_1_1_Area3:
      .BYTE $03,$03,$85
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_1_1_Area4:
      .BYTE $03,$0E,$BC
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_1_1_Area5:
      .BYTE $01

      .BYTE $01
      .BYTE $07,$1C,$A7,$44,$A8,$43,$E7
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_1_2_Area0:
      .BYTE $03,$42,$6A
      .BYTE $03,$12,$22
      .BYTE $09,$0F,$00,$0F,$40,$0F,$90,$0F,$E0
      .BYTE $01
      .BYTE $05,$0E,$3C,$0E,$6C
      .BYTE $05,$06,$53,$0D,$83
      .BYTE $05,$01,$B6,$01,$F6
      .BYTE $01
;---
EnemyData_Level_1_2_Area1:
      .BYTE $03,$01,$DC
      .BYTE $03,$07,$3C
      .BYTE $03,$06,$2C
      .BYTE $05,$0D,$79,$0D,$89
      .BYTE $01
;---
EnemyData_Level_1_2_Area2:
      .BYTE $01

      .BYTE $05,$1C,$A7,$44,$A8
      .BYTE $03,$43,$38
      .BYTE $01
;---
EnemyData_Level_1_2_Area3:
      .BYTE $05,$3D,$79,$17,$77
      .BYTE $01
;---
EnemyData_Level_1_2_Area4:
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
;---
EnemyData_Level_1_2_Area5:
      .BYTE $01

      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_1_3_Area0:
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
;---
EnemyData_Level_1_3_Area1:
      .BYTE $07,$17,$83,$3D,$88,$2E,$8A
      .BYTE $01
;---
EnemyData_Level_1_3_Area2:
      .BYTE $07,$2E,$4B,$30,$7C,$30,$C9
      .BYTE $01
      .BYTE $07,$30,$61,$31,$5A,$03,$BA
      .BYTE $03,$01,$DB
      .BYTE $03,$06,$4A
      .BYTE $03,$03,$35
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_1_3_Area3:
      .BYTE $03,$31,$C9
      .BYTE $03,$2F,$C6
      .BYTE $09,$02,$56,$07,$D4,$07,$D7,$07,$DA
      .BYTE $05,$30,$A7,$30,$F7
      .BYTE $05,$2E,$3A,$2E,$6A
      .BYTE $09,$0D,$09,$0D,$29,$44,$A8,$43,$D7
      .BYTE $01
;---
EnemyData_Level_1_3_Area4:
      .BYTE $03,$30,$F6
      .BYTE $03,$5D,$D7
      .BYTE $01
;---
EnemyData_Level_2_1_Area0:
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
;---
EnemyData_Level_2_1_Area1:
      .BYTE $05,$01,$49,$01,$6D
      .BYTE $03,$01,$D3
      .BYTE $07,$01,$40,$06,$16,$01,$C8
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_2_1_Area2:
      .BYTE $01

      .BYTE $05,$1C,$A8,$44,$A9
      .BYTE $03,$43,$D3
      .BYTE $01
;---
EnemyData_Level_2_1_Area4:
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
;---
EnemyData_Level_2_2_Area0:
      .BYTE $03,$42,$5A
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_2_2_Area1:
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
;---
EnemyData_Level_2_2_Area2:
      .BYTE $07,$03,$B8,$03,$F8,$03,$FB
      .BYTE $01
      .BYTE $01
      .BYTE $01 ; ??? This area only has 3 pages, so this should stop here
      .BYTE $01 ; But for some reason it continues for several more pages
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_2_2_Area3:
      .BYTE $03,$01,$8A
      .BYTE $05,$01,$C2,$01,$67
      .BYTE $07,$0E,$A0,$01,$78,$01,$BD
      .BYTE $03,$06,$E2
      .BYTE $01
;---
EnemyData_Level_2_2_Area4:
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
;---
EnemyData_Level_2_2_Area5:
      .BYTE $01
      .BYTE $05,$1C,$B4,$44,$B4
      .BYTE $03,$43,$B3
      .BYTE $01
;---
EnemyData_Level_2_3_Area0:
      .BYTE $03,$42,$17
      .BYTE $01
;---
EnemyData_Level_2_3_Area1:
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
;---
EnemyData_Level_2_3_Area2:
      .BYTE $01

      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_2_3_Area3:
      .BYTE $03,$03,$4B
      .BYTE $05,$01,$D5,$01,$AA
      .BYTE $05,$03,$D2,$01,$D5
      .BYTE $03,$02,$88
      .BYTE $07,$01,$83,$01,$A9,$01,$1D
      .BYTE $07,$01,$B1,$01,$89,$01,$3D
      .BYTE $03,$01,$E3
      .BYTE $01
;---
EnemyData_Level_2_3_Area4:
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
;---
EnemyData_Level_2_3_Area5:
      .BYTE $01

      .BYTE $09,$01,$15,$01,$08,$01,$F8,$01,$CB
      .BYTE $01
      .BYTE $07,$23,$14,$03,$39,$03,$7B
      .BYTE $03,$18,$67
      .BYTE $07,$18,$0A,$44,$3B,$18,$6A
      .BYTE $03,$43,$97
      .BYTE $01
;---
EnemyData_Level_2_3_Area6:
      .BYTE $01

      .BYTE $05,$5F,$C5,$02,$D0
      .BYTE $01
;---
EnemyData_Level_2_3_Area7:
      .BYTE $07,$17,$83,$3D,$87,$2F,$A9
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_3_1_Area0:
      .BYTE $01

      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_3_1_Area1:
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
;---
EnemyData_Level_3_1_Area2:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_3_1_Area3:
      .BYTE $01

      .BYTE $03,$03,$2B
      .BYTE $03,$25,$12
      .BYTE $03,$23,$95
      .BYTE $03,$03,$65
      .BYTE $03,$24,$05
      .BYTE $01
;---
EnemyData_Level_3_1_Area4:
      .BYTE $01

      .BYTE $07,$43,$93,$1C,$B9,$44,$BA
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_3_2_Area0:
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
;---
EnemyData_Level_3_2_Area1:
      .BYTE $07,$04,$3C,$04,$6C,$04,$EC
      .BYTE $03,$04,$1C
      .BYTE $01
      .BYTE $01
      .BYTE $03,$03,$29
      .BYTE $07,$02,$29,$02,$49,$02,$6C
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_3_2_Area2:
      .BYTE $05,$1C,$B6,$44,$B6
      .BYTE $03,$43,$FA
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_3_2_Area3:
      .BYTE $01

      .BYTE $03,$5C,$C7
      .BYTE $01
;---
EnemyData_Level_3_3_Area0:
      .BYTE $03,$42,$4A
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_3_3_Area1:
      .BYTE $01

      .BYTE $01
      .BYTE $07,$0A,$14,$08,$58,$0A,$84
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_3_3_Area2:
      .BYTE $03,$31,$65
      .BYTE $05,$0E,$75,$0E,$95
      .BYTE $09,$30,$05,$31,$55,$0D,$AC,$0D,$CC
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_3_3_Area3:
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
;---
EnemyData_Level_3_3_Area4:
      .BYTE $03,$06,$6C
      .BYTE $05,$23,$8D,$23,$CD
      .BYTE $05,$02,$57,$02,$ED
      .BYTE $01
      .BYTE $05,$05,$C2,$07,$3B
      .BYTE $05,$07,$C4,$03,$3D
      .BYTE $03,$0E,$D6
      .BYTE $01
;---
EnemyData_Level_3_3_Area5:
      .BYTE $03,$15,$6F
      .BYTE $03,$15,$6B
      .BYTE $03,$15,$67
      .BYTE $03,$15,$63
      .BYTE $01
;---
EnemyData_Level_3_3_Area6:
      .BYTE $0B,$31,$73,$2F,$84,$31,$79,$17,$87,$3D,$89
      .BYTE $01
;---
EnemyData_Level_3_3_Area7:
      .BYTE $01

      .BYTE $05,$0E,$C9,$0E,$E9
      .BYTE $03,$0D,$E9
      .BYTE $05,$0D,$09,$0D,$29
      .BYTE $05,$44,$6B,$43,$AA
      .BYTE $01
;---
EnemyData_Level_3_3_Area8:
      .BYTE $03,$2F,$22
      .BYTE $05,$2F,$62,$5D,$D6
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_4_1_Area0:
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
;---
EnemyData_Level_4_1_Area1:
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
;---
EnemyData_Level_4_1_Area2:
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
;---
EnemyData_Level_4_2_Area0:
      .BYTE $03,$42,$47
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_4_2_Area1:
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
;---
EnemyData_Level_4_2_Area2:
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
;---
EnemyData_Level_4_2_Area3:
      .BYTE $01

      .BYTE $03,$26,$C7
      .BYTE $01
      .BYTE $05,$04,$99,$04,$C9
      .BYTE $01
;---
EnemyData_Level_4_2_Area4:
      .BYTE $01

      .BYTE $05,$1C,$B8,$44,$B9
      .BYTE $03,$43,$BA
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_4_3_Area0:
      .BYTE $03,$42,$2A
      .BYTE $01
;---
EnemyData_Level_4_3_Area1:
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
;---
EnemyData_Level_4_3_Area2:
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
;---
EnemyData_Level_4_3_Area3:
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
;---
EnemyData_Level_4_3_Area4:
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
;---
EnemyData_Level_4_3_Area5:
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
;---
EnemyData_Level_4_3_Area6:
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
;---
EnemyData_Level_4_3_Area7:
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
;---
EnemyData_Level_4_3_Area8:
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
;---
EnemyData_Level_4_3_Area9:
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
;---
EnemyData_Level_5_1_Area0:
      .BYTE $03,$42,$31
      .BYTE $03,$08,$45
      .BYTE $03,$23,$56
      .BYTE $01
;---
EnemyData_Level_5_1_Area1:
      .BYTE $01
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
;---
EnemyData_Level_5_1_Area2:
      .BYTE $05,$1C,$C4,$44,$C5
      .BYTE $03,$43,$CA
      .BYTE $01
;---
EnemyData_Level_5_2_Area0:
      .BYTE $03,$42,$2A
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_5_2_Area1:
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
;---
EnemyData_Level_5_2_Area2:
      .BYTE $03,$14,$8B
      .BYTE $09,$10,$F2,$14,$68,$14,$8E,$06,$DE
      .BYTE $0B,$10,$02,$06,$C5,$06,$36,$10,$8E,$10,$DE
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_5_2_Area3:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $05,$13,$55,$13,$85
      .BYTE $01
;---
EnemyData_Level_5_2_Area4:
      .BYTE $03,$01,$2B
      .BYTE $05,$04,$24,$04,$B4
      .BYTE $01
;---
EnemyData_Level_5_2_Area5:
      .BYTE $01

      .BYTE $07,$13,$73,$1C,$B8,$44,$B9
      .BYTE $03,$43,$B4
      .BYTE $01
;---
EnemyData_Level_5_3_Area0:
      .BYTE $03,$42,$3A
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_5_3_Area1:
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
;---
EnemyData_Level_5_3_Area2:
      .BYTE $01

      .BYTE $05,$23,$36,$09,$C6
      .BYTE $03,$09,$36
      .BYTE $05,$09,$25,$09,$45
      .BYTE $03,$16,$A5
      .BYTE $01
;---
EnemyData_Level_5_3_Area3:
      .BYTE $01

      .BYTE $05,$24,$52,$24,$3D
      .BYTE $01
      .BYTE $09,$09,$90,$09,$B0,$2F,$D5,$30,$4F
      .BYTE $05,$15,$82,$2F,$A8
      .BYTE $07,$30,$41,$15,$84,$31,$8A
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_5_3_Area4:
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
;---
EnemyData_Level_5_3_Area5:
      .BYTE $01

      .BYTE $03,$61,$A7
      .BYTE $01
;---
EnemyData_Level_6_1_Area0:
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
;---
EnemyData_Level_6_1_Area1:
      .BYTE $01

      .BYTE $07,$18,$4B,$18,$9A,$15,$FB
      .BYTE $05,$18,$2B,$18,$7B
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_6_1_Area2:
      .BYTE $01

      .BYTE $05,$1C,$C8,$44,$C8
      .BYTE $03,$43,$27
      .BYTE $01
;---
EnemyData_Level_6_1_Area3:
      .BYTE $03,$01,$5A
      .BYTE $09,$01,$41,$01,$B4,$17,$85,$3D,$69
      .BYTE $01
;---
EnemyData_Level_6_1_Area4:
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
;---
EnemyData_Level_6_1_Area5:
      .BYTE $03,$01,$5A
      .BYTE $05,$01,$41,$01,$B4
      .BYTE $01
;---
EnemyData_Level_6_1_Area6:
      .BYTE $03,$01,$B8
      .BYTE $01
;---
EnemyData_Level_6_2_Area0:
      .BYTE $03,$42,$2A
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_6_2_Area1:
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
;---
EnemyData_Level_6_2_Area2:
      .BYTE $01

      .BYTE $05,$1C,$CA,$44,$CB
      .BYTE $03,$43,$D4
      .BYTE $01
;---
EnemyData_Level_6_3_Area0:
      .BYTE $03,$42,$2A
      .BYTE $01
;---
EnemyData_Level_6_3_Area1:
      .BYTE $01

      .BYTE $01
      .BYTE $03,$03,$98
      .BYTE $07,$03,$48,$1A,$66,$19,$AA
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_6_3_Area2:
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
;---
EnemyData_Level_6_3_Area3:
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
;---
EnemyData_Level_6_3_Area4:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_6_3_Area5:
      .BYTE $01

      .BYTE $07,$43,$97,$1C,$B3,$44,$B4
      .BYTE $01
;---
EnemyData_Level_6_3_Area6:
      .BYTE $01

      .BYTE $03,$5F,$B5
      .BYTE $01
;---
EnemyData_Level_7_1_Area0:
      .BYTE $03,$42,$2A
      .BYTE $01
;---
EnemyData_Level_7_1_Area1:
      .BYTE $01

      .BYTE $01
      .BYTE $01
      .BYTE $0D,$09,$8B,$0C,$94,$09,$94,$0D,$B8,$0C,$E4,$09,$E4
      .BYTE $07,$09,$2B,$0C,$E4,$09,$E4
      .BYTE $0D,$0E,$3B,$0C,$54,$09,$54,$09,$6B,$0C,$94,$09,$94
      .BYTE $07,$15,$37,$0C,$F3,$09,$F3
      .BYTE $01
;---
EnemyData_Level_7_1_Area2:
      .BYTE $01

      .BYTE $07,$02,$A8,$06,$B6,$06,$CB
      .BYTE $07,$15,$38,$03,$DC,$06,$F3
      .BYTE $05,$0D,$59,$06,$AB
      .BYTE $01
;---
EnemyData_Level_7_1_Area3:
      .BYTE $01

      .BYTE $07,$06,$21,$14,$66,$14,$8B
      .BYTE $07,$31,$87,$31,$D7,$2F,$D9
      .BYTE $05,$31,$E0,$31,$63
      .BYTE $01
;---
EnemyData_Level_7_1_Area4:
      .BYTE $01

      .BYTE $07,$43,$9A,$1C,$C5,$44,$C6
      .BYTE $01
;---
EnemyData_Level_7_1_Area5:
      .BYTE $05,$31,$B9,$31,$C3
      .BYTE $01
;---
EnemyData_Level_7_2_Area0:
      .BYTE $03,$06,$F5
      .BYTE $05,$06,$58,$06,$E8
      .BYTE $03,$0E,$74
      .BYTE $01
;---
EnemyData_Level_7_2_Area1:
      .BYTE $01

      .BYTE $07,$01,$99,$01,$D9,$15,$F9
      .BYTE $07,$0E,$77,$0E,$A7,$0E,$C7
      .BYTE $03,$16,$D9
      .BYTE $01
      .BYTE $05,$25,$1C,$25,$BC
      .BYTE $03,$25,$5B
      .BYTE $01
;---
EnemyData_Level_7_2_Area2:
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
;---
EnemyData_Level_7_2_Area3:
      .BYTE $07,$2F,$B8,$30,$F3,$2E,$FC
      .BYTE $09,$2F,$34,$2F,$74,$2F,$A4,$30,$AB
      .BYTE $07,$30,$1A,$2F,$79,$30,$F5
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_7_2_Area4:
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

;---
EnemyData_Level_7_2_Area5:
      .BYTE $01
      .BYTE $01
      .BYTE $05,$4A,$1A,$6C,$A7
      .BYTE $01

;---
EnemyData_Level_7_2_Area6:
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
;---
EnemyData_Level_7_2_Area7:
      .BYTE $09,$03,$76,$07,$69,$07,$99,$30,$8F
      .BYTE $09,$2F,$A2,$31,$73,$31,$68,$2E,$AD
      .BYTE $07,$31,$80,$31,$97,$2E,$7F
      .BYTE $05,$07,$80,$01,$84
      .BYTE $01
;---
EnemyData_Level_7_2_Area8:
      .BYTE $05,$31,$9C,$30,$7E
      .BYTE $07,$2F,$35,$30,$77,$31,$A8
      .BYTE $05,$31,$67,$31,$BA
      .BYTE $01
      .BYTE $09,$30,$42,$31,$82,$30,$B2,$2F,$74
      .BYTE $09,$2F,$53,$2F,$93,$30,$54,$2F,$76
      .BYTE $01
      .BYTE $01
;---
EnemyData_Level_7_2_Area9:
      .BYTE $01

      .BYTE $01
      .BYTE $03,$23,$79
      .BYTE $05,$02,$20,$02,$D0
      .BYTE $01
;---
EnemyData_Level_7_3_Area0:
      .BYTE $01

;---
EnemyData_Level_7_3_Area1:
      .BYTE $01

;---
EnemyData_Level_7_3_Area2:
      .BYTE $01

;---
EnemyData_Level_7_3_Area3:
      .BYTE $01

;---
EnemyData_Level_7_3_Area4:
      .BYTE $01

      .BYTE $01 ; Unused
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
;---

E;

      
      $matches    = [];
      $levels     = preg_match_all('/^EnemyData_Level_([0-9])_([0-9])_Area([0-9]):\n(.*?);---/ms', $asm, $matches);


//      var_dump($matches);
//     die();

      file_put_contents("enemy-data.asm", "");

      $oldw       = 0;
      $oldl       = 0;
      foreach ($matches[0] as $i => $v) {
            //print "Level ". $matches[1][$i] ."-". $matches[2][$i] ."-Area ". $matches[3][$i] ." - ". strlen($matches[4][$i]) ." - ". strlen($matches[0][$i]) ."\n";

            $w    = $matches[1][$i];
            $l    = $matches[2][$i];
            $a    = $matches[3][$i];
            $asm  = str_replace(";---", "", $matches[0][$i]);



            $f    = $w ."/". $w ."-". $l ."/". $w ."-". $l ."-area". $a ."-enemies.asm";
            file_put_contents($f, "; Level ". $w ."-". $l .", Area ". $a ."\n\n". $asm);

            $out  = "";
            if ($oldw != $w) {
                  $out  .= "; -------------------------------\n\n\n; -------------------------------\n; World $w\n";
            }
            if ($oldl != $l) {
                  $out  .= "\n; World $w-$l\n";
            }
            $oldw = $w;
            $oldl = $l;

            file_put_contents("enemy-data.asm", $out . 'include "src/levels/'. $f .'"' ."\n", FILE_APPEND);
            print $f ."\n";
      }




