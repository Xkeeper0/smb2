; Level 7-2, Area 3

EnemyData_Level_7_2_Area3:

; Page 0
	distTo + ; $07 (3 enemies)
	enemy $B, $8, Enemy_Spark2
	enemy $F, $3, Enemy_Spark3
	enemy $F, $C, Enemy_Spark1

; Page 1
+	distTo + ; $09 (4 enemies)
	enemy $3, $4, Enemy_Spark2
	enemy $7, $4, Enemy_Spark2
	enemy $A, $4, Enemy_Spark2
	enemy $A, $B, Enemy_Spark3

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $1, $A, Enemy_Spark3
	enemy $7, $9, Enemy_Spark2
	enemy $F, $5, Enemy_Spark3

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
