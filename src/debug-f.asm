
; Debug tools
Debug_Init:
	LDA MMC3PRGBankTemp
	PHA
	LDA #PRGBank_A_B
	JSR ChangeMappedPRGBank
	JMP Debug_InitMenu


Debug_Abort:
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
