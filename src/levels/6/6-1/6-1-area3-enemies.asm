; Level 6-1, Area 3

EnemyData_Level_6_1_Area3:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $5, $A, Enemy_ShyguyRed

; Page 1
+	distTo + ; $09 (4 enemies)
	enemy $4, $1, Enemy_ShyguyRed
	enemy $B, $4, Enemy_ShyguyRed
	enemy $8, $5, Enemy_Phanto
	enemy $6, $9, Enemy_Key

; Page 2
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
