; Level 6-2, Area 1

EnemyData_Level_6_2_Area1:

; Page 0
	distTo + ; $05 (2 enemies)
	enemy $0, $C, Enemy_AlbatossStartRight
	enemy $2, $6, Enemy_AlbatossStartRight

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $A, $B, Enemy_AlbatossStartLeft
	enemy $C, $9, Enemy_AlbatossStartLeft
	enemy $E, $7, Enemy_AlbatossStartLeft

; Page 2
+	distTo + ; $03 (1 enemy)
	enemy $A, $B, Enemy_PanserStationaryFiresUp

; Page 3
+	distTo + ; $07 (3 enemies)
	enemy $5, $5, Enemy_BeezoStraight
	enemy $8, $5, Enemy_BeezoStraight
	enemy $A, $5, Enemy_BeezoStraight

; Page 4
+	distTo + ; $05 (2 enemies)
	enemy $9, $8, Enemy_AlbatossStartLeft
	enemy $C, $8, Enemy_AlbatossStartLeft

; Page 5
+	distTo + ; $03 (1 enemy)
	enemy $A, $3, Enemy_BeezoStraight

; Page 6
+	distTo + ; $07 (3 enemies)
	enemy $6, $3, Enemy_AlbatossStartLeft
	enemy $6, $5, Enemy_AlbatossStartLeft
	enemy $6, $7, Enemy_AlbatossStartLeft

; Page 7
+	distTo + ; $07 (3 enemies)
	enemy $6, $5, Enemy_AlbatossStartLeft
	enemy $9, $3, Enemy_AlbatossStartLeft
	enemy $C, $4, Enemy_AlbatossStartLeft

; Page 8
+	distTo + ; $03 (1 enemy)
	enemy $E, $B, Enemy_AlbatossStartLeft

; Page 9
+	distTo + ; $05 (2 enemies)
	enemy $2, $9, Enemy_AlbatossStartLeft
	enemy $A, $9, Enemy_AlbatossStartLeft

; Page A
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
