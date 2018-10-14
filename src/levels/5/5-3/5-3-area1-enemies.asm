; Level 5-3, Area 1

EnemyData_Level_5_3_Area1:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $8, $0, Enemy_StopAttack

; Page 1
+	distTo + ; $01 (0 enemies)

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $0, $0, Enemy_AttackAlbatossCarryingBobOmb

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $4, $0, Enemy_AttackAlbatossCarryingBobOmb

; Page 5
+	distTo + ; $03 (1 enemy)
	enemy $C, $0, Enemy_StopAttack

; Page 6
+	distTo + ; $03 (1 enemy)
	enemy $C, $0, Enemy_StopAttack

; Page 7
+	distTo + ; $07 (3 enemies)
	enemy $2, $C, Enemy_BobOmb
	enemy $7, $C, Enemy_BobOmb
	enemy $A, $C, Enemy_BobOmb

; Page 8
+	distTo + ; $01 (0 enemies)

; Page 9
+	distTo + ; $05 (2 enemies)
	enemy $5, $8, Enemy_BobOmb
	enemy $7, $8, Enemy_BobOmb

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
