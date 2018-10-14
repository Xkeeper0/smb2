; Level 5-2, Area 1

EnemyData_Level_5_2_Area1:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $7, $8, Enemy_Hoopstar
	enemy $9, $6, Enemy_Hoopstar
	enemy $B, $8, Enemy_Hoopstar

; Page 2
+	distTo + ; $09 (4 enemies)
	enemy $2, $9, Enemy_Ostro
	enemy $D, $6, Enemy_Hoopstar
	enemy $E, $6, Enemy_Hoopstar
	enemy $F, $6, Enemy_Hoopstar

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $09 (4 enemies)
	enemy $8, $C, Enemy_Porcupo
	enemy $9, $C, Enemy_Porcupo
	enemy $A, $B, Enemy_Ostro
	enemy $B, $C, Enemy_Porcupo

; Page 5
+	distTo + ; $05 (2 enemies)
	enemy $8, $9, Enemy_Hoopstar
	enemy $B, $9, Enemy_Hoopstar

; Page 6
+	distTo + ; $05 (2 enemies)
	enemy $5, $5, Enemy_Hoopstar
	enemy $9, $5, Enemy_Hoopstar

; Page 7
+	distTo + ; $07 (3 enemies)
	enemy $1, $7, Enemy_Hoopstar
	enemy $3, $8, Enemy_PanserStationaryFiresUp
	enemy $5, $7, Enemy_Hoopstar

; Page 8
+	distTo + ; $05 (2 enemies)
	enemy $2, $6, Enemy_NinjiRunning
	enemy $4, $6, Enemy_NinjiRunning

; Page 9
+	distTo + ; $05 (2 enemies)
	enemy $6, $A, Enemy_Porcupo
	enemy $9, $9, Enemy_Ostro

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
