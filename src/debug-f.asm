
; Debug tools
Debug_Init:
      LDA Debug_InMenu ; If already in the debug menu,
      BNE Debug_AlreadyIn ; don't re-hook everything. That's bad.
      LDA MMC3PRGBankTemp ; Save the current bank...
      PHA ; and put it on the stack.
      LDA #1
      STA Debug_InMenu
      LDA #PRGBank_A_B ; Swap to the debug/credits bank
      JSR ChangeMappedPRGBank

      LDA PPUScrollXMirror
      STA $7FE0
      LDA PPUScrollYMirror
      STA $7FE1
      LDA PPUMaskMirror
      STA $7FE2
      LDA PPUCtrlMirror
      STA $7FE3
      LDA $4c5
      STA $7FE4
      LDX #6
-     LDA BackgroundCHR1-1, X
      STA $7FE5-1, X
      DEX
      BNE -

      JMP Debug_InitMenu ; And off we go


Debug_Abort:
; Restore a bunch of crap we nuked
      LDA $7FE0
      STA PPUScrollXMirror
      LDA $7FE1
      STA PPUScrollYMirror
      LDA $7FE2
      STA PPUMaskMirror
      LDA $7FE3
      STA PPUCtrlMirror
      LDA $7FE4
      STA $4C5
      LDX #6
-     LDA $7FE5-1, X
      STA BackgroundCHR1-1, X
      DEX
      BNE -


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

Debug_Activate:
      LDA #0
      STA Debug_InMenu
      LDA #Music2_StopMusic
      STA MusicQueue2
      LDA #1
      STA PlayerState
      LDA #1
      STA PlayerStateTimer
      STA TransitionType
      PLA ; Clean up the stack from our mess earlier
      PLA
      TAY
      PLA
      TAX
      PLA
      PLP
      PLA
      PLA
      JMP StartLevelWithTitleCard
