; Level 3-3, Area 2

EnemyData_Level_3_3_Area2:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $6, $5, Enemy_Spark4

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $7, $5, Enemy_NinjiJumping
	enemy $9, $5, Enemy_NinjiJumping

; Page 2
+	distTo + ; $09 (4 enemies)
	enemy $0, $5, Enemy_Spark3
	enemy $5, $5, Enemy_Spark4
	enemy $A, $C, Enemy_NinjiRunning
	enemy $C, $C, Enemy_NinjiRunning

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
