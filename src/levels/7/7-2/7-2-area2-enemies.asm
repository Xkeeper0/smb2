; Level 7-2, Area 2

EnemyData_Level_7_2_Area2:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $9, $9, Enemy_Spark4
	enemy $E, $C, Enemy_Spark4

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $2, $4, Enemy_Spark4
	enemy $6, $9, Enemy_Spark4

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $9, $6, Enemy_Spark2
	enemy $E, $3, Enemy_Spark2

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $3, $A, Enemy_Spark2

; Page 5
+	distTo + ; $03 (1 enemy)
	enemy $B, $7, Enemy_Birdo

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $07 (3 enemies)
	enemy $B, $7, Enemy_Birdo
	enemy $A, $4, Enemy_Phanto
	enemy $B, $8, Enemy_Key

; Page 8
+	distTo + ; $01 (0 enemies)

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
