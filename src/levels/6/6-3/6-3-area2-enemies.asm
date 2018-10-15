; Level 6-3, Area 2

EnemyData_Level_6_3_Area2:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $4, $9, Enemy_JarGeneratorBobOmb
	enemy $F, $9, Enemy_JarGeneratorBobOmb

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $A, $9, Enemy_BobOmb
	enemy $C, $9, Enemy_JarGeneratorBobOmb

; Page 3
+	distTo + ; $03 (1 enemy)
	enemy $F, $5, Enemy_NinjiRunning

; Page 4
+	distTo + ; $07 (3 enemies)
	enemy $2, $7, Enemy_NinjiRunning
	enemy $3, $8, Enemy_NinjiRunning
	enemy $5, $6, Enemy_NinjiRunning

; Page 5
+	distTo + ; $01 (0 enemies)

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
