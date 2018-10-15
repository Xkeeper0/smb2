;
; Pointers to pointers to pointers...
; I'm not entirely certain what the point of
; having pointer-pointers was, when level data
; appears to use standard split pointers just fine,
; but that's what they did here in any case
;

; -------------------------------------
; Pointers to pointers to enemy data here

EnemyPointersByLevel_HiHi:
	.db >EnemyPointers_Level_1_1_Hi
	.db >EnemyPointers_Level_1_2_Hi
	.db >EnemyPointers_Level_1_3_Hi
	.db >EnemyPointers_Level_2_1_Hi
	.db >EnemyPointers_Level_2_2_Hi
	.db >EnemyPointers_Level_2_3_Hi
	.db >EnemyPointers_Level_3_1_Hi
	.db >EnemyPointers_Level_3_2_Hi
	.db >EnemyPointers_Level_3_3_Hi
	.db >EnemyPointers_Level_4_1_Hi
	.db >EnemyPointers_Level_4_2_Hi
	.db >EnemyPointers_Level_4_3_Hi
	.db >EnemyPointers_Level_5_1_Hi
	.db >EnemyPointers_Level_5_2_Hi
	.db >EnemyPointers_Level_5_3_Hi
	.db >EnemyPointers_Level_6_1_Hi
	.db >EnemyPointers_Level_6_2_Hi
	.db >EnemyPointers_Level_6_3_Hi
	.db >EnemyPointers_Level_7_1_Hi
	.db >EnemyPointers_Level_7_2_Hi
	.db >EnemyPointers_Level_7_3_Hi

EnemyPointersByLevel_HiLo:
	.db <EnemyPointers_Level_1_1_Hi
	.db <EnemyPointers_Level_1_2_Hi
	.db <EnemyPointers_Level_1_3_Hi
	.db <EnemyPointers_Level_2_1_Hi
	.db <EnemyPointers_Level_2_2_Hi
	.db <EnemyPointers_Level_2_3_Hi
	.db <EnemyPointers_Level_3_1_Hi
	.db <EnemyPointers_Level_3_2_Hi
	.db <EnemyPointers_Level_3_3_Hi
	.db <EnemyPointers_Level_4_1_Hi
	.db <EnemyPointers_Level_4_2_Hi
	.db <EnemyPointers_Level_4_3_Hi
	.db <EnemyPointers_Level_5_1_Hi
	.db <EnemyPointers_Level_5_2_Hi
	.db <EnemyPointers_Level_5_3_Hi
	.db <EnemyPointers_Level_6_1_Hi
	.db <EnemyPointers_Level_6_2_Hi
	.db <EnemyPointers_Level_6_3_Hi
	.db <EnemyPointers_Level_7_1_Hi
	.db <EnemyPointers_Level_7_2_Hi
	.db <EnemyPointers_Level_7_3_Hi

EnemyPointersByLevel_LoHi:
	.db >EnemyPointers_Level_1_1_Lo
	.db >EnemyPointers_Level_1_2_Lo
	.db >EnemyPointers_Level_1_3_Lo
	.db >EnemyPointers_Level_2_1_Lo
	.db >EnemyPointers_Level_2_2_Lo
	.db >EnemyPointers_Level_2_3_Lo
	.db >EnemyPointers_Level_3_1_Lo
	.db >EnemyPointers_Level_3_2_Lo
	.db >EnemyPointers_Level_3_3_Lo
	.db >EnemyPointers_Level_4_1_Lo
	.db >EnemyPointers_Level_4_2_Lo
	.db >EnemyPointers_Level_4_3_Lo
	.db >EnemyPointers_Level_5_1_Lo
	.db >EnemyPointers_Level_5_2_Lo
	.db >EnemyPointers_Level_5_3_Lo
	.db >EnemyPointers_Level_6_1_Lo
	.db >EnemyPointers_Level_6_2_Lo
	.db >EnemyPointers_Level_6_3_Lo
	.db >EnemyPointers_Level_7_1_Lo
	.db >EnemyPointers_Level_7_2_Lo
	.db >EnemyPointers_Level_7_3_Lo

EnemyPointersByLevel_LoLo:
	.db <EnemyPointers_Level_1_1_Lo
	.db <EnemyPointers_Level_1_2_Lo
	.db <EnemyPointers_Level_1_3_Lo
	.db <EnemyPointers_Level_2_1_Lo
	.db <EnemyPointers_Level_2_2_Lo
	.db <EnemyPointers_Level_2_3_Lo
	.db <EnemyPointers_Level_3_1_Lo
	.db <EnemyPointers_Level_3_2_Lo
	.db <EnemyPointers_Level_3_3_Lo
	.db <EnemyPointers_Level_4_1_Lo
	.db <EnemyPointers_Level_4_2_Lo
	.db <EnemyPointers_Level_4_3_Lo
	.db <EnemyPointers_Level_5_1_Lo
	.db <EnemyPointers_Level_5_2_Lo
	.db <EnemyPointers_Level_5_3_Lo
	.db <EnemyPointers_Level_6_1_Lo
	.db <EnemyPointers_Level_6_2_Lo
	.db <EnemyPointers_Level_6_3_Lo
	.db <EnemyPointers_Level_7_1_Lo
	.db <EnemyPointers_Level_7_2_Lo
	.db <EnemyPointers_Level_7_3_Lo

; ----------------------------------------
; Actual pointers to enemy data here

EnemyPointers_Level_1_1_Hi:
	.db >EnemyData_Level_1_1_Area0
	.db >EnemyData_Level_1_1_Area1
	.db >EnemyData_Level_1_1_Area2
	.db >EnemyData_Level_1_1_Area3
	.db >EnemyData_Level_1_1_Area4
	.db >EnemyData_Level_1_1_Area5
	.db >EnemyData_Level_1_1_Area5
	.db >EnemyData_Level_1_1_Area5
	.db >EnemyData_Level_1_1_Area5
	.db >EnemyData_Level_1_1_Area5

EnemyPointers_Level_1_1_Lo:
	.db <EnemyData_Level_1_1_Area0
	.db <EnemyData_Level_1_1_Area1
	.db <EnemyData_Level_1_1_Area2
	.db <EnemyData_Level_1_1_Area3
	.db <EnemyData_Level_1_1_Area4
	.db <EnemyData_Level_1_1_Area5
	.db <EnemyData_Level_1_1_Area5
	.db <EnemyData_Level_1_1_Area5
	.db <EnemyData_Level_1_1_Area5
	.db <EnemyData_Level_1_1_Area5

EnemyPointers_Level_1_2_Hi:
	.db >EnemyData_Level_1_2_Area0
	.db >EnemyData_Level_1_2_Area1
	.db >EnemyData_Level_1_2_Area2
	.db >EnemyData_Level_1_2_Area3
	.db >EnemyData_Level_1_2_Area4
	.db >EnemyData_Level_1_2_Area5
	.db >EnemyData_Level_1_2_Area5
	.db >EnemyData_Level_1_2_Area5
	.db >EnemyData_Level_1_2_Area5
	.db >EnemyData_Level_1_2_Area5

EnemyPointers_Level_1_2_Lo:
	.db <EnemyData_Level_1_2_Area0
	.db <EnemyData_Level_1_2_Area1
	.db <EnemyData_Level_1_2_Area2
	.db <EnemyData_Level_1_2_Area3
	.db <EnemyData_Level_1_2_Area4
	.db <EnemyData_Level_1_2_Area5
	.db <EnemyData_Level_1_2_Area5
	.db <EnemyData_Level_1_2_Area5
	.db <EnemyData_Level_1_2_Area5
	.db <EnemyData_Level_1_2_Area5

EnemyPointers_Level_1_3_Hi:
	.db >EnemyData_Level_1_3_Area0
	.db >EnemyData_Level_1_3_Area1
	.db >EnemyData_Level_1_3_Area2
	.db >EnemyData_Level_1_3_Area3
	.db >EnemyData_Level_1_3_Area4
	.db >EnemyData_Level_1_3_Area4
	.db >EnemyData_Level_1_3_Area4
	.db >EnemyData_Level_1_3_Area4
	.db >EnemyData_Level_1_3_Area4
	.db >EnemyData_Level_1_3_Area4

EnemyPointers_Level_1_3_Lo:
	.db <EnemyData_Level_1_3_Area0
	.db <EnemyData_Level_1_3_Area1
	.db <EnemyData_Level_1_3_Area2
	.db <EnemyData_Level_1_3_Area3
	.db <EnemyData_Level_1_3_Area4
	.db <EnemyData_Level_1_3_Area4
	.db <EnemyData_Level_1_3_Area4
	.db <EnemyData_Level_1_3_Area4
	.db <EnemyData_Level_1_3_Area4
	.db <EnemyData_Level_1_3_Area4

EnemyPointers_Level_2_1_Hi:
	.db >EnemyData_Level_2_1_Area0
	.db >EnemyData_Level_2_1_Area1
	.db >EnemyData_Level_2_1_Area2
	.db >EnemyData_Level_2_1_Area2
	.db >EnemyData_Level_2_1_Area4
	.db >EnemyData_Level_2_1_Area2
	.db >EnemyData_Level_2_1_Area2
	.db >EnemyData_Level_2_1_Area2
	.db >EnemyData_Level_2_1_Area2
	.db >EnemyData_Level_2_1_Area2

EnemyPointers_Level_2_1_Lo:
	.db <EnemyData_Level_2_1_Area0
	.db <EnemyData_Level_2_1_Area1
	.db <EnemyData_Level_2_1_Area2
	.db <EnemyData_Level_2_1_Area2
	.db <EnemyData_Level_2_1_Area4
	.db <EnemyData_Level_2_1_Area2
	.db <EnemyData_Level_2_1_Area2
	.db <EnemyData_Level_2_1_Area2
	.db <EnemyData_Level_2_1_Area2
	.db <EnemyData_Level_2_1_Area2

EnemyPointers_Level_2_2_Hi:
	.db >EnemyData_Level_2_2_Area0
	.db >EnemyData_Level_2_2_Area1
	.db >EnemyData_Level_2_2_Area2
	.db >EnemyData_Level_2_2_Area3
	.db >EnemyData_Level_2_2_Area4
	.db >EnemyData_Level_2_2_Area5
	.db >EnemyData_Level_2_2_Area5
	.db >EnemyData_Level_2_2_Area5
	.db >EnemyData_Level_2_2_Area5
	.db >EnemyData_Level_2_2_Area5

EnemyPointers_Level_2_2_Lo:
	.db <EnemyData_Level_2_2_Area0
	.db <EnemyData_Level_2_2_Area1
	.db <EnemyData_Level_2_2_Area2
	.db <EnemyData_Level_2_2_Area3
	.db <EnemyData_Level_2_2_Area4
	.db <EnemyData_Level_2_2_Area5
	.db <EnemyData_Level_2_2_Area5
	.db <EnemyData_Level_2_2_Area5
	.db <EnemyData_Level_2_2_Area5
	.db <EnemyData_Level_2_2_Area5

EnemyPointers_Level_2_3_Hi:
	.db >EnemyData_Level_2_3_Area0
	.db >EnemyData_Level_2_3_Area1
	.db >EnemyData_Level_2_3_Area2
	.db >EnemyData_Level_2_3_Area3
	.db >EnemyData_Level_2_3_Area4
	.db >EnemyData_Level_2_3_Area5
	.db >EnemyData_Level_2_3_Area6
	.db >EnemyData_Level_2_3_Area7
	.db >EnemyData_Level_2_3_Area7
	.db >EnemyData_Level_2_3_Area7

EnemyPointers_Level_2_3_Lo:
	.db <EnemyData_Level_2_3_Area0
	.db <EnemyData_Level_2_3_Area1
	.db <EnemyData_Level_2_3_Area2
	.db <EnemyData_Level_2_3_Area3
	.db <EnemyData_Level_2_3_Area4
	.db <EnemyData_Level_2_3_Area5
	.db <EnemyData_Level_2_3_Area6
	.db <EnemyData_Level_2_3_Area7
	.db <EnemyData_Level_2_3_Area7
	.db <EnemyData_Level_2_3_Area7

EnemyPointers_Level_3_1_Hi:
	.db >EnemyData_Level_3_1_Area0
	.db >EnemyData_Level_3_1_Area1
	.db >EnemyData_Level_3_1_Area2
	.db >EnemyData_Level_3_1_Area3
	.db >EnemyData_Level_3_1_Area4
	.db >EnemyData_Level_3_2_Area0
	.db >EnemyData_Level_3_2_Area0
	.db >EnemyData_Level_3_2_Area0
	.db >EnemyData_Level_3_2_Area0
	.db >EnemyData_Level_3_2_Area0

EnemyPointers_Level_3_1_Lo:
	.db <EnemyData_Level_3_1_Area0
	.db <EnemyData_Level_3_1_Area1
	.db <EnemyData_Level_3_1_Area2
	.db <EnemyData_Level_3_1_Area3
	.db <EnemyData_Level_3_1_Area4
	.db <EnemyData_Level_3_2_Area0
	.db <EnemyData_Level_3_2_Area0
	.db <EnemyData_Level_3_2_Area0
	.db <EnemyData_Level_3_2_Area0
	.db <EnemyData_Level_3_2_Area0

EnemyPointers_Level_3_2_Hi:
	.db >EnemyData_Level_3_2_Area0
	.db >EnemyData_Level_3_2_Area1
	.db >EnemyData_Level_3_2_Area2
	.db >EnemyData_Level_3_2_Area3 ; Unused? Boss-flag Birdo
	.db >EnemyData_Level_3_3_Area0
	.db >EnemyData_Level_3_3_Area0
	.db >EnemyData_Level_3_3_Area0
	.db >EnemyData_Level_3_3_Area0
	.db >EnemyData_Level_3_3_Area0
	.db >EnemyData_Level_3_3_Area0

EnemyPointers_Level_3_2_Lo:
	.db <EnemyData_Level_3_2_Area0
	.db <EnemyData_Level_3_2_Area1
	.db <EnemyData_Level_3_2_Area2
	.db <EnemyData_Level_3_2_Area3 ; Unused? Boss-flag Birdo
	.db <EnemyData_Level_3_3_Area0
	.db <EnemyData_Level_3_3_Area0
	.db <EnemyData_Level_3_3_Area0
	.db <EnemyData_Level_3_3_Area0
	.db <EnemyData_Level_3_3_Area0
	.db <EnemyData_Level_3_3_Area0

EnemyPointers_Level_3_3_Hi:
	.db >EnemyData_Level_3_3_Area0
	.db >EnemyData_Level_3_3_Area1
	.db >EnemyData_Level_3_3_Area2
	.db >EnemyData_Level_3_3_Area3
	.db >EnemyData_Level_3_3_Area4
	.db >EnemyData_Level_3_3_Area5
	.db >EnemyData_Level_3_3_Area6
	.db >EnemyData_Level_3_3_Area7
	.db >EnemyData_Level_3_3_Area8
	.db >EnemyData_Level_3_3_Area8

EnemyPointers_Level_3_3_Lo:
	.db <EnemyData_Level_3_3_Area0
	.db <EnemyData_Level_3_3_Area1
	.db <EnemyData_Level_3_3_Area2
	.db <EnemyData_Level_3_3_Area3
	.db <EnemyData_Level_3_3_Area4
	.db <EnemyData_Level_3_3_Area5
	.db <EnemyData_Level_3_3_Area6
	.db <EnemyData_Level_3_3_Area7
	.db <EnemyData_Level_3_3_Area8
	.db <EnemyData_Level_3_3_Area8

EnemyPointers_Level_4_1_Hi:
	.db >EnemyData_Level_4_1_Area0
	.db >EnemyData_Level_4_1_Area1
	.db >EnemyData_Level_4_1_Area2 ; ??? Unused area with another Boss Birdo.
	.db >EnemyData_Level_4_1_Area2
	.db >EnemyData_Level_4_1_Area2
	.db >EnemyData_Level_4_1_Area2
	.db >EnemyData_Level_4_1_Area2
	.db >EnemyData_Level_4_1_Area2
	.db >EnemyData_Level_4_1_Area2
	.db >EnemyData_Level_4_1_Area2

EnemyPointers_Level_4_1_Lo:
	.db <EnemyData_Level_4_1_Area0
	.db <EnemyData_Level_4_1_Area1
	.db <EnemyData_Level_4_1_Area2
	.db <EnemyData_Level_4_1_Area2
	.db <EnemyData_Level_4_1_Area2
	.db <EnemyData_Level_4_1_Area2
	.db <EnemyData_Level_4_1_Area2
	.db <EnemyData_Level_4_1_Area2
	.db <EnemyData_Level_4_1_Area2
	.db <EnemyData_Level_4_1_Area2

EnemyPointers_Level_4_2_Hi:
	.db >EnemyData_Level_4_2_Area0
	.db >EnemyData_Level_4_2_Area1
	.db >EnemyData_Level_4_2_Area2
	.db >EnemyData_Level_4_2_Area3
	.db >EnemyData_Level_4_2_Area4
	.db >EnemyData_Level_4_2_Area4
	.db >EnemyData_Level_4_2_Area4
	.db >EnemyData_Level_4_2_Area4
	.db >EnemyData_Level_4_2_Area4
	.db >EnemyData_Level_4_2_Area4

EnemyPointers_Level_4_2_Lo:
	.db <EnemyData_Level_4_2_Area0
	.db <EnemyData_Level_4_2_Area1
	.db <EnemyData_Level_4_2_Area2
	.db <EnemyData_Level_4_2_Area3
	.db <EnemyData_Level_4_2_Area4
	.db <EnemyData_Level_4_2_Area4
	.db <EnemyData_Level_4_2_Area4
	.db <EnemyData_Level_4_2_Area4
	.db <EnemyData_Level_4_2_Area4
	.db <EnemyData_Level_4_2_Area4

EnemyPointers_Level_4_3_Hi:
	.db >EnemyData_Level_4_3_Area0
	.db >EnemyData_Level_4_3_Area1
	.db >EnemyData_Level_4_3_Area2
	.db >EnemyData_Level_4_3_Area3
	.db >EnemyData_Level_4_3_Area4
	.db >EnemyData_Level_4_3_Area5
	.db >EnemyData_Level_4_3_Area6
	.db >EnemyData_Level_4_3_Area7
	.db >EnemyData_Level_4_3_Area8
	.db >EnemyData_Level_4_3_Area9

EnemyPointers_Level_4_3_Lo:
	.db <EnemyData_Level_4_3_Area0
	.db <EnemyData_Level_4_3_Area1
	.db <EnemyData_Level_4_3_Area2
	.db <EnemyData_Level_4_3_Area3
	.db <EnemyData_Level_4_3_Area4
	.db <EnemyData_Level_4_3_Area5
	.db <EnemyData_Level_4_3_Area6
	.db <EnemyData_Level_4_3_Area7
	.db <EnemyData_Level_4_3_Area8
	.db <EnemyData_Level_4_3_Area9

EnemyPointers_Level_5_1_Hi:
	.db >EnemyData_Level_5_1_Area0
	.db >EnemyData_Level_5_1_Area1
	.db >EnemyData_Level_5_1_Area2
	.db >EnemyData_Level_5_2_Area0
	.db >EnemyData_Level_5_2_Area0
	.db >EnemyData_Level_5_2_Area0
	.db >EnemyData_Level_5_2_Area0
	.db >EnemyData_Level_5_2_Area0
	.db >EnemyData_Level_5_2_Area0
	.db >EnemyData_Level_5_2_Area0

EnemyPointers_Level_5_1_Lo:
	.db <EnemyData_Level_5_1_Area0
	.db <EnemyData_Level_5_1_Area1
	.db <EnemyData_Level_5_1_Area2
	.db <EnemyData_Level_5_2_Area0
	.db <EnemyData_Level_5_2_Area0
	.db <EnemyData_Level_5_2_Area0
	.db <EnemyData_Level_5_2_Area0
	.db <EnemyData_Level_5_2_Area0
	.db <EnemyData_Level_5_2_Area0
	.db <EnemyData_Level_5_2_Area0

EnemyPointers_Level_5_2_Hi:
	.db >EnemyData_Level_5_2_Area0
	.db >EnemyData_Level_5_2_Area1
	.db >EnemyData_Level_5_2_Area2
	.db >EnemyData_Level_5_2_Area3
	.db >EnemyData_Level_5_2_Area4
	.db >EnemyData_Level_5_2_Area5
	.db >EnemyData_Level_5_3_Area0
	.db >EnemyData_Level_5_3_Area0
	.db >EnemyData_Level_5_3_Area0
	.db >EnemyData_Level_5_3_Area0

EnemyPointers_Level_5_2_Lo:
	.db <EnemyData_Level_5_2_Area0
	.db <EnemyData_Level_5_2_Area1
	.db <EnemyData_Level_5_2_Area2
	.db <EnemyData_Level_5_2_Area3
	.db <EnemyData_Level_5_2_Area4
	.db <EnemyData_Level_5_2_Area5
	.db <EnemyData_Level_5_3_Area0
	.db <EnemyData_Level_5_3_Area0
	.db <EnemyData_Level_5_3_Area0
	.db <EnemyData_Level_5_3_Area0

EnemyPointers_Level_5_3_Hi:
	.db >EnemyData_Level_5_3_Area0
	.db >EnemyData_Level_5_3_Area1
	.db >EnemyData_Level_5_3_Area2
	.db >EnemyData_Level_5_3_Area3
	.db >EnemyData_Level_5_3_Area4
	.db >EnemyData_Level_5_3_Area5
	.db >EnemyData_Level_5_3_Area5
	.db >EnemyData_Level_5_3_Area5
	.db >EnemyData_Level_5_3_Area5
	.db >EnemyData_Level_5_3_Area5

EnemyPointers_Level_5_3_Lo:
	.db <EnemyData_Level_5_3_Area0
	.db <EnemyData_Level_5_3_Area1
	.db <EnemyData_Level_5_3_Area2
	.db <EnemyData_Level_5_3_Area3
	.db <EnemyData_Level_5_3_Area4
	.db <EnemyData_Level_5_3_Area5
	.db <EnemyData_Level_5_3_Area5
	.db <EnemyData_Level_5_3_Area5
	.db <EnemyData_Level_5_3_Area5
	.db <EnemyData_Level_5_3_Area5

EnemyPointers_Level_6_1_Hi:
	.db >EnemyData_Level_6_1_Area0
	.db >EnemyData_Level_6_1_Area1
	.db >EnemyData_Level_6_1_Area2
	.db >EnemyData_Level_6_1_Area3
	.db >EnemyData_Level_6_1_Area4
	.db >EnemyData_Level_6_1_Area5
	.db >EnemyData_Level_6_1_Area6
	.db >EnemyData_Level_6_1_Area6
	.db >EnemyData_Level_6_1_Area6
	.db >EnemyData_Level_6_1_Area6

EnemyPointers_Level_6_1_Lo:
	.db <EnemyData_Level_6_1_Area0
	.db <EnemyData_Level_6_1_Area1
	.db <EnemyData_Level_6_1_Area2
	.db <EnemyData_Level_6_1_Area3
	.db <EnemyData_Level_6_1_Area4
	.db <EnemyData_Level_6_1_Area5
	.db <EnemyData_Level_6_1_Area6
	.db <EnemyData_Level_6_1_Area6
	.db <EnemyData_Level_6_1_Area6
	.db <EnemyData_Level_6_1_Area6

EnemyPointers_Level_6_2_Hi:
	.db >EnemyData_Level_6_2_Area0
	.db >EnemyData_Level_6_2_Area1
	.db >EnemyData_Level_6_2_Area2
	.db >EnemyData_Level_6_2_Area2
	.db >EnemyData_Level_6_2_Area2
	.db >EnemyData_Level_6_2_Area2
	.db >EnemyData_Level_6_2_Area2
	.db >EnemyData_Level_6_2_Area2
	.db >EnemyData_Level_6_2_Area2
	.db >EnemyData_Level_6_2_Area2

EnemyPointers_Level_6_2_Lo:
	.db <EnemyData_Level_6_2_Area0
	.db <EnemyData_Level_6_2_Area1
	.db <EnemyData_Level_6_2_Area2
	.db <EnemyData_Level_6_2_Area2
	.db <EnemyData_Level_6_2_Area2
	.db <EnemyData_Level_6_2_Area2
	.db <EnemyData_Level_6_2_Area2
	.db <EnemyData_Level_6_2_Area2
	.db <EnemyData_Level_6_2_Area2
	.db <EnemyData_Level_6_2_Area2

EnemyPointers_Level_6_3_Hi:
	.db >EnemyData_Level_6_3_Area0
	.db >EnemyData_Level_6_3_Area1
	.db >EnemyData_Level_6_3_Area2
	.db >EnemyData_Level_6_3_Area3
	.db >EnemyData_Level_6_3_Area4
	.db >EnemyData_Level_6_3_Area5
	.db >EnemyData_Level_6_3_Area6
	.db >EnemyData_Level_6_3_Area6
	.db >EnemyData_Level_6_3_Area6
	.db >EnemyData_Level_6_3_Area6

EnemyPointers_Level_6_3_Lo:
	.db <EnemyData_Level_6_3_Area0
	.db <EnemyData_Level_6_3_Area1
	.db <EnemyData_Level_6_3_Area2
	.db <EnemyData_Level_6_3_Area3
	.db <EnemyData_Level_6_3_Area4
	.db <EnemyData_Level_6_3_Area5
	.db <EnemyData_Level_6_3_Area6
	.db <EnemyData_Level_6_3_Area6
	.db <EnemyData_Level_6_3_Area6
	.db <EnemyData_Level_6_3_Area6

EnemyPointers_Level_7_1_Hi:
	.db >EnemyData_Level_7_1_Area0
	.db >EnemyData_Level_7_1_Area1
	.db >EnemyData_Level_7_1_Area2
	.db >EnemyData_Level_7_1_Area3
	.db >EnemyData_Level_7_1_Area4
	.db >EnemyData_Level_7_1_Area5
	.db >EnemyData_Level_7_1_Area5
	.db >EnemyData_Level_7_1_Area5
	.db >EnemyData_Level_7_1_Area5
	.db >EnemyData_Level_7_1_Area5

EnemyPointers_Level_7_1_Lo:
	.db <EnemyData_Level_7_1_Area0
	.db <EnemyData_Level_7_1_Area1
	.db <EnemyData_Level_7_1_Area2
	.db <EnemyData_Level_7_1_Area3
	.db <EnemyData_Level_7_1_Area4
	.db <EnemyData_Level_7_1_Area5
	.db <EnemyData_Level_7_1_Area5
	.db <EnemyData_Level_7_1_Area5
	.db <EnemyData_Level_7_1_Area5
	.db <EnemyData_Level_7_1_Area5

EnemyPointers_Level_7_2_Hi:
	.db >EnemyData_Level_7_2_Area0
	.db >EnemyData_Level_7_2_Area1
	.db >EnemyData_Level_7_2_Area2
	.db >EnemyData_Level_7_2_Area3
	.db >EnemyData_Level_7_2_Area4
	.db >EnemyData_Level_7_2_Area5
	.db >EnemyData_Level_7_2_Area6
	.db >EnemyData_Level_7_2_Area7
	.db >EnemyData_Level_7_2_Area8
	.db >EnemyData_Level_7_2_Area9

EnemyPointers_Level_7_2_Lo:
	.db <EnemyData_Level_7_2_Area0
	.db <EnemyData_Level_7_2_Area1
	.db <EnemyData_Level_7_2_Area2
	.db <EnemyData_Level_7_2_Area3
	.db <EnemyData_Level_7_2_Area4
	.db <EnemyData_Level_7_2_Area5
	.db <EnemyData_Level_7_2_Area6
	.db <EnemyData_Level_7_2_Area7
	.db <EnemyData_Level_7_2_Area8
	.db <EnemyData_Level_7_2_Area9

; Normally totally unused (game ends at 7-2)
; Interestingly, the first 4 areas are unique
; though completely empty
; Wonder if they intended on having a full 7-3
; at some point...
EnemyPointers_Level_7_3_Hi:
	.db >EnemyData_Level_7_3_Area0
	.db >EnemyData_Level_7_3_Area1
	.db >EnemyData_Level_7_3_Area2
	.db >EnemyData_Level_7_3_Area3
	.db >EnemyData_Level_7_3_Area4
	.db >EnemyData_Level_7_3_Area4
	.db >EnemyData_Level_7_3_Area4
	.db >EnemyData_Level_7_3_Area4
	.db >EnemyData_Level_7_3_Area4
	.db >EnemyData_Level_7_3_Area4

EnemyPointers_Level_7_3_Lo:
	.db <EnemyData_Level_7_3_Area0
	.db <EnemyData_Level_7_3_Area1
	.db <EnemyData_Level_7_3_Area2
	.db <EnemyData_Level_7_3_Area3
	.db <EnemyData_Level_7_3_Area4
	.db <EnemyData_Level_7_3_Area4
	.db <EnemyData_Level_7_3_Area4
	.db <EnemyData_Level_7_3_Area4
	.db <EnemyData_Level_7_3_Area4
	.db <EnemyData_Level_7_3_Area4
