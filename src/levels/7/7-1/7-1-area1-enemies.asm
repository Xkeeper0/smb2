; Level 7-1, Area 1

EnemyData_Level_7_1_Area1:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $01 (0 enemies)

; Page 2
+	distTo + ; $01 (0 enemies)

; Page 3
+	distTo + ; $0D (6 enemies)
	enemy $8, $B, Enemy_BobOmb
	enemy $9, $4, Enemy_AlbatossStartLeft
	enemy $9, $4, Enemy_BobOmb
	enemy $B, $8, Enemy_NinjiRunning
	enemy $E, $4, Enemy_AlbatossStartLeft
	enemy $E, $4, Enemy_BobOmb

; Page 4
+	distTo + ; $07 (3 enemies)
	enemy $2, $B, Enemy_BobOmb
	enemy $E, $4, Enemy_AlbatossStartLeft
	enemy $E, $4, Enemy_BobOmb

; Page 5
+	distTo + ; $0D (6 enemies)
	enemy $3, $B, Enemy_NinjiJumping
	enemy $5, $4, Enemy_AlbatossStartLeft
	enemy $5, $4, Enemy_BobOmb
	enemy $6, $B, Enemy_BobOmb
	enemy $9, $4, Enemy_AlbatossStartLeft
	enemy $9, $4, Enemy_BobOmb

; Page 6
+	distTo + ; $07 (3 enemies)
	enemy $3, $7, Enemy_JarGeneratorShyguy
	enemy $F, $3, Enemy_AlbatossStartLeft
	enemy $F, $3, Enemy_BobOmb

; Page 7
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
