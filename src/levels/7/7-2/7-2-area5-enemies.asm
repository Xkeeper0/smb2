; Level 7-2, Area 5

EnemyData_Level_7_2_Area5:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $01 (0 enemies)

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $1, $A, Enemy_VegetableThrower
	enemy $A, $7, Enemy_BossWart

; Page 3
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
