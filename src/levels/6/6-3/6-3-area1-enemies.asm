; Level 6-3, Area 1

EnemyData_Level_6_3_Area1:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $01 (0 enemies)

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $9, $8, Enemy_ShyguyPink

; Page 3
+	distTo + ; $07 (3 enemies)
	enemy $4, $8, Enemy_ShyguyPink
	enemy $6, $6, Enemy_Pokey
	enemy $A, $A, Enemy_CobratSand

; Page 4
+	distTo + ; $01 (0 enemies)

; Page 5
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
