.ignorenl

; ---------------------------------------------------------------------------

; enum PlayerStates (width 1 byte)
PlayerState_Normal =  0
PlayerState_Climbing = 	1
PlayerState_Lifting =  2
PlayerState_ClimbingAreaTransition =  3
PlayerState_GoingDownJar =  4
PlayerState_ExitingJar =  5
PlayerState_HawkmouthEating =  6
PlayerState_Dying =  7
PlayerState_ChangingSize =  8

; ---------------------------------------------------------------------------

; enum Characters
Character_Mario =  0
Character_Princess =  1
Character_Toad =  2
Character_Luigi =  3

; ---------------------------------------------------------------------------

; enum Music1
Music1_Overworld =  1
Music1_CharacterSelect =  2
Music1_Inside =  4
Music1_Boss =  8
Music1_Invincible =  $10
Music1_Subspace =  $20
Music1_Wart =  $40
Music1_Title = 	$80

; ---------------------------------------------------------------------------

; enum ControllerInput (bitfield) (width 1 byte)
ControllerInput_Right =  1
ControllerInput_Left = 	2
ControllerInput_Down = 	4
ControllerInput_Up =  8
ControllerInput_Start =  $10
ControllerInput_Select =  $20
ControllerInput_B =  $40
ControllerInput_A =  $80

; ---------------------------------------------------------------------------

; enum DPCM (width 1 byte)
DPCM_DoorOpenBombBom = 	1
DPCM_DrumSample_A =  2
DPCM_PlayerHurt =  4
DPCM_ItemPull =  8
DPCM_BossDeath =  $10
DPCM_DrumSample_B =  $20
DPCM_BossHurt =  $40
DPCM_PlayerDeath =  $80

; ---------------------------------------------------------------------------

; enum SoundEffect1 (width 1 byte)
SoundEffect1_BirdoShot =  1
SoundEffect1_PotionDoorBong =  2
SoundEffect1_CherryGet =  4
SoundEffect1_ThrowItem =  8
SoundEffect1_1UP =  $10
SoundEffect1_EnemyHit =  $20
SoundEffect1_StopwatchTick =  $40
SoundEffect1_HawkOpen_WartBarf =  $80

; ---------------------------------------------------------------------------

; enum PRGBank (width 1	byte)
PRGBank_0_1 =  0
PRGBank_2_3 =  1
PRGBank_4_5 =  2
PRGBank_6_7 =  3
PRGBank_8_9 =  4
PRGBank_A_B =  5
PRGBank_C_D =  6

; ---------------------------------------------------------------------------

; enum ScreenUpdateBuffer
ScreenUpdateBuffer_RAM_301 =  0
ScreenUpdateBuffer_RAM_583 =  1
ScreenUpdateBuffer_RAM_55F =  2
ScreenUpdateBuffer_CharacterSelect =  3
ScreenUpdateBuffer_BANKE_DE7A =  4
ScreenUpdateBuffer_Text_Game_Over =  5
ScreenUpdateBuffer_RAM_67B =  6
ScreenUpdateBuffer_Text_Retry =  7
ScreenUpdateBuffer_RAM_7168 =  8
ScreenUpdateBuffer_RAM_67B_again =  9
ScreenUpdateBuffer_RAM_693 =  $A
ScreenUpdateBuffer_RAM_6ab =  $B
ScreenUpdateBuffer_RAM_6bd =  $C
ScreenUpdateBuffer_RAM_6cc =  $D
ScreenUpdateBuffer_RAM_6e9 =  $E
ScreenUpdateBuffer_RAM_6da =  $F
ScreenUpdateBuffer_RAM_6df =  $10
ScreenUpdateBuffer_RAM_6e4 =  $11
ScreenUpdateBuffer_RAM_7194 =  $12
ScreenUpdateBuffer_RAM_71a8 =  $13
ScreenUpdateBuffer_RAM_721b =  $14
ScreenUpdateBuffer_BANKE_DFAF =  $15
ScreenUpdateBuffer_BANKE_DFA7 =  $16
ScreenUpdateBuffer_RAM_BonusChanceLayout =  $17

; ---------------------------------------------------------------------------

; enum EndingUpdateBuffer (width 1 byte)
EndingUpdateBuffer_RAM_301 =  0
EndingUpdateBuffer_JarRoom =  1
EndingUpdateBuffer_CeilingTextAndPodium =  2
EndingUpdateBuffer_FloorAndSubconParade =  3
EndingUpdateBuffer_PaletteFade1 =  4
EndingUpdateBuffer_PaletteFade2 =  5
EndingUpdateBuffer_PaletteFade3 =  6
EndingUpdateBuffer_SubconStandStill =  7
EndingUpdateBuffer_Unused_THE_END =  8
EndingUpdateBuffer_Text_MARIO =  9
EndingUpdateBuffer_Text_PRINCESS =  $A
EndingUpdateBuffer_Text_TOAD = 	$B
EndingUpdateBuffer_Text_LUIGI =  $C

; ---------------------------------------------------------------------------

; enum SoundEffect2 (width 1 byte)
SoundEffect2_Jump =  1
SoundEffect2_Climbing =  2
SoundEffect2_CoinGet = 	4
SoundEffect2_Shrinking =  8
SoundEffect2_IntroFallSlide =  $10
SoundEffect2_Growing = 	$20

; ---------------------------------------------------------------------------

; enum PPUStatus (bitfield) (width 1 byte)
PPUStatus_SpriteOverflow =  %100000
PPUStatus_Sprite0Hit = 	%1000000
PPUStatus_VBlankHit =  %10000000

; ---------------------------------------------------------------------------

; enum SoundEffect3
SoundEffect3_ShortNoise =  1
SoundEffect3_Rumble_A =  2
SoundEffect3_Rumble_B =  4

; ---------------------------------------------------------------------------

; enum Music2
Music2_MushroomGetJingle =  1
Music2_BossClearFanfare =  2
Music2_EndingAndCast = 	4
Music2_DeathJingle =  8
Music2_GameOver =  $10
Music2_CrystalGetFanfare =  $20
Music2_SlotWarpFanfare =  $40
Music2_StopMusic =  $80

; ---------------------------------------------------------------------------

; enum SlotMachineSymbols (width 1 byte)
Slot_Cherry =  0
Slot_Star =  8
Slot_Turnip =  $10
Slot_Snifit =  $18

; ---------------------------------------------------------------------------

; enum SpriteAnimations
SpriteAnimation_Walking =  0
SpriteAnimation_WalkingCarrying =  1
SpriteAnimation_Standing =  2
SpriteAnimation_StandingCarrying =  3
SpriteAnimation_Ducking =  4
SpriteAnimation_5 =  5
SpriteAnimation_Jumping =  6
SpriteAnimation_Dead = 	7
SpriteAnimation_Pulling =  8
SpriteAnimation_Throwing =  9
SpriteAnimation_Climbing =  $A

; ---------------------------------------------------------------------------

; enum PlayerHealthValues
PlayerHealth_1_HP =  $F
PlayerHealth_2_HP =  $1F
PlayerHealth_3_HP =  $2F
PlayerHealth_4_HP =  $3F

; ---------------------------------------------------------------------------

; enum PPUMaskBitmask (bitfield) (width	1 byte)
PPUMask_Grayscale =  1
PPUMask_ShowLeft8Pixels_BG =  %10
PPUMask_ShowLeft8Pixels_SPR =  %100
PPUMask_ShowBackground =  %1000
PPUMask_ShowSprites =  %10000
PPUMask_RedEmphasis =  %100000
PPUMask_GreenEmphasis =  %1000000
PPUMask_BlueEmphasis = 	%10000000

; ---------------------------------------------------------------------------

; enum PPUTileDataLength (bitfield) (width 1 byte)
PPUData_Length =  0
PPUTileData_RepeatOneTile =  $40
PPUData_Horizontal =  0
PPUData_Vertical =  $80

; ---------------------------------------------------------------------------

; enum GameModes
GameMode_InGame =  0
GameMode_TitleCard =  1
GameMode_GameOver =  2
GameMode_BonusChance = 	3
GameMode_Warp =  4

; ---------------------------------------------------------------------------

; enum PPUControl (bitfield) (width 1 byte)
PPUCtrl_BaseAddress		 = 3
PPUCtrl_Base2000 =  0
PPUCtrl_Base2400 =  1
PPUCtrl_Base2800 =  2
PPUCtrl_Base2C00 =  3
PPUCtrl_WriteHorizontal =  0
PPUCtrl_WriteVertical =  4
PPUCtrl_Sprite0000 =  0
PPUCtrl_Sprite1000 =  8
PPUCtrl_Background0000 =  0
PPUCtrl_Background1000 =  $10
PPUCtrl_SpriteSize8x8 =  0
PPUCtrl_SpriteSize8x16 =  $20
PPUCtrl_NMIDisabled =  0
PPUCtrl_NMIEnabled =  $80

; ---------------------------------------------------------------------------

; enum EnemyStates
EnemyState_0 = 	0
EnemyState_Alive =  1
EnemyState_Dead =  2
EnemyState_BlockFizzle =  3
EnemyState_BombExploding =  4
EnemyState_PuffOfSmoke =  5

; ---------------------------------------------------------------------------

; enum ObjectAttribute (bitfield)
ObjAttrib_Palette	     = 3
ObjAttrib_Palette0 =  0
ObjAttrib_Palette1 =  1
ObjAttrib_Palette2 =  2
ObjAttrib_Palette3 =  3
ObjAttrib_Unknown_04 = 	4
ObjAttrib_Unknown_08 = 	8
ObjAttrib_Mirrored =  $10
ObjAttrib_Unknown_20 = 	$20
ObjAttrib_16x32 =  $40
ObjAttrib_UpsideDown = 	$80

; ---------------------------------------------------------------------------

; enum EnemyIds
Enemy_Heart =  0
Enemy_ShyguyRed =  1
Enemy_Tweeter =  2
Enemy_ShyguyPink =  3
Enemy_Porcupo =  4
Enemy_SnifitRed =  5
Enemy_SnifitGray =  6
Enemy_SnifitPink =  7
Enemy_Ostro =  8
Enemy_BobOmb = 	9
Enemy_AlbatossCarryingBobOmb = 	$A
Enemy_AlbatossStartRight =  $B
Enemy_AlbatossStartLeft =  $C
Enemy_NinjiRunning =  $D
Enemy_NinjiJumping =  $E
Enemy_BeezoDiving =  $F
Enemy_BeezoStraight =  $10
Enemy_WartBubble =  $11
Enemy_Pidgit = 	$12
Enemy_Trouter =  $13
Enemy_Hoopstar =  $14
Enemy_JarGeneratorShyguy =  $15
Enemy_JarGeneratorBobOmb =  $16
Enemy_Phanto = 	$17
Enemy_CobratJar =  $18
Enemy_CobratSand =  $19
Enemy_Pokey =  $1A
Enemy_Bullet = 	$1B
Enemy_Birdo =  $1C
Enemy_Mouser = 	$1D
Enemy_Egg =  $1E
Enemy_Tryclyde =  $1F
Enemy_Fireball =  $20
Enemy_Clawgrip =  $21
Enemy_ClawgripRock =  $22
Enemy_PanserStationaryFiresAngled =  $23
Enemy_PanserWalking =  $24
Enemy_PanserStationaryFiresUp =  $25
Enemy_Autobomb =  $26
Enemy_AutobombFire =  $27
Enemy_WhaleSpout =  $28
Enemy_Flurry = 	$29
Enemy_Fryguy = 	$2A
Enemy_FryguySplit =  $2B
Enemy_Wart =  $2C
Enemy_HawkmouthBoss =  $2D
Enemy_Spark1 = 	$2E
Enemy_Spark2 = 	$2F
Enemy_Spark3 = 	$30
Enemy_Spark4 = 	$31
Enemy_VegetableSmall = 	$32
Enemy_VegetableLarge = 	$33
Enemy_VegetableWart =  $34
Enemy_Shell =  $35
Enemy_Coin =  $36
Enemy_Bomb =  $37
Enemy_Rocket = 	$38
Enemy_MushroomBlock =  $39
Enemy_POWBlock =  $3A
Enemy_FallingLogs =  $3B
Enemy_SubspaceDoor =  $3C
Enemy_Key =  $3D
Enemy_SubspacePotion = 	$3E
Enemy_Mushroom =  $3F
Enemy_Mushroom1up =  $40
Enemy_FlyingCarpet =  $41
Enemy_HawkmouthRight = 	$42
Enemy_HawkmouthLeft =  $43
Enemy_CrystalBall =  $44
Enemy_Starman =  $45
Enemy_Stopwatch =  $46

; ---------------------------------------------------------------------------

; enum CollisionFlags (bitfield) (width	1 byte)
CollisionFlags_Right = 	1
CollisionFlags_Left =  %10
CollisionFlags_Down =  %100
CollisionFlags_Up =  %1000
CollisionFlags_10 =  %10000
CollisionFlags_PlayerOnTop =  %100000
CollisionFlags_PlayerInsideMaybe =  %1000000
CollisionFlags_80 =  %10000000

;
; +-------------------------------------------------------------------------+
; |   This file	has been generated by The Interactive Disassembler (IDA)    |
; |	      Copyright	(c) 2014 Hex-Rays, <support@hex-rays.com>	    |
; |			 License info: 48-327F-7274-B7			    |
; |			       ESET spol. s r.o.			    |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	71576D8339BD63198FCFC51A92016D58
; Input	CRC32 :	7D3F6F3D

; File Name   :	D:\Emulation\ROMs\NES\Super Mario Bros. 2 (USA).nes
; Format      :	Famicom/NES emulator iNES ROM file
; Mapper      :	4
; 16k Banks   :	8
; NMI vector  :	$EB8E
; RESET	vector:	$FF50
; IRQ vector  :	$FFF0

; ; Processor:	      M6502
; ; Target assembler: SVENSON ELECTRONICS 6502/65C02 ASSEMBLER - V.1.0 - MAY, 1988

; ===========================================================================


.endinl