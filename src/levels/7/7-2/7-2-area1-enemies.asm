; Level 7-2, Area 1

EnemyData_Level_7_2_Area1:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $9, $9, Enemy_ShyguyRed
	enemy $D, $9, Enemy_ShyguyRed
	enemy $F, $9, Enemy_JarGeneratorShyguy

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $7, $7, Enemy_NinjiJumping
	enemy $A, $7, Enemy_NinjiJumping
	enemy $C, $7, Enemy_NinjiJumping

; Page 3
+	distTo + ; $03 (1 enemy)
	enemy $D, $9, Enemy_JarGeneratorBobOmb

; Page 4
+	distTo + ; $01 (0 enemies)

; Page 5
+	distTo + ; $05 (2 enemies)
	enemy $1, $C, Enemy_PanserStationaryFiresUp
	enemy $B, $C, Enemy_PanserStationaryFiresUp

; Page 6
+	distTo + ; $03 (1 enemy)
	enemy $5, $B, Enemy_PanserStationaryFiresUp

; Page 7
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
