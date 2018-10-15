; Level 2-3, Area 5

EnemyData_Level_2_3_Area5:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $09 (4 enemies)
	enemy $1, $5, Enemy_ShyguyRed
	enemy $0, $8, Enemy_ShyguyRed
	enemy $F, $8, Enemy_ShyguyRed
	enemy $C, $B, Enemy_ShyguyRed

; Page 2
+	distTo + ; $01 (0 enemies)

; Page 3
+	distTo + ; $07 (3 enemies)
	enemy $1, $4, Enemy_PanserStationaryFiresAngled
	enemy $3, $9, Enemy_ShyguyPink
	enemy $7, $B, Enemy_ShyguyPink

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $6, $7, Enemy_CobratJar

; Page 5
+	distTo + ; $07 (3 enemies)
	enemy $0, $A, Enemy_CobratJar
	enemy $3, $B, Enemy_CrystalBall
	enemy $6, $A, Enemy_CobratJar

; Page 6
+	distTo + ; $03 (1 enemy)
	enemy $9, $7, Enemy_HawkmouthLeft

; Page 7
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
