; Level 1-2, Area 1

EnemyData_Level_1_2_Area1:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $D, $C, Enemy_ShyguyRed

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $3, $C, Enemy_SnifitPink

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $2, $C, Enemy_SnifitGray

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $7, $9, Enemy_NinjiRunning
	enemy $8, $9, Enemy_NinjiRunning

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
