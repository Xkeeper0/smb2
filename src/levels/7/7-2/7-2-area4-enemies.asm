; Level 7-2, Area 4

EnemyData_Level_7_2_Area4:

; Page 0
	distTo + ; $09 (4 enemies)
	enemy $2, $3, Enemy_Spark2
	enemy $8, $3, Enemy_Spark2
	enemy $E, $3, Enemy_Spark2
	enemy $C, $C, Enemy_Spark4

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $B, $B, Enemy_Spark2
	enemy $F, $B, Enemy_Spark2

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $5, $3, Enemy_Spark2

; Page 3
+	distTo + ; $09 (4 enemies)
	enemy $2, $9, Enemy_Spark4
	enemy $4, $3, Enemy_Spark1
	enemy $A, $3, Enemy_Spark2
	enemy $5, $9, Enemy_Spark4

; Page 4
+	distTo + ; $01 (0 enemies)

; Page 5
+	distTo + ; $01 (0 enemies)

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $01 (0 enemies)

; Page 8
+	distTo + ; $01 (0 enemies)

; Page 9
+	distTo + ; $05 (2 enemies)
	enemy $4, $9, Enemy_CrystalBall
	enemy $B, $7, Enemy_HawkmouthBoss

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
