; Level 3-1, Area 3

EnemyData_Level_3_1_Area3:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $03 (1 enemy)
	enemy $2, $B, Enemy_ShyguyPink

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $1, $2, Enemy_PanserStationaryFiresUp

; Page 3
+	distTo + ; $03 (1 enemy)
	enemy $9, $5, Enemy_PanserStationaryFiresAngled

; Page 4
+	distTo + ; $03 (1 enemy)
	enemy $6, $5, Enemy_ShyguyPink

; Page 5
+	distTo + ; $03 (1 enemy)
	enemy $0, $5, Enemy_PanserWalking

; Page 6
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
