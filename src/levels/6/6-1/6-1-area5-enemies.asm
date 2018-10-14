; Level 6-1, Area 5

EnemyData_Level_6_1_Area5:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $5, $A, Enemy_ShyguyRed

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $4, $1, Enemy_ShyguyRed
	enemy $B, $4, Enemy_ShyguyRed

; Page 2
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
