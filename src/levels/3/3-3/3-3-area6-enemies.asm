; Level 3-3, Area 6

EnemyData_Level_3_3_Area6:

; Page 0
	distTo + ; $0B (5 enemies)
	enemy $7, $3, Enemy_Spark4
	enemy $8, $4, Enemy_Spark2
	enemy $7, $9, Enemy_Spark4
	enemy $8, $7, Enemy_Phanto
	enemy $8, $9, Enemy_Key

; Page 1
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
