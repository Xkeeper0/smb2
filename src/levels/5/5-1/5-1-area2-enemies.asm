; Level 5-1, Area 2

EnemyData_Level_5_1_Area2:

; Page 0
	distTo + ; $05 (2 enemies)
	enemy $C, $4, Enemy_Birdo
	enemy $C, $5, Enemy_CrystalBall

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $C, $A, Enemy_HawkmouthLeft

; Page 2
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
