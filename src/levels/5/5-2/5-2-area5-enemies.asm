; Level 5-2, Area 5

EnemyData_Level_5_2_Area5:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $7, $3, Enemy_Trouter
	enemy $B, $8, Enemy_Birdo
	enemy $B, $9, Enemy_CrystalBall

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $B, $4, Enemy_HawkmouthLeft

; Page 3
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
