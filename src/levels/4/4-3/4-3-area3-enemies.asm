; Level 4-3, Area 3

EnemyData_Level_4_3_Area3:

; Page 0
	distTo + ; $07 (3 enemies)
	enemy $C, $8, Enemy_ShyguyRed
	enemy $D, $8, Enemy_ShyguyPink
	enemy $E, $8, Enemy_Tweeter

; Page 1
+	distTo + ; $01 (0 enemies)

; Page 2
+	distTo + ; $01 (0 enemies)

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $07 (3 enemies)
	enemy $7, $2, Enemy_Flurry
	enemy $8, $2, Enemy_Flurry
	enemy $7, $E, Enemy_Flurry

; Page 5
+	distTo + ; $01 (0 enemies)

; Page 6
+	distTo + ; $03 (1 enemy)
	enemy $C, $1, Enemy_Flurry

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
