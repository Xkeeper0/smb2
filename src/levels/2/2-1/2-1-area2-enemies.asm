; Level 2-1, Area 2

EnemyData_Level_2_1_Area2:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $A, $8, Enemy_Birdo
	enemy $A, $9, Enemy_CrystalBall

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $D, $3, Enemy_HawkmouthLeft

; Page 3
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
