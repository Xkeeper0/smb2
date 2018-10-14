; Level 3-3, Area 8

EnemyData_Level_3_3_Area8:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $2, $2, Enemy_Spark2

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $6, $2, Enemy_Spark2
	enemy $D, $6, Enemy_BossMouser

; Page 2
+	distTo + ; $01 (0 enemies)

; Page 3
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
