;
; Bank C & Bank D
; ===============
;
; What's inside:
;
;   - The ending sequence with Mario sleeping and the cast roll
;

.include "src/mario_dream/dream_ptr_table.asm"

; =============== S U B R O U T I N E =======================================

MarioDream_NegatePPUMask:
	LDA #0
	BEQ MarioDream_StorePPUMask

; End of function MarioDream_NegatePPUMask

; =============== S U B R O U T I N E =======================================

MarioDream_LoadPPUMask:
	LDA #PPUMask_ShowLeft8Pixels_BG | PPUMask_ShowLeft8Pixels_SPR | PPUMask_ShowBackground | PPUMask_ShowSprites

MarioDream_StorePPUMask:
	STA PPUMaskMirror

; End of function MarioDream_LoadPPUMask

; =============== S U B R O U T I N E =======================================

MarioDream_BufferDraw:
	LDA ScreenUpdateIndex
	ASL A
	TAX
	LDA MarioDream_Pointers, X
	STA RAM_PPUDataBufferPointer
	LDA MarioDream_Pointers + 1, X
	STA RAM_PPUDataBufferPointer + 1
	LDA #0
	STA NMIWaitFlag

MarioDream_WaitNMILoop:
	LDA NMIWaitFlag
	BPL MarioDream_WaitNMILoop

	RTS

; End of function MarioDream_BufferDraw

EnableNMI_BankC:
	LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite0000 | PPUCtrl_Background1000 | PPUCtrl_SpriteSize8x16 | PPUCtrl_NMIEnabled
	STA PPUCtrlMirror
	STA PPUCTRL
	RTS

DisableNMI_BankC:
	LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite0000 | PPUCtrl_Background1000 | PPUCtrl_SpriteSize8x16 | PPUCtrl_NMIDisabled
	STA PPUCTRL
	STA PPUCtrlMirror
	RTS

.include "src/mario_dream/dream_data.asm"

; ---------------------------------------------------------------------------
;; PlayerXHi ;; <Dream_SceneCounter> = PlayerXHi ;; How many times this part of the scene plays
;; ObjectXHi ;; <Dream_SleepFrame> = ObjectXHi ;; What visual Sleep frame is displayed 
;; ObjectXHi + 1 ;; <Dream_SleepCounter> = ObjectXHi + 1 ;; 
;; ObjectXHi + 2 ;; <Dream_BubbleSpriteFrameNum> = ObjectXHi + 2 ;; Clock for Sprite Num
;; ObjectXHi + 3 ;; <Dream_BubbleSpriteAnimDelay> = ObjectXHi + 3 ;; How Long before FrameNum increases

MarioSleepingScene:
	JSR MarioDream_NegatePPUMask

	LDA #VMirror
	JSR ChangeNametableMirroring

	JSR ClearNametablesAndSprites

	LDA #Stack100_Menu
	STA StackArea
	JSR EnableNMI_BankC

	JSR MarioDream_BufferDraw

	LDA #9
	STA ScreenUpdateIndex
	JSR MarioDream_BufferDraw

	LDA #1
	STA ScreenUpdateIndex
	JSR MarioDream_BufferDraw

	LDA #2
	STA ScreenUpdateIndex
	JSR MarioDream_BufferDraw

	LDA #$10
	STA ObjectXHi + 3 ;; <Dream_BubbleSpriteAnimDelay>
	LDA #4
	STA PlayerXHi ;; <Dream_SceneCounter>

MarioDream_DreamBubbleIntro:
	LDA #0
	STA ObjectXHi ;; <Dream_SleepFrame>
	LDA #$D
	STA ObjectXHi + 1 ;; <Dream_SleepCounter>
	LDA #0
	STA ObjectXHi + 2 ;; <Dream_BubbleSpriteFrameNum>
	JSR MarioDream_WriteBubbleSprites

	JSR MarioDream_LoadPPUMask

MarioDream_MarioSleepLoop:
	LDY ObjectXHi ;; <Dream_SleepFrame>
	LDA MarioDream_SnoringFrames, Y
	STA BackgroundCHR1
	CLC
	ADC #$02
	STA BackgroundCHR2
	LDA MarioDream_SnoringFrameCounts, Y
	STA byte_RAM_10 ;; <Dream_MarioSleepAnimDelay>

MarioDream_MarioSleepSceneWait:
	DEC ObjectXHi + 3 ;; <Dream_BubbleSpriteAnimDelay>
	BPL MarioDream_SkipBubbleAnim

	LDA #$10
	STA ObjectXHi + 3 ;; <Dream_BubbleSpriteAnimDelay>
	INC ObjectXHi + 2 ;; <Dream_BubbleSpriteFrameNum>
	JSR MarioDream_WriteBubbleSprites

MarioDream_SkipBubbleAnim:
	JSR MarioDream_BufferDraw

	DEC byte_RAM_10 ;; <Dream_MarioSleepAnimDelay>  
	BPL MarioDream_MarioSleepSceneWait

	INC ObjectXHi ;; <Dream_SleepFrame>
	DEC ObjectXHi + 1 ;; <Dream_SleepCounter>
	BPL MarioDream_MarioSleepLoop

	DEC PlayerXHi ;; <Dream_SceneCounter>
	BMI MarioDream_DreamPostBubble

	JMP MarioDream_DreamBubbleIntro

; ---------------------------------------------------------------------------

MarioDream_DreamPostBubble:
    ;; Remove all Bubble related graphics and sprites
	LDA #3 ;; DoNothing
	STA ScreenUpdateIndex
	LDA #$F8
	STA SpriteDMAArea
	STA SpriteDMAArea + 4
	STA SpriteDMAArea + 8
	STA SpriteDMAArea + $C
	JSR MarioDream_BufferDraw

	LDA #4 ;; EraseBubble...
	STA ScreenUpdateIndex
	JSR MarioDream_BufferDraw

	LDA #5
	STA ScreenUpdateIndex
	JSR MarioDream_BufferDraw

	LDA #6
	STA ScreenUpdateIndex
	JSR MarioDream_BufferDraw

	LDA #7
	STA ScreenUpdateIndex
	JSR MarioDream_BufferDraw

	LDA #8
	STA ScreenUpdateIndex
	JSR MarioDream_BufferDraw

    ;; Start Waking Scene
	LDA #0
	STA ObjectXHi ;; <Dream_SleepFrame>
	LDA #6
	STA ObjectXHi + 1 ;; <Dream_SleepCounter>
	LDA #0
	STA PlayerXHi ;; <Dream_SceneCounter>
	JSR MarioDream_LoadPPUMask

MarioDream_MarioWakeLoop:
	LDY ObjectXHi ;; <Dream_SleepFrame>
	LDA MarioDream_WakingFrames, Y
	STA BackgroundCHR1
	CLC
	ADC #$02
	STA BackgroundCHR2
	LDA MarioDream_WakingFrameCounts, Y
	STA byte_RAM_10 ;; <Dream_MarioSleepAnimDelay>

MarioDream_WakingMarioSceneWait:
	JSR MarioDream_BufferDraw

	DEC byte_RAM_10 ;; <Dream_MarioSleepAnimDelay>
	BPL MarioDream_WakingMarioSceneWait

	INC ObjectXHi ;; <Dream_SleepFrame>
	DEC ObjectXHi + 1 ;; <Dream_SleepCounter>
	BPL MarioDream_MarioWakeLoop

	LDA #$10
	STA ObjectXHi + 3 ;; <Dream_BubbleSpriteAnimDelay>
	LDA #1
	STA PlayerXHi ;; <Dream_SceneCounter>

MarioDream_MarioPreCreditSleep:
	LDA #0
	STA ObjectXHi ;; <Dream_SleepFrame>
	LDA #$D
	STA ObjectXHi + 1 ;; <Dream_SleepCounter>
	JSR MarioDream_LoadPPUMask

MarioDream_MarioPreCreditSleepLoop:
	LDY ObjectXHi ;; <Dream_SleepFrame>
	LDA MarioDream_SnoringFrames, Y
	STA BackgroundCHR1
	CLC
	ADC #$02
	STA BackgroundCHR2
	LDA MarioDream_SnoringFrameCounts, Y
	STA byte_RAM_10 ;; <Dream_MarioSleepAnimDelay>

MarioDream_MarioPreCreditSleepWait:
	JSR MarioDream_BufferDraw

	DEC byte_RAM_10 ;; <Dream_MarioSleepAnimDelay>
	BPL MarioDream_MarioPreCreditSleepWait

	INC ObjectXHi ;; <Dream_SleepFrame>

	DEC ObjectXHi + 1 ;; <Dream_SleepCounter>
	BPL MarioDream_MarioPreCreditSleepLoop

	DEC PlayerXHi ;; <Dream_SceneCounter>
	BMI MarioDream_CreditSleepScene

	JMP MarioDream_MarioPreCreditSleep

; ---------------------------------------------------------------------------

MarioDream_CreditSleepScene:
	JSR CastRoll_Setup

	JSR MarioDream_BufferDraw

MarioDream_CreditsSleepStart:
	LDA #0
	STA ObjectXHi ;; <Dream_SleepFrame>
	LDA #$D
	STA ObjectXHi + 1 ;; <Dream_SleepCounter>
	JSR MarioDream_LoadPPUMask

MarioDream_CreditsSleepLoop:
	LDY ObjectXHi ;; <Dream_SleepFrame>
	LDA MarioDream_SnoringFrames, Y
	STA BackgroundCHR1
	CLC
	ADC #$02
	STA BackgroundCHR2
	LDA MarioDream_SnoringFrameCounts, Y
	STA byte_RAM_10 ;; <Dream_MarioSleepAnimDelay>

MarioDream_CreditsSleepWait:
	JSR CastRoll_ScrollSprites

	JSR MarioDream_BufferDraw

	DEC byte_RAM_10 ;; <Dream_MarioSleepAnimDelay>
	BPL MarioDream_CreditsSleepWait

	INC ObjectXHi ;; <Dream_SleepFrame>
	DEC ObjectXHi + 1 ;; <Dream_SleepCounter>

	BPL MarioDream_CreditsSleepLoop
    
	JMP MarioDream_CreditsSleepStart

; =============== S U B R O U T I N E =======================================

MarioDream_WriteBubbleSprites:
	LDY #$F
	LDA ObjectXHi + 2 ;; <Dream_BubbleSpriteFrameNum>
	AND #1
	BNE MarioDream_WriteBubbleSprites_Frame2

MarioDream_WriteBubbleSprites_Frame1:
	LDA MarioDream_BubbleSprites, Y
	STA SpriteDMAArea, Y
	DEY
	BPL MarioDream_WriteBubbleSprites_Frame1 

	RTS

; ---------------------------------------------------------------------------

MarioDream_WriteBubbleSprites_Frame2:
	LDA MarioDream_BubbleSprites2, Y
	STA SpriteDMAArea, Y
	DEY
	BPL MarioDream_WriteBubbleSprites_Frame2

	RTS

; End of function MarioDream_WriteBubbleSprites

; ---------------------------------------------------------------------------
CastRoll_PaletteFadeIn:
	.db $22
	.db $32
	.db $30
; ---------------------------------------------------------------------------

CastRoll_ScrollSprites:
	INC ObjectXLo + 5 ;; <Cast_Clock>
	LDA ObjectXLo + 5 ;; <Cast_Clock>
	AND #1
	BNE CastRoll_SkipScrollStep ;; ?

	DEC ObjectYLo + 6 ;; of 3 activate credits sprites, these are their Y (?) values ;; starts at 21
	DEC ObjectYLo + 7 ;; determines if they're free to be written over by another sprite
	DEC ObjectYLo + 8

CastRoll_SkipScrollStep:
	LDA ObjectXLo 
	JSR JumpToTableAfterJump

; ---------------------------------------------------------------------------
	.dw CastRoll_FadeCASTText
	.dw CastRoll_CASTTextPause
	.dw CastRoll_CASTTextScroll
	.dw CastRoll_CreditSlot1 ;;3
	.dw CastRoll_LoadWartSprites ;;4
	.dw CastRoll_WartScroll ;;5
	.dw CastRoll_WartLaugh ;;6
	.dw CastRoll_FadeSprites ;;7 ??
	.dw CastRoll_FadeSprites2 ;; ??
	.dw CastRoll_LoadEndSprites ;; ??
	.dw CastRoll_AnimateEndSprite
; ---------------------------------------------------------------------------
	RTS

; ---------------------------------------------------------------------------
CastRoll_CASTText:
	.db $60,$D4,$00,$28
	.db $60,$D0,$00,$38 ; 4
	.db $60,$F4,$00,$48 ; 8
	.db $60,$F6,$00,$58 ; $C

; =============== S U B R O U T I N E =======================================

CastRoll_SpriteLoadPtrSequential:
	LDY ObjectXLo + 2 ;; <Cast_SpriteNum> 
	LDA CastRoll_SpritePointersLo, Y
	STA ObjectXLo + 6 ;; <Cast_SpritePLo>
	LDA CastRoll_SpritePointersHi, Y
	STA ObjectXLo + 7 ;; <Cast_SpritePHi>
	INC ObjectXLo + 2 ;; <Cast_SpriteNum>
	RTS

; End of function CastRoll_SpriteLoadPtrSequential

; =============== S U B R O U T I N E =======================================

CastRoll_Setup:
	LDY #CHRBank_EndingCast1
	STY SpriteCHR1
	INY
	STY SpriteCHR2
	INY
	STY SpriteCHR3
	INY
	STY SpriteCHR4
	LDX #$07
	LDA #$20
	STA PlayerYHi ;; <Cast_SpriteXPos?>
	LDY #$00

CastRoll_SetupLoop1: ;; hi sprites
	LDA #$0F
	STA SpriteDMAArea, Y
	INY
	LDA #$3E
	STA SpriteDMAArea, Y
	INY
	LDA #$00
	STA SpriteDMAArea, Y
	INY
	LDA PlayerYHi ;; <Cast_SpriteXPos?>
	STA SpriteDMAArea, Y
	INY
	CLC
	ADC #$08
	STA PlayerYHi ;; <Cast_SpriteXPos?>
	DEX
	BPL CastRoll_SetupLoop1

	LDX #$07
	LDA #$20
	STA PlayerYHi ;; <Cast_SpriteXPos?>

CastRoll_SetupLoop2: ;; low sprites
	LDA #$D0
	STA SpriteDMAArea, Y
	INY
	LDA #$3E
	STA SpriteDMAArea, Y
	INY
	LDA #$00
	STA SpriteDMAArea, Y
	INY
	LDA PlayerYHi ;; <Cast_SpriteXPos?>
	STA SpriteDMAArea, Y
	INY
	CLC
	ADC #$08
	STA PlayerYHi ;; <Cast_SpriteXPos?>
	DEX
	BPL CastRoll_SetupLoop2

	LDX #$0F ;; CastRoll_CastStart

CastRoll_PPUTextLoop:
	LDA CastRoll_CASTText, X
	STA SpriteDMAArea + $40, X
	DEX
	BPL CastRoll_PPUTextLoop

	LDA #$3F
	STA PPUBuffer_301
	LDA #$11
	STA PPUBuffer_301 + 1
	LDA #$01
	STA PPUBuffer_301 + 2
	LDA #$12
	STA PPUBuffer_301 + 3
	LDA #$00
	STA PPUBuffer_301 + 4
	LDA #$10
	STA PlayerXLo ;; <Cast_StateTimer>
	LDA #$00
	STA ObjectXLo ;; <Cast_CurrentCreditsBehavior>
	STA ObjectXLo + 1 ;; <Cast_StateTimerInner>
	LDY #$40

CastRoll_SetupLoop3:
	LDA #EnemyState_27 ; @TODO what is this
	STA EnemyState - 1, Y ;; <Cast_StartVarSomething?> 
	DEY
	BPL CastRoll_SetupLoop3

	RTS

; End of function CastRoll_Setup

; ---------------------------------------------------------------------------

CastRoll_FadeCASTText:
	DEC PlayerXLo ;; <Cast_StateTimer>
	BPL CastRoll_FadeCASTTestEnd

	LDA #$10
	STA PlayerXLo ;; <Cast_StateTimer>
	LDA #$3F
	STA PPUBuffer_301
	LDA #$11
	STA PPUBuffer_301 + 1
	LDA #$01
	STA PPUBuffer_301 + 2
	LDY ObjectXLo + 1 ;; <Cast_StateTimerInner>
	LDA CastRoll_PaletteFadeIn, Y
	STA PPUBuffer_301 + 3

	LDA #$00
	STA PPUBuffer_301 + 4
	INC ObjectXLo + 1 ;; <Cast_StateTimerInner>
	LDA ObjectXLo + 1 ;; <Cast_StateTimerInner>
	CMP #$03
	BNE CastRoll_FadeCASTTestEnd

	INC ObjectXLo ;; <Cast_CurrentCreditsBehavior> ;;
	LDA #$80
	STA PlayerXLo ;; <Cast_StateTimer>
	LDA #$60
	STA ObjectYHi
	LDA #$01
	STA ObjectYLo + 2 ;; <Cast_OnScreenSlot1>
	STA ObjectYLo + 5
	LDA #$00
	STA ObjectYLo + 3 ;; <Cast_OnScreenSlot2>
	STA ObjectYLo + 4 ;; <Cast_OnScreenSlot3>

CastRoll_FadeCASTTestEnd:
	RTS

; ---------------------------------------------------------------------------

CastRoll_CASTTextPause:
	DEC PlayerXLo ;; <Cast_StateTimer>
	BPL CastRoll_CASTTextPauseEnd

	INC ObjectXLo ;; <Cast_CurrentCreditsBehavior>
	LDA #0
	STA ObjectXLo + 2 ;; <Cast_SpriteNum>
	STA ObjectXVelocity + 2
	LDA #1
	STA ObjectYLo + 7

CastRoll_CASTTextPauseEnd:
	RTS

; ---------------------------------------------------------------------------

CastRoll_CASTTextScroll:
	LDA ObjectXLo + 5 ;; <Cast_Clock>
	AND #1

	BEQ CastRoll_CreditSlot1

	LDA ObjectYHi
	SEC
	SBC #1
	STA ObjectYHi
	STA SpriteDMAArea + $40
	STA SpriteDMAArea + $44
	STA SpriteDMAArea + $48
	STA SpriteDMAArea + $4C
	LDA ObjectYHi
	CMP #$10
	BNE CastRoll_CreditSlot1

	LDA #$F8
	STA SpriteDMAArea + $40
	STA SpriteDMAArea + $44
	STA SpriteDMAArea + $48
	STA SpriteDMAArea + $4A
	INC ObjectXLo ;; <Cast_CurrentCreditsBehavior>
	LDA #0
	STA ObjectYLo + 5
	STA ObjectYLo + 2 ;; <Cast_OnScreenSlot1>

CastRoll_CreditSlot1:
    ;; Check slots to see if we're allowed to load a sprite set over those coordinates
	LDA ObjectYLo + 2 ;; <Cast_OnScreenSlot1>
	BNE CastRoll_CreditSlot2

	LDA ObjectYLo + 6
	BNE CastRoll_CreditSlot2

	JSR CastRoll_SpriteLoadPtrSequential

	LDY #$3F

CastRoll_CSlotLoad1Loop:
	LDA (ObjectXLo+6), Y ;; <Cast_SpritePLo>
	STA SpriteDMAArea + $40, Y
	DEY
	BPL CastRoll_CSlotLoad1Loop

	LDA #1
	STA ObjectYLo + 2 ;; <Cast_OnScreenSlot1>
	LDA #$D0
	STA ObjectYHi
	LDA #$E0
	STA ObjectYHi + 1
	LDA #$F8
	STA ObjectYHi + 2

CastRoll_CreditSlot2:
	LDA ObjectYLo + 3 ;; <Cast_OnScreenSlot2>
	BNE CastRoll_CreditSlot3

	LDA ObjectYLo + 7
	BNE CastRoll_CreditSlot3

	JSR CastRoll_SpriteLoadPtrSequential

	LDY #$3F

CastRoll_CSlotLoad2Loop:
	LDA (ObjectXLo+6), Y ;; <Cast_SpritePLo> 
	STA SpriteDMAArea + $80, Y
	DEY
	BPL CastRoll_CSlotLoad2Loop

	LDA #1
	STA ObjectYLo + 3 ;; <Cast_OnScreenSlot2>
	LDA #$D0
	STA ObjectYHi + 3
	LDA #$E0
	STA ObjectYHi + 4
	LDA #$F8
	STA ObjectYHi + 5

CastRoll_CreditSlot3:
	LDA ObjectYLo + 4 ;; <Cast_OnScreenSlot3>
	BNE loc_BANKC_8693

	LDA ObjectYLo + 8
	BNE loc_BANKC_8693

	JSR CastRoll_SpriteLoadPtrSequential

	LDY #$3F

CastRoll_CSlotLoad3Loop:
	LDA (ObjectXLo+6), Y ;; <Cast_SpritePLo> 
	STA SpriteDMAArea + $C0, Y
	DEY
	BPL CastRoll_CSlotLoad3Loop

	LDA #1
	STA ObjectYLo + 4 ;; <Cast_OnScreenSlot3>
	LDA #$D0
	STA ObjectYHi + 6
	LDA #$E0
	STA ObjectYHi + 7
	LDY #$F8
	LDA ObjectXLo + 2 ;; <Cast_SpriteNum>
	CMP #$1D
	BNE loc_BANKC_8691

	LDY #$F0

loc_BANKC_8691:
	STY ObjectYHi + 8

loc_BANKC_8693:
	LDA ObjectYLo + 5
	BEQ loc_BANKC_869A

	JMP loc_BANKC_873A

; ---------------------------------------------------------------------------

loc_BANKC_869A:
	LDA ObjectXLo + 5 ;; <Cast_Clock>
	AND #1
	BNE loc_BANKC_86A3

	JMP loc_BANKC_873A

; ---------------------------------------------------------------------------

loc_BANKC_86A3:
	LDA SpriteDMAArea + $40
	CMP #$F8
	BEQ loc_BANKC_86C3

	LDA ObjectYHi
	SEC
	SBC #1
	CMP #$10
	BNE loc_BANKC_86B5

	LDA #$F8

loc_BANKC_86B5:
	STA ObjectYHi
	STA SpriteDMAArea + $40
	STA SpriteDMAArea + $44
	STA SpriteDMAArea + $48
	STA SpriteDMAArea + $4C

loc_BANKC_86C3:
	LDA SpriteDMAArea + $50
	CMP #$F8
	BEQ loc_BANKC_86F2

	DEC ObjectYHi + 1
	CMP #$F9
	BNE loc_BANKC_86D6

	LDA ObjectYHi + 1
	CMP #$D0
	BNE loc_BANKC_86F2

loc_BANKC_86D6:
	LDA ObjectYHi + 1
	CMP #$10
	BNE loc_BANKC_86E6

	LDA ObjectXLo + 2 ;; <Cast_SpriteNum>
	CMP #$FF
	BNE loc_BANKC_86E4

	INC ObjectXLo ;; <Cast_CurrentCreditsBehavior>

loc_BANKC_86E4:
	LDA #$F8

loc_BANKC_86E6:
	STA SpriteDMAArea + $50
	STA SpriteDMAArea + $54
	STA SpriteDMAArea + $58
	STA SpriteDMAArea + $5C

loc_BANKC_86F2:
	LDA SpriteDMAArea + $60
	CMP #$F8
	BEQ loc_BANKC_873A

	DEC ObjectYHi + 2
	CMP #$F9
	BNE loc_BANKC_870C

	LDA ObjectYHi + 2
	CMP #$D0
	BNE loc_BANKC_873A

	LDY ObjectXLo + 2 ;; <Cast_SpriteNum>
	LDA EnemyState - 1, Y ;; <Cast_StartVarSomething?>
	STA ObjectYLo + 7

loc_BANKC_870C:
	LDA ObjectYHi + 2
	CMP #$10
	BNE loc_BANKC_8722

	LDA #0
	STA ObjectYLo + 2 ;; <Cast_OnScreenSlot1>
	LDA ObjectXLo + 2 ;; <Cast_SpriteNum>
	CMP #$FF
	BNE loc_BANKC_8720

	LDA #$FF
	STA ObjectYLo + 2 ;; <Cast_OnScreenSlot1>

loc_BANKC_8720:
	LDA #$F8

loc_BANKC_8722:
	STA SpriteDMAArea + $60
	STA SpriteDMAArea + $64
	STA SpriteDMAArea + $68
	STA SpriteDMAArea + $6C
	STA SpriteDMAArea + $70
	STA SpriteDMAArea + $74
	STA SpriteDMAArea + $78
	STA SpriteDMAArea + $7C

loc_BANKC_873A:
	LDA ObjectXLo + 5 ;; <Cast_Clock>
	AND #1
	BNE loc_BANKC_8743

	JMP loc_BANKC_87D2

; ---------------------------------------------------------------------------

loc_BANKC_8743:
	LDA SpriteDMAArea + $80
	CMP #$F8
	BEQ loc_BANKC_8763

	LDA ObjectYHi + 3

loc_BANKC_874C:
	SEC
	SBC #1
	CMP #$10
	BNE loc_BANKC_8755

	LDA #$F8

loc_BANKC_8755:
	STA ObjectYHi + 3
	STA SpriteDMAArea + $80
	STA SpriteDMAArea + $84
	STA SpriteDMAArea + $88
	STA SpriteDMAArea + $8C

loc_BANKC_8763:
	LDA SpriteDMAArea + $90
	CMP #$F8
	BEQ loc_BANKC_878A

	DEC ObjectYHi + 4
	CMP #$F9
	BNE loc_BANKC_8776

	LDA ObjectYHi + 4
	CMP #$D0
	BNE loc_BANKC_878A

loc_BANKC_8776:
	LDA ObjectYHi + 4
	CMP #$10
	BNE loc_BANKC_877E

	LDA #$F8

loc_BANKC_877E:
	STA SpriteDMAArea + $90
	STA SpriteDMAArea + $94

loc_BANKC_8784:
	STA SpriteDMAArea + $98
	STA SpriteDMAArea + $9C

loc_BANKC_878A:
	LDA SpriteDMAArea + $A0
	CMP #$F8
	BEQ loc_BANKC_87D2

	DEC ObjectYHi + 5
	CMP #$F9
	BNE loc_BANKC_87A4

	LDA ObjectYHi + 5
	CMP #$D0
	BNE loc_BANKC_87D2

	LDY ObjectXLo + 2 ;; <Cast_SpriteNum>
	LDA EnemyState - 1, Y ;; <Cast_StartVarSomething?>
	STA ObjectYLo + 8

loc_BANKC_87A4:
	LDA ObjectYHi + 5
	CMP #$10
	BNE loc_BANKC_87BA

loc_BANKC_87AA:
	LDA #0
	STA ObjectYLo + 3 ;; <Cast_OnScreenSlot2>
	LDA ObjectXLo + 2 ;; <Cast_SpriteNum>
	CMP #$FF
	BNE loc_BANKC_87B8

	LDA #$FF
	STA ObjectYLo + 3 ;; <Cast_OnScreenSlot2>

loc_BANKC_87B8:
	LDA #$F8

loc_BANKC_87BA:
	STA SpriteDMAArea + $A0
	STA SpriteDMAArea + $A4
	STA SpriteDMAArea + $A8
	STA SpriteDMAArea + $AC
	STA SpriteDMAArea + $B0
	STA SpriteDMAArea + $B4
	STA SpriteDMAArea + $B8
	STA SpriteDMAArea + $BC

loc_BANKC_87D2:
	LDA ObjectXLo + 5 ;; <Cast_Clock>
	AND #1
	BNE loc_BANKC_87DB

	JMP locret_BANKC_8897

; ---------------------------------------------------------------------------

loc_BANKC_87DB:
	LDA SpriteDMAArea + $C0
	CMP #$F8
	BEQ loc_BANKC_87FB

	LDA ObjectYHi + 6
	SEC
	SBC #1
	CMP #$10
	BNE loc_BANKC_87ED

	LDA #$F8

loc_BANKC_87ED:
	STA ObjectYHi + 6
	STA SpriteDMAArea + $C0
	STA SpriteDMAArea + $C4
	STA SpriteDMAArea + $C8
	STA SpriteDMAArea + $CC

loc_BANKC_87FB:
	LDA SpriteDMAArea + $D0
	CMP #$F8
	BEQ loc_BANKC_8822

	DEC ObjectYHi + 7
	CMP #$F9
	BNE loc_BANKC_880E

	LDA ObjectYHi + 7
	CMP #$D0
	BNE loc_BANKC_8822

loc_BANKC_880E:
	LDA ObjectYHi + 7
	CMP #$10
	BNE loc_BANKC_8816

	LDA #$F8

loc_BANKC_8816:
	STA SpriteDMAArea + $D0
	STA SpriteDMAArea + $D4
	STA SpriteDMAArea + $D8
	STA SpriteDMAArea + $DC

loc_BANKC_8822:
	LDA SpriteDMAArea + $E0
	CMP #$F8
	BEQ locret_BANKC_8897

	DEC ObjectYHi + 8
	CMP #$F9
	BNE loc_BANKC_883C

	LDA ObjectYHi + 8
	CMP #$D0
	BNE locret_BANKC_8897

	LDY ObjectXLo + 2 ;; <Cast_SpriteNum>
	LDA EnemyState - 1, Y ;; <Cast_StartVarSomething?>
	STA ObjectYLo + 6

loc_BANKC_883C:
	LDA ObjectXLo + 2 ;; <Cast_SpriteNum>
	CMP #$1D
	BNE loc_BANKC_884C

	LDA ObjectYHi + 8
	CMP #$B8
	BNE loc_BANKC_884C

	LDA #1
	STA ObjectXVelocity + 2

loc_BANKC_884C:
	LDA ObjectYHi + 8
	CMP #$10
	BNE loc_BANKC_8862

	LDA #0
	STA ObjectYLo + 4 ;; <Cast_OnScreenSlot3>
	LDA ObjectXLo + 2 ;; <Cast_SpriteNum>
	CMP #$FF
	BNE loc_BANKC_8860

	LDA #$FF
	STA ObjectYLo + 4 ;; <Cast_OnScreenSlot3>

loc_BANKC_8860:
	LDA #$F8

loc_BANKC_8862:
	STA SpriteDMAArea + $E0
	STA SpriteDMAArea + $E4
	STA SpriteDMAArea + $E8
	STA SpriteDMAArea + $EC
	STA SpriteDMAArea + $F0
	STA SpriteDMAArea + $F4
	STA SpriteDMAArea + $F8
	STA SpriteDMAArea + $FC
	LDA ObjectXVelocity + 2
	BEQ locret_BANKC_8897

	LDY #$1F

loc_BANKC_8880:
	LDA CastRoll_TriclydeText, Y
	STA SpriteDMAArea + $40, Y
	DEY
	BPL loc_BANKC_8880

	LDA #$D0
	STA ObjectYHi
	STA ObjectYHi + 1
	LDA #0
	STA ObjectXVelocity + 2

loc_BANKC_8893:
	LDA #$FF
	STA ObjectXLo + 2 ;; <Cast_SpriteNum>

locret_BANKC_8897:
	RTS

; ---------------------------------------------------------------------------

CastRoll_LoadWartSprites:
	LDY #$48
	STY SpriteCHR1
	INY
	STY SpriteCHR2
	INY
	STY SpriteCHR3
	INY
	STY SpriteCHR4
	LDY #$5B

CastRoll_LoadWartSpriteLoop:
	LDA CastRoll_Wart, Y
	STA SpriteDMAArea + $40, Y
	DEY
	BPL CastRoll_LoadWartSpriteLoop

	INC ObjectXLo ;; <Cast_CurrentCreditsBehavior>
	LDY #0
	LDX #$F
	LDA #$C0

CastRoll_SetWartEndCoordinatesMaybe:
	STA SpriteDMAArea + 1, Y
	INY
	INY
	INY
	INY
	DEX
	BPL CastRoll_SetWartEndCoordinatesMaybe

	LDA #$D0
	STA ObjectYHi
	LDA #$E0
	STA ObjectYHi + 1
	LDA #$F0
	STA ObjectYHi + 2
	LDA #8
	STA ObjectYHi + 3
	RTS

; ---------------------------------------------------------------------------

CastRoll_WartScroll:
	LDA ObjectXLo + 5 ;; <Cast_Clock>
	AND #1
	BNE loc_BANKC_88E0

	JMP loc_BANKC_898D

; ---------------------------------------------------------------------------

loc_BANKC_88E0:
	LDA SpriteDMAArea + $40
	CMP #$F8
	BEQ loc_BANKC_8906

	LDA ObjectYHi
	SEC
	SBC #1
	CMP #$50
	BNE loc_BANKC_88F5

	INC ObjectXLo ;; <Cast_CurrentCreditsBehavior>
	JMP loc_BANKC_898D

; ---------------------------------------------------------------------------

loc_BANKC_88F5:
	STA ObjectYHi
	STA SpriteDMAArea + $40
	STA SpriteDMAArea + $44
	STA SpriteDMAArea + $48
	STA SpriteDMAArea + $4C
	STA SpriteDMAArea + $50

loc_BANKC_8906:
	LDA SpriteDMAArea + $54
	CMP #$F8
	BEQ loc_BANKC_8930

	DEC ObjectYHi + 1
	CMP #$F9
	BNE loc_BANKC_8919

	LDA ObjectYHi + 1
	CMP #$D0
	BNE loc_BANKC_8930

loc_BANKC_8919:
	LDA ObjectYHi + 1
	CMP #$10
	BNE loc_BANKC_8921

	LDA #$F8

loc_BANKC_8921:
	STA SpriteDMAArea + $54
	STA SpriteDMAArea + $58
	STA SpriteDMAArea + $5C
	STA SpriteDMAArea + $60
	STA SpriteDMAArea + $64

loc_BANKC_8930:
	LDA SpriteDMAArea + $68
	CMP #$F8
	BEQ loc_BANKC_895A

	DEC ObjectYHi + 2
	CMP #$F9
	BNE loc_BANKC_8943

	LDA ObjectYHi + 2
	CMP #$D0
	BNE loc_BANKC_895A

loc_BANKC_8943:
	LDA ObjectYHi + 2
	CMP #$10
	BNE loc_BANKC_894B

	LDA #$F8

loc_BANKC_894B:
	STA SpriteDMAArea + $68
	STA SpriteDMAArea + $6C
	STA SpriteDMAArea + $70
	STA SpriteDMAArea + $74
	STA SpriteDMAArea + $78

loc_BANKC_895A:
	LDA SpriteDMAArea + $7C
	CMP #$F8
	BEQ loc_BANKC_898D

	DEC ObjectYHi + 3
	CMP #$F9
	BNE loc_BANKC_896D

	LDA ObjectYHi + 3
	CMP #$D0
	BNE loc_BANKC_898D

loc_BANKC_896D:
	LDA ObjectYHi + 3
	CMP #$10
	BNE loc_BANKC_8975

	LDA #$F8

loc_BANKC_8975:
	STA SpriteDMAArea + $7C
	STA SpriteDMAArea + $80
	STA SpriteDMAArea + $84
	STA SpriteDMAArea + $88
	STA SpriteDMAArea + $8C
	STA SpriteDMAArea + $90
	STA SpriteDMAArea + $94
	STA SpriteDMAArea + $98

loc_BANKC_898D:
	LDA #0
	STA ObjectXVelocity
	STA PlayerXVelocity
	LDA #$C
	STA ObjectXVelocity + 1
	RTS

; ---------------------------------------------------------------------------
WartLaugh_FrameData1:
	.db $9E
	.db $A0
	.db $A2
	.db $A4
	.db $88
	.db $A6
	.db $A8
	.db $AA
	.db $AC
	.db $92
	.db $94
	.db $96
	.db $98
	.db $9A
	.db $9C
WartLaugh_FrameData2:
	.db $AE
	.db $B0
	.db $B2
	.db $B4
	.db $BE
	.db $B6
	.db $B8
	.db $BA
	.db $BC
	.db $92
	.db $94
	.db $96
	.db $98
	.db $9A
	.db $9C
; ---------------------------------------------------------------------------

CastRoll_WartLaugh:
	DEC PlayerXVelocity
	BPL CastRoll_WartLaughEnd

	LDA #8
	STA PlayerXVelocity
	DEC ObjectXVelocity + 1
	BPL CR_WartLaugh1

    ;; Otherwise, Jump to Next Credits State

	INC ObjectXLo ;; <Cast_CurrentCreditsBehavior>
	LDA #0
	STA PlayerXLo ;; <Cast_StateTimer>
	STA ObjectXLo + 1 ;; <Cast_StateTimerInner>
	JMP CastRoll_WartLaughEnd

; ---------------------------------------------------------------------------

CR_WartLaugh1:
	LDA ObjectXVelocity
	AND #1
	BNE CR_WartLaugh2

	LDY #0
	LDX #0

CastRoll_WartLaughFrame1CopyLoop:
	INC ObjectXVelocity
	LDA WartLaugh_FrameData1, X
	STA SpriteDMAArea + $41, Y
	INY
	INY
	INY
	INY
	INX
	CPX #$F
	BNE CastRoll_WartLaughFrame1CopyLoop

	JMP CastRoll_WartLaughEnd

; ---------------------------------------------------------------------------

CR_WartLaugh2:
	INC ObjectXVelocity
	LDX #0
	LDY #0

CastRoll_WartLaughFrame2CopyLoop:
	LDA WartLaugh_FrameData2, X
	STA SpriteDMAArea + $41, Y
	INY
	INY
	INY
	INY
	INX
	CPX #$F
	BNE CastRoll_WartLaughFrame2CopyLoop

CastRoll_WartLaughEnd:
	RTS

; ---------------------------------------------------------------------------
CastRoll_PaletteFadeOut:
	.db $32
	.db $22
	.db $12
; ---------------------------------------------------------------------------

CastRoll_FadeSprites:
	DEC PlayerXLo ;; <Cast_StateTimer>
	BPL CastRoll_FadeSprites_End

	LDA #$10
	STA PlayerXLo ;; <Cast_StateTimer>
	LDA #$3F
	STA PPUBuffer_301
	LDA #$11
	STA PPUBuffer_301 + 1
	LDA #$01
	STA PPUBuffer_301 + 2
	LDY ObjectXLo + 1 ;; <Cast_StateTimerInner>
	LDA CastRoll_PaletteFadeOut, Y
	STA PPUBuffer_301 + 3
	LDA #$00
	STA PPUBuffer_301 + 4
	INC ObjectXLo + 1 ;; <Cast_StateTimerInner>
	LDA ObjectXLo + 1 ;; <Cast_StateTimerInner>
	CMP #$03
	BNE CastRoll_FadeSprites_End

	INC ObjectXLo ;; <Cast_CurrentCreditsBehavior>
	LDA #$16
	STA PlayerXLo ;; <Cast_StateTimer>

CastRoll_FadeSprites_End:
	RTS

; ---------------------------------------------------------------------------

CastRoll_FadeSprites2: ;; ?
	DEC PlayerXLo ;; <Cast_StateTimer>
	BPL locret_BANKC_8A51

	LDX #$16
	LDY #0
	LDA #$F8

loc_BANKC_8A41:
	STA SpriteDMAArea + $40, Y
	INY
	INY
	INY
	INY
	DEX
	BPL loc_BANKC_8A41

	LDA #$30
	STA PlayerXLo ;; <Cast_StateTimer>

loc_BANKC_8A4F:
	INC ObjectXLo ;; <Cast_CurrentCreditsBehavior>

locret_BANKC_8A51:
	RTS

; ---------------------------------------------------------------------------

CastRoll_LoadEndSprites: ;; ?
	DEC PlayerXLo ;; <Cast_StateTimer>
	BPL locret_BANKC_8A81

	LDA #$00
	STA ObjectXHi + 4
	STA ObjectXHi + 5

loc_BANKC_8A5C:
	STA ObjectXHi + 6
	LDA #$05
	STA ObjectXHi + 7
	LDA #$14
	STA ObjectXHi + 8
	LDA #$3F
	STA PPUBuffer_301
	LDA #$11
	STA PPUBuffer_301 + 1
	LDA #$01
	STA PPUBuffer_301 + 2
	LDA #$30
	STA PPUBuffer_301 + 3
	LDA #$00
	STA PPUBuffer_301 + 4
	INC ObjectXLo ;; <Cast_CurrentCreditsBehavior>

locret_BANKC_8A81:
	RTS

; ---------------------------------------------------------------------------

CastRoll_AnimateEndSprite:
	LDA ObjectXHi + 5
	AND #$80
	BNE locret_BANKC_8ACC

	LDA ObjectXHi + 5
	BNE loc_BANKC_8ACD

	DEC ObjectXHi + 7
	BPL locret_BANKC_8ACC

	LDA #5
	STA ObjectXHi + 7
	LDA #3
	STA ObjectXHi + 6
	LDX #0
	LDY ObjectXHi + 4

loc_BANKC_8A9C:
	LDA #$40
	STA SpriteDMAArea, X
	INX
	LDA byte_BANKC_92FE, Y
	STA SpriteDMAArea, X
	INY
	INX
	LDA #0
	STA SpriteDMAArea, X
	INX
	LDA byte_BANKC_92FE, Y
	STA SpriteDMAArea, X
	INY
	INX
	DEC ObjectXHi + 6
	BPL loc_BANKC_8A9C

	STY ObjectXHi + 4
	DEC ObjectXHi + 8
	BPL locret_BANKC_8ACC

	INC ObjectXHi + 5
	LDA #$12
	STA ObjectXHi + 8
	LDA #0
	STA ObjectXHi + 4

locret_BANKC_8ACC:
	RTS

; ---------------------------------------------------------------------------

loc_BANKC_8ACD:
	DEC ObjectXHi + 7
	BPL locret_BANKC_8B07

	LDA #5
	STA ObjectXHi + 7
	LDA #3
	STA ObjectXHi + 6
	LDX #0
	LDY ObjectXHi + 4

loc_BANKC_8ADD:
	LDA #$40
	STA SpriteDMAArea + $10, X
	INX
	LDA byte_BANKC_93A6, Y
	STA SpriteDMAArea + $10, X
	INY
	INX
	LDA #0
	STA SpriteDMAArea + $10, X
	INX
	LDA byte_BANKC_93A6, Y
	STA SpriteDMAArea + $10, X
	INY
	INX
	DEC ObjectXHi + 6
	BPL loc_BANKC_8ADD

	STY ObjectXHi + 4
	DEC ObjectXHi + 8
	BPL locret_BANKC_8B07

	LDA #$FF
	STA ObjectXHi + 5

locret_BANKC_8B07:
	RTS

; ---------------------------------------------------------------------------

.include "src/mario_dream/castroll_data.asm"
