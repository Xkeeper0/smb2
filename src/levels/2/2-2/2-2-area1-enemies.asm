; Level 2-2, Area 1

EnemyData_Level_2_2_Area1:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $8, $D, Enemy_CobratSand

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $5, $0, Enemy_BeezoDiving
	enemy $F, $A, Enemy_CobratJar

; Page 3
+	distTo + ; $03 (1 enemy)
	enemy $9, $9, Enemy_ShyguyRed

; Page 4
+	distTo + ; $05 (2 enemies)
	enemy $0, $A, Enemy_CobratJar
	enemy $3, $7, Enemy_CobratJar

; Page 5
+	distTo + ; $07 (3 enemies)
	enemy $1, $0, Enemy_BeezoDiving
	enemy $1, $5, Enemy_CobratJar
	enemy $9, $7, Enemy_FallingLogs

; Page 6
+	distTo + ; $07 (3 enemies)
	enemy $5, $8, Enemy_CobratJar
	enemy $A, $8, Enemy_CobratJar
	enemy $E, $7, Enemy_CobratJar

; Page 7
+	distTo + ; $09 (4 enemies)
	enemy $2, $8, Enemy_CobratJar
	enemy $5, $7, Enemy_CobratJar
	enemy $8, $6, Enemy_Pokey
	enemy $9, $7, Enemy_CobratJar

; Page 8
+	distTo + ; $03 (1 enemy)
	enemy $B, $5, Enemy_PanserStationaryFiresAngled

; Page 9
+	distTo + ; $03 (1 enemy)
	enemy $0, $5, Enemy_PanserStationaryFiresAngled

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
