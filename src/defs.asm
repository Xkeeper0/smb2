.ignorenl

; ---------------------------------------------------------------------------

; enum PlayerStates (width 1 byte)
PlayerState_Normal = $00
PlayerState_Climbing = $01
PlayerState_Lifting = $02
PlayerState_ClimbingAreaTransition = $03
PlayerState_GoingDownJar = $04
PlayerState_ExitingJar = $05
PlayerState_HawkmouthEating = $06
PlayerState_Dying = $07
PlayerState_ChangingSize = $08

; ---------------------------------------------------------------------------

; enum Characters
Character_Mario = $00
Character_Princess = $01
Character_Toad = $02
Character_Luigi = $03

; ---------------------------------------------------------------------------

; enum Music1
Music1_Overworld = $01
Music1_CharacterSelect = $02
Music1_Inside = $04
Music1_Boss = $08
Music1_Invincible = $10
Music1_Subspace = $20
Music1_Wart = $40
Music1_Title = $80

; ---------------------------------------------------------------------------

; enum ControllerInput (bitfield) (width 1 byte)
ControllerInput_Right = $01
ControllerInput_Left = $02
ControllerInput_Down = $04
ControllerInput_Up = $08
ControllerInput_Start = $10
ControllerInput_Select = $20
ControllerInput_B = $40
ControllerInput_A = $80

; ---------------------------------------------------------------------------

; enum DPCM (width 1 byte)
DPCM_DoorOpenBombBom = $01
DPCM_DrumSample_A = $02
DPCM_PlayerHurt = $04
DPCM_ItemPull = $08
DPCM_BossDeath = $10
DPCM_DrumSample_B = $20
DPCM_BossHurt = $40
DPCM_PlayerDeath = $80

; ---------------------------------------------------------------------------

; enum SoundEffect1 (width 1 byte)
SoundEffect1_BirdoShot = $01
SoundEffect1_PotionDoorBong = $02
SoundEffect1_CherryGet = $04
SoundEffect1_ThrowItem = $08
SoundEffect1_1UP = $10
SoundEffect1_EnemyHit = $20
SoundEffect1_StopwatchTick = $40
SoundEffect1_HawkOpen_WartBarf = $80

; ---------------------------------------------------------------------------

; enum PRGBank (width 1 byte)
PRGBank_0_1 = $00
PRGBank_2_3 = $01
PRGBank_4_5 = $02
PRGBank_6_7 = $03
PRGBank_8_9 = $04
PRGBank_A_B = $05
PRGBank_C_D = $06

; ---------------------------------------------------------------------------

; enum ScreenUpdateBuffer
ScreenUpdateBuffer_RAM_301 = $00
ScreenUpdateBuffer_RAM_583 = $01
ScreenUpdateBuffer_RAM_55F = $02
ScreenUpdateBuffer_CharacterSelect = $03
ScreenUpdateBuffer_BANKE_DE7A = $04
ScreenUpdateBuffer_Text_Game_Over = $05
ScreenUpdateBuffer_RAM_67B = $06
ScreenUpdateBuffer_Text_Retry = $07
ScreenUpdateBuffer_RAM_7168 = $08
ScreenUpdateBuffer_RAM_67B_again = $09
ScreenUpdateBuffer_RAM_693 = $0A
ScreenUpdateBuffer_RAM_6ab = $0B
ScreenUpdateBuffer_RAM_6bd = $0C
ScreenUpdateBuffer_RAM_6cc = $0D
ScreenUpdateBuffer_RAM_6e9 = $0E
ScreenUpdateBuffer_RAM_6da = $0F
ScreenUpdateBuffer_RAM_6df = $10
ScreenUpdateBuffer_RAM_6e4 = $11
ScreenUpdateBuffer_RAM_7194 = $12
ScreenUpdateBuffer_RAM_71a8 = $13
ScreenUpdateBuffer_RAM_721b = $14
ScreenUpdateBuffer_BANKE_DFAF = $15
ScreenUpdateBuffer_BANKE_DFA7 = $16
ScreenUpdateBuffer_RAM_BonusChanceLayout = $17

; ---------------------------------------------------------------------------

; enum EndingUpdateBuffer (width 1 byte)
EndingUpdateBuffer_RAM_301 = $00
EndingUpdateBuffer_JarRoom = $01
EndingUpdateBuffer_CeilingTextAndPodium = $02
EndingUpdateBuffer_FloorAndSubconParade = $03
EndingUpdateBuffer_PaletteFade1 = $04
EndingUpdateBuffer_PaletteFade2 = $05
EndingUpdateBuffer_PaletteFade3 = $06
EndingUpdateBuffer_SubconStandStill = $07
EndingUpdateBuffer_Unused_THE_END = $08
EndingUpdateBuffer_Text_MARIO = $09
EndingUpdateBuffer_Text_PRINCESS = $0A
EndingUpdateBuffer_Text_TOAD = $0B
EndingUpdateBuffer_Text_LUIGI = $0C

; ---------------------------------------------------------------------------

; enum SoundEffect2 (width 1 byte)
SoundEffect2_Jump = $01
SoundEffect2_Climbing = $02
SoundEffect2_CoinGet = $04
SoundEffect2_Shrinking = $08
SoundEffect2_IntroFallSlide = $10
SoundEffect2_Growing = $20

; ---------------------------------------------------------------------------

; enum PPUStatus (bitfield) (width 1 byte)
PPUStatus_SpriteOverflow = %100000
PPUStatus_Sprite0Hit = %1000000
PPUStatus_VBlankHit = %10000000

; ---------------------------------------------------------------------------

; enum SoundEffect3
SoundEffect3_ShortNoise = $01 ; Whale spout
SoundEffect3_Rumble_A = $02 ; Rocket
SoundEffect3_Rumble_B = $04 ; POW rumble

; ---------------------------------------------------------------------------

; enum Music2
Music2_MushroomGetJingle = $01
Music2_BossClearFanfare = $02
Music2_EndingAndCast = $04
Music2_DeathJingle = $08
Music2_GameOver = $10
Music2_CrystalGetFanfare = $20
Music2_SlotWarpFanfare = $40
Music2_StopMusic = $80

; ---------------------------------------------------------------------------

; enum SlotMachineSymbols (width 1 byte)
Slot_Cherry = $00
Slot_Star = $08
Slot_Turnip = $10
Slot_Snifit = $18

; ---------------------------------------------------------------------------

; enum SpriteAnimations
SpriteAnimation_Walking = $00
SpriteAnimation_WalkingCarrying = $01
SpriteAnimation_Standing = $02
SpriteAnimation_StandingCarrying = $03
SpriteAnimation_Ducking = $04
SpriteAnimation_5 = $05
SpriteAnimation_Jumping = $06
SpriteAnimation_Dead = $07
SpriteAnimation_Pulling = $08
SpriteAnimation_Throwing = $09
SpriteAnimation_Climbing = $0A

; ---------------------------------------------------------------------------

; enum PlayerHealthValues
PlayerHealth_1_HP = $0F
PlayerHealth_2_HP = $1F
PlayerHealth_3_HP = $2F
PlayerHealth_4_HP = $3F

; ---------------------------------------------------------------------------

; enum PPUMaskBitmask (bitfield) (width 1 byte)
PPUMask_Grayscale = %00000001
PPUMask_ShowLeft8Pixels_BG = %00000010
PPUMask_ShowLeft8Pixels_SPR = %00000100
PPUMask_ShowBackground = %00001000
PPUMask_ShowSprites = %00010000
PPUMask_RedEmphasis = %00100000
PPUMask_GreenEmphasis = %01000000
PPUMask_BlueEmphasis = %10000000

; ---------------------------------------------------------------------------

; enum PPUTileDataLength (bitfield) (width 1 byte)
PPUData_Length = $00
PPUTileData_RepeatOneTile = $40
PPUData_Horizontal = $00
PPUData_Vertical = $80

; ---------------------------------------------------------------------------

; enum GameModes
GameMode_InGame = $00
GameMode_TitleCard = $01
GameMode_GameOver = $02
GameMode_BonusChance = $03
GameMode_Warp = $04

; ---------------------------------------------------------------------------

; enum PPUControl (bitfield) (width 1 byte)
PPUCtrl_BaseAddress = $03
PPUCtrl_Base2000 = $00
PPUCtrl_Base2400 = $01
PPUCtrl_Base2800 = $02
PPUCtrl_Base2C00 = $03
PPUCtrl_WriteHorizontal = $00
PPUCtrl_WriteVertical = $04
PPUCtrl_Sprite0000 = $00
PPUCtrl_Sprite1000 = $08
PPUCtrl_Background0000 = $00
PPUCtrl_Background1000 = $10
PPUCtrl_SpriteSize8x8 = $00
PPUCtrl_SpriteSize8x16 = $20
PPUCtrl_NMIDisabled = $00
PPUCtrl_NMIEnabled = $80

; ---------------------------------------------------------------------------

; enum EnemyStates
EnemyState_Inactive = $00
EnemyState_Alive = $01
EnemyState_Dead = $02
EnemyState_BlockFizzle = $03
EnemyState_BombExploding = $04
EnemyState_PuffOfSmoke = $05
EnemyState_Sand = $06
EnemyState_7 = $07
EnemyState_27 = $27

; ---------------------------------------------------------------------------

; enum ObjectAttribute (bitfield)
ObjAttrib_Palette = $03
ObjAttrib_Palette0 = $00
ObjAttrib_Palette1 = $01
ObjAttrib_Palette2 = $02
ObjAttrib_Palette3 = $03
ObjAttrib_Horizontal = $04 ; use with ObjAttrib_16x32 for 32x16
ObjAttrib_FrontFacing = $08 ; no direction-based mirroring
ObjAttrib_Mirrored = $10
ObjAttrib_BehindBackground = $20
ObjAttrib_16x32 = $40
ObjAttrib_UpsideDown = $80 ; appears behind background when pulling

; ---------------------------------------------------------------------------

; enum EnemyIds
Enemy_Heart = $00
Enemy_ShyguyRed = $01
Enemy_Tweeter = $02
Enemy_ShyguyPink = $03
Enemy_Porcupo = $04
Enemy_SnifitRed = $05
Enemy_SnifitGray = $06
Enemy_SnifitPink = $07
Enemy_Ostro = $08
Enemy_BobOmb = $09
Enemy_AlbatossCarryingBobOmb = $0A
Enemy_AlbatossStartRight = $0B
Enemy_AlbatossStartLeft = $0C
Enemy_NinjiRunning = $0D
Enemy_NinjiJumping = $0E
Enemy_BeezoDiving = $0F
Enemy_BeezoStraight = $10
Enemy_WartBubble = $11
Enemy_Pidgit = $12
Enemy_Trouter = $13
Enemy_Hoopstar = $14
Enemy_JarGeneratorShyguy = $15
Enemy_JarGeneratorBobOmb = $16
Enemy_Phanto = $17
Enemy_CobratJar = $18
Enemy_CobratSand = $19
Enemy_Pokey = $1A
Enemy_Bullet = $1B
Enemy_Birdo = $1C
Enemy_Mouser = $1D
Enemy_Egg = $1E
Enemy_Tryclyde = $1F
Enemy_Fireball = $20
Enemy_Clawgrip = $21
Enemy_ClawgripRock = $22
Enemy_PanserStationaryFiresAngled = $23
Enemy_PanserWalking = $24
Enemy_PanserStationaryFiresUp = $25
Enemy_Autobomb = $26
Enemy_AutobombFire = $27
Enemy_WhaleSpout = $28
Enemy_Flurry = $29
Enemy_Fryguy = $2A
Enemy_FryguySplit = $2B
Enemy_Wart = $2C
Enemy_HawkmouthBoss = $2D
Enemy_Spark1 = $2E
Enemy_Spark2 = $2F
Enemy_Spark3 = $30
Enemy_Spark4 = $31
Enemy_VegetableSmall = $32
Enemy_VegetableLarge = $33
Enemy_VegetableWart = $34
Enemy_Shell = $35
Enemy_Coin = $36
Enemy_Bomb = $37
Enemy_Rocket = $38
Enemy_MushroomBlock = $39
Enemy_POWBlock = $3A
Enemy_FallingLogs = $3B
Enemy_SubspaceDoor = $3C
Enemy_Key = $3D
Enemy_SubspacePotion = $3E
Enemy_Mushroom = $3F
Enemy_Mushroom1up = $40
Enemy_FlyingCarpet = $41
Enemy_HawkmouthRight = $42
Enemy_HawkmouthLeft = $43
Enemy_CrystalBall = $44
Enemy_Starman = $45
Enemy_Stopwatch = $46
Enemy_AttackAlbatossCarryingBobOmb = $47
Enemy_AttackBeezo = $48
Enemy_StopAttack = $49
Enemy_VegetableThrower = $4A ; Used in Wart's room
Enemy_4B = $4B ; crash
Enemy_4C = $4C ; weird! makes game think you can always jump and pick up an enemy
Enemy_4D = $4D ; crash
Enemy_4E = $4E ; hangs, forces background scroll?
Enemy_4F = $4F ; hangs, forces background scroll?
Enemy_50 = $50 ; crash, b+w palette?
Enemy_51 = $51 ; crash
Enemy_52 = $52 ; hangs, forces background scroll?
Enemy_53 = $53 ; hangs, forces background scroll?
Enemy_54 = $54 ; weird invisible thing that doesn't quite crash
Enemy_55 = $55 ; seems to mess up player physics
Enemy_56 = $56 ; crash
Enemy_57 = $57 ; seems to mess up player physics
Enemy_58 = $58 ; seems to mess up player physics
Enemy_59 = $59 ; crash
Enemy_5A = $5A ; crash
Enemy_5B = $5B ; hangs, forces background scroll?
Enemy_BossBirdo = $5C
Enemy_BossMouser = $5D
Enemy_BossEgg = $5E
Enemy_BossTryclyde = $5F
Enemy_BossFireball = $60
Enemy_BossClawgrip = $61
Enemy_BossClawgripRock = $62
Enemy_BossPanserStationaryFiresAngled = $63
Enemy_BossPanserWalking = $64
Enemy_BossPanserStationaryFiresUp = $65
Enemy_BossAutobomb = $66
Enemy_BossAutobombFire = $67
Enemy_BossWhaleSpout = $68
Enemy_BossFlurry = $69
Enemy_BossFryguy = $6A
Enemy_BossFryguySplit = $6B
Enemy_BossWart = $6C
Enemy_BossHawkmouthBoss = $6D
Enemy_BossSpark1 = $6E
Enemy_BossSpark2 = $6F
Enemy_BossSpark3 = $70
Enemy_BossSpark4 = $71
Enemy_BossVegetableSmall = $72
Enemy_BossVegetableLarge = $73
Enemy_BossVegetableWart = $74
Enemy_BossShell = $75
Enemy_BossCoin = $76
Enemy_BossBomb = $77
Enemy_BossRocket = $78
Enemy_BossMushroomBlock = $79
Enemy_BossPOWBlock = $7A
Enemy_BossFallingLogs = $7B
Enemy_BossSubspaceDoor = $7C
Enemy_BossKey = $7D
Enemy_BossSubspacePotion = $7E
Enemy_BossMushroom = $7F

; ---------------------------------------------------------------------------

; enum CollisionFlags (bitfield) (width 1 byte)
CollisionFlags_Right = %00000001
CollisionFlags_Left = %00000010
CollisionFlags_Down = %00000100
CollisionFlags_Up = %00001000
CollisionFlags_10 = %00010000
CollisionFlags_PlayerOnTop = %00100000
CollisionFlags_PlayerInsideMaybe = %01000000
CollisionFlags_80 = %10000000

;
; +-------------------------------------------------------------------------+
; |   This file has been generated by The Interactive Disassembler (IDA)    |
; |           Copyright (c) 2014 Hex-Rays, <support@hex-rays.com>           |
; |                      License info: 48-327F-7274-B7                      |
; |                            ESET spol. s r.o.                            |
; +-------------------------------------------------------------------------+
;
; Input MD5   : 71576D8339BD63198FCFC51A92016D58
; Input CRC32 : 7D3F6F3D

; File Name   : D:\Emulation\ROMs\NES\Super Mario Bros. 2 (USA).nes
; Format      : Famicom/NES emulator iNES ROM file
; Mapper      : 4
; 16k Banks   : 8
; NMI vector  : $EB8E
; RESET vector: $FF50
; IRQ vector  : $FFF0

; ; Processor:       M6502
; ; Target assembler: SVENSON ELECTRONICS 6502/65C02 ASSEMBLER - V.1.0 - MAY, 1988

; ===========================================================================


.endinl
