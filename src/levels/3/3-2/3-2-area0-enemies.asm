; Level 3-2, Area 0

EnemyData_Level_3_2_Area0:

; Page 0
	distTo + ; $05 (2 enemies)
	enemy $4, $2, Enemy_HawkmouthRight
	enemy $4, $0, Enemy_StopAttack

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $2, $5, Enemy_Ostro
	enemy $C, $0, Enemy_AttackBeezo

; Page 2
+	distTo + ; $01 (0 enemies)

; Page 3
+	distTo + ; $03 (1 enemy)
	enemy $0, $0, Enemy_AttackBeezo

; Page 4
+	distTo + ; $05 (2 enemies)
	enemy $E, $6, Enemy_PanserStationaryFiresUp
	enemy $8, $0, Enemy_StopAttack

; Page 5
+	distTo + ; $01 (0 enemies)

; Page 6
+	distTo + ; $05 (2 enemies)
	enemy $3, $5, Enemy_Ostro
	enemy $5, $5, Enemy_Ostro

; Page 7
+	distTo + ; $05 (2 enemies)
	enemy $A, $4, Enemy_SnifitGray
	enemy $C, $B, Enemy_SnifitGray

; Page 8
+	distTo + ; $01 (0 enemies)

; Page 9
+	distTo + ; $03 (1 enemy)
	enemy $9, $6, Enemy_SnifitGray

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
