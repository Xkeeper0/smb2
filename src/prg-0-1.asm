;
; Bank 0 & Bank 1
; ===============
;
; What's inside:
;
;   - Title screen
;   - Player controls
;   - Player state handling
;   - Enemy handling
;

;
; Initializes a vertical area
;
InitializeAreaVertical:
	LDA byte_RAM_502
	BNE loc_BANK0_805D

	LDA #HMirror
	JSR ChangeNametableMirroring

	LDA CurrentLevelEntryPage
	BNE loc_BANK0_8013

loc_BANK0_800F:
	LDA #$09
	BNE loc_BANK0_8016

loc_BANK0_8013:
	SEC
	SBC #$01

loc_BANK0_8016:
	ORA #$C0
	STA BackgroundUpdateBoundaryBackward
	SEC
	SBC #$40
	STA BackgroundUpdateBoundary
	LDA CurrentLevelEntryPage

loc_BANK0_8022:
	CLC
	ADC #$01
	CMP #$0A
	BNE loc_BANK0_802B

	LDA #$00

loc_BANK0_802B:
	ORA #$10
	STA BackgroundUpdateBoundaryForward
	LDA CurrentLevelEntryPage
	LDY #$00
	JSR ResetPPUScrollHi

	LDA #$20
	STA DrawBackgroundTilesPPUAddrLoBackward
	LDA #$60
	STA DrawBackgroundTilesPPUAddrLoForward

	; Set the flag for the initial screen render
	INC byte_RAM_502

	; Initialize the PPU update boundary
	LDA #$E0
	STA byte_RAM_E2
	LDA #$01
	STA byte_RAM_E4
	STA byte_RAM_53A
	LSR A
	STA DrawBackgroundTilesPPUAddrLo

	; Set the screen y-position
	LDY CurrentLevelEntryPage
	JSR PageHeightCompensation
	STA ScreenYLo
	STY ScreenYHi

	; Cue player transition
	JSR ApplyAreaTransition

loc_BANK0_805D:
	LDA #$00
	STA byte_RAM_6
	LDA #$FF
	STA byte_RAM_505
	LDA #$A0
	STA PPUScrollCheckLo

	JSR sub_BANK0_823D

	LDA byte_RAM_53A
	BNE InitializeAreaVertical_Exit

	; Initial screen render is complete
	INC BreakStartLevelLoop

	LDA #$E8
	STA byte_RAM_E1
	LDA #$C8
	STA byte_RAM_E2

	LDA #$00
	STA byte_RAM_502

InitializeAreaVertical_Exit:
	RTS


;
; Applies vertical screen scrolling if `DetermineVerticalScroll` indicated that
; it was necessary.
;
ApplyVerticalScroll:
	LDA NeedsScroll
	AND #%00000100
	BNE loc_BANK0_809D

	;	Not currently in a scroll interval
	LDA NeedsScroll
	AND #%00000111
	BNE loc_BANK0_8092

	JMP loc_BANK0_819C

; ---------------------------------------------------------------------------

loc_BANK0_8092:
	LDA NeedsScroll
	ORA #%00000100
	STA NeedsScroll
	LDA #$12
	STA CameraScrollTiles

loc_BANK0_809D:
	LDA NeedsScroll
	LSR A
	LDA PPUScrollYMirror
	BCC loc_BANK0_8103

	BNE loc_BANK0_80B1

	LDA BackgroundUpdateBoundaryBackward
	AND #$0F
	CMP #$09
	BNE loc_BANK0_80B1

	JMP loc_BANK0_819C

; ---------------------------------------------------------------------------

loc_BANK0_80B1:
	LDA #$01
	JSR SetObjectLocks

	LDA PPUScrollYMirror
	SEC
	SBC #$04
	STA PPUScrollYMirror
	LDA ScreenYLo
	SEC
	SBC #$04
	STA ScreenYLo
	BCS loc_BANK0_80C8

	DEC ScreenYHi

loc_BANK0_80C8:
	LDA PPUScrollYMirror
	CMP #$FC
	BNE loc_BANK0_80DB

	LDA #$EC
	STA PPUScrollYMirror
	LDA PPUScrollYHiMirror
	EOR #$02
	STA PPUScrollYHiMirror
	LSR A
	STA PPUScrollXHiMirror

loc_BANK0_80DB:
	LDA PPUScrollYMirror
	AND #$07
	BEQ loc_BANK0_80E2

	RTS

; ---------------------------------------------------------------------------

loc_BANK0_80E2:
	LDX #$00
	JSR loc_BANK0_8287

	INX
	JSR loc_BANK0_8287

	LDA PPUScrollYMirror
	AND #$0F
	BNE loc_BANK0_80FB

	LDX #$00
	JSR DecrementVerticalScrollRow

	LDX #$01
	JSR DecrementVerticalScrollRow

loc_BANK0_80FB:
	LDX #$01
	JSR PrepareBackgroundDrawing_Vertical

	JMP loc_BANK0_8170

; ---------------------------------------------------------------------------

loc_BANK0_8103:
	BNE loc_BANK0_8121

	LDA CurrentLevelPages
	STA byte_RAM_F
	CMP #$09
	BNE loc_BANK0_8114

	LDA #$00
	STA byte_RAM_F
	BEQ loc_BANK0_8116

loc_BANK0_8114:
	INC byte_RAM_F

loc_BANK0_8116:
	LDA BackgroundUpdateBoundaryForward
	AND #$0F
	CMP byte_RAM_F
	BNE loc_BANK0_8121

	JMP loc_BANK0_819C

; ---------------------------------------------------------------------------

loc_BANK0_8121:
	LDA #$01
	JSR SetObjectLocks

	LDA PPUScrollYMirror
	CLC
	ADC #$04
	STA PPUScrollYMirror
	LDA ScreenYLo
	CLC
	ADC #$04
	STA ScreenYLo
	BCC loc_BANK0_8138

	INC ScreenYHi

loc_BANK0_8138:
	LDA PPUScrollYMirror
	AND #$07
	BEQ loc_BANK0_813F

	RTS

; ---------------------------------------------------------------------------

loc_BANK0_813F:
	LDA PPUScrollYMirror
	CMP #$F0
	BNE loc_BANK0_8152

	LDA #$00
	STA PPUScrollYMirror
	LDA PPUScrollYHiMirror
	EOR #$02
	STA PPUScrollYHiMirror
	LSR A
	STA PPUScrollXHiMirror

loc_BANK0_8152:
	LDX #$02
	JSR sub_BANK0_828F

	DEX
	JSR sub_BANK0_828F

	LDA DrawBackgroundTilesPPUAddrLoForward
	AND #$20
	BNE loc_BANK0_816B

	LDX #$02
	JSR IncrementVerticalScrollRow

	LDX #$01
	JSR IncrementVerticalScrollRow

loc_BANK0_816B:
	LDX #$02
	JSR PrepareBackgroundDrawing_Vertical

loc_BANK0_8170:
	LDA CameraScrollTiles
	CMP #$12
	BNE loc_BANK0_818F

	LDA #$01
	STA byte_RAM_E4
	LDA NeedsScroll
	LSR A
	BCC loc_BANK0_8186

; up
	LDX #$01
	LDA #$00
	BEQ loc_BANK0_818A

; down
loc_BANK0_8186:
	LDX #$02
	LDA #$10

loc_BANK0_818A:
	STA byte_RAM_1
	JSR sub_BANK0_8314

loc_BANK0_818F:
	; Update PPU for scrolling
	JSR CopyBackgroundToPPUBuffer_Vertical

	DEC CameraScrollTiles
	BNE locret_BANK0_81A0

	LDA #$00
	JSR SetObjectLocks

loc_BANK0_819C:
	LDA #$00
	STA NeedsScroll

locret_BANK0_81A0:
	RTS


; ---------------------------------------------------------------------------
	.db $01


;
; Stashes screen scrolling information so that it can be restored after leaving
; the pause screen
;
StashScreenScrollPosition:
	LDA PPUScrollYMirror
	STA PPUScrollYMirror_Backup
	LDA PPUScrollXMirror
	STA PPUScrollXMirror_Backup
	LDA PPUScrollYHiMirror
	STA PPUScrollYHiMirror_Backup
	LDA PPUScrollXHiMirror
	STA PPUScrollXHiMirror_Backup
	LDA ScreenYHi
	STA ScreenYHi_Backup
	LDA ScreenYLo
	STA ScreenYLo_Backup
	LDA ScreenBoundaryLeftHi
	STA ScreenBoundaryLeftHi_Backup
	LDA byte_RAM_E1
	STA byte_RAM_517
	LDA #$00
	STA PPUScrollYMirror
	STA PPUScrollXMirror
	STA PPUScrollYHiMirror
	STA PPUScrollXHiMirror
	RTS


RestoreScreenScrollPosition:
	LDA PPUScrollYMirror_Backup
	STA PPUScrollYMirror
	LDA PPUScrollXMirror_Backup
	STA PPUScrollXMirror
	STA ScreenBoundaryLeftLo
	LDA PPUScrollYHiMirror_Backup
	STA PPUScrollYHiMirror
	LDA PPUScrollXHiMirror_Backup
	STA PPUScrollXHiMirror
	LDA ScreenBoundaryLeftHi_Backup
	STA ScreenBoundaryLeftHi
	LDA ScreenYHi_Backup
	STA ScreenYHi
	LDA ScreenYLo_Backup
	STA ScreenYLo
	RTS


; Used for redrawing the screen in a vertical area after unpausing
sub_BANK0_81FE:
	LDA BackgroundUpdateBoundaryBackward
	AND #$10
	BEQ loc_BANK0_820B

	LDA byte_RAM_E1
	SEC
	SBC #$08
	STA byte_RAM_E1

loc_BANK0_820B:
	LDA #$01
	STA byte_RAM_E4
	LDA BackgroundUpdateBoundaryBackward
	STA BackgroundUpdateBoundary
	LDA #$10
	STA byte_RAM_1
	LDX #$00
	JSR sub_BANK0_8314

	LDA DrawBackgroundTilesPPUAddrLoBackward
	STA DrawBackgroundTilesPPUAddrLo
	LDA byte_RAM_E1
	STA byte_RAM_E2
	LDX #$01
	JSR sub_BANK0_846A

	LDA #$F0
	STA PPUScrollCheckHi
	STA PPUScrollCheckLo
	LDA BackgroundUpdateBoundaryForward
	STA byte_RAM_505
	INC byte_RAM_D5
	LDA #$01
	STA byte_RAM_6
	RTS


; Used for redrawing the background tiles in a vertical area
sub_BANK0_823D:
	; Clear the flag to indicate that we're drawing
	LDX #$00
	STX byte_RAM_537

	JSR PrepareBackgroundDrawing_Vertical

	; Update PPU for area init
	JSR CopyBackgroundToPPUBuffer_Vertical

	LDX #$00
	JSR sub_BANK0_828F

	LDA PPUScrollCheckHi
	CMP DrawBackgroundTilesPPUAddrHi
	BNE loc_BANK0_8277

	LDA PPUScrollCheckLo
	CLC
	ADC #$20
	CMP DrawBackgroundTilesPPUAddrLo
	BNE loc_BANK0_8277

loc_BANK0_825E:
	LDA byte_RAM_6
	TAX
	BEQ loc_BANK0_8268

	LDA byte_RAM_517
	STA byte_RAM_E1

loc_BANK0_8268:
	; Set the flag to indicate that we've finished drawing
	INC byte_RAM_537

	LDA #$00
	STA byte_RAM_53A, X
	STA byte_RAM_53D
	STA byte_RAM_53E

	RTS

; ---------------------------------------------------------------------------

loc_BANK0_8277:
	LDA DrawBackgroundTilesPPUAddrLo
	AND #$20
	BNE locret_BANK0_828E

	LDA BackgroundUpdateBoundary
	CMP byte_RAM_505
	BEQ loc_BANK0_825E

	JMP IncrementVerticalScrollRow

; ---------------------------------------------------------------------------

; Decrement tiles row
loc_BANK0_8287:
	LDA DrawBackgroundTilesPPUAddrLoBackward, X
	SEC
	SBC #$20
	STA DrawBackgroundTilesPPUAddrLoBackward, X

locret_BANK0_828E:
	RTS


; Increment tiles row
sub_BANK0_828F:
	LDA DrawBackgroundTilesPPUAddrLo, X
	CLC
	ADC #$20
	STA DrawBackgroundTilesPPUAddrLo, X
	RTS


;
; Decrement the drawing boundary table entry by one row of tiles
;
DecrementVerticalScrollRow:
	; Decrement the row offset
	LDA BackgroundUpdateBoundaryBackward, X
	SEC
	SBC #$10
	STA BackgroundUpdateBoundaryBackward, X
	AND #$F0
	CMP #$F0
	BNE DecrementVerticalScrollRow_Exit

	; Decrement the page
	LDA BackgroundUpdateBoundaryBackward, X
	AND #$0F
	CLC
	ADC #$E0
	STA BackgroundUpdateBoundaryBackward, X
	DEC BackgroundUpdateBoundaryBackward, X
	LDA BackgroundUpdateBoundaryBackward, X
	CMP #$DF
	BNE loc_BANK0_82B9

	; Wrap around to the last row of the last page
	LDA #$E9
	STA BackgroundUpdateBoundaryBackward, X

; @TODO: What's this doing, exactly?
loc_BANK0_82B9:
	LDA #$A0
	STA DrawBackgroundTilesPPUAddrLoBackward, X

DecrementVerticalScrollRow_Exit:
	RTS


;
; Increment the drawing boundary table entry by one column of tiles
;
IncrementVerticalScrollRow:
	; Increment the row offset
	LDA BackgroundUpdateBoundary, X
	CLC
	ADC #$10
	STA BackgroundUpdateBoundary, X
	AND #$F0
	CMP #$F0
	BNE IncrementVerticalScrollRow_Exit

	; Increment the page
	LDA BackgroundUpdateBoundary, X
	AND #$0F
	STA BackgroundUpdateBoundary, X
	INC BackgroundUpdateBoundary, X
	LDA BackgroundUpdateBoundary, X
	CMP #$0A
	BNE loc_BANK0_82DD

	; Wrap around to the first row of the first page
	LDA #$00
	STA BackgroundUpdateBoundary, X

; @TODO: What's this doing, exactly?
loc_BANK0_82DD:
	LDA #$00
	STA DrawBackgroundTilesPPUAddrLo, X

IncrementVerticalScrollRow_Exit:
	RTS


;
; Determines which background tiles from the decoded level data to draw to the
; screen and where to draw them for vertical areas.
;
; ##### Input
; - `BackgroundUpdateBoundary`: drawing boundary table
; - `X`: drawing boundary index (`$00` = full, `$01` = up, `$02` = down)
;
; ##### Output
; - `ReadLevelDataAddress`: decoded level data address
; - `ReadLevelDataOffset`: level data offset
; - `DrawBackgroundTilesPPUAddrHi`/`DrawBackgroundTilesPPUAddrLo`: PPU start address
;
PrepareBackgroundDrawing_Vertical:
	; Lower nybble is used for page
	LDA BackgroundUpdateBoundary, X
	AND #$0F
	TAY
	; Get the address of the decoded level data
	LDA DecodedLevelPageStartLo_Bank1, Y
	STA ReadLevelDataAddress
	LDA DecodedLevelPageStartHi_Bank1, Y
	STA ReadLevelDataAddress + 1

	; Upper nybble is used for the tile offset (rows)
	LDA BackgroundUpdateBoundary, X
	AND #$F0
	STA ReadLevelDataOffset

	; Determine where on the screen we should draw the tile
	LDA BackgroundUpdateBoundary, X
	LSR A
	BCC PrepareBackgroundDrawing_Vertical_Nametable2800

	LDA #$20
	BNE PrepareBackgroundDrawing_Vertical_SetNametableHi

PrepareBackgroundDrawing_Vertical_Nametable2800:
	LDA #$28

PrepareBackgroundDrawing_Vertical_SetNametableHi:
	STA DrawBackgroundTilesPPUAddrHi

	LDA BackgroundUpdateBoundary, X
	AND #$C0
	ASL A
	ROL A
	ROL A
	ADC DrawBackgroundTilesPPUAddrHi
	STA DrawBackgroundTilesPPUAddrHi

	LDA DrawBackgroundTilesPPUAddrLo, X
	STA DrawBackgroundTilesPPUAddrLo

PrepareBackgroundDrawing_Vertical_Exit:
	RTS


;
; =============== S U B R O U T I N E =======================================
;
sub_BANK0_8314:
	LDA BackgroundUpdateBoundary, X
	AND #$10
	BEQ PrepareBackgroundDrawing_Vertical_Exit

	LDA BackgroundUpdateBoundary, X
	STA byte_RAM_3
	SEC
	SBC byte_RAM_1
	STA BackgroundUpdateBoundary, X
	JSR PrepareBackgroundDrawing_Vertical

; loop through tiles to generate PPU attribute data
loc_BANK0_8326:
	LDA #$0F
	STA PPUAttributeUpdateCounter
	LDA #$00
	STA CopyBackgroundCounter

loc_BANK0_832E:
	JSR ReadNextTileAndSetPaletteInPPUAttribute

	LDA PPUAttributeUpdateCounter
	BPL loc_BANK0_832E

	LDA byte_RAM_3
	STA BackgroundUpdateBoundary, X
	DEC byte_RAM_E4
	JMP PrepareBackgroundDrawing_Vertical


;
; This draws ground tiles to the PPU buffer
;
; ##### Input
; - `byte_RAM_300`: offset in PPU buffer
; - `DrawBackgroundTilesPPUAddrHi`/`DrawBackgroundTilesPPUAddrLo`: PPU start address
; - `ReadLevelDataAddress`: decoded level data address
; - `ReadLevelDataOffset`: level data offset
;
CopyBackgroundToPPUBuffer_Vertical:
	; Set the PPU start address (ie. where we're going to draw tiles)
	LDX byte_RAM_300
	LDA DrawBackgroundTilesPPUAddrHi
	STA PPUBuffer_301, X
	INX
	LDA DrawBackgroundTilesPPUAddrLo
	STA PPUBuffer_301, X
	INX

	; We're going to draw a full row of tiles on the screen
	LDA #$20
	STA PPUBuffer_301, X

	; Prepare the counters
	INX
	LDA #$00
	STA CopyBackgroundCounter
	LDA #$0F
	STA PPUAttributeUpdateCounter

	LDA byte_RAM_D5
	BEQ CopyBackgroundToPPUBuffer_Vertical_Loop

	LDY ReadLevelDataOffset
	CPY #$E0
	BNE CopyBackgroundToPPUBuffer_Vertical_Loop

	LDA #$00
	STA byte_RAM_E4
	INC UpdatingPPUAttributeBottomRow

CopyBackgroundToPPUBuffer_Vertical_Loop:
	LDY ReadLevelDataOffset
	LDA (ReadLevelDataAddress), Y
	STA DrawTileId
	AND #%11000000
	ASL A
	ROL A
	ROL A
	TAY
	; Get the tile quad pointer
	LDA TileQuadPointersLo, Y
	STA byte_RAM_0
	LDA TileQuadPointersHi, Y
	STA byte_RAM_1
	LDY ReadLevelDataOffset
	LDA (ReadLevelDataAddress), Y
	ASL A
	ASL A
	TAY
	LDA byte_RAM_D5
	BEQ loc_BANK0_8390

	INY
	INY

loc_BANK0_8390:
	; Write the tile to the PPU buffer
	LDA (byte_RAM_0), Y
	STA PPUBuffer_301, X
	INC CopyBackgroundCounter
	INX
	INY
	LDA CopyBackgroundCounter
	LSR A
	BCS loc_BANK0_8390

	INC ReadLevelDataOffset
	LDA byte_RAM_D5
	BEQ loc_BANK0_83A7

	JSR SetTilePaletteInPPUAttribute

loc_BANK0_83A7:
	; Did we finish drawing the row yet?
	LDA CopyBackgroundCounter
	CMP #$20
	BCC CopyBackgroundToPPUBuffer_Vertical_Loop

	LDA #$00
	STA PPUBuffer_301, X
	STX byte_RAM_300
	LDA byte_RAM_D5
	BEQ loc_BANK0_840B

	LDA byte_RAM_E4
	BEQ loc_BANK0_83C2

	DEC byte_RAM_E4
	JMP loc_BANK0_83DE

; ---------------------------------------------------------------------------

loc_BANK0_83C2:
	LDA NeedsScroll
	LSR A
	BCS loc_BANK0_83D4

; down
	LDX #$01
	JSR CopyBackgroundAttributesToPPUBuffer_Vertical

	LDX #$01
	JSR sub_BANK0_846A

	JMP loc_BANK0_83DE

; up
loc_BANK0_83D4:
	LDX #$00
	JSR CopyBackgroundAttributesToPPUBuffer_Vertical

	LDX #$00
	JSR sub_BANK0_8478

loc_BANK0_83DE:
	LDX #$00
	LDA NeedsScroll
	LSR A
	BCC loc_BANK0_83FA

; up
	INX
	LDA BackgroundUpdateBoundaryBackward, X
	AND #$F0
	CMP #$E0
	BEQ loc_BANK0_83F4

	LDA BackgroundUpdateBoundaryBackward, X
	AND #$10
	BNE loc_BANK0_840B

loc_BANK0_83F4:
	JSR sub_BANK0_8478

	JMP loc_BANK0_840B

; down
loc_BANK0_83FA:
	LDA BackgroundUpdateBoundaryBackward, X
	AND #$F0
	CMP #$E0
	BEQ loc_BANK0_8408

	LDA BackgroundUpdateBoundaryBackward, X
	AND #$10
	BEQ loc_BANK0_840B

loc_BANK0_8408:
	JSR sub_BANK0_846A

loc_BANK0_840B:
	LDA byte_RAM_D5
	EOR #$01
	STA byte_RAM_D5
	RTS


;
; This draws ground background attributes to the PPU buffer
;
CopyBackgroundAttributesToPPUBuffer_Vertical:
	LDY byte_RAM_300
	; Setting the attribute address to update
	LDA DrawBackgroundTilesPPUAddrHi
	ORA #$03
	STA PPUBuffer_301, Y
	INY
	LDA byte_RAM_E1, X
	STA PPUBuffer_301, Y
	INY
	; We're updating 8 blocks of attribute data
	LDA #$08
	STA PPUBuffer_301, Y
	INY

	LDX #$07
CopyBackgroundAttributesToPPUBuffer_Vertical_Loop:
	LDA UpdatingPPUAttributeBottomRow
	BEQ CopyBackgroundAttributesToPPUBuffer_Vertical_FullRow

CopyBackgroundAttributesToPPUBuffer_Vertical_HalfRow:
	; Bottom row of PPU attributes has half-sized blocks
  ; Shift background palettes down one quad
	LDA ScrollingPPUAttributeUpdateBuffer, X
	LSR A
	LSR A
	LSR A
	LSR A
	STA ScrollingPPUAttributeUpdateBuffer, X
	JMP CopyBackgroundAttributesToPPUBuffer_Vertical_Next

CopyBackgroundAttributesToPPUBuffer_Vertical_FullRow:
	LDA NeedsScroll
	LSR A
	BCC CopyBackgroundAttributesToPPUBuffer_Vertical_Next

CopyBackgroundAttributesToPPUBuffer_Vertical_Reverse:
	; Swap palettes for upper and lower background quads, since tiles are drawn
	; in the reverse order when scrolling up
	LDA ScrollingPPUAttributeUpdateBuffer, X
	ASL A
	ASL A
	ASL A
	ASL A
	STA byte_RAM_1
	LDA ScrollingPPUAttributeUpdateBuffer, X
	LSR A
	LSR A
	LSR A
	LSR A
	ORA byte_RAM_1
	STA ScrollingPPUAttributeUpdateBuffer, X

CopyBackgroundAttributesToPPUBuffer_Vertical_Next:
	LDA ScrollingPPUAttributeUpdateBuffer, X
	STA PPUBuffer_301, Y
	INY
	DEX
	BPL CopyBackgroundAttributesToPPUBuffer_Vertical_Loop

	LDA #$01
	STA byte_RAM_E4
	LSR A
	STA UpdatingPPUAttributeBottomRow
	STA PPUBuffer_301, Y
	STY byte_RAM_300
	RTS


; Increment attributes row
sub_BANK0_846A:
	LDA byte_RAM_E1, X
	CLC
	ADC #$08
	STA byte_RAM_E1, X
	BCC locret_BANK0_8477

	LDA #$C0
	STA byte_RAM_E1, X

locret_BANK0_8477:
	RTS


; Decrement attributes row
sub_BANK0_8478:
	LDA byte_RAM_E1, X
	SEC
	SBC #$08
	STA byte_RAM_E1, X
	CMP #$C0
	BCS locret_BANK0_8487

	LDA #$F8
	STA byte_RAM_E1, X

locret_BANK0_8487:
	RTS


;
; Sets the palette for the tile in the current PPU attribute block.
; We effectively write these two bits at a time, since each attribute block
; contains four background tiles.
;
; This subroutine is only used in vertical areas.
;
; ##### Input
; - `DrawTileId`: tile ID to use for the palette
; - `PPUAttributeUpdateCounter`: determines index to update in buffer
;
SetTilePaletteInPPUAttribute:
	LDA PPUAttributeUpdateCounter
	LSR A
	TAY
	; Shift two bits to the right to make room for the next tile
	LDA ScrollingPPUAttributeUpdateBuffer, Y
	LSR A
	LSR A
	STA ScrollingPPUAttributeUpdateBuffer, Y
	; Load the color for the next tile and apply it to the attribute value
	LDA DrawTileId
	AND #%11000000
	ORA ScrollingPPUAttributeUpdateBuffer, Y
	STA ScrollingPPUAttributeUpdateBuffer, Y

	; Move on to the next block
	DEC PPUAttributeUpdateCounter
	RTS


; Unused?
_code_04A2:
	LDX #$07
	LDA #$00

; Unused?
loc_BANK0_84A6:
	STA ScrollingPPUAttributeUpdateBuffer, X
	DEX
	BNE loc_BANK0_84A6

	RTS


;
; Loads a background tile from the level data and determines its PPU attribute data
;
; ##### Input
; - `ReadLevelDataAddress`: decoded level data address
;
; ##### Output
; - `DrawTileId` - tile ID
;
ReadNextTileAndSetPaletteInPPUAttribute:
sub_BANK0_84AC:
	LDY ReadLevelDataOffset
	LDA (ReadLevelDataAddress), Y
	STA DrawTileId
	INC ReadLevelDataOffset
	JMP SetTilePaletteInPPUAttribute


; Unused space in the original ($84B8 - $84FF)
unusedSpace $8500, $FF


;
; Initializes a horizontal area
;
InitializeAreaHorizontal:
	LDA byte_RAM_502
	BNE loc_BANK0_855C

	LDA #VMirror
	JSR ChangeNametableMirroring

	JSR ApplyAreaTransition

	LDA #$00
	STA PPUScrollYMirror

	LDA CurrentLevelEntryPage
	BNE loc_BANK0_851A

	LDA #$09
	BNE loc_BANK0_851D

loc_BANK0_851A:
	SEC
	SBC #$01

loc_BANK0_851D:
	ORA #$D0
	STA BackgroundUpdateBoundaryBackward
	SEC
	SBC #$20
	STA BackgroundUpdateBoundary
	LDA CurrentLevelEntryPage
	CLC
	ADC #$01
	CMP #$0A
	BNE loc_BANK0_8532

	LDA #$00

loc_BANK0_8532:
	ORA #$10
	STA BackgroundUpdateBoundaryForward
	LDA CurrentLevelEntryPage
	LDY #$01
	JSR ResetPPUScrollHi

	; Set the flag for the initial screen render
	INC byte_RAM_502

	; Set the screen x-position
	LDA CurrentLevelEntryPage
	STA ScreenBoundaryLeftHi

	; Initialize the PPU update boundary
	LDA #$01
	STA byte_RAM_53A
	LSR A
	STA byte_RAM_6
	LDA #$FF
	STA byte_RAM_505
	LDA #$0F
	STA PPUScrollCheckLo

	JSR sub_BANK0_856A

loc_BANK0_855C:
	JSR sub_BANK0_87AA

	LDA byte_RAM_53A
	BNE InitializeAreaHorizontal_Exit

	STA byte_RAM_502
	INC BreakStartLevelLoop

InitializeAreaHorizontal_Exit:
	RTS


; =============== S U B R O U T I N E =======================================

sub_BANK0_856A:
	LDA CurrentLevelEntryPage
	BNE loc_BANK0_8576

	LDA MoveCameraX
	BMI loc_BANK0_85E7

	LDA CurrentLevelEntryPage

loc_BANK0_8576:
	CMP CurrentLevelPages
	BNE loc_BANK0_857F

	LDA MoveCameraX
	BPL loc_BANK0_85E7

loc_BANK0_857F:
	LDX #$02
	LDA MoveCameraX
	BPL loc_BANK0_858B

	LDA #$FF
	STA byte_RAM_B
	BNE loc_BANK0_858F

loc_BANK0_858B:
	LDA #$00
	STA byte_RAM_B

loc_BANK0_858F:
	LDA MoveCameraX
	AND #$F0
	CLC
	ADC BackgroundUpdateBoundary, X
	PHP
	ADC byte_RAM_B
	PLP
	STA byte_RAM_C
	LDA byte_RAM_B
	BNE loc_BANK0_85B1

	BCC loc_BANK0_85C2

	LDA BackgroundUpdateBoundary, X
	AND #$0F
	CMP #$09
	BNE loc_BANK0_85C2

	LDA byte_RAM_C
	AND #$F0
	JMP loc_BANK0_85C4

; ---------------------------------------------------------------------------

loc_BANK0_85B1:
	BCS loc_BANK0_85C2

	LDA BackgroundUpdateBoundary, X
	AND #$0F
	BNE loc_BANK0_85C2

	LDA byte_RAM_C
	AND #$F0
	ADC #$09
	JMP loc_BANK0_85C4

; ---------------------------------------------------------------------------

loc_BANK0_85C2:
	LDA byte_RAM_C

loc_BANK0_85C4:
	STA BackgroundUpdateBoundary, X
	DEX
	BPL loc_BANK0_858F

	LDA MoveCameraX
	STA PPUScrollXMirror
	STA ScreenBoundaryLeftLo
	AND #$F0
	STA CurrentLevelPageX
	LDA MoveCameraX
	BPL loc_BANK0_85E7

	DEC ScreenBoundaryLeftHi
	LDA PPUScrollXHiMirror
	EOR #$01
	STA PPUScrollXHiMirror
	LDA #$01
	STA PPUScrollCheckLo

loc_BANK0_85E7:
	LDA #$00
	STA MoveCameraX
	RTS

; End of function sub_BANK0_856A


;
; Applies horizontal screen scrolling.
;
; Unlike vertical scrolling, horizontal scrolling can happen continuously as
; the player moves left and right.
;
;
;
ApplyHorizontalScroll:
	; Reset the PPU tile update flag
	LDA #$00
	STA HasScrollingPPUTilesUpdate

	; Are we scrolling in more tiles?
	LDA HorizontalScrollDirection
	BEQ ApplyHorizontalScroll_CheckMoveCameraX

	; Which direction?
	LDA HorizontalScrollDirection
	LSR A
	BCS ApplyHorizontalScroll_Left

ApplyHorizontalScroll_Right:
	LDX #$02
	STX byte_RAM_9
	LDA #$10
	STA byte_RAM_1
	DEX
	LDA HorizontalScrollDirection
	STA NeedsScroll
	JSR CopyAttributesToHorizontalBuffer

	LDA byte_RAM_3
	STA BackgroundUpdateBoundaryForward
	LDA #$00
	STA HorizontalScrollDirection
	BEQ ApplyHorizontalScroll_CheckMoveCameraX

ApplyHorizontalScroll_Left:
	LDX #$01
	STX byte_RAM_9
	DEX
	STX byte_RAM_1
	LDA HorizontalScrollDirection
	STA NeedsScroll
	JSR CopyAttributesToHorizontalBuffer

	LDA #$00
	STA HorizontalScrollDirection

ApplyHorizontalScroll_CheckMoveCameraX:
	LDA MoveCameraX
	BNE ApplyMoveCameraX

	RTS


ApplyMoveCameraX:
	LDA MoveCameraX
	BPL ApplyMoveCameraX_Right

ApplyMoveCameraX_ScrollLeft:
	LDA #$01
	STA NeedsScroll

	; Weird `JMP`, but okay...
	JMP ApplyMoveCameraX_Left

ApplyMoveCameraX_Right:
	LDA #$02
	STA NeedsScroll

	LDX MoveCameraX
ApplyMoveCameraX_Right_Loop:
	LDA PPUScrollXMirror
	BNE loc_BANK0_8651

	LDA ScreenBoundaryLeftHi
	CMP CurrentLevelPages
	BNE loc_BANK0_8651

	; Can't scroll past beyond the last page of the area
	JMP ApplyMoveCameraX_Exit

; Scrolling one pixel at a time in a tight loop seems crazy at first, but in
; practice it only ends up being like 3 iterations at most.
ApplyMoveCameraX_Right_AddPixel:
loc_BANK0_8651:
	LDA PPUScrollXMirror
	CLC
	ADC #$01
	STA PPUScrollXMirror
	STA ScreenBoundaryLeftLo
	BCC loc_BANK0_8669

	INC ScreenBoundaryLeftHi
	LDA PPUScrollXHiMirror
	EOR #$01
	STA PPUScrollXHiMirror
	ASL A
	STA PPUScrollYHiMirror

loc_BANK0_8669:
	LDA ScreenBoundaryLeftHi
	CMP CurrentLevelPages
	BEQ loc_BANK0_8685

	LDA PPUScrollXMirror
	AND #$F0
	CMP CurrentLevelPageX
	BEQ ApplyMoveCameraX_Right_Next

	STA CurrentLevelPageX
	LDA #$01
	STA HasScrollingPPUTilesUpdate

ApplyMoveCameraX_Right_Next:
	DEX
	BNE ApplyMoveCameraX_Right_Loop

loc_BANK0_8685:
	LDA HasScrollingPPUTilesUpdate
	BEQ ApplyMoveCameraX_Exit

	LDX #$02
loc_BANK0_868C:
	JSR IncrementHorizontalScrollColumn

	DEX
	BNE loc_BANK0_868C

	LDX #$02
	JSR PrepareBackgroundDrawing_Horizontal

	JMP loc_BANK0_86E6


ApplyMoveCameraX_Left:
	LDX MoveCameraX
ApplyMoveCameraX_Left_Loop:
	LDA PPUScrollXMirror
	BNE loc_BANK0_86A8

	LDA ScreenBoundaryLeftHi
	BNE loc_BANK0_86A8

	; Can't scroll past beyond the first page of the area
	JMP ApplyMoveCameraX_Exit

loc_BANK0_86A8:
	LDA PPUScrollXMirror
	SEC
	SBC #$01
	STA PPUScrollXMirror
	STA ScreenBoundaryLeftLo
	BCS loc_BANK0_86C0

	DEC ScreenBoundaryLeftHi
	LDA PPUScrollXHiMirror
	EOR #$01
	STA PPUScrollXHiMirror
	ASL A
	STA PPUScrollYHiMirror

loc_BANK0_86C0:
	LDA PPUScrollXMirror
	AND #$F0
	CMP CurrentLevelPageX
	BEQ loc_BANK0_86D1

	STA CurrentLevelPageX
	LDA #$01
	STA HasScrollingPPUTilesUpdate

loc_BANK0_86D1:
	INX
	BNE ApplyMoveCameraX_Left_Loop

	LDA HasScrollingPPUTilesUpdate
	BEQ ApplyMoveCameraX_Exit

	LDX #$02
loc_BANK0_86DB:
	JSR DecrementHorizontalScrollColumn

	DEX
	BNE loc_BANK0_86DB

	LDX #$01
	JSR PrepareBackgroundDrawing_Horizontal

loc_BANK0_86E6:
	JSR CopyBackgroundToPPUBuffer_Horizontal

ApplyMoveCameraX_Exit:
	LDA #$00
	STA NeedsScroll
	RTS


;
; Resets the PPU high scrolling values and sets the high byte of the PPU scroll offset.
;
; ##### Input
; - `A`: 0 = use nametable A, 1 = use nametable B
; - `Y`: 0 = vertical, 1 = horizontal
;
; ##### Output
; - `PPUScrollYHiMirror`
; - `PPUScrollXHiMirror`
; - `PPUScrollCheckHi`: PPU scroll offset high byte
;
ResetPPUScrollHi:
	LSR A
	BCS ResetPPUScrollHi_NametableB

ResetPPUScrollHi_NametableA:
	LDA #$01
	STA PPUScrollXHiMirror
	ASL A
	STA PPUScrollYHiMirror
	LDA #$20
	BNE ResetPPUScrollHi_Exit

ResetPPUScrollHi_NametableB:
	LDA #$00
	STA PPUScrollXHiMirror
	STA PPUScrollYHiMirror
	LDA PPUScrollHiOffsets, Y

ResetPPUScrollHi_Exit:
	STA PPUScrollCheckHi
	RTS


;
; High byte of the PPU scroll offset for nametable B.
;
; When mirroring vertically, nametable A is `$2000` and nametable B is `$2800`.
; When mirroring horizontally, nametable A is `$2000` and nametable B is `$2400`.
;
PPUScrollHiOffsets:
	.db $28 ; vertical
	.db $24 ; horizontal


; The sub-area "page" is the index in the DecodedLevelPageStart table.
; This is why there are 10 blank pages in the jar enemy data.
SubAreaPage:
	.db $0A


; Stash the PPU scrolling data from the main area and rest it for the subarea
UseSubareaScreenBoundaries:
	LDA PPUScrollXMirror
	STA PPUScrollXMirror_Backup
	LDA PPUScrollXHiMirror
	STA PPUScrollXHiMirror_Backup
	LDA ScreenBoundaryLeftHi
	STA ScreenBoundaryLeftHi_Backup
	INC byte_RAM_53D
	LDA SubAreaPage
	STA CurrentLevelEntryPage
	JSR ResetPPUScrollHi

	LDA #$00
	STA PPUScrollXMirror
	STA ScreenBoundaryLeftLo
	LDA SubAreaPage
	STA ScreenBoundaryLeftHi

	JSR ApplyAreaTransition

	LDA SubAreaPage
	STA BackgroundUpdateBoundary
	LDA #$E0
	STA PPUScrollCheckHi
	LDA SubAreaPage
	CLC
	ADC #$F0
	STA byte_RAM_505
	RTS


; Restore the PPU scrolling data for the main area
UseMainAreaScreenBoundaries:
	LDA PPUScrollXMirror_Backup
	STA PPUScrollXMirror
	STA ScreenBoundaryLeftLo
	LDA PPUScrollXHiMirror_Backup
	STA PPUScrollXHiMirror
	LDA ScreenBoundaryLeftHi_Backup
	STA ScreenBoundaryLeftHi
	LDA byte_RAM_53D
	BNE UseMainAreaScreenBoundaries_Exit

	INC byte_RAM_53E ; unused?
	INC byte_RAM_53D
	INC byte_RAM_D5
	JSR RestorePlayerPosition

	LDA BackgroundUpdateBoundaryBackward
	STA BackgroundUpdateBoundary
	LDA #$10
	STA byte_RAM_1
	LDA #$F0
	STA PPUScrollCheckHi
	STA PPUScrollCheckLo
	LDA BackgroundUpdateBoundaryForward
	STA byte_RAM_505

UseMainAreaScreenBoundaries_Exit:
	RTS


; Used for redrawing the screen in a horizontal area after unpausing
;
; Updates the background update boundary to read tiles from the correct part of the level
sub_BANK0_8785:
	LDA BackgroundUpdateBoundaryBackward
	STA BackgroundUpdateBoundary
	LDA #$10
	STA byte_RAM_1
	LDA #$F0
	STA PPUScrollCheckHi
	STA PPUScrollCheckLo
	LDA BackgroundUpdateBoundaryForward
	CLC
	ADC #$10
	ADC #$00
	CMP #$0A
	BNE loc_BANK0_87A2

	LDA #$00

loc_BANK0_87A2:
	STA byte_RAM_505
	LDA #$01
	STA byte_RAM_6
	RTS

; Used for redrawing the background tiles in a horizontal area
sub_BANK0_87AA:
	LDX #$00
	STX byte_RAM_537
	STX HasScrollingPPUTilesUpdate
	STX NeedsScroll

	JSR PrepareBackgroundDrawing_Horizontal

	JSR CopyBackgroundToPPUBuffer_Horizontal

	LDA PPUScrollCheckHi
	CMP DrawBackgroundTilesPPUAddrHi
	BNE loc_BANK0_87DA

	LDA PPUScrollCheckLo
	CLC
	ADC #$01
	CMP DrawBackgroundTilesPPUAddrLo
	BNE loc_BANK0_87DA

loc_BANK0_87CB:
	LDA #$00
	STA byte_RAM_53A
	STA byte_RAM_53D
	STA byte_RAM_53E
	INC byte_RAM_537
	RTS

; ---------------------------------------------------------------------------

loc_BANK0_87DA:
	LDA BackgroundUpdateBoundary
	CMP byte_RAM_505
	BEQ loc_BANK0_87CB

	LDX #$00
	JMP IncrementHorizontalScrollColumn

;
; Decrement the drawing boundary table entry by one column of tiles
;
DecrementHorizontalScrollColumn:
	; Decrement the column offset
	LDA BackgroundUpdateBoundary, X
	SEC
	SBC #$10
	STA BackgroundUpdateBoundary, X
	BCS DecrementHorizontalScrollColumn_Exit

	; Decrement the page
	DEC BackgroundUpdateBoundary, X
	LDA BackgroundUpdateBoundary, X
	CMP #$EF
	BNE DecrementHorizontalScrollColumn_Exit

	; Wrap around to the last column of the last page
	LDA #$F9
	STA BackgroundUpdateBoundary, X

DecrementHorizontalScrollColumn_Exit:
	RTS


;
; Increment the drawing boundary table entry by one column of tiles
;
IncrementHorizontalScrollColumn:
	; Increment the column offset
	LDA BackgroundUpdateBoundary, X
	CLC
	ADC #$10
	STA BackgroundUpdateBoundary, X
	BCC IncrementHorizontalScrollColumn_Exit

	; Increment the page
	INC BackgroundUpdateBoundary, X
	LDA BackgroundUpdateBoundary, X
	CMP #$0A
	BNE IncrementHorizontalScrollColumn_Exit

	; Wrap around to the first page
	LDA #$00
	STA BackgroundUpdateBoundary, X

IncrementHorizontalScrollColumn_Exit:
	RTS


;
; Determines which background tiles from the decoded level data to draw to the
; screen and where to draw them for horizontal areas.
;
; ##### Input
; - `BackgroundUpdateBoundary`: drawing boundary table
; - `X`: drawing boundary index (`$00` = full, `$01` = left, `$02` = right)
;
; ##### Output
; - `ReadLevelDataAddress`: decoded level data address
; - `ReadLevelDataOffset`: level data offset
; - `DrawBackgroundTilesPPUAddrHi`/`DrawBackgroundTilesPPUAddrLo`: PPU start address
;
PrepareBackgroundDrawing_Horizontal:
	; Stash Y so we can restore it later
	STY byte_RAM_F

	; Lower nybble is used for page
	LDA BackgroundUpdateBoundary, X
	AND #$0F
	TAY
	; Get the address of the decoded level data
	LDA DecodedLevelPageStartLo_Bank1, Y
	STA ReadLevelDataAddress
	LDA DecodedLevelPageStartHi_Bank1, Y
	STA ReadLevelDataAddress + 1

	; Upper nybble is used for the tile offset (columns)
	LDA BackgroundUpdateBoundary, X
	LSR A
	LSR A
	LSR A
	LSR A
	STA ReadLevelDataOffset

	; Determine where on the screen we should draw the tile
	ASL A
	STA DrawBackgroundTilesPPUAddrLo

	LDY #$20
	LDA BackgroundUpdateBoundary, X
	LSR A
	BCS PrepareBackgroundDrawing_Horizontal_Exit

	LDY #$24

PrepareBackgroundDrawing_Horizontal_Exit:
	STY DrawBackgroundTilesPPUAddrHi

	; Restore original Y value
	LDY byte_RAM_F

	RTS


;
; horizontal
;
sub_BANK0_883C:
	STX byte_RAM_8
	LDX byte_RAM_9
	LDY #$02
	LDA BackgroundUpdateBoundary, X
	STA byte_RAM_3
	SEC
	SBC byte_RAM_1
	STA BackgroundUpdateBoundary, X

	JSR PrepareBackgroundDrawing_Horizontal

	LDA #$07
	STA PPUAttributeUpdateCounter
	LDA #$00
	STA CopyBackgroundCounter

loc_BANK0_8856:
	JSR sub_BANK0_8925

	LDA PPUAttributeUpdateCounter
	BPL loc_BANK0_8856

	LDA DrawBackgroundTilesPPUAddrLo
	AND #$1C
	LSR A
	LSR A
	ORA #$C0
	STA DrawBackgroundAttributesPPUAddrLo
	LDA DrawBackgroundTilesPPUAddrHi
	ORA #$03
	STA DrawBackgroundAttributesPPUAddrHi
	LDX byte_RAM_8
	RTS


;
; Draws the background data to the PPU buffer
;
CopyBackgroundToPPUBuffer_Horizontal:
	LDA #$0F
	STA PPUAttributeUpdateCounter

	LDA #$00
	STA CopyBackgroundCounter
	STA byte_RAM_D5
	TAX
CopyBackgroundToPPUBuffer_Horizontal_Loop:
	LDY ReadLevelDataOffset
	LDA (ReadLevelDataAddress), Y
	STA DrawTileId
	AND #%11000000
	ASL A
	ROL A
	ROL A
	TAY
	; Get the tile quad pointer
	LDA TileQuadPointersLo, Y
	STA byte_RAM_0
	LDA TileQuadPointersHi, Y
	STA byte_RAM_1

	LDY ReadLevelDataOffset
	LDA (ReadLevelDataAddress), Y
	ASL A
	ASL A
	TAY
	LDA byte_RAM_D5
	BEQ loc_BANK0_88A0

	INY

loc_BANK0_88A0:
	LDA (byte_RAM_0), Y
	STA ScrollingPPUTileUpdateBuffer, X
	INY
	LDA (byte_RAM_0), Y
	STA ScrollingPPUTileUpdateBuffer + $1E, X
	INY
	LDA (byte_RAM_0), Y
	STA ScrollingPPUTileUpdateBuffer + $01, X
	INY
	LDA (byte_RAM_0), Y
	STA ScrollingPPUTileUpdateBuffer + $1F, X
	INC CopyBackgroundCounter
	INX
	INX
	LDA ReadLevelDataOffset
	CLC
	ADC #$10
	STA ReadLevelDataOffset
	LDA CopyBackgroundCounter
	CMP #$0F
	BCC CopyBackgroundToPPUBuffer_Horizontal_Loop

	LDA #$00
	STA DrawBackgroundAttributesPPUAddrHi
	LDA NeedsScroll
	LSR A
	BCS loc_BANK0_88F2

; down
	LDA DrawBackgroundTilesPPUAddrLo
	AND #$02
	BEQ loc_BANK0_88FD

	LDA NeedsScroll
	BNE loc_BANK0_88F8

	LDA #$10
	STA byte_RAM_1
	LDX #$00
	STX byte_RAM_9
	INX
	JSR CopyAttributesToHorizontalBuffer

	LDA byte_RAM_3
	STA BackgroundUpdateBoundary
	JSR PrepareBackgroundDrawing_Horizontal

	JMP loc_BANK0_88FD

; up
loc_BANK0_88F2:
	LDA DrawBackgroundTilesPPUAddrLo
	AND #$02
	BNE loc_BANK0_88FD

loc_BANK0_88F8:
	LDA NeedsScroll
	STA HorizontalScrollDirection

loc_BANK0_88FD:
	INC HasScrollingPPUTilesUpdate
	RTS


;
; Does some kind of transformation to copy PPU attribute data from the common
; scrolling PPU update buffer to the horizontal-only buffer.
;
; I'm not totally sure why it is necessary to do this rather than writing the
; attribute data in the final order the first time?
;
; NOTE: There is code that assumes `X = $00` after running this subroutine!
;
CopyAttributesToHorizontalBuffer:
	JSR sub_BANK0_883C

	LDX #$07
	STX byte_RAM_E
	LDY #$00
CopyAttributesToHorizontalBuffer_Loop:
	LDX byte_RAM_E
	LDA ScrollingPPUAttributeUpdateBuffer, X
	STA HorizontalScrollingPPUAttributeUpdateBuffer, Y
	INY
	DEX
	DEX
	DEX
	DEX
	LDA ScrollingPPUAttributeUpdateBuffer, X
	STA HorizontalScrollingPPUAttributeUpdateBuffer, Y
	INY
	DEC byte_RAM_E
	LDA byte_RAM_E
	CMP #03
	BNE CopyAttributesToHorizontalBuffer_Loop

	RTS


;
; Determines the PPU attribute data for a group of four tiles in a horizontal area.
; Reads a group of four background tiles to determine the PPU attribute data
;
sub_BANK0_8925:
	STY byte_RAM_F
	LDA #01
	STA byte_RAM_4
	LDY ReadLevelDataOffset
	LDX PPUAttributeUpdateCounter

loc_BANK0_892F:
	LDA ScrollingPPUAttributeUpdateBuffer, X
	LSR A
	LSR A
	STA ScrollingPPUAttributeUpdateBuffer, X
	LDA (ReadLevelDataAddress), Y
	AND #%11000000
	ORA ScrollingPPUAttributeUpdateBuffer, X
	STA ScrollingPPUAttributeUpdateBuffer, X
	INY
	LDA ScrollingPPUAttributeUpdateBuffer, X
	LSR A
	LSR A
	STA ScrollingPPUAttributeUpdateBuffer, X
	LDA (ReadLevelDataAddress), Y
	AND #%11000000
	ORA ScrollingPPUAttributeUpdateBuffer, X
	STA ScrollingPPUAttributeUpdateBuffer, X
	LDA ReadLevelDataOffset
	CLC
	ADC #$10
	TAY
	STA ReadLevelDataOffset
	DEC byte_RAM_4
	BPL loc_BANK0_892F

	DEC PPUAttributeUpdateCounter
	LDY byte_RAM_F
	RTS


SetObjectLocks:
	LDX #$07

SetObjectLocks_Loop:
	STA ObjectLock - 1, X
	DEX
	BPL SetObjectLocks_Loop

	RTS



; Unused space in the original ($8966 - $89FF)
unusedSpace $8A00, $FF


GrowShrinkSFXIndexes:
	.db SoundEffect2_Shrinking
	.db SoundEffect2_Growing


HandlePlayerState:
IFDEF CONTROLLER_2_DEBUG
	JSR CheckPlayer2Joypad
ENDIF

	LDA PlayerState ; Handles player states?
	CMP #PlayerState_Lifting
	BCS loc_BANK0_8A26 ; If the player is changing size, just handle that

	LDA #$00 ; Check if the player needs to change size
	LDY #$10
	CPY PlayerHealth
	ROL A
	EOR PlayerCurrentSize
	BEQ loc_BANK0_8A26

	LDY PlayerCurrentSize
	LDA GrowShrinkSFXIndexes, Y
	STA SoundEffectQueue2
	LDA #$1E
	STA PlayerStateTimer
	LDA #PlayerState_ChangingSize
	STA PlayerState

loc_BANK0_8A26:
	LDA #ObjAttrib_Palette0
	STA PlayerAttributes
	LDA PlayerState
	JSR JumpToTableAfterJump ; Player state handling?

	.dw HandlePlayerState_Normal ; Normal
	.dw HandlePlayerState_Climbing ; Climbing
	.dw HandlePlayerState_Lifting ; Lifting
	.dw HandlePlayerState_ClimbingAreaTransition ; Climbing area transition
	.dw HandlePlayerState_GoingDownJar ; Going down jar
	.dw HandlePlayerState_ExitingJar ; Exiting jar
	.dw HandlePlayerState_HawkmouthEating ; Hawkmouth eating
IFNDEF RESPAWN_INSTEAD_OF_DEATH
	.dw HandlePlayerState_Dying ; Dying
ELSE
	.dw HandlePlayerState_Respawning
ENDIF
	.dw HandlePlayerState_ChangingSize ; Changing size


HandlePlayerState_Normal:
	JSR PlayerGravity

	; player animation frame, crouch jump charging
	JSR sub_BANK0_8C1A

	; maybe only y-collision?
	JSR PlayerTileCollision

	; screen boundary x-collision
	JSR PlayerAreaBoundaryCollision

	JSR ApplyPlayerPhysicsY


;
; Applies player physics on the x-axis
;
ApplyPlayerPhysicsX:
	LDX #$00
	JSR ApplyPlayerPhysics

	LDA IsHorizontalLevel
	BNE ApplyPlayerPhysicsX_Exit

	STA PlayerXHi

ApplyPlayerPhysicsX_Exit:
	RTS


;
; What goes up must come down
;
HandlePlayerState_Dying:
	LDA PlayerStateTimer
	BNE locret_BANK0_8A86

	LDA PlayerScreenYHi
	CMP #02
	BEQ LoseALife

	JSR ApplyPlayerPhysicsY

	LDA PlayerYVelocity
	BMI loc_BANK0_8A72

	CMP #$39
	BCS locret_BANK0_8A86

loc_BANK0_8A72:
	INC PlayerYVelocity
	INC PlayerYVelocity
	RTS

; ---------------------------------------------------------------------------

LoseALife:
	LDA #02
	STA PlayerAnimationFrame
	LDY #$01 ; Set game mode to title card
	DEC ExtraLives
	BNE SetGameModeAfterDeath

	INY ; If no lives, increase game mode
; from 1 (title card) to 2 (game over)

SetGameModeAfterDeath:
	STY GameMode

locret_BANK0_8A86:
	RTS

; ---------------------------------------------------------------------------

HandlePlayerState_Lifting:
	LDA PlayerStateTimer
	BNE locret_BANK0_8AC1

	LDX ObjectBeingCarriedIndex
	LDY ObjectBeingCarriedTimer, X
	CPY #$02
	BCC loc_BANK0_8ABB

	CPY #$07
	BNE loc_BANK0_8A9D

	LDA #DPCM_ItemPull
	STA DPCMQueue

loc_BANK0_8A9D:
	DEC ObjectBeingCarriedTimer, X
	LDA PlayerLiftFrames, Y
	STA PlayerAnimationFrame
	LDA EnemyState, X
	CMP #$06
	BEQ loc_BANK0_8AB0

	LDA ObjectType, X
	CMP #Enemy_VegetableSmall
	BNE loc_BANK0_8AB5

loc_BANK0_8AB0:
	LDA PlayerLiftTimer - 2, Y
	BPL loc_BANK0_8AB8

loc_BANK0_8AB5:
	LDA PickupSpeedAnimation - 2, Y

loc_BANK0_8AB8:
	STA PlayerStateTimer
	RTS

; ---------------------------------------------------------------------------

loc_BANK0_8ABB:
	STA PlayerState
	INC PlayerInAir

loc_BANK0_8ABF:
	INC PlayerDucking
IFDEF PLAYER_HITBOX
	LDA PlayerDucking
	STA PlayerHitbox
ENDIF

locret_BANK0_8AC1:
	RTS


PlayerLiftTimer:
	.db $00
	.db $01
	.db $01
	.db $01

PlayerLiftFrames:
	.db $01
	.db $02
	.db $04
	.db $04
	.db $04
	.db $04
	.db $08
	.db $08

byte_BANK0_8ACE:
	.db $00
	.db $10
	.db $F0
; ---------------------------------------------------------------------------

HandlePlayerState_Climbing:
	LDA Player1JoypadHeld
	AND #ControllerInput_Down | ControllerInput_Up
	LSR A
	LSR A
	TAY
	CPY #$02
	BNE loc_BANK0_8ADF

	JSR PlayerClimbAnimation

loc_BANK0_8ADF:
	LDA ClimbSpeed, Y
	STA PlayerYVelocity
	LDA Player1JoypadHeld
	AND #ControllerInput_Right | ControllerInput_Left
	TAY
	LDA byte_BANK0_8ACE, Y
	STA PlayerXVelocity
	LDA PlayerXLo
	CLC
	ADC #$04
	AND #$0F
	CMP #$08
	BCS loc_BANK0_8B14

	LDY TileCollisionHitboxIndex + $0B
	LDA PlayerYVelocity
	BMI loc_BANK0_8B01

	INY

loc_BANK0_8B01:
	LDX #$00
	JSR PlayerTileCollision_CheckClimbable

	BCS loc_BANK0_8B0E

loc_BANK0_8B08:
	LDA PlayerYVelocity
	BPL loc_BANK0_8B14

	STX PlayerYVelocity

loc_BANK0_8B0E:
	JSR ApplyPlayerPhysicsX

	JMP ApplyPlayerPhysicsY

; ---------------------------------------------------------------------------

loc_BANK0_8B14:
	LDA #$00
	STA PlayerState
	RTS


;
; Does climbing animation and sound
;
PlayerClimbAnimation:
	LDA byte_RAM_10
	AND #$07
	BNE PlayerClimbAnimation_Exit

	LDA PlayerDirection
	EOR #$01
	STA PlayerDirection
	LDA #SoundEffect2_Climbing
	STA SoundEffectQueue2

PlayerClimbAnimation_Exit:
	RTS


ClimbableTiles:
	.db BackgroundTile_Vine
	.db BackgroundTile_VineStandable
	.db BackgroundTile_VineBottom
	.db BackgroundTile_ClimbableSky
	.db BackgroundTile_Chain
	.db BackgroundTile_Ladder
	.db BackgroundTile_LadderShadow
	.db BackgroundTile_LadderStandable
	.db BackgroundTile_LadderStandableShadow
	.db BackgroundTile_ChainStandable


;
; Checks whether the player is on a climbable tile
;
; Input
;   byte_RAM_0 = tile ID
; Output
;   C = set if the player is on a climbable tile
;
PlayerTileCollision_CheckClimbable:
	JSR sub_BANK0_924F

	LDA byte_RAM_0
	LDY #$09

PlayerTileCollision_CheckClimbable_Loop:
	CMP ClimbableTiles, Y
	BEQ PlayerTileCollision_CheckClimbable_Exit

	DEY
	BPL PlayerTileCollision_CheckClimbable_Loop

	CLC

PlayerTileCollision_CheckClimbable_Exit:
	RTS


HandlePlayerState_GoingDownJar:
	LDA #ObjAttrib_BehindBackground
	STA PlayerAttributes
	INC PlayerYLo
	LDA PlayerYLo
	AND #$0F
	BNE HandlePlayerState_GoingDownJar_Exit

	STA PlayerState
	JSR DoAreaReset

	PLA
	PLA
	JSR StashPlayerPosition_Bank0

	LDA #TransitionType_Jar
	STA TransitionType
	LDA InJarType
	BNE HandlePlayerState_GoingDownJar_NonWarp

	LDA #GameMode_Warp
	STA GameMode
	RTS

HandlePlayerState_GoingDownJar_NonWarp:
	CMP #$01
	BEQ HandlePlayerState_GoingDownJar_Regular

	STA DoAreaTransition
	RTS

HandlePlayerState_GoingDownJar_Regular:
	STA InSubspaceOrJar

HandlePlayerState_GoingDownJar_Exit:
	RTS


HandlePlayerState_ExitingJar:
	LDA #ObjAttrib_BehindBackground
	STA PlayerAttributes
	DEC PlayerYLo
	LDA PlayerYLo
	AND #$0F
	BNE locret_BANK0_8B86

	STA PlayerState

locret_BANK0_8B86:
	RTS


; The climb transition triggers on particular player screen y-positions
ClimbTransitionYExitPositionHi:
	.db $00 ; down
	.db $FF ; up

ClimbTransitionYExitPositionLo:
	.db $EE ; down
	.db $DE ; up

; The second climbing trigger table uses $00 as the high value
ClimbTransitionYEnterPositionLo:
	.db $09 ; down
	.db $A1 ; up


HandlePlayerState_ClimbingAreaTransition:
	; Determine the climbing direction from the y-velocity ($00 = down, $00 = up)
	LDA PlayerYVelocity
	ASL A
	ROL A
	AND #$01
	TAY

HandlePlayerState_CheckExitPosition:
	; Determine whether the player screen y-position matches the table entry
	LDA PlayerScreenYHi
	CMP ClimbTransitionYExitPositionHi, Y
	BNE HandlePlayerState_CheckEnterPosition

	LDA PlayerScreenYLo
	CMP ClimbTransitionYExitPositionLo, Y
	BNE HandlePlayerState_CheckEnterPosition

	; The position matches, so keep climbing and transition to the next area
	JSR DoAreaReset

	INC DoAreaTransition
	LDA #TransitionType_Vine
	STA TransitionType
	RTS

HandlePlayerState_CheckEnterPosition:
	LDA PlayerScreenYHi
	BNE HandlePlayerState_JustClimb

	; Climbing until player reaches the desired position
	LDA PlayerScreenYLo
	CMP ClimbTransitionYEnterPositionLo, Y
	BEQ HandlePlayerState_SetClimbing

HandlePlayerState_JustClimb:
	; do the climb animation if the player is going up
	TYA
	BEQ HandlePlayerState_JustClimb_Physics

	JSR PlayerClimbAnimation

HandlePlayerState_JustClimb_Physics:
	JMP ApplyPlayerPhysicsY

HandlePlayerState_SetClimbing:
	LDA #PlayerState_Climbing
	STA PlayerState
	RTS



HandlePlayerState_HawkmouthEating:
	LDA PlayerStateTimer
	BEQ loc_BANK0_8BE9

	JSR ApplyPlayerPhysicsY

	LDA_abs PlayerCollision

	BEQ locret_BANK0_8BEB

	LDA #ObjAttrib_BehindBackground
	STA PlayerAttributes
	LDA #$04
	STA PlayerXVelocity
	LDA #$01
	STA PlayerDirection

loc_BANK0_8BE3:
	JSR ApplyPlayerPhysicsX

	JMP PlayerWalkJumpAnim

; ---------------------------------------------------------------------------

loc_BANK0_8BE9:
	STA PlayerState

locret_BANK0_8BEB:
	RTS


; Alternate between large and small graphics on these frames when changing size
ChangingSizeKeyframes:
	.db $05
	.db $0A
	.db $0F
	.db $14
	.db $19


HandlePlayerState_ChangingSize:
	LDA PlayerStateTimer
	BEQ loc_BANK0_8C0D

	INC DamageInvulnTime

	LDY #$04
HandlePlayerState_ChangingSize_Loop:
	CMP ChangingSizeKeyframes, Y
	BNE HandlePlayerState_ChangingSize_Next

	LDA PlayerCurrentSize
	EOR #$01
	STA PlayerCurrentSize
	JMP LoadCharacterCHRBanks

HandlePlayerState_ChangingSize_Next:
	DEY
	BPL HandlePlayerState_ChangingSize_Loop

	RTS

; ---------------------------------------------------------------------------

loc_BANK0_8C0D:
	LDY PlayerAnimationFrame
	CPY #$0A
	BNE loc_BANK0_8C15

	LDA #PlayerState_Climbing

loc_BANK0_8C15:
	STA PlayerState
	RTS

; ---------------------------------------------------------------------------

PlayerControlAcceleration:
	.db $FE
	.db $02

; =============== S U B R O U T I N E =======================================

; player crouch subroutine
sub_BANK0_8C1A:
	JSR PlayerWalkJumpAnim

	LDA PlayerInAir
	BNE ResetPartialCrouchJumpTimer

	LDA PlayerDucking
	BEQ loc_BANK0_8C2B

	LDA PlayerStateTimer
	BNE loc_BANK0_8C92

	DEC PlayerDucking
IFDEF PLAYER_HITBOX
	LDA PlayerDucking
	STA PlayerHitbox
ENDIF

loc_BANK0_8C2B:
	LDA Player1JoypadPress
	BPL loc_BANK0_8C3D ; branch if not pressing A Button

	INC PlayerInAir
	LDA #SpriteAnimation_Jumping
	STA PlayerAnimationFrame
	JSR PlayerStartJump

	LDA #SoundEffect2_Jump
	STA SoundEffectQueue2

loc_BANK0_8C3D:
	LDA PlayerRidingCarpet
	BNE loc_BANK0_8C92

	LDA QuicksandDepth
	BNE ResetPartialCrouchJumpTimer

	LDA Player1JoypadHeld ; skip if down button is not pressed
	AND #ControllerInput_Down
	BEQ ResetPartialCrouchJumpTimer

	INC PlayerDucking ; set ducking state?
IFDEF PLAYER_HITBOX
	LDA PlayerDucking
	STA PlayerHitbox
ENDIF
	LDA #SpriteAnimation_Ducking ; set ducking animation
	STA PlayerAnimationFrame
	LDA PlayerInAir ; skip ahead if player is in air
	BNE ResetPartialCrouchJumpTimer

	LDA CrouchJumpTimer ; check if crouch jump is charged
	CMP #$3C
	BCS loc_BANK0_8C92

	INC CrouchJumpTimer ; increment crouch jump charge
	BNE loc_BANK0_8C92

ResetPartialCrouchJumpTimer: ; reset crouch jump timer if it isn't full
	LDA CrouchJumpTimer
	CMP #$3C ; max crouch jump timer
	BCS loc_BANK0_8C6F

	LDA #$00 ; reset crouch jump timer to zero
	STA CrouchJumpTimer

loc_BANK0_8C6F:
	LDA Player1JoypadHeld
	AND #ControllerInput_Right | ControllerInput_Left
	BEQ loc_BANK0_8C92

	AND #$01
	STA PlayerDirection
	TAY
	LDA GroundSlipperiness
	LSR A
	LSR A
	AND byte_RAM_10
	BNE ResetCrouchJumpTimer

	LDA PlayerXVelocity
	CLC
	ADC PlayerControlAcceleration, Y
	STA PlayerXVelocity

ResetCrouchJumpTimer:
	LDA #$00
	STA CrouchJumpTimer
	BEQ loc_BANK0_8C95 ; unconditional branch?

loc_BANK0_8C92:
	JSR sub_BANK0_8D2C

loc_BANK0_8C95:
	JSR sub_BANK0_8DC0

	RTS

; End of function sub_BANK0_8C1A


;
; Starts a jump
;
; The jump height is based on a lookup table using the following bitfield:
;
; %xxxxxRCI
;   R = whether the player is running
;   C = whether the crouch timer is charged
;   I = whether the player is holding an item
;
PlayerStartJump:
	LDA QuicksandDepth
	CMP #$02
	BCC PlayerStartJump_LoadXVelocity

	; Quicksand
	LDA JumpHeightQuicksand
	STA PlayerYVelocity
	BNE PlayerStartJump_Exit

PlayerStartJump_LoadXVelocity:
	; The x-velocity may affect the jump
	LDA PlayerXVelocity
	BPL PlayerStartJump_CheckXSpeed

	; Absolute value of x-velocity
	EOR #$FF
	CLC
	ADC #$01

PlayerStartJump_CheckXSpeed:
	; Set carry flag if the x-speed is fast enough
	CMP #$08
	; Clear y subpixel
	LDA #$00
	STA PlayerYSubpixel
	; Set bit for x-speed using carry flag
	ROL A

	; Check crouch jump timer
	LDY CrouchJumpTimer
	CPY #$3C
	BCC PlayerStartJump_SetYVelocity

	; Clear Player1JoypadHeld for a crouch jump
	LDA #$00
	STA Player1JoypadHeld

PlayerStartJump_SetYVelocity:
	; Set bit for charged jump using carry flag
	ROL A
	; Set bit for whether player is holding an item
	ASL A
	ORA HoldingItem
	TAY
	LDA JumpHeightStanding, Y
	STA PlayerYVelocity

	LDA JumpFloatLength
	STA JumpFloatTimer

PlayerStartJump_Exit:
	LDA #$00
	STA CrouchJumpTimer
	RTS


; =============== S U B R O U T I N E =======================================

;
; Apply gravity to the player's y-velocity
;
; This also handles floating
;
PlayerGravity:
	LDA QuicksandDepth
	CMP #$02
	BCC loc_BANK0_8CE5

	LDA GravityQuicksand
	BNE loc_BANK0_8D13

loc_BANK0_8CE5:
	LDA GravityWithoutJumpButton
	LDY Player1JoypadHeld ; holding jump button to fight physics
	BPL PlayerGravity_Falling

	LDA GravityWithJumpButton
	LDY PlayerYVelocity
	CPY #$FC
	BMI PlayerGravity_Falling

	LDY JumpFloatTimer
	BEQ PlayerGravity_Falling

	DEC JumpFloatTimer
	LDA byte_RAM_10
	LSR A
	LSR A
	LSR A
	AND #$03
	TAY
	LDA FloatingYVelocity, Y
	STA PlayerYVelocity
	RTS

PlayerGravity_Falling:
	LDY PlayerYVelocity
	BMI loc_BANK0_8D13

	CPY #$39
	BCS loc_BANK0_8D18

loc_BANK0_8D13:
	CLC
	ADC PlayerYVelocity
	STA PlayerYVelocity

loc_BANK0_8D18:
	LDA JumpFloatTimer
	CMP JumpFloatLength
	BEQ PlayerGravity_Exit

	LDA #$00
	STA JumpFloatTimer

PlayerGravity_Exit:
	RTS


FloatingYVelocity:
	.db $FC
	.db $00
	.db $04
	.db $00

PlayerXDeceleration:
	.db $FD
	.db $03


; =============== S U B R O U T I N E =======================================

sub_BANK0_8D2C:
	LDA PlayerInAir
	BNE locret_BANK0_8D61

	LDA byte_RAM_10
	AND GroundSlipperiness
	BNE loc_BANK0_8D4D

	LDA PlayerXVelocity
	AND #$80
	ASL A
	ROL A
	TAY
	LDA PlayerXVelocity
	ADC PlayerXDeceleration, Y
	TAX
	EOR PlayerControlAcceleration, Y
	BMI loc_BANK0_8D4B

	LDX #$00

loc_BANK0_8D4B:
	STX PlayerXVelocity

loc_BANK0_8D4D:
	LDA PlayerDucking
	BNE locret_BANK0_8D61

	LDA PlayerAnimationFrame
	CMP #SpriteAnimation_Throwing
	BEQ locret_BANK0_8D61

	LDA #SpriteAnimation_Standing
	STA PlayerAnimationFrame
	LDA #$00
	STA PlayerWalkFrameCounter

loc_BANK0_8D5F:
	STA PlayerWalkFrame

locret_BANK0_8D61:
	RTS

; End of function sub_BANK0_8D2C

; ---------------------------------------------------------------------------

PlayerWalkFrameDurations:
	.db $0C
	.db $0A
	.db $08
	.db $05
	.db $03
	.db $02
	.db $02
	.db $02
	.db $02
	.db $02

PlayerWalkFrames:
	.db SpriteAnimation_Standing ; $00
	.db SpriteAnimation_Walking ; $01
	.db SpriteAnimation_Throwing ; ; $02

; =============== S U B R O U T I N E =======================================

; jump animation subroutine
PlayerWalkJumpAnim:
	LDA PlayerDucking ; exit if we're ducking, since the player will be ducking
	BNE ExitPlayerWalkJumpAnim

	; if we're not in the air, skip ahead
	LDA PlayerInAir
	BEQ PlayerWalkAnim

	LDA CurrentCharacter ; does this character get to flutter jump?
	CMP #Character_Luigi
	BNE ExitPlayerWalkJumpAnim

	LDA PlayerWalkFrameCounter
	BNE UpdatePlayerAnimationFrame ; maintain current frame

	LDA #$02 ; fast animation
	BNE NextPlayerWalkFrame

PlayerWalkAnim:
	LDA PlayerWalkFrameCounter
	BNE UpdatePlayerAnimationFrame ; maintain current frame

	LDA #$05
	LDY GroundSlipperiness
	BNE NextPlayerWalkFrame

	LDA PlayerXVelocity
	BPL PlayerWalkFrameDuration

	; use absolute value of PlayerXVelocity
	EOR #$FF
	CLC
	ADC #$01

PlayerWalkFrameDuration:
	LSR A
	LSR A
	LSR A
	TAY
	LDA PlayerWalkFrameDurations, Y

NextPlayerWalkFrame:
	STA PlayerWalkFrameCounter ; hold frame for duration specified in accumulator
	DEC PlayerWalkFrame
	BPL UpdatePlayerAnimationFrame

	LDA #$01 ; next walk frame
	STA PlayerWalkFrame

UpdatePlayerAnimationFrame:
	LDY PlayerWalkFrame
	LDA PlayerWalkFrames, Y
	STA PlayerAnimationFrame

ExitPlayerWalkJumpAnim:
	RTS


ThrowXVelocity:
	.db $00 ; standing, left (blocks)
	.db $00 ; standing, right (blocks)
	.db $D0 ; moving, left (blocks)
	.db $30 ; moving, right (blocks)
	.db $D0 ; standing, left (projectiles)
	.db $30 ; standing, right (projectiles)
	.db $D0 ; moving, left (projectiles)
	.db $30 ; moving, right (projectiles)

ThrowYVelocity:
	.db $18 ; standing (blocks)
	.db $00 ; moving (blocks)
	.db $18 ; standing (projectiles)
	.db $F8 ; moving (projectiles)

; used for objects that can be thrown next to the player
SoftThrowOffset:
	.db $F0
	.db $10



; Determine the max speed based on the terrain and what the player is carrying.
sub_BANK0_8DC0:
	LDY #$02
	LDA QuicksandDepth
	CMP #$02
	BCS loc_BANK0_8DE0

	DEY
	LDA HoldingItem
	BEQ loc_BANK0_8DDF

	LDX ObjectBeingCarriedIndex
	LDA ObjectType, X
	CMP #Enemy_VegetableSmall
	BCC loc_BANK0_8DE0

	CMP #Enemy_MushroomBlock
	BCC loc_BANK0_8DDF

	CMP #Enemy_FallingLogs
	BCC loc_BANK0_8DE0

loc_BANK0_8DDF:
	DEY

; 1.5x max speed when the run button is held!
loc_BANK0_8DE0:
	LDA RunSpeedRight, Y
	BIT Player1JoypadHeld
	BVC loc_BANK0_8DEC

	LSR A
	CLC
	ADC RunSpeedRight, Y

loc_BANK0_8DEC:
	CMP PlayerXVelocity
	BPL loc_BANK0_8DF2

	STA PlayerXVelocity

loc_BANK0_8DF2:
	LDA RunSpeedLeft, Y
	BIT Player1JoypadHeld
	BVC loc_BANK0_8DFF

	SEC
	ROR A
	CLC
	ADC RunSpeedLeft, Y

loc_BANK0_8DFF:
	CMP PlayerXVelocity
	BMI loc_BANK0_8E05

	STA PlayerXVelocity

; Check to see if we have an item that we want to throw.
loc_BANK0_8E05:
	BIT Player1JoypadPress
	BVC locret_BANK0_8E41

	LDA HoldingItem
	BEQ locret_BANK0_8E41

	LDY #$00
	LDX ObjectBeingCarriedIndex
	LDA EnemyState, X
	CMP #EnemyState_Sand
	BEQ locret_BANK0_8E41

	LDA ObjectType, X
	CMP #Enemy_MushroomBlock
	BCC loc_BANK0_8E22

	CMP #Enemy_POWBlock
	BCC loc_BANK0_8E28

loc_BANK0_8E22:
	CMP #Enemy_Bomb
	BCC loc_BANK0_8E42

	LDY #$02

loc_BANK0_8E28:
	STY byte_RAM_7
	LDA PlayerDirection
	ASL A
	ORA PlayerDucking
	TAX
	LDY TileCollisionHitboxIndex + $06, X
	LDX #$00
	JSR sub_BANK0_924F

	LDA byte_RAM_0
	LDY byte_RAM_7
	JSR CheckTileUsesCollisionType

	BCC loc_BANK0_8E42
	; else carried item can't be thrown

locret_BANK0_8E41:
	RTS

; ---------------------------------------------------------------------------

loc_BANK0_8E42:
	LDA #SpriteAnimation_Throwing
	STA PlayerAnimationFrame
	LDA #$02
	STA PlayerWalkFrame
	LDA #$0A
	STA PlayerWalkFrameCounter
	DEC HoldingItem
	LDA #SoundEffect1_ThrowItem
	STA SoundEffectQueue1
	LDA #$00
	STA PlayerDucking
	STA Player1JoypadPress
	STA byte_RAM_1
	LDX ObjectBeingCarriedIndex
	LDA #Enemy_Coin
	CMP ObjectType, X
	ROL byte_RAM_1
	LDA PlayerXVelocity
	BPL loc_BANK0_8E6F

	EOR #$FF
	CLC
	ADC #$01

loc_BANK0_8E6F:
	CMP #$08
	ROL byte_RAM_1
	BNE loc_BANK0_8E89

	LDY PlayerDirection
	LDA SoftThrowOffset, Y
	CLC
	ADC ObjectXLo, X
	STA ObjectXLo, X
	LDA IsHorizontalLevel
	BEQ loc_BANK0_8E89

	DEY
	TYA
	ADC ObjectXHi, X

loc_BANK0_8E87:
	STA ObjectXHi, X

loc_BANK0_8E89:
	LDY byte_RAM_1
	LDA ThrowYVelocity, Y
	STA ObjectYVelocity, X
	LDA byte_RAM_1
	ASL A
	ORA PlayerDirection
	TAY
	LDA ThrowXVelocity, Y
	STA ObjectXVelocity, X
	LDA #$01
	STA ObjectProjectileTimer, X
	LSR A
	STA ObjectBeingCarriedTimer, X
	RTS


;
; Applies player physics on the y-axis
;
ApplyPlayerPhysicsY:
	LDX #$0A

;
; Applies player physics, although could theoretically be used for objects too
;
; Input
;   X = direction ($00 for horizontal, $0A for vertical)
;
ApplyPlayerPhysics:
	; Add acceleration to velocity
	LDA PlayerXVelocity, X
	CLC
	ADC PlayerXAcceleration, X
	PHP
	BPL loc_BANK0_8EB4

	EOR #$FF
	CLC
	ADC #$01

loc_BANK0_8EB4:
	PHA
	; Upper nybble of velocity is for lo position
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	; Lower nybble of velocity is for subpixel position
	PLA
	ASL A
	ASL A
	ASL A
	ASL A
	CLC

	ADC PlayerXSubpixel, X
	STA PlayerXSubpixel, X

	TYA
	ADC #$00
	PLP
	BPL loc_BANK0_8ED1

	EOR #$FF
	CLC
	ADC #$01

loc_BANK0_8ED1:
	LDY #$00
	CMP #$00
	BPL loc_BANK0_8ED8

	DEY

loc_BANK0_8ED8:
	CLC
	ADC PlayerXLo, X
	STA PlayerXLo, X
	TYA
	ADC PlayerXHi, X
	STA PlayerXHi, X
	LDA #$00
	STA PlayerXAcceleration, X
	RTS


;
; Jumpthrough collision results
;
; This table determines per direction whether a tile is solid (for jumpthrough
; blocks) or interactive (for spikes/ice/conveyors)
;
;   $01 = true
;   $02 = false
;
JumpthroughTileCollisionTable:
InteractiveTileCollisionTable:
	.db $02 ; jumpthrough bottom (y-velocity < 0)
	.db $02
	.db $01 ; jumpthrough top (y-velocity > 0)
	.db $01
	.db $02 ; jumpthrough right (x-velocity < 0)
	.db $02
	.db $02 ; jumpthrough left (x-velocity > 0)
	.db $02

IFDEF ENABLE_TILE_ATTRIBUTES_TABLE
CheckPlayerTileCollisionAttributesTable:
	.db %00001000 ; jumpthrough bottom (y-velocity < 0)
	.db %00001000
	.db %00000100 ; jumpthrough top (y-velocity > 0)
	.db %00000100
	.db %00000010 ; jumpthrough right (x-velocity < 0)
	.db %00000010
	.db %00000001 ; jumpthrough left (x-velocity > 0)
	.db %00000001
ENDIF

;
; Collision flags that should be set if a given collision check passes
;
EnableCollisionFlagTable:
	.db CollisionFlags_Up
	.db CollisionFlags_Up
	.db CollisionFlags_Down
	.db CollisionFlags_Down
	.db CollisionFlags_Left
	.db CollisionFlags_Left
	.db CollisionFlags_Right
	.db CollisionFlags_Right

ConveyorSpeedTable:
	.db $F0
	.db $10


;
; Player Tile Collision
; =====================
;
; Handles player collision with background tiles
;
PlayerTileCollision:
	; Reset a bunch of collision flags
	LDA #$00
	STA PlayerCollision
	STA GroundSlipperiness
	STA byte_RAM_7
	STA byte_RAM_A ; conveyor
	STA byte_RAM_E ; spikes
	STA byte_RAM_C ; ice

	JSR PlayerTileCollision_CheckCherryAndClimbable

	; Determine bounding box lookup index
	LDA PlayerDucking
	ASL A
	ORA HoldingItem
	TAX

	; Look up the bounding box for collision detection
	LDA TileCollisionHitboxIndex, X
	STA byte_RAM_8

	; Determine whether the player is going up
	LDA PlayerYVelocity
	CLC
	ADC PlayerYAcceleration
	BPL PlayerTileCollision_Downward

PlayerTileCollision_Upward:
	JSR CheckPlayerTileCollision_Twice ; use top two tiles
	JSR CheckPlayerTileCollision_IncrementTwice ; skip bottom two tiles

	LDA PlayerCollision
	BNE PlayerTileCollision_CheckDamageTile
	BEQ PlayerTileCollision_Horizontal

PlayerTileCollision_Downward:
	JSR CheckPlayerTileCollision_IncrementTwice ; skip top two tiles
	JSR CheckPlayerTileCollision_Twice ; use bottom two tiles

	LDA PlayerCollision
	BNE PlayerTileCollision_CheckInteractiveTiles

	LDA #$00
	LDX #$01

	; Do the quicksand check in worlds 2 and 6
	LDY CurrentWorldTileset
	CPY #$01
	BEQ PlayerTileCollision_Downward_CheckQuicksand

	CPY #$05
IFNDEF ALWAYS_ALLOW_QUICKSAND
	BNE PlayerTileCollision_Downward_AfterCheckQuicksand
ELSE
	NOP
	NOP
ENDIF

PlayerTileCollision_Downward_CheckQuicksand:
	JSR PlayerTileCollision_CheckQuicksand

PlayerTileCollision_Downward_AfterCheckQuicksand:
	STA QuicksandDepth
	STX PlayerInAir
	JMP PlayerTileCollision_Horizontal

PlayerTileCollision_CheckInteractiveTiles:
	; Reset quicksand depth
	LDA #$00
	STA QuicksandDepth

	LDA PlayerYLo
	AND #$0C
	BNE PlayerTileCollision_Horizontal

	STA PlayerInAir
	LDA PlayerYLo
	AND #$F0
	STA PlayerYLo

PlayerTileCollision_CheckConveyorTile:
	LSR byte_RAM_A
	BCC PlayerTileCollision_CheckSlipperyTile

	LDX byte_RAM_A
	LDA ConveyorSpeedTable, X
	STA PlayerXAcceleration

PlayerTileCollision_CheckSlipperyTile:
	LSR byte_RAM_C
	BCC PlayerTileCollision_CheckJar

	LDA #$0F
	STA GroundSlipperiness

PlayerTileCollision_CheckJar:
	JSR TileBehavior_CheckJar

PlayerTileCollision_CheckDamageTile:
	LDA #$00
	STA PlayerYVelocity
	STA PlayerYAcceleration
	LDA StarInvincibilityTimer
	BNE PlayerTileCollision_Horizontal

	LSR byte_RAM_E
	BCC PlayerTileCollision_Horizontal

	LDA PlayerScreenX
	STA SpriteTempScreenX
	ROR byte_RAM_12

IFNDEF ENABLE_TILE_ATTRIBUTES_TABLE
	JSR PlayerTileCollision_HurtPlayer
ELSE
	LDA byte_RAM_E
	CMP #$02
	BCC PlayerTileCollision_DamageTile
	BNE PlayerTileCollision_HealthTile

	; instant kill
	LDY #$0F
	STY PlayerHealth

PlayerTileCollision_DamageTile:
	JSR PlayerTileCollision_HurtPlayer
	JMP PlayerTileCollision_Horizontal

PlayerTileCollision_HealthTile:
	JSR RestorePlayerToFullHealth
ENDIF

PlayerTileCollision_Horizontal:
	LDY #$02
	LDA PlayerXVelocity
	CLC
	ADC PlayerXAcceleration
	BMI loc_BANK0_8FA3

	DEY
	JSR CheckPlayerTileCollision_IncrementTwice

loc_BANK0_8FA3:
	STY PlayerMovementDirection
	JSR CheckPlayerTileCollision_Twice

	LDA PlayerCollision
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ PlayerTileCollision_Exit

	JMP PlayerHorizontalCollision_Bank0

PlayerTileCollision_Exit:
	RTS


;
; Check collision attributes for the next two tiles
;
; Input
;   byte_RAM_7: collision direction
;   byte_RAM_8: bounding box offset
;
; Output
;   byte_RAM_7 += 2
;   byte_RAM_8 += 2
;
CheckPlayerTileCollision_Twice:
	JSR CheckPlayerTileCollision

IFNDEF ENABLE_TILE_ATTRIBUTES_TABLE
CheckPlayerTileCollision:
	LDX #$00
	LDY byte_RAM_8
	JSR sub_BANK0_924F

	LDX byte_RAM_7
	LDY JumpthroughTileCollisionTable, X
	LDA byte_RAM_0

	JSR CheckTileUsesCollisionType

	BCC CheckPlayerTileCollision_Exit

CheckPlayerTileCollision_CheckSpikes:
	CMP #BackgroundTile_Spikes
	BNE CheckPlayerTileCollision_CheckIce

	LDA InteractiveTileCollisionTable, X
	STA byte_RAM_E
	BNE CheckPlayerTileCollision_UpdatePlayerCollision

CheckPlayerTileCollision_CheckIce:
	CMP #BackgroundTile_JumpThroughIce
	BNE CheckPlayerTileCollision_CheckConveyor

	LDA InteractiveTileCollisionTable, X
	STA byte_RAM_C
	BNE CheckPlayerTileCollision_UpdatePlayerCollision

CheckPlayerTileCollision_CheckConveyor:
	SEC
	SBC #BackgroundTile_ConveyorLeft
	CMP #$02
	BCS CheckPlayerTileCollision_UpdatePlayerCollision

	ASL A
	ORA InteractiveTileCollisionTable, X
	STA byte_RAM_A

CheckPlayerTileCollision_UpdatePlayerCollision:
	LDA EnableCollisionFlagTable, X
	ORA PlayerCollision
	STA PlayerCollision

CheckPlayerTileCollision_Exit:
	JMP CheckPlayerTileCollision_Increment

ELSE
; custom behavior using tile attribute table
CheckPlayerTileCollision:
	LDX #$00
	LDY byte_RAM_8
	JSR sub_BANK0_924F

	LDX byte_RAM_7
	LDY byte_RAM_0

	; check tile attributes
	LDA TileCollisionAttributesTable, Y
	AND CheckPlayerTileCollisionAttributesTable, X

	BEQ CheckPlayerTileCollision_CheckSpikes

	LDA EnableCollisionFlagTable, X
	ORA PlayerCollision
	STA PlayerCollision

CheckPlayerTileCollision_CheckSpikes:
	LDA TileInteractionAttributesTable, Y
	AND #%00000011
	BEQ CheckPlayerTileCollision_CheckIce

	ASL A
	ORA #%00000001
	STA byte_RAM_E

CheckPlayerTileCollision_CheckIce:
	LDA TileInteractionAttributesTable, Y
	AND #%00001100
	BEQ CheckPlayerTileCollision_CheckConveyor
	CMP #%00000100
	BNE CheckPlayerTileCollision_CheckConveyor

	LDA #$01
	STA byte_RAM_C
	BNE CheckPlayerTileCollision_Exit

CheckPlayerTileCollision_CheckConveyor:
	CMP #%00001100
	BNE CheckPlayerTileCollision_Exit

	TYA
	AND #%00000001
	ASL A
	ORA #%00000001
	STA byte_RAM_A

CheckPlayerTileCollision_Exit:
	JMP CheckPlayerTileCollision_Increment
ENDIF


;
; Skip two tiles
;
; Output
;   byte_RAM_7 += 2
;   byte_RAM_8 += 2
;
CheckPlayerTileCollision_IncrementTwice:
	JSR CheckPlayerTileCollision_Increment

CheckPlayerTileCollision_Increment:
	INC byte_RAM_7
	INC byte_RAM_8
	RTS


PlayerTileCollision_CheckCherryAndClimbable:
	LDY TileCollisionHitboxIndex + $0A

	; byte_RAM_10 seems to be a global counter
	; this code increments Y every other frame, but why?
	; Seems like it alternates on each frame between checking the top and bottom of the player.
	LDA byte_RAM_10
	LSR A
	BCS PlayerTileCollision_CheckCherryAndClimbable_AfterTick
	INY

PlayerTileCollision_CheckCherryAndClimbable_AfterTick:
	LDX #$00
	JSR PlayerTileCollision_CheckClimbable

	BCS PlayerTileCollision_Climbable

	LDA byte_RAM_0
	CMP #BackgroundTile_Cherry
	BNE PlayerTileCollision_Climbable_Exit

	INC CherryCount
	LDA CherryCount
	SBC #$05
	BNE PlayerTileCollision_Cherry

	STA CherryCount
	JSR CreateStarman

PlayerTileCollision_Cherry:
	LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1
	LDA #BackgroundTile_Sky
	JMP loc_BANK0_937C

PlayerTileCollision_Climbable:
	LDA Player1JoypadHeld
	AND #ControllerInput_Down | ControllerInput_Up
	BEQ PlayerTileCollision_Climbable_Exit

	LDY HoldingItem
	BNE PlayerTileCollision_Climbable_Exit

	LDA PlayerXLo
	CLC
	ADC #$04
	AND #$0F
	CMP #$08
	BCS PlayerTileCollision_Climbable_Exit

	LDA #PlayerState_Climbing
	STA PlayerState
	STY PlayerInAir
	STY PlayerDucking
	LDA #SpriteAnimation_Climbing
	STA PlayerAnimationFrame

	; Break JSR PlayerTileCollision_CheckCherryAndClimbable
	PLA
	PLA
	; Break JSR PlayerTileCollision
	PLA
	PLA

PlayerTileCollision_Climbable_Exit:
	RTS


;
; Check whether a tile should use the given collision handler type
;
; Input
;   A = tile ID
;   Y = collision handler type (0 = solid for mushroom blocks, 1 = jumpthrough, 2 = solid)
; Output
;   C = whether or not collision type Y is relevant
;
CheckTileUsesCollisionType:
	PHA ; stash tile ID for later

	; determine which tile table to use (0-3)
	AND #$C0
	ASL A
	ROL A
	ROL A

	; add the offset for the type of collision we're checking
	ADC TileGroupTable, Y
	TAY

	; check which side of the tile ID pivot we're on
	PLA
	CMP TileSolidnessTable, Y
	RTS


;
; These map the two high bits of a tile to offets in TileSolidnessTable
;
TileGroupTable:
	.db $00 ; solid to mushroom blocks
	.db $04 ; solid on top
	.db $08 ; solid on all sides


PickUpToEnemyTypeTable:
	.db Enemy_MushroomBlock ; $00
	.db Enemy_MushroomBlock ; $01
	.db Enemy_MushroomBlock ; $02
	.db Enemy_POWBlock ; $03
	.db Enemy_Coin ; $04
	.db Enemy_VegetableLarge ; $05
	.db Enemy_VegetableSmall ; $06
	.db Enemy_Rocket ; $07
	.db Enemy_Shell ; $08
	.db Enemy_Bomb ; $09
	.db Enemy_SubspacePotion ; $0A
	.db Enemy_Mushroom1up ; $0B
	.db Enemy_POWBlock ; $0C
	.db Enemy_BobOmb ; $0D
	.db Enemy_MushroomBlock ; $0E ; this one seems to be overridden for digging in sand


; find a slot for the item being lifted
loc_BANK0_9074:
	LDX #$06

loc_BANK0_9076:
	LDA EnemyState, X
	BEQ loc_BANK0_9080

	INX
	CPX #$09
	BCC loc_BANK0_9076

	RTS

; create the sprite for the item being picked up
loc_BANK0_9080:
	LDA byte_RAM_0
	STA EnemyVariable, X
	LDA byte_RAM_3
	STA ObjectXHi, X
	LDA byte_RAM_4
	STA ObjectYHi, X
	LDA byte_RAM_5
	STA ObjectXLo, X
	LDA byte_RAM_6
	STA ObjectYLo, X
	LDA #$00
	STA ObjectProjectileTimer, X
	STA ObjectAnimationTimer, X
	STA EnemyArray_B1, X
	JSR UnlinkEnemyFromRawData_Bank1

	LDA #EnemyState_Alive
	LDY byte_RAM_9
	CPY #$0E
	BNE loc_BANK0_90AE

	LDA #$20
	STA ObjectTimer1, X
	LDA #EnemyState_Sand

loc_BANK0_90AE:
	STA EnemyState, X
	LDA PickUpToEnemyTypeTable, Y ; What sprite is spawned for you when lifting a bg object
	STA ObjectType, X

	LDY #$FF ; regular bomb fuse
	CMP #Enemy_Bomb
	BEQ loc_BANK0_90C1

	CMP #Enemy_BobOmb
	BNE loc_BANK0_90C5

	LDY #$50 ; BobOmb fuse

loc_BANK0_90C1:
	STY ObjectTimer1, X
	BNE loc_BANK0_90EA

loc_BANK0_90C5:
	CMP #Enemy_Mushroom1up
	BNE loc_BANK0_90D5

	LDA Mushroom1upPulled
	BEQ loc_BANK0_90EA

	LDA #Enemy_VegetableSmall
	STA ObjectType, X

	JMP loc_BANK0_90EA

loc_BANK0_90D5:
	CMP #Enemy_VegetableLarge
	BNE loc_BANK0_90EA

	LDY BigVeggiesPulled
	INY
	CPY #$05
	BCC loc_BANK0_90E7

	LDA #Enemy_Stopwatch
	STA ObjectType, X
	LDY #$00

loc_BANK0_90E7:
	STY BigVeggiesPulled

loc_BANK0_90EA:
	JSR loc_BANK1_B9EB

	LDA #CollisionFlags_Down
	STA EnemyCollision, X
	LDA #BackgroundTile_Sky
	JSR ReplaceTile_Bank0

	LDA #$07
	STA ObjectBeingCarriedTimer, X
	STX ObjectBeingCarriedIndex
	LDA #PlayerState_Lifting
	STA PlayerState
	LDA #$06
	STA PlayerStateTimer
	LDA #SpriteAnimation_Pulling
	STA PlayerAnimationFrame
	INC HoldingItem
	RTS


TileBehavior_CheckJar:
	LDY HoldingItem
	BNE loc_BANK0_917C

	LDA PlayerDucking
	BEQ TileBehavior_CheckPickUp

	LDA byte_RAM_0
	LDX InSubspaceOrJar
	CPX #$02
	BNE TileBehavior_CheckJar_NotSubspace

	; In SubSpace, a non-enterable jar can be entered
	; Now Y = $00
	CMP #BackgroundTile_JarTopNonEnterable
	BEQ TileBehavior_GoDownJar

	BNE loc_BANK0_917C

TileBehavior_CheckJar_NotSubspace:
	INY
	; Now Y = $01
	CMP #BackgroundTile_JarTopGeneric
	BEQ TileBehavior_GoDownJar

	CMP #BackgroundTile_JarTopPointer
	BNE loc_BANK0_917C

	INY
	; Now Y = $02

TileBehavior_GoDownJar:
	LDA PlayerXLo
	CLC
	ADC #$04
	AND #$0F
	CMP #$08
	BCS loc_BANK0_917C

	; Stop horiziontal movement
	LDA #$00
	STA PlayerXVelocity

	; We're going down the jar!
	LDA #PlayerState_GoingDownJar
	STA PlayerState

	; What kind of jar are we going down?
	; $00 = warp, $01 = regular, $02 = pointer
	STY InJarType

;
; Snaps the player to the closest tile (for entering doors and jars)
;
SnapPlayerToTile:
	LDA PlayerXLo
	CLC
	ADC #$08
	AND #$F0
	STA PlayerXLo
	BCC SnapPlayerToTile_Exit

	LDA IsHorizontalLevel
	BEQ SnapPlayerToTile_Exit

	INC PlayerXHi

SnapPlayerToTile_Exit:
	RTS


TileBehavior_CheckPickUp:
	BIT Player1JoypadPress
	BVC loc_BANK0_917C

	; B button pressed

	LDA PlayerXLo
	CLC
	ADC #$06
	AND #$0F
	CMP #$0C
	BCS loc_BANK0_917C

	LDA byte_RAM_0
	CMP #BackgroundTile_DiggableSand
	BNE loc_BANK0_916E

	LDA #$0E
	BNE loc_BANK0_9177

; blocks that can be picked up
loc_BANK0_916E:
	CMP #BackgroundTile_Unused6D
	BCS loc_BANK0_917C

	; convert to an index in PickUpToEnemyTypeTable
	SEC
	SBC #BackgroundTile_MushroomBlock
	BCC loc_BANK0_917C

loc_BANK0_9177:
	STA byte_RAM_9
	JMP loc_BANK0_9074

; ---------------------------------------------------------------------------

loc_BANK0_917C:
	LDA PlayerDucking
	BNE locret_BANK0_91CE

	LDA byte_RAM_6
	SEC
	SBC #$10
	STA byte_RAM_6
	STA byte_RAM_E6
	LDA byte_RAM_4
	SBC #$00
	STA byte_RAM_4
	STA byte_RAM_1
	LDA byte_RAM_3
	STA byte_RAM_2
	JSR sub_BANK0_92C1

	BCS locret_BANK0_91CE

	JSR SetTileOffsetAndAreaPageAddr_Bank1

	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y
	LDX HoldingItem
	BEQ loc_BANK0_91AE

	LDX ObjectBeingCarriedIndex
	LDY ObjectType, X
	CPY #Enemy_Key
	BNE locret_BANK0_91CE

loc_BANK0_91AE:
	LDX InSubspaceOrJar
	CPX #$02
	BEQ loc_BANK0_91BF

	LDY #$04

; check to see if the tile matches one of the door tiles
loc_BANK0_91B7:
	CMP DoorTiles, Y
	BEQ loc_BANK0_91EB

	DEY
	BPL loc_BANK0_91B7

loc_BANK0_91BF:
	BIT Player1JoypadPress
	BVC locret_BANK0_91CE

	STA byte_RAM_0
	CMP #BackgroundTile_GrassInactive
	BCS locret_BANK0_91CE

	SEC
	SBC #BackgroundTile_GrassCoin
	BCS loc_BANK0_91CF

locret_BANK0_91CE:
	RTS

; ---------------------------------------------------------------------------

loc_BANK0_91CF:
	LDX InSubspaceOrJar
	CPX #$02
	BNE loc_BANK0_91E3

	LDA SubspaceVisits
	CMP #$02
	BCS loc_BANK0_91E2 ; skip if we've already visited Subspace twice

	INC SubspaceCoins
	LDX #$00

loc_BANK0_91E2:
	TXA

loc_BANK0_91E3:
	CLC
	ADC #$04
	STA byte_RAM_9
	JMP loc_BANK0_9074

; ---------------------------------------------------------------------------

;
; Checks to see if we're trying to go through the door
;
; Input
;   Y = tile index in DoorTiles
loc_BANK0_91EB:
	LDA Player1JoypadPress
	AND #ControllerInput_Up
	BEQ locret_BANK0_91CE

	; player is holding up and is trying to go through this door
	LDA PlayerXLo
	CLC
	ADC #$05
	AND #$0F
	CMP #$0A
	BCS locret_BANK0_91CE

	CPY #$04 ; index of BackgroundTile_LightDoorEndLevel
	BNE loc_BANK0_9205

	; setting GameMode to $03 to go to Bonus Chance
	DEY
	STY GameMode
	RTS

; ---------------------------------------------------------------------------

loc_BANK0_9205:
	LDA #TransitionType_Door
	STA TransitionType
	TYA
	JSR JumpToTableAfterJump

DoorHandlingPointers:
	.dw DoorHandling_UnlockedDoor ; unlocked door
	.dw DoorHandling_LockedDoor ; locked door
	.dw DoorHandling_Entrance ; dark door
	.dw DoorHandling_Entrance ; light door


DoorHandling_UnlockedDoor:
	JSR DoorAnimation_Unlocked

DoorHandling_GoThroughDoor:
	INC DoorAnimationTimer
	INC PlayerLock
	JSR SnapPlayerToTile

	LDA #DPCM_DoorOpenBombBom
	STA DPCMQueue

DoorHandling_Exit:
	RTS


DoorHandling_LockedDoor:
	LDA HoldingItem
	; don't come to a locked door empty-handed
	BEQ DoorHandling_Exit

	; and make sure you have a key
	LDY ObjectBeingCarriedIndex
	LDA ObjectType, Y
	CMP #Enemy_Key
	BNE DoorHandling_Exit

	; the key has been used
	INC KeyUsed
	TYA
	TAX

	JSR TurnKeyIntoPuffOfSmoke
	JSR DoorAnimation_Locked
	JMP DoorHandling_GoThroughDoor


DoorHandling_Entrance:
	INC DoAreaTransition
	JMP DoAreaReset


DoorTiles:
	.db BackgroundTile_DoorBottom
	.db BackgroundTile_DoorBottomLock
	.db BackgroundTile_DarkDoor
	.db BackgroundTile_LightDoor
	.db BackgroundTile_LightDoorEndLevel


;
; Seems to determine what kind of tile the player has collided with?
;
; Input
;   X = object index (0 = player)
;   Y = bounding box offset
; Output
;   byte_RAM_0 = tile ID
;
sub_BANK0_924F:
	TXA
	PHA
	LDA #$00
	STA byte_RAM_0
	STA byte_RAM_1
	LDA VerticalTileCollisionHitboxX, Y
	BPL loc_BANK0_925E

	DEC byte_RAM_0

loc_BANK0_925E:
	CLC
	ADC PlayerXLo, X
	AND #$F0
	STA byte_RAM_5
	PHP
	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_E5
	PLP
	LDA PlayerXHi, X
	ADC byte_RAM_0
	STA byte_RAM_2
	STA byte_RAM_3
	LDA IsHorizontalLevel
	BNE loc_BANK0_927D

	STA byte_RAM_2
	STA byte_RAM_3

loc_BANK0_927D:
	LDA VerticalTileCollisionHitboxY, Y
	BPL loc_BANK0_9284

	DEC byte_RAM_1

loc_BANK0_9284:
	CLC
	ADC PlayerYLo, X
	AND #$F0
	STA byte_RAM_6
	STA byte_RAM_E6
	LDA PlayerYHi, X
	ADC byte_RAM_1
	STA byte_RAM_1
	STA byte_RAM_4
	JSR sub_BANK0_92C1

	BCC loc_BANK0_929E

	LDA #$00
	BEQ loc_BANK0_92A5

loc_BANK0_929E:
	JSR SetTileOffsetAndAreaPageAddr_Bank1

	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y

loc_BANK0_92A5:
	STA byte_RAM_0
	PLA
	TAX
	RTS


; =============== S U B R O U T I N E =======================================

sub_BANK0_92AA:
	STA byte_RAM_F
	TYA
	BMI locret_BANK0_92C0

	ASL A
	ASL A
	ASL A
	ASL A
	CLC
	ADC byte_RAM_F
	BCS loc_BANK0_92BC

	CMP #$F0
	BCC locret_BANK0_92C0

loc_BANK0_92BC:
	CLC
	ADC #$10
	INY

locret_BANK0_92C0:
	RTS

; End of function sub_BANK0_92AA


;
; NOTE: This is a copy of the "sub_BANK3_BC2E" routine in Bank 3
;
;
sub_BANK0_92C1:
	LDY byte_RAM_1
	LDA byte_RAM_E6
	JSR sub_BANK0_92AA

	STY byte_RAM_1
	STA byte_RAM_E6
	LDY IsHorizontalLevel
	LDA byte_RAM_1, Y
	STA byte_RAM_E8
	LDA byte_RAM_2
	CMP byte_BANK0_92E0 + 1, Y
	BCS locret_BANK0_92DF

	LDA byte_RAM_1
	CMP byte_BANK0_92E0, Y

locret_BANK0_92DF:
	RTS


byte_BANK0_92E0:
	.db $0A
	.db $01
	.db $0B


; Unused?
; Copy of DetermineVerticalScroll
_code_12E3:
	LDX NeedsScroll
	BNE locret_BANK0_9311

	LDA PlayerState
	CMP #PlayerState_Lifting
	BCS locret_BANK0_9311

	LDA PlayerScreenYLo
	LDY PlayerScreenYHi
	BMI loc_BANK0_92FF

	BNE loc_BANK0_9305

	CMP #$B4
	BCS loc_BANK0_9305

	CMP #$21
	BCS loc_BANK0_9307

loc_BANK0_92FF:
	LDY PlayerInAir
	BNE loc_BANK0_9307

	BEQ loc_BANK0_9306

loc_BANK0_9305:
	INX

loc_BANK0_9306:
	INX

loc_BANK0_9307:
	LDA VerticalScrollDirection
	STX VerticalScrollDirection
	BNE locret_BANK0_9311

loc_BANK0_930F:
	STX NeedsScroll

locret_BANK0_9311:
	RTS


PlayerCollisionDirectionTable:
	.db CollisionFlags_Right
	.db CollisionFlags_Left

PlayerCollisionResultTable_Bank0:
	.db CollisionFlags_80
	.db CollisionFlags_00


;
; Enforces the left/right boundaries of horizontal areas
;
PlayerAreaBoundaryCollision:
	LDA IsHorizontalLevel
	BEQ PlayerAreaBoundaryCollision_Exit

	LDA PlayerScreenX
	LDY PlayerMovementDirection
	CPY #$01
	BEQ PlayerAreaBoundaryCollision_CheckRight

PlayerAreaBoundaryCollision_CheckLeft:
	CMP #$08
	BCC PlayerAreaBoundaryCollision_BoundaryHit

PlayerAreaBoundaryCollision_Exit:
	RTS

PlayerAreaBoundaryCollision_CheckRight:
	CMP #$E8
	BCC PlayerAreaBoundaryCollision_Exit

PlayerAreaBoundaryCollision_BoundaryHit:
	LDA PlayerCollision
	ORA PlayerCollisionDirectionTable - 1, Y
	STA PlayerCollision

;
; NOTE: This is a copy of the "PlayerHorizontalCollision" routine in Bank 3
;
PlayerHorizontalCollision_Bank0:
	LDX #$00
	LDY PlayerMovementDirection
	LDA PlayerXVelocity
	EOR PlayerCollisionResultTable_Bank0 - 1, Y
	BPL loc_BANK0_9340

	STX PlayerXVelocity

loc_BANK0_9340:
	LDA PlayerXAcceleration
	EOR PlayerCollisionResultTable_Bank0 - 1, Y
	BPL loc_BANK0_934B

	STX PlayerXAcceleration

loc_BANK0_934B:
	STX PlayerXSubpixel

locret_BANK0_934E:
	RTS


; =============== S U B R O U T I N E =======================================

;
; NOTE: This is a copy of the "sub_BANK3_BC50" routine in Bank 3
;
; Replaces tile when something is picked up
;
; Input
;   A = Target tile
;   X = Enemy index of object being picked up
;
ReplaceTile_Bank0:
	PHA ; Something to update the PPU for some tile change
	LDA ObjectXLo, X
	CLC
	ADC #$08
	PHP
	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_E5
	PLP
	LDA ObjectXHi, X
	LDY IsHorizontalLevel
	BEQ ReplaceTile_StoreXHi_Bank0

	ADC #$00

ReplaceTile_StoreXHi_Bank0:
	STA byte_RAM_2
	LDA ObjectYLo, X
	CLC
	ADC #$08
	AND #$F0
	STA byte_RAM_E6
	LDA ObjectYHi, X
	ADC #$00
	STA byte_RAM_1
	JSR sub_BANK0_92C1

	PLA
	BCS locret_BANK0_934E

;
; Input
;   A = Target tile
;
loc_BANK0_937C:
	; Stash X so we can restore it later on
	STX byte_RAM_3

	; Stash the target tile and figure out where to draw it
	PHA
	JSR SetTileOffsetAndAreaPageAddr_Bank1
	PLA
	; Update the tile in the decoded level data
	LDY byte_RAM_E7
	STA (byte_RAM_1), Y

	PHA
	LDX byte_RAM_300
	LDA #$00
	STA PPUBuffer_301, X
	TYA
	AND #$F0
	ASL A
	ROL PPUBuffer_301, X
	ASL A
	ROL PPUBuffer_301, X
	STA PPUBuffer_301 + 1, X
	TYA
	AND #$0F
	ASL A

	ADC PPUBuffer_301 + 1, X
	STA PPUBuffer_301 + 1, X
	CLC
	ADC #$20
	STA PPUBuffer_301 + 6, X
	LDA IsHorizontalLevel
	ASL A
	TAY
	LDA byte_RAM_1
	AND #$10
	BNE loc_BANK0_93B9

	INY

loc_BANK0_93B9:
	LDA byte_BANK0_940A, Y
	CLC
	ADC PPUBuffer_301, X
	STA PPUBuffer_301, X
	STA PPUBuffer_301 + 5, X
	LDA #$02
	STA PPUBuffer_301 + 2, X
	STA PPUBuffer_301 + 7, X

	PLA
	PHA
	AND #%11000000
	ASL A
	ROL A
	ROL A
	TAY
	; Get the tile quad pointer
	LDA TileQuadPointersLo, Y
	STA byte_RAM_0
	LDA TileQuadPointersHi, Y
	STA byte_RAM_1
	PLA
	ASL A
	ASL A
	TAY
	LDA (byte_RAM_0), Y
	STA PPUBuffer_301 + 3, X
	INY
	LDA (byte_RAM_0), Y
	STA PPUBuffer_301 + 4, X
	INY
	LDA (byte_RAM_0), Y
	STA PPUBuffer_301 + 8, X
	INY
	LDA (byte_RAM_0), Y
	STA PPUBuffer_301 + 9, X
	LDA #$00
	STA PPUBuffer_301 + 10, X
	TXA
	CLC
	ADC #$0A
	STA byte_RAM_300
	LDX byte_RAM_3
	RTS


; Another byte of PPU high addresses for horiz/vert levels
byte_BANK0_940A:
	.db $20
	.db $28
	.db $20
	.db $24


;
; NOTE: This is a copy of the "StashPlayerPosition" routine in Bank 3
;
StashPlayerPosition_Bank0:
	LDA InSubspaceOrJar
	BNE StashPlayerPosition_Exit_Bank0

	LDA PlayerXHi
	STA PlayerXHi_Backup
	LDA PlayerXLo
	STA PlayerXLo_Backup
	LDA PlayerYHi
	STA PlayerYHi_Backup
	LDA PlayerYLo
	STA PlayerYLo_Backup

StashPlayerPosition_Exit_Bank0:
	RTS

;
; Restores the player position from the backup values after exiting a subarea
;
RestorePlayerPosition:
	LDA PlayerXHi_Backup
	STA PlayerXHi
	LDA PlayerXLo_Backup
	STA PlayerXLo
	LDA PlayerYHi_Backup
	STA PlayerYHi
	LDA PlayerYLo_Backup
	STA PlayerYLo
	LDA PlayerXLo
	SEC
	SBC ScreenBoundaryLeftLo
	STA PlayerScreenX
	LDA PlayerYLo
	SEC
	SBC ScreenYLo
	STA PlayerScreenYLo
	LDA PlayerYHi
	SBC ScreenYHi
	STA PlayerScreenYHi
	LDA TransitionType
	SEC
	SBC #TransitionType_SubSpace
	BNE StashPlayerPosition_Exit_Bank0

	; resetting these to zero (A=$00, otherwise we would have branched)
	STA PlayerState
	STA PlayerLock
	STA SubspaceTimer
	JSR DoorAnimation_Unlocked

	LDA #$0A
	STA SubspaceDoorTimer
	RTS


;
; Performs an area transition
;
ApplyAreaTransition:
	LDA TransitionType
	CMP #TransitionType_Jar
	BNE ApplyAreaTransition_NotJar

ApplyAreaTransition_Jar:
	LDA InJarType
	BNE ApplyAreaTransition_NotJar

	JSR RestorePlayerPosition

	JMP ApplyAreaTransition_MoveCamera

ApplyAreaTransition_NotJar:
	LDA CurrentLevelEntryPage
	LDY #$00
	LDX IsHorizontalLevel
	BNE ApplyAreaTransition_Horizontal

ApplyAreaTransition_Vertical:
	STY PlayerXHi
	STA PlayerYHi
	BEQ ApplyAreaTransition_SetPlayerPosition

ApplyAreaTransition_Horizontal:
	STA PlayerXHi
	STY PlayerYHi

ApplyAreaTransition_SetPlayerPosition:
	JSR AreaTransitionPlacement

	; The height of a page is only `$0F` tiles instead of `$10`.
	; PlayerYHi is currently using the vertical page rather than the actual high
	; byte of the absolute position, so we need to convert it to compensate!
	LDY PlayerYHi
	LDA PlayerYLo
	JSR PageHeightCompensation
	STY PlayerYHi
	STA PlayerYLo

	LDA PlayerXLo
	SEC
	SBC ScreenBoundaryLeftLo
	STA PlayerScreenX

	LDA PlayerYLo
	SEC
	SBC ScreenYLo
	STA PlayerScreenYLo

	LDA PlayerYHi
	SBC ScreenYHi
	STA PlayerScreenYHi

	LDA TransitionType
	CMP #TransitionType_SubSpace
	BNE ApplyAreaTransition_MoveCamera

	JSR DoorAnimation_Unlocked

ApplyAreaTransition_MoveCamera:
	LDA PlayerXLo
	SEC
	SBC #$78
	STA MoveCameraX
	RTS


;
; Do the player placement after an area transition
;
AreaTransitionPlacement:
	LDA TransitionType
	JSR JumpToTableAfterJump

	.dw AreaTransitionPlacement_Reset
	.dw AreaTransitionPlacement_Door
	.dw AreaTransitionPlacement_Jar
	.dw AreaTransitionPlacement_Climbing
	.dw AreaTransitionPlacement_Subspace
	.dw AreaTransitionPlacement_Rocket


AreaTransitionPlacement_Reset:
	LDA #$01
	STA PlayerDirection
	JSR AreaTransitionPlacement_Middle

	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_E5
	LDA #$D0
	STA PlayerYLo
	STA byte_RAM_E6
	LDA CurrentLevelEntryPage
	STA byte_RAM_E8

IFDEF LEVEL_ENGINE_UPGRADES
	LDX IsHorizontalLevel
	BEQ AreaTransitionPlacement_Reset_FindOpenSpace

	; Find non-sky to use as the ground
	LDA #$E0
	STA byte_RAM_E6

AreaTransitionPlacement_Reset_FindStandableTile:
	LDA #$0C
	STA byte_RAM_3
AreaTransitionPlacement_Reset_FindStandableTileLoop:
	JSR SetTileOffsetAndAreaPageAddr_Bank1

	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BNE AreaTransitionPlacement_Reset_FindOpenSpaceLoop

	JSR AreaTransitionPlacement_MovePlayerUp1Tile

	STA byte_RAM_E6
	DEC byte_RAM_3
	BNE AreaTransitionPlacement_Reset_FindStandableTileLoop
ENDIF

;
; The player must start in empty space (not a wall)
;
AreaTransitionPlacement_Reset_FindOpenSpace:
	LDA #$0C
	STA byte_RAM_3
AreaTransitionPlacement_Reset_FindOpenSpaceLoop:
	JSR SetTileOffsetAndAreaPageAddr_Bank1

	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y
	CMP #BackgroundTile_Sky
	BEQ AreaTransitionPlacement_MovePlayerUp1Tile

	JSR AreaTransitionPlacement_MovePlayerUp1Tile

	STA byte_RAM_E6
	DEC byte_RAM_3
	BNE AreaTransitionPlacement_Reset_FindOpenSpaceLoop


;
; Moves the player up by one tile
;
AreaTransitionPlacement_MovePlayerUp1Tile:
	LDA PlayerYLo
	SEC
	SBC #$10
	STA PlayerYLo
	RTS


;
; Looks for a door and positions the player at it
;
; The implementation of this requires the destination door to be at the
; OPPOSITE side of the screen from the origin door horizontally, but it can be
; at any position vertically.
;
; If no suitable door is found, the player is positioned to fall from the
; top-middle of the screen instead
;
AreaTransitionPlacement_Door:
	LDA PlayerXLo
	; Switch the x-position to the opposite side of the screen
	CLC
	ADC #$08
	AND #$F0
	EOR #$F0
	STA PlayerXLo

	; Convert to a tile offset
	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_E5

	; Start at the bottom of the page
	LDA #$E0
	STA PlayerYLo
	STA byte_RAM_E6
	LDA CurrentLevelEntryPage
	STA byte_RAM_E8
	LDA #$0D
	STA byte_RAM_3

AreaTransitionPlacement_Door_Loop:
	JSR SetTileOffsetAndAreaPageAddr_Bank1

	; Read the target tile
	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y
	LDY #$05

AreaTransitionPlacement_Door_InnerLoop:
	; See if it matches any door tile
	CMP DoorTiles - 1, Y
	BEQ AreaTransitionPlacement_Door_Exit
	DEY
	BNE AreaTransitionPlacement_Door_InnerLoop

	; Nothing matched on this row, so check the next row or give up
	DEC byte_RAM_3
IFNDEF ROBUST_TRANSITION_SEARCH
	BEQ AreaTransitionPlacement_Door_Fallback
ENDIF
IFDEF ROBUST_TRANSITION_SEARCH
	BEQ AreaTransitionPlacement_DoorCustom
ENDIF

	JSR AreaTransitionPlacement_MovePlayerUp1Tile

	STA byte_RAM_E6
	JMP AreaTransitionPlacement_Door_Loop

AreaTransitionPlacement_Door_Fallback:
	; Place in the middle of the screen if no door is found
	JSR AreaTransitionPlacement_Middle

AreaTransitionPlacement_Door_Exit:
	JSR AreaTransitionPlacement_MovePlayerUp1Tile

	LDA #$00
	STA PlayerLock
	RTS


IFDEF ROBUST_TRANSITION_SEARCH
;
; Looks for a door and positions the player at it
;
; In contrast to the normal door placement routine, this will search all
; x-positions rather than just one opposite the door
;
AreaTransitionPlacement_DoorCustom:
	; Start on the correct page
	LDX CurrentLevelEntryPage
	JSR SetAreaPageAddr_Bank1

	; Start at the bottom right and work backwards
	LDA #$EF
	STA byte_RAM_E7

AreaTransitionPlacement_DoorCustom_Loop:
	; Read the target tile
	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y
	LDY #$05

AreaTransitionPlacement_DoorCustom_InnerLoop:
	; See if it matches any door tile
	CMP DoorTiles - 1, Y
	BEQ AreaTransitionPlacement_DoorCustom_Exit
	DEY
	BNE AreaTransitionPlacement_DoorCustom_InnerLoop

	; No matches on this tile, check the next one or give up
	DEC byte_RAM_E7
	BEQ AreaTransitionPlacement_DoorCustom_Fallback

	JMP AreaTransitionPlacement_DoorCustom_Loop

AreaTransitionPlacement_DoorCustom_Fallback:
	LDA #$20
	STA PlayerYLo
	JSR AreaTransitionPlacement_Middle
	JMP AreaTransitionPlacement_Door_Exit

AreaTransitionPlacement_DoorCustom_Exit:
	LDA byte_RAM_E7
	ASL A
	ASL A
	ASL A
	ASL A
	STA PlayerXLo
	LDA byte_RAM_E7
	AND #$F0
	STA PlayerYLo
	JMP AreaTransitionPlacement_Door_Exit
ENDIF


;
; Place the player at the top of the screen in the middle horizontally
;
AreaTransitionPlacement_Jar:
	LDA #$00
	STA PlayerYLo

;
; Place the player in the air in the middle of the screen horizontally
;
AreaTransitionPlacement_Middle:
	LDA #$01
	STA PlayerInAir
	LDA #$78
	STA PlayerXLo
	RTS

;
; Looks for a climbable tile (vine/chain/ladder) and positions the player at it
;
; The implementation of this requires the destination to be at the OPPOSITE
; side of the screen from the origin horizontally, otherwise the player will
; be climbing on nothing.
;
AreaTransitionPlacement_Climbing:
	LDA PlayerXLo
	; Switch the x-position to the opposite side of the screen
	CLC
	ADC #$08
	AND #$F0
	EOR #$F0
	STA PlayerXLo

	; Switch the y-position to the opposite side of the screen
	LDA PlayerScreenYLo
	CLC
	ADC #$08
	AND #$F0
	EOR #$10
	STA PlayerYLo
	CMP #$F0
	BEQ AreaTransitionPlacement_Climbing_Exit

	DEC PlayerYHi

AreaTransitionPlacement_Climbing_Exit:
IFDEF ROBUST_TRANSITION_SEARCH
	JSR AreaTransitionPlacement_ClimbingCustom

	BCS AreaTransitionPlacement_Climbing_SetPlayerAnimationFrame

	; Try the opposite side of the screen
	LDA PlayerYLo
	EOR #$10
	STA PlayerYLo

	LDA PlayerYHi
	EOR #$FF
	STA PlayerYHi

	JSR AreaTransitionPlacement_ClimbingCustom
	BCC AreaTransitionPlacement_Climbing_UnreversePositionY

	; Found something on the opposite side, so flip Y velocity
	LDY #$01
	LDA PlayerYVelocity
	BMI AreaTransitionPlacement_Climbing_SetYVelocity

	INY
AreaTransitionPlacement_Climbing_SetYVelocity:
	LDA ClimbSpeed, Y
	STA PlayerYVelocity

	BNE AreaTransitionPlacement_Climbing_SetPlayerAnimationFrame

AreaTransitionPlacement_Climbing_UnreversePositionY:
	; Unflip Y position
	LDA PlayerYLo
	EOR #$10
	STA PlayerYLo

	LDA PlayerYHi
	EOR #$FF
	STA PlayerYHi

AreaTransitionPlacement_Climbing_SetPlayerAnimationFrame:
ENDIF

	LDA #SpriteAnimation_Climbing
	STA PlayerAnimationFrame
	RTS


IFDEF ROBUST_TRANSITION_SEARCH
;
; Ouput
;   C = set if a climbable tile was found
;
AreaTransitionPlacement_ClimbingCustom:
	; Target x-position
	LDA PlayerXLo
	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_E5

	; Target y-position
	LDA PlayerYLo
	EOR #$10
	CLC
	ADC #$10
	CMP #$F0
	BNE AreaTransitionPlacement_ClimbingCustom_AfterNudge
	SEC
	SBC #$10
AreaTransitionPlacement_ClimbingCustom_AfterNudge:
	STA byte_RAM_E6

	; Read the target tile
	LDA CurrentLevelEntryPage
	STA byte_RAM_E8
	JSR SetTileOffsetAndAreaPageAddr_Bank1
	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y

	; Check if the target tile is climbable
	LDY #$09
AreaTransitionPlacement_ClimbingCustom_CheckLoop:
	CMP ClimbableTiles, Y
	BNE AreaTransitionPlacement_ClimbingCustom_LoopNext

	RTS

AreaTransitionPlacement_ClimbingCustom_LoopNext:
	DEY
	BPL AreaTransitionPlacement_ClimbingCustom_CheckLoop

	; Target tile is not climbable; start at the right and work backwards
	LDA byte_RAM_E7
	AND #$F0
	STA byte_RAM_E6

	LDA #$0F
	STA byte_RAM_3
	CLC
	ADC byte_RAM_E6
	STA byte_RAM_E7

AreaTransitionPlacement_ClimbingCustom_Loop:
	; Read the target tile
	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y
	LDY #$09

AreaTransitionPlacement_ClimbingCustom_InnerLoop:
	CMP ClimbableTiles, Y
	BEQ AreaTransitionPlacement_ClimbingCustom_SetXPosition
	DEY
	BPL AreaTransitionPlacement_ClimbingCustom_InnerLoop

	; No matches on this tile, check the next one or give up
	DEC byte_RAM_E7
	DEC byte_RAM_3
	BMI AreaTransitionPlacement_ClimbingCustom_NotFound

	JMP AreaTransitionPlacement_ClimbingCustom_Loop

AreaTransitionPlacement_ClimbingCustom_SetXPosition:
	LDA byte_RAM_3
	ASL A
	ASL A
	ASL A
	ASL A
	STA PlayerXLo

	SEC
	RTS

AreaTransitionPlacement_ClimbingCustom_NotFound:
	CLC
	RTS
ENDIF


AreaTransitionPlacement_Subspace:
	LDA PlayerScreenX
	SEC
	SBC MoveCameraX
	EOR #$FF
	CLC
	ADC #$F1
	STA PlayerXLo
	LDA PlayerScreenYLo
	STA PlayerYLo
	DEC PlayerLock
	LDA #$60
	STA SubspaceTimer
	RTS


AreaTransitionPlacement_Rocket:
	JSR AreaTransitionPlacement_Middle
	LDA #$60
	STA PlayerYLo
	RTS


;
; Converts a y-position from page+offset to hi+lo coordinates, compensating for
; the fact that a page height is only $0F tiles, not a full $10.
;
; ##### Input
; - `Y`: page
; - `A`: position on page
;
; ##### Output
; - `Y`: hi position
; - `A`: lo position
;
PageHeightCompensation:
	; If player is above the top, exit
	CPY #$00
	BMI PageHeightCompensation_Exit

	; Convert page to number of tiles
	PHA
	TYA
	ASL A
	ASL A
	ASL A
	ASL A
	STA byte_RAM_F
	PLA

	; Subtract the tiles from the position
	SEC
	SBC byte_RAM_F
	BCS PageHeightCompensation_Exit

	; Carry to the high byte
	DEY

PageHeightCompensation_Exit:
	RTS


IFNDEF ENABLE_TILE_ATTRIBUTES_TABLE
IFNDEF ROBUST_TRANSITION_SEARCH

; Unused space in the original ($95C3 - $95FF)
unusedSpace $9600, $FF
ENDIF
ENDIF


TitleScreenPPUDataPointers:
	.dw PPUBuffer_301
	.dw TitleLayout


WaitForNMI_TitleScreen_TurnOnPPU:
	LDA #PPUMask_ShowLeft8Pixels_BG | PPUMask_ShowLeft8Pixels_SPR | PPUMask_ShowBackground | PPUMask_ShowSprites
	STA PPUMaskMirror

WaitForNMI_TitleScreen:
	LDA ScreenUpdateIndex
	ASL A
	TAX
	LDA TitleScreenPPUDataPointers, X
	STA RAM_PPUDataBufferPointer
	LDA TitleScreenPPUDataPointers + 1, X
	STA RAM_PPUDataBufferPointer + 1

	LDA #$00
	STA NMIWaitFlag
WaitForNMI_TitleScreenLoop:
	LDA NMIWaitFlag
	BPL WaitForNMI_TitleScreenLoop

	RTS


TitleLayout:
	; red lines, vertical, left
	.db $20, $00, $DE, $FD
	.db $20, $01, $DE, $FD
	.db $20, $02, $DE, $FD
	.db $20, $03, $DE, $FD
	; red lines, vertical, right
	.db $20, $1C, $DE, $FD
	.db $20, $1D, $DE, $FD
	.db $20, $1E, $DE, $FD
	.db $20, $1F, $DE, $FD
	; red lines, horizontal, top
	.db $20, $03, $5D, $FD
	.db $20, $23, $5D, $FD
	.db $20, $43, $5D, $FD
	.db $20, $63, $5D, $FD
	; red lines, vertical, bottom
	.db $23, $63, $5D, $FD
	.db $23, $83, $5D, $FD
	.db $23, $A3, $5D, $FD

	; ornate frame, top
	.db $20, $68, $10, $48, $4A, $4C, $4E, $50, $51, $52, $53, $54, $55, $56, $57, $58, $5A, $5C, $5E
	.db $20, $84, $08, $FD, $22, $23, $24, $49, $4B, $4D, $4F
	.db $20, $94, $08, $59, $5B, $5D, $5F, $2E, $2F, $30, $FD
	.db $20, $A4, $03, $25, $26, $27
	.db $20, $B9, $03, $31, $32, $33
	.db $20, $C4, $03, $28, $29, $2A
	.db $20, $D9, $03, $34, $35, $36
	.db $20, $E3, $03, $2B, $2C, $2D
	.db $20, $FA, $03, $37, $38, $39
	.db $21, $03, $02, $3A, $3B
	.db $21, $1B, $02, $40, $41
	; ornate frame, lines down, top
	.db $21, $23, $C6, $3C
	.db $21, $3C, $C6, $42
	; ornate frame, middle
	.db $21, $E3, $01, $3D
	.db $21, $FC, $01, $60
	.db $22, $02, $02, $3E, $3F
	.db $22, $1C, $02, $61, $62
	.db $22, $22, $02, $43, $44
	.db $22, $3C, $02, $63, $64
	.db $22, $43, $01, $45
	.db $22, $5C, $01, $65
	; ornate frame, lines down, bottom
	.db $22, $63, $C6, $3C
	.db $22, $7C, $C4, $42
	; ornate frame, bottom, characters
	.db $22, $C4, $02, $A6, $A8
	.db $22, $E4, $02, $A7, $A9
	.db $22, $FA, $04, $80, $82, $88, $8A
	.db $23, $04, $02, $90, $92
	.db $23, $14, $02, $9E, $A0
	.db $23, $1A, $04, $81, $83, $89, $8B
	.db $23, $23, $03, $46, $91, $93
	.db $23, $2A, $02, $A2, $A4
	.db $23, $2E, $0B, $67, $6C, $6E, $70, $72, $69, $9F, $A1, $75, $98, $9A
	.db $23, $3A, $04, $84, $86, $8C, $8E
	.db $23, $43, $1B, $47, $94, $96, $74, $74, $74, $74, $A3, $A5, $74, $66, $68
	.db $6D, $6F, $71, $73, $6A, $6B, $74, $74, $99, $9B, $74, $85, $87, $8D, $8F
	.db $23, $64, $05, $95, $97, $FD, $AA ,$AB
	.db $23, $77, $04, $9C, $9D, $AA, $AB
	.db $23, $89, $02, $AA, $AB

IFNDEF SM_USA
	; SUPER
	;                  SSSSSSSS  UUUUUUUU  PPPPPPPP  EEEEEEEE  RRRRRRRR
	.db $20, $CB, $0A, $00, $01, $08, $08, $FC, $01, $FC, $08, $FC, $01
	.db $20, $EB, $0A, $02, $03, $08, $08, $0A, $05, $0B, $0C, $0A, $0D
	.db $21, $0B, $0A, $04, $05, $04, $05, $0E, $07, $FC, $08, $0E, $08
	.db $21, $2B, $05, $06, $07, $06, $07, $09
	.db $21, $31, $04, $76, $09, $09, $09

	; TM
	;                  TTT  MMM
	.db $21, $38, $02, $F9, $FA

	; MARIO
	;                  MMMMMMMMMMMMM  AAAAAAAA  RRRRRRRR  III  OOOOOOOO
	.db $21, $46, $0A, $00, $0F, $01, $00, $01, $FC, $01, $08, $00, $01
	.db $21, $66, $0A, $10, $10, $08, $10, $08, $10, $08, $08, $10, $08
	.db $21, $86, $0A, $08, $08, $08, $08, $08, $13, $0D, $08, $08, $08
	.db $21, $A6, $0A, $08, $08, $08, $FC, $08, $0E, $08, $08, $08, $08
	.db $21, $C6, $0A, $08, $08, $08, $10, $08, $08, $08, $08, $04, $05
	.db $21, $E6, $0A, $09, $09, $09, $09, $09, $09, $09, $09, $06, $07

	; BROS
	;                  BBBBBBBB  RRRRRRRR  OOOOOOOO  SSSSSSSS
	.db $21, $51, $08, $FC, $01, $FC, $01, $00, $01, $00, $01 ; BROS
	.db $21, $71, $08, $10, $08, $10, $08, $10, $08, $10, $08
	.db $21, $91, $08, $13, $0D, $13, $0D, $08, $08, $77, $03
	.db $21, $B1, $08, $0E, $08, $0E, $08, $08, $08, $12, $08
	.db $21, $D1, $09, $13, $05, $08, $08, $04, $05, $04, $05, $08
	.db $21, $F1, $09, $11, $07, $09, $09, $06, $07, $06, $07, $09

	; 2
	;             22222222222222222222222
	.db $22, $0E, $04, $14, $15, $16, $17
	.db $22, $2E, $04, $18, $19, $1A, $1B
	.db $22, $4E, $04, $1C, $1D, $1E, $1F
	.db $22, $6E, $04, $FC, $FC, $FC, $20
	.db $22, $8E, $04, $76, $76, $76, $21

	; (C) 1988
	;                  (C)  111  999  888  888
	.db $22, $E9, $05, $F8, $D1, $D9, $D8, $D8 ; (C) 1988

	; NINTENDO
	;                  NNN  III  NNN  TTT  EEE  NNN  DDD  OOO
	.db $22, $EF, $08, $E7, $E2, $E7, $ED, $DE, $E7, $DD, $E8

	.db $23, $CA, $04, $80, $A0, $A0, $20
	.db $23, $D1, $0E, $80, $A8, $AA, $AA, $A2, $22, $00, $00, $88, $AA, $AA, $AA, $AA, $22
	.db $23, $E3, $02, $88, $22
	.db $23, $EA, $04, $F0, $F8, $F2, $F0
	.db $00

ELSE
	; TM
	;                  TTT  MMM
	.db $21, $38, $02, $F9, $FA

	; SUPER
	;                  SSSSSSSS  UUUUUUUU  PPPPPPPP  EEEEEEEE  RRRRRRRR
	.db $21, $45, $0A, $00, $01, $08, $08, $FC, $01, $FC, $08, $FC, $01
	.db $21, $65, $0A, $10, $08, $08, $08, $10, $08, $10, $09, $10, $08
	.db $21, $85, $0A, $77, $03, $08, $08, $13, $05, $FC, $08, $13, $0D
	.db $21, $A5, $0A, $12, $08, $08, $08, $0E, $07, $10, $09, $0E, $08
	.db $21, $C5, $0A, $04, $05, $04, $05, $08, $7F, $FC, $08, $08, $08
	.db $21, $E5, $0A, $06, $07, $06, $07, $09, $7F, $76, $09, $09, $09

	; MARIO
	;                  MMMMMMMMMMMMM  AAAAAAAA  RRRRRRRR  III  OOOOOOOO
	.db $21, $50, $0A, $00, $0F, $01, $00, $01, $FC, $01, $08, $00, $01
	.db $21, $70, $0A, $10, $10, $08, $10, $08, $10, $08, $08, $10, $08
	.db $21, $90, $0A, $08, $08, $08, $08, $08, $13, $0D, $08, $08, $08
	.db $21, $B0, $0A, $08, $08, $08, $FC, $08, $0E, $08, $08, $08, $08
	.db $21, $D0, $0A, $08, $08, $08, $10, $08, $08, $08, $08, $04, $05
	.db $21, $F0, $0A, $09, $09, $09, $09, $09, $09, $09, $09, $06, $07

	; USA
	;                  UUUUUUUUUUUUU  SSSSSSSSSSSSS  AAAAAAAAAAAAA
	.db $22, $0B, $09, $14, $15, $16, $1A, $1B, $1C, $78, $79, $7A
	.db $22, $2B, $09, $17, $18, $19, $1D, $1E, $1F, $7B, $7C, $7D

	; (C)1988,1992 NINTENDO
	;                  (C)  111  999  888  888  ,,,  111  999  999  222
	.db $22, $E7, $0A, $F8, $D1, $D9, $D8, $D8, $F7, $D1, $D9, $D9, $D2

	; NINTENDO
	;                  NNN  III  NNN  TTT  EEE  NNN  DDD  OOO
	.db $22, $F2, $08, $E7, $E2, $E7, $ED, $DE, $E7, $DD, $E8

	.db $23, $D1, $0E, $A0, $A0, $A0, $A0, $A0, $22, $00, $00, $AA, $AA, $AA, $AA, $AA, $A2
	.db $23, $E2, $03, $0C, $0F, $0F
	.db $00
ENDIF

IFDEF PAD_TITLE_SCREEN_PPU_DATA
	.pad TitleLayout + $300, $00
ENDIF

IFNDEF SM_USA
TitleBackgroundPalettes:
	.db $22, $37, $16, $07 ; Most of screen, outline, etc.
	.db $22, $30, $31, $0F ; Unused
	.db $22, $30, $0F, $0F ; Logo
	.db $22, $30, $0F, $0F ; Copyright, Story

TitleSpritePalettes:
	.db $22, $30, $28, $0F ; Unused DDP character palettes
	.db $22, $30, $25, $0F ; There are no sprites on the title screen,
	.db $22, $30, $12, $0F ; so these are totally unused
	.db $22, $30, $23, $0F

ELSE
TitleBackgroundPalettes:
	.db $0F, $27, $17, $07
	.db $0F, $36, $26, $16
	.db $0F, $16, $02, $30
	.db $0F, $30, $25, $16

TitleSpritePalettes:
	.db $0F, $30, $28, $0F
	.db $0F, $30, $25, $0F
	.db $0F, $30, $12, $0F
	.db $0F, $30, $23, $0F
ENDIF

TitleStoryText_STORY:
	.db $EC, $ED, $E8, $EB, $F2 ; STORY

TitleStoryTextPointersHi:
	.db >TitleStoryText_Line01
	.db >TitleStoryText_Line02
	.db >TitleStoryText_Line03
	.db >TitleStoryText_Line04
	.db >TitleStoryText_Line05
	.db >TitleStoryText_Line06
	.db >TitleStoryText_Line07
	.db >TitleStoryText_Line08
	.db >TitleStoryText_Line08 ; For some reason line 8 is referenced twice here, but not used
	.db >TitleStoryText_Line09
	.db >TitleStoryText_Line10
	.db >TitleStoryText_Line11
	.db >TitleStoryText_Line12
	.db >TitleStoryText_Line13
	.db >TitleStoryText_Line14
	.db >TitleStoryText_Line15
	.db >TitleStoryText_Line16

TitleStoryTextPointersLo:
	.db <TitleStoryText_Line01
	.db <TitleStoryText_Line02
	.db <TitleStoryText_Line03
	.db <TitleStoryText_Line04
	.db <TitleStoryText_Line05
	.db <TitleStoryText_Line06
	.db <TitleStoryText_Line07
	.db <TitleStoryText_Line08
	.db <TitleStoryText_Line08
	.db <TitleStoryText_Line09
	.db <TitleStoryText_Line10
	.db <TitleStoryText_Line11
	.db <TitleStoryText_Line12
	.db <TitleStoryText_Line13
	.db <TitleStoryText_Line14
	.db <TitleStoryText_Line15
	.db <TitleStoryText_Line16

TitleStoryText_Line01:
	.db $F0, $E1, $DE, $E7, $FB, $FB, $E6, $DA, $EB, $E2, $E8, $FB, $E8, $E9, $DE, $E7
	.db $DE, $DD, $FB, $DA ; WHEN MARIO OPENED A

TitleStoryText_Line02:
	.db $DD, $E8, $E8, $EB, $FB, $DA, $DF, $ED, $DE, $EB, $FB, $FB, $DC, $E5, $E2, $E6
	.db $DB, $E2, $E7, $E0 ; DOOR AFTER CLIMBING

TitleStoryText_Line03:
	.db $DA, $FB, $E5, $E8, $E7, $E0, $FB, $EC, $ED, $DA, $E2, $EB, $FB, $E2, $E7, $FB
	.db $FB, $E1, $E2, $EC ; A LONG STAIR IN HIS

TitleStoryText_Line04:
	.db $DD, $EB, $DE, $DA, $E6, $F7, $FB, $DA, $E7, $E8, $ED, $E1, $DE, $EB, $FB, $F0
	.db $E8, $EB, $E5, $DD ; DREAM, ANOTHER WORLD

TitleStoryText_Line05:
	.db $EC, $E9, $EB, $DE, $DA, $DD, $FB, $FB, $FB, $DB, $DE, $DF, $E8, $EB, $DE, $FB
	.db $FB, $E1, $E2, $E6 ; SPREAD BEFORE HIM

TitleStoryText_Line06:
	.db $DA, $E7, $DD, $FB, $E1, $DE, $FB, $E1, $DE, $DA, $EB, $DD, $FB, $DA, $FB, $EF
	.db $E8, $E2, $DC, $DE ; AND HE HEARD A VOICE

TitleStoryText_Line07:
	.db $DC, $DA, $E5, $E5, $FB, $DF, $E8, $EB, $FB, $E1, $DE, $E5, $E9, $FB, $ED, $E8
	.db $FB, $FB, $DB, $DE ; CALL FOR HELP TO BE

TitleStoryText_Line08:
	.db $FB, $DF, $EB, $DE, $DE, $DD, $FB, $FB, $DF, $EB, $E8, $E6, $FB, $DA, $FB, $EC
	.db $E9, $DE, $E5, $E5 ; FREED FROM A SPELL

TitleStoryText_Line09:
	.db $DA, $DF, $ED, $DE, $EB, $FB, $FB, $DA, $F0, $DA, $E4, $DE, $E7, $E2, $E7, $E0
	.db $F7, $FB, $FB, $FB ; AFTER AWAKENING,

TitleStoryText_Line10:
	.db $E6, $DA, $EB, $E2, $E8, $FB, $FB, $F0, $DE, $E7, $ED, $FB, $ED, $E8, $FB, $FB
	.db $DA, $FB, $FB, $FB ; MARIO WENT TO A

TitleStoryText_Line11:
	.db $DC, $DA, $EF, $DE, $FB, $FB, $E7, $DE, $DA, $EB, $DB, $F2, $FB, $DA, $E7, $DD
	.db $FB, $FB, $ED, $E8 ; CAVE NEARBY AND TO

TitleStoryText_Line12:
	.db $E1, $E2, $EC, $FB, $FB, $EC, $EE, $EB, $E9, $EB, $E2, $EC, $DE, $FB, $E1, $DE
	.db $FB, $EC, $DA, $F0 ; HIS SURPRISE HE SAW

TitleStoryText_Line13:
	.db $DE, $F1, $DA, $DC, $ED, $E5, $F2, $FB, $FB, $F0, $E1, $DA, $ED, $FB, $E1, $DE
	.db $FB, $EC, $DA, $F0 ; EXACTLY WHAT HE SAW

TitleStoryText_Line14:
	.db $E2, $E7, $FB, $E1, $E2, $EC, $FB, $DD, $EB, $DE, $DA, $E6, $CF, $CF, $CF, $CF
	.db $FB, $FB, $FB, $FB ; IN HIS DREAM....

TitleStoryText_Line15:
	.db $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	.db $FB, $FB, $FB, $FB ; (blank)

TitleStoryText_Line16:
	.db $FB, $FB, $E9, $EE, $EC, $E1, $FB, $EC, $ED, $DA, $EB, $ED, $FB, $DB, $EE, $ED
	.db $ED, $E8, $E7, $FB ; PUSH START BUTTON

TitleAttributeData1:
	.db $23, $CB, $42, $FF
	.db $23, $D1, $01, $CC
	.db $23, $D2, $44, $FF
	.db $23, $D6, $01, $33
	.db $23, $D9, $01, $CC
	.db $23, $DA, $44, $FF

TitleAttributeData2:
	.db $23, $DE, $01, $33
	.db $23, $E1, $01, $CC
	.db $23, $E2, $44, $FF
	.db $23, $E6, $01, $33
	.db $23, $EA, $44, $FF
	.db $23, $E9, $01, $CC
	.db $23, $EE, $01, $33


; =============== S U B R O U T I N E =======================================

TitleScreen:
	LDY #$07 ; Does initialization of RAM.
	STY byte_RAM_1 ; This clears $200 to $7FF.
	LDY #$00
	STY byte_RAM_0
	TYA

InitMemoryLoop:
	STA (byte_RAM_0), Y ; I'm not sure if a different method of initializing memory
; would work better in this case.
	DEY
	BNE InitMemoryLoop

	DEC byte_RAM_1
	LDX byte_RAM_1
	CPX #$02
	BCS InitMemoryLoop ; Stop initialization after we hit $200.

loc_BANK0_9A53:
	LDA #$00
	TAY

InitMemoryLoop2:
	; Clear $0000-$00FF.
	; Notably, this leaves the stack area $0100-$01FF uninitialized.
	; This is not super important, but you might want to do it yourself to
	; track stack corruption or whatever.
	STA byte_RAM_0, Y
	INY
	BNE InitMemoryLoop2

	JSR LoadTitleScreenCHRBanks

	JSR ClearNametablesAndSprites

	LDA PPUSTATUS
	LDA #$3F
	LDY #$00
	STA PPUADDR
	STY PPUADDR

InitTitleBackgroundPalettesLoop:
	LDA TitleBackgroundPalettes, Y
	STA PPUDATA
	INY
	CPY #$20
	BCC InitTitleBackgroundPalettesLoop

	LDA #$01
	STA RAM_PPUDataBufferPointer
	LDA #$03
	STA RAM_PPUDataBufferPointer + 1
	LDA #Stack100_Menu
	STA StackArea
	LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite0000 | PPUCtrl_Background1000 | PPUCtrl_SpriteSize8x8 | PPUCtrl_NMIEnabled
	STA PPUCtrlMirror
	STA PPUCTRL
	JSR WaitForNMI_TitleScreen

	; Draw the title screen (ScreenUpdateIndex is using TitleScreenPPUDataPointers)
	LDA #$01 ; TitleLayout
	STA ScreenUpdateIndex
	JSR WaitForNMI_TitleScreen

	; Cue the music!
	LDA #Music1_Title
	STA MusicQueue1
	JSR WaitForNMI_TitleScreen_TurnOnPPU

	; Set up the delay before showing the story
	LDA #$03
	STA byte_RAM_10
	LDA #$25
	STA byte_RAM_2

	; Prepare to clear the first line of the text area, which is slightly narrower
	LDA #$20
	STA TitleScreenPPUAddrHi
	LDA #$C7
	STA TitleScreenPPUAddrLo
	LDA #$52
	STA TitleScreenPPULength

	; Loop point, wait for NMI then check whether we need to clear the screen
loc_BANK0_9AB4:
	JSR WaitForNMI_TitleScreen

	LDA TitleScreenStoryNeedsClear
	BNE loc_BANK0_9AF3

	; Loop point, just increment the frame timer
loc_BANK0_9ABB:
	INC byte_RAM_10
	LDA byte_RAM_10
	AND #$0F
	BEQ loc_BANK0_9AC6

	JMP loc_BANK0_9B4D

	; Decrement the title screen phase counter
loc_BANK0_9AC6:
	DEC byte_RAM_2
	LDA byte_RAM_2
	CMP #$06
IFNDEF SM_USA
	BNE loc_BANK0_9B4D
ELSE
	BEQ loc_BANK0_9ACE
	JMP loc_BANK0_9B4D
ENDIF

loc_BANK0_9ACE:
	INC TitleScreenStoryNeedsClear
	LDA TitleScreenPPUAddrHi
	STA PPUBuffer_301
	LDA TitleScreenPPUAddrLo
	STA PPUBuffer_301 + 1
	LDA TitleScreenPPULength
	STA PPUBuffer_301 + 2

	; Prepare to clear the remaining lines of the text area
	LDA #$E6
	STA TitleScreenPPUAddrLo
	LDA #$54
	STA TitleScreenPPULength
	LDA #$FB
	STA PPUBuffer_301 + 3
	LDA #$00
	STA PPUBuffer_301 + 4
	BEQ loc_BANK0_9B4D

loc_BANK0_9AF3:
IFNDEF SM_USA
	LDA TitleScreenPPUAddrHi
	STA PPUBuffer_301
	LDA TitleScreenPPUAddrLo
	STA PPUBuffer_301 + 1
	LDA TitleScreenPPULength
	STA PPUBuffer_301 + 2
ELSE
	LDA TitleScreenPPULength
	STA PPUBuffer_301 + 2
	LDA TitleScreenPPUAddrLo
	STA PPUBuffer_301 + 1
	LDA TitleScreenPPUAddrHi
	STA PPUBuffer_301
	; Need to clear a wider row of tiles with "Super Mario" on a single line
	CMP #$21
	BNE loc_BANK0_9B02
	LDA PPUBuffer_301 + 2
	CLC
	ADC #$02
	STA PPUBuffer_301 + 2
	DEC PPUBuffer_301 + 1
ENDIF

loc_BANK0_9B02:
	LDA #$FB
	STA PPUBuffer_301 + 3
	LDA #$00
	STA PPUBuffer_301 + 4
	LDA TitleScreenPPUAddrLo
	CLC
	ADC #$20
	STA TitleScreenPPUAddrLo
	LDA TitleScreenPPUAddrHi
	ADC #$00
	STA TitleScreenPPUAddrHi
	CMP #$23

loc_BANK0_9B1B:
	BCC loc_BANK0_9B4D

	LDA #$20
	STA byte_RAM_10
	LDX #$17
	LDY #$00

loc_BANK0_9B25:
	LDA TitleAttributeData1, Y
	STA PPUBuffer_301 + 4, Y
	INY
	DEX
	BPL loc_BANK0_9B25

	LDA #$00
	STA PPUBuffer_301 + 4, Y
	JSR WaitForNMI_TitleScreen

	LDX #$1B
	LDY #$00

loc_BANK0_9B3B:
	LDA TitleAttributeData2, Y
	STA PPUBuffer_301, Y
	INY
	DEX
	BPL loc_BANK0_9B3B

	LDA #$00
	STA PPUBuffer_301, Y
	JMP loc_BANK0_9B59

; ---------------------------------------------------------------------------

loc_BANK0_9B4D:
	LDA Player1JoypadPress
	AND #ControllerInput_Start
	BEQ loc_BANK0_9B56

	JMP loc_BANK0_9C1F

; ---------------------------------------------------------------------------

loc_BANK0_9B56:
	JMP loc_BANK0_9AB4

; ---------------------------------------------------------------------------

loc_BANK0_9B59:
	JSR WaitForNMI_TitleScreen

	LDA TitleScreenPPUAddrLo + 4
	BEQ loc_BANK0_9B63

	JMP loc_BANK0_9C19

; ---------------------------------------------------------------------------

loc_BANK0_9B63:
	LDA TitleScreenStoryTextIndex
	CMP #$09
	BEQ loc_BANK0_9B93

	LDA TitleScreenStoryTextIndex
	BNE loc_BANK0_9BA3

	DEC byte_RAM_10
	BMI TitleScreen_WriteSTORYText

	JMP loc_BANK0_9C19

; ---------------------------------------------------------------------------

TitleScreen_WriteSTORYText:
	LDA #$20
	STA PPUBuffer_301
	LDA #$AE
	STA PPUBuffer_301 + 1
	LDA #$05 ; Length of STORY text (5 bytes)
	STA PPUBuffer_301 + 2
	LDY #$04 ; Bytes to copy minus one (5-1=4)

TitleScreen_WriteSTORYTextLoop:
	LDA TitleStoryText_STORY, Y ; Copy STORY text to PPU write buffer
	STA PPUBuffer_301 + 3, Y
	DEY
	BPL TitleScreen_WriteSTORYTextLoop

	LDA #$00 ; Terminate STORY text in buffer
	STA PPUBuffer_301 + 8

loc_BANK0_9B93:
	INC TitleScreenStoryTextIndex
	LDA #$21
	STA TitleScreenPPUAddrHi
	LDA #$06
	STA TitleScreenPPUAddrLo
	LDA #$40
	STA TitleScreenStoryTextLineTimer
	BNE loc_BANK0_9C19

loc_BANK0_9BA3:
	DEC TitleScreenStoryTextLineTimer
	BPL loc_BANK0_9C19

loc_BANK0_9BA7:
	LDA #$40
	STA TitleScreenStoryTextLineTimer
	LDA TitleScreenPPUAddrHi
	STA PPUBuffer_301

loc_BANK0_9BB0:
	LDA TitleScreenPPUAddrLo

loc_BANK0_9BB2:
	STA PPUBuffer_301 + 1
	LDA #$14
	STA PPUBuffer_301 + 2
	LDX TitleScreenStoryTextIndex
	DEX
	LDA TitleStoryTextPointersHi, X
	STA byte_RAM_4
	LDA TitleStoryTextPointersLo, X
	STA byte_RAM_3
	LDY #$00
	LDX #$13

loc_BANK0_9BCB:
	LDA (byte_RAM_3), Y
	STA PPUBuffer_301 + 3, Y
	INY
	DEX
	BPL loc_BANK0_9BCB

	LDA #$00
	STA PPUBuffer_301 + 3, Y
	INC TitleScreenStoryTextIndex
	LDA TitleScreenPPUAddrLo
	CLC
	ADC #$40
	STA TitleScreenPPUAddrLo
	LDA TitleScreenPPUAddrHi
	ADC #$00
	STA TitleScreenPPUAddrHi
	LDA TitleScreenStoryTextIndex
	CMP #$09
	BCC loc_BANK0_9C19

	BNE loc_BANK0_9C0B

	LDA #$09
	STA byte_RAM_2
	LDA #$03
	STA byte_RAM_10
	LDA #$20
	STA TitleScreenPPUAddrHi
	LDA #$C7
	STA TitleScreenPPUAddrLo
	LDA #$52
	STA TitleScreenPPULength
	LDA #$00
	STA TitleScreenStoryNeedsClear
	JMP loc_BANK0_9ABB

; ---------------------------------------------------------------------------

loc_BANK0_9C0B:
	CMP #$12
	BCC loc_BANK0_9C19

	INC TitleScreenStoryDone
	LDA #$25
	STA byte_RAM_2
	LDA #$03
	STA byte_RAM_10

loc_BANK0_9C19:
	LDA Player1JoypadHeld
	AND #ControllerInput_Start
	BEQ loc_BANK0_9C35

loc_BANK0_9C1F:
	LDA #Music2_StopMusic
	STA MusicQueue2
	JSR WaitForNMI_TitleScreen

	LDA #$00
	TAY

loc_BANK0_9C2A:
	STA byte_RAM_0, Y
	INY
	CPY #$F0
	BCC loc_BANK0_9C2A

	JMP HideAllSprites

; ---------------------------------------------------------------------------

loc_BANK0_9C35:
	LDA TitleScreenStoryDone
	BEQ loc_BANK0_9C4B

	INC byte_RAM_10
	LDA byte_RAM_10
	AND #$0F
	BNE loc_BANK0_9C4B

	DEC byte_RAM_2
	LDA byte_RAM_2
	CMP #$06
	BNE loc_BANK0_9C4B

	BEQ loc_BANK0_9C4E

loc_BANK0_9C4B:
	JMP loc_BANK0_9B59

; ---------------------------------------------------------------------------

loc_BANK0_9C4E:
	LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite0000 | PPUCtrl_Background1000 | PPUCtrl_SpriteSize8x8 | PPUCtrl_NMIDisabled
	STA PPUCtrlMirror

loc_BANK0_9C52:
	STA PPUCTRL
	JMP loc_BANK0_9A53

; End of function TitleScreen


IFDEF RESPAWN_INSTEAD_OF_DEATH
HandlePlayerState_Respawning:
	; Start from zero
	LDA #PlayerState_Normal
	STA PlayerState
	STA PlayerXVelocity
	STA PlayerYVelocity

	; Are the in a jar?
	LDA InJarType
	BNE HandlePlayerState_Respawning_Jar

	; Are we in subspace?
	LDA InSubspaceOrJar
	BEQ HandlePlayerState_Respawning_Regular

HandlePlayerState_Respawning_Subspace:
	; Exit subspace immediately
	LDA #$00
	STA InSubspaceOrJar
	STA SubspaceTimer

	RTS

HandlePlayerState_Respawning_Jar:
	; Pointer jars reload like an area
	CMP #$02
	BEQ HandlePlayerState_Respawning_AreaReset

HandlePlayerState_Respawning_JarSubArea:
	; Clear the sub-area tile layout
	JSR ResetSubAreaJarLayout

	; Redraw tiles (horizontal level)
	JSR WaitForNMI_TurnOffPPU

	; Set update boundary to page 10 for sub-area
	LDA #$0A
	STA BackgroundUpdateBoundary

HandlePlayerState_Respawning_JarSubArea_Loop:
	JSR WaitForNMI

	JSR sub_BANK0_87AA

	LDA byte_RAM_537
	BEQ HandlePlayerState_Respawning_JarSubArea_Loop

	JSR WaitForNMI_TurnOnPPU
	JSR WaitForNMI

	JSR DoAreaReset

	JSR ApplyAreaTransition

	RTS

HandlePlayerState_Respawning_Regular:
	; Reset level
	LDA CurrentLevel_Init
	STA CurrentLevel
	LDA CurrentLevelArea_Init
	STA CurrentLevelArea
	LDA CurrentLevelEntryPage_Init
	STA CurrentLevelEntryPage
	LDA TransitionType_Init
	STA TransitionType

	; Reset player
	LDA PlayerXLo_Init
	STA PlayerXLo
	LDA PlayerYLo_Init
	STA PlayerYLo
	LDA PlayerScreenX_Init
	STA PlayerScreenX
	LDA PlayerScreenYLo_Init
	STA PlayerScreenYLo
	LDA PlayerYVelocity_Init
	STA PlayerYVelocity
	LDA PlayerState_Init
	STA PlayerState

	LDA #$00
	STA PlayerXVelocity
	STA PlayerCurrentSize
	STA InSubspaceOrJar
	STA SubspaceTimer

	JSR RestorePlayerToFullHealth

	JSR LoadCharacterCHRBanks

HandlePlayerState_Respawning_AreaReset:
	JSR DoAreaReset

	; Break out of HandlePlayerState
	PLA
	PLA
	; Break out of RunFrame
	PLA
	PLA

	; Kick off the level again
	JMP StartLevel
ENDIF

; Unused space in the original ($9C58 - $A1FF)
unusedSpace $A200, $FF


EndingPPUDataPointers:
	.dw PPUBuffer_301
	.dw EndingCorkJarRoom
	.dw EndingCelebrationCeilingTextAndPodium
	.dw EndingCelebrationFloorAndSubconParade
	.dw EndingCelebrationPaletteFade1
	.dw EndingCelebrationPaletteFade2
	.dw EndingCelebrationPaletteFade3
	.dw EndingCelebrationSubconStandStill
	.dw EndingCelebrationUnusedText_THE_END
	.dw EndingCelebrationText_MARIO
	.dw EndingCelebrationText_PRINCESS
	.dw EndingCelebrationText_TOAD
	.dw EndingCelebrationText_LUIGI


WaitForNMI_Ending_TurnOffPPU:
	LDA #$00
	BEQ WaitForNMI_Ending_SetPPUMaskMirror

WaitForNMI_Ending_TurnOnPPU:
	LDA #PPUMask_ShowLeft8Pixels_BG | PPUMask_ShowLeft8Pixels_SPR | PPUMask_ShowBackground | PPUMask_ShowSprites

WaitForNMI_Ending_SetPPUMaskMirror:
	STA PPUMaskMirror

WaitForNMI_Ending:
	LDA ScreenUpdateIndex
	ASL A
	TAX
	LDA EndingPPUDataPointers, X
	STA RAM_PPUDataBufferPointer
	LDA EndingPPUDataPointers + 1, X
	STA RAM_PPUDataBufferPointer + 1

	LDA #$00
	STA NMIWaitFlag
WaitForNMI_EndingLoop:
	LDA NMIWaitFlag
	BPL WaitForNMI_EndingLoop

	RTS


EndingCorkJarRoom:
	.db $20, $00, $9E, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73
	.db $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72
	.db $73, $72, $73
	.db $20, $01, $9E, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72
	.db $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73
	.db $72, $73, $72
	.db $22, $02, $8E, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73
	.db $72, $73
	.db $22, $03, $8E, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72
	.db $73, $72
	.db $23, $44, $18, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73
	.db $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73
	.db $23, $64, $18, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72
	.db $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72
	.db $23, $84, $18, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73
	.db $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73
	.db $23, $A4, $18, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72
	.db $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72
	.db $22, $1C, $8E, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73
	.db $72, $73
	.db $22, $1D, $8E, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72
	.db $73, $72
	.db $20, $1E, $9E, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73
	.db $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72
	.db $73, $72, $73
	.db $20, $1F, $9E, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72
	.db $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73, $72, $73
	.db $72, $73, $72
	.db $22, $C6, $C4, $FC
	.db $22, $C7, $C4, $FC
	.db $22, $C8, $84, $AD, $AC, $AC, $AC
	.db $22, $E9, $83, $AD, $AC, $AC
	.db $23, $0A, $82, $AD, $AC
	.db $23, $2B, $01, $AD
	.db $22, $90, $84, $88, $89, $89, $8C
	.db $22, $91, $84, $8A, $8B, $8B, $8D
	.db $23, $0E, $06, $74, $76, $74, $76, $74, $76
	.db $23, $2E, $06, $75, $77, $75, $77, $75, $77
	.db $23, $C0, $20, $22, $00, $00, $00, $00, $00, $00, $88, $22, $00, $00, $00, $00, $00, $00, $88, $22, $00
	.db $00, $00, $00, $00, $00, $88, $22, $00, $00, $00, $00, $00, $00, $88
	.db $23, $E0, $20, $AA, $00, $00, $00, $00, $00, $00, $AA, $AA, $00, $00, $00, $11, $00, $00, $AA, $AA
	.db $A0, $A0, $A4, $A5, $A0, $A0, $AA, $0A, $0A, $0A, $0A, $0A, $0A, $0A, $0A
	.db $00

EndingCelebrationUnusedText_THANK_YOU:
	.db $21, $0C, $09, $ED, $E1, $DA, $E7, $E4, $FB, $F2, $E8, $EE
	.db $00

CorkRoomSpriteStartX:
	.db $30 ; player
	.db $80 ; subcon 8
	.db $80 ; subcon 7
	.db $80 ; subcon 6
	.db $80 ; subcon 5
	.db $80 ; subcon 4
	.db $80 ; subcon 3
	.db $80 ; subcon 2
	.db $80 ; subcon 1
	.db $80 ; cork

CorkRoomSpriteStartY:
	.db $B0 ; player
	.db $A0 ; subcon 8
	.db $A0 ; subcon 7
	.db $A0 ; subcon 6
	.db $A0 ; subcon 5
	.db $A0 ; subcon 4
	.db $A0 ; subcon 3
	.db $A0 ; subcon 2
	.db $A0 ; subcon 1
	.db $95 ; cork

CorkRoomSpriteTargetX:
	.db $10 ; player
	.db $F4 ; subcon 8
	.db $0C ; subcon 7
	.db $E8 ; subcon 6
	.db $18 ; subcon 5
	.db $EC ; subcon 4
	.db $14 ; subcon 3
	.db $F8 ; subcon 2
	.db $08 ; subcon 1
	.db $00 ; cork

CorkRoomSpriteTargetY:
	.db $00 ; player
	.db $C4 ; subcon 8
	.db $C4 ; subcon 7
	.db $B8 ; subcon 6
	.db $B8 ; subcon 5
	.db $A8 ; subcon 4
	.db $A8 ; subcon 3
	.db $A0 ; subcon 2
	.db $A0 ; subcon 1
	.db $00 ; cork

CorkRoomSpriteDelay:
	.db $00 ; player
	.db $F0 ; subcon 8
	.db $E0 ; subcon 7
	.db $C0 ; subcon 6
	.db $A0 ; subcon 5
	.db $80 ; subcon 4
	.db $60 ; subcon 3
	.db $40 ; subcon 2
	.db $20 ; subcon 1
	.db $00 ; cork

CorkRoomSpriteAttributes:
	.db $00 ; player
	.db $21 ; subcon 8
	.db $61 ; subcon 7
	.db $21 ; subcon 6
	.db $61 ; subcon 5
	.db $21 ; subcon 4
	.db $61 ; subcon 3
	.db $21 ; subcon 2
	.db $61 ; subcon 1
	.db $22 ; cork


FreeSubconsScene:
	JSR WaitForNMI_Ending_TurnOffPPU
	JSR ClearNametablesAndSprites

	LDA #Stack100_Menu
	STA StackArea
	LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite0000 | PPUCtrl_Background1000 | PPUCtrl_SpriteSize8x16 | PPUCtrl_NMIEnabled
	STA PPUCtrlMirror
	STA PPUCTRL
	JSR WaitForNMI_Ending

	LDA #EndingUpdateBuffer_JarRoom
	STA ScreenUpdateIndex
	JSR WaitForNMI_Ending

	LDA #$60
	STA FreeSubconsTimer
	LDA #$01
	STA PlayerDirection
	LSR A
	STA PlayerState ; A=$00
	STA FreeSubconsCorkCounter
	STA CrouchJumpTimer
	STA byte_RAM_E6
	STA byte_RAM_E5
	STA SpriteFlickerSlot

	LDX #$09
FreeSubconsScene_SpriteLoop:
	LDA CorkRoomSpriteStartX, X
	STA ObjectXLo - 1, X
	LDA CorkRoomSpriteStartY, X
	STA ObjectYLo - 1, X
	LDA CorkRoomSpriteTargetX, X
	STA ObjectXVelocity - 1, X
	LDA CorkRoomSpriteTargetY, X
	STA ObjectYVelocity - 1, X
	LDA CorkRoomSpriteDelay, X
	STA ObjectTimer1 - 1, X
	LDA CorkRoomSpriteAttributes, X
	STA ObjectAttributes - 1, X
	DEX
	BPL FreeSubconsScene_SpriteLoop

FreeSubconsScene_JumpingLoop:
	JSR WaitForNMI_Ending_TurnOnPPU

	INC byte_RAM_10
	JSR HideAllSprites

	JSR FreeSubconsScene_Player

	JSR FreeSubconsScene_Cork

	LDA FreeSubconsTimer
	BEQ FreeSubconsScene_Exit

	LDA byte_RAM_10
	AND #$07
	BNE FreeSubconsScene_JumpingLoop

	DEC FreeSubconsTimer
	LDA FreeSubconsTimer
	CMP #$25
	BNE FreeSubconsScene_JumpingLoop

	LDY #Music2_EndingAndCast
	STY MusicQueue2
	BNE FreeSubconsScene_JumpingLoop

FreeSubconsScene_Exit:
	JSR EndingSceneTransition

	LDA byte_RAM_E6
	BEQ FreeSubconsScene_JumpingLoop

	RTS


;
; Moves the player, driving the main action in the scene
;
FreeSubconsScene_Player:
	LDA PlayerWalkFrameCounter
	BEQ FreeSubconsScene_Player_AfterWalkFrameCounter

	DEC PlayerWalkFrameCounter

FreeSubconsScene_Player_AfterWalkFrameCounter:
	LDA PlayerStateTimer
	BEQ FreeSubconsScene_Player_AfterStateTimer

	DEC PlayerStateTimer

FreeSubconsScene_Player_AfterStateTimer:
	LDA PlayerXLo
	STA PlayerScreenX
	LDA PlayerYLo
	STA PlayerScreenYLo
	JSR RenderPlayer

	LDA PlayerState
	JSR JumpToTableAfterJump

	.dw FreeSubconsScene_Phase1
	.dw FreeSubconsScene_Phase2
	.dw FreeSubconsScene_Phase3
	.dw FreeSubconsScene_Phase4
	.dw FreeSubconsScene_Phase5


; Walking in and first jump
FreeSubconsScene_Phase1:
	JSR PlayerWalkJumpAnim

	JSR ApplyPlayerPhysicsX

	; check x-position to trigger first jump
	LDA PlayerXLo
	CMP #$3E
	BCC FreeSubconsScene_PhaseExit

	INC PlayerState
	INC PlayerInAir
	LDA #SpriteAnimation_Jumping
	STA PlayerAnimationFrame

FreeSubconsScene_Jump:
	LDA #SoundEffect2_Jump
	STA SoundEffectQueue2
	JMP PlayerStartJump


; Physics and second jump
FreeSubconsScene_Phase2:
	JSR PlayerWalkJumpAnim

	JSR ApplyPlayerPhysicsX

	JSR ApplyCorkRoomGravity

	JSR ApplyPlayerPhysicsY

	LDA PlayerYVelocity
	BMI FreeSubconsScene_PhaseExit

	; check y-position to trigger second jump
	LDA PlayerYLo
	CMP #$A0
	BCC FreeSubconsScene_Phase2_NoJump

	; set x-velocity to land second jump on the jar
	LDA #$0C
	STA PlayerXVelocity
	JMP FreeSubconsScene_Jump

FreeSubconsScene_Phase2_NoJump:
	; check the top of the jar
	CMP #$75
	BCC FreeSubconsScene_PhaseExit

	; check x-position for jar
	LDA PlayerXLo
	CMP #$70
	BCC FreeSubconsScene_PhaseExit

	INC PlayerState
	DEC PlayerInAir

FreeSubconsScene_PhaseExit:
	RTS


; Start pulling the cork
FreeSubconsScene_Phase3:
	JSR PlayerWalkJumpAnim

	JSR ApplyPlayerPhysicsX

	; check x-position for jar
	LDA PlayerXLo
	CMP #$80
	BCC FreeSubconsScene_PhaseExit

	; pull the cork
	INC PlayerState
	INC HoldingItem
	LDA #SpriteAnimation_Pulling
	STA PlayerAnimationFrame
	LDA #$05
	STA FreeSubconsCorkCounter
	LDA #$28
	STA PlayerStateTimer
	RTS


PullCorkFrameDurations:
	.db $14
	.db $0A
	.db $14
	.db $0A

PullCorkOffsets:
	.db $1C
	.db $1B
	.db $1E
	.db $1D
	.db $1F


; Pull the cork out
FreeSubconsScene_Phase4:
	; use PlayerStateTimer to hold this frame
	LDA PlayerStateTimer
	BNE FreeSubconsScene_Phase4_Exit

	; next FreeSubconsCorkCounter to move cork
	DEC FreeSubconsCorkCounter
	BNE FreeSubconsScene_Phase4_NextCorkFrame

	; uncorked! start jumping
	INC PlayerState
	INC PlayerInAir

	LDA #SpriteAnimation_Jumping
	STA PlayerAnimationFrame

	LDA #DPCM_ItemPull
	STA DPCMQueue

	LDA #$A0
	STA ObjectYVelocity + 8
	RTS

FreeSubconsScene_Phase4_NextCorkFrame:
	LDY FreeSubconsCorkCounter
	LDA PullCorkFrameDurations - 1, Y
	STA PlayerStateTimer

FreeSubconsScene_Phase4_Exit:
	RTS


; Free Subcons and jump repeatedly
FreeSubconsScene_Phase5:
	JSR FreeSubconsScene_Subcons

	JSR ApplyCorkRoomGravity

	JSR PlayerWalkJumpAnim

	JSR ApplyPlayerPhysicsY

	LDA PlayerYVelocity
	BMI FreeSubconsScene_Phase5_Exit

	; jump when we're on the jar
	LDA PlayerYLo
	CMP #$80
	BCC FreeSubconsScene_Phase5_Exit

	JMP PlayerStartJump

FreeSubconsScene_Phase5_Exit:
	RTS


CorkRoomCharacterGravity:
	.db $04 ; Mario
	.db $04 ; Princess
	.db $04 ; Toad
	.db $01 ; Luigi


ApplyCorkRoomGravity:
	LDY CurrentCharacter
	LDA CorkRoomCharacterGravity, Y
	CLC
	ADC PlayerYVelocity
	STA PlayerYVelocity
	RTS


;
; Spits out Subcons and makes them flap their little wings
;
FreeSubconsScene_Subcons:
	LDX #$07

FreeSubconsScene_Subcons_Loop:
	STX byte_RAM_12
	LDA ObjectTimer1, X
	BEQ FreeSubconsScene_Subcons_Movement

	CMP #$01
	BNE FreeSubconsScene_Subcons_Next

	LDA #SoundEffect1_ThrowItem
	STA SoundEffectQueue1
	BNE FreeSubconsScene_Subcons_Next

FreeSubconsScene_Subcons_Movement:
	JSR ApplyObjectMovement_Bank1

	LDA ObjectYVelocity, X
	CMP #$08
	BMI FreeSubconsScene_Subcons_Render

	LDA #$00
	STA ObjectXVelocity, X
	LDA #$F9
	STA ObjectYVelocity, X
	LDA CorkRoomSpriteAttributes + 1, X
	EOR #ObjAttrib_Palette0 | ObjAttrib_16x32
	STA ObjectAttributes, X

FreeSubconsScene_Subcons_Render:
	LDA byte_RAM_10
	ASL A
	AND #$02
	STA byte_RAM_F
	JSR FreeSubconsScene_Render

	INC ObjectTimer1, X

FreeSubconsScene_Subcons_Next:
	DEC ObjectTimer1, X
	DEX
	BPL FreeSubconsScene_Subcons_Loop

	RTS



FreeSubconsScene_Cork:
	LDA #$04
	STA byte_RAM_F
	LDX #$08
	STX byte_RAM_12
	JSR FreeSubconsScene_Render

	LDY FreeSubconsCorkCounter
	BNE FreeSubconsScene_Cork_Pull

	LDA ObjectYLo + 8
	CMP #$F0
	BCS FreeSubconsScene_Cork_Exit

	JMP ApplyObjectPhysicsY_Bank1

FreeSubconsScene_Cork_Pull:
	LDA PullCorkOffsets - 1, Y
	CLC
	ADC PlayerYLo
	STA ObjectYLo + 8

FreeSubconsScene_Cork_Exit:
	RTS


CorkRoomSpriteTiles:
	.db $E8 ; subcon left, wings up
	.db $EA ; subcon right, wings up
	.db $EC ; subcon left, wings down
	.db $EE ; subcon right, wings down
	.db $61 ; cork left
	.db $63 ; cork right

CorkRoomSpriteOAMAddress:
	.db $30 ; subcon 8
	.db $38 ; subcon 7
	.db $40 ; subcon 6
	.db $48 ; subcon 5
	.db $50 ; subcon 4
	.db $58 ; subcon 3
	.db $60 ; subcon 2
	.db $68 ; subcon 1
	.db $00 ; cork


FreeSubconsScene_Render:
	LDY CorkRoomSpriteOAMAddress, X
	LDA ObjectYLo, X
	STA SpriteDMAArea, Y
	STA SpriteDMAArea + 4, Y
	LDA ObjectXLo, X
	STA SpriteDMAArea + 3, Y
	CLC
	ADC #$08
	STA SpriteDMAArea + 7, Y
	LDA ObjectAttributes, X
	STA SpriteDMAArea + 2, Y
	STA SpriteDMAArea + 6, Y
	LDX byte_RAM_F
	AND #ObjAttrib_16x32
	BNE FreeSubconsScene_Render_Flipped

	LDA CorkRoomSpriteTiles, X
	STA SpriteDMAArea + 1, Y
	LDA CorkRoomSpriteTiles + 1, X
	BNE FreeSubconsScene_Render_Exit

FreeSubconsScene_Render_Flipped:
	LDA CorkRoomSpriteTiles + 1, X
	STA SpriteDMAArea + 1, Y
	LDA CorkRoomSpriteTiles, X

FreeSubconsScene_Render_Exit:
	STA SpriteDMAArea + 5, Y
	LDX byte_RAM_12
	RTS


EndingCelebrationCeilingTextAndPodium:
	.db $20, $00, $20
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81

	.db $20, $20, $20
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80

	.db $20, $40, $20
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81

	.db $20, $60, $20
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80

	.db $20, $88, $01, $5A
	.db $20, $89, $4E, $9A
	.db $20, $97, $01, $5C
	.db $20, $A8, $C3, $9B
	.db $20, $B7, $C3, $9B
	.db $21, $08, $01, $5B
	.db $21, $09, $4E, $9A
	.db $21, $17, $01, $5D
	.db $20, $AB, $0B, $DC, $E8, $E7, $ED, $EB, $E2, $DB, $EE, $ED, $E8, $EB
	.db $20, $E3, $04, $40, $42, $44, $46
	.db $20, $F9, $04, $40, $42, $44, $46
	.db $21, $23, $C9, $48
	.db $21, $24, $C9, $49
	.db $21, $25, $C9, $4A
	.db $21, $26, $C9, $4B
	.db $22, $43, $04, $4C, $4D, $4E, $4F
	.db $21, $03, $04, $41, $43, $45, $47
	.db $21, $19, $04, $41, $43, $45, $47
	.db $21, $39, $C9, $48
	.db $21, $3A, $C9, $49
	.db $21, $3B, $C9, $4A
	.db $21, $3C, $C9, $4B
	.db $22, $59, $04, $4C, $4D, $4E, $4F
	.db $21, $CA, $4C, $54
	.db $21, $EA, $4C, $55
	.db $22, $0B, $0A, $50, $52, $50, $52, $50, $52, $50, $52, $50, $52
	.db $22, $2B, $0A, $51, $53, $51, $53, $51, $53, $51, $53, $51, $53
	.db $22, $4C, $02, $3A, $3B
	.db $22, $6C, $C5, $3C
	.db $22, $6D, $C5, $3D
	.db $22, $52, $02, $3A, $3B
	.db $22, $72, $C5, $3C
	.db $22, $73, $C5, $3D
	.db $00

EndingCelebrationFloorAndSubconParade:
	.db $23, $00, $20
	.db $00, $02, $08, $0A, $0C, $0E, $04, $06, $08, $0A, $04, $06, $0C, $0E, $04, $06
	.db $08, $0A, $00, $02, $0C, $0E, $0C, $0E, $00, $02, $04, $06, $04, $06, $08, $0A

	.db $23, $20, $20
	.db $01, $03, $09, $0B, $0D, $0F, $05, $07, $09, $0B, $05, $07, $0D, $0F, $05, $07
	.db $09, $0B, $01, $03, $0D, $0F, $0D, $0F, $01, $03, $05, $07, $05, $07, $09, $0B

	.db $27, $00, $20
	.db $74, $76, $74, $76, $74, $76, $74, $76, $74, $76, $74, $76, $74, $76, $74, $76
	.db $74, $76, $74, $76, $74, $76, $74, $76, $74, $76, $74, $76, $74, $76, $74, $76

	.db $27, $20, $20
	.db $75, $77, $75, $77, $75, $77, $75, $77, $75, $77, $75, $77, $75, $77, $75, $77
	.db $75, $77, $75, $77, $75, $77, $75, $77, $75, $77, $75, $77, $75, $77, $75, $77

	.db $23, $40, $20
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81

	.db $23, $60, $20
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80

	.db $23, $80, $20
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81

	.db $23, $A0, $20
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80

	.db $27, $40, $20
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81

	.db $27, $60, $20
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80

	.db $27, $80, $20
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81
	.db $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81

	.db $27, $A0, $20
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80
	.db $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80, $81, $80

	.db $23, $C0, $48, $AA
	.db $23, $C8, $08, $15, $05, $FF, $FF, $FF, $FF, $15, $45

	.db $23, $D0, $20
	.db $31, $00, $FF, $FF, $FF, $FF, $00, $44, $33, $00, $A6, $A5, $A5, $A6, $00, $44
	.db $F3, $F0, $59, $AA, $AA, $96, $F0, $74, $DD, $FF, $55, $AA, $AA, $95, $55, $55

	.db $23, $F0, $48, $A5
	.db $23, $F8, $48, $0A
	.db $27, $F0, $48, $A5
	.db $27, $F8, $48, $0A
	.db $00

EndingCelebrationSubconStandStill:
	.db $23, $00, $20
	.db $70, $72, $70, $72, $70, $72, $70, $72, $70, $72, $70, $72, $70, $72, $70, $72
	.db $70, $72, $70, $72, $70, $72, $70, $72, $70, $72, $70, $72, $70, $72, $70, $72
	.db $23, $20, $20
	.db $71, $73, $71, $73, $71, $73, $71, $73, $71, $73, $71, $73, $71, $73, $71, $73
	.db $71, $73, $71, $73, $71, $73, $71, $73, $71, $73, $71, $73, $71, $73, $71, $73
	.db $00

EndingCelebrationUnusedText_THE_END:
	.db $21, $AC, $07
	.db $ED, $E1, $DE, $FB, $DE, $E7, $DD
	.db $00

EndingCelebrationPaletteFade1:
	.db $3F, $00, $20
	.db $01, $30, $21, $0F
	.db $01, $30, $16, $0F
	.db $01, $28, $18, $0F
	.db $01, $30, $30, $01
	.db $01, $27, $16, $0F
	.db $01, $37, $2A, $0F
	.db $01, $27, $30, $0F
	.db $01, $36, $25, $0F
	.db $00

EndingCelebrationPaletteFade2:
	.db $3F, $00, $20
	.db $0F, $10, $00, $0F
	.db $0F, $10, $00, $0F
	.db $0F, $10, $00, $0F
	.db $0F, $10, $00, $0F
	.db $0F, $10, $00, $0F
	.db $0F, $10, $00, $0F
	.db $0F, $10, $00, $0F
	.db $0F, $10, $00, $0F
	.db $00

EndingCelebrationPaletteFade3:
	.db $3F, $00, $20
	.db $0F, $00, $0F, $0F
	.db $0F, $00, $0F, $0F
	.db $0F, $00, $0F, $0F
	.db $0F, $00, $0F, $0F
	.db $0F, $00, $0F, $0F
	.db $0F, $00, $0F, $0F
	.db $0F, $00, $0F, $0F
	.db $0F, $00, $0F, $0F
	.db $00

EndingScreenUpdateIndex:
	.db EndingUpdateBuffer_PaletteFade1
	.db EndingUpdateBuffer_PaletteFade2 ; 1 ; @TODO This seems wrong, somehow
	.db EndingUpdateBuffer_PaletteFade3 ; 2

ContributorSpriteZeroOAMData:
	.db $8C, $FC, $20, $94

ContributorCharacterOAMData:
	; Mario
	.db $4F, $61, $20, $50
	.db $4F, $63, $20, $58
	.db $5F, $65, $20, $50
	.db $5F, $67, $20, $58
	; Luigi
	.db $4F, $69, $21, $68
	.db $4F, $6B, $21, $70
	.db $5F, $6D, $21, $68
	.db $5F, $6F, $21, $70
	; Toad
	.db $4F, $83, $22, $88
	.db $4F, $83, $62, $90
	.db $5F, $87, $22, $88
	.db $5F, $87, $62, $90
	; Princess
	.db $4F, $8B, $23, $A0
	.db $4F, $8D, $23, $A8
	.db $5F, $8F, $23, $A0
	.db $5F, $91, $23, $A8


;
; Shows the part of the ending where the Subcons carry Wart to an uncertain
; fate while the characters stand and wave
;
ContributorScene:
	JSR WaitForNMI_Ending_TurnOffPPU

	LDA #VMirror
	JSR ChangeNametableMirroring

	JSR ClearNametablesAndSprites

	LDA #Stack100_Menu
	STA StackArea
	JSR EnableNMI_Bank1

	JSR WaitForNMI_Ending

	LDA #EndingUpdateBuffer_CeilingTextAndPodium
	STA ScreenUpdateIndex
	JSR WaitForNMI_Ending

	LDA #EndingUpdateBuffer_FloorAndSubconParade
	STA ScreenUpdateIndex
	JSR WaitForNMI_Ending

	JSR Ending_GetContributor

	JSR WaitForNMI_Ending

	LDA #HMirror
	JSR ChangeNametableMirroring

	LDY #$03
ContributorScene_SpriteZeroLoop:
	LDA ContributorSpriteZeroOAMData, Y
	STA SpriteDMAArea, Y
	DEY
	BPL ContributorScene_SpriteZeroLoop

	LDA #$00
	STA byte_RAM_F3
	STA byte_RAM_E6

	LDY #$3F
ContributorScene_CharacterLoop:
	LDA ContributorCharacterOAMData, Y
	STA SpriteDMAArea + $10, Y
	DEY
	BPL ContributorScene_CharacterLoop

	LDA #$FF
	STA PlayerXHi
	LDA #$A0
	STA PlayerXLo
	LDA #$08
	STA PlayerXVelocity
	LDA #$01
	STA IsHorizontalLevel

loc_BANK1_AAD4:
	JSR WaitForNMI_Ending_TurnOnPPU

	INC byte_RAM_F3
	INC byte_RAM_10
	JSR ContributorTicker

	JSR loc_BANK1_ABCC

	LDA byte_RAM_E6
	CMP #$03
	BCS loc_BANK1_AB20

loc_BANK1_AAE7:
	BIT PPUSTATUS
	BVS loc_BANK1_AAE7

loc_BANK1_AAEC:
	BIT PPUSTATUS
	BVC loc_BANK1_AAEC

	LDX #$02

loc_BANK1_AAF3:
	LDY #$00

loc_BANK1_AAF5:
	LDA byte_RAM_0
	LDA byte_RAM_0
	DEY
	BNE loc_BANK1_AAF5

	DEX
	BNE loc_BANK1_AAF3

	LDA PPUSTATUS
	LDA byte_RAM_F2
	STA PPUSCROLL
	LDA #$00
	STA PPUSCROLL
	LDA byte_RAM_F3
	CMP #$0A
	BCC loc_BANK1_AB1D

	LDA #$00
	STA byte_RAM_F3
	LDA byte_RAM_F2
	SEC
	SBC #$30
	STA byte_RAM_F2

loc_BANK1_AB1D:
	JMP loc_BANK1_AAD4

; ---------------------------------------------------------------------------

loc_BANK1_AB20:
	LDA #VMirror
	JSR ChangeNametableMirroring

	LDA #$01
	STA byte_RAM_F2
	LSR A
	STA byte_RAM_F3
	STA byte_RAM_7
	LDA #EndingUpdateBuffer_SubconStandStill
	STA ScreenUpdateIndex

loc_BANK1_AB32:
	JSR WaitForNMI_Ending

	JSR EnableNMI_Bank1

	INC byte_RAM_F3
	JSR ContributorTicker

	JSR ContributorCharacterAnimation

loc_BANK1_AB40:
	BIT PPUSTATUS
	BVS loc_BANK1_AB40

loc_BANK1_AB45:
	BIT PPUSTATUS
	BVC loc_BANK1_AB45

	LDX #$02

loc_BANK1_AB4C:
	LDY #$00

loc_BANK1_AB4E:
	LDA byte_RAM_0
	LDA byte_RAM_0
	DEY
	BNE loc_BANK1_AB4E

	DEX
	BNE loc_BANK1_AB4C

	LDA #$B0
	ORA byte_RAM_F2
	STA PPUCtrlMirror
	STA PPUCTRL
	LDA PPUSTATUS
	LDA #$00
	STA PPUSCROLL
	LDA #$00
	STA PPUSCROLL
	LDA byte_RAM_F3
	CMP #$14
	BCC loc_BANK1_AB80

	LDA #$00
	STA byte_RAM_F3
	LDA byte_RAM_F2
	EOR #$01
	STA byte_RAM_F2
	INC byte_RAM_7

loc_BANK1_AB80:
	LDA byte_RAM_7
	CMP #$29
	BCC loc_BANK1_AB32

	JSR EndingSceneTransition

	LDA byte_RAM_E6
	CMP #$04
	BCC loc_BANK1_AB32

	RTS


;
; Advances to the next scene and does the palette transition
;
EndingSceneTransition:
	LDA byte_RAM_10
	AND #$03
	BNE EndingSceneTransition_Exit

	INC byte_RAM_E5
	LDY byte_RAM_E5
	CPY #$03
	BCS EndingSceneTransition_Next

	LDA EndingScreenUpdateIndex, Y
	STA ScreenUpdateIndex
	RTS

EndingSceneTransition_Next:
	INC byte_RAM_E6

EndingSceneTransition_Exit:
	RTS


; ---------------------------------------------------------------------------

loc_BANK1_ABA7:
	LDA byte_RAM_10
	AND #$03
	BNE EndingSceneTransition_Exit

	DEC byte_RAM_E5
	LDY byte_RAM_E5
	LDA EndingScreenUpdateIndex, Y
	STA ScreenUpdateIndex
	TYA
	BNE EndingSceneTransition_Exit

	INC byte_RAM_E6
	RTS


EnableNMI_Bank1:
	LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite0000 | PPUCtrl_Background1000 | PPUCtrl_SpriteSize8x16 | PPUCtrl_NMIEnabled
	STA PPUCtrlMirror
	STA PPUCTRL
	RTS


DisableNMI_Bank1:
	LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite0000 | PPUCtrl_Background1000 | PPUCtrl_SpriteSize8x16 | PPUCtrl_NMIDisabled
	STA PPUCTRL
	STA PPUCtrlMirror
	RTS



loc_BANK1_ABCC:
	JSR ContributorCharacterAnimation

	LDA byte_RAM_E6
	JSR JumpToTableAfterJump

	.dw loc_BANK1_ABA7
	.dw loc_BANK1_AC0A
	.dw loc_BANK1_AC87


byte_BANK1_ABDA:
	.db $C0
	.db $C8
	.db $B8
	.db $B8
	.db $C8
	.db $C0

byte_BANK1_ABE0:
	.db $C0
	.db $08
	.db $E0
	.db $F0
	.db $D0
	.db $E8

EndingWartTiles:
	.db $11
	.db $13
	.db $19
	.db $1B
	.db $21
	.db $23
	.db $15
	.db $17
	.db $1D
	.db $1F
	.db $25
	.db $27

byte_BANK1_ABF2:
	.db $00
	.db $08
	.db $10
	.db $18
	.db $20
	.db $28
	.db $00
	.db $08
	.db $10
	.db $18
	.db $20
	.db $28

byte_BANK1_ABFE:
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $10
	.db $10
	.db $10
	.db $10
	.db $10
	.db $10


; ---------------------------------------------------------------------------

loc_BANK1_AC0A:
	JSR ApplyPlayerPhysicsX

	LDA PlayerXHi
	CMP #$01
	BNE loc_BANK1_AC37

	LDA PlayerXLo
	CMP #$20
	BCC loc_BANK1_AC37

	INC_abs byte_RAM_E6

	LDA #$A0
	STA byte_RAM_10
	LDX #$05

loc_BANK1_AC22:
	LDA #$20
	STA ObjectXLo, X
	LDA #$A8

loc_BANK1_AC28:
	STA ObjectYLo, X
	LDA byte_BANK1_ABDA, X
	STA ObjectXVelocity, X
	LDA byte_BANK1_ABE0, X
	STA ObjectYVelocity, X
	DEX
	BPL loc_BANK1_AC22

loc_BANK1_AC37:
	LDY #$A0
	LDA byte_RAM_10
	AND #$38
	BNE loc_BANK1_AC40

	DEY

loc_BANK1_AC40:
	AND #$08
	BNE loc_BANK1_AC45

	DEY

loc_BANK1_AC45:
	STY PlayerYLo
	LDX #$0B
	LDY #$70

loc_BANK1_AC4B:
	LDA PlayerYLo
	CLC
	ADC byte_BANK1_ABFE, X
	STA SpriteDMAArea, Y
	LDA EndingWartTiles, X
	STA SpriteDMAArea + 1, Y
	LDA #$01
	STA SpriteDMAArea + 2, Y
	LDA PlayerXLo
	CLC
	ADC byte_BANK1_ABF2, X
	STA SpriteDMAArea + 3, Y
	LDA PlayerXHi

loc_BANK1_AC6A:
	ADC #$00
	BEQ loc_BANK1_AC73

	LDA #$F0
	STA SpriteDMAArea, Y

loc_BANK1_AC73:
	INY
	INY
	INY
	INY
	DEX
	BPL loc_BANK1_AC4B

	RTS


ZonkTiles:
	.db $39
	.db $35
	.db $37
	.db $35
	.db $37
	.db $39

byte_BANK1_AC81:
	.db $00
	.db $06
	.db $03
	.db $09
	.db $0F
	.db $0C


loc_BANK1_AC87:
	LDA byte_RAM_10
	BNE loc_BANK1_ACA4

loc_BANK1_AC8B:
	STA ObjectXSubpixel + 6
	STA ObjectYSubpixel + 6
	STA ObjectXLo + 6
	STA byte_RAM_10
	LDA #$6F
	STA ObjectYLo + 6
	LDA #$E6
	STA ObjectXVelocity + 6
	LDA #$DA
	STA ObjectYVelocity + 6

	INC_abs byte_RAM_E6


loc_BANK1_ACA4:
	LDX #$05

loc_BANK1_ACA6:
	STX byte_RAM_12
	JSR ApplyObjectPhysicsX_Bank1

	JSR ApplyObjectPhysicsY_Bank1

	LDY #$F0
	LDA byte_RAM_10
	BEQ loc_BANK1_ACC1

	AND #$0F
	CMP byte_BANK1_AC81, X
	BNE loc_BANK1_ACC3

	LDA #$20
	STA ObjectXLo, X
	LDY #$A8

loc_BANK1_ACC1:
	STY ObjectYLo, X

loc_BANK1_ACC3:
	TXA
	ASL A
	ASL A
	TAY
	LDA ObjectXLo, X
	CMP #$80
	BCS loc_BANK1_ACD1

	LDA #$F0
	BNE loc_BANK1_ACD6

loc_BANK1_ACD1:
	STA SpriteDMAArea + $73, Y
	LDA ObjectYLo, X

loc_BANK1_ACD6:
	STA SpriteDMAArea + $70, Y
	LDA ZonkTiles, X
	STA SpriteDMAArea + $71, Y
	LDA #$00
	STA SpriteDMAArea + $72, Y
	DEX
	BPL loc_BANK1_ACA6

	RTS


ContributorAnimationTiles:
ContributorAnimationTiles_Mario:
	.db $61
	.db $61
	.db $63
	.db $93
	.db $65
	.db $65
	.db $67
	.db $67
ContributorAnimationTiles_Luigi:
	.db $69
	.db $69
	.db $95
	.db $6B
	.db $6D
	.db $6D
	.db $97
	.db $6F
ContributorAnimationTiles_Toad:
	.db $83
	.db $85
	.db $83
	.db $85
	.db $87
	.db $89
	.db $87
	.db $89
ContributorAnimationTiles_Princess:
	.db $8B
	.db $8B
	.db $99
	.db $8D
	.db $8F
	.db $8F
	.db $91
	.db $91

ContributorAnimationTilesOffset:
	.db (ContributorAnimationTiles_Mario - ContributorAnimationTiles + 6)
	.db (ContributorAnimationTiles_Luigi - ContributorAnimationTiles + 6)
	.db (ContributorAnimationTiles_Toad - ContributorAnimationTiles + 6)
	.db (ContributorAnimationTiles_Princess - ContributorAnimationTiles + 6)


ContributorCharacterAnimation:
	INC PlayerWalkFrame
	LDA #$03
	STA byte_RAM_0
	LDA PlayerWalkFrame
	STA byte_RAM_1
	LDY #$3C

ContributorCharacterAnimation_OuterLoop:
	LDX byte_RAM_0
	LDA ContributorAnimationTilesOffset, X
	TAX
	INC byte_RAM_1
	LDA byte_RAM_1
	AND #$10
	BEQ ContributorCharacterAnimation_Render

	INX

ContributorCharacterAnimation_Render:
	LDA #$03
	STA byte_RAM_2
ContributorCharacterAnimation_InnerLoop:
	LDA ContributorAnimationTiles, X
	STA SpriteDMAArea + $11, Y
	DEX
	DEX
	DEY
	DEY
	DEY
	DEY
	DEC byte_RAM_2
	BPL ContributorCharacterAnimation_InnerLoop

	DEC byte_RAM_0
	BPL ContributorCharacterAnimation_OuterLoop

	RTS


;
; Calculates the list of top contributors
;
Ending_GetContributor:
	LDA #$00
	STA MaxLevelsCompleted

	LDY #$03
Ending_GetContributor_Loop:
	LDA CharacterLevelsCompleted, Y
	CMP MaxLevelsCompleted
	BCC Ending_GetContributor_Next

	LDA CharacterLevelsCompleted, Y
	STA MaxLevelsCompleted

Ending_GetContributor_Next:
	DEY
	BPL Ending_GetContributor_Loop

	LDX #$00
	LDY #$03
Ending_GetContributor_Loop2:
	LDA CharacterLevelsCompleted, Y
	CMP MaxLevelsCompleted
	BNE Ending_GetContributor_Next2

	TYA
	STA Contributors, X
	INX

Ending_GetContributor_Next2:
	DEY
	BPL Ending_GetContributor_Loop2

	DEX
	STX NumContributors
	LDX #$00
	LDA #$21
	STA PPUBuffer_301, X
	INX
	LDA #$2A
	STA PPUBuffer_301, X
	INX
	LDA #$0C
	STA PPUBuffer_301, X
	INX
	LDY #$00
	LDA CharacterLevelsCompleted, Y
	JSR sub_BANK1_AE43

	TYA
	STA PPUBuffer_301, X
	INX
	LDA byte_RAM_1
	STA PPUBuffer_301, X
	INX
	LDA #$FB
	STA PPUBuffer_301, X
	INX
	LDY #$03
	LDA CharacterLevelsCompleted, Y
	JSR sub_BANK1_AE43

	TYA
	STA PPUBuffer_301, X
	INX
	LDA byte_RAM_1
	STA PPUBuffer_301, X
	INX

	LDA #$FB
	STA PPUBuffer_301, X
	INX
	STA PPUBuffer_301, X
	INX
	LDY #$02
	LDA CharacterLevelsCompleted, Y
	JSR sub_BANK1_AE43

	TYA
	STA PPUBuffer_301, X
	INX
	LDA byte_RAM_1
	STA PPUBuffer_301, X
	INX
	LDA #$FB
	STA PPUBuffer_301, X
	INX
	LDY #$01
	LDA CharacterLevelsCompleted, Y
	JSR sub_BANK1_AE43

	TYA
	STA PPUBuffer_301, X
	INX
	LDA byte_RAM_1
	STA PPUBuffer_301, X
	INX
	LDA #$00
	STA PPUBuffer_301, X
	LDA #$3C
	STA ContributorTimer
	RTS


; =============== S U B R O U T I N E =======================================

ContributorTicker:
	DEC ContributorTimer
	BPL ContributorTicker_Exit

	LDA #$3C
	STA ContributorTimer
	LDY ContributorIndex
	LDA Contributors, Y
	CLC
	ADC #$09

	STA_abs ScreenUpdateIndex

	DEC ContributorIndex
	BPL ContributorTicker_Exit

	LDA NumContributors
	STA ContributorIndex

ContributorTicker_Exit:
	RTS


EndingCelebrationText_MARIO:
	.db $20, $ED, $08, $E6, $DA, $EB, $E2, $E8, $FB, $FB, $FB
	.db $00

EndingCelebrationText_PRINCESS:
	.db $20, $ED, $08, $E9, $EB, $E2, $E7, $DC, $DE, $EC, $EC
	.db $00

EndingCelebrationText_TOAD:
	.db $20, $ED, $08, $ED, $E8, $DA, $DD, $FB, $FB, $FB, $FB
	.db $00

EndingCelebrationText_LUIGI:
	.db $20, $ED, $08, $E5, $EE, $E2, $E0, $E2, $FB, $FB, $FB
	.db $00


; =============== S U B R O U T I N E =======================================

sub_BANK1_AE43:
	LDY #$D0

loc_BANK1_AE45:
	CMP #$0A
	BCC loc_BANK1_AE4F

	SBC #$0A

loc_BANK1_AE4B:
	INY
	JMP loc_BANK1_AE45

; ---------------------------------------------------------------------------

loc_BANK1_AE4F:
	ORA #$D0
	CPY #$D0
	BNE loc_BANK1_AE57

	LDY #$FB

loc_BANK1_AE57:
	STA byte_RAM_1
	RTS

; End of function sub_BANK1_AE43

; ---------------------------------------------------------------------------

; Unused space in the original ($AE5A - $B8FF)
unusedSpace $B900, $FF

MysteryCharacterData3900:
	.db $FB ; @TODO ??? Not sure what this is
	.db $FF
	.db $00
	.db $08
	.db $0C
	.db $18
	.db $1A


;
; NOTE: A copy of this subroutine also exists in Bank 2
;
; Applies object physics for the y-axis
;
; Input
;   X = enemy index
;
ApplyObjectPhysicsY_Bank1:
	TXA
	CLC
	ADC #$0A
	TAX

;
; NOTE: A copy of this subroutine also exists in Bank 2
;
; Applies object physics for the x-axis
;
; Input
;   X = enemy index, physics direction
;       ($00-$09 for horizontal, $0A-$13 for vertical)
;
; Output
;   X = RAM_12
;
ApplyObjectPhysicsX_Bank1:
	; Add acceleration to velocity
	LDA ObjectXVelocity, X
	CLC
	ADC ObjectXAcceleration, X

	PHA
	; Lower nybble of velocity is for subpixel position
	ASL A
	ASL A
	ASL A
	ASL A
	STA byte_RAM_1

	; Upper nybble of velocity is for lo position
	PLA
	LSR A
	LSR A
	LSR A
	LSR A

	CMP #$08
	BCC ApplyObjectPhysics_StoreVelocityLo_Bank1

	; Left/up: Carry negative bits through upper nybble
	ORA #$F0

ApplyObjectPhysics_StoreVelocityLo_Bank1:
	STA byte_RAM_0

	LDY #$00
	ASL A
	BCC ApplyObjectPhysics_StoreDirection_Bank1

	; Left/up
	DEY

ApplyObjectPhysics_StoreDirection_Bank1:
	STY byte_RAM_2

	; Add lower nybble of velocity for subpixel position
	LDA ObjectXSubpixel, X
	CLC
	ADC byte_RAM_1
	STA ObjectXSubpixel, X

	; Add upper nybble of velocity for lo position
	LDA ObjectXLo, X
	ADC byte_RAM_0
	STA ObjectXLo, X

ApplyObjectPhysics_PositionHi_Bank1:
	LSR byte_RAM_1
	LDA ObjectXHi, X
	ADC byte_RAM_2
	STA ObjectXHi, X

ApplyObjectPhysics_Exit_Bank1:
	LDX byte_RAM_12
	RTS



;
; Applies object physics
;
; Input
;   X = enemy index
;
ApplyObjectMovement_Bank1:
	LDA ObjectShakeTimer, X
	BNE ApplyObjectMovement_Vertical_Bank1

	JSR ApplyObjectPhysicsX_Bank1

ApplyObjectMovement_Vertical_Bank1:
	JSR ApplyObjectPhysicsY_Bank1

	LDA ObjectYVelocity, X
	BMI ApplyObjectMovement_Gravity_Bank1

	; Check terminal velocity
	CMP #$3E
	BCS ApplyObjectMovement_Exit_Bank1

ApplyObjectMovement_Gravity_Bank1:
	INC ObjectYVelocity, X
	INC ObjectYVelocity, X

ApplyObjectMovement_Exit_Bank1:
	RTS


DoorAnimation_Locked:
	LDA #$01
	BNE DoorAnimation

DoorAnimation_Unlocked:
	LDA #$00

DoorAnimation:
	PHA
	LDY #$08

DoorAnimation_Loop:
	; skip if inactive
	LDA EnemyState, Y
	BEQ DoorAnimation_LoopNext

	; skip enemies that aren't the door
	LDA ObjectType, Y
	CMP #Enemy_SubspaceDoor
	BNE DoorAnimation_LoopNext

	LDA #EnemyState_PuffOfSmoke
	STA EnemyState, Y
	LDA #$20
	STA ObjectTimer1, Y

DoorAnimation_LoopNext:
	DEY
	BPL DoorAnimation_Loop

	JSR CreateEnemy_TryAllSlots_Bank1

	BMI DoorAnimation_Exit

	LDA #$00
	STA DoorAnimationTimer
	STA SubspaceDoorTimer
	LDX byte_RAM_0
	PLA
	STA EnemyArray_477, X
	LDA #Enemy_SubspaceDoor
	STA ObjectType, X
	LDA PlayerXLo
	ADC #$08
	AND #$F0
	STA ObjectXLo, X
	LDA PlayerXHi
	ADC #$00
	STA ObjectXHi, X
	LDA PlayerYLo
	STA ObjectYLo, X
	LDA PlayerYHi
	STA ObjectYHi, X
	LDA #ObjAttrib_Palette1 | ObjAttrib_16x32
	STA ObjectAttributes, X
	LDX byte_RAM_12
	RTS

DoorAnimation_Exit:
	PLA
	RTS


CreateStarman:
	JSR CreateEnemy_Bank1

	BMI CreateStarman_Exit

	LDX byte_RAM_0
	LDA #Enemy_Starman
	STA ObjectType, X
	LDA ScreenBoundaryLeftLo
	ADC #$D0
	STA ObjectXLo, X
	LDA ScreenBoundaryLeftHi
	ADC #$00
	STA ObjectXHi, X
	LDA ScreenYLo
	ADC #$E0
	STA ObjectYLo, X
	LDA ScreenYHi
	ADC #$00
	STA ObjectYHi, X
	JSR loc_BANK1_BA17

	LDX byte_RAM_12

CreateStarman_Exit:
	RTS


; =============== S U B R O U T I N E =======================================

EnemyInit_Basic_Bank1:
	LDA #$00
	STA ObjectTimer1, X
	LDA #$00
	STA EnemyVariable, X

loc_BANK1_B9EB:
	LDA #$00
	STA EnemyArray_B1, X
	STA ObjectProjectileTimer, X
	STA ObjectBeingCarriedTimer, X
	STA ObjectAnimationTimer, X
	STA ObjectShakeTimer, X
	STA EnemyCollision, X
	STA ObjectStunTimer, X
	STA ObjectTimer2, X
	STA ObjectXAcceleration, X
	STA ObjectYAcceleration, X
	STA ObjectFlashTimer, X
	STA EnemyArray_477, X
	STA EnemyArray_480, X
	STA EnemyHP, X
	STA ObjectYVelocity, X
	STA ObjectXVelocity, X

; look up object attributes
loc_BANK1_BA17:
	LDY ObjectType, X
	LDA ObjectAttributeTable, Y
	AND #ObjAttrib_Palette | ObjAttrib_Horizontal | ObjAttrib_FrontFacing | ObjAttrib_Mirrored | ObjAttrib_BehindBackground | ObjAttrib_16x32
	STA ObjectAttributes, X
	LDA EnemyArray_46E_Data, Y
	STA EnemyArray_46E, X
	LDA ObjectHitbox_Data, Y
	STA ObjectHitbox, X
	LDA EnemyArray_492_Data, Y
	STA EnemyArray_492, X
	RTS

; End of function EnemyInit_Basic_Bank1


;
; Turns the key into a puff of smoke
;
; Input
;   X = enemy slot
; Output
;   X = value of byte_RAM_12
;
TurnKeyIntoPuffOfSmoke:
	LDA ObjectAttributes, X
	AND #%11111100
	ORA #ObjAttrib_Palette1
	STA ObjectAttributes, X
	LDA #EnemyState_PuffOfSmoke
	STA EnemyState, X
	STA ObjectAnimationTimer, X
	LDA #$1F
	STA ObjectTimer1, X
	LDX byte_RAM_12
	RTS


;
; NOTE: This is a copy of the "UnlinkEnemyFromRawData" routine in Bank 2, but
; it is used here for spawning the door animation and Starman objects.
;
; Spawned enemies are linked to an offset in the raw enemy data, which prevents
; from being respawned until they are killed or moved offscreen.
;
; This subroutine ensures that the enemy in a particular slot is not linked to
; the raw enemy data
;
; Input
;   X = enemy slot
;
UnlinkEnemyFromRawData_Bank1:
	LDA #$FF
	STA EnemyRawDataOffset, X
	RTS


;
; Updates the area page and tile placement offset
;
; Input
;   byte_RAM_E8 = area page
;   byte_RAM_E5 = tile placement offset shift
;   byte_RAM_E6 = previous tile placement offset
; Output
;   RAM_1 = low byte of decoded level data RAM
;   RAM_2 = low byte of decoded level data RAM
;   byte_RAM_E7 = target tile placement offset
;
SetTileOffsetAndAreaPageAddr_Bank1:
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank1

	LDA byte_RAM_E6
	CLC
	ADC byte_RAM_E5
	STA byte_RAM_E7
	RTS


DecodedLevelPageStartLo_Bank1:
	.db <DecodedLevelData
	.db <(DecodedLevelData+$00F0)
	.db <(DecodedLevelData+$01E0)
	.db <(DecodedLevelData+$02D0)
	.db <(DecodedLevelData+$03C0)
	.db <(DecodedLevelData+$04B0)
	.db <(DecodedLevelData+$05A0)
	.db <(DecodedLevelData+$0690)
	.db <(DecodedLevelData+$0780)
	.db <(DecodedLevelData+$0870)
	.db <(SubAreaTileLayout)

DecodedLevelPageStartHi_Bank1:
	.db >DecodedLevelData
	.db >(DecodedLevelData+$00F0)
	.db >(DecodedLevelData+$01E0)
	.db >(DecodedLevelData+$02D0)
	.db >(DecodedLevelData+$03C0)
	.db >(DecodedLevelData+$04B0)
	.db >(DecodedLevelData+$05A0)
	.db >(DecodedLevelData+$0690)
	.db >(DecodedLevelData+$0780)
	.db >(DecodedLevelData+$0870)
	.db >(SubAreaTileLayout)


;
; Updates the area page that we're reading tiles from
;
; Input
;   X = area page
; Output
;   byte_RAM_1 = low byte of decoded level data RAM
;   byte_RAM_2 = low byte of decoded level data RAM
;
SetAreaPageAddr_Bank1:
	LDA DecodedLevelPageStartLo_Bank1, X
	STA byte_RAM_1
	LDA DecodedLevelPageStartHi_Bank1, X
	STA byte_RAM_2
	RTS


;
; Checks whether the player is on a quicksand tile
;
; Input
;   byte_RAM_0 = tile ID
; Output
;   A = Whether the player is sinking in quicksand
;   X = PlayerInAir flag
;
IFNDEF ENABLE_TILE_ATTRIBUTES_TABLE
PlayerTileCollision_CheckQuicksand:
	LDA #$01
	LDY byte_RAM_0
	CPY #BackgroundTile_QuicksandSlow
	BEQ PlayerTileCollision_QuicksandSlow

	CPY #BackgroundTile_QuicksandFast
	BEQ PlayerTileCollision_QuicksandFast

ELSE
PlayerTileCollision_CheckQuicksand:
	LDY byte_RAM_0
	LDA InteractiveTileCollisionTable, Y
	AND #%00001100
	CMP #%00001000

	BNE PlayerTileCollision_NotQuicksand

	TYA
	AND %00000001
	BNE PlayerTileCollision_QuicksandFast

	LDA #$01
	BNE PlayerTileCollision_QuicksandSlow
ENDIF

PlayerTileCollision_NotQuicksand:
	LDA #$00
	RTS

PlayerTileCollision_QuicksandFast:
	LDA #$08

PlayerTileCollision_QuicksandSlow:
	STA PlayerYVelocity
	LDA QuicksandDepth
	BNE loc_BANK1_BA9B

	LDA PlayerYLo
	AND #$10
	STA byte_RAM_4EB

loc_BANK1_BA9B:
	; check if player is too far under
	LDA PlayerYLo
	AND #$0F
	TAY
	LDA byte_RAM_4EB
	EOR PlayerYLo
	AND #$10
	BEQ loc_BANK1_BAB6

	; kill if >= this check
	CPY #$0C
	BCC loc_BANK1_BAB4

	LDA #$00
	STA PlayerStateTimer
	JSR KillPlayer

loc_BANK1_BAB4:
	LDY #$04

loc_BANK1_BAB6:
	CPY #$04
	BCS loc_BANK1_BABC

	LDY #$01

loc_BANK1_BABC:
	TYA
	DEX
	RTS


PlayerTileCollision_HurtPlayer:
	LDA DamageInvulnTime
	BNE locret_BANK1_BAEC

	LDA PlayerHealth
	SEC
	SBC #$10
	BCC loc_BANK1_BAED

	STA PlayerHealth
	LDA #$7F
	STA DamageInvulnTime
	LDA PlayerScreenX
	SEC
	SBC SpriteTempScreenX
	ASL A
	ASL A
	STA PlayerXVelocity
	LDA #$C0
	LDY PlayerYVelocity
	BPL loc_BANK1_BAE5

	LDA #$00

loc_BANK1_BAE5:
	STA PlayerYVelocity
	LDA #DPCM_PlayerHurt
	STA DPCMQueue

locret_BANK1_BAEC:
	RTS

; ---------------------------------------------------------------------------

loc_BANK1_BAED:
	LDA #$C0
	STA PlayerYVelocity
	LDA #$20
	STA PlayerStateTimer
	LDY byte_RAM_12
	BMI loc_BANK1_BAFD

	LSR A
	STA ObjectStunTimer, Y

loc_BANK1_BAFD:
	JMP KillPlayer


; ---------------------------------------------------------------------------

_code_3B00:
	LDY EnemyRawDataOffset, X
	BMI loc_BANK1_BB0B

	LDA (RawEnemyData), Y
	AND #$7F
	STA (RawEnemyData), Y

loc_BANK1_BB0B:
	LDA #$00
	STA EnemyState, X
	RTS


;
; NOTE: This is a copy of the "CreateEnemy" routine in Bank 2, but it is used
; here for spawning the door animation and Starman objects.
;
; Creates a generic red Shyguy enemy and
; does some basic initialization for it.
;
; CreateEnemy_TryAllSlots checks all 9 object slots
; CreateEnemy only checks the first 6 object slots
;
; Output
;   N = enabled if no empty slot was found
;   Y = $FF if there no empty slot was found
;   byte_RAM_0 = slot used
;
CreateEnemy_TryAllSlots_Bank1:
	LDY #$08
	BNE CreateEnemy_Bank1_FindSlot

CreateEnemy_Bank1:
	LDY #$05

CreateEnemy_Bank1_FindSlot:
	LDA EnemyState, Y
	BEQ CreateEnemy_Bank1_FoundSlot

	DEY
	BPL CreateEnemy_Bank1_FindSlot

	RTS

CreateEnemy_Bank1_FoundSlot:
	LDA #EnemyState_Alive
	STA EnemyState, Y
	LSR A
	STA EnemyArray_SpawnsDoor, Y
	LDA #Enemy_ShyguyRed
	STA ObjectType, Y
	LDA ObjectXLo, X
	ADC #$05
	STA ObjectXLo, Y
	LDA ObjectXHi, X
	ADC #$00
	STA ObjectXHi, Y
	LDA ObjectYLo, X
	STA ObjectYLo, Y
	LDA ObjectYHi, X
	STA ObjectYHi, Y
	STY byte_RAM_0
	TYA
	TAX

	JSR EnemyInit_Basic_Bank1
	JSR UnlinkEnemyFromRawData_Bank1

	LDX byte_RAM_12
	RTS


IFDEF CONTROLLER_2_DEBUG
ChangeCharacterOffsets:
	.db $00 ; unused
	.db $03 ; Mario to right
	.db $01 ; Mario to left
	.db $00 ; Princess to right
	.db $02 ; Princess to left
	.db $01 ; Toad to right
	.db $03 ; Toad to left
	.db $02 ; Luigi to right
	.db $00 ; Luigi to left

CheckPlayer2Joypad:
	LDA ChangeCharacterTimer
	BEQ CheckPlayer2Joypad_Go

	DEC ChangeCharacterTimer

CheckPlayer2Joypad_No:
	RTS

CheckPlayer2Joypad_Go:
	LDA PlayerState
	CMP #PlayerState_Dying
	BEQ CheckPlayer2Joypad_No

CheckPlayer2Joypad_CheckSelect:
	LDA Player2JoypadPress
	AND #ControllerInput_Select
	BEQ CheckPlayer2Joypad_CheckUp

	LDA CurrentLevel_Init
	STA CurrentLevel
	LDA CurrentLevelArea_Init
	STA CurrentLevelArea
	LDA CurrentLevelEntryPage_Init
	STA CurrentLevelEntryPage
	LDA TransitionType_Init
	STA TransitionType

	LDA PlayerXLo_Init
	STA PlayerXLo
	LDA PlayerYLo_Init
	STA PlayerYLo
	LDA PlayerScreenX_Init
	STA PlayerScreenX
	LDA PlayerScreenYLo_Init
	STA PlayerScreenYLo
	LDA PlayerYVelocity_Init
	STA PlayerYVelocity
	LDA PlayerState_Init
	STA PlayerState

	LDA #$00
	STA PlayerXVelocity

	JSR DoAreaReset

	JMP StartLevel

CheckPlayer2Joypad_CheckUp:
	LDA Player2JoypadPress
	AND #ControllerInput_Up
	BEQ CheckPlayer2Joypad_CheckDown

	LDY PlayerMaxHealth
	LDA PlayerHealth
	CMP PlayerHealthValueByHeartCount, Y
	BPL CheckPlayer2Joypad_CheckDown

	LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1

	LDY PlayerMaxHealth
	LDA PlayerHealth
	CLC
	ADC #$10
	STA PlayerHealth

CheckPlayer2Joypad_CheckDown:
	LDA Player2JoypadPress
	AND #ControllerInput_Down
	BEQ CheckPlayer2Joypad_CheckStart

	LDA PlayerHealth
	AND #$F0
	BEQ CheckPlayer2Joypad_CheckStart

	LDA #DPCM_PlayerHurt
	STA DPCMQueue

	LDA PlayerHealth
	SEC
	SBC #$10
	STA PlayerHealth

CheckPlayer2Joypad_CheckStart:
	LDA Player2JoypadPress
	AND #ControllerInput_Start
	BEQ CheckPlayer2Joypad_CheckButtonA

	LDX #$FF
	LDA StopwatchTimer
	BEQ CheckPlayer2Joypad_SetStopwatchTimer

	INX

CheckPlayer2Joypad_SetStopwatchTimer:
	STX StopwatchTimer

CheckPlayer2Joypad_CheckButtonA:
	LDA Player2JoypadPress
	AND #ControllerInput_A
	BEQ CheckPlayer2Joypad_CheckLeftRight

	LDA Player2JoypadHeld
	AND #ControllerInput_B
	BEQ CheckPlayer2Joypad_NoButtonB

	JSR DebugRandomObject
	BNE CheckPlayer2Joypad_CheckLeftRight

CheckPlayer2Joypad_NoButtonB:
	JSR RandomCarryObject

CheckPlayer2Joypad_CheckLeftRight:
	LDA Player2JoypadPress
	AND #ControllerInput_Right | ControllerInput_Left
	BEQ CheckPlayer2Joypad_Exit
	CMP #ControllerInput_Right | ControllerInput_Left
	BEQ CheckPlayer2Joypad_Exit

	CLC
	ADC CurrentCharacter
	ADC CurrentCharacter

	TAY
	LDA ChangeCharacterOffsets, Y

	LDX #$18
	STX ChangeCharacterTimer
	LDX #$08
	STX ChangeCharacterPoofTimer

	BNE CheckSetCurrentCharacter

CheckPlayer2Joypad_Exit:
	RTS

;
; Changes the current character
;
; Input
;   A = target character
;
CheckSetCurrentCharacter:
	CMP CurrentCharacter
	BNE SetCurrentCharacter

	RTS

SetCurrentCharacter:
	STA CurrentCharacter

	LDA GravityWithJumpButton
	PHA

	LDX CurrentCharacter
	LDY StatOffsetsRAM, X
	LDX #$00
SetCurrentCharacter_StatsLoop:
	LDA StatOffsetsRAM + CharacterStats-StatOffsets, Y
	STA CharacterStatsRAM, X
	INY
	INX
	CPX #$17
	BCC SetCurrentCharacter_StatsLoop

	LDA CurrentCharacter
	ASL A
	ASL A
	TAY
	LDX #$00
SetCurrentCharacter_PaletteLoop:
	LDA StatOffsetsRAM + CharacterPalette-StatOffsets, Y
	STA RestorePlayerPalette0, X
	INY
	INX
	CPX #$04
	BCC SetCurrentCharacter_PaletteLoop

	; load carry offsets
	LDY CurrentCharacter
	LDA CarryYOffsetsRAM + CarryYOffsetBigLo-CarryYOffsets, Y
	STA ItemCarryYOffsetsRAM
	LDA CarryYOffsetsRAM + CarryYOffsetSmallLo-CarryYOffsets, Y
	STA ItemCarryYOffsetsRAM + $07
	LDA CarryYOffsetsRAM + CarryYOffsetBigHi-CarryYOffsets, Y
	STA ItemCarryYOffsetsRAM + $0E
	LDA CarryYOffsetsRAM + CarryYOffsetSmallHi-CarryYOffsets, Y
	STA ItemCarryYOffsetsRAM + $15

	; interrupt floating if this character can't do it
	LDA JumpFloatLength
	BEQ SetCurrentCharacter_SetJumpFloatTimer

	; if already floating, keep going
	CMP JumpFloatTimer
	BCC SetCurrentCharacter_CheckGravityChange

SetCurrentCharacter_SetJumpFloatTimer:
	STA JumpFloatTimer

SetCurrentCharacter_CheckGravityChange:
	; check whether gravity is increasing
	PLA
	SEC
	SBC GravityWithJumpButton
	BEQ SetCurrentCharacter_Update

	; stash velocity delta in X
	TAX

	; check whether y-velocity is negative
	LDA PlayerYVelocity
	BPL SetCurrentCharacter_Update

	CPX #$00
	BPL SetCurrentCharacter_ClampYVelocity

	; scale y-velocity based on difference in gravity
	EOR #$FF
	CLC
	ADC #$01

	DEX
SetCurrentCharacter_ScaleVelocityYUp_Loop:
	ASL
	INX
	BEQ SetCurrentCharacter_ScaleVelocityYUp_Loop

	EOR #$FF
	STA PlayerYVelocity

	JMP SetCurrentCharacter_Update

SetCurrentCharacter_ClampYVelocity:
	LDA PlayerYVelocity
	CMP JumpHeightRunning

	BPL SetCurrentCharacter_Update

	LDA JumpHeightStandingCarrying
	STA PlayerYVelocity

SetCurrentCharacter_Update:
	INC SkyFlashTimer

	; update chr for character
	JSR LoadCharacterCHRBanks

	LDA #DPCM_PlayerDeath
	STA DPCMQueue

SetCurrentCharacter_Exit:
	RTS


RandomCarryObjectTypes:
	.db #Enemy_VegetableSmall
	.db #Enemy_VegetableLarge
	.db #Enemy_Shell
	.db #Enemy_Bomb
	.db #Enemy_ShyguyRed
	.db #Enemy_Tweeter
	.db #Enemy_SnifitRed
	.db #Enemy_Egg

; bit 7: put in player's hands
; bit 6: set enemy timer
; bit 5: start at bottom of screen
; bit 4:
; bit 3:
; bit 2:
; bit 1: set thrown flag
; bit 0: disable velocity reset
RandomCarryObjectAttributes:
	.db %10000000
	.db %10000000
	.db %10000000
	.db %11000000
	.db %10000001
	.db %10000001
	.db %10000001
	.db %10000001


RandomCarryObject:
	LDA PlayerState
	BNE RandomCarryObject_Exit
	LDA HoldingItem
	BNE RandomCarryObject_Exit

	LDA byte_RAM_10
	LSR A
	LSR A
	LSR A
	AND #$07
	TAX
	LDA RandomCarryObjectAttributes, X
	STA CreateObjectAttributes
	LDA RandomCarryObjectTypes, X
	STA CreateObjectType

RandomCarryObject_Exit:
	RTS


DebugRandomObjectTypes:
	.db #Enemy_Bomb
	.db #Enemy_Bomb
	.db #Enemy_POWBlock
	.db #Enemy_POWBlock
	.db #Enemy_POWBlock
	.db #Enemy_Starman
	.db #Enemy_Starman
	.db #Enemy_Starman

DebugRandomObjectAttributes:
	.db %01000010
	.db %01000010
	.db %00000010
	.db %00000010
	.db %00000010
	.db %00100010
	.db %00100010
	.db %00100010


DebugRandomObject:
	LDA byte_RAM_10
	LSR A
	LSR A
	LSR A
	AND #$07
	TAX
	LDA DebugRandomObjectAttributes, X
	STA CreateObjectAttributes
	LDA DebugRandomObjectTypes, X
	STA CreateObjectType
	RTS
ENDIF
