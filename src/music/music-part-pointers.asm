;
; Music Part Pointers
; ===================
;
; These are the pointers to various music segments used to cue those themes in
; the game as well as handle relative offsets for looping segments
;
MusicPartPointers:

; These pointers correspond to MusicQueue2 fanfares that temporarily interrupt
; the current background music
MusicPartPointers_Mushroom:
	musicPart MusicHeaderMushroomBonusChance

MusicPartPointers_BossBeaten:
	musicPart MusicHeaderBossBeaten

; This version of the crystal fanfare is unused, because special logic in
; ProcessMusicQueue uses this slot for the ending theme instead.
MusicPartPointers_CrystalUnused:
	musicPart MusicHeaderCrystal

MusicPartPointers_Death:
	musicPart MusicHeaderDeath

MusicPartPointers_GameOver:
	musicPart MusicHeaderGameOver

MusicPartPointers_Crystal:
	musicPart MusicHeaderCrystal

MusicPartPointers_BonusChance:
	musicPart MusicHeaderMushroomBonusChance

; The rest of the pointers correspond to music that uses the pointer tables
; with support for segment-based looping.
MusicPartPointers_CharacterSelect:
	musicPart MusicHeaderCharacterSelect1
MusicPartPointers_CharacterSelectLoop:
	musicPart MusicHeaderCharacterSelect2
	musicPart MusicHeaderCharacterSelect3
	musicPart MusicHeaderCharacterSelect2
	musicPart MusicHeaderCharacterSelect4
	musicPart MusicHeaderCharacterSelect5
	musicPart MusicHeaderCharacterSelect6
	musicPart MusicHeaderCharacterSelect7
MusicPartPointers_CharacterSelectEnd:
	musicPart MusicHeaderCharacterSelect8


MusicPartPointers_Overworld:
	musicPart MusicHeaderOverworld1
MusicPartPointers_OverworldLoop:
	musicPart MusicHeaderOverworld2
	musicPart MusicHeaderOverworld3
	musicPart MusicHeaderOverworld4
	musicPart MusicHeaderOverworld3
	musicPart MusicHeaderOverworld5
MusicPartPointers_OverworldEnd:
	musicPart MusicHeaderOverworld6


MusicPartPointers_Boss:
MusicPartPointers_BossLoop:
MusicPartPointers_BossEnd:
	musicPart MusicHeaderBoss


IFNDEF PROTOTYPE_MUSIC_STARMAN
MusicPartPointers_Star:
MusicPartPointers_StarLoop:
MusicPartPointers_StarEnd:
	musicPart MusicHeaderStar
ELSE
MusicPartPointers_StarBeta:
MusicPartPointers_StarBetaLoop:
MusicPartPointers_StarBetaEnd:
	musicPart MusicHeaderStarBeta
ENDIF

MusicPartPointers_Wart:
MusicPartPointers_WartLoop:
MusicPartPointers_WartEnd:
	musicPart MusicHeaderWart


MusicPartPointers_TitleScreen:
	musicPart MusicHeaderTitleScreen1
	musicPart MusicHeaderTitleScreen2
	musicPart MusicHeaderTitleScreen3
MusicPartPointers_TitleScreenEnd:
	musicPart MusicHeaderTitleScreen4


MusicPartPointers_SubSpace:
MusicPartPointers_SubSpaceLoop:
	musicPart MusicHeaderSubspace1
	musicPart MusicHeaderSubspace2
	musicPart MusicHeaderSubspace3
	musicPart MusicHeaderSubspace2
MusicPartPointers_SubSpaceEnd:
	musicPart MusicHeaderSubspace4


MusicPartPointers_Ending:
	musicPart MusicHeaderEnding1
	musicPart MusicHeaderEnding2
	musicPart MusicHeaderEnding3
	musicPart MusicHeaderEnding4
IFNDEF PROTOTYPE_MUSIC_ENDING
	musicPart MusicHeaderEnding5
MusicPartPointers_EndingLoop:
MusicPartPointers_EndingEnd:
	musicPart MusicHeaderEnding6
ELSE
MusicPartPointers_EndingEnd:
	musicPart MusicHeaderEnding5
ENDIF


IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
MusicPartPointers_Underground:
MusicPartPointers_UndergroundLoop:
MusicPartPointers_UndergroundEnd:
	musicPart MusicHeaderUnderground
ELSE
MusicPartPointers_UndergroundBeta:
MusicPartPointers_UndergroundBetaLoop:
	musicPart MusicHeaderUndergroundBeta1
	musicPart MusicHeaderUndergroundBeta1
	musicPart MusicHeaderUndergroundBeta2
MusicPartPointers_UndergroundBetaEnd:
	musicPart MusicHeaderUndergroundBeta2
ENDIF
