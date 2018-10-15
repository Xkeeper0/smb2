; Level 2-3, Area 3

EnemyData_Level_2_3_Area3:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $4, $B, Enemy_ShyguyPink

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $D, $5, Enemy_ShyguyRed
	enemy $A, $A, Enemy_ShyguyRed

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $D, $2, Enemy_ShyguyPink
	enemy $D, $5, Enemy_ShyguyRed

; Page 3
+	distTo + ; $03 (1 enemy)
	enemy $8, $8, Enemy_Tweeter

; Page 4
+	distTo + ; $07 (3 enemies)
	enemy $8, $3, Enemy_ShyguyRed
	enemy $A, $9, Enemy_ShyguyRed
	enemy $1, $D, Enemy_ShyguyRed

; Page 5
+	distTo + ; $07 (3 enemies)
	enemy $B, $1, Enemy_ShyguyRed
	enemy $8, $9, Enemy_ShyguyRed
	enemy $3, $D, Enemy_ShyguyRed

; Page 6
+	distTo + ; $03 (1 enemy)
	enemy $E, $3, Enemy_ShyguyRed

; Page 7
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
