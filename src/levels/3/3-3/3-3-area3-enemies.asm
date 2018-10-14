; Level 3-3, Area 3

EnemyData_Level_3_3_Area3:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $09 (4 enemies)
	enemy $7, $2, Enemy_Spark4
	enemy $8, $4, Enemy_Spark1
	enemy $B, $7, Enemy_Spark1
	enemy $4, $C, Enemy_Spark3

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $8, $1, Enemy_Spark1
	enemy $1, $A, Enemy_Spark2
	enemy $D, $F, Enemy_Spark4

; Page 3
+	distTo + ; $07 (3 enemies)
	enemy $3, $5, Enemy_Spark1
	enemy $9, $6, Enemy_Spark1
	enemy $1, $8, Enemy_Spark1

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $7, $1, Enemy_Spark4

; Page 5
+	distTo + ; $03 (1 enemy)
	enemy $C, $F, Enemy_Spark4

; Page 6
+	distTo + ; $07 (3 enemies)
	enemy $2, $0, Enemy_Spark2
	enemy $7, $0, Enemy_Spark4
	enemy $7, $E, Enemy_Spark1

; Page 7
+	distTo + ; $07 (3 enemies)
	enemy $7, $1, Enemy_Spark2
	enemy $8, $D, Enemy_Spark3
	enemy $7, $F, Enemy_Spark4

; Page 8
+	distTo + ; $05 (2 enemies)
	enemy $3, $4, Enemy_Spark3
	enemy $C, $7, Enemy_Spark3

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
