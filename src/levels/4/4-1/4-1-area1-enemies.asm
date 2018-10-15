; Level 4-1, Area 1

EnemyData_Level_4_1_Area1:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $01 (0 enemies)

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $5, $8, Enemy_Autobomb

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $07 (3 enemies)
	enemy $0, $A, Enemy_Flurry
	enemy $5, $8, Enemy_Autobomb
	enemy $9, $A, Enemy_Flurry

; Page 5
+	distTo + ; $05 (2 enemies)
	enemy $3, $A, Enemy_Flurry
	enemy $D, $C, Enemy_Flurry

; Page 6
+	distTo + ; $03 (1 enemy)
	enemy $F, $6, Enemy_Autobomb

; Page 7
+	distTo + ; $01 (0 enemies)

; Page 8
+	distTo + ; $05 (2 enemies)
	enemy $3, $C, Enemy_Flurry
	enemy $D, $7, Enemy_Autobomb

; Page 9
+	distTo + ; $05 (2 enemies)
	enemy $8, $5, Enemy_CrystalBall
	enemy $D, $4, Enemy_HawkmouthLeft

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
