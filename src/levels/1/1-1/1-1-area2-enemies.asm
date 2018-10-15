; Level 1-1, Area 2

EnemyData_Level_1_1_Area2:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $E, $C, Enemy_ShyguyRed

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $1, $C, Enemy_ShyguyRed
	enemy $5, $C, Enemy_Tweeter
	enemy $E, $5, Enemy_ShyguyPink

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $6, $C, Enemy_ShyguyRed
	enemy $8, $C, Enemy_Tweeter
	enemy $C, $C, Enemy_ShyguyRed

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $7, $9, Enemy_ShyguyPink
	enemy $D, $4, Enemy_ShyguyRed

; Page 4
+	distTo + ; $09 (4 enemies)
	enemy $0, $4, Enemy_ShyguyRed
	enemy $3, $4, Enemy_Tweeter
	enemy $8, $7, Enemy_FallingLogs
	enemy $C, $7, Enemy_FallingLogs

; Page 5
+	distTo + ; $07 (3 enemies)
	enemy $A, $9, Enemy_ShyguyPink
	enemy $B, $C, Enemy_ShyguyPink
	enemy $C, $6, Enemy_ShyguyPink

; Page 6
+	distTo + ; $05 (2 enemies)
	enemy $9, $C, Enemy_ShyguyRed
	enemy $E, $5, Enemy_ShyguyPink

; Page 7
+	distTo + ; $05 (2 enemies)
	enemy $2, $C, Enemy_ShyguyRed
	enemy $4, $C, Enemy_Tweeter

; Page 8
+	distTo + ; $07 (3 enemies)
	enemy $1, $C, Enemy_ShyguyRed
	enemy $4, $5, Enemy_ShyguyPink
	enemy $4, $C, Enemy_Tweeter

; Page 9
+	distTo + ; $05 (2 enemies)
	enemy $9, $5, Enemy_ShyguyRed
	enemy $D, $1, Enemy_Hoopstar

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
