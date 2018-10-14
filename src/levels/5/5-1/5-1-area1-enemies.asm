; Level 5-1, Area 1

EnemyData_Level_5_1_Area1:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $E, $4, Enemy_FallingLogs

; Page 2
+	distTo + ; $09 (4 enemies)
	enemy $3, $4, Enemy_FallingLogs
	enemy $8, $4, Enemy_FallingLogs
	enemy $B, $2, Enemy_Trouter
	enemy $D, $4, Enemy_FallingLogs

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $8, $2, Enemy_Trouter
	enemy $C, $2, Enemy_Trouter

; Page 4
+	distTo + ; $05 (2 enemies)
	enemy $0, $2, Enemy_Trouter
	enemy $A, $4, Enemy_FallingLogs

; Page 5
+	distTo + ; $07 (3 enemies)
	enemy $4, $2, Enemy_Trouter
	enemy $8, $2, Enemy_Trouter
	enemy $C, $2, Enemy_Trouter

; Page 6
+	distTo + ; $03 (1 enemy)
	enemy $B, $2, Enemy_Trouter

; Page 7
+	distTo + ; $05 (2 enemies)
	enemy $9, $4, Enemy_FallingLogs
	enemy $E, $4, Enemy_FallingLogs

; Page 8
+	distTo + ; $01 (0 enemies)

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
