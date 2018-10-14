; Level 6-1, Area 2

EnemyData_Level_6_1_Area2:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $C, $8, Enemy_Birdo
	enemy $C, $8, Enemy_CrystalBall

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $2, $7, Enemy_HawkmouthLeft

; Page 3
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
