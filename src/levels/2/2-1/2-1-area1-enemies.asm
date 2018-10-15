; Level 2-1, Area 1

EnemyData_Level_2_1_Area1:

; Page 0
	distTo + ; $05 (2 enemies)
	enemy $4, $9, Enemy_ShyguyRed
	enemy $6, $D, Enemy_ShyguyRed

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $D, $3, Enemy_ShyguyRed

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $4, $0, Enemy_ShyguyRed
	enemy $1, $6, Enemy_SnifitGray
	enemy $C, $8, Enemy_ShyguyRed

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
