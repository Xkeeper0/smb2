; Level 3-2, Area 2

EnemyData_Level_3_2_Area2:

; Page 0
	distTo + ; $05 (2 enemies)
	enemy $B, $6, Enemy_Birdo
	enemy $B, $6, Enemy_CrystalBall

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $F, $A, Enemy_HawkmouthLeft

; Page 2
+	distTo + ; $01 (0 enemies)

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
