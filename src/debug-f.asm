
; Debug tools
Debug_Init:
	LDA MMC3PRGBankTemp		; Save the current bank...
	PHA						; and put it on the stack.
	LDA Debug_InMenu		; If already in the debug menu,
	BNE Debug_AlreadyIn		; don't re-hook everything. That's bad.
	LDA #1
	STA Debug_InMenu
	LDA #PRGBank_A_B		; Swap to the debug/credits bank
	JSR ChangeMappedPRGBank
	JMP Debug_InitMenu		; And off we go


Debug_Abort:
	LDA #0
	STA Debug_InMenu
Debug_AlreadyIn:
	PLA
	JSR ChangeMappedPRGBank
	; This will almost certainly crash everything lol
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
