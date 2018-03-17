
; Debug tools
Debug_Init:
	LDA Debug_InMenu		; If already in the debug menu,
	BNE Debug_AlreadyIn		; don't re-hook everything. That's bad.
	LDA MMC3PRGBankTemp		; Save the current bank...
	PHA						; and put it on the stack.
	LDA #1
	STA Debug_InMenu
	LDA #PRGBank_A_B		; Swap to the debug/credits bank
	JSR ChangeMappedPRGBank
	JMP Debug_InitMenu		; And off we go


Debug_Abort:
	LDA #0
	STA Debug_InMenu
	PLA
	JSR ChangeMappedPRGBank
Debug_AlreadyIn:
	; Restore the stack to the way it was (that is, undo our hijack)
	; This will NOT fix anything the debug menu wiped out, like
	; the nametables, palettes, whatever else...
	; It's basically a "I just want to see what happens" button.
	; Sometimes you can almost fix it if you pause/unpause though.
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
