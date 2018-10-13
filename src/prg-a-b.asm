;
; Bank A & Bank B
; ===============
;
; What's inside:
;
;   - Level title card background data and palettes
;   - Bonus chance background data and palettes
;   - Character select palettes
;   - Character data (physics, palettes, etc.)
;   - Character stats bootstrapping
;

;
; This title card is used for every world from 1 to 6.
; The only difference is the loaded CHR banks.
;
World1thru6TitleCard:
      .BYTE $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
      .BYTE $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB ; $10
      .BYTE $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB ; $20
      .BYTE $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB ; $30
      .BYTE $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB ; $40
      .BYTE $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB ; $50
      .BYTE $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC ; $60
      .BYTE $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD ; $70
      .BYTE $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF ; $80
      .BYTE $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE ; $90

;
; This one is the special one used for World 7
;
World7TitleCard:
      .BYTE $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
      .BYTE $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB ; $10
      .BYTE $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB ; $20
      .BYTE $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB ; $30
      .BYTE $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $CA, $FC, $FC, $FC, $FC, $CC, $FB, $FB ; $40
      .BYTE $FB, $FB, $B1, $B3, $C0, $C1, $FB, $FB, $CA, $FC, $FC, $FC, $FC, $CC, $FB, $FB ; $50
      .BYTE $A8, $AC, $AA, $AC, $AA, $AC, $AA, $AC, $AA, $AC, $AA, $AC, $AA, $AC, $AA, $AE ; $60
      .BYTE $A9, $AD, $AB, $AD, $AB, $AD, $AB, $AD, $AB, $AD, $AB, $AD, $AB, $AD, $AB, $AF ; $70
      .BYTE $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB ; $80
      .BYTE $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB ; $90

BonusChanceLayout:
      .BYTE $20, $00, $60, $FD
      .BYTE $20, $20, $60, $FD
      .BYTE $20, $40, $60, $FD
      .BYTE $20, $60, $60, $FD
      .BYTE $23, $40, $60, $FD
      .BYTE $23, $60, $60, $FD
      .BYTE $23, $80, $60, $FD
      .BYTE $23, $A0, $60, $FD
      .BYTE $20, $80, $D6, $FD
      .BYTE $20, $81, $D6, $FD
      .BYTE $20, $82, $D6, $FD
      .BYTE $20, $9D, $D6, $FD
      .BYTE $20, $9E, $D6, $FD
      .BYTE $20, $9F, $D6, $FD

      .BYTE $20, $68, $10
      .BYTE $48, $4A, $4C, $4E, $50, $51, $52, $53, $54, $55, $56, $57, $58, $5A, $5C, $5E

      .BYTE $20, $83, $09, $FD, $FD, $22, $23, $24, $49, $4B, $4D, $4F
      .BYTE $20, $94, $09, $59, $5B, $5D, $5F, $2E, $2F, $30, $FD, $FD
      .BYTE $20, $A3, $04, $FD, $25, $26, $27
      .BYTE $20, $B9, $04, $31, $32, $33, $FD
      .BYTE $20, $C3, $04, $FD, $28, $29, $2A
      .BYTE $20, $D9, $04, $34, $35, $36, $FD
      .BYTE $20, $E3, $03, $2B, $2C, $2D
      .BYTE $20, $FA, $03, $37, $38, $39
      .BYTE $21, $03, $02, $3A, $3B
      .BYTE $21, $1B, $02, $40, $41
      .BYTE $21, $23, $D0, $3C
      .BYTE $21, $3C, $D0, $42
      .BYTE $22, $02, $02, $3E, $3F
      .BYTE $22, $1C, $02, $61, $62
      .BYTE $22, $22, $02, $43, $44
      .BYTE $22, $3C, $02, $63, $64
      .BYTE $22, $43, $01, $45
      .BYTE $22, $5C, $01, $65
      .BYTE $22, $C4, $02, $A6, $A8
      .BYTE $22, $E4, $02, $A7, $A9
      .BYTE $22, $FA, $04, $80, $82, $88, $8A
      .BYTE $23, $04, $02, $90, $92
      .BYTE $23, $14, $02, $9E, $A0
      .BYTE $23, $1A, $04, $81, $83, $89, $8B
      .BYTE $23, $23, $03, $46, $91, $93
      .BYTE $23, $2A, $02, $A2, $A4

      .BYTE $23, $2E, $10
      .BYTE $67, $6C, $6E, $70, $72, $69, $9F, $A1, $75, $98, $9A, $FB, $84, $86, $8C, $8E

      .BYTE $23, $43, $1B
      .BYTE $47, $94, $96, $74, $74, $74, $74, $A3, $A5, $74, $66, $68, $6D, $6F, $71, $73
      .BYTE $6A, $6B, $74, $74, $99, $9B, $74, $85, $87, $8D, $8F

      .BYTE $23, $64, $05, $95, $97, $FD, $AA, $AB
      .BYTE $23, $77, $05, $9C, $9D, $AA, $AB, $AB
      .BYTE $23, $89, $02, $AA, $AB
      .BYTE $20, $C9, $0E, $78, $AC, $B0, $B4, $B7, $BA, $FB, $BC, $BE, $C1, $C4, $C7, $CB, $7C

      .BYTE $20, $E8, $10
      .BYTE $1C, $79, $AD, $B1, $B5, $B8, $BB, $FB, $BD, $BF, $C2, $C5, $C8, $CC, $7D, $1E

      .BYTE $21, $08, $10
      .BYTE $1D, $7A, $AE, $B2, $B6, $B9, $FB, $FB, $FB, $C0, $C3, $C6, $C9, $CD, $7E, $1F

      .BYTE $21, $29, $03, $7B, $AF, $B3
      .BYTE $21, $34, $03, $CA, $CE, $7F
      .BYTE $21, $6A, $0C, $14, $10, $10, $16, $14, $10, $10, $16, $14, $10, $10, $16
      .BYTE $21, $8A, $0C, $11, $FC, $FC, $12, $11, $FC, $FC, $12, $11, $FC, $FC, $12
      .BYTE $21, $AA, $0C, $11, $FC, $FC, $12, $11, $FC, $FC, $12, $11, $FC, $FC, $12
      .BYTE $21, $CA, $0C, $15, $13, $13, $17, $15, $13, $13, $17, $15, $13, $13, $17
      .BYTE $22, $0D, $02, $18, $1A
      .BYTE $22, $2D, $02, $19, $1B
      .BYTE $23, $D2, $04, $80, $A0, $A0, $20
      .BYTE $23, $DA, $04, $88, $AA, $AA, $22
      .BYTE $23, $E4, $01, $0A
      .BYTE $23, $EA, $05, $A0, $A0, $A0, $A0, $20
      .BYTE $00


;
; Copies the Bonus Chance PPU data
;
; This copies in two $100 byte chunks, the second of which includes extra data
; that is never used because of the terminating $00
;
CopyBonusChanceLayoutToRAM:
      LDY     #$00
CopyBonusChanceLayoutToRAM_Loop1:
      LDA     BonusChanceLayout,Y ; Blindly copy $100 bytes from $8140 to $7400
      STA     BonusChanceLayoutRAM,Y
      DEY
      BNE     CopyBonusChanceLayoutToRAM_Loop1

      LDY     #$00
CopyBonusChanceLayoutToRAM_Loop2:
      ; Blindly copy $100 more bytes from $8240 to $7500
      ; That range includes this code! clap. clap.
      LDA     BonusChanceLayout+$100,Y
      STA     BonusChanceLayoutRAM2,Y
      DEY
      BNE     CopyBonusChanceLayoutToRAM_Loop2

      RTS

; =============== S U B R O U T I N E =======================================

DrawTitleCardWorldImage:
      LDA     CurrentWorld
      CMP     #6
      BEQ     loc_BANKA_8392 ; Special case for World 7's title card

      LDA     #$25
      STA     byte_RAM_0
      LDA     #$C8
      STA     byte_RAM_1
      LDY     #0

loc_BANKA_8338:
      LDX     #$F
      LDA     PPUSTATUS
      LDA     byte_RAM_0
      STA     PPUADDR

loc_BANKA_8342:
      LDA     byte_RAM_1
      STA     PPUADDR

loc_BANKA_8347:
      LDA     World1thru6TitleCard,Y
      STA     PPUDATA
      INY
      DEX
      BPL     loc_BANKA_8347

      CPY     #$A0
      BCS     loc_BANKA_8364

      LDA     byte_RAM_1
      ADC     #$20
      STA     byte_RAM_1
      LDA     byte_RAM_0
      ADC     #0
      STA     byte_RAM_0
      JMP     loc_BANKA_8338

; ---------------------------------------------------------------------------

loc_BANKA_8364:
      LDA     CurrentWorld
      CMP     #1
      BEQ     loc_BANKA_8371

      CMP     #5
      BEQ     loc_BANKA_8371

      BNE     loc_BANKA_8389

loc_BANKA_8371:
      AND     #$80
      BNE     loc_BANKA_8389

      LDA     #$26
      STA     byte_RAM_0
      LDA     #$88
      STA     byte_RAM_1
      LDA     CurrentWorld
      ORA     #$80
      STA     CurrentWorld
      LDY     #$80
      BNE     loc_BANKA_8338

loc_BANKA_8389:
      LDA     CurrentWorld
      AND     #$F
      STA     CurrentWorld
      RTS

; ---------------------------------------------------------------------------

loc_BANKA_8392:
      LDA     #$25
      STA     byte_RAM_0
      LDA     #$C8
      STA     byte_RAM_1
      LDY     #0

loc_BANKA_839C:
      LDX     #$F
      LDA     PPUSTATUS
      LDA     byte_RAM_0
      STA     PPUADDR
      LDA     byte_RAM_1
      STA     PPUADDR

loc_BANKA_83AB:
      LDA     World7TitleCard,Y
      STA     PPUDATA
      INY
      DEX
      BPL     loc_BANKA_83AB

      CPY     #$A0
      BCS     locret_BANKA_83C8

      LDA     byte_RAM_1
      ADC     #$20
      STA     byte_RAM_1
      LDA     byte_RAM_0
      ADC     #0
      STA     byte_RAM_0
      JMP     loc_BANKA_839C

; ---------------------------------------------------------------------------

locret_BANKA_83C8:
      RTS

; End of function DrawTitleCardWorldImage

StatOffsets:
      .BYTE (MarioStats - CharacterStats)
      .BYTE (PrincessStats - CharacterStats)
      .BYTE (ToadStats - CharacterStats)
      .BYTE (LuigiStats - CharacterStats)

CharacterStats:
MarioStats:
      .BYTE $00 ; Pick-up Speed, frame 1/6 - pulling
      .BYTE $04 ; Pick-up Speed, frame 2/6 - pulling
      .BYTE $02 ; Pick-up Speed, frame 3/6 - ducking
      .BYTE $01 ; Pick-up Speed, frame 4/6 - ducking
      .BYTE $04 ; Pick-up Speed, frame 5/6 - ducking
      .BYTE $07 ; Pick-up Speed, frame 6/6 - ducking
      .BYTE $B0 ; Jump Speed, still - no object
      .BYTE $B0 ; Jump Speed, still - with object
      .BYTE $98 ; Jump Speed, charged - no object
      .BYTE $98 ; Jump Speed, charged - with object
      .BYTE $A6 ; Jump Speed, running - no object
      .BYTE $AA ; Jump Speed, running - with object
      .BYTE $E0 ; Jump Speed - in quicksand
      .BYTE $00 ; Floating Time
      .BYTE $07 ; Gravity without Jump button pressed
      .BYTE $04 ; Gravity with Jump button pressed
      .BYTE $08 ; Gravity in quicksand
      .BYTE $18 ; Running Speed, right - no object
      .BYTE $18 ; Running Speed, right - with object
      .BYTE $04 ; Running Speed, right - in quicksand
      .BYTE $E8 ; Running Speed, left - no object
      .BYTE $E8 ; Running Speed, left - with object
      .BYTE $FC ; Running Speed, left - in quicksand

ToadStats:
      .BYTE $00 ; Pick-up Speed, frame 1/6 - pulling
      .BYTE $01 ; Pick-up Speed, frame 2/6 - pulling
      .BYTE $01 ; Pick-up Speed, frame 3/6 - ducking
      .BYTE $01 ; Pick-up Speed, frame 4/6 - ducking
      .BYTE $01 ; Pick-up Speed, frame 5/6 - ducking
      .BYTE $02 ; Pick-up Speed, frame 6/6 - ducking
      .BYTE $B2 ; Jump Speed, still - no object
      .BYTE $B2 ; Jump Speed, still - with object
      .BYTE $98 ; Jump Speed, charged - no object
      .BYTE $98 ; Jump Speed, charged - with object
      .BYTE $AD ; Jump Speed, running - no object
      .BYTE $AD ; Jump Speed, running - with object
      .BYTE $E0 ; Jump Speed - in quicksand
      .BYTE $00 ; Floating Time
      .BYTE $07 ; Gravity without Jump button pressed
      .BYTE $04 ; Gravity with Jump button pressed
      .BYTE $08 ; Gravity in quicksand
      .BYTE $18 ; Running Speed, right - no object
      .BYTE $1D ; Running Speed, right - with object
      .BYTE $04 ; Running Speed, right - in quicksand
      .BYTE $E8 ; Running Speed, left - no object
      .BYTE $E3 ; Running Speed, left - with object
      .BYTE $FC ; Running Speed, left - in quicksand

LuigiStats:
      .BYTE $00 ; Pick-up Speed, frame 1/6 - pulling
      .BYTE $04 ; Pick-up Speed, frame 2/6 - pulling
      .BYTE $02 ; Pick-up Speed, frame 3/6 - ducking
      .BYTE $01 ; Pick-up Speed, frame 4/6 - ducking
      .BYTE $04 ; Pick-up Speed, frame 5/6 - ducking
      .BYTE $07 ; Pick-up Speed, frame 6/6 - ducking
      .BYTE $D6 ; Jump Speed, still - no object
      .BYTE $D6 ; Jump Speed, still - with object
      .BYTE $C9 ; Jump Speed, charged - no object
      .BYTE $C9 ; Jump Speed, charged - with object
      .BYTE $D0 ; Jump Speed, running - no object
      .BYTE $D4 ; Jump Speed, running - with object
      .BYTE $E0 ; Jump Speed - in quicksand
      .BYTE $00 ; Floating Time
      .BYTE $02 ; Gravity without Jump button pressed
      .BYTE $01 ; Gravity with Jump button pressed
      .BYTE $08 ; Gravity in quicksand
      .BYTE $18 ; Running Speed, right - no object
      .BYTE $16 ; Running Speed, right - with object
      .BYTE $04 ; Running Speed, right - in quicksand
      .BYTE $E8 ; Running Speed, left - no object
      .BYTE $EA ; Running Speed, left - with object
      .BYTE $FC ; Running Speed, left - in quicksand

PrincessStats:
      .BYTE $00 ; Pick-up Speed, frame 1/6 - pulling
      .BYTE $06 ; Pick-up Speed, frame 2/6 - pulling
      .BYTE $04 ; Pick-up Speed, frame 3/6 - ducking
      .BYTE $02 ; Pick-up Speed, frame 4/6 - ducking
      .BYTE $06 ; Pick-up Speed, frame 5/6 - ducking
      .BYTE $0C ; Pick-up Speed, frame 6/6 - ducking
      .BYTE $B3 ; Jump Speed, still - no object
      .BYTE $B3 ; Jump Speed, still - with object
      .BYTE $98 ; Jump Speed, charged - no object
      .BYTE $98 ; Jump Speed, charged - with object
      .BYTE $AC ; Jump Speed, running - no object
      .BYTE $B3 ; Jump Speed, running - with object
      .BYTE $E0 ; Jump Speed - in quicksand
      .BYTE $3C ; Floating Time
      .BYTE $07 ; Gravity without Jump button pressed
      .BYTE $04 ; Gravity with Jump button pressed
      .BYTE $08 ; Gravity in quicksand
      .BYTE $18 ; Running Speed, right - no object
      .BYTE $15 ; Running Speed, right - with object
      .BYTE $04 ; Running Speed, right - in quicksand
      .BYTE $E8 ; Running Speed, left - no object
      .BYTE $EB ; Running Speed, left - with object
      .BYTE $FC ; Running Speed, left - in quicksand

CharacterPalette:
MarioPalette:
      .BYTE $0F,$01,$16,$27
PrincessPalette:
      .BYTE $0F,$06,$25,$36
ToadPalette:
      .BYTE $0F,$01,$30,$27
LuigiPalette:
      .BYTE $0F,$01,$2A,$36

MysteryData14439:
      .BYTE $DF
      .BYTE $EF
      .BYTE $F7
      .BYTE $FB
      .BYTE $00
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $AF
      .BYTE $D7
      .BYTE $EB
      .BYTE $F5
      .BYTE $FB
      .BYTE $F7
      .BYTE $EF
      .BYTE $DF
      .BYTE $00
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $F5
      .BYTE $EB
      .BYTE $D7
      .BYTE $AF


;
; This copies the selected character's stats
; into memory for use later, but also a bunch
; of other unrelated crap like the
; Bonus Chance slot reels (???) and
; god knows what else.
;
CopyCharacterStatsAndStuff:
IFDEF CONTROLLER_2_DEBUG
      JSR     CopyCharacterStats
ENDIF

      LDX     CurrentCharacter
      LDY     StatOffsets,X
      LDX     #$00
loc_BANKA_8458:
      LDA     CharacterStats,Y
      STA     CharacterStatsRAM,X
      INY
      INX
      CPX     #$17
      BCC     loc_BANKA_8458

      LDA     CurrentCharacter
      ASL     A
      ASL     A
      TAY
      LDX     #$00
loc_BANKA_846B:
      LDA     CharacterPalette,Y
      STA     RestorePlayerPalette0,X
      INY
      INX
      CPX     #$04
      BCC     loc_BANKA_846B

      LDY     #$4C
loc_BANKA_8479:
      LDA     PlayerSelectPalettes,Y
      STA     PPUBuffer_55F,Y
      DEY
      CPY     #$FF
      BNE     loc_BANKA_8479

      LDY     #$B6
loc_BANKA_8486:
      LDA     BonusChanceReel1Order,Y
      STA     SlotMachineReelOrder1RAM,Y
      DEY
      CPY     #$FF
      BNE     loc_BANKA_8486

      LDY     #$63
loc_BANKA_8493:
      LDA     Text_Unknown5,Y
      STA     PPUBuffer_7168,Y
      DEY
      CPY     #$FF
      BNE     loc_BANKA_8493

      LDY     #$17
loc_BANKA_84A0:
      LDA     MysteryData14439,Y
      STA     unk_RAM_7150,Y
      DEY
      BPL     loc_BANKA_84A0

      LDY     #$4F
loc_BANKA_84AB:
      LDA     byte_BANKF_F099,Y
      STA     unk_RAM_7100,Y
      DEY
      BPL     loc_BANKA_84AB

      LDY     #$03
loc_BANKA_84B6:
      LDA     byte_BANKA_84E1,Y
      STA     byte_RAM_71CC,Y
      DEY
      BPL     loc_BANKA_84B6

      ; Collision data
      LDY     #$49
loc_BANKA_84C1:
      LDA     byte_BANKF_F607,Y
      STA     unk_RAM_71D1,Y
      DEY
      BPL     loc_BANKA_84C1

      LDY     #$20
loc_BANKA_84CC:
      LDA     EndOfLevelDoor,Y
      STA     PPUBuffer_721B,Y
      DEY
      BPL     loc_BANKA_84CC

      LDY     #$06
loc_BANKA_84D7:
      LDA     byte_BANKA_84E5,Y
      STA     unk_RAM_7265,Y
      DEY
      BPL     loc_BANKA_84D7

      RTS

; End of function CopyCharacterStatsAndStuff

; ---------------------------------------------------------------------------
byte_BANKA_84E1:
      .BYTE $00
      .BYTE $01
      .BYTE $FF
      .BYTE $00

byte_BANKA_84E5:
      .BYTE $00
      .BYTE $E0
      .BYTE $FF
      .BYTE $D0
      .BYTE $00
      .BYTE $E0
      .BYTE $FF

PlayerSelectPalettes:
      .BYTE $3F,$00,$20,$0F ; $00
      .BYTE $28,$16,$06,$0F ; $04
      .BYTE $30,$12,$16,$0F ; $08
      .BYTE $30,$16,$12,$0F ; $0C
      .BYTE $30,$12,$16,$0F ; $10
      .BYTE $22,$12,$01,$0F ; $14
      .BYTE $22,$12,$01,$0F ; $18
      .BYTE $22,$12,$01,$0F ; $1C
      .BYTE $22,$12,$01,$00 ; $20
BonusChanceText_X_1:
      .BYTE $22,$30,$03,$EA,$FB,$D1
BonusChanceText_EXTRA_LIFE_1:
      .BYTE $22,$C9,$0F,$DE,$F1,$ED,$EB,$DA,$FB,$E5,$E2,$DF,$DE,$F9,$F9
      .BYTE $F9,$FB,$D1,$00 ; $0F
BonusChanceBackgroundPalettes:
      .BYTE $0F,$27,$17,$07 ; $00
      .BYTE $0F,$37,$16,$12 ; $04
      .BYTE $0F,$30,$10,$00 ; $08
      .BYTE $0F,$21,$12,$01 ; $0C
BonusChanceReel1Order:
      .BYTE Slot_Snifit ; $00
      .BYTE Slot_Turnip ; $01 ; Graphics exist for a mushroom (not used)
      .BYTE Slot_Star   ; $02
      .BYTE Slot_Turnip ; $03
      .BYTE Slot_Snifit ; $04
      .BYTE Slot_Star   ; $05
      .BYTE Slot_Cherry ; $06
      .BYTE Slot_Turnip ; $07
BonusChanceReel2Order:
      .BYTE Slot_Star   ; $00
      .BYTE Slot_Snifit ; $01
      .BYTE Slot_Cherry ; $02
      .BYTE Slot_Snifit ; $03
      .BYTE Slot_Turnip ; $04
      .BYTE Slot_Star   ; $05
      .BYTE Slot_Snifit ; $06
      .BYTE Slot_Turnip ; $07
BonusChanceReel3Order:
      .BYTE Slot_Star   ; $00
      .BYTE Slot_Snifit ; $01
      .BYTE Slot_Star   ; $02
      .BYTE Slot_Turnip ; $03
      .BYTE Slot_Star   ; $04
      .BYTE Slot_Cherry ; $05
      .BYTE Slot_Turnip ; $06
      .BYTE Slot_Snifit ; $07
BonusChanceUnusedCoinSprite:
      .BYTE $F8,$19,$01,$60,$F8,$1B,$01,$68
BonusChanceUnusedImajinHead:
      .BYTE $CB,$B0,$00,$A0,$CB,$B0,$40,$A8
BonusChanceUnusedLinaHead:
      .BYTE $CB,$B2,$00,$A0,$CB,$B2,$40,$A8
BonusChanceUnusedMamaHead:
      .BYTE $CB,$B6,$00,$A0,$CB,$B6,$40,$A8
BonusChanceUnusedPapaHead:
      .BYTE $CB,$B4,$00,$A0,$CB,$B4,$40,$A8
BonusChanceUnused_Blank20C6:
      .BYTE $20,$C6,$14,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB
      .BYTE $FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$00 ; $0F
BonusChanceText_NO_BONUS:
      .BYTE $22,$86,$14,$FB,$FB,$FB,$FB,$FB,$FB,$E7,$E8,$FB,$DB,$E8,$E7
      .BYTE $EE,$EC,$FB,$FB,$FB,$FB,$FB,$FB,$00 ; $0F
BonusChanceText_PUSH_A_BUTTON:
      .BYTE $22,$89,$0E,$E9,$EE,$EC,$E1,$FB,$0E,$F,$FB,$DB,$EE,$ED,$ED,$E8
      .BYTE $E7,$00 ; $10
BonusChanceText_PLAYER_1UP:
      .BYTE $22,$8B,$0B,$E9,$E5,$DA,$F2,$DE,$EB,$FB,$FB,$D1,$EE,$E9,$00
Text_PAUSE:
      .BYTE $25,$ED,$05,$E9,$DA,$EE,$EC,$DE
Text_Unknown:
      .BYTE $27,$DB,$02,$AA,$AA,$00
Text_Unknown2:
      .BYTE $22,$86,$54,$FB,$00
Text_Unknown3:
      .BYTE $22,$AA,$4D,$FB,$00
Text_Unknown4:
      .BYTE $22,$EB,$4B,$FB,$00
Text_PAUSE_Erase:
      .BYTE $25,$ED,$05,$FB,$FB,$FB,$FB,$FB,$00
Text_Unknown5:
      .BYTE $25,$0E,$07,$FB,$FB,$FB,$FB,$FB,$FB,$FB ; This one is actually used, just not sure what for
Text_WORLD_1_1:
      .BYTE $24,$CA,$0B,$FB,$F0,$E8,$EB,$E5,$DD,$FB,$FB,$D1,$F3,$D1
Text_EXTRA_LIFE_0:
      .BYTE $23,$48,$10,$DE,$F1,$ED,$EB,$DA,$FB,$E5,$E2,$DF,$DE,$F9,$F9
      .BYTE $F9,$FB,$FB,$D0,$00 ; $0F
Text_WARP:
      .BYTE $21,$8E,$04,$F0,$DA,$EB,$E9

; Doki Doki Panic pseudo-leftover
; This actually has extra spaces on either end:
; "-WORLD-" ... It originally said "CHAPTER"
Text_WORLD_1:
      .BYTE $22,$0C,$09,$FB,$F0,$E8,$EB,$E5,$DD,$FB,$FB,$D1,$00
Text_Unknown6:
      .BYTE $21,$6A,$01,$FB
Text_Unknown7:
      .BYTE $21,$AA,$01,$FB,$00
Text_Unknown8:
      .BYTE $21,$97,$C6,$FB,$00
UnusedText_THANK_YOU:
      .BYTE $21,$0C,$09,$ED,$E1,$3A,$E7,$E4,$FB,$F2,$E8,$EE
UnusedText_Blank214D:
      .BYTE $21,$4D,$06,$FB,$FB,$FB,$FB,$FB,$FB,$00

IFDEF CONTROLLER_2_DEBUG
;
; Copies all character stats to RAM for hot-swapping the current character
;
CopyCharacterStats:
      LDX     #(MysteryData14439 - StatOffsets - 1)
CopyCharacterStats_Loop:
      LDA     StatOffsets,X
      STA     StatOffsetsRAM,X
      DEX
      BPL     CopyCharacterStats_Loop

      RTS
ENDIF


IFDEF DEBUG
      .include "src/extras/debug-a.asm"
ENDIF
