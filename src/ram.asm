;
; NES and cart RAM
; ================
;
; What's inside: some bits, some bytes. @todo: describe more
;
;   - 0000-00FF: Zero page, various things, enemies/player data
;   - 0100-01FF: Stack area
;   - 0200-02FF: Sprite OAM DMA area
;   - 0300-03FF: PPU buffers, etc.
;   - 0400-04FF: Some enemy data, other small game-state stuff
;   - 0500-05FF: PPU buffers, more game state tracking and other crap
;   - 0600-06FF: Music engine, bonus chance, more PPU buffers, etc.
;   - 0700-07FF: Tile layout for subspace/jar areas
;
;   - 2000-2007: PPU registers
;   - 4000-4017: APU and joypad registers
;   - 5000-5015: Used by MMC5 expansion
;   - 6000-7FFF: on-cart RAM; decoded level, level data, enemy data, and more
;
;   - 8000-FFFF: you're in the wrong file, pal. that's rom.
;

byte_RAM_0:
	.dsb 1 ; $0000
byte_RAM_1:
	.dsb 1 ; $0001
byte_RAM_2:
	.dsb 1 ; $0002
byte_RAM_3:
	.dsb 1 ; $0003
byte_RAM_4:
	.dsb 1 ; $0004
byte_RAM_5:
	.dsb 1 ; $0005
byte_RAM_6:
	.dsb 1 ; $0006
byte_RAM_7:
	.dsb 1 ; $0007
byte_RAM_8:
	.dsb 1 ; $0008
byte_RAM_9:
	.dsb 1 ; $0009
byte_RAM_A:
	.dsb 1 ; $000a
byte_RAM_B:
	.dsb 1 ; $000b
byte_RAM_C:
	.dsb 1 ; $000c
byte_RAM_D:
	.dsb 1 ; $000d
byte_RAM_E:
	.dsb 1 ; $000e
byte_RAM_F:
	.dsb 1 ; $000f
; global counter
byte_RAM_10:
	.dsb 1 ; $0010
ScreenUpdateIndex:
	.dsb 1 ; $0011
byte_RAM_12:
	.dsb 1 ; $0012
BreakStartLevelLoop:
	.dsb 1 ; $0013

PlayerXHi:
	.dsb 1 ; $0014
ObjectXHi:
	.dsb 1 ; $0015
	.dsb 1 ; 1                ; $0016
	.dsb 1 ; 2                ; $0017
	.dsb 1 ; 3                ; $0018
	.dsb 1 ; 4                ; $0019
	.dsb 1 ; 5                ; $001a
	.dsb 1 ; 6                ; $001b
	.dsb 1 ; 7                ; $001c
	.dsb 1 ; 8                ; $001d

PlayerYHi:
	.dsb 1 ; $001e
ObjectYHi:
	.dsb 1 ; $001f
	.dsb 1 ; 1                ; $0020
	.dsb 1 ; 2                ; $0021
	.dsb 1 ; 3                ; $0022
	.dsb 1 ; 4                ; $0023
	.dsb 1 ; 5                ; $0024
	.dsb 1 ; 6                ; $0025
	.dsb 1 ; 7                ; $0026
	.dsb 1 ; 8                ; $0027

PlayerXLo:
	.dsb 1 ; $0028
ObjectXLo:
	.dsb 1 ; $0029
	.dsb 1 ; 1                ; $002a
	.dsb 1 ; 2                ; $002b
	.dsb 1 ; 3                ; $002c
	.dsb 1 ; 4                ; $002d
	.dsb 1 ; 5                ; $002e
	.dsb 1 ; 6                ; $002f
	.dsb 1 ; 7                ; $0030
	.dsb 1 ; 8                ; $0031

PlayerYLo:
	.dsb 1 ; $0032
ObjectYLo:
	.dsb 1 ; $0033
	.dsb 1 ; 1                ; $0034
	.dsb 1 ; 2                ; $0035
	.dsb 1 ; 3                ; $0036
	.dsb 1 ; 4                ; $0037
	.dsb 1 ; 5                ; $0038
	.dsb 1 ; 6                ; $0039
	.dsb 1 ; 7                ; $003a
	.dsb 1 ; 8                ; $003b

PlayerXVelocity:
	.dsb 1 ; $003c
ObjectXVelocity:
	.dsb 1 ; $003d
	.dsb 1 ; 1                ; $003e
	.dsb 1 ; 2                ; $003f
	.dsb 1 ; 3                ; $0040
	.dsb 1 ; 4                ; $0041
	.dsb 1 ; 5                ; $0042
	.dsb 1 ; 6                ; $0043
	.dsb 1 ; 7                ; $0044
	.dsb 1 ; 8                ; $0045

PlayerYVelocity:
	.dsb 1 ; $0046
ObjectYVelocity:
	.dsb 1 ; $0047
	.dsb 1 ; 1                ; $0048
	.dsb 1 ; 2                ; $0049
	.dsb 1 ; 3                ; $004a
	.dsb 1 ; 4                ; $004b
	.dsb 1 ; 5                ; $004c
	.dsb 1 ; 6                ; $004d
	.dsb 1 ; 7                ; $004e
	.dsb 1 ; 8                ; $004f

;
; Player and Object States
; ========================
;
; Some of these are for players, some of these are for objects/enemies
;
; $00 Normal
; $01 ?
; $02 Lifting up object
; $03 ?
; $04 Going down vase (causes warp if poked)
; $05 Exiting vase
; $06 ?
; $07 Dying (falls off screen)
; $08 Shrinking
; $09+ Crash?
; $27 @TODO object-related?
;
PlayerState:
	.dsb 1 ; $0050
EnemyState:
	.dsb 1 ; $0051
	.dsb 1 ; 1                ; $0052
	.dsb 1 ; 2                ; $0053
	.dsb 1 ; 3                ; $0054
	.dsb 1 ; 4                ; $0055
	.dsb 1 ; 5                ; $0056
	.dsb 1 ; 6                ; $0057
	.dsb 1 ; 7                ; $0058
	.dsb 1 ; 8                ; $0059

PlayerCollision: ; see CollisionFlags enum for bit definitions
	.dsb 1 ; $005a
EnemyCollision:
	.dsb 1 ; $005b
	.dsb 1 ; 1                ; $005c
	.dsb 1 ; 2                ; $005d
	.dsb 1 ; 3                ; $005e
	.dsb 1 ; 4                ; $005f
	.dsb 1 ; 5                ; $0060
	.dsb 1 ; 6                ; $0061
	.dsb 1 ; 7                ; $0062
	.dsb 1 ; 8                ; $0063

PlayerAttributes:
	.dsb 1 ; $0064
ObjectAttributes:
	.dsb 1 ; $0065
	.dsb 1 ; 1                ; $0066
	.dsb 1 ; 2                ; $0067
	.dsb 1 ; 3                ; $0068
	.dsb 1 ; 4                ; $0069
	.dsb 1 ; 5                ; $006a
	.dsb 1 ; 6                ; $006b
	.dsb 1 ; 7                ; $006c
	.dsb 1 ; 8                ; $006d

; $02 if moving left, $01 otherwise?
PlayerMovementDirection:
	.dsb 1 ; $006e
EnemyMovementDirection:
	.dsb 1 ; $006f
	.dsb 1 ; 1                ; $0070
	.dsb 1 ; 2                ; $0071
	.dsb 1 ; 3                ; $0072
	.dsb 1 ; 4                ; $0073
	.dsb 1 ; 5                ; $0074
	.dsb 1 ; 6                ; $0075
	.dsb 1 ; 7                ; $0076
	.dsb 1 ; 8                ; $0077

; FOR RENT
	.dsb 1 ; $0078
; This is set on entering subspace, depending
; on which particular mushroom is on the screen
; (used to determine if it should show up
; and also which mushroom it marks as collected)
;
; This also seems to determine a few other things:
; - Tweeter jumps
; - Falling log height
; - Birdo subtype
; etc.
;
EnemyVariable:
	.dsb 1 ; DATA XREF: BANK0:9082w ; $0079
	.dsb 1 ; 1 ; $007a
	.dsb 1 ; 2 ; $007b
	.dsb 1 ; 3 ; $007c
	.dsb 1 ; 4 ; $007d
	.dsb 1 ; 5 ; $007e
	.dsb 1 ; 6 ; $007f
	.dsb 1 ; 7 ; $0080
	.dsb 1 ; 8 ; $0081

PlayerStateTimer:
	.dsb 1 ; $0082
FreeSubconsTimer:
	.dsb 1 ; $0083
PlayerWalkFrameCounter: ; used for controlling speed of walk animation
	.dsb 1 ; $0084
DamageInvulnTime:
	.dsb 1 ; $0085
EnemyTimer:
	.dsb 1 ; $0086
	.dsb 1 ; 1                ; $0087
	.dsb 1 ; 2                ; $0088
	.dsb 1 ; 3                ; $0089
	.dsb 1 ; 4                ; $008a
	.dsb 1 ; 5                ; $008b
	.dsb 1 ; 6                ; $008c
	.dsb 1 ; 7                ; $008d
FreeSubconsCorkCounter:
	.dsb 1 ; $008e
; $00 Mario
; $01 Princess
; $02 Toad
; $03 Luigi
CurrentCharacter:
	.dsb 1 ; $008f
ObjectType:
	.dsb 1 ; $0090
	.dsb 1 ; 1                ; $0091
	.dsb 1 ; 2                ; $0092
	.dsb 1 ; 3                ; $0093
	.dsb 1 ; 4                ; $0094
	.dsb 1 ; 5                ; $0095
	.dsb 1 ; 6                ; $0096
	.dsb 1 ; 7                ; $0097
	.dsb 1 ; 8                ; $0098
; $00 = on ground or enemy, $01 = in air
PlayerInAir:
	.dsb 1 ; $0099
PlayerDucking:
	.dsb 1 ; $009a
PlayerWalkFrame:
	.dsb 1 ; $009b
HoldingItem:
	.dsb 1 ; $009c
; $00 = left, $01 = right
PlayerDirection:
	.dsb 1 ; $009d
; FOR RENT
byte_RAM_9E:
	.dsb 1 ; $009e
ObjectAnimationTimer:
	.dsb 1 ; DATA XREF: BANK0:9099w ; $009f
	.dsb 1 ; 1                ; $00a0
	.dsb 1 ; 2                ; $00a1
	.dsb 1 ; 3                ; $00a2
	.dsb 1 ; 4                ; $00a3
	.dsb 1 ; 5                ; $00a4
	.dsb 1 ; 6                ; $00a5
	.dsb 1 ; 7                ; $00a6
	.dsb 1 ; 8                ; $00a7

; Set to 7 when lifting, then stays at 1
; Note that this doesn't seem to actually
; make you carry an item, it just THINKS
; it's being carried.
ObjectBeingCarriedTimer:
	.dsb 1 ; $00a8
	.dsb 1 ; $00a9
	.dsb 1 ; $00aa
	.dsb 1 ; $00ab
	.dsb 1 ; $00ac
	.dsb 1 ; $00ad
	.dsb 1 ; $00ae
	.dsb 1 ; $00af
	.dsb 1 ; $00b0

EnemyArray_B1:
	.dsb 1 ; $00b1
	.dsb 1 ; $00b2
	.dsb 1 ; $00b3
	.dsb 1 ; $00b4
	.dsb 1 ; $00b5
	.dsb 1 ; $00b6
	.dsb 1 ; $00b7
	.dsb 1 ; $00b8
	.dsb 1 ; $00b9

; PlayerXCameraOffset?
byte_RAM_BA:
	.dsb 1 ; $00ba
CurrentMusicPointer:
	.dsb 2 ; $00bb
NextFrequencyLo:
	.dsb 1 ; $00bd
NextFrequencyHi:
	.dsb 1 ; $00be
; $00BF and $00C0 are never written, but referenced by the music engine.
; Seems like they were intended to be either instrument start offets or
; duty/volume/envelope for the square channels, but it's not totally clear
; from the code, and doesn't actually function as written?
MusicSquareInstrumentStartOffset: ; (unused; read but never initialized)
	.dsb 1 ; $00bf
MusicSquareEnvelope: ; (unused; always overwritten)
	.dsb 1 ; $00c0
SoundEffect1DataOffset:
	.dsb 1 ; $00c1
IFNDEF EXPAND_MUSIC
MusicSquare2Lo: ; (unused)
ENDIF
	.dsb 1 ; $00c2
	.dsb 1 ; $00c3
SoundEffectTimer2:
	.dsb 1 ; $00c4
; FOR RENT
	.dsb 1 ; $00c5
; FOR RENT
	.dsb 1 ; $00c6
PlayerAnimationFrame:
	.dsb 1 ; $00c7
; related to y-mirroring
byte_RAM_C8:
	.dsb 1 ; $00c8
; related to x-mirroring
byte_RAM_C9:
	.dsb 1 ; $00c9
; Not sure about this, but seems to be that way
ScreenYHi:
	.dsb 1 ; $00ca
; Not sure about this either
ScreenYLo:
	.dsb 1 ; $00cb

RawEnemyData:
	.dsb 1 ; $00cc
	.dsb 1 ; $00cd
byte_RAM_CE:
	.dsb 1 ; $00ce
byte_RAM_CF:
	.dsb 1 ; $00cf
byte_RAM_D0:
	.dsb 1 ; $00d0
byte_RAM_D1:
	.dsb 1 ; $00d1
byte_RAM_D2:
	.dsb 1 ; $00d2
byte_RAM_D3:
	.dsb 1 ; $00d3
byte_RAM_D4:
	.dsb 1 ; $00d4
byte_RAM_D5:
	.dsb 1 ; $00d5
byte_RAM_D6:
	.dsb 1 ; $00d6
byte_RAM_D7:
	.dsb 1 ; $00d7

; @TODO understand better
; $01 = scroll up, $02 = scroll down
; (vertical areas only..?)
NeedVerticalScroll:
	.dsb 1 ; $00d8
EnemyArray_D9:
	.dsb 1 ; $00d9
	.dsb 1 ; 1                ; $00da
	.dsb 1 ; 2                ; $00db
	.dsb 1 ; 3                ; $00dc
	.dsb 1 ; 4                ; $00dd
	.dsb 1 ; 5                ; $00de
	.dsb 1 ; 6                ; $00df
	.dsb 1 ; 7                ; $00e0
byte_RAM_E1:
	.dsb 1 ; $00e1
byte_RAM_E2:
	.dsb 1 ; $00e2
byte_RAM_E3:
	.dsb 1 ; $00e3
byte_RAM_E4:
	.dsb 1 ; $00e4
byte_RAM_E5:
	.dsb 1 ; $00e5
byte_RAM_E6:
	.dsb 1 ; $00e6
byte_RAM_E7:
	.dsb 1 ; $00e7
byte_RAM_E8:
	.dsb 1 ; $00e8
byte_RAM_E9:
	.dsb 1 ; $00e9
byte_RAM_EA:
	.dsb 1 ; $00ea
NMIWaitFlag:
	.dsb 1 ; $00eb
IsHorizontalLevel:
	.dsb 1 ; $00ec
byte_RAM_ED:
	.dsb 1 ; $00ed
byte_RAM_EE:
	.dsb 1 ; $00ee
byte_RAM_EF:
	.dsb 1 ; $00ef
; Set this to the location of PPU data to be drawn
; to the screen (somehow).
;
; Common value of $0301, which is where minor
; PPU updates are stored in memory.
RAM_PPUDataBufferPointer:
	.dsb 2 ; $00f0
byte_RAM_F2:
	.dsb 1 ; $00f2
byte_RAM_F3:
	.dsb 1 ; $00f3
byte_RAM_F4:
	.dsb 1 ; $00f4
Player1JoypadPress:
	.dsb 1 ; $00f5
Player2JoypadPress:
	.dsb 1 ; $00f6
Player1JoypadHeld:
	.dsb 1 ; $00f7
Player2JoypadHeld:
	.dsb 1 ; $00f8
	.dsb 1 ; $00f9
	.dsb 1 ; $00fa
	.dsb 1 ; $00fb
PPUScrollYMirror:
	.dsb 1 ; $00fc
PPUScrollXMirror:
	.dsb 1 ; $00fd
PPUMaskMirror:
	.dsb 1 ; $00fe
PPUCtrlMirror:
	.dsb 1 ; $00ff


StackArea:
	.dsb $100   ; $0100 - $01FF

SpriteDMAArea:
	.dsb $100   ; $0200 - $02FF

byte_RAM_300:
	.dsb 1 ; $0300
PPUBuffer_301:
	.dsb 1 ; $0301
	.dsb 1 ; $0302
	.dsb 1 ; $0303
	.dsb 1 ; $0304
	.dsb 1 ; $0305
	.dsb 1 ; $0306
	.dsb 1 ; $0307
	.dsb 1 ; $0308
	.dsb 1 ; $0309
	.dsb 1 ; $030a
	.dsb 1 ; $030b
	.dsb 1 ; $030c
	.dsb 1 ; $030d
	.dsb 1 ; $030e
	.dsb 1 ; $030f
	.dsb 1 ; $0310
	.dsb 1 ; $0311
	.dsb 1 ; $0312
	.dsb 1 ; $0313
unk_RAM_314: ; related to color swapping
	.dsb 1 ; $0314
	.dsb 1 ; $0315
	.dsb 1 ; $0316
	.dsb 1 ; $0317
unk_RAM_318:
	.dsb 1 ; $0318
	.dsb 1 ; $0319
	.dsb 1 ; $031a
	.dsb 1 ; $031b
	.dsb 1 ; $031c
	.dsb 1 ; $031d
	.dsb 1 ; $031e
	.dsb 1 ; $031f
	.dsb 1 ; $0320
	.dsb 1 ; $0321
	.dsb 1 ; $0322
	.dsb 1 ; $0323
	.dsb 1 ; $0324
	.dsb 1 ; $0325
	.dsb 1 ; $0326
	.dsb 1 ; $0327
	.dsb 1 ; $0328
	.dsb 1 ; $0329
	.dsb 1 ; $032a
	.dsb 1 ; $032b
	.dsb 1 ; $032c
	.dsb 1 ; $032d
	.dsb 1 ; $032e
	.dsb 1 ; $032f
	.dsb 1 ; $0330
	.dsb 1 ; $0331
	.dsb 1 ; $0332
	.dsb 1 ; $0333
	.dsb 1 ; $0334
	.dsb 1 ; $0335
	.dsb 1 ; $0336
	.dsb 1 ; $0337
	.dsb 1 ; $0338
	.dsb 1 ; $0339
	.dsb 1 ; $033a
	.dsb 1 ; $033b
	.dsb 1 ; $033c
	.dsb 1 ; $033d
	.dsb 1 ; $033e
	.dsb 1 ; $033f
	.dsb 1 ; $0340
	.dsb 1 ; $0341
	.dsb 1 ; $0342
	.dsb 1 ; $0343
	.dsb 1 ; $0344
	.dsb 1 ; $0345
	.dsb 1 ; $0346
	.dsb 1 ; $0347
	.dsb 1 ; $0348
	.dsb 1 ; $0349
	.dsb 1 ; $034a
	.dsb 1 ; $034b
	.dsb 1 ; $034c
	.dsb 1 ; $034d
	.dsb 1 ; $034e
	.dsb 1 ; $034f
	.dsb 1 ; $0350
	.dsb 1 ; $0351
	.dsb 1 ; $0352
	.dsb 1 ; $0353
	.dsb 1 ; $0354
	.dsb 1 ; $0355
	.dsb 1 ; $0356
	.dsb 1 ; $0357
	.dsb 1 ; $0358
	.dsb 1 ; $0359
	.dsb 1 ; $035a
	.dsb 1 ; $035b
	.dsb 1 ; $035c
	.dsb 1 ; $035d
	.dsb 1 ; $035e
	.dsb 1 ; $035f
	.dsb 1 ; $0360
	.dsb 1 ; $0361
	.dsb 1 ; $0362
	.dsb 1 ; $0363
	.dsb 1 ; $0364
	.dsb 1 ; $0365
	.dsb 1 ; $0366
	.dsb 1 ; $0367
	.dsb 1 ; $0368
	.dsb 1 ; $0369
	.dsb 1 ; $036a
	.dsb 1 ; $036b
	.dsb 1 ; $036c
	.dsb 1 ; $036d
	.dsb 1 ; $036e
	.dsb 1 ; $036f
	.dsb 1 ; $0370
	.dsb 1 ; $0371
	.dsb 1 ; $0372
	.dsb 1 ; $0373
	.dsb 1 ; $0374
	.dsb 1 ; $0375
	.dsb 1 ; $0376
	.dsb 1 ; $0377
	.dsb 1 ; $0378
	.dsb 1 ; $0379
	.dsb 1 ; $037a
	.dsb 1 ; $037b
	.dsb 1 ; $037c
	.dsb 1 ; $037d
	.dsb 1 ; $037e
	.dsb 1 ; $037f
unk_RAM_380:
	.dsb 1 ; $0380
unk_RAM_381:
	.dsb 1 ; $0381
	.dsb 1 ; $0382
	.dsb 1 ; $0383
	.dsb 1 ; $0384
	.dsb 1 ; $0385
	.dsb 1 ; $0386
	.dsb 1 ; $0387
	.dsb 1 ; $0388
	.dsb 1 ; $0389
	.dsb 1 ; $038a
	.dsb 1 ; $038b
	.dsb 1 ; $038c
	.dsb 1 ; $038d
	.dsb 1 ; $038e
	.dsb 1 ; $038f
	.dsb 1 ; $0390
	.dsb 1 ; $0391
	.dsb 1 ; $0392
	.dsb 1 ; $0393
	.dsb 1 ; $0394
	.dsb 1 ; $0395
	.dsb 1 ; $0396
	.dsb 1 ; $0397
	.dsb 1 ; $0398
	.dsb 1 ; $0399
	.dsb 1 ; $039a
	.dsb 1 ; $039b
	.dsb 1 ; $039c
	.dsb 1 ; $039d
unk_RAM_39E:
	.dsb 1 ; $039e
unk_RAM_39F:
	.dsb 1 ; $039f
	.dsb 1 ; $03a0
	.dsb 1 ; $03a1
	.dsb 1 ; $03a2
	.dsb 1 ; $03a3
	.dsb 1 ; $03a4
	.dsb 1 ; $03a5
	.dsb 1 ; $03a6
	.dsb 1 ; $03a7
	.dsb 1 ; $03a8
	.dsb 1 ; $03a9
	.dsb 1 ; $03aa
	.dsb 1 ; $03ab
	.dsb 1 ; $03ac
	.dsb 1 ; $03ad
	.dsb 1 ; $03ae
	.dsb 1 ; $03af
	.dsb 1 ; $03b0
	.dsb 1 ; $03b1
	.dsb 1 ; $03b2
	.dsb 1 ; $03b3
	.dsb 1 ; $03b4
	.dsb 1 ; $03b5
	.dsb 1 ; $03b6
	.dsb 1 ; $03b7
	.dsb 1 ; $03b8
	.dsb 1 ; $03b9
	.dsb 1 ; $03ba
	.dsb 1 ; $03bb
byte_RAM_3BC:
	.dsb 1 ; $03bc
byte_RAM_3BD:
	.dsb 1 ; $03bd
unk_RAM_3BE:
	.dsb 1 ; $03be
	.dsb 1 ; $03bf
	.dsb 1 ; $03c0
	.dsb 1 ; $03c1
	.dsb 1 ; $03c2
	.dsb 1 ; $03c3
	.dsb 1 ; $03c4
	.dsb 1 ; $03c5
	.dsb 1 ; $03c6
	.dsb 1 ; $03c7
	.dsb 1 ; $03c8
	.dsb 1 ; $03c9
	.dsb 1 ; $03ca
	.dsb 1 ; $03cb
	.dsb 1 ; $03cc
	.dsb 1 ; $03cd
	.dsb 1 ; $03ce
	.dsb 1 ; $03cf
	.dsb 1 ; $03d0
	.dsb 1 ; $03d1
	.dsb 1 ; $03d2
	.dsb 1 ; $03d3
	.dsb 1 ; $03d4
	.dsb 1 ; $03d5
	.dsb 1 ; $03d6
	.dsb 1 ; $03d7
	.dsb 1 ; $03d8
	.dsb 1 ; $03d9
	.dsb 1 ; $03da
	.dsb 1 ; $03db
	.dsb 1 ; $03dc
	.dsb 1 ; $03dd
	.dsb 1 ; $03de
	.dsb 1 ; $03df
	.dsb 1 ; $03e0
	.dsb 1 ; $03e1
	.dsb 1 ; $03e2
	.dsb 1 ; $03e3
	.dsb 1 ; $03e4
	.dsb 1 ; $03e5
	.dsb 1 ; $03e6
	.dsb 1 ; $03e7
	.dsb 1 ; $03e8
	.dsb 1 ; $03e9
	.dsb 1 ; $03ea
	.dsb 1 ; $03eb
	.dsb 1 ; $03ec
	.dsb 1 ; $03ed
	.dsb 1 ; $03ee
	.dsb 1 ; $03ef
	.dsb 1 ; $03f0
	.dsb 1 ; $03f1
	.dsb 1 ; $03f2
	.dsb 1 ; $03f3
	.dsb 1 ; $03f4
	.dsb 1 ; $03f5
	.dsb 1 ; $03f6
	.dsb 1 ; $03f7
	.dsb 1 ; $03f8
	.dsb 1 ; $03f9
	.dsb 1 ; $03fa
	.dsb 1 ; $03fb
	.dsb 1 ; $03fc
	.dsb 1 ; $03fd
	.dsb 1 ; $03fe
	.dsb 1 ; $03ff
SpriteFlickerSlot:
	.dsb 1 ; $0400

; FOR RENT
	.dsb 1 ; $0401
; FOR RENT
	.dsb 1 ; $0402
; FOR RENT
	.dsb 1 ; $0403
; unused? written but never read
PreviousCharacter:
	.dsb 1 ; $0404
; unused? written but never read
PreviousWorld:
	.dsb 1 ; $0405
; FOR RENT
	.dsb 1 ; $0406

PlayerXSubpixel:
	.dsb 1 ; $0407
ObjectXSubpixel:
	.dsb 1 ; $0408
	.dsb 1 ; $0409
	.dsb 1 ; $040a
	.dsb 1 ; $040b
	.dsb 1 ; $040c
	.dsb 1 ; $040d
	.dsb 1 ; $040e
	.dsb 1 ; $040f
	.dsb 1 ; $0410

PlayerYSubpixel:
	.dsb 1 ; $0411
ObjectYSubpixel:
	.dsb 1 ; $0412
	.dsb 1 ; $0413
	.dsb 1 ; $0414
	.dsb 1 ; $0415
	.dsb 1 ; $0416
	.dsb 1 ; $0417
	.dsb 1 ; $0418
	.dsb 1 ; $0419
	.dsb 1 ; $041a

PlayerLock:
	.dsb 1 ; $041b
ObjectLock:
	.dsb 1 ; $041c
	.dsb 1 ; $041d
	.dsb 1 ; $041e
	.dsb 1 ; $041f
	.dsb 1 ; $0420
	.dsb 1 ; $0421
	.dsb 1 ; $0422
	.dsb 1 ; $0423
	.dsb 1 ; $0424

; $00 = none, $01 = up, $02 = down
VerticalScrollDirection:
	.dsb 1 ; $0425
byte_RAM_426:
	.dsb 1 ; $0426
byte_RAM_427:
	.dsb 1 ; $0427
PlayerScreenX:
	.dsb 1 ; $0428
SpriteTempScreenX:
	.dsb 1 ; $0429
PlayerScreenYHi:
	.dsb 1 ; $042a
PlayerScreenYLo:
	.dsb 1 ; $042b
SpriteTempScreenY:
	.dsb 1 ; $042c
ObjectBeingCarriedIndex:
	.dsb 1 ; $042d

; FOR RENT
	.dsb 1 ; $042e
; stun timer?
EnemyArray_42F:
	.dsb 1 ; $042f
	.dsb 1 ; $0430
	.dsb 1 ; $0431
	.dsb 1 ; $0432
	.dsb 1 ; $0433
	.dsb 1 ; $0434
	.dsb 1 ; $0435
	.dsb 1 ; $0436

; FOR RENT
	.dsb 1 ; $0437
EnemyArray_438:
	.dsb 1 ; $0438
	.dsb 1 ; $0439
	.dsb 1 ; $043a
	.dsb 1 ; $043b
	.dsb 1 ; $043c
	.dsb 1 ; $043d
	.dsb 1 ; $043e
	.dsb 1 ; $043f

; FOR RENT
	.dsb 1 ; $0440
; Despawn offset
unk_RAM_441:
	.dsb 1 ; $0441
	.dsb 1 ; $0442
	.dsb 1 ; $0443
	.dsb 1 ; $0444
	.dsb 1 ; $0445
	.dsb 1 ; $0446
	.dsb 1 ; $0447
	.dsb 1 ; $0448

; FOR RENT
	.dsb 1 ; $0449
ObjectShakeTimer:
	.dsb 1 ; $044a
	.dsb 1 ; $044b
	.dsb 1 ; $044c
	.dsb 1 ; $044d
	.dsb 1 ; $044e
	.dsb 1 ; $044f
	.dsb 1 ; $0450
	.dsb 1 ; $0451

; FOR RENT
	.dsb 1 ; $0452
EnemyArray_453:
	.dsb 1 ; $0453
	.dsb 1 ; $0454
	.dsb 1 ; $0455
	.dsb 1 ; $0456
	.dsb 1 ; $0457
	.dsb 1 ; $0458
	.dsb 1 ; $0459
	.dsb 1 ; $045a

; FOR RENT
	.dsb 1 ; $045b
; Flashing timer
EnemyArray_45C:
	.dsb 1 ; $045c
	.dsb 1 ; $045d
	.dsb 1 ; $045e
	.dsb 1 ; $045f
	.dsb 1 ; $0460
	.dsb 1 ; $0461
	.dsb 1 ; $0462
	.dsb 1 ; $0463

; FOR RENT
	.dsb 1 ; $0464
EnemyHP:
	.dsb 1 ; $00 ; $0465
	.dsb 1 ; $01 ; $0466
	.dsb 1 ; $02 ; $0467
	.dsb 1 ; $03 ; $0468
	.dsb 1 ; $04 ; $0469
	.dsb 1 ; $046a
	.dsb 1 ; $046b
	.dsb 1 ; $046c

unk_RAM_46D:
	.dsb 1 ; $046d
EnemyArray_46E:
	.dsb 1 ; $046e
	.dsb 1 ; $046f
	.dsb 1 ; $0470
	.dsb 1 ; $0471
	.dsb 1 ; $0472
	.dsb 1 ; $0473
	.dsb 1 ; $0474
	.dsb 1 ; $0475

; FOR RENT
	.dsb 1 ; $0476
EnemyArray_477:
	.dsb 1 ; $0477
	.dsb 1 ; $0478
	.dsb 1 ; $0479
	.dsb 1 ; $047a
	.dsb 1 ; $047b
	.dsb 1 ; $047c
	.dsb 1 ; $047d
	.dsb 1 ; $047e

; FOR RENT
	.dsb 1 ; $047f
EnemyArray_480:
	.dsb 1 ; $0480
	.dsb 1 ; $0481
	.dsb 1 ; $0482
	.dsb 1 ; $0483
	.dsb 1 ; $0484
	.dsb 1 ; $0485
	.dsb 1 ; $0486
	.dsb 1 ; $0487

; FOR RENT
	.dsb 1 ; $0488
EnemyArray_489:
	.dsb 1 ; $0489
	.dsb 1 ; $048a
	.dsb 1 ; $048b
	.dsb 1 ; $048c
	.dsb 1 ; $048d
	.dsb 1 ; $048e
	.dsb 1 ; $048f
	.dsb 1 ; $0490

unk_RAM_491:
	.dsb 1 ; $0491
EnemyArray_492:
	.dsb 1 ; $0492
	.dsb 1 ; $0493
	.dsb 1 ; $0494
	.dsb 1 ; $0495
	.dsb 1 ; $0496
	.dsb 1 ; $0497
	.dsb 1 ; $0498
	.dsb 1 ; $0499

; FOR RENT
	.dsb 1 ; $049a
EnemyArray_SpawnsDoor:
	.dsb 1 ; $049b
	.dsb 1 ; $049c
	.dsb 1 ; $049d
	.dsb 1 ; $049e
	.dsb 1 ; $049f
	.dsb 1 ; $04a0
	.dsb 1 ; $04a1
	.dsb 1 ; $04a2

; FOR RENT
	.dsb 1 ; $04a3
unk_RAM_4A4:
	.dsb 1 ; $04a4
	.dsb 1 ; $04a5
	.dsb 1 ; $04a6
	.dsb 1 ; $04a7
	.dsb 1 ; $04a8
	.dsb 1 ; $04a9
	.dsb 1 ; $04aa
	.dsb 1 ; $04ab

; FOR RENT
	.dsb 1 ; $04ac
EnemiesKilledForHeart:
	.dsb 1 ; $04ad
AreaInitialized:
	.dsb 1 ; $04ae
ObjectCarriedOver:
	.dsb 1 ; $04af
KeyUsed:
	.dsb 1 ; $04b0
; FOR RENT
	.dsb 1 ; $04b1
PlayerRidingCarpet:
	.dsb 1 ; $04b2
SubspaceDoorTimer:
	.dsb 1 ; $04b3
; Probably set to 1 when Hawkmouth eats the player and starts closing
HawkmouthClosing:
	.dsb 1 ; $04b4
; Set to 01 on crystal get, Hawkmouth opens to 30
CrystalAndHawkmouthOpenSize:
	.dsb 1 ; $04b5
; Hawkmouth won't start opening until this hits 0
HawkmouthOpenTimer:
	.dsb 1 ; $04b6
SubspaceTimer:
	.dsb 1 ; $04b7
BossBeaten:
	.dsb 1 ; $04b8
SwarmType:
	.dsb 1 ; $04b9
; FOR RENT
	.dsb 1 ; $04ba
; FOR RENT
	.dsb 1 ; $04bb
SkyColor:
	.dsb 1 ; $04bc
DoorAnimationTimer:
	.dsb 1 ; $04bd
ScreenBoundaryLeftHi:
	.dsb 1 ; $04be
ScreenBoundaryRightHi:
	.dsb 1 ; $04bf
ScreenBoundaryLeftLo:
	.dsb 1 ; $04c0
ScreenBoundaryRightLo:
	.dsb 1 ; $04c1
; xF: Hearts - 1 ($0F=1HP, $1F=2HP, etc)
PlayerHealth:
	.dsb 1 ; $04c2
; $00: Max 2
; $01: Max 3
; $02: Max 4
PlayerMaxHealth:
	.dsb 1 ; $04c3
POWQuakeTimer:
	.dsb 1 ; $04c4
BackgroundYOffset:
	.dsb 1 ; $04c5
SkyFlashTimer:
	.dsb 1 ; $04c6
PlayerInRocket:
	.dsb 1 ; $04c7
	.dsb 1 ; $04c8
JumpFloatTimer:
	.dsb 1 ; $04c9
CrouchJumpTimer:
	.dsb 1 ; $04ca

PlayerXAcceleration:
	.dsb 1 ; $04cb
ObjectXAcceleration:
	.dsb 1 ; $04cc
	.dsb 1 ; $04cd
	.dsb 1 ; $04ce
	.dsb 1 ; $04cf
	.dsb 1 ; $04d0
	.dsb 1 ; $04d1
	.dsb 1 ; $04d2
	.dsb 1 ; $04d3

; FOR RENT
	.dsb 1 ; $04d4
PlayerYAcceleration:
	.dsb 1 ; $04d5
ObjectYAcceleration:
	.dsb 1 ; $04d6
	.dsb 1 ; $04d7
	.dsb 1 ; $04d8
	.dsb 1 ; $04d9
	.dsb 1 ; $04da
	.dsb 1 ; $04db
	.dsb 1 ; $04dc
	.dsb 1 ; $04dd

; FOR RENT
	.dsb 1 ; $04de
QuicksandDepth:
	.dsb 1 ; $04df
StarInvincibilityTimer:
	.dsb 1 ; $04e0
PlayerXLo_Init:
	.dsb 1 ; $04e1
PlayerYLo_Init:
	.dsb 1 ; $04e2
PlayerScreenX_Init:
	.dsb 1 ; $04e3
PlayerScreenYLo_Init:
	.dsb 1 ; $04e4
PlayerYVelocity_Init:
	.dsb 1 ; $04e5
PlayerState_Init:
	.dsb 1 ; $04e6
CurrentLevel_Init:
	.dsb 1 ; $04e7
CurrentLevelArea_Init:
	.dsb 1 ; $04e8
CurrentLevelEntryPage_Init:
	.dsb 1 ; $04e9
TransitionType_Init:
	.dsb 1 ; $04ea
; something to do with sinking in quicksand
byte_RAM_4EB:
	.dsb 1 ; $04eb
; $00: In game
; $01: Level title card
; $02: Game over
; $03: Bonus chance
; $04+: Warp
GameMode:
	.dsb 1 ; $04ec
ExtraLives:
	.dsb 1 ; $04ed
; $00: None
; $01: Default jar
; $02: Pointer jar
InJarType:
	.dsb 1 ; $04ee
unk_RAM_4EF:
	.dsb 1 ; $04ef
	.dsb 1 ; $04f0
	.dsb 1 ; $04f1
	.dsb 1 ; $04f2
	.dsb 1 ; $04f3
	.dsb 1 ; $04f4
	.dsb 1 ; $04f5
	.dsb 1 ; $04f6
	.dsb 1 ; $04f7
FryguySplitFlames:
	.dsb 1 ; $04f8
VegetableThrowerShotCounter:
	.dsb 1 ; $04f9
ScrollXLock:
	.dsb 1 ; $04fa
Mushroom1Pulled:
	.dsb 1 ; $04fb
Mushroom2Pulled:
	.dsb 1 ; $04fc
PokeyTempScreenX:
	.dsb 1 ; $04fd
; FOR RENT
	.dsb 1 ; $04fe
StopwatchTimer:
	.dsb 1 ; $04ff
; FOR RENT
	.dsb 1 ; $0500
; FOR RENT
	.dsb 1 ; $0501
byte_RAM_502:
	.dsb 1 ; $0502
; FOR RENT
	.dsb 1 ; $0503
CameraScrollTiles:
	.dsb 1 ; $0504
byte_RAM_505:
	.dsb 1 ; $0505
byte_RAM_506:
	.dsb 1 ; $0506
byte_RAM_507:
	.dsb 1 ; $0507
; FOR RENT
	.dsb 1 ; $0508
PPUScrollYMirror_Backup:
	.dsb 1 ; $0509
PPUScrollXMirror_Backup:
	.dsb 1 ; $050a
byte_RAM_50B:
	.dsb 1 ; $050b
byte_RAM_50C:
	.dsb 1 ; $050c
byte_RAM_50D:
	.dsb 1 ; $050d
byte_RAM_50E:
	.dsb 1 ; $050e
PlayerXHi_Backup:
	.dsb 1 ; $050f
PlayerYHi_Backup:
	.dsb 1 ; $0510
PlayerXLo_Backup:
	.dsb 1 ; $0511
PlayerYLo_Backup:
	.dsb 1 ; $0512
ScreenYHi_Backup:
	.dsb 1 ; $0513
ScreenBoundaryLeftHi_Backup:
	.dsb 1 ; $0514
ScreenYLo_Backup:
	.dsb 1 ; $0515
; FOR RENT
	.dsb 1 ; $0516
byte_RAM_517:
	.dsb 1 ; $0517
; FOR RENT
	.dsb 1 ; $0518
CurrentLevelAreaCopy:
	.dsb 1 ; $0519
; FOR RENT
	.dsb 1 ; $051a
byte_RAM_51B:
	.dsb 1 ; $051b
byte_RAM_51C:
	.dsb 1 ; $051c
AreaPointersByPage:
	.dsb 1 ; $051d
	.dsb 1 ; $051e
	.dsb 1 ; $051f
	.dsb 1 ; $0520
	.dsb 1 ; $0521
	.dsb 1 ; $0522
	.dsb 1 ; $0523
	.dsb 1 ; $0524
	.dsb 1 ; $0525
	.dsb 1 ; $0526
	.dsb 1 ; $0527
	.dsb 1 ; $0528
	.dsb 1 ; $0529
	.dsb 1 ; $052a
	.dsb 1 ; $052b
	.dsb 1 ; $052c
	.dsb 1 ; $052d
	.dsb 1 ; $052e
	.dsb 1 ; $052f
	.dsb 1 ; $0530
CurrentLevel:
	.dsb 1 ; $0531
CurrentLevelArea:
	.dsb 1 ; $0532
CurrentLevelEntryPage:
	.dsb 1 ; $0533
TransitionType:
	.dsb 1 ; $0534
	; Seems to be set depending on how you transitioned areas last.
	; $00 = ? (Start of level?)
	; $01 = Door
	; $02 = Jar
	; $03 = Vine
CurrentLevelPage:
	.dsb 1 ; $0535
CurrentLevelPageX:
	.dsb 1 ; $0536
byte_RAM_537:
	.dsb 1 ; $0537
byte_RAM_538:
	.dsb 1 ; $0538
byte_RAM_539:
	.dsb 1 ; $0539
byte_RAM_53A:
	.dsb 1 ; $053a
	.dsb 1 ; $053b
	.dsb 1 ; $053c
byte_RAM_53D:
	.dsb 1 ; $053d
byte_RAM_53E:
	.dsb 1 ; $053e
CurrentLevelPages:
	.dsb 1 ; $053f
byte_RAM_540:
	.dsb 1 ; $0540
GroundSetting:
	.dsb 1 ; $0541
; area object type xxOO
ObjectType3Xthru9X:
	.dsb 1 ; $0542
; area object type OOxx
ObjectTypeAXthruFX:
	.dsb 1 ; $0543
CompareMusicIndex:
	.dsb 1 ; $0544
CurrentMusicIndex:
	.dsb 1 ; $0545

CharacterStatsRAM:
PickupSpeedAnimation:
	.dsb 1 ; $0546
	.dsb 1 ; 1                ; $0547
	.dsb 1 ; 2                ; $0548
	.dsb 1 ; 3                ; $0549
	.dsb 1 ; 4                ; $054a
	.dsb 1 ; 5                ; $054b
JumpHeightStanding:
	.dsb 1 ; $054c
JumpHeightStandingCarrying:
	.dsb 1 ; $054d
JumpHeightCrouching:
	.dsb 1 ; $054e
JumpHeightCrouchingCarrying:
	.dsb 1 ; $054f
JumpHeightRunning:
	.dsb 1 ; $0550
JumpHeightRunningCarrying:
	.dsb 1 ; $0551
JumpHeightQuicksand:
	.dsb 1 ; $0552
JumpFloatLength:
	.dsb 1 ; $0553
GravityWithoutJumpButton:
	.dsb 1 ; $0554
GravityWithJumpButton:
	.dsb 1 ; $0555
GravityQuicksand:
	.dsb 1 ; $0556
RunSpeedRight:
	.dsb 1 ; $0557
RunSpeedRightCarrying:
	.dsb 1 ; $0558
RunSpeedRightQuicksand:
	.dsb 1 ; $0559
RunSpeedLeft:
	.dsb 1 ; $055a
RunSpeedLeftCarrying:
	.dsb 1 ; $055b
RunSpeedLeftQuicksand:
	.dsb 1 ; $055c
; FOR RENT
	.dsb 1 ; $055d
GroundType:
	.dsb 1 ; $055e
PPUBuffer_55F:
	.dsb 1 ; $055f
	.dsb 1 ; $0560
	.dsb 1 ; $0561
	.dsb 1 ; $0562
	.dsb 1 ; $0563
	.dsb 1 ; $0564
	.dsb 1 ; $0565
	.dsb 1 ; $0566
	.dsb 1 ; $0567
	.dsb 1 ; $0568
	.dsb 1 ; $0569
	.dsb 1 ; $056a
	.dsb 1 ; $056b
	.dsb 1 ; $056c
	.dsb 1 ; $056d
	.dsb 1 ; $056e
	.dsb 1 ; $056f
	.dsb 1 ; $0570
	.dsb 1 ; $0571
	.dsb 1 ; $0572
	.dsb 1 ; $0573
	.dsb 1 ; $0574
	.dsb 1 ; $0575
	.dsb 1 ; $0576
	.dsb 1 ; $0577
	.dsb 1 ; $0578
	.dsb 1 ; $0579
	.dsb 1 ; $057a
	.dsb 1 ; $057b
	.dsb 1 ; $057c
	.dsb 1 ; $057d
	.dsb 1 ; $057e
	.dsb 1 ; $057f
	.dsb 1 ; $0580
	.dsb 1 ; $0581
	.dsb 1 ; $0582
PPUBuffer_583:
	.dsb 1 ; $0583
	.dsb 1 ; $0584
	.dsb 1 ; $0585
	.dsb 1 ; $0586
	.dsb 1 ; $0587
byte_RAM_588:
	.dsb 1 ; $0588
	.dsb 1 ; $0589
	.dsb 1 ; $058a
	.dsb 1 ; $058b
	.dsb 1 ; $058c
	.dsb 1 ; $058d
	.dsb 1 ; $058e
	.dsb 1 ; $058f
	.dsb 1 ; $0590
	.dsb 1 ; $0591
	.dsb 1 ; $0592
	.dsb 1 ; $0593
	.dsb 1 ; $0594
	.dsb 1 ; $0595
	.dsb 1 ; $0596
	.dsb 1 ; $0597
	.dsb 1 ; $0598
byte_RAM_599:
	.dsb 1 ; $0599
byte_RAM_59A:
	.dsb 1 ; $059a
	.dsb 1 ; $059b
unk_RAM_59C:
	.dsb 1 ; $059c
	.dsb 1 ; $059d
	.dsb 1 ; $059e
	.dsb 1 ; $059f
	.dsb 1 ; $05a0
	.dsb 1 ; $05a1
	.dsb 1 ; $05a2
	.dsb 1 ; $05a3
	.dsb 1 ; $05a4
	.dsb 1 ; $05a5
	.dsb 1 ; $05a6
	.dsb 1 ; $05a7
	.dsb 1 ; $05a8
	.dsb 1 ; $05a9
	.dsb 1 ; $05aa
	.dsb 1 ; $05ab
PseudoRNGValues:
	.dsb 1 ; $05ac
	.dsb 1 ; $05ad
	.dsb 1 ; $05ae
	.dsb 1 ; $05af
	.dsb 1 ; $05b0
	.dsb 1 ; $05b1
	.dsb 1 ; $05b2
	.dsb 1 ; $05b3
	.dsb 1 ; $05b4
	.dsb 1 ; $05b5
	.dsb 1 ; $05b6
	.dsb 1 ; $05b7
	.dsb 1 ; $05b8
	.dsb 1 ; $05b9
; initialized but never used?
byte_RAM_5BA:
	.dsb 1 ; $05ba
; set to $10 if a subspace door is ever created, but never used?
byte_RAM_5BB:
	.dsb 1 ; $05bb
PhantoActivateTimer:
	.dsb 1 ; $05bc
CardScreenUpdateIndex:
	.dsb 1 ; $05bd
Contributors:
	.dsb 1 ; $05be
	.dsb 1 ; $05bf
	.dsb 1 ; $05c0
	.dsb 1 ; $05c1
NumContributors:
	.dsb 1 ; $05c2
ContributorIndex:
	.dsb 1 ; $05c3
ContributorTimer:
	.dsb 1 ; $05c4
Continues:
	.dsb 1 ; $05c5

; FOR RENT
	.dsb 1 ; $05c6
	.dsb 1 ; $05c7
	.dsb 1 ; $05c8
	.dsb 1 ; $05c9
	.dsb 1 ; $05ca
	.dsb 1 ; $05cb
	.dsb 1 ; $05cc
	.dsb 1 ; $05cd
	.dsb 1 ; $05ce
	.dsb 1 ; $05cf
	.dsb 1 ; $05d0
	.dsb 1 ; $05d1
	.dsb 1 ; $05d2
	.dsb 1 ; $05d3
	.dsb 1 ; $05d4
	.dsb 1 ; $05d5
	.dsb 1 ; $05d6
	.dsb 1 ; $05d7
	.dsb 1 ; $05d8
	.dsb 1 ; $05d9
	.dsb 1 ; $05da
	.dsb 1 ; $05db
	.dsb 1 ; $05dc
	.dsb 1 ; $05dd
	.dsb 1 ; $05de
	.dsb 1 ; $05df
	.dsb 1 ; $05e0
	.dsb 1 ; $05e1
	.dsb 1 ; $05e2
	.dsb 1 ; $05e3
	.dsb 1 ; $05e4
	.dsb 1 ; $05e5
	.dsb 1 ; $05e6
	.dsb 1 ; $05e7
	.dsb 1 ; $05e8
	.dsb 1 ; $05e9
	.dsb 1 ; $05ea
	.dsb 1 ; $05eb

MusicPointerCurrentPart:
	.dsb 1 ; $05ec
MusicSquare1NoteStartLength:
	.dsb 1 ; $05ed
MusicPointerFirstPart:
	.dsb 1 ; $05ee
MusicPointerEndPart:
	.dsb 1 ; $05ef
MusicPointerLoopPart:
	.dsb 1 ; $05f0
MusicSquare2Patch:
	.dsb 1 ; $05f1
MusicSquare1Patch:
	.dsb 1 ; $05f2
MusicResume1:
	.dsb 1 ; $05f3
NextOctave:
	.dsb 1 ; $05f4
CurrentMusicNoiseStartOffset:
	.dsb 1 ; $05f5
; FOR RENT
	.dsb 1 ; $05f6
	.dsb 1 ; $05f7
	.dsb 1 ; $05f8
MusicSquare1Lo:
	.dsb 1 ; $05f9 (unused; written to but not read)
MusicDPCMNoteLength:
	.dsb 1 ; $05fa
MusicDPCMNoteStartLength:
	.dsb 1 ; $05fb
CurrentMusicDPCMStartOffset:
	.dsb 1 ; $05fc
IFDEF EXPAND_MUSIC
MusicSquare2Lo: ; needs to be +$04 relative to MusicSquare1Lo
ENDIF
	.dsb 1 ; $05fd (unused; written to but not read)
	.dsb 1 ; $05fe
CurrentMusicDPCMOffset:
	.dsb 1 ; $05ff

; #01 Overworld
; #02 Character Select
; #04 Inside
; #08 Boss
; #10 Invincible
; #20 Subspace
; #40 Wart
; #80 Title
MusicQueue1:
	.dsb 1 ; $0600

; $01 Item pull A
; $02 Drum sample A
; $04 Player hurt (>1 HP left)
; $08 Item pull B
; $10 Enemy scream A
; $20 Drum sample B
; $40 Enemy scream B
; $80 Enemy scream C
DPCMQueue:
	.dsb 1 ; $0601

; $01 Birdo/etc shoot noise
; $02 Potion door creation
; $04 Cherry collect
; $08 Throw item
; $10 1-up
; $20 Enemy hit/killed
; $40 Stopwatch tick
; $80 Wart spit
SoundEffectQueue1:
	.dsb 1 ; $0602

; $01 Warp fanfare, slot entry jingle
; $02 Boss clear fanfare
; $04 Celebration
; $08 Death jingle
; $10 Game over
; $20 Mini-fanfare (slot win, crystal get)
; $40 Same as $01
; $80 Silence (stops music)
MusicQueue2:
	.dsb 1 ; $0603

; $01 Jump
; $02 Climbing
; $04 Coin collected
; $08 Shrinking
; $10 Intro "falling" sound
; $20 Growing
; $40 -N/A-
; $80 -N/A-
SoundEffectQueue2:
	.dsb 1 ; $0604

; $01 Short noise
; $02 Rumbling sound
; $04 Rumbling sound
; $08 -N/A-
; $10 -N/A-
; $20 -N/A-
; $40 -N/A-
; $80 -N/A-
SoundEffectQueue3:
	.dsb 1 ; $0605

MusicPlaying2:
	.dsb 1 ; $0606
SoundEffectPlaying1:
	.dsb 1 ; $0607
DPCMPlaying:
	.dsb 1 ; $0608
MusicPlaying1:
	.dsb 1 ; $0609
DPCMTimer:
	.dsb 1 ; $060a
; FOR RENT
MusicSquare1NoteBend:
	.dsb 1 ; $060b
MusicSquare1NoteSweep:
	.dsb 1 ; $060c
SoundEffectPlaying2:
	.dsb 1 ; $060d
SoundEffectPlaying3:
	.dsb 1 ; $060e
MusicSquare2NoteBend:
	.dsb 1 ; $060f
; FOR RENT
	.dsb 1 ; $0610
SoundEffectTimer3:
	.dsb 1 ; $0611
MusicTempoSetting:
	.dsb 1 ; $0612
CurrentMusicSquare2Offset:
	.dsb 1 ; $0613
CurrentMusicSquare1Offset:
	.dsb 1 ; $0614
CurrentMusicTriangleOffset:
	.dsb 1 ; $0615
CurrentMusicNoiseOffset:
	.dsb 1 ; $0616
MusicSquare2NoteStartLength:
	.dsb 1 ; $0617
MusicSquare2NoteLength:
	.dsb 1 ; $0618
MusicSquare2InstrumentOffset:
	.dsb 1 ; $0619
MusicSquare1NoteLength:
	.dsb 1 ; $061a
MusicSquare1InstrumentOffset:
	.dsb 1 ; $061b
MusicTriangleNoteStartLength:
	.dsb 1 ; $061c
MusicTriangleNoteLength:
	.dsb 1 ; $061d
MusicNoiseNoteLength:
	.dsb 1 ; $061e
MusicNoiseNoteStartLength:
	.dsb 1 ; $061f
Mushroom1upPulled:
	.dsb 1 ; $0620
SubspaceVisits:
	.dsb 1 ; $0621
SubspaceCoins:
	.dsb 1 ; $0622
SwarmCounter:
	.dsb 1 ; $0623
GroundSlipperiness:
	.dsb 1 ; $0624
; FOR RENT
	.dsb 1 ; $0625
; FOR RENT
	.dsb 1 ; $0626
DoAreaTransition:
	.dsb 1 ; $0627
InSubspaceOrJar:
	.dsb 1 ; $0628
CurrentLevelRelative:
	.dsb 1 ; $0629
CherryCount:
	.dsb 1 ; $062a
SlotMachineCoins:
	.dsb 1 ; $062b
BigVeggiesPulled:
	.dsb 1 ; $062c
CharacterLevelsCompleted:
	.dsb 1 ; $062d
	.dsb 1 ; $062e
	.dsb 1 ; $062f
	.dsb 1 ; $0630
MaxLevelsCompleted:
	.dsb 1 ; $0631
; FOR RENT
	.dsb 1 ; $0632
; FOR RENT
LevelObjectMode:
	.dsb 1 ; $0633

IFDEF AREA_HEADER_TILESET
CurrentWorldTileset:
	.dsb 1 ; $0634
CurrentWorld:
	.dsb 1 ; $0635
ENDIF

IFNDEF AREA_HEADER_TILESET
; FOR RENT
	.dsb 1 ; $0634
CurrentWorld:
CurrentWorldTileset:
	.dsb 1 ; $0635
ENDIF

; gets set to $A5 in DoCharacterSelectMenu to skip the bank switch
CharacterSelectBankSwitch:
	.dsb 1 ; $0636
RestorePlayerPalette0:
	.dsb 1 ; $0637
RestorePlayerPalette1:
	.dsb 1 ; $0638
RestorePlayerPalette2:
	.dsb 1 ; $0639
RestorePlayerPalette3:
	.dsb 1 ; $063a
SlotMachineReelOrder1RAM:
	.dsb 1 ; $063b
	.dsb 1 ; $063c
	.dsb 1 ; $063d
	.dsb 1 ; $063e
	.dsb 1 ; $063f
	.dsb 1 ; $0640
	.dsb 1 ; $0641
	.dsb 1 ; $0642
SlotMachineReelOrder2RAM:
	.dsb 1 ; $0643
	.dsb 1 ; $0644
	.dsb 1 ; $0645
	.dsb 1 ; $0646
	.dsb 1 ; $0647
	.dsb 1 ; $0648
	.dsb 1 ; $0649
	.dsb 1 ; $064a
SlotMachineReelOrder3RAM:
	.dsb 1 ; $064b
	.dsb 1 ; $064c
	.dsb 1 ; $064d
	.dsb 1 ; $064e
	.dsb 1 ; $064f
	.dsb 1 ; $0650
	.dsb 1 ; $0651
	.dsb 1 ; $0652
unk_RAM_653:
	.dsb 1 ; $0653
	.dsb 1 ; $0654
	.dsb 1 ; $0655
	.dsb 1 ; $0656
	.dsb 1 ; $0657
	.dsb 1 ; $0658
	.dsb 1 ; $0659
	.dsb 1 ; $065a
	.dsb 1 ; $065b
	.dsb 1 ; $065c
	.dsb 1 ; $065d
	.dsb 1 ; $065e
	.dsb 1 ; $065f
	.dsb 1 ; $0660
	.dsb 1 ; $0661
	.dsb 1 ; $0662
	.dsb 1 ; $0663
	.dsb 1 ; $0664
	.dsb 1 ; $0665
	.dsb 1 ; $0666
	.dsb 1 ; $0667
	.dsb 1 ; $0668
	.dsb 1 ; $0669
	.dsb 1 ; $066a
	.dsb 1 ; $066b
	.dsb 1 ; $066c
	.dsb 1 ; $066d
	.dsb 1 ; $066e
	.dsb 1 ; $066f
	.dsb 1 ; $0670
	.dsb 1 ; $0671
	.dsb 1 ; $0672
	.dsb 1 ; $0673
	.dsb 1 ; $0674
	.dsb 1 ; $0675
	.dsb 1 ; $0676
	.dsb 1 ; $0677
	.dsb 1 ; $0678
	.dsb 1 ; $0679
	.dsb 1 ; $067a
PPUBuffer_67B:
	.dsb 1 ; $067b
	.dsb 1 ; $067c
	.dsb 1 ; $067d
byte_RAM_67E:
	.dsb 1 ; $067e
	.dsb 1 ; $067f
	.dsb 1 ; $0680
	.dsb 1 ; $0681
	.dsb 1 ; $0682
	.dsb 1 ; $0683
	.dsb 1 ; $0684
	.dsb 1 ; $0685
	.dsb 1 ; $0686
	.dsb 1 ; $0687
	.dsb 1 ; $0688
	.dsb 1 ; $0689
	.dsb 1 ; $068a
	.dsb 1 ; $068b
	.dsb 1 ; $068c
	.dsb 1 ; $068d
	.dsb 1 ; $068e
byte_RAM_68F:
	.dsb 1 ; $068f
	.dsb 1 ; $0690
	.dsb 1 ; $0691
	.dsb 1 ; $0692
PPUBuffer_693:
	.dsb 1 ; $0693
	.dsb 1 ; $0694
	.dsb 1 ; $0695
	.dsb 1 ; $0696
	.dsb 1 ; $0697
	.dsb 1 ; $0698
	.dsb 1 ; $0699
	.dsb 1 ; $069a
	.dsb 1 ; $069b
	.dsb 1 ; $069c
	.dsb 1 ; $069d
	.dsb 1 ; $069e
	.dsb 1 ; $069f
	.dsb 1 ; $06a0
	.dsb 1 ; $06a1
	.dsb 1 ; $06a2
	.dsb 1 ; $06a3
	.dsb 1 ; $06a4
	.dsb 1 ; $06a5
	.dsb 1 ; $06a6
	.dsb 1 ; $06a7
	.dsb 1 ; $06a8
	.dsb 1 ; $06a9
	.dsb 1 ; $06aa
PPUBuffer_6AB:
	.dsb 1 ; $06ab
	.dsb 1 ; $06ac
	.dsb 1 ; $06ad
	.dsb 1 ; $06ae
	.dsb 1 ; $06af
	.dsb 1 ; $06b0
	.dsb 1 ; $06b1
	.dsb 1 ; $06b2
	.dsb 1 ; $06b3
	.dsb 1 ; $06b4
	.dsb 1 ; $06b5
	.dsb 1 ; $06b6
	.dsb 1 ; $06b7
	.dsb 1 ; $06b8
	.dsb 1 ; $06b9
	.dsb 1 ; $06ba
	.dsb 1 ; $06bb
	.dsb 1 ; $06bc
PPUBuffer_6BD:
	.dsb 1 ; $06bd
	.dsb 1 ; $06be
	.dsb 1 ; $06bf
	.dsb 1 ; $06c0
	.dsb 1 ; $06c1
	.dsb 1 ; $06c2
	.dsb 1 ; $06c3
	.dsb 1 ; $06c4
	.dsb 1 ; $06c5
	.dsb 1 ; $06c6
	.dsb 1 ; $06c7
byte_RAM_6C8:
	.dsb 1 ; $06c8
	.dsb 1 ; $06c9
	.dsb 1 ; $06ca
	.dsb 1 ; $06cb
PPUBuffer_6CC:
	.dsb 1 ; $06cc
	.dsb 1 ; $06cd
	.dsb 1 ; $06ce
	.dsb 1 ; $06cf
	.dsb 1 ; $06d0
	.dsb 1 ; $06d1
	.dsb 1 ; $06d2
	.dsb 1 ; $06d3
	.dsb 1 ; $06d4
	.dsb 1 ; $06d5
	.dsb 1 ; $06d6
	.dsb 1 ; $06d7
	.dsb 1 ; $06d8
	.dsb 1 ; $06d9
PPUBuffer_6DA:
	.dsb 1 ; $06da
	.dsb 1 ; $06db
	.dsb 1 ; $06dc
	.dsb 1 ; $06dd
	.dsb 1 ; $06de
PPUBuffer_6DF:
	.dsb 1 ; $06df
	.dsb 1 ; $06e0
	.dsb 1 ; $06e1
	.dsb 1 ; $06e2
	.dsb 1 ; $06e3
PPUBuffer_6E4:
	.dsb 1 ; $06e4
	.dsb 1 ; $06e5
	.dsb 1 ; $06e6
	.dsb 1 ; $06e7
	.dsb 1 ; $06e8
PPUBuffer_6E9:
	.dsb 1 ; $06e9
	.dsb 1 ; $06ea
	.dsb 1 ; $06eb
	.dsb 1 ; $06ec
	.dsb 1 ; $06ed
	.dsb 1 ; $06ee
	.dsb 1 ; $06ef
	.dsb 1 ; $06f0
	.dsb 1 ; $06f1
MMC3PRGBankTemp:
	.dsb 1 ; $06f2

; Game milestone counter, probably used for debugging
;   $00 = Title screen
;   $01 = Gameplay
;   $02 = Contributors
;   $03 = Mario sleeping
GameMilestoneCounter:
	.dsb 1 ; $06f3

Player1JoypadUnk:
	.dsb 1 ; $06f4
Player2JoypadUnk:
	.dsb 1 ; $06f5
PlayerCurrentSize:
	.dsb 1 ; $06f6
BackgroundCHR1:
	.dsb 1 ; $06f7
BackgroundCHR2:
	.dsb 1 ; $06f8
SpriteCHR1:
	.dsb 1 ; $06f9
SpriteCHR2:
	.dsb 1 ; $06fa
SpriteCHR3:
	.dsb 1 ; $06fb
SpriteCHR4:
	.dsb 1 ; $06fc
BackgroundCHR2Timer:
	.dsb 1 ; $06fd
; FOR RENT
	.dsb 1 ; $06fe
; FOR RENT
	.dsb 1 ; $06ff

; When moving into subspace,  this area is turned into a tile represenation
; of the current screen as it will be shown (e.g. reversed, like in-game)
; Not sure if anything else uses this area yet
SubAreaTileLayout:
	.dsb $100   ; $0700-$07FF


;
; PPU registers
; $2000-$2007
;

PPUCTRL = $2000
PPUMASK = $2001
PPUSTATUS = $2002
OAMADDR = $2003
OAMDATA = $2004
PPUSCROLL = $2005
PPUADDR = $2006
PPUDATA = $2007

;
; APU registers and joypad registers
;  $4000-$4015         $4016-$4017
;

SQ1_VOL = $4000
SQ1_SWEEP = $4001
SQ1_LO = $4002
SQ1_HI = $4003

SQ2_VOL = $4004
SQ2_SWEEP = $4005
SQ2_LO = $4006
SQ2_HI = $4007

TRI_LINEAR = $4008
_APU_TRI_UNUSED = $4009
TRI_LO = $400a
TRI_HI = $400b

NOISE_VOL = $400c
_APU_NOISE_UNUSED = $400d
NOISE_LO = $400e
NOISE_HI = $400f

DMC_FREQ = $4010
DMC_RAW = $4011
DMC_START = $4012
DMC_LEN = $4013

OAM_DMA = $4014

SND_CHN = $4015

JOY1 = $4016
JOY2 = $4017

; Leftover code in prg-e-f references this
; (otherwise unused, since, well, not FDS)
FDS_WAVETABLE_VOL = $4080


;
; Expansion chip stuff for MMC5 support
; $5000-$5015
;

MMC5_PULSE1_VOL = $5000
MMC5_PULSE1_SWEEP = $5001
MMC5_PULSE1_LO = $5002
MMC5_PULSE1_HI = $5003

MMC5_PULSE2_VOL = $5004
MMC5_PULSE2_SWEEP = $5005
MMC5_PULSE2_LO = $5006
MMC5_PULSE2_HI = $5007

MMC5_PCM_MODE_IRQ = $5010
MMC5_RAW_PCM = $5011

MMC5_SND_CHN = $5015


;
; Cartridge on-board RAM
; Decoded level data is stored in memory here,
; as well as some other junk
; $6000-$7FFF
;

DecodedLevelData = $6000

; collision y data?
; byte_BANKF_F099 copied to RAM
; these various addrs are used(?) around prg-2-3
unk_RAM_7100 = $7100

byte_RAM_710B = $710b

unk_RAM_7114 = $7114

byte_RAM_711F = $711f

; collision x data?
unk_RAM_7128 = $7128

unk_RAM_713C = $713c

; MysteryData14439 copied to RAM
; Does anything read this???
unk_RAM_7150 = $7150

PPUBuffer_7168 = $7168
unk_RAM_716B = $716b
byte_RAM_717D = $717d
byte_RAM_717F = $717f
byte_RAM_7180 = $7180
byte_RAM_7181 = $7181
byte_RAM_7191 = $7191
byte_RAM_7192 = $7192

PPUBuffer_7194 = $7194
byte_RAM_71A6 = $71a6

PPUBuffer_71A8 = $71a8
byte_RAM_71AB = $71ab
byte_RAM_71AF = $71af

; byte_BANKA_84E1 copied to RAM
byte_RAM_71CC = $71cc

; byte_BANKF_F607 copied to RAM
unk_RAM_71D1 = $71d1

byte_RAM_71FE = $71fe

PPUBuffer_721B = $721b

byte_RAM_7222 = $7222

byte_RAM_7229 = $7229

byte_RAM_7232 = $7232

unk_RAM_7265 = $7265

unk_RAM_7266 = $7266

byte_RAM_7267 = $7267

unk_RAM_7268 = $7268

byte_RAM_726B = $726b

BonusChanceLayoutRAM = $7400

BonusChanceLayoutRAM2 = $7500

RawLevelData = $7800

RawJarData = $7a00

RawEnemyDataAddr = $7b00

;
; Extra enhancement support for 2P debug mode controls
; Spread around to some 'for rent' addresses
;
IFDEF CONTROLLER_2_DEBUG
	UpdateJoypadsTemp = $00c6
	CarryYOffsetsRAM = $7e00
	StatOffsetsRAM = $7e10
	ChangeCharacterTimer = $7e80
	ChangeCharacterPoofTimer = $7e81
	CreateObjectType = $7e82
	CreateObjectAttributes = $7e83
ENDIF

ItemCarryYOffsetsRAM = $7f00
