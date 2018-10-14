; Level 1-2, Area 0

EnemyData_Level_1_2_Area0:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $6, $A, Enemy_HawkmouthRight

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $2, $2, Enemy_Pidgit

; Page 2
+	distTo + ; $09 (4 enemies)
	enemy $0, $0, Enemy_BeezoDiving
	enemy $4, $0, Enemy_BeezoDiving
	enemy $9, $0, Enemy_BeezoDiving
	enemy $E, $0, Enemy_BeezoDiving

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $05 (2 enemies)
	enemy $3, $C, Enemy_NinjiJumping
	enemy $6, $C, Enemy_NinjiJumping

; Page 5
+	distTo + ; $05 (2 enemies)
	enemy $5, $3, Enemy_SnifitGray
	enemy $8, $3, Enemy_NinjiRunning

; Page 6
+	distTo + ; $05 (2 enemies)
	enemy $B, $6, Enemy_ShyguyRed
	enemy $F, $6, Enemy_ShyguyRed

; Page 7
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
