; Level 2-2, Area 5

EnemyData_Level_2_2_Area5:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $B, $4, Enemy_Birdo
	enemy $B, $4, Enemy_CrystalBall

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $B, $3, Enemy_HawkmouthLeft

; Page 3
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
