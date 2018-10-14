; Level 7-2, Area 9

EnemyData_Level_7_2_Area9:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $01 (0 enemies)

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $7, $9, Enemy_PanserStationaryFiresAngled

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $2, $0, Enemy_Tweeter
	enemy $D, $0, Enemy_Tweeter

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
