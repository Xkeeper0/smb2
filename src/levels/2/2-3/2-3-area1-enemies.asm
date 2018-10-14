; Level 2-3, Area 1

EnemyData_Level_2_3_Area1:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $C, $7, Enemy_ShyguyPink

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $2, $0, Enemy_StopAttack

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $2, $0, Enemy_BeezoDiving
	enemy $A, $0, Enemy_AttackBeezo

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $01 (0 enemies)

; Page 5
+	distTo + ; $03 (1 enemy)
	enemy $8, $0, Enemy_AttackBeezo

; Page 6
+	distTo + ; $01 (0 enemies)

; Page 7
+	distTo + ; $03 (1 enemy)
	enemy $0, $0, Enemy_StopAttack

; Page 8
+	distTo + ; $05 (2 enemies)
	enemy $7, $A, Enemy_CobratSand
	enemy $D, $6, Enemy_Pokey

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
