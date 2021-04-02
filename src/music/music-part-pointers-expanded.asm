MusicPointerOffset:
MusicHeaderPointersLo:
Music_CharacterSelect:
	.db <MusicHeaderCharacterSelect1
	.db <MusicHeaderCharacterSelect2
	.db <MusicHeaderCharacterSelect3
	.db <MusicHeaderCharacterSelect4
	.db <MusicHeaderCharacterSelect5
	.db <MusicHeaderCharacterSelect6
	.db <MusicHeaderCharacterSelect7
	.db <MusicHeaderCharacterSelect8
Music_Overworld:
	.db <MusicHeaderOverworld1
	.db <MusicHeaderOverworld2
	.db <MusicHeaderOverworld3
	.db <MusicHeaderOverworld4
	.db <MusicHeaderOverworld5
	.db <MusicHeaderOverworld6
IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
Music_Underground:
	.db <MusicHeaderUnderground
ELSE
Music_UndergroundBeta:
	.db <MusicHeaderUndergroundBeta1
	.db <MusicHeaderUndergroundBeta2
ENDIF
Music_Boss:
	.db <MusicHeaderBoss
IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
Music_Star:
	.db <MusicHeaderStar
ELSE
Music_StarBeta:
	.db <MusicHeaderStarBeta
ENDIF
Music_Wart:
	.db <MusicHeaderWart
Music_Crystal:
	.db <MusicHeaderCrystal
Music_GameOver:
	.db <MusicHeaderGameOver
Music_BossBeaten:
	.db <MusicHeaderBossBeaten
Music_MushroomBonusChance:
	.db <MusicHeaderMushroomBonusChance
Music_Death:
	.db <MusicHeaderDeath
Music_TitleScreen:
	.db <MusicHeaderTitleScreen1
	.db <MusicHeaderTitleScreen2
	.db <MusicHeaderTitleScreen3
	.db <MusicHeaderTitleScreen4
Music_Subspace:
	.db <MusicHeaderSubspace1
	.db <MusicHeaderSubspace2
	.db <MusicHeaderSubspace3
	.db <MusicHeaderSubspace4
Music_Ending:
	.db <MusicHeaderEnding1
	.db <MusicHeaderEnding2
	.db <MusicHeaderEnding3
	.db <MusicHeaderEnding4
	.db <MusicHeaderEnding5
	.db <MusicHeaderEnding6

.pad MusicPointerOffset + $100, $FF

MusicHeaderPointersHi:
	.db >MusicHeaderCharacterSelect1
	.db >MusicHeaderCharacterSelect2
	.db >MusicHeaderCharacterSelect3
	.db >MusicHeaderCharacterSelect4
	.db >MusicHeaderCharacterSelect5
	.db >MusicHeaderCharacterSelect6
	.db >MusicHeaderCharacterSelect7
	.db >MusicHeaderCharacterSelect8
	.db >MusicHeaderOverworld1
	.db >MusicHeaderOverworld2
	.db >MusicHeaderOverworld3
	.db >MusicHeaderOverworld4
	.db >MusicHeaderOverworld5
	.db >MusicHeaderOverworld6
IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
	.db >MusicHeaderUnderground
ELSE
	.db >MusicHeaderUndergroundBeta1
	.db >MusicHeaderUndergroundBeta2
ENDIF
	.db >MusicHeaderBoss
IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
	.db >MusicHeaderStar
ELSE
	.db >MusicHeaderStarBeta
ENDIF
	.db >MusicHeaderWart
	.db >MusicHeaderCrystal
	.db >MusicHeaderGameOver
	.db >MusicHeaderBossBeaten
	.db >MusicHeaderMushroomBonusChance
	.db >MusicHeaderDeath
	.db >MusicHeaderTitleScreen1
	.db >MusicHeaderTitleScreen2
	.db >MusicHeaderTitleScreen3
	.db >MusicHeaderTitleScreen4
	.db >MusicHeaderSubspace1
	.db >MusicHeaderSubspace2
	.db >MusicHeaderSubspace3
	.db >MusicHeaderSubspace4
	.db >MusicHeaderEnding1
	.db >MusicHeaderEnding3
	.db >MusicHeaderEnding2
	.db >MusicHeaderEnding5
	.db >MusicHeaderEnding4
	.db >MusicHeaderEnding6

.pad MusicPointerOffset + $200, $FF


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
  musicPointerOffset Music_MushroomBonusChance, 0

MusicPartPointers_BossBeaten:
  musicPointerOffset Music_BossBeaten, 0

; This version of the crystal fanfare is unused, because special logic in
; ProcessMusicQueue uses this slot for the ending theme instead.
MusicPartPointers_CrystalUnused:
  musicPointerOffset Music_Crystal, 0

MusicPartPointers_Death:
  musicPointerOffset Music_Death, 0

MusicPartPointers_GameOver:
	musicPointerOffset Music_GameOver, 0

MusicPartPointers_Crystal:
	musicPointerOffset Music_Crystal, 0

MusicPartPointers_BonusChance:
	musicPointerOffset Music_MushroomBonusChance, 0

; The rest of the pointers correspond to music that uses the pointer tables
; with support for segment-based looping.
MusicPartPointers_CharacterSelect:
	musicPointerOffset Music_CharacterSelect, 0
MusicPartPointers_CharacterSelectLoop:
	musicPointerOffset Music_CharacterSelect, 1
	musicPointerOffset Music_CharacterSelect, 2
	musicPointerOffset Music_CharacterSelect, 1
	musicPointerOffset Music_CharacterSelect, 3
	musicPointerOffset Music_CharacterSelect, 4
	musicPointerOffset Music_CharacterSelect, 5
	musicPointerOffset Music_CharacterSelect, 6
MusicPartPointers_CharacterSelectEnd:
	musicPointerOffset Music_CharacterSelect, 7


MusicPartPointers_Overworld:
	musicPointerOffset Music_Overworld, 0
MusicPartPointers_OverworldLoop:
	musicPointerOffset Music_Overworld, 1
	musicPointerOffset Music_Overworld, 2
	musicPointerOffset Music_Overworld, 3
	musicPointerOffset Music_Overworld, 2
	musicPointerOffset Music_Overworld, 4
MusicPartPointers_OverworldEnd:
	musicPointerOffset Music_Overworld, 5


MusicPartPointers_Boss:
MusicPartPointers_BossLoop:
MusicPartPointers_BossEnd:
	musicPointerOffset Music_Boss, 0


IFNDEF PROTOTYPE_MUSIC_STARMAN
MusicPartPointers_Star:
MusicPartPointers_StarLoop:
MusicPartPointers_StarEnd:
	musicPointerOffset Music_Star, 0
ELSE
MusicPartPointers_StarBeta:
MusicPartPointers_StarBetaLoop:
MusicPartPointers_StarBetaEnd:
	musicPointerOffset Music_StarBeta, 0
ENDIF


MusicPartPointers_Wart:
MusicPartPointers_WartLoop:
MusicPartPointers_WartEnd:
	musicPointerOffset Music_Wart, 0


MusicPartPointers_TitleScreen:
	musicPointerOffset Music_TitleScreen, 0
	musicPointerOffset Music_TitleScreen, 1
	musicPointerOffset Music_TitleScreen, 2
MusicPartPointers_TitleScreenEnd:
	musicPointerOffset Music_TitleScreen, 3


MusicPartPointers_SubSpace:
MusicPartPointers_SubSpaceLoop:
	musicPointerOffset Music_Subspace, 0
	musicPointerOffset Music_Subspace, 1
	musicPointerOffset Music_Subspace, 2
	musicPointerOffset Music_Subspace, 1
MusicPartPointers_SubSpaceEnd:
	musicPointerOffset Music_Subspace, 3


MusicPartPointers_Ending:
	musicPointerOffset Music_Ending, 0
	musicPointerOffset Music_Ending, 1
	musicPointerOffset Music_Ending, 2
	musicPointerOffset Music_Ending, 3
IFNDEF PROTOTYPE_MUSIC_ENDING
	musicPointerOffset Music_Ending, 4
MusicPartPointers_EndingLoop:
MusicPartPointers_EndingEnd:
	musicPointerOffset Music_Ending, 5
ELSE
MusicPartPointers_EndingEnd:
	musicPointerOffset Music_Ending, 4
ENDIF


IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
MusicPartPointers_Underground:
MusicPartPointers_UndergroundLoop:
MusicPartPointers_UndergroundEnd:
	musicPointerOffset Music_Underground, 0
ELSE
MusicPartPointers_UndergroundBeta:
MusicPartPointers_UndergroundBetaLoop:
	musicPointerOffset Music_UndergroundBeta, 0
	musicPointerOffset Music_UndergroundBeta, 0
	musicPointerOffset Music_UndergroundBeta, 1
MusicPartPointers_UndergroundBetaEnd:
	musicPointerOffset Music_UndergroundBeta, 1
ENDIF

.pad MusicPartPointers + $100, $FF
