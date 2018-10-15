; Level 6-3, Area 3

EnemyData_Level_6_3_Area3:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $09 (4 enemies)
	enemy $9, $5, Enemy_Hoopstar
	enemy $A, $4, Enemy_Hoopstar
	enemy $B, $3, Enemy_Hoopstar
	enemy $C, $2, Enemy_Hoopstar

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $A, $7, Enemy_Hoopstar
	enemy $B, $A, Enemy_Hoopstar
	enemy $C, $8, Enemy_Hoopstar

; Page 3
+	distTo + ; $03 (1 enemy)
	enemy $3, $4, Enemy_Hoopstar

; Page 4
+	distTo + ; $07 (3 enemies)
	enemy $4, $A, Enemy_Hoopstar
	enemy $7, $5, Enemy_SnifitGray
	enemy $7, $E, Enemy_SnifitGray

; Page 5
+	distTo + ; $03 (1 enemy)
	enemy $2, $8, Enemy_ShyguyRed

; Page 6
+	distTo + ; $07 (3 enemies)
	enemy $9, $C, Enemy_Hoopstar
	enemy $A, $D, Enemy_Hoopstar
	enemy $B, $E, Enemy_Hoopstar

; Page 7
+	distTo + ; $03 (1 enemy)
	enemy $5, $C, Enemy_Hoopstar

; Page 8
+	distTo + ; $03 (1 enemy)
	enemy $9, $3, Enemy_Hoopstar

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
