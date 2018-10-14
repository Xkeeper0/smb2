; Level 7-2, Area 0

EnemyData_Level_7_2_Area0:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $F, $5, Enemy_SnifitGray

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $5, $8, Enemy_SnifitGray
	enemy $E, $8, Enemy_SnifitGray

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $7, $4, Enemy_NinjiJumping

; Page 3
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
