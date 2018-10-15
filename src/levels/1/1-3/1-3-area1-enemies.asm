; Level 1-3, Area 1

EnemyData_Level_1_3_Area1:

; Page 0
	distTo + ; $07 (3 enemies)
	enemy $8, $3, Enemy_Phanto
	enemy $8, $8, Enemy_Key
	enemy $8, $A, Enemy_Spark1

; Page 1
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
