; Level 2-2, Area 3

EnemyData_Level_2_2_Area3:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $8, $A, Enemy_ShyguyRed

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $C, $2, Enemy_ShyguyRed
	enemy $6, $7, Enemy_ShyguyRed

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $A, $0, Enemy_NinjiJumping
	enemy $7, $8, Enemy_ShyguyRed
	enemy $B, $D, Enemy_ShyguyRed

; Page 3
+	distTo + ; $03 (1 enemy)
	enemy $E, $2, Enemy_SnifitGray

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
