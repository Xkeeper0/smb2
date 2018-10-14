; Level 1-2, Area 2

EnemyData_Level_1_2_Area2:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $A, $7, Enemy_Birdo
	enemy $A, $8, Enemy_CrystalBall

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $3, $8, Enemy_HawkmouthLeft

; Page 3
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
