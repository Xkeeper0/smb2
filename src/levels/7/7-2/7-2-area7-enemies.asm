; Level 7-2, Area 7

EnemyData_Level_7_2_Area7:

; Page 0
	distTo + ; $09 (4 enemies)
	enemy $7, $6, Enemy_ShyguyPink
	enemy $6, $9, Enemy_SnifitPink
	enemy $9, $9, Enemy_SnifitPink
	enemy $8, $F, Enemy_Spark3

; Page 1
+	distTo + ; $09 (4 enemies)
	enemy $A, $2, Enemy_Spark2
	enemy $7, $3, Enemy_Spark4
	enemy $6, $8, Enemy_Spark4
	enemy $A, $D, Enemy_Spark1

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $8, $0, Enemy_Spark4
	enemy $9, $7, Enemy_Spark4
	enemy $7, $F, Enemy_Spark1

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $8, $0, Enemy_SnifitPink
	enemy $8, $4, Enemy_ShyguyRed

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
