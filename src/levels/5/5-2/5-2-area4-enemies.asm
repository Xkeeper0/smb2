; Level 5-2, Area 4

EnemyData_Level_5_2_Area4:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $2, $B, Enemy_ShyguyRed

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $2, $4, Enemy_Porcupo
	enemy $B, $4, Enemy_Porcupo

; Page 2
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
