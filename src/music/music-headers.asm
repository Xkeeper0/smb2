;
; Music Headers
; =============
;
; These are broken down by song segment and point to the note length table and
; and individual channel data. Square 2 is the main pointer, and triangle,
; square 1, and noise are stored as offets relative to the main pointer.
;
; Bytes:
;   00: Note length table (from $8F00)
;   01: Main address / Square 2 (lo)
;   02: Main address / Square 2 (hi)
;   03: Triangle offset from main
;   04: Square 1 offset from main
;   05: Noise/DPCM offset from main
;
; For the musicHeader macro, specifying $00 is "none", -1 for noise/pcm is "omit".
; Some of the music headers use the $00 from the next header's note length table,
; to save one byte (in a ROM /full/ of unused space...)
;
MusicPartHeaders:

; ----------------------------------------
; Character select segments 1 through 5
; (6 through 8 are a ways below this)
MusicHeaderCharacterSelect1:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect1, MusicDataCharacterSelect1_Triangle, MusicDataCharacterSelect1_Square1, MusicDataCharacterSelect1_Noise

MusicHeaderCharacterSelect2:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect2, MusicDataCharacterSelect2_Triangle, MusicDataCharacterSelect2_Square1, MusicDataCharacterSelect2_Noise

MusicHeaderCharacterSelect3:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect3, MusicDataCharacterSelect3_Triangle, MusicDataCharacterSelect3_Square1, MusicDataCharacterSelect3_Noise

MusicHeaderCharacterSelect4:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect4, MusicDataCharacterSelect4_Triangle, MusicDataCharacterSelect4_Square1, MusicDataCharacterSelect4_Noise

MusicHeaderCharacterSelect5:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect5, MusicDataCharacterSelect5_Triangle, MusicDataCharacterSelect5_Square1, MusicDataCharacterSelect5_Noise

; ----------------------------------------
; Overworld music headers
MusicHeaderOverworld1:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld1, MusicDataOverworld1_Triangle, MusicDataOverworld1_Square1, MusicDataOverworld1_Noise

MusicHeaderOverworld2:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld2, MusicDataOverworld2_Triangle, MusicDataOverworld2_Square1, MusicDataOverworld2_Noise

MusicHeaderOverworld3:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld3, MusicDataOverworld3_Triangle, MusicDataOverworld3_Square1, MusicDataOverworld3_Noise

MusicHeaderOverworld4:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld4, MusicDataOverworld4_Triangle, MusicDataOverworld4_Square1, MusicDataOverworld4_Noise

MusicHeaderOverworld5:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld5, MusicDataOverworld5_Triangle, MusicDataOverworld5_Square1, MusicDataOverworld5_Noise

MusicHeaderOverworld6:
	musicHeader NoteLengthTable_200bpm, MusicDataOverworld6, MusicDataOverworld6_Triangle, MusicDataOverworld6_Square1, MusicDataOverworld6_Noise

; ----------------------------------------
; Underground music
IFNDEF PROTOTYPE_MUSIC
MusicHeaderUnderground:
	musicHeader NoteLengthTable_129bpm, MusicDataUnderground, MusicDataUnderground_Triangle, MusicDataUnderground_Square1, MusicDataUnderground_DPCM
ENDIF

IFDEF PROTOTYPE_MUSIC
; Much cooler SMB3-esque underground music...
; apparently using /both/ noise and DPCM (!)
MusicHeaderUndergroundBeta1:
	musicHeader NoteLengthTable_200bpm, MusicDataUndergroundBeta1, MusicDataUndergroundBeta1_Triangle, MusicDataUndergroundBeta1_Square1, MusicDataUndergroundBeta1_Noise
	.db MusicDataUndergroundBeta1_DPCM - MusicDataUndergroundBeta1
MusicHeaderUndergroundBeta2:
	musicHeader NoteLengthTable_200bpm, MusicDataUndergroundBeta2, MusicDataUndergroundBeta2_Triangle, MusicDataUndergroundBeta2_Square1, MusicDataUndergroundBeta2_Noise
	.db MusicDataUndergroundBeta2_DPCM - MusicDataUndergroundBeta2
ENDIF

; ----------------------------------------
; Boss and boss area music
MusicHeaderBoss:
	musicHeader NoteLengthTable_200bpm, MusicDataBoss, MusicDataBoss_Triangle, MusicDataBoss_Square1, -1
IFNDEF PROTOTYPE_MUSIC
	.db $00 ; no noise channel
	; @todo ? this should be covered by MusicHeaderStar's first byte, unless
	;       this was some weird space-saver in the original. shrug
ENDIF

; ----------------------------------------
; Starman music
MusicHeaderStar:
IFNDEF PROTOTYPE_MUSIC
	musicHeader NoteLengthTable_300bpm, MusicDataStar, MusicDataStar_Triangle, MusicDataStar_Square1, MusicDataStar_DPCM
ENDIF
IFDEF PROTOTYPE_MUSIC
	musicHeader NoteLengthTable_300bpm, MusicDataStar, MusicDataStar_Triangle, MusicDataStar_Square1, MusicDataStar_Noise
ENDIF

; ----------------------------------------
; Wart's final boss music
MusicHeaderWart:
	musicHeader NoteLengthTable_200bpm, MusicDataWart, MusicDataWart_Triangle, MusicDataWart_Square1, -1
IFNDEF PROTOTYPE_MUSIC
	.db $00 ; no noise channel
	; @todo same note as above chunk
ENDIF

; ----------------------------------------
; Various shorter jingles, extra character select segments (8, 7, 6), and other potpourri

MusicHeaderCrystal:
	musicHeader NoteLengthTable_300bpm, MusicDataCrystal, MusicDataCrystal_Triangle, MusicDataCrystal_Square1, -1

MusicHeaderGameOver:
 	musicHeader NoteLengthTable_300bpm, MusicDataGameOver, MusicDataGameOver_Triangle, MusicDataGameOver_Square1, -1

MusicHeaderBossBeaten:
 	musicHeader NoteLengthTable_300bpm, MusicDataBossBeaten, MusicDataBossBeaten_Triangle, MusicDataBossBeaten_Square1, -1

MusicHeaderCharacterSelect8:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect8, MusicDataCharacterSelect8_Triangle, MusicDataCharacterSelect8_Square1, MusicDataCharacterSelect8_Noise

MusicHeaderMushroomBonusChance:
 	musicHeader NoteLengthTable_150bpm, MusicDataMushroomBonusChance, $00, MusicDataMushroomBonusChance_Square1, -1

MusicHeaderCharacterSelect7:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect7, MusicDataCharacterSelect7_Triangle, MusicDataCharacterSelect7_Square1, MusicDataCharacterSelect7_Noise

MusicHeaderDeath:
 	musicHeader NoteLengthTable_200bpm, MusicDataDeath, MusicDataDeath_Triangle, MusicDataDeath_Square1, -1

MusicHeaderCharacterSelect6:
	musicHeader NoteLengthTable_300bpm, MusicDataCharacterSelect6, MusicDataCharacterSelect6_Triangle, MusicDataCharacterSelect6_Square1, MusicDataCharacterSelect6_Noise

; ----------------------------------------
; Title screen segments

MusicHeaderTitleScreen2:
	musicHeader NoteLengthTable_225bpm, MusicDataTitleScreen2, MusicDataTitleScreen2_Triangle, MusicDataTitleScreen2_Square1, MusicDataTitleScreen2_Noise

MusicHeaderTitleScreen1:
	musicHeader NoteLengthTable_225bpm, MusicDataTitleScreen1, MusicDataTitleScreen1_Triangle, MusicDataTitleScreen1_Square1, MusicDataTitleScreen1_Noise

MusicHeaderTitleScreen3:
	musicHeader NoteLengthTable_225bpm, MusicDataTitleScreen3, MusicDataTitleScreen3_Triangle, MusicDataTitleScreen3_Square1, MusicDataTitleScreen3_Noise

MusicHeaderTitleScreen4:
	musicHeader NoteLengthTable_225bpm, MusicDataTitleScreen4, MusicDataTitleScreen4_Triangle, MusicDataTitleScreen4_Square1, MusicDataTitleScreen4_Noise

; ----------------------------------------
; Subspace music, quite longer than normally heard

MusicHeaderSubspace1:
	musicHeader NoteLengthTable_200bpm, MusicDataSubspace1, MusicDataSubspace1_Triangle, MusicDataSubspace1_Square1, MusicDataSubspace1_Noise

MusicHeaderSubspace2:
	musicHeader NoteLengthTable_200bpm, MusicDataSubspace2, MusicDataSubspace2_Triangle, MusicDataSubspace2_Square1, MusicDataSubspace2_Noise

MusicHeaderSubspace3:
	musicHeader NoteLengthTable_200bpm, MusicDataSubspace3, MusicDataSubspace3_Triangle, MusicDataSubspace3_Square1, MusicDataSubspace3_Noise

MusicHeaderSubspace4:
	musicHeader NoteLengthTable_200bpm, MusicDataSubspace4, MusicDataSubspace4_Triangle, MusicDataSubspace4_Square1, MusicDataSubspace4_Noise

; ----------------------------------------
; Ending music

MusicHeaderEnding1:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding1, MusicDataEnding1_Triangle, MusicDataEnding1_Square1, MusicDataEnding1_Noise

MusicHeaderEnding3:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding3, MusicDataEnding3_Triangle, MusicDataEnding3_Square1, MusicDataEnding3_Noise

MusicHeaderEnding2:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding2, MusicDataEnding2_Triangle, MusicDataEnding2_Square1, MusicDataEnding2_Noise

MusicHeaderEnding5:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding5, MusicDataEnding5_Triangle, MusicDataEnding5_Square1, MusicDataEnding5_Noise

MusicHeaderEnding4:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding4, MusicDataEnding4_Triangle, MusicDataEnding4_Square1, MusicDataEnding4_Noise

IFNDEF PROTOTYPE_MUSIC
MusicHeaderEnding6:
	musicHeader NoteLengthTable_129bpm, MusicDataEnding6, $00, MusicDataEnding6_Square1, $00
ENDIF
