; Level 7-1, Area 4

EnemyData_Level_7_1_Area4:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $9, $A, Enemy_HawkmouthLeft
	enemy $C, $5, Enemy_Birdo
	enemy $C, $6, Enemy_CrystalBall

; Page 2
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
