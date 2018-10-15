; Level 2-1, Area 0

EnemyData_Level_2_1_Area0:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $F, $A, Enemy_CobratSand

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $A, $7, Enemy_CobratJar

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $6, $9, Enemy_ShyguyRed
	enemy $9, $9, Enemy_ShyguyPink

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $4, $7, Enemy_CobratJar

; Page 5
+	distTo + ; $03 (1 enemy)
	enemy $F, $8, Enemy_ShyguyPink

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $07 (3 enemies)
	enemy $2, $4, Enemy_PanserStationaryFiresAngled
	enemy $2, $7, Enemy_ShyguyRed
	enemy $4, $9, Enemy_ShyguyRed

; Page 8
+	distTo + ; $03 (1 enemy)
	enemy $4, $A, Enemy_CobratSand

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
