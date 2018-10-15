; Level 4-1, Area 0

EnemyData_Level_4_1_Area0:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $9, $6, Enemy_Flurry
	enemy $B, $2, Enemy_Trouter

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $2, $2, Enemy_Trouter

; Page 3
+	distTo + ; $0B (5 enemies)
	enemy $0, $9, Enemy_Flurry
	enemy $2, $9, Enemy_Flurry
	enemy $3, $5, Enemy_Trouter
	enemy $D, $9, Enemy_Flurry
	enemy $F, $6, Enemy_Flurry

; Page 4
+	distTo + ; $01 (0 enemies)

; Page 5
+	distTo + ; $09 (4 enemies)
	enemy $4, $6, Enemy_Flurry
	enemy $9, $8, Enemy_Flurry
	enemy $A, $6, Enemy_Flurry
	enemy $F, $8, Enemy_Flurry

; Page 6
+	distTo + ; $05 (2 enemies)
	enemy $1, $3, Enemy_Trouter
	enemy $B, $8, Enemy_Flurry

; Page 7
+	distTo + ; $05 (2 enemies)
	enemy $0, $8, Enemy_Flurry
	enemy $B, $5, Enemy_Flurry

; Page 8
+	distTo + ; $05 (2 enemies)
	enemy $3, $5, Enemy_Flurry
	enemy $4, $1, Enemy_Trouter

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
