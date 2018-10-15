; Level 1-1, Area 1

EnemyData_Level_1_1_Area1:

; Page 0
	distTo + ; $05 (2 enemies)
	enemy $5, $6, Enemy_Hoopstar
	enemy $A, $D, Enemy_Hoopstar

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $9, $D, Enemy_ShyguyPink

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $8, $3, Enemy_NinjiJumping
	enemy $7, $9, Enemy_NinjiJumping
	enemy $B, $C, Enemy_ShyguyPink

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $9, $0, Enemy_NinjiJumping
	enemy $7, $5, Enemy_NinjiJumping

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
