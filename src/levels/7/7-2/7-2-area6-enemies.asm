; Level 7-2, Area 6

EnemyData_Level_7_2_Area6:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $8, $A, Enemy_Spark2

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $7, $3, Enemy_Spark1
	enemy $8, $5, Enemy_Spark4
	enemy $8, $C, Enemy_Spark2

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $8, $7, Enemy_Spark4
	enemy $8, $E, Enemy_Spark2

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $5, $0, Enemy_Spark4
	enemy $A, $0, Enemy_Spark3

; Page 4
+	distTo + ; $01 (0 enemies)

; Page 5
+	distTo + ; $01 (0 enemies)

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $0D (6 enemies)
	enemy $6, $1, Enemy_Spark4
	enemy $A, $1, Enemy_Spark4
	enemy $A, $3, Enemy_Spark2
	enemy $6, $8, Enemy_Spark4
	enemy $5, $A, Enemy_Spark2
	enemy $A, $A, Enemy_Spark2

; Page 8
+	distTo + ; $05 (2 enemies)
	enemy $6, $1, Enemy_Spark2
	enemy $A, $1, Enemy_Spark2

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
