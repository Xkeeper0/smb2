; Level 7-1, Area 2

EnemyData_Level_7_1_Area2:

; Page 0
	distTo + ; $01 (0 enemies)

; Page 1
+	distTo + ; $07 (3 enemies)
	enemy $A, $8, Enemy_Tweeter
	enemy $B, $6, Enemy_SnifitGray
	enemy $C, $B, Enemy_SnifitGray

; Page 2
+	distTo + ; $07 (3 enemies)
	enemy $3, $8, Enemy_JarGeneratorShyguy
	enemy $D, $C, Enemy_ShyguyPink
	enemy $F, $3, Enemy_SnifitGray

; Page 3
+	distTo + ; $05 (2 enemies)
	enemy $5, $9, Enemy_NinjiRunning
	enemy $A, $B, Enemy_SnifitGray

; Page 4
+	distTo + ; $01 (0 enemies)

; End of enemy data
+
