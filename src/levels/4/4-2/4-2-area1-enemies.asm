; Level 4-2, Area 1

EnemyData_Level_4_2_Area1:

; Page 0
	distTo + ; $05 (2 enemies)
	enemy $D, $3, Enemy_BeezoStraight
	enemy $F, $5, Enemy_BeezoStraight

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $D, $8, Enemy_BeezoStraight

; Page 2
+	distTo + ; $09 (4 enemies)
	enemy $1, $6, Enemy_BeezoStraight
	enemy $3, $7, Enemy_BeezoStraight
	enemy $4, $4, Enemy_BeezoStraight
	enemy $7, $8, Enemy_BeezoStraight

; Page 3
+	distTo + ; $0B (5 enemies)
	enemy $6, $7, Enemy_BeezoStraight
	enemy $9, $8, Enemy_BeezoStraight
	enemy $C, $7, Enemy_BeezoStraight
	enemy $E, $4, Enemy_BeezoStraight
	enemy $F, $8, Enemy_BeezoStraight

; Page 4
+	distTo + ; $07 (3 enemies)
	enemy $C, $8, Enemy_Flurry
	enemy $E, $8, Enemy_Flurry
	enemy $F, $3, Enemy_BeezoStraight

; Page 5
+	distTo + ; $05 (2 enemies)
	enemy $A, $6, Enemy_BeezoStraight
	enemy $D, $8, Enemy_BeezoStraight

; Page 6
+	distTo + ; $0B (5 enemies)
	enemy $3, $7, Enemy_BeezoStraight
	enemy $5, $3, Enemy_BeezoStraight
	enemy $9, $5, Enemy_BeezoStraight
	enemy $D, $8, Enemy_BeezoStraight
	enemy $F, $4, Enemy_BeezoStraight

; Page 7
+	distTo + ; $0B (5 enemies)
	enemy $3, $A, Enemy_BeezoStraight
	enemy $5, $6, Enemy_BeezoStraight
	enemy $7, $B, Enemy_BeezoStraight
	enemy $8, $4, Enemy_BeezoStraight
	enemy $F, $7, Enemy_BeezoStraight

; Page 8
+	distTo + ; $07 (3 enemies)
	enemy $2, $3, Enemy_BeezoStraight
	enemy $6, $6, Enemy_BeezoStraight
	enemy $B, $8, Enemy_Flurry

; Page 9
+	distTo + ; $01 (0 enemies)

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
