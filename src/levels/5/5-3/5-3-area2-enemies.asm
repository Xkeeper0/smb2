; Level 5-3, Area 2

EnemyData_Level_5_3_Area2:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $3, $6, Enemy_PanserStationaryFiresAngled
	enemy $C, $6, Enemy_BobOmb

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $3, $6, Enemy_BobOmb

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $2, $5, Enemy_BobOmb
	enemy $4, $5, Enemy_BobOmb

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $A, $5, Enemy_JarGeneratorBobOmb

; Page 5
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
