; Level 7-1, Area 3

EnemyData_Level_7_1_Area3:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $2, $1, Enemy_SnifitGray
	enemy $6, $6, Enemy_Hoopstar
	enemy $8, $B, Enemy_Hoopstar

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $8, $7, Enemy_Spark4
	enemy $D, $7, Enemy_Spark4
	enemy $D, $9, Enemy_Spark2

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $E, $0, Enemy_Spark4
	enemy $6, $3, Enemy_Spark4

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
