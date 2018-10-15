; Level 4-3, Area 2

EnemyData_Level_4_3_Area2:

; Page 0
	distTo + ; $09 (4 enemies)
	enemy $E, $A, Enemy_Flurry
	enemy $E, $C, Enemy_Flurry
	enemy $D, $E, Enemy_Flurry
	enemy $E, $E, Enemy_Flurry

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $E, $E, Enemy_Flurry

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $E, $0, Enemy_Flurry
	enemy $E, $2, Enemy_Flurry

; Page 3
+	distTo + ; $03 (1 enemy)
	enemy $8, $C, Enemy_Flurry

; Page 4
+	distTo + ; $09 (4 enemies)
	enemy $9, $2, Enemy_Flurry
	enemy $B, $2, Enemy_Flurry
	enemy $E, $9, Enemy_Flurry
	enemy $E, $B, Enemy_Flurry

; Page 5
+	distTo + ; $05 (2 enemies)
	enemy $7, $1, Enemy_Flurry
	enemy $E, $4, Enemy_Flurry

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $01 (0 enemies)

; Page 8
+	distTo + ; $01 (0 enemies)

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
