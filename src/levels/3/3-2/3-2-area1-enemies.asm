; Level 3-2, Area 1

EnemyData_Level_3_2_Area1:

; Page 0
	distTo + ; $07 (3 enemies)
	enemy $3, $C, Enemy_Porcupo
	enemy $6, $C, Enemy_Porcupo
	enemy $E, $C, Enemy_Porcupo

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $1, $C, Enemy_Porcupo

; Page 2
+	distTo + ; $01 (0 enemies)

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $2, $9, Enemy_ShyguyPink

; Page 5
+	distTo + ; $07 (3 enemies)
	enemy $2, $9, Enemy_Tweeter
	enemy $4, $9, Enemy_Tweeter
	enemy $6, $C, Enemy_Tweeter

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $01 (0 enemies)

; Page 8
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
