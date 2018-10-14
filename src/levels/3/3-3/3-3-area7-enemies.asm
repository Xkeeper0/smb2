; Level 3-3, Area 7

EnemyData_Level_3_3_Area7:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $C, $9, Enemy_NinjiJumping
	enemy $E, $9, Enemy_NinjiJumping

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $E, $9, Enemy_NinjiRunning

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $0, $9, Enemy_NinjiRunning
	enemy $2, $9, Enemy_NinjiRunning

; Page 4
+	distTo + ; $05 (2 enemies)
	enemy $6, $B, Enemy_CrystalBall
	enemy $A, $A, Enemy_HawkmouthLeft

; Page 5
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
