; Level 7-2, Area 8

EnemyData_Level_7_2_Area8:

; Page 0
	distTo + ; $05 (2 enemies)
	enemy $9, $C, Enemy_Spark4
	enemy $7, $E, Enemy_Spark3

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $3, $5, Enemy_Spark2
	enemy $7, $7, Enemy_Spark3
	enemy $A, $8, Enemy_Spark4

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $6, $7, Enemy_Spark4
	enemy $B, $A, Enemy_Spark4

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $09 (4 enemies)
	enemy $4, $2, Enemy_Spark3
	enemy $8, $2, Enemy_Spark4
	enemy $B, $2, Enemy_Spark3
	enemy $7, $4, Enemy_Spark2

; Page 5
+	distTo + ; $09 (4 enemies)
	enemy $5, $3, Enemy_Spark2
	enemy $9, $3, Enemy_Spark2
	enemy $5, $4, Enemy_Spark3
	enemy $7, $6, Enemy_Spark2

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
