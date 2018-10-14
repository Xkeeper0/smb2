; Level 6-1, Area 1

EnemyData_Level_6_1_Area1:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $4, $B, Enemy_CobratJar
	enemy $9, $A, Enemy_CobratJar
	enemy $F, $B, Enemy_JarGeneratorShyguy

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $2, $B, Enemy_CobratJar
	enemy $7, $B, Enemy_CobratJar

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
