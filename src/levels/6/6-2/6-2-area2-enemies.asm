; Level 6-2, Area 2

EnemyData_Level_6_2_Area2:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $C, $A, Enemy_Birdo
	enemy $C, $B, Enemy_CrystalBall

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $D, $4, Enemy_HawkmouthLeft

; Page 3
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
