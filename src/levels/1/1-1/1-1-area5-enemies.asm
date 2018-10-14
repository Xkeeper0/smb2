; Level 1-1, Area 5

EnemyData_Level_1_1_Area5:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $01 (0 enemies)

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $A, $7, Enemy_Birdo
	enemy $A, $8, Enemy_CrystalBall
	enemy $E, $7, Enemy_HawkmouthLeft

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $01 (0 enemies)

; Page 5
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
