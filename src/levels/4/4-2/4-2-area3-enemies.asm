; Level 4-2, Area 3

EnemyData_Level_4_2_Area3:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $C, $7, Enemy_Autobomb

; Page 2
+	distTo + ; $01 (0 enemies)

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $9, $9, Enemy_Porcupo
	enemy $C, $9, Enemy_Porcupo

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
