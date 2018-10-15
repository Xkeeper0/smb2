; Level 1-3, Area 0

EnemyData_Level_1_3_Area0:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $3, $8, Enemy_HawkmouthRight

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $9, $4, Enemy_SnifitPink
	enemy $B, $4, Enemy_SnifitPink

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $7, $4, Enemy_ShyguyRed

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $3, $4, Enemy_Trouter
	enemy $A, $4, Enemy_Trouter

; Page 4
+	distTo + ; $07 (3 enemies)
	enemy $0, $2, Enemy_Trouter
	enemy $6, $2, Enemy_Trouter
	enemy $E, $6, Enemy_FallingLogs

; Page 5
+	distTo + ; $05 (2 enemies)
	enemy $2, $6, Enemy_FallingLogs
	enemy $6, $6, Enemy_FallingLogs

; Page 6
+	distTo + ; $09 (4 enemies)
	enemy $4, $A, Enemy_Trouter
	enemy $5, $C, Enemy_FallingLogs
	enemy $8, $A, Enemy_Trouter
	enemy $9, $C, Enemy_FallingLogs

; Page 7
+	distTo + ; $05 (2 enemies)
	enemy $2, $A, Enemy_ShyguyPink
	enemy $7, $A, Enemy_ShyguyPink

; Page 8
+	distTo + ; $09 (4 enemies)
	enemy $2, $9, Enemy_NinjiRunning
	enemy $4, $9, Enemy_NinjiRunning
	enemy $7, $A, Enemy_Tweeter
	enemy $9, $A, Enemy_Tweeter

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
