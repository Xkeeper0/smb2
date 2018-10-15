; Level 5-2, Area 2

EnemyData_Level_5_2_Area2:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $8, $B, Enemy_Hoopstar

; Page 1
+	distTo + ; $09 (4 enemies)
	enemy $F, $2, Enemy_BeezoStraight
	enemy $6, $8, Enemy_Hoopstar
	enemy $8, $E, Enemy_Hoopstar
	enemy $D, $E, Enemy_SnifitGray

; Page 2
+	distTo + ; $0B (5 enemies)
	enemy $0, $2, Enemy_BeezoStraight
	enemy $C, $5, Enemy_SnifitGray
	enemy $3, $6, Enemy_SnifitGray
	enemy $8, $E, Enemy_BeezoStraight
	enemy $D, $E, Enemy_BeezoStraight

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
