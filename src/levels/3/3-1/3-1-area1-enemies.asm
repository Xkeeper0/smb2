; Level 3-1, Area 1

EnemyData_Level_3_1_Area1:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $0, $8, Enemy_StopAttack

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $0, $E, Enemy_AttackBeezo

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $0, $2, Enemy_AttackBeezo

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $9, $2, Enemy_Pidgit
	enemy $0, $9, Enemy_StopAttack

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $E, $5, Enemy_ShyguyPink

; Page 5
+	distTo + ; $05 (2 enemies)
	enemy $2, $1, Enemy_ShyguyPink
	enemy $8, $7, Enemy_ShyguyPink

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $01 (0 enemies)

; Page 8
+	distTo + ; $01 (0 enemies)

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
