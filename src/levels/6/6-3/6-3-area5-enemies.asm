; Level 6-3, Area 5

EnemyData_Level_6_3_Area5:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $9, $7, Enemy_HawkmouthLeft
	enemy $B, $3, Enemy_Birdo
	enemy $B, $4, Enemy_CrystalBall

; Page 2
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
