;
; Music Pointers
; ==============
; @todo describe :P
;
MusicPointersFirstPart:
	musicPart MusicPartPointers_Overworld
	musicPart MusicPartPointers_CharacterSelect
	musicPart MusicPartPointers_Underground
	musicPart MusicPartPointers_Boss
	musicPart MusicPartPointers_Star
	musicPart MusicPartPointers_SubSpace
	musicPart MusicPartPointers_Wart
	musicPart MusicPartPointers_TitleScreen
	musicPart MusicPartPointers_Ending

MusicPointersEndPart:
	musicPart MusicPartPointers_OverworldEnd
	musicPart MusicPartPointers_CharacterSelectEnd
	musicPart MusicPartPointers_UndergroundEnd
	musicPart MusicPartPointers_BossEnd
	musicPart MusicPartPointers_StarEnd
	musicPart MusicPartPointers_SubSpaceEnd
	musicPart MusicPartPointers_WartEnd
	musicPart MusicPartPointers_TitleScreenEnd
	musicPart MusicPartPointers_EndingEnd

MusicPointersLoopPart:
	musicPart MusicPartPointers_OverworldLoop
	musicPart MusicPartPointers_CharacterSelectLoop
	musicPart MusicPartPointers_UndergroundLoop
	musicPart MusicPartPointers_BossLoop
	musicPart MusicPartPointers_StarLoop
	musicPart MusicPartPointers_SubSpaceLoop
	musicPart MusicPartPointers_WartEnd
	.db $00 ; no loop
IFNDEF PROTOTYPE_MUSIC
	musicPart MusicPartPointers_EndingLoop
ENDIF
IFDEF PROTOTYPE_MUSIC
	.db $00 ; no loop
ENDIF
