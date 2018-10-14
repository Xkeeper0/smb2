; Level 5-3, Area 4

EnemyData_Level_5_3_Area4:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $01 (0 enemies)

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $6, $7, Enemy_SnifitPink
	enemy $D, $2, Enemy_Pidgit

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $F, $2, Enemy_Pidgit

; Page 5
+	distTo + ; $01 (0 enemies)

; Page 6
+	distTo + ; $07 (3 enemies)
	enemy $6, $0, Enemy_BeezoDiving
	enemy $9, $2, Enemy_ShyguyPink
	enemy $A, $6, Enemy_ShyguyPink

; Page 7
+	distTo + ; $05 (2 enemies)
	enemy $0, $7, Enemy_ShyguyPink
	enemy $5, $5, Enemy_ShyguyPink

; Page 8
+	distTo + ; $05 (2 enemies)
	enemy $B, $7, Enemy_Birdo
	enemy $B, $8, Enemy_CrystalBall

; Page 9
+	distTo + ; $03 (1 enemy)
	enemy $B, $5, Enemy_HawkmouthLeft

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
