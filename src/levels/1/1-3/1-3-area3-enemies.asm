; Level 1-3, Area 3

EnemyData_Level_1_3_Area3:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $C, $9, Enemy_Spark4

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $C, $6, Enemy_Spark2

; Page 2
+	distTo + ; $09 (4 enemies)
	enemy $5, $6, Enemy_Tweeter
	enemy $D, $4, Enemy_SnifitPink
	enemy $D, $7, Enemy_SnifitPink
	enemy $D, $A, Enemy_SnifitPink

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $A, $7, Enemy_Spark3
	enemy $F, $7, Enemy_Spark3

; Page 4
+	distTo + ; $05 (2 enemies)
	enemy $3, $A, Enemy_Spark1
	enemy $6, $A, Enemy_Spark1

; Page 5
+	distTo + ; $09 (4 enemies)
	enemy $0, $9, Enemy_NinjiRunning
	enemy $2, $9, Enemy_NinjiRunning
	enemy $A, $8, Enemy_CrystalBall
	enemy $D, $7, Enemy_HawkmouthLeft

; Page 6
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
