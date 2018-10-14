; Level 1-3, Area 2

EnemyData_Level_1_3_Area2:

; Page 0
	distTo + ; $07 (3 enemies)
	enemy $4, $B, Enemy_Spark1
	enemy $7, $C, Enemy_Spark3
	enemy $C, $9, Enemy_Spark3

; Page 1
+	distTo + ; $01 (0 enemies)

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $6, $1, Enemy_Spark3
	enemy $5, $A, Enemy_Spark4
	enemy $B, $A, Enemy_ShyguyPink

; Page 3
+	distTo + ; $03 (1 enemy)
	enemy $D, $B, Enemy_ShyguyRed

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $4, $A, Enemy_SnifitGray

; Page 5
+	distTo + ; $03 (1 enemy)
	enemy $3, $5, Enemy_ShyguyPink

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
