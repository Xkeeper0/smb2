; Level 4-2, Area 2

EnemyData_Level_4_2_Area2:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $6, $A, Enemy_WhaleSpout

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $7, $A, Enemy_WhaleSpout
	enemy $F, $A, Enemy_WhaleSpout

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $D, $A, Enemy_WhaleSpout

; Page 5
+	distTo + ; $05 (2 enemies)
	enemy $6, $9, Enemy_WhaleSpout
	enemy $9, $8, Enemy_SnifitPink

; Page 6
+	distTo + ; $09 (4 enemies)
	enemy $2, $A, Enemy_WhaleSpout
	enemy $3, $9, Enemy_ShyguyPink
	enemy $B, $A, Enemy_WhaleSpout
	enemy $C, $9, Enemy_ShyguyPink

; Page 7
+	distTo + ; $05 (2 enemies)
	enemy $6, $9, Enemy_WhaleSpout
	enemy $8, $8, Enemy_ShyguyPink

; Page 8
+	distTo + ; $05 (2 enemies)
	enemy $A, $9, Enemy_WhaleSpout
	enemy $D, $3, Enemy_Flurry

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
