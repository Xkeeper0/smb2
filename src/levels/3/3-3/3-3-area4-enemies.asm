; Level 3-3, Area 4

EnemyData_Level_3_3_Area4:

; Page 0
	distTo + ; $03 (1 enemy)
	enemy $6, $C, Enemy_SnifitGray

; Page 1
+	distTo + ; $05 (2 enemies)
	enemy $8, $D, Enemy_PanserStationaryFiresAngled
	enemy $C, $D, Enemy_PanserStationaryFiresAngled

; Page 2
+	distTo + ; $05 (2 enemies)
	enemy $5, $7, Enemy_Tweeter
	enemy $E, $D, Enemy_Tweeter

; Page 3
+	distTo + ; $01 (0 enemies)

; Page 4
+	distTo + ; $05 (2 enemies)
	enemy $C, $2, Enemy_SnifitRed
	enemy $3, $B, Enemy_SnifitPink

; Page 5
+	distTo + ; $05 (2 enemies)
	enemy $C, $4, Enemy_SnifitPink
	enemy $3, $D, Enemy_ShyguyPink

; Page 6
+	distTo + ; $03 (1 enemy)
	enemy $D, $6, Enemy_NinjiJumping

; Page 7
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
