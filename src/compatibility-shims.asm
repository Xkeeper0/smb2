;
; Macros for compatibility reasons
; ================================
;
; asm6f doesn't have a way of specifying "aboslute mode" by force,
; and some areas of SMB2 use it even in cases where a zero-page instruction
; would have been sufficient, so these are here to allow those to exist
; (by emitting the raw bytes) if needed
;


;
; Emit a NOP if PRESERVE_UNUSED_SPACE is on,
; as non-compat opcodes are one byte smaller
; (will keep data in place if using proper ZP opcodes)
;
MACRO NOP_compat
	IFDEF PRESERVE_UNUSED_SPACE
		NOP
	ENDIF
ENDM

;
; LDA $0000
;
MACRO LDA_abs addr
	IFDEF COMPATIBILITY
		.db $ad
		.dw addr
	ELSE
		LDA addr
		NOP_compat
	ENDIF
ENDM

;
; STA $0000
;
MACRO STA_abs addr
	IFDEF COMPATIBILITY
		.db $8d
		.dw addr
	ELSE
		STA addr
		NOP_compat
	ENDIF
ENDM

;
; INC $0000
;
MACRO INC_abs addr
	IFDEF COMPATIBILITY
		.db $ee
		.dw addr
	ELSE
		INC addr
		NOP_compat
	ENDIF
ENDM
