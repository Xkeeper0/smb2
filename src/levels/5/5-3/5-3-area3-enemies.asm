; Level 5-3, Area 3

EnemyData_Level_5_3_Area3:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $5, $2, Enemy_PanserWalking
	enemy $3, $D, Enemy_PanserWalking

; Page 2
+	distTo + ; $01 (0 enemies)

; Page 3
+	distTo + ; $09 (4 enemies)
	enemy $9, $0, Enemy_BobOmb
	enemy $B, $0, Enemy_BobOmb
	enemy $D, $5, Enemy_Spark2
	enemy $4, $F, Enemy_Spark3

; Page 4
+	distTo + ; $05 (2 enemies)
	enemy $8, $2, Enemy_JarGeneratorShyguy
	enemy $A, $8, Enemy_Spark2

; Page 5
+	distTo + ; $07 (3 enemies)
	enemy $4, $1, Enemy_Spark3
	enemy $8, $4, Enemy_JarGeneratorShyguy
	enemy $8, $A, Enemy_Spark4

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
