;
; Music Pointers
; ==============
;
; These pointers are set up the master song table and are used in conjunction
; with the music part pointers to determine where those songs start and loop
;

MusicPointersFirstPart:
	musicPart MusicPartPointers_Overworld
	musicPart MusicPartPointers_CharacterSelect

IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
	musicPart MusicPartPointers_Underground
ELSE
	musicPart MusicPartPointers_UndergroundBeta
ENDIF

	musicPart MusicPartPointers_Boss

IFNDEF PROTOTYPE_MUSIC_STARMAN
	musicPart MusicPartPointers_Star
ELSE
	musicPart MusicPartPointers_StarBeta
ENDIF
	musicPart MusicPartPointers_SubSpace
	musicPart MusicPartPointers_Wart
	musicPart MusicPartPointers_TitleScreen
	musicPart MusicPartPointers_Ending

IFDEF EXPAND_MUSIC
.pad MusicPointersFirstPart + $100, $FF
ENDIF

MusicPointersEndPart:
	musicPart MusicPartPointers_OverworldEnd
	musicPart MusicPartPointers_CharacterSelectEnd

IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
	musicPart MusicPartPointers_UndergroundEnd
ELSE
	musicPart MusicPartPointers_UndergroundBetaEnd
ENDIF

	musicPart MusicPartPointers_BossEnd

IFNDEF PROTOTYPE_MUSIC_STARMAN
	musicPart MusicPartPointers_StarEnd
ELSE
	musicPart MusicPartPointers_StarBetaEnd
ENDIF

	musicPart MusicPartPointers_SubSpaceEnd
	musicPart MusicPartPointers_WartEnd
	musicPart MusicPartPointers_TitleScreenEnd
	musicPart MusicPartPointers_EndingEnd

IFDEF EXPAND_MUSIC
.pad MusicPointersEndPart + $100, $FF
ENDIF

MusicPointersLoopPart:
	musicPart MusicPartPointers_OverworldLoop
	musicPart MusicPartPointers_CharacterSelectLoop

IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
	musicPart MusicPartPointers_UndergroundLoop
ELSE
	musicPart MusicPartPointers_UndergroundBetaLoop
ENDIF

	musicPart MusicPartPointers_BossLoop

IFNDEF PROTOTYPE_MUSIC_STARMAN
	musicPart MusicPartPointers_StarLoop
ELSE
	musicPart MusicPartPointers_StarBetaLoop
ENDIF

	musicPart MusicPartPointers_SubSpaceLoop
	musicPart MusicPartPointers_WartEnd
	.db $00 ; title screen, no loop

IFNDEF PROTOTYPE_MUSIC_ENDING
	musicPart MusicPartPointers_EndingLoop
ELSE
	.db $00 ; ending, no loop
ENDIF

IFDEF EXPAND_MUSIC
.pad MusicPointersLoopPart + $100, $FF
ENDIF
