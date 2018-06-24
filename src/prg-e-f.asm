
      ;.segment	BANKE
;       *	=  $C000
      .BYTE $55,$2D,$55,$55,$D5,$54,$55,$55,$55,$55,$AB,$54,$55,$AD,$B6; Logged as PCM data
      .BYTE $FF,$3F,0,0,$80,$FE,$FF,3,$78,0,0,0,$FC,$FF,$FF,$1F,$F8,$F;	$F
      .BYTE 0,0,$80,$FF,$FF,$FF,3,$FF,9,0,0,$A0,$FF,$FF,$FF,$FF,0,$F6; $21
      .BYTE 3,0,0,0,$FF,$FF,$FF,$FF,1,0,$FF,9,0,0,0,$EC,$FF,$FF,$FF,$FF; $33
      .BYTE $F,0,$E8,$2E,2,0,$80,2,$D8,$FF,$FF,$FF,$FB,$FF,7,0,0,$DA,$5E; $47
      .BYTE 0,0,0,$1C,$E8,$F5,$FF,$FF,$FF,$F3,$FF,$5E,0,0,$80,$9E,$3F; $5A
      .BYTE 1,0,0,$A0,$13,$FC,$F5,$FF,$FF,$FF,$F,$FF,$AB,$B,0,0,0,$C0; $6B
      .BYTE $FF,$7F,$22,0,0,$28,$F8,$13,$FD,$BB,$FF,$BF,$FA,$FF,$C0,$F;	$7D
      .BYTE $FE,7,$3F,2,0,0,0,$C0,$FF,$FF,$27,$A,0,$38,0,$F4,$83,$FE,$17; $8D
      .BYTE $F8,$7F,$ED,$DB,$7F,$B1,$FF,$7F,0,$F8,0,$FC,$3F,0,$7E,4,0; $A0
      .BYTE 0,$E8,4,0,$E0,$FF,$FF,$FF,$F7,$43,$52,9,0,$F8,$4F,0,$E8,$FF; $B1
      .BYTE 1,$FB,$FF,2,$E0,$FE,$FF,$62,$B5,$AB,$DD,$57,$80,$FD,$FE,$1F; $C3
      .BYTE 0,$B0,2,0,$FE,$FF,0,0,$FD,5,1,$42,5,$80,$FE,$2F,0,0,$F8,$FF; $D3
      .BYTE $FF,$FF,$FF,$A2,$ED,$F,$42,$AA,$24,2,0,$FE,$FF,0,0,$FE,$FF;	$E7
      .BYTE $5F,0,$FF,$7F,0,$D0,$FE,$5F,$54,$DB,$AA,$ED,$2B,1,$ED,$FE; $F8
      .BYTE $FF,0,0,$AC,0,$F0,$FF,7,0,$FC,3,1,$48,0,$F0,$BF,0,0,$E8,$FF; $108
      .BYTE $FF,$FF,$FF,$3F,$12,$9A,$44,0,$E8,$3F,0,$C0,$FF,$1F,$F8,$FF; $11C
      .BYTE 3,$C0,$FF,$4B,$DB,$B5,$ED,$13,$A9,$FF,$3F,0,$94,0,$FE,$1F; $12C
      .BYTE $40,$2F,0,4,0,$9C,0,$80,$FF,$FF,$FF,$BF,$12,0,$E8,4,$B0,$1F; $13C
      .BYTE $F8,$7F,$40,$FF,$D7,$6D,$FF,$8B,$EE,$FF,$80,$16,$D8,$3F,$E8; $14E
      .BYTE 5,0,0,0,$80,$FF,$FF,$2F,$11,$80,0,$6C,$E8,$2F,$F4,$DF,$F6; $15D
      .BYTE $FF,$EA,$7F,$EC,$E8,$3F,$5D,0,0,0,$C0,$FF,$5F,$22,0,0,$10; $16E
      .BYTE $7F,$E0,$6F,$BF,$7F,$FF,$77,$E9,$DF,$F,0,0,$80,$7E,$5F,1,0;	$17F
      .BYTE $80,$E,$6C,$FF,$BF,$FF,$BF,$FE,$5F,0,0,$40,$FF,$45,0,0,$48;	$190
      .BYTE $B0,$FB,$FE,$FF,$FF,$FF,$8B,0,0,$BC,$2F,0,0,$10,$B0,$EE,$FF; $1A1
      .BYTE $FF,$FF,$FF,9,0,$60,$5F,0,0,0,$AC,$FB,$FF,$FF,$FF,$5F,0,$C0; $1B2
      .BYTE $3E,2,0,0,$54,$FF,$FF,$FF,$FF,$B,0,$FA,0,0,0,$B8,$FF,$FF,$FF; $1C4
      .BYTE $FF,0,$A0,$F,0,0,$80,$FF,$FF,$FF,$3F,$80,$6E,0,0,0,$FB,$FF;	$1D7
      .BYTE $FF,$FF,0,$BD,0,0,0,$FF,$FF,$FF,7,$F0,3,0,0,$EC,$FF,$FF,$1F; $1E9
      .BYTE $F8,1,0,0,$F6,$FF,$FF,$81,$9F,0,0,$60,$FF,$FF,$1F,$FA,0,0; $1FC
      .BYTE $C0,$FF,$FF,$87,$7E,0,0,$A0,$FF,$FF,$C9,$B,0,0,$FD,$FF,$2F;	$20E
      .BYTE $FE,0,0,$E0,$FF,$7F,$E2,7,0,0,$FF,$FF,$E3,7,0,$80,$FF,$FF; $21F
      .BYTE $E3,7,0,0,$FF,$FF,$E3,3,0,$E0,$FF,$7F,$6C,0,0,$E8,$FF,$AF; $231
      .BYTE $1F,0,0,$FE,$FF,$F9,3,0,$B0,$FF,$AF,$E,0,$C0,$FF,$FF,$F8,0;	$243
      .BYTE 0,$F8,$FF,$E3,7,0,$E0,$FF,$8F,$1F,0,$80,$FF,$3F,$7E,0,0,$FE; $255
      .BYTE $BF,$3B,0,0,$FF,$FF,$1E,0,$80,$FF,$BF,$4E,0,$C0,$FF,$AF,7; $267
      .BYTE 0,$E0,$FF,$F7,1,0,$FA,$FF,$DC,0,0,$FF,$7F,$1E,0,$A0,$FF,$EF; $278
      .BYTE 1,0,$FA,$7F,$9D,0,$A0,$FF,$EF,1,0,$FA,$FF,$E,0,$F0,$FF,$3B;	$28A
      .BYTE 1,0,$FF,$BF,3,0,$FE,$5F,$17,0,$E8,$FF,$5E,0,$D0,$FF,$57,0; $29C
      .BYTE $A0,$FF,$DF,1,0,$FF,$AF,3,0,$FE,$5F,$27,0,$FC,$BF,$E,0,$F8;	$2AE
      .BYTE $FF,$8E,0,$F0,$FF,$3A,0,$E0,$FF,$F,0,$F8,$FF,$16,0,$F8,$7F;	$2C0
      .BYTE $27,0,$EC,$FF,5,0,$FA,$FF,3,0,$FE,$FF,0,$80,$FF,$6F,1,$80; $2D1
      .BYTE $FF,$3F,0,$E0,$FF,$F,0,$F6,$BF,5,0,$FE,$7F,1,$EC,3,$FE,1,$FB; $2E3
      .BYTE 1,$FE,$40,$7F,0,$7F,$81,$BF,$C0,$4F,0,$DA,$D6,$B6,$D5,$AA; $2F6
      .BYTE $55,$AB,$AA,$4A,$AB,$AA,$4A,$5B,$D5,$AE,2,0,$F6,$FF,1,0,$E8; $306
      .BYTE $B6,$BF,$25,$AA,$6A,$57,$D5,$76,$13,$C9,$ED,$FF,0,$E0,3,$D4; $317
      .BYTE $FF,$22,$D0,$97,4,$49,0,$7B,1,$80,$FF,$FF,$EF,$2B,$25,2,$3B; $327
      .BYTE 0,$FD,$45,$FF,1,$DD,$B5,$6D,$5F,$FB,$B,$1F,$FA,$13,$2F,$40;	$338
      .BYTE 0,4,$D0,$FF,$BB,$24,$40,4,$8A,$BD,$E8,$B6,$EE,$D7,$7F,$BC; $348
      .BYTE $F8,$C7,$13,4,0,0,$D0,$BB,$B7,$DB,$DA,$AA,$AB,$5A,$6A,$55; $358
      .BYTE $A5,$A9,$A5,$2A,$55,$55,$55,$AA,$AA,$4A,$55,$55,$55,$AA,$AA; $368
      .BYTE $AA,$52,$53,$55,$55,$55,$55,$55,$55,$95,$55,$55,$A9,$55,$55; $377
      .BYTE $69,$55,$55,$55,$FB,$7F,2,0,$F0,$EF,$17,$F0,2,0,$B0,$FF,$FF; $386
      .BYTE $81,$F,0,$C0,$FD,$FF,$F,$7E,0,0,$BE,$FF,$7F,$E0,$23,0,$60; $397
      .BYTE $FF,$FF,3,$3F,0,0,$FB,$FF,$1F,$D8,1,0,$D8,$FE,$FF,$C2,$E,0;	$3A8
      .BYTE $C0,$FE,$FF,$27,$7A,0,0,$BA,$FF,$3F,$D1,9,0,$A0,$FF,$FF,$85; $3BA
      .BYTE $17,0,$80,$FD,$FF,$F,$7C,2,0,$E8,$FF,$7F,$A1,$13,0,$A0,$FF;	$3CB
      .BYTE $FF,$13,$9D,0,0,$FA,$FF,$5F,$D8,$A,0,$C0,$FF,$FF,7,$2B,0,$80; $3DC
      .BYTE $FE,$FF,$2F,$74,1,0,$B8,$FF,$FF,$81,$B,0,$A0,$FF,$FF,7,$6E;	$3EE
      .BYTE 0,0,$FE,$FF,$5F,$E0,5,0,$E0,$FB,$FF,$83,$1B,0,$80,$FB,$FF; $3FF
      .BYTE $1F,$F8,0,0,$F8,$FF,$FF,$C0,$E,0,$C0,$FE,$FF,7,$7E,0,0,$BA;	$410
      .BYTE $FF,$BF,$B0,3,0,$A0,$FF,$FF,$8B,$96,0,0,$FE,$FF,$5F,$E8,2; $422
      .BYTE 0,$E0,$FF,$FF,3,$2F,0,0,$FB,$FF,$1F,$7A,1,0,$E0,$FF,$FF,$D0; $433
      .BYTE 7,0,$80,$FE,$FF,$47,$2F,0,0,$FA,$FF,$3F,$7A,1,0,$C0,$FF,$FF; $445
      .BYTE 7,$7D,4,0,$E0,$FF,$FF,$83,$3B,0,0,$E8,$FE,$FF,$27,5,0,0,$F6; $457
      .BYTE $FF,$FF,$F0,$17,0,$80,$FE,$FF,$3F,$E8,2,0,0,$FB,$FF,$FF,$90; $46A
      .BYTE 0,0,$F8,$FF,$FF,$E8,$F,0,0,$FE,$FF,$2F,$4A,0,0,$FE,$FF,$2F;	$47B
      .BYTE $3E,1,0,$80,$FF,$FF,$CF,2,0,$80,$FF,$FF,$FF,$15,0,0,$E0,$FF; $48D
      .BYTE $7F,$95,0,$A,$E0,$FF,$7F,$5E,3,0,0,$FF,$FF,$E2,7,0,$F4,$FF;	$49F
      .BYTE $7F,$94,0,0,$F0,$FF,$FF,$6F,0,0,$80,$FF,$7F,$FC,0,0,$FC,$FF; $4B1
      .BYTE $8F,$B,0,0,$FE,$FF,$FF,$8B,0,0,$E0,$FF,$8F,$9F,0,$80,$FD,$FF; $4C3
      .BYTE $8F,3,0,$80,$FE,$FF,$FF,$13,0,0,$EC,$FF,$81,$1F,0,$A0,$FF; $4D5
      .BYTE $FF,$79,0,0,$A0,$FF,$FF,$7F,0,0,$F0,$FF,$FF,$B,0,$80,$FE,$1F; $4E6
      .BYTE $3F,0,0,$FA,$FF,$E3,7,0,$E0,$FF,$FF,$17,0,0,$FC,$FF,$FB,1; $4F8
      .BYTE 0,$F0,$FD,$EF,$5E,0,0,$F0,$FF,$FF,$F,0,0,$FE,$5F,$3F,0,0,$F8; $50A
      .BYTE $FF,$FF,0,0,$E0,$FF,$FF,$D,0,0,$FC,$FF,$FF,3,0,$80,$FF,$FF;	$51D
      .BYTE $7F,0,0,$F0,$FF,$E8,$F,0,$C0,$FF,$1F,$F8,1,0,$F8,$FF,$FF,2;	$52F
      .BYTE 0,$80,$FF,$FF,$9F,0,0,$7C,$FF,$F7,3,0,0,$FC,$FF,$FF,3,0,$A0; $541
      .BYTE $FF,$E7,$F,0,$C0,$FE,$FF,$17,0,0,$F8,$FF,$9F,3,0,0,$FF,$FF;	$554
      .BYTE $FF,2,0,$80,$FF,$FF,$9F,0,0,$EC,$FF,$FB,3,0,$80,$FF,$3F,$7E; $566
      .BYTE 0,0,$FE,$FF,$EF,0,0,$80,$FE,$FF,$FF,0,0,$C0,$FF,$FF,$3F,0; $578
      .BYTE 0,$F8,$FF,$FE,0,0,$E0,$FF,$7F,$1E,0,0,$FC,$FF,$7F,0,0,$80; $58A
      .BYTE $FF,$FF,$7F,0,0,$F0,$FF,$FF,$F,0,0,$FE,$1F,$FF,1,0,$E8,$FF;	$59C
      .BYTE $B,$3F,0,0,$FF,$FF,$5F,0,0,$E0,$FF,$BF,$1F,0,0,$FD,$FF,$FF;	$5AE
      .BYTE 2,0,$C0,$FF,$C7,$7F,0,0,$F8,$FF,$E2,$F,0,$C0,$FF,$FF,$2A,0;	$5C0
      .BYTE 0,$F8,$FF,$EF,0,0,$80,$FF,$FF,$FF,0,0,$E0,$FF,$FF,$1F,0,0; $5D2
      .BYTE $FC,$FF,$7E,2,0,$F0,$FF,$E7,$F,0,$80,$FE,$FF,$3D,0,0,$F8,$FF; $5E4
      .BYTE $EB,$3F,0,0,$F8,$FF,$FF,2,0,0,$FF,$8F,$FF,0,0,$FC,$FF,$81; $5F6
      .BYTE $1F,0,$80,$FF,$FF,$F,0,0,$FA,$FF,$FF,1,0,$E8,$FB,$9F,$3F,0;	$608
      .BYTE 0,$C0,$FE,$FF,$3F,0,0,$FB,$FF,$FD,0,0,$E0,$FF,$FF,3,0,0,$FE; $61A
      .BYTE $FF,$7B,2,0,$A0,$FF,$FF,$7F,0,0,$F0,$FF,$FF,9,0,0,$FE,$5F; $62D
      .BYTE $BF,0,0,$F8,$FF,$AF,7,0,$E0,$FF,$7F,$1D,0,0,$FC,$FF,$AF,$B;	$63F
      .BYTE 0,0,$FE,$FF,$FF,3,0,$80,$FF,$AF,$7E,0,0,$FA,$FF,$C7,7,0,$C0; $651
      .BYTE $FE,$FF,$3D,0,0,$E0,$FF,$FF,$3F,0,0,$F8,$FF,$FF,5,0,0,$FF; $664
      .BYTE $8F,$FF,0,0,$EC,$FF,$81,$1F,0,$B0,$FF,$FF,$E,0,$E8,$FF,3,0;	$676
      .BYTE $FE,$9F,0,$F0,$FF,5,$80,$FF,$27,0,$FC,$3F,0,$FC,$BF,0,$EC; $688
      .BYTE $7F,1,$E0,$FF,0,$EC,$BF,0,$FC,$3F,0,$FC,$2F,$80,$FF,3,0,$A0; $699
      .BYTE $7F,$B7,$B7,$DF,$2A,$89,$50,$B5,$56,$D5,$3E,$81,$DA,$7F,0; $6AB
      .BYTE $3F,$D0,$9F,$78,1,0,0,$80,$FF,$6F,9,0,$55,$F,$BD,$FB,$F7,$FF; $6BA
      .BYTE $FB,$3F,2,0,0,$B4,$7B,$DB,$B5,$D5,$AA,$55,$AB,$D4,$52,$55; $6CC
      .BYTE $A9,$4A,$53,$55,$A9,$AA,$4A,$55,$55,$A9,$52,$55,$55,$AA,$AA; $6DC
      .BYTE $AA,$AA,$AA,$AA,$B2,$AA,$4A,$4D,$53,$55,$55,$55,$55,$55,$2D; $6EB
      .BYTE $D5,$52,$D3,$CA,$52,$AB,$AA,$AA,$AA,$AA,$AA,$6A,$55,$69,$55; $6FA
      .BYTE $55,$A9,$55,$55,$69,$55,$55,$55,$55,$55,$55,$D3,$D4,$52,$55; $709
      .BYTE $55,$55,$AB,$B4,$B2,$AA,$AA,$52,$AB,$34,$55,$53,$55,$55,$2D; $718
      .BYTE $AB,$52,$AB,$CA,$52,$2B,$55,$55,$55,$55,$55,$55,$55,$55,$2B; $727
      .BYTE $D5,$52,$55,$55,$55,$55,$55,$55,$55,$55,$55; $736
      .BYTE $53,$55,$55,$55,$55,$55,$55,$55,$B5,$FA,$FE,$FF,$3F,0,0,0; NOT logged as PCM data!
      .BYTE $80,$FE,$FF,$B,0,0,$80,$FF,$FF,$FF,1,0,0,$FC,$FF,$FF,$1F,0;	$10
      .BYTE 0,$E0,$FF,$FF,$FF,0,0,0,$FF,$FF,$FF,7,0,0,$E8,$FF,$FF,$1F; $22
      .BYTE 0,0,$C0,$FE,$FF,$FF,0,0,0,$FE,$FF,$FF,5,0,0,$A0,$FF,$FF,$7F; $34
      .BYTE 0,0,$80,$FE,$FF,$FF,3,0,0,$E8,$FF,$FF,$1F,0,0,$80,$FF,$FF; $47
      .BYTE $FF,0,0,0,$FA,$FF,$FF,7,0,0,$E8,$FF,$FF,$3F,0,0,$C0,$FE,$FF; $59
      .BYTE $FF,1,0,0,$FE,$FF,$FF,1,0,0,$F8,$FF,$FF,$F,0,0,$F0,$FF,$FF;	$6C
      .BYTE $F,0,0,$D0,$FF,$FF,$7F,0,0,$80,$FE,$FF,$FF,3,0,0,$FC,$FF,$FF; $7F
      .BYTE 3,0,0,$E0,$FF,$FF,$1F,0,0,$E0,$FF,$FF,$1F,0,0,$E0,$FF,$FF; $92
      .BYTE $1F,0,0,$E0,$FF,$FF,$1F,0,0,$E8,$FF,$FF,3,0,0,$FC,$FF,$FF; $A4
      .BYTE 3,0,0,$FD,$FF,$FF,2,0,$80,$FE,$FF,$7F,0,0,$80,$FF,$FF,$7F; $B6
      .BYTE 0,0,$C0,$FF,$FF,$5F,0,0,$A0,$FF,$FF,$2F,0,0,$F0,$FF,$FF,$F;	$C8
      .BYTE 0,0,$F0,$FF,$FF,$F,0,0,$F0,$FF,$FF,$B,0,0,$FE,$FF,$FF,1,0; $DA
      .BYTE 0,$FE,$FF,$3F,0,0,$F8,$FF,$FF,3,0,0,$FF,$FF,$9F,0,0,$E0,$FF; $ED
      .BYTE $FF,$B,0,0,$FC,$FF,$7F,2,0,$A0,$FF,$FF,$F,0,0,$FA,$FF,$FF; $100
      .BYTE 1,0,$C0,$FF,$FF,$2F,0,0,$F8,$FF,$FF,0,0,0,$FF,$FF,$1F,0,0; $112
      .BYTE $EC,$FF,$FF,3,0,$80,$FF,$FF,$F,0,0,$FA,$FF,$FF,1,0,$C0,$FF;	$125
      .BYTE $FF,7,0,0,$FA,$FF,$FF,2,0,0,$40,$FF,$FF,$FF,$FF,$FF,0,0,0; $137
      .BYTE 0,$80,$FE,$FF,$FF,$FF,$3F,1,0,0,0,$A0,$FF,$FF,$FF,$FF,$2F; $14A
      .BYTE 0,0,0,0,$E8,$FF,$FF,$FF,$FF,3,0,0,0,0,$FE,$FF,$FF,$FF,$FF; $15B
      .BYTE 0,0,0,0,$A0,$FF,$FF,$FF,$FF,$2F,0,0,0,0,$F4,$FF,$FF,$FF,$FF; $16E
      .BYTE 1,0,0,0,$40,$FF,$FF,$FF,$FF,$F,0,0,0,0,$FD,$FF,$FF,$FF,$7F;	$181
      .BYTE 0,0,0,0,$C0,$FF,$FF,$FF,$FF,$BF,0,0,0,0,$80,$FF,$FF,$FF,$FF; $194
      .BYTE $3F,0,0,0,0,$E0,$FF,$FF,$FF,$FF,$F,0,0,0,0,$F8,$FF,$FF,$FF;	$1A7
      .BYTE $FF,3,0,0,0,0,$FE,$FF,$FF,$FF,$1F,0,0,0,0,$FA,$FF,$FF,$FF; $1BA
      .BYTE $FF,0,0,0,0,$80,$FF,$FF,$FF,$FF,$2F,0,0,0,0,$FC,$FF,$FF,$FF; $1CD
      .BYTE $3F,0,0,0,0,$EC,$FF,$FF,$FF,$FF,9,0,0,0,0,$FB,$FF,$FF,$FF; $1E0
      .BYTE $FF,3,0,0,0,0,$FF,$FF,$FF,$FF,$1F,0,0,0,0,$F0,$FF,$FF,$FF; $1F3
      .BYTE $FF,2,0,0,0,$80,$FF,$FF,$FF,$FF,$1F,0,0,0,0,$FC,$FF,$FF,$FF; $206
      .BYTE $BF,0,0,0,0,$E8,$FF,$FF,$FF,$FF,0,0,0,0,$E8,$FF,$FF,$FF,$FF; $219
      .BYTE 1,0,0,0,$E0,$FF,$FF,$FF,$FF,1,0,0,0,$F0,$FF,$FF,$FF,$BF,0; $22C
      .BYTE 0,0,0,$F4,$FF,$FF,$FF,$7F,1,0,0,0,$E0,$FF,$FF,$FF,$FF,1,0; $23F
      .BYTE 0,0,$E0,$FF,$FF,$FF,$FF,0,0,0,0,$EC,$FF,$FF,$FF,$3F,0,0,0; $252
      .BYTE $80,$FE,$FF,$FF,$FF,7,0,0,0,$A0,$FE,$FF,$FF,$FF,0,0,0,0,$FE; $265
      .BYTE $FF,$FF,$FF,$13,0,0,0,$E8,$FF,$FF,$FF,$3F,0,0,0,0,$FF,$FF; $278
      .BYTE $FF,$FF,1,0,0,0,$EC,$FF,$FF,$FF,$1F,0,0,0,$C0,$FF,$FF,$FF; $28A
      .BYTE $FF,0,0,0,0,$FE,$FF,$FF,$FF,3,0,0,0,$E8,$FF,$FF,$FF,$2F,0; $29C
      .BYTE 0,0,$A0,$FF,$FF,$FF,$3F,0,0,0,$A0,$FF,$FF,$FF,$1F,0,0,0,$E8; $2AF
      .BYTE $FF,$FF,$FF,$F,0,0,0,$E8,$FF,$FF,$FF,$27,0,0,0,$F8,$FF,$FF;	$2C2
      .BYTE $FF,3,0,0,0,$FF,$FF,$FF,$3F,0,0,0,$F0,$FF,$FF,$FF,$13,0,0; $2D4
      .BYTE 0,$F8,$FF,$FF,$FF,1,0,0,$80,$FF,$FF,$FF,$1F,0,0,0,$FC,$FF; $2E7
      .BYTE $FF,$BF,0,0,0,$F0,$FF,$FF,$FF,3,0,0,0,$FF,$FF,$FF,$2F,0,0; $2F9
      .BYTE 0,$FE,$FF,$FF,$3F,0,0,0,$EC,$FF,$FF,$BF,0,0,0,$F8,$FF,$FF; $30C
      .BYTE $BF,0,0,0,$F0,$FF,$FF,$FF,2,0,0,$E0,$FF,$FF,$FF,0,0,0,$F8; $31E
      .BYTE $FF,$FF,$3F,0,0,0,$FE,$FF,$FF,$F,0,0,$80,$FF,$FF,$FF,3,0,0;	$331
      .BYTE $E0,$FF,$FF,$FF,0,0,0,$F8,$FF,$FF,$2F,0,0,$C0,$FF,$FF,$BF; $344
      .BYTE 0,0,0,$FE,$FF,$FF,5,0,0,$F8,$FF,$FF,$F,0,0,$A0,$FF,$FF,$7F;	$355
      .BYTE 2,0,$80,$FE,$FF,$FF,2,0,0,$FC,$FF,$FF,3,0,0,$FC,$FF,$FF,3; $368
      .BYTE 0,0,$EC,$FF,$FF,$B,0,0,$EC,$FF,$FF,$1F,0,0,$E0,$FF,$FF,$F; $37B
      .BYTE 0,0,$F0,$FF,$FF,$17,0,0,$E8,$FF,$FF,$B,0,0,$EC,$FF,$FF,3,0;	$38D
      .BYTE 0,$FC,$FF,$FF,3,0,0,$FD,$FF,$FF,2,0,$80,$FF,$FF,$3F,0,0,$A0; $3A0
      .BYTE $FF,$FF,$F,0,0,$FA,$FF,$FF,1,0,$80,$FE,$FF,$3F,0,0,$E0,$FF;	$3B3
      .BYTE $FF,$17,0,0,$FA,$FF,$FF,0,0,$A0,$FF,$FF,$1F,0,0,$FC,$FF,$7F; $3C5
      .BYTE 2,0,$80,$FF,$FF,$F,0,0,$FE,$FF,$3F,0,0,$F8,$FF,$FF,0,0,$E0;	$3D7
      .BYTE $FF,$FF,3,0,$80,$FF,$FF,$B,0,$C0,$FF,$FF,7,0,0,$FF,$FF,$1F;	$3EA
      .BYTE 0,0,$FC,$FF,$3F,0,0,$F6,$FF,$3F,0,0,$F8,$FF,$9F,0,0,$FE,$FF; $3FC
      .BYTE $2F,0,0,$FE,$FF,$3F,0,0,$FB,$FF,$1F,0,0,$FC,$FF,$F,0,$80,$FE; $40F
      .BYTE $FF,$27,0,$80,$FF,$FF,3,0,$F0,$FF,$FF,1,0,$E8,$FF,$BF,0,0; $422
      .BYTE $EC,$FF,$4F,0,0,$FE,$FF,7,0,$E0,$FF,$FF,3,0,$F0,$FF,$3F,0; $434
      .BYTE 0,$F8,$FF,$5F,0,0,$FE,$FF,$F,0,$80,$FE,$FF,$27,0,$80,$FF,$FF; $446
      .BYTE 3,0,$F0,$FF,$FF,1,0,$E8,$FF,$FF,0,0,$E0,$FF,$FF,2,0,$D0,$FF; $458
      .BYTE $FF,1,0,$C0,$FF,$FF,7,0,0,$FF,$FF,$B,0,$80,$FF,$FF,$F,0,0; $46B
      .BYTE $FE,$FF,$3F,0,0,$F8,$FF,$BF,0,0,$E8,$FF,$FF,2,0,$F0,$FF,$FF; $47E
      .BYTE 1,0,$C0,$FF,$FF,7,0,0,$FF,$FF,$F,0,0,$FE,$FF,$7F,0,0,$F0,$FF; $490
      .BYTE $FF,1,0,$80,$FE,$FF,$3F,0,0,$E8,$FF,$FF,7,0,0,$FF,$FF,$1F; $4A4
      .BYTE 0,0,$EC,$FF,$FF,3,0,$80,$FF,$FF,$4F,0,0,$F0,$FF,$FF,9,0,0; $4B6
      .BYTE $FE,$FF,$BF,0,0,$E0,$FF,$FF,$27,0,0,$F8,$FF,$FF,2,0,$80,$FF; $4C9
      .BYTE $FF,$1F,0,0,$E8,$FF,$FF,$17,0,0,$74,$FF,$FF,$4B,0,0,$74,$FF; $4DB
      .BYTE $FF,$15,4,0,$69,$7B,$AB,$B5,$AD,$5A,$55,$AB,$AA,$AA,$AA,$2A; $4ED
      .BYTE $55,$55				  ; $4FD
      .BYTE $6B,$FF,$1F,0,0,$E8,$FF,$F,$68,5,0,$A0,$FF,$FF,$F,$DC,0,0; Logged as PCM data
      .BYTE $DC,$FE,$FF,7,$7E,0,0,$F6,$FF,$FF,$81,$F,0,0,$FE,$FF,$7F,$E0; $12
      .BYTE 5,0,$60,$FB,$FF,$B,$3F,0,0,$FC,$FF,$FF,$C0,$E,0,0,$FE,$FF; $24
      .BYTE $3F,$B0,3,0,$B0,$FF,$FF,$89,$1D,0,0,$EE,$FF,$7F,$68,5,0,$60; $36
      .BYTE $FF,$FF,3,$1F,1,0,$FA,$FF,$BF,$D0,5,0,$C0,$FF,$FF,7,$5E,0; $48
      .BYTE 0,$FA,$FF,$3F,$B8,1,0,$B0,$FF,$FF,$8B,$16,0,$80,$FE,$FF,$4F; $5A
      .BYTE $EC,4,0,$E0,$FF,$FF,$41,$27,0,0,$FF,$FF,$F,$3B,1,0,$F8,$FF;	$6B
      .BYTE $7F,$E8,8,0,$E0,$FF,$FF,$C4,$47,0,0,$FF,$FF,$17,$2E,0,0,$FA; $7D
      .BYTE $FF,$3F,$F0,3,0,$D0,$FF,$FF,$89,$B,0,$80,$FF,$FF,$87,$4E,0;	$8F
      .BYTE 0,$FE,$FF,$4F,$6C,0,0,$FC,$FF,$3F,$E8,3,0,$E0,$FF,$FF,$62; $A0
      .BYTE 7,0,$A0,$FF,$FF,$A1,7,0,$80,$FF,$FF,$83,$17,0,$80,$FF,$FF; $B1
      .BYTE $A3,$15,0,0,$FF,$FF,$4B,$1F,0,0,$FA,$FF,$1F,$3D,0,0,$FB,$FF; $C2
      .BYTE $1F,$3A,1,0,$F8,$FF,$1F,$BB,0,0,$F8,$FF,$1F,$9B,0,0,$FB,$FF; $D4
      .BYTE $1F,$BA,0,0,$E8,$FF,$1F,$3D,0,$80,$FB,$FF,$1F,$1D,0,0,$FA; $E6
      .BYTE $FF,$1F,$9F,0,0,$F8,$FF,$9F,$78,1,0,$FC,$FF,$1F,$78,1,0,$FA; $F7
      .BYTE $FF,$1F,$3A,1,0,$F8,$FF,$9F,$14,0,$E8,$FF,$8F,$B,0,$F8,$FF;	$109
      .BYTE $FC,9,0,$F8,$FF,$BE,0,$80,$EE,$FF,$E,0,$E0,$FF,$EB,4,0,$EC;	$11A
      .BYTE $FF,$2B,2,0,$FE,$FF,$1C,0,$E0,$FF,$3F,$E,0,$B8,$FE,$EF,$F; $12C
      .BYTE 0,$F8,$7F,$FC,4,0,$FC,$FF,$4E,0,$C0,$FE,$5F,3,0,$EC,$FF,$2B; $13D
      .BYTE 2,$80,$FE,$FF,$18,0,$F0,$FF,$8F,$F,0,$F8,$FF,$FA,1,0,$FB,$AF; $14F
      .BYTE $F,0,$A0,$FF,$BF,0,0,$FB,$FF,$A2,0,$80,$FF,$FF,$41,0,$F8,$FF; $161
      .BYTE $E3,7,0,$FC,$FF,$5E,0,$80,$FE,$EF,2,0,$EC,$FF,$59,0,$C0,$FF; $173
      .BYTE $5F,$1A,0,$F0,$FF,$F5,3,0,$FA,$FF,$1F,1,$80,$FB,$BF,1,0,$F6; $185
      .BYTE $FF,$38,0,$A0,$FF,$3F,$16,0,$F8,$FF,$FC,1,0,$FA,$FF,$F,0,$B0; $197
      .BYTE $FF,$2F,1,0,$FF,$7F,8,0,$F8,$FF,$C7,5,0,$FB,$FF,$8F,0,$A0; $1A9
      .BYTE $FF,$5F,1,0,$FF,$5F,8,0,$F4,$FF,$C7,0,$80,$FF,$FF,$F,0,$F0;	$1BB
      .BYTE $FF,$3D,0,$80,$FF,$8F,1,0,$FF,$FF,$98,0,$60,$FF,$FF,3,0,$F6; $1CD
      .BYTE $7F,$27,0,$E0,$FF,$4B,0,$C0,$FF,$1F,$2F,0,$F0,$FF,$7F,0,$80; $1DF
      .BYTE $FE,$BF,4,0,$FC,$FF,$48,0,$E8,$FF,$E3,7,0,$FE,$FF,7,0,$D8; $1F0
      .BYTE $FF,$95,0,$80,$FF,$3F,4,0,$FB,$FF,$1F,0,$F0,$FF,$1D,0,$60; $202
      .BYTE $FF,$8F,2,$80,$FE,$1F,$3F,0,$E8,$FF,$7F,0,$C0,$FE,$63,0,$C0; $213
      .BYTE $FF,$3F,6,0,$FD,$FF,$1F,0,$D0,$FF,$3A,0,$A0,$FF,$8F,1,$80; $224
      .BYTE $FE,$FF,$17,0,$E8,$FF,$E,0,$E8,$FF,$63,0,$C0,$FF,$FF,6,0,$FA; $235
      .BYTE $BF,3,0,$FE,$BF,$28,0,$E8,$FF,$7F,0,$C0,$FF,$57,0,$A0,$FF; $247
      .BYTE $A7,8,0,$FF,$FF,$F,0,$F8,$BF,$23,0,$E8,$FF,$71,0,$E0,$FF,$FF; $258
      .BYTE 0,$80,$FF,$A7,0,$40,$FF,$CF,$A,0,$FE,$FF,$2F,0,$E0,$FF,$A; $26A
      .BYTE 0,$F8,$FF,$E2,0,$B0,$FF,$FF,0,$80,$FF,$4B,0,$C0,$FF,$EB,7; $27B
      .BYTE $80,$F7,$FF,0,0,$FB,$3F,$14,0,$F6,$FF,$3F,0,$E0,$FF,6,0,$F8; $28C
      .BYTE $FF,$E2,0,$B0,$FF,$7F,1,$40,$FF,$59,0,$C0,$FF,$EF,3,$80,$FF; $29E
      .BYTE $AF,0,$80,$FF,$8F,2,$80,$FE,$FF,7,0,$FC,$3F,9,0,$FD,$AF,$1F; $2AF
      .BYTE 0,$F6,$FF,3,0,$FC,$3F,$A,0,$F8,$FF,$5F,0,$F0,$FF,$24,0,$EC;	$2C1
      .BYTE $7F,$7F,0,$D0,$FF,$D,0,$F8,$FF,$18,0,$E8,$FF,$7F,0,$C0,$FF;	$2D3
      .BYTE $13,0,$F0,$FF,$7F,1,$A0,$FF,$29,0,$E8,$FF,$E3,0,$A0,$FF,$BF; $2E4
      .BYTE 0,$60,$FF,$4B,0,$C0,$FF,$FF,2,$80,$FF,$87,0,$E0,$FF,$B9,3; $2F5
      .BYTE $C0,$FE,$FF,0,$80,$FF,$27,4,0,$FF,$FF,$B,0,$FE,$1F,5,0,$FD;	$306
      .BYTE $EF,$F,0,$FD,$DF,1,0,$FE,$1F,$1B,0,$EC,$FF,$4F,0,$F8,$7F,8;	$318
      .BYTE 0,$F8,$FF,$3F,0,$F0,$FF,6,0,$FC,$7F,$F4,0,$A0,$FF,$3F,0,$E0; $32A
      .BYTE $FF,$31,0,$E8,$FF,$BF,$E0,$E,0,0,$F6,$FF,$FF,$B,$8E,0,$A0; $33C
      .BYTE $FF,$1F,0,$FC,$3F,0,$FD,7,$D0,$7F,3,$B0,$FF,2,$80,$FF,$DB; $34D
      .BYTE 1,0,$F8,$FF,$FF,2,$BA,1,0,$A0,$FF,$FF,$A7,3,0,$FE,$BF,0,$FA; $35E
      .BYTE $F,$40,$FF,9,$C0,$FF,3,$C0,$FF,3,0,$FF,$7F,$F8,8,0,$C0,$FE;	$371
      .BYTE $FF,$BF,$80,$97,0,0,$FD,$FF,$27,0,$FA,$7F,0,$FA,$F,$40,$FF;	$383
      .BYTE 5,$E0,$FF,1,$E0,$BF,$2E,0,$E0,$FF,$7F,$C0,$F,0,0,$F6,$FF,$FF; $394
      .BYTE $B,$8E,0,$A0,$FF,$1F,0,$FC,$3F,$80,$FE,3,$D0,$7F,2,$F0,$FF;	$3A6
      .BYTE 4,$80,$FF,$FB,8,0,$E8,$FE,$FF,7,$B8,3,0,$80,$FF,$FF,$AB,3; $3B7
      .BYTE 0,$FE,$9F,0,$FE,$F,$40,$FF,1,$F8,$BF,2,$E8,$DF,1,0,$FF,$7F;	$3C9
      .BYTE $F8,8,0,$C0,$FE,$FF,$7F,$81,$8E,0,$80,$FE,$7F,7,0,$FF,$2F; $3DB
      .BYTE 0,$FB,$F,$A0,$FF,0,$F0,$FF,0,$E0,$FF,$F,0,$C0,$FF,$FF,$C0; $3EC
      .BYTE $4F,0,0,$F4,$FF,$FF,$B,$D,0,$B0,$FF,$2F,$80,$FE,$2D,$80,$7F; $3FD
      .BYTE 3,$B0,$FF,0,$F8,$EF,0,$D0,$FF,$ED,8,0,$D0,$FF,$FF,7,$F0,3; $40E
      .BYTE 0,$80,$FF,$FF,$79,1,$C0,$FF,$17,0,$FF,3,$E0,$7F,2,$F8,$3F; $420
      .BYTE 0,$FC,$BF,2,$80,$FE,$BF,$F8,1,0,$C0,$FE,$FF,$7F,$81,$B,0,$80; $431
      .BYTE $FF,$FF,9,$40,$FF,$B,$A0,$FF,0,$EC,$3F,0,$FD,$1F,0,$FC,$DF;	$443
      .BYTE 9,0,$F8,$FF,$1F,$D8,$B,0,0,$FE,$FF,$FF,$D0,1,0,$FE,$7F,2,$B0; $454
      .BYTE $FF,2,$F0,$5F,0,$FE,$F,0,$FF,$8F,0,$F8,$FF,$D8,5,0,$C0,$FF;	$467
      .BYTE $FF,$3F,$80,$F,0,$80,$FE,$FF	  ; $479
      .BYTE $5B,2,$C0,$FF,3,$D0,$FF,2,$F8,$57,0,$FB,$2F,0,$FA,$BF,1,0; NOT logged as PCM data!
      .BYTE $FE,$FF,7,$7E,2,0,$C0,$FE,$FF,$7F,$E0,4,0,$F4,$FF,$AB,1,0; $12
      .BYTE $FF,$BF,2,$80,$FF,$2F,0,$FE,$2F,0,$FC,$3F,$80,$FE,$23,$80; $24
      .BYTE $FF,2,$F8,$1F,$40,$FF,3,$E0,$BF,3,$E8,$BF,2,$D0,$FF,2,$C0; $34
      .BYTE $FF,$B,0,$FE,$5F,7,0,$FC,$FF,$F1,2,0,$F0,$FF,$3F,$B8,3,0,$C0; $45
      .BYTE $EF,$FF,$7F,$80,$3B,0,0,$D8,$FF,$FF,$3F,$C0,$13,0,$80,$FE; $58
      .BYTE $FF,$8F,$8E,0,$80,$FF,$3F,$F,0,$F8,$FF,$A,0,$FE,$BF,0,$F4; $68
      .BYTE $7F,0,$F0,$FF,0,$FA,$8F,0,$FE,$B,$D0,$7F,0,$FB,$F,0,$FF,$F;	$79
      .BYTE 0,$FF,$F,0,$FF,$5F,0,$F8,$DF,1,$80,$FE,$EF,5,0,$EC,$FF,$CB;	$8B
      .BYTE $13,0,$C0,$FF,$FF,9,$EE,0,0,$70,$FF,$FF,$9F,0,$7E,0,0,$B8; $9D
      .BYTE $FF,$FF,$F,$74,3,0,$E0,$FF,$7F,$E2,3,0,$EC,$FF,$3B,0,$C0,$FF; $AF
      .BYTE $9F,0,$F0,$FF,4,$B0,$BF,7,$80,$FF,7,$C0,$7F,5,$F0,$1F,$C0; $C1
      .BYTE $FE,1,$F8,$BF,2,$E8,$3F,2,$F8,$BF,2,$D0,$FF,2,$40,$FF,$77; $D2
      .BYTE 0,$40,$FD,$FF,6,0,$F8,$FF,$1F,$3C,1,0,$F8,$FF,$FF,$40,$37; $E3
      .BYTE 0,0,$B8,$FF,$FF,$7F,0,$3B,1,0,$D0,$FF,$FF,$27,$3A,2,0,$F8; $F4
      .BYTE $FF,$2F,$F,0,$E0,$FF,$EB,2,$80,$FF,$1F,1,$E8,$FF,1,$E0,$FF;	$106
      .BYTE $A,$80,$FF,$B,$A0,$FF,0,$FC,$17,$C0,$FF,0,$F0,$FF,0,$F0,$FF; $117
      .BYTE 2,$D0,$7F,7,$80,$FF,$9D,0,$E0,$FF,$3B,0,$C0,$FE,$9F,$5D,1; $128
      .BYTE 0,$F8,$FF,$5F,$F8,$A,0,0,$FF,$FF,$7F,1,$EE,0,0,$A0,$FF,$FF;	$139
      .BYTE $7F,$C0,$4E,0,0,$FE,$FF,$1F,$3A,0,0,$FE,$FF,$3D,0,$60,$FF; $14B
      .BYTE $3F,0,$F8,$DF,1,$C0,$FF,$B,0,$FF,$1F,0,$FE,$F,$C0,$7F,2,$FC; $15C
      .BYTE $F,$A0,$FF,$A,$80,$FF,7,0,$FF,$4F,0,$FC,$7F,1,$C0,$FF,$6B; $16E
      .BYTE 0,$C0,$FF,$AF,$E,0,$C0,$FF,$FF,$C4,7,0,0,$FF,$FF,$BF,$80,$AF; $17F
      .BYTE 0,0,$E0,$FF,$FF,$5F,$C0,$2E,0,0,$F4,$FF,$FF,$A1,$13,0,$80; $191
      .BYTE $FF,$BF,$3E,0,$C0,$FF,$77,0,$A0,$FF,$1F,0,$FC,$7F,1,$E0,$FF; $1A2
      .BYTE 1,$E0,$FF,0,$E8,$3F,$80,$FF,5,$F0,$BF,0,$F4,$BF,0,$F4,$EF; $1B3
      .BYTE 0,$F0,$BF,7,$80,$FD,$6F,1,$80,$FF,$8F,$B,0,$B8,$FF,$3F,$3A;	$1C4
      .BYTE 2,0,$BA,$FF,$FF,$80,$56,0,4,$75,$FB,$FF,$1F,$C0,$56,0,$84; $1D5
      .BYTE $DA,$7F,$FF,9,$5C,4,$40,$ED,$FF,$87,$16,0,$DA,$FF,$65,1,$E0; $1E6
      .BYTE $FF,$31,2,$FA,$CF,$A,$E0,$7F	  ; $1F7
      .BYTE $55,$95,$55,$55,$55,$55,$55,$55,$D5,$AA,$FF,$3F,0,$48,$25; Logged as PCM data
      .BYTE $B0,$8B,$80,$AE,$B,$F8,$4F,$80,$7F,$B,$EC,$2F,$A0,$7F,$23; $F
      .BYTE $F0,$4F,$C4,$DF,9,$F8,$27,$A2,$DF,$B,$E8,$95,$D0,$6F,3,$F4;	$1E
      .BYTE $4A,$E4,$3F,1,$FA,$49,$F0,$BF,0,$FC,5,$F1,$AF,0,$FE,$13,$D8; $2E
      .BYTE $2F,0,$FF,9,$EC,$2F,$80,$FE,5,$F6,$D,$C0,$7F,1,$FD,$46,0,$FF; $3F
      .BYTE 5,$EC,$9F,0,$E8,$3F,$A0,$FF,2,$A0,$FF,2,$FE,$17,0,$FE,$83; $51
      .BYTE $F8,$5F,0,$F8,$4B,$62,$FF,4,$E0,$9F,$84,$7D,$2F,$80,$5F,5; $62
      .BYTE $BE,$57,$C0,$7E,$11,$FC,$BA,2,$FB,5,$70,$6F,$B,$EC,$2F,$80;	$72
      .BYTE $5D,$2F,$80,$FF,$22,$B0,$7F,5,$D0,$FF,4,$FA,$5F,0,$FA,$93; $82
      .BYTE $84,$BE,$8B,$C0,$3E,$82,$F8,$DB,2,$FC,$F,0,$FF,$5A,0,$FA,$5F; $92
      .BYTE $A0,$FF,6,0,$FF,$4F,$60,$DF,$4E,0,$BF,$20,$70,$5F,7,$40,$FF; $A3
      .BYTE $F,$42,$FF,$4F,0,$BF,$54,$A0,$5F,$27,0,$FF,$B,$40,$FF,$B,0;	$B4
      .BYTE $FB,$7F,$80,$7F,$37,1,$F8,$F,2,$F8,$DF,$12,0,$C0,$EB,$7F,$B7; $C5
      .BYTE $AD,$AD,$56,$B5,$AA,$2A,$55,$55,$A5,$4A,$2D,$55,$A9,$52,$55; $D6
      .BYTE $A9,$2A,$55,$A9,$AA,$4A,$55,$55,$A5,$A9,$AA,$5A,$AA,$AA,$AA; $E5
      .BYTE $AA,$AA,$AA,$AA,$6A,$A5,$69,$55,$55,$55,$2D,$35,0,$B0,$82; $F4
      .BYTE $20,$59,$52,4,0,$FD,$FF,7,0,$F8,$FF,$FF,$17,$C0,$F6,$FF,$7F; $103
      .BYTE 0,$80,$D4,$7D,$FF,$57,$95,$A0,$A6,$B5,$9A,$2A,$4D,$DD,$4B; $114
      .BYTE $92,$20,$A4,$96,$DB,$F6,$75,$FF,1,0,0,$F0,$AF,$25,1,$40,$D5; $123
      .BYTE $FA,$FF,$FF,1,0,4,$B0,$BF,$FB,$27,$11,$92,$48,$69,$55,$AB; $134
      .BYTE $AD,4,$D8,$6A,$DF,$FE,$5F,$A5,$24,0,$DA,$C0,$EE,$D3,$BE,$FF; $144
      .BYTE $FF,$FB,$4F,$EA,$47,$80,0,$41,0,$50,$D5,$6A,$D5,$FE,$8A,$22; $154
      .BYTE $28,$49,$D3,$34,$55,$57,$55,$AA,$9A,$AA,2,$D0,$F6,$96,$EC; $164
      .BYTE $BA,$EF,$FF,$2A,$55,$AB,$24,$89,0,$A8,$6D,$2B,$50,$7D,$DF; $173
      .BYTE $F6,$B6,$5A,$B5,$7E,$93,$48,$88,$84,$4A,$95,$2A,1,$E0,$DD; $182
      .BYTE $76,$AD,$6B,$DB,$FD,$FF,$2F,0,0,0,0,0,$BF,$EF,$DB,$DB,$6A; $191
      .BYTE $6B,$B5,$52,$AB,$AA,$AA,$AA,$CA,$B2,$54,$55,$4A,$AB,$54,$95; $1A2
      .BYTE $95,$AA,$4A,$AB,$34,$55,$53,$35,$55,$55,$55,$55,$55,$55,$55; $1B1
      .BYTE $D5,$B4,$B2,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$5A,$59,$A9; $1C0
      .BYTE $55,$55,$69,$55,$55,$55,$55,$CB,$52,$AB,$AA,$AA,$AA,$2A,$AD; $1CF
      .BYTE $AA,$AA,$B2,$AA,$AA,$B2,$AA,$AA,$52,$2B,$2B,$B5,$52,$55,$55; $1DE
      .BYTE $53,$55,$55,$53,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55; $1ED
      .BYTE $55,$55,$69,$55,$55,$69,$55,$55,$55,$55,$55,$95,$55,$55,$69; $1FC
      .BYTE $55,$55,$55,$55,$55,$55,$55,$59,$A9,$A5,$AA,$AA,$5A,$55,$96; $20B
      .BYTE $55,$A5,$AA,$65,$A9,$AA,$9A,$AA,$AA,$AA,$5A,$AA,$5A,$A5,$A9; $21A
      .BYTE $A5,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA; $229
      .BYTE $6A,$59,$AA,$95,$A6,$AA,$65,$A9,$AA,$AA,$AA,$AA,$A5,$A6,$A9; $238
      .BYTE $55,$A5,$A9,$AA,$AA,$A9,$65,$59,$A9,$55,$55,$A9,$55,$A5,$A9; $247
      .BYTE $55,$A5,$69,$65,$59,$A9,$55,$55,$69,$55,$55,$A9,$55,$A5,$69; $256
      .BYTE $65,$55,$69,$55,$55,$55,$55,$B5,$EA,$FF,$FF,3,0,9,$40,4,0; $265
      .BYTE $E8,7,0,$FE,$1F,$F4,$FF,3,$F4,$FF,$97,$B6,$57,$EF,$BE,9,$6A; $276
      .BYTE $BF,$FF,3,0,$5C,0,$F4,$FF,3,0,$ED,$27,0,$42,$25,0,$EE,$9F; $287
      .BYTE 0,0,$F8,$FF,$FF,$FF,$5F,$54,$FB,$49,$90,$AA,$24,2,0,$F7,$FF; $299
      .BYTE 5,0,$E8,$FF,$FF,$13,$40,$FB,$FF,$3F,0,0,$D8,$F6,$FE,$AD,$54; $2AA
      .BYTE $90,$55,$AB,$96,$A5,$D4,$EA,$93,$A,1,$65,$D5,$6E,$DD,$B7,$FF; $2BB
      .BYTE 0,0,0,$F8,$DF,$92,4,0,$55,$FF,$FF,$FF,4,0,0,$D4,$BF,$FD,$27; $2CB
      .BYTE 9,$51,$92,$CA,$B2,$DA,$5A,9,$68,$AB,$BD,$FF,$37,$55,$25,1; $2DE
      .BYTE $B0,5,$F6,$4B,$EF,$FF,$FF,$DD,$7F,$52,$3F,1,2,$20,0,$40,$55; $2EE
      .BYTE $5B,$55,$DB,$5F,$48,$22,$49,$A9,$AA,$AA,$6A,$55,$55,$55,$55; $2FF
      .BYTE $29,1,$DA,$DE,$92,$D5,$B7,$F7,$BF,$54,$69,$2B,$29,$12,0,$AA; $30E
      .BYTE $6B,$13,$A8,$ED,$7B,$F7,$B6,$6A,$B5,$FD,$92,$44,$48,$84,$4A; $31E
      .BYTE $AA,$2A,1,$60,$FB,$BA,$B5,$6D,$AB,$FD,$FF,$7F,0,0,0,0,$40; $32D
      .BYTE $DB,$A2,$DA,$B7,$6B,$9B,$AA,$B5,$DB,$AA,$55,$6B,$55,$69,$55; $33E
      .BYTE $7B,$A9,$A4,$24,$95,$25,$A5,$4A,$55,$A5,$42,$6A,$B5,$6A,$AB; $34D
      .BYTE $D6,$AA,$6A,$55,$55,$AD,$CA,$52,$D3,$54,$A9,$55,$55,$55,$55; $35C
      .BYTE $55,$55,$DB,$55,$4A,$95,$4A,$AA,$2A,$55,9,$6A,$B5,$55,$DB; $36B
      .BYTE $AA,$69,$AB,$B6,$AB,$52,$A5,$6A,$2F,$45,$4A,$DD,$FF,3,0,0; $37A
      .BYTE 0,0,$F6,$EF,$FF,$B6,$EB,$FD,$7F,$89,$94,$4A,$91,$22,1,$68; $38A
      .BYTE $6B,$55,$AD,$DB,$FE,$4F,$A5,$F4,$4B,4,1,$48,$52,9,$68,$DB; $39A
      .BYTE $BF,$AB,$ED,$5F,$12,$92,$28,$A9,$24,$D5,$B2,$6A,$D5,$6A,$AB; $3AA
      .BYTE $4A,0,$DB,$B6,$B6,$7D,$FF,$52,$2A,$A5,2,$40,$55,$70,$BB,$DA; $3B9
      .BYTE $FD,$7F,$DB,$4F,$D5,$5E,$40,4,$21,0,$55,$AB,$EA,$9F,$48,$48; $3C9
      .BYTE $2A,$55,$55,$55,$55,2,$54,$55,$ED,$FF,$DB,$4A,4,$28,$B0,$FB; $3D9
      .BYTE $BF,$7F,$13,$29,$80,$DA,$BE,$FF,$3F,0,0,$60,$B5,$EB,$5F,$4B; $3E9
      .BYTE $89,$D2,$B4,$6A,$53,$55,$55,$5F,$29,$11,$52,$D5,$6D,$DF,$FF; $3F9
      .BYTE 3,0,0,$FC,$2B,1,$48,$EB,$FF,$5F,4,0,$ED,$FD,$49,$48,$A4,$CA; $408
      .BYTE $12,$50,$F5,$FE,$55,1,$80,$EA,$FE,$FF,$FF,$7F,1,$5A,$77,$91; $41A
      .BYTE $A4,$4A,$89,0,$A1,$7F,$2F,1,$A0,$FB,$7F,2,$DA,$FF,$B,0,$D5;	$42A
      .BYTE $ED,$9F,$8A,$AA,$D5,$B4,$B6,$93,$88,$6A,$FF,$7E,0,$40,$2B; $43B
      .BYTE 2,$F8,$FF,1,$40,$F7,$91,$20,$29,$80,$FA,$46,0,$E0,$FF,$FF; $44A
      .BYTE $FF,$D1,$5D,$2A,$25,1,$E8,$5E,0,$EC,$7F,$82,$FB,$4F,$40,$DF; $45A
      .BYTE $AF,$52,$DB,$DA,$AD,$92,$F6,$FF,0,$B0,1,$FA,$5F,0,$7D,$41; $46A
      .BYTE $90,0,$74,$11,0,$FE,$FF,$BF,$BE,$92,$2A,0,$6E,5,$B0,$BF,$E8; $47A
      .BYTE $7F,$80,$FA,$A7,$B5,$6D,$77,$52,$DF,$2F,$A0,$15,$A8,$7F,$A0; $48B
      .BYTE $5E,$40,4,$D0,2,0,$FE,$FF,$DF,$2B,$4A,4,$B8,2,$F8,$8B,$FE; $49A
      .BYTE 7,$B8,$AF,$DA,$DB,$97,$DA,$FF,3,$38,$D0,$7F,$C0,$2E,$82,0; $4AB
      .BYTE $58,0,$C0,$FF,$FF,$2F,$25,1,$9A,0,$FD,$D0,$7F,$A0,$FB,$AA; $4BB
      .BYTE $EB,$BB,$AA,$FF,$C0,$26,$EC,$17,$75,$41,4,$30,2,$C0,$FF,$BF; $4CB
      .BYTE $2B,$45,$80,$23,$D0,$49,$7F,$C1,$6E,$EB,$B6,$AF,$FA,$7E,$E0; $4DB
      .BYTE $85,$FE,$42,$17,$41,$80,4,$80,$FF,$DF,$55,$12,$D0,8,$6C,$EA; $4EA
      .BYTE $F,$EC,$D5,$AE,$6F,$DD,$5F,$74,$E4,$2F,$F4,4,8,$14,0,$FE,$BF; $4FA
      .BYTE $AB,$44,$A0,0,$57,$EC,$43,$BB,$EA,$DB,$A7,$EF,$87,$4E,$EE; $50B
      .BYTE $C3,$4E,$80,$80,0,$F0,$FF,$37,$95,$80,$A,$E8,$E8,$F,$EC,$DA; $51A
      .BYTE $DB,$AB,$FB,$C9,$43,$7F,$B1		  ; $52A
      .BYTE $89,0,$A,0,$FF,$DF,$49,2,$A,$70,$EA,7,$EE,$EA,$F6; NOT logged as PCM data
      .BYTE $6A,$55,$55,$D5,$54,$AA,$5A,$55,$55,$85,$D8,$EA,$D7,$FF,2; Logged as PCM data
      .BYTE 0,0,$FE,$FF,$5F,$62,0,0,0,$FF,$FF,$FF,$27,0,0,$E8,$FF,$FF; $F
      .BYTE 7,0,$FC,$FF,$FF,$FF,0,0,0,$F8,$FF,3,0,$80,$FD,$FF,$7F,0,0; $21
      .BYTE $B0,$FF,$FF,1,0,0,$FF,$FF,$FF,$F,0,0,$FE,$FF,5,0,0,$FA,$FF;	$34
      .BYTE $5F,4,$80,$EE,$FF,$FF,$1F,0,0,0,$FA,$FF,3,0,$BA,$FF,$FF,$5F; $47
      .BYTE 0,0,$D0,$EF,$EF,8,0,$40,$FF,$FF,$FF,8,0,$D8,$FF,$FF,2,0,0; $59
      .BYTE $F8,$FF,$6F,$13,1,$6A,$FB,$B6,$AA,0,$40,$B6,$FF,$B7,$12,$24; $6C
      .BYTE $B5,$ED,$6B,$49,0,$64,$BB,$B7,$93,$44,$A9,$55,$F5,$ED,$AB; $7C
      .BYTE $44,$80,$94,$A6,$B7,$9B,$54,$6A,$95,$56,$B5,$5A,$35,$95,$22; $8B
      .BYTE $A4,$B6,$6A,$DB,$6A,$25,$A9,$AA,$6D,$BB,$15,4,$A4,$6A,$6F; $9A
      .BYTE $AB,$12,$6A,$DB,$B6,$95,$54,$92,$A2,$D4,$6A,$6F,$A5,$42,$55; $A9
      .BYTE $D5,$EA,$5B,9,$49,$AD,$B6,$56,$25,$28,$E2,$ED,$7E,$4C,$2B; $B8
      .BYTE $41,$92,$6D,$BF,$AB,$24,0,$52,$6F,$B7,$B5,$6A,$49,$55,$5B; $C7
      .BYTE $AB,$6A,$13,8,$69,$DB,$5A,$95,$24,$BA,$6F,$57,$45,$48,$55; $D6
      .BYTE $DB,$AD,$85,$24,$42,$D5,$F6,$BD,$AD,$24,2,$D5,$F6,$56,$93; $E5
      .BYTE 8,$51,$DB,$BE,$AD,$2A,$24,$49,$6F,$B7,$A9,$22,8,$B5,$DD,$AB; $F4
      .BYTE $A9,$44,$59,$6D,$6F,$25,$91,$94,$AA,$B6,$6D,$A9,$92,$A8,$DA; $104
      .BYTE $75,$AB,$24,$91,$6A,$BB,$5D,$25,$41,$94,$6D,$D7,$AA,$52,$29; $113
      .BYTE $55,$6D,$B5,$A9,$52,$49,$B5,$6D,$4B,$A2,$54,$D5,$B6,$5A,$29; $122
      .BYTE $92,$54,$DB,$6D,$2D,$29,$52,$A5,$B6,$6D,$93,$4A,$52,$6B,$D5; $131
      .BYTE $92,$AA,$AA,$55,$5B,$55,$91,$54,$59,$B5,$55,$55,$49,$A5,$DA; $140
      .BYTE $B6,$AB,$8A,$42,$A5,$F6,$B2,$25,$49,$56,$6D,$B5,$A9,$94,$CA; $14F
      .BYTE $AA,$6A,$AB,$4A,$A5,$54,$69,$DB,$2B,$A9,$A4,$AA,$6A,$6D,$25; $15E
      .BYTE $49,$AD,$56,$55,$65,$45,$95,$6B,$D5,$55,$85,$8A,$52,$EF,$B6; $16D
      .BYTE $B5,$24,$A0,$AA,$D5,$55,$95,$52,$55,$B5,$5A,$AB,$A2,$AA,$AA; $17C
      .BYTE $B6,$55,$A5,$82,$54,$DB,$6D,$55,$49,$48,$DB,$DE,$AA,$52,9; $18B
      .BYTE $95,$6A,$5B,$55,$93,$2A,$55,$6B,$CB,$96,$52,$C9,$EA,$D5,$54; $19A
      .BYTE $42,$52,$B5,$6D,$6B,$A9,$42,$25,$BB,$76,$AD,$54,$88,$AA,$B6; $1A9
      .BYTE $6D,$55,9,$69,$6B,$AB,$55,$92,$24,$55,$7F,$A5,$52,$A5,$54; $1B8
      .BYTE $6A,$57,$55,$55,$95,$AA,$B5,$55,$51,$49,$52,$BB,$B7,$25,$24; $1C7
      .BYTE $A9,$D8,$F5,$55,$95,$48,$92,$DD,$B7,$53,$22,1,$69,$DF,$B7; $1D6
      .BYTE $96,$22,$24,$69,$DF,$5E,$95,$12,$29,$69,$5B,$AB,$A9,$20,$A9; $1E5
      .BYTE $6D,$6F,$5B,$51,$2A,$55,$96,$AC,$4A,$B5,$2D,$4B,$A9,$65,$55; $1F4
      .BYTE $95,$AD,$2A,$95,$A5,$D4,$6A,$57,$25,$92,$AA,$DA,$6D,$AB,$44; $203
      .BYTE $52,$25,$B5,$B7,$D5,$CA,$42,$2A,$D5,$AE,$2B,$4A,$94,$AA,$DA; $212
      .BYTE $55,$AB,$5A,$A9,$22,$A9,$EA,$5A,$AB,$52,$AA,$5A,$AD,$2D,$A9; $221
      .BYTE $4A,$53,$A9,$AA,$5A,$5B,$12,$A2,$B6,$6E,$5F,$49,$92,$44,$BB; $230
      .BYTE $5D,$53,$45,$A2,$54,$AB,$77,$2F,$25,$82,$A4,$D6,$EE,$6B,$49; $23F
      .BYTE $42,$6A,$DB,$4A,$95,$AA,$92,$AD,$B6,$6A,$53,$A1,$AA,$AA,$B6; $24E
      .BYTE $52,$25,$49,$ED,$AD,$AA,$A2,$AA,$AA,$56,$5B,$A5,$92,$25,$A5; $25D
      .BYTE $A9,$6D,$AB,$4A,$95,$56,$A9,$95,$AA,$52,$AB,$D6,$52,$AD,$AA; $26C
      .BYTE $52,$95,$2A,$B5,$D5,$4A		  ; $27B
      .BYTE $A9,$2A,$55,$6D,$6B,$A5,$AA,$24,$55,$55,$DB,$4A,$95,$2A,$B5; NOT logged	as PCM data
      .BYTE $AD,$AA,$AA,$49,$52,$B5,$A9,$AA,$CA,$52,$6B,$DB,$AA,$92,$44; $F
      .BYTE $92,$D5,$B7,$55,$45,$89,$B2,$DD,$5A,$95,$92,$54,$4A,$DF,$DA; $1E
      .BYTE $A2,$22,$A9,$6A,$DB,$36,$91,$54,$B5,$B6,$5A,$49,$4A,$2D,$AB; $2D
      .BYTE $B5,$A5,$24,$55,$D5,$DA,$6A,$2B,$44,$B2,$7A,$B7,$A9,4,$A5; $3C
      .BYTE $AA,$DB,$56,$4A,$25,$D1,$B2,$DB,$B5,$52,$22,$A5,$6A,$5F,$4B; $4B
      .BYTE $92,$24,$B5,$B7,$AD,$24,$92,$54,$DB,$6E,$95,$46,$91,$52,$DB; $5A
      .BYTE $6D,$27,$49,$42,$6D,$77,$8D,$A5,$54,$49,$D3,$AA,$49,$6D,$55; $69
      .BYTE $55,$DB,$24,$A9,$52,$D9,$6A,$AF,$24,$91,$D2,$B6,$6D,$17,9; $78
      .BYTE $92,$6A,$F7,$B6,$25,9,$89,$DA,$BE,$B7,$2A,8,$82,$DD,$BE,$55; $87
      .BYTE $95,$A4,$52,$DB,$56,$A9,$94,$24,$B5,$BB,$56,$4A,$25,$D5,$AA; $97
      .BYTE $AB,$2A,$51,$53,$B5,$B5,$2A,$A5,$92,$55,$DB,$6A,$95,$24,$69; $A6
      .BYTE $AD,$B6,$95,$24,$A5,$B2,$5B,$AB,$4A,$95,$B4,$AA,$6D,$4B,$8A; $B5
      .BYTE $2A,$B5,$B6,$55,9,$12,$ED,$F6,$AA,$AB,$24,$A9,$94,$B6,$56; $C4
      .BYTE $5B,$49,$52,$D3,$D6,$6A,$25,$A9,$B6,$55,$25,$49,$A5,$AA,$AE; $D3
      .BYTE $AD,$2A,$A9,$D2,$5A,$B5,$AA,$56,$42,$55,$5B,$55,$2B,$25,$55; $E2
      .BYTE $6B,$AB,$A9,$55,$29,$A9,$9A,$4A,$B5,$6A,$A9,$AA,$55,$A9,$6A; $F1
      .BYTE $AB,$AA,$95,$2A,$28,$AD,$5D,$DB,$92,$24,$55,$B5,$DA,$B5,$92; $100
      .BYTE $A2,$54,$B5,$6D,$2B,$12,$AA,$D4,$6A,$DF,$2A,$89,$AA,$5A,$55; $10F
      .BYTE $D7,$24,$51,$55,$B5,$56,$2D,$29,$69,$AF,$56,$B5,$94,$88,$AA; $11E
      .BYTE $2D,$5B,$AD,$52,$A5,$AA,$AA,$5A,$B5,$94,$DA,$AA,$AA,$A4,$12; $12D
      .BYTE $AD,$B6,$95,$A5,$AA,$B2,$DA,$56,$A9,$6A,$29,$89,$D5,$AA,$AA; $13C
      .BYTE $A5,$4A,$55,$6B,$59,$69,$AD,$D4,$AA,$A5,$A8,$52,$55,$B5,$A9; $14B
      .BYTE $55,$55,$55,$6B,$55,$95,$92,$2A,$A9,$55,$AB,$52,$AD,$AA,$E9; $15A
      .BYTE $5A,$55,$42,$AB,$56,$55,$53,$29,$B1,$7A,$59,$B5,$54,$55,$52; $169
      .BYTE $6B,$AB,$56,$25,$49,$56,$6D		  ; $178
ScreenUpdateBufferPointers:
      .WORD PPUBuffer_301

      .WORD PPUBuffer_583
      .WORD PPUBuffer_55F
      .WORD PPUBuffer_CharacterSelect
      .WORD PPUBuffer_BANKE_DE7A
      .WORD PPUBuffer_Text_Game_Over
      .WORD PPUBuffer_67B
      .WORD PPUBuffer_Text_Retry
      .WORD PPUBuffer_7168
      .WORD PPUBuffer_67B
      .WORD PPUBuffer_693
      .WORD PPUBuffer_6AB
      .WORD PPUBuffer_6BD
      .WORD PPUBuffer_6CC
      .WORD PPUBuffer_6E9
      .WORD PPUBuffer_6DA
      .WORD PPUBuffer_6DF
      .WORD PPUBuffer_6E4
      .WORD PPUBuffer_7194
      .WORD PPUBuffer_71A8
      .WORD PPUBuffer_721B
      .WORD PPUBuffer_BANKE_DFAF
      .WORD PPUBuffer_BANKE_DFA7
      .WORD BonusChanceLayoutRAM
PPUBuffer_CharacterSelect:
      .BYTE $21,$49,6,$E9,$E5,$DE,$DA,$EC,$DE     ; PLEASE
      .BYTE $21,$50,6,$EC,$DE,$E5,$DE,$DC,$ED	  ;	SELECT
      .BYTE $21,$8C,6,$E9,$E5,$DA,$F2,$DE,$EB	  ;	PLAYER
      .BYTE $20,0,$20,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8; Probably the	checkerboard diamonds or w/e
      .BYTE $B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7; $F
      .BYTE $B8,$B7,$B8,$B7,$B8			  ; $1E
      .BYTE $20,$20,$20,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA
      .BYTE $B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9; $F
      .BYTE $BA,$B9,$BA,$B9,$BA			  ; $1E
      .BYTE $23,$80,$20,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8
      .BYTE $B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7,$B8,$B7; $F
      .BYTE $B8,$B7,$B8,$B7,$B8			  ; $1E
      .BYTE $23,$A0,$20,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA
      .BYTE $B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9,$BA,$B9; $F
      .BYTE $BA,$B9,$BA,$B9,$BA			  ; $1E
      .BYTE $20,0,$9E,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9
      .BYTE $B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7; $F
      .BYTE $B9,$B7,$B9				  ; $1E
      .BYTE $20,1,$9E,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA
      .BYTE $B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8; $F
      .BYTE $BA,$B8,$BA				  ; $1E
      .BYTE $20,$1E,$9E,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9
      .BYTE $B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7; $F
      .BYTE $B9,$B7,$B9				  ; $1E
      .BYTE $20,$1F,$9E,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA
      .BYTE $B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8,$BA,$B8; $F
      .BYTE $BA,$B8,$BA				  ; $1E
      .BYTE $20,$42,$5C,$FD
      .BYTE $20,$62,$5C,$FD
      .BYTE $20,$47,5,0,1,2,3,4
      .BYTE $20,$54,5,5,6,7,8,9
      .BYTE $20,$63,$A,$A,$B,$C,$D,$E,$F,$10,$11,$12,$13
      .BYTE $20,$73,$A,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D
      .BYTE $20,$82,$1C,$1E,$1F,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29
      .BYTE $FD,$FD,$FD,$FD,$2A,$2B,$2C,$2D,$2E,$2F,$30,$31,$32,$33,$34; $F
      .BYTE $35					  ; $1E
      .BYTE $20,$A2,6,$36,$37,$38,$39,$3A,$3B
      .BYTE $20,$AB,$A,$3C,$3D,$3E,$3F,$40,$43,$44,$45,$46,$47
      .BYTE $20,$B8,6,$48,$49,$4A,$4B,$4C,$4D
      .BYTE $20,$C2,5,$4E,$4F,$50,$51,$52
      .BYTE $20,$D9,5,$53,$54,$55,$56,$57
      .BYTE $20,$E2,4,$58,$59,$5A,$5B
      .BYTE $20,$E6,$CD,$5C
      .BYTE $20,$F9,$CD,$5C
      .BYTE $20,$FA,4,$5D,$5E,$5F,$60
      .BYTE $21,2,$83,$61,$64,$67
      .BYTE $21,3,$8B,$62,$65,$68,$6A,$6C,$6F,$72,$75,$78,$7B,$7E
      .BYTE $21,4,$94,$63,$66,$69,$6B,$6D,$70,$73,$76,$79,$7C,$7F,$81
      .BYTE $82,$83,$84,$85,$86,$87,$88,$89	  ; $F
      .BYTE $21,$85,$89,$6E,$71,$74,$77,$7A,$7D,$80,$6E,$6E
      .BYTE $21,$9A,$89,$97,$9A,$9D,$BB,$A0,$A3,$A6,$A9,$AB
      .BYTE $21,$1B,$94,$8C,$8F,$92,$95,$98,$9B,$9E,$BC,$A1,$A4,$A7,$AA
      .BYTE $AC,$AD,$AE,$B0,$B1,$B2,$B3,$B4	  ; $F
      .BYTE $21,$1C,$8B,$8D,$90,$93,$96,$99,$9C,$9F,$BD,$A2,$A5,$A8
      .BYTE $21,$1D,$83,$8E,$91,$94
      .BYTE $21,$62,$D1,$FD
      .BYTE $21,$7D,$D1,$FD
      .BYTE $22,$63,$C9,$FD,$22,$7C,$C9,$FD,$22,$86,$82,$8A,$8B,$22,$99
      .BYTE $82,$8A,$8B				  ; $F
      .BYTE 0
PPUBuffer_BANKE_DE7A:
      .BYTE $23,$C0,9,$3E,$E,$E,$E,$E,$E,$E,$8E,$32
      .BYTE $23,$CF,1,$8C
      .BYTE $23,$D0,$10,$32,0,$A0,$A0,$A0,$20,0,$8C,$32,0,0,$A,2,0,0,$8C
      .BYTE $23,$E0,9,$32,0,0,$E,0,0,0,$8C,$32
      .BYTE $23,$EF,1,$8C
      .BYTE $23,$F0,6,$32,0,$A0,$A0,$A0,$A0
      .BYTE $23,$F7,9,$8C,$E,$E,$E,$E,$E,$E,$E,$E
      .BYTE $24,0,$60,$FF
      .BYTE $24,$20,$60,$FF
      .BYTE $24,$40,$60,$FF
      .BYTE $24,$60,$60,$FF
      .BYTE $27,$40,$60,$FF
      .BYTE $27,$60,$60,$FF
      .BYTE $27,$80,$60,$FF
      .BYTE $27,$A0,$60,$FF
      .BYTE $24,$80,$D6,$FF
      .BYTE $24,$81,$D6,$FF
      .BYTE $24,$82,$D6,$FF
      .BYTE $24,$9D,$D6,$FF
      .BYTE $24,$9E,$D6,$FF
      .BYTE $24,$9F,$D6,$FF
      .BYTE $24,$83,1,$D0
      .BYTE $24,$9C,1,$D8
      .BYTE $24,$84,$58,$FB
      .BYTE $24,$A3,$D4,$D1
      .BYTE $24,$BC,$D4,$D7
      .BYTE $24,$A4,$58,$FB
      .BYTE $24,$C4,$58,$FB
      .BYTE $24,$E4,$58,$FB
      .BYTE $25,4,$58,$FB
      .BYTE $25,$24,$58,$FB
      .BYTE $25,$44,$58,$FB
      .BYTE $25,$64,$58,$FB
      .BYTE $25,$84,$58,$FB
      .BYTE $25,$A4,$58,$FB
      .BYTE $25,$C4,$58,$FB
      .BYTE $25,$E4,$58,$FB
      .BYTE $26,4,$58,$FB
      .BYTE $26,$24,$58,$FB
      .BYTE $26,$44,$58,$FB
      .BYTE $26,$64,$58,$FB
      .BYTE $26,$84,$58,$FB
      .BYTE $26,$A4,$58,$FB
      .BYTE $26,$C4,$58,$FB
      .BYTE $26,$E4,$58,$FB
      .BYTE $27,$23,1,$D2
      .BYTE $27,$3C,1,$D6
      .BYTE $27,$24,$58,$D3
      .BYTE $27,$C8,8,$44,$FF,$BF,$AF,$AF,$AF,$FF,$11
      .BYTE $27,$D0,$10,$44,$BF,$AF,$AF,$AF,$AF,$EF,$11,$44,$FF,$FF,$FF
      .BYTE $FF,$FF,$FF,$11			  ; $F
      .BYTE $27,$E0,$10,$44,$FF,$FF,$FF,$FF,$FF,$FF,$11,$44,$FF,$FF,$FF
      .BYTE $FF,$FF,$AF,$11			  ; $F
      .BYTE $27,$F0,8,$44,5,5,5,5,5,5,1
      .BYTE $27,4,$58,$FB
      .BYTE 0
PPUBuffer_BANKE_DFA7:
      .BYTE $27,$EA,5,$AA,$AA,$AA,$AA,$AA
PPUBuffer_BANKE_DFAF:
      .BYTE $20,$1E,$9E,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
      .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; $F
      .BYTE $FF,$FF,$FF				  ; $1E
      .BYTE $20,$1F,$9E,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
      .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF; $F
      .BYTE $FF,$FF,$FF				  ; $1E
      .BYTE $23,$C7,1,0
      .BYTE $23,$CF,1,0
      .BYTE $23,$D7,1,0
      .BYTE $23,$DF,1				  ;	Data continues in Bank E
; end of 'BANKE'

; ===========================================================================



; -------------------------------------------


      ;.segment	BANKF
;       *	=  $E000
      .BYTE 0					  ; PPUBuffer_BANKE_DFA7 continued from	end of Bank D
      .BYTE $23,$E7,1,0
      .BYTE $23,$EF,1,0
      .BYTE $23,$F7,1,0
      .BYTE $23,$FF,1,0
      .BYTE 0
WorldStartingLevel:
      .BYTE 0

WorldPlus1StartingLevel:
      .BYTE 3
      .BYTE 6					  ; 1
      .BYTE 9					  ; 2
      .BYTE $C					  ; 3
      .BYTE $F					  ; 4
      .BYTE $12					  ; 5
      .BYTE $14					  ; 6
PlayerSelectMarioSprites1:
      .BYTE $8F,0,0,$48
      .BYTE $8F,0,$40,$50			  ; 4
      .BYTE $9F,2,0,$48				  ; 8
      .BYTE $9F,2,$40,$50			  ; $C
PlayerSelectLuigiSprites1:
      .BYTE $8F,4,1,$68
      .BYTE $8F,4,$41,$70			  ; 4
      .BYTE $9F,6,1,$68				  ; 8
      .BYTE $9F,6,$41,$70			  ; $C
PlayerSelectToadSprites1:
      .BYTE $8F,8,2,$88
      .BYTE $8F,8,$42,$90			  ; 4
      .BYTE $9F,$A,2,$88			  ; 8
      .BYTE $9F,$A,$42,$90			  ; $C
PlayerSelectPrincessSprites1:
      .BYTE $8F,$C,3,$A8
      .BYTE $8F,$C,$43,$B0			  ; 4
      .BYTE $9F,$E,3,$A8			  ; 8
      .BYTE $9F,$E,$43,$B0			  ; $C
PlayerSelectMarioSprites2:
      .BYTE $8F,$10,0,$48
      .BYTE $8F,$12,0,$50			  ; 4
      .BYTE $9F,$14,0,$48			  ; 8
      .BYTE $9F,$16,0,$50			  ; $C
PlayerSelectLuigiSprites2:
      .BYTE $8F,$18,1,$68
      .BYTE $8F,$1A,1,$70			  ; 4
      .BYTE $9F,$1C,1,$68			  ; 8
      .BYTE $9F,$1E,1,$70			  ; $C
PlayerSelectToadSprites2:
      .BYTE $8F,$20,2,$88
      .BYTE $8F,$22,2,$90			  ; 4
      .BYTE $9F,$24,2,$88			  ; 8
      .BYTE $9F,$26,2,$90			  ; $C
PlayerSelectPrincessSprites2:
      .BYTE $8F,$28,3,$A8
      .BYTE $8F,$2A,3,$B0			  ; 4
      .BYTE $9F,$2C,3,$A8			  ; 8
      .BYTE $9F,$2E,3,$B0			  ; $C
PlayerSelectSpriteIndexes:
      .BYTE	0, $30,	$20, $10
BonusChanceCherrySprite:
      .BYTE $5F,5,1,$58
      .BYTE $5F,7,1,$60				  ; 4
BonusChanceStarSprite:
      .BYTE $5F,9,1,$58
      .BYTE $5F,9,$41,$60
BonusChanceVeggieSprite:
      .BYTE $5F,$B,1,$58
      .BYTE $5F,$B,$41,$60
BonusChanceSnifitSprite:
      .BYTE $5F,1,1,$58
      .BYTE $5F,3,1,$60
PlayerSelectSpritePalettesDark:
      .BYTE $3F,$10,$10,$F,$22,$12,1,$F,$22,$12,1,$F,$22,$12,1,$F,$22
      .BYTE $12,1				  ; This is actually PPU data, not a straight-up palette
PlayerSelectPaletteOffsets:
      .BYTE 0
      .BYTE $15					  ; These use the internal ordering
      .BYTE $E					  ; (Mario, Princess, Toad, Luigi)
      .BYTE 7					  ; @TODO Use relative pointers
PlayerSelectSpritePalettes:
      .BYTE $3F,$10,4,$F,$27,$16,1
						  ; Mario
      .BYTE $3F,$14,4,$F,$36,$2A,1		  ; Luigi
      .BYTE $3F,$18,4,$F,$27,$30,1		  ; Toad
      .BYTE $3F,$1C,4,$F,$36,$25,7		  ; Princess
TitleCardPalettes:
      .BYTE $3F,0,$20,$38,$30,$1A,$F,$38,$38,$F,$F,$38,$17,$17,$38,$38
      .BYTE $28,$18,8,$38,$30,$27,1,$38,$37,$27,6,$38,$25,$36,6,$38,$12	; PPU data for storing the palettes
      .BYTE $36,1
      .BYTE   0
BonusChanceSpritePalettes:
      .BYTE $F,$37,$16,$F
      .BYTE $F,$37,$16,$F			  ; 4
      .BYTE $F,$37,$16,$F			  ; 8
      .BYTE $F,$37,$16,$F			  ; $C

; =============== S U B R O U T I N E =======================================

; Load A with an index and call	this to
; jump to a pointer from the table directly
; after	the call.

JumpToTableAfterJump:
      ASL     A
      TAY
      PLA
      STA     byte_RAM_A
      PLA
      STA     byte_RAM_B
      INY
      LDA     (byte_RAM_A),Y
      STA     word_RAM_C
      INY
      LDA     (byte_RAM_A),Y
      STA     word_RAM_C+1
      JMP     (word_RAM_C)

; End of function JumpToTableAfterJump

; ---------------------------------------------------------------------------
BlackAndWhitePalette:
      .BYTE $F,$30,$30,$F			 ; =============== S U B R O U T I N E =======================================

SetBlackAndWhitePalette:
      LDA     PPUSTATUS
      LDA     #$3F
      LDY     #0
      STA     PPUADDR
      STY     PPUADDR

loc_BANKF_E14B:
      TYA
      AND     #3
      TAX
      LDA     BlackAndWhitePalette,X
      STA     PPUDATA
      INY
      CPY     #$14
      BCC     loc_BANKF_E14B

      RTS

; End of function SetBlackAndWhitePalette

; =============== S U B R O U T I N E =======================================

SetScrollXYTo0:
      LDA     #0
      STA     PPUScrollYMirror
      STA     PPUScrollXMirror
      STA     byte_RAM_C8
      STA     byte_RAM_C9
      RTS

; End of function SetScrollXYTo0

; =============== S U B R O U T I N E =======================================

sub_BANKF_E166:
      JSR     EnableNMI

      JSR     WaitForNMI_TurnOffPPU

      JSR     SetScrollXYTo0

      LDA     #ScreenUpdateBuffer_RAM_55F
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

      LDA     #0
      JSR     ChangeNametableMirroring

      JSR     ClearNametablesAndSprites

      RTS

; End of function sub_BANKF_E166

; =============== S U B R O U T I N E =======================================

sub_BANKF_E17F:
      JSR     EnableNMI

      JSR     WaitForNMI_TurnOffPPU

      LDA     #$40
      STA     StackArea
      LDA     #ScreenUpdateBuffer_CharacterSelect
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

      LDA     #ScreenUpdateBuffer_BANKE_DE7A
      STA     ScreenUpdateIndex
      JMP     WaitForNMI

; End of function sub_BANKF_E17F

; =============== S U B R O U T I N E =======================================

sub_BANKF_E198:
      INY
      TYA
      JSR     sub_BANKF_EA8E

      INX
      TXA
      ORA     #$D0
      STA     byte_RAM_717D
      LDY     ExtraLives
      DEY
      TYA
      JSR     sub_BANKF_EA8E

      STY     byte_RAM_7191
      STA     byte_RAM_7192
      LDY     #6
      LDA     #$FB

loc_BANKF_E1B6:
      STA     unk_RAM_716B,Y
      DEY
      BPL     loc_BANKF_E1B6

      LDY     CurrentWorld
      LDA     CurrentLevel
      SEC
      SBC     WorldStartingLevel,Y
      STA     byte_RAM_629
      CLC
      ADC     #$D1
      STA     byte_RAM_717F
      LDA     WorldPlus1StartingLevel,Y
      SEC
      SBC     WorldStartingLevel,Y
      STA     byte_RAM_3
      LDX     #0
      LDY     #0

loc_BANKF_E1DC:
      LDA     #$FD
      CPX     byte_RAM_629
      BNE     loc_BANKF_E1E5

      LDA     #$F6

loc_BANKF_E1E5:
      STA     unk_RAM_716B,Y
      INY
      INY
      INX
      CPX     byte_RAM_3
      BCC     loc_BANKF_E1DC

      LDA     #8
      STA     ScreenUpdateIndex
      RTS

; End of function sub_BANKF_E198

; =============== S U B R O U T I N E =======================================

sub_BANKF_E1F4:
      LDA     #$C0
      STA     StackArea
      RTS

; End of function sub_BANKF_E1F4

; =============== S U B R O U T I N E =======================================

InitializeSomeLevelStuff:
      LDA     #$00
      STA     CurrentLevelArea
      STA     byte_RAM_4E8
      STA     CurrentLevelPage
      STA     byte_RAM_4E9
      STA     TransitionType
      STA     byte_RAM_4EA
      STA     PlayerState
      STA     byte_RAM_4E6
      STA     InSubspaceOrJar
      STA     byte_RAM_4EE
      STA     StopwatchTimer
      STA     PlayerCurrentSize
      RTS

; End of function InitializeSomeLevelStuff

; ---------------------------------------------------------------------------
byte_BANKF_E220:
      .BYTE $C9

      .BYTE $D5
      .BYTE $D1
      .BYTE $CD
byte_BANKF_E224:
      .BYTE $E9

      .BYTE $F5
      .BYTE $F1
      .BYTE $ED

; =============== S U B R O U T I N E =======================================

DisplayLevelTitleCardAndMore:
      JSR     WaitForNMI_TurnOffPPU

      JSR     DisableNMI

      LDA     #$FF				  ; Set	the scrolling mirror over to the right side...
						  ; This Isn't quiiite correct, and causes a bunch of
						  ; crud to show on the	very left pixel	-- residue
						  ; from the character select screen
      STA     PPUScrollXMirror
      JSR     ChangeTitleCardCHR

      LDA     #PRGBank_A_B
      JSR     ChangeMappedPRGBank

      JSR     CopyCharacterStatsAndStuff

      JSR     EnableNMI

      JSR     HideAllSprites

      LDY     #$23

loc_BANKF_E245:
      LDA     TitleCardPalettes,Y
      STA     PPUBuffer_55F,Y
      DEY
      BPL     loc_BANKF_E245

      LDA     #ScreenUpdateBuffer_RAM_55F	  ; Then tell it to dump that into the PPU
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

      LDA     #ScreenUpdateBuffer_BANKE_DFAF	  ; @TODO I am not sure	what this is doing, exactly
      STA     ScreenUpdateIndex			  ; Commenting it out doesn't seem to have any effect
      JSR     WaitForNMI

      JSR     DrawTitleCardWorldImage

      JSR     WaitForNMI_TurnOnPPU

      JSR     RestorePlayerToFullHealth

      LDA     #$50
      STA     byte_RAM_2

loc_BANKF_E269:
      JSR     WaitForNMI

      DEC     byte_RAM_2
      BPL     loc_BANKF_E269

      JSR     sub_BANKF_E1F4

      JSR     WaitForNMI_TurnOffPPU

      JSR     DisableNMI

      JSR     sub_BANKF_FE16

      LDA     #PRGBank_A_B
      JSR     ChangeMappedPRGBank

      JSR     CopyCharacterStatsAndStuff

      JSR     EnableNMI

      RTS

; End of function DisplayLevelTitleCardAndMore

; =============== S U B R O U T I N E =======================================

DoCharacterSelectMenu:
      JSR     WaitForNMI

      LDA     #0
      STA     PPUMASK
      JSR     DisableNMI

      JSR     LoadCharacterSelectCHRBanks

      LDA     #PRGBank_A_B
      JSR     ChangeMappedPRGBank

      JSR     CopyCharacterStatsAndStuff

      JSR     sub_BANKF_E166

      LDA     byte_RAM_636
      CMP     #$A5
      BEQ     loc_BANKF_E2B2

      LDA     #PRGBank_A_B
      JSR     ChangeMappedPRGBank

      LDA     #$A5
      STA     byte_RAM_636

loc_BANKF_E2B2:
      JSR     sub_BANKF_E17F

      JSR     DisableNMI

      LDA     #Music1_CharacterSelect
      STA     Music1Queue
      LDA     CurrentCharacter
      STA     byte_RAM_404
      LDA     CurrentWorld
      STA     byte_RAM_405
      LDY     #$3F

loc_BANKF_E2CA:
      LDA     PlayerSelectMarioSprites1,Y
      STA     SpriteDMAArea+$10,Y
      DEY
      BPL     loc_BANKF_E2CA

      JSR     EnableNMI

      JSR     WaitForNMI

      LDX     CurrentWorld
      LDY     CurrentLevel
      JSR     sub_BANKF_E198

      JSR     WaitForNMI

      JMP     loc_BANKF_E311

; ---------------------------------------------------------------------------

loc_BANKF_E2E8:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Right|ControllerInput_Left
      BNE     CharacterSelect_ChangeCharacter

      JMP     CharacterSelectMenuLoop

; ---------------------------------------------------------------------------

CharacterSelect_ChangeCharacter:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Right
      BEQ     loc_BANKF_E2FE

      DEC     CurrentCharacter
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffectQueue1

loc_BANKF_E2FE:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Left
      BEQ     loc_BANKF_E30B

      INC     CurrentCharacter
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffectQueue1

loc_BANKF_E30B:
      LDA     CurrentCharacter
      AND     #3
      STA     CurrentCharacter

loc_BANKF_E311:
      LDY     #0
      LDA     #$21
      STA     PPUBuffer_301
      LDA     #$C9
      STA     byte_RAM_302
      LDA     #$4F
      STA     byte_RAM_303
      LDA     #$FB
      STA     byte_RAM_304
      LDA     #$21
      STA     byte_RAM_305
      LDA     #$E9
      STA     byte_RAM_306
      LDA     #$4F
      STA     byte_RAM_307
      LDA     #$FB
      STA     byte_RAM_308
      LDY     CurrentCharacter
      LDA     #$21
      STA     byte_RAM_309
      LDA     byte_BANKF_E220,Y
      STA     byte_RAM_30A
      LDA     #2
      STA     byte_RAM_30B
      LDA     #$BE
      STA     byte_RAM_30C
      LDA     #$C0
      STA     byte_RAM_30D
      LDA     #$21
      STA     byte_RAM_30E
      LDA     byte_BANKF_E224,Y
      STA     byte_RAM_30F
      LDA     #2
      STA     byte_RAM_310
      LDA     #$BF
      STA     byte_RAM_311
      LDA     #$C1
      STA     byte_RAM_312
      LDA     #0
      STA     byte_RAM_313
      JSR     WaitForNMI_TurnOnPPU

      LDX     #$12
      LDY     #0

loc_BANKF_E37D:
      LDA     PlayerSelectSpritePalettesDark,Y
      STA     PPUBuffer_301,Y
      INY
      DEX
      BPL     loc_BANKF_E37D

      LDA     #6
      STA     byte_RAM_A
      LDX     CurrentCharacter
      LDA     PlayerSelectPaletteOffsets,X
      TAX

loc_BANKF_E391:
      LDA     PlayerSelectSpritePalettes,X
      STA     PPUBuffer_301,Y
      INY
      INX
      DEC     byte_RAM_A
      BPL     loc_BANKF_E391

      LDA     #0
      STA     PPUBuffer_301,Y

CharacterSelectMenuLoop:
      JSR     WaitForNMI_TurnOnPPU

      LDA     Player1JoypadPress
      AND     #ControllerInput_A
      BNE     loc_BANKF_E3AE

      JMP     loc_BANKF_E2E8

; ---------------------------------------------------------------------------

loc_BANKF_E3AE:
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffectQueue1
      LDX     CurrentWorld
      LDY     CurrentLevel
      JSR     sub_BANKF_E198

      LDA     #$40
      STA     byte_RAM_10
      JSR     WaitForNMI

      LDX     #$F
      LDA     CurrentCharacter
      TAY
      LDA     PlayerSelectSpriteIndexes,Y
      TAY

loc_BANKF_E3CC:
      LDA     PlayerSelectMarioSprites2,Y
      STA     SpriteDMAArea+$10,Y
      INY
      DEX
      BPL     loc_BANKF_E3CC

loc_BANKF_E3D6:
      JSR     WaitForNMI

      DEC     byte_RAM_10
      BPL     loc_BANKF_E3D6

      LDY     #$3F

loc_BANKF_E3DF:
      LDA     PlayerSelectMarioSprites1,Y
      STA     SpriteDMAArea+$10,Y
      DEY
      BPL     loc_BANKF_E3DF

      LDA     #$40
      STA     byte_RAM_10

loc_BANKF_E3EC:
      JSR     WaitForNMI

      DEC     byte_RAM_10
      BPL     loc_BANKF_E3EC

      LDA     #Music2_StopMusic
      STA     MusicQueue2
      RTS

; End of function DoCharacterSelectMenu

; ---------------------------------------------------------------------------

StartGame:
      LDA     #0				  ; This starts	the game once RESET has	done its thing.
						  ; We also come here after choosing "RETRY"
						  ; from the game over menu
      STA     PPUMASK
      JSR     DisableNMI

      LDA     #PRGBank_0_1
      STA     byte_RAM_6F3
      JSR     ChangeMappedPRGBank

      JSR     TitleScreen			  ; The	whole title screen is a	subroutine, lol

      INC     byte_RAM_6F3
      LDA     #2				  ; Give the player 2 continues	once they start
      STA     Continues

ContinueGame:
      LDA     #3				  ; We return here after picking "CONTINUE"
						  ; from the game over menu
      STA     ExtraLives			  ; You	get 3 extra lives to start. Generous as	always

StartCharacterSelectMenu:
      LDX     CurrentWorld
      LDY     WorldStartingLevel,X
      STY     CurrentLevel
      STY     byte_RAM_4E7
      JSR     DoCharacterSelectMenu		  ; Does Character Select menu stuff

      JSR     InitializeSomeLevelStuff		  ; Initializes	some level stuff

      JSR     DisplayLevelTitleCardAndMore	  ; Displays title card	for the	stage,
						  ; and	seems to load the proper graphics
						  ; and	reset some variables

      LDA     #$FF
      STA     byte_RAM_545
      BNE     loc_BANKF_E43B			  ; Branch always?

loc_BANKF_E435:
      JSR     DoCharacterSelectMenu

loc_BANKF_E438:
      JSR     DisplayLevelTitleCardAndMore

loc_BANKF_E43B:
      JSR     WaitForNMI_TurnOffPPU

      LDA     #$B0
      ORA     byte_RAM_C9
      LDY     IsHorizontalLevel
      BNE     loc_BANKF_E44A

      AND     #$FE
      ORA     byte_RAM_C8

loc_BANKF_E44A:
      STA     PPUCtrlMirror
      STA     PPUCTRL
      LDA     #$80
      STA     StackArea
      LDA     #PRGBank_8_9
      JSR     ChangeMappedPRGBank

      JSR     GetLevelPointers

      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK6_9567

      JSR     sub_BANK6_93A4

      JSR     HideAllSprites

      JSR     WaitForNMI

      JSR     sub_BANKF_E1F4

      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled
      STA     PPUCtrlMirror
      LDA     IsHorizontalLevel
      BEQ     loc_BANKF_E4CC

loc_BANKF_E478:
      JSR     WaitForNMI

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_8500

      JSR     sub_BANKF_F6C0

      LDA     byte_RAM_13
      BEQ     loc_BANKF_E478

      LDA     #0
      STA     byte_RAM_13
      JSR     WaitForNMI_TurnOnPPU

loc_BANKF_E491:
      JSR     WaitForNMI

      LDA     NeedVerticalScroll
      AND     #4
      BNE     loc_BANKF_E4A3

      LDA     Player1JoypadPress
      AND     #ControllerInput_Start
      BEQ     loc_BANKF_E4A3

      JMP     loc_BANKF_E515

; ---------------------------------------------------------------------------

loc_BANKF_E4A3:
      LDA     InSubspaceOrJar
      BEQ     loc_BANKF_E4AB

      JMP     loc_BANKF_E5A0

; ---------------------------------------------------------------------------

; horizontal level
loc_BANKF_E4AB:
      JSR     HideAllSprites

      JSR     sub_BANKF_F11E

      LDY     GameMode
      BEQ     loc_BANKF_E4B9

      JMP     loc_BANKF_E665

; ---------------------------------------------------------------------------

loc_BANKF_E4B9:
      LDA     byte_RAM_627
      BEQ     loc_BANKF_E491

      JSR     sub_BANKF_F6A1

      JSR     sub_BANKF_F1AE

      LDA     #0
      STA     byte_RAM_627
      JMP     loc_BANKF_E43B

; ---------------------------------------------------------------------------

loc_BANKF_E4CC:
      JSR     WaitForNMI

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_8000

      JSR     sub_BANKF_F6C0

      LDA     byte_RAM_13
      BEQ     loc_BANKF_E4CC

      LDA     #0
      STA     byte_RAM_13
      JSR     WaitForNMI_TurnOnPPU

loc_BANKF_E4E5:
      JSR     WaitForNMI

      LDA     NeedVerticalScroll
      AND     #4
      BNE     loc_BANKF_E4F4

      LDA     Player1JoypadPress
      AND     #ControllerInput_Start
      BNE     loc_BANKF_E515

; vertical level
loc_BANKF_E4F4:
      JSR     HideAllSprites

      JSR     sub_BANKF_F17E

      LDY     GameMode
      BEQ     loc_BANKF_E502

      JMP     loc_BANKF_E665

; ---------------------------------------------------------------------------

loc_BANKF_E502:
      LDA     byte_RAM_627
      BEQ     loc_BANKF_E4E5

      JSR     sub_BANKF_F6A1

      JSR     sub_BANKF_F1AE

      LDA     #0
      STA     byte_RAM_627
      JMP     loc_BANKF_E43B

; ---------------------------------------------------------------------------

loc_BANKF_E515:
      JSR     sub_BANKF_E9E5

      LDA     #$41
						  ; used when running sound queues
      STA     StackArea

loc_BANKF_E51D:
      LDA     #$E
      STA     byte_RAM_6

DoSuicideCheatCheck:
      JSR     WaitForNMI_TurnOnPPU

      LDA     PlayerState			  ; Check if the player	is already dying
      CMP     #PlayerState_Dying
      BEQ     loc_BANKF_E533			  ; If so, skip	the suicide code check

      LDA     Player2JoypadHeld			  ; Check for suicide code
      CMP     #ControllerInput_Up|ControllerInput_B|ControllerInput_A ;	Up + A + B
      BNE     loc_BANKF_E533			  ; Not	being held! Nothing to see here

      JSR     KillPlayer			  ; KILL THYSELF

loc_BANKF_E533:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Start
      BNE     loc_BANKF_E54B

      DEC     byte_RAM_6
      BPL     DoSuicideCheatCheck

      INC     byte_RAM_7
      LDA     byte_RAM_7
      AND     #1
      CLC
      ADC     #$D				  ; Will use either $D or $E from the update index pointers
      STA     ScreenUpdateIndex			  ; @TODO I assume this	is what	blinks "PAUSE"
      JMP     loc_BANKF_E51D

; ---------------------------------------------------------------------------

loc_BANKF_E54B:
      JSR     WaitForNMI_TurnOffPPU

      JSR     sub_BANKF_FE16

      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK6_93A4

      JSR     WaitForNMI

      JSR     sub_BANKF_E1F4

      JSR     HideAllSprites

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_81D6

      LDA     IsHorizontalLevel
      BNE     loc_BANKF_E587

      LDA     #1
      JSR     ChangeNametableMirroring

      JSR     sub_BANK0_81FE

loc_BANKF_E576:
      JSR     WaitForNMI

      JSR     sub_BANK0_823D

      LDA     byte_RAM_537
      BEQ     loc_BANKF_E576

      JSR     WaitForNMI_TurnOnPPU

      JMP     loc_BANKF_E4E5

; ---------------------------------------------------------------------------

loc_BANKF_E587:
      LDA     #0
      JSR     ChangeNametableMirroring

      JSR     sub_BANK0_8785

loc_BANKF_E58F:
      JSR     WaitForNMI

      JSR     sub_BANK0_87AA

      LDA     byte_RAM_537
      BEQ     loc_BANKF_E58F

      JSR     WaitForNMI_TurnOnPPU

      JMP     loc_BANKF_E491

; ---------------------------------------------------------------------------

loc_BANKF_E5A0:
      JSR     ClearNametablesAndSprites

      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      LDA     #0
      STA     SubspaceCoins
      LDA     InSubspaceOrJar
      CMP     #2
      BEQ     loc_BANKF_E5D4

      LDA     #PRGBank_8_9
      JSR     ChangeMappedPRGBank

      JSR     GetJarPointers

      JSR     GetEnemyPointers

      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK6_94AD

      LDA     #Music1_Inside
      STA     Music1Queue
      LDA     #1
      STA     byte_RAM_545
      JMP     loc_BANKF_E5E1

; ---------------------------------------------------------------------------

loc_BANKF_E5D4:
      JSR     sub_BANK6_941D

      LDA     #Music1_Subspace
      STA     Music1Queue
      LDA     #4
      STA     byte_RAM_545

loc_BANKF_E5E1:
      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_870C

      JSR     EnableNMI

loc_BANKF_E5EC:
      JSR     WaitForNMI

      JSR     sub_BANK0_87AA

      LDA     byte_RAM_537
      BEQ     loc_BANKF_E5EC

      LDA     InSubspaceOrJar
      CMP     #2
      BEQ     loc_BANKF_E606

      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK6_93A4

loc_BANKF_E606:
      JSR     WaitForNMI_TurnOnPPU

; subspace
loc_BANKF_E609:
      JSR     WaitForNMI

      JSR     HideAllSprites

      JSR     sub_BANKF_F0F9

      LDY     GameMode
      BEQ     loc_BANKF_E61A

      JMP     loc_BANKF_E665

; ---------------------------------------------------------------------------

loc_BANKF_E61A:
      LDA     InSubspaceOrJar
      BNE     loc_BANKF_E609

      LDA     SubspaceCoins
      BEQ     loc_BANKF_E627

      INC     SubspaceVisits

loc_BANKF_E627:
      LDA     CurrentLevelAreaCopy
      STA     CurrentLevelArea
      LDA     #PRGBank_6_7
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK6_93A4

      JSR     WaitForNMI_TurnOffPPU

      JSR     HideAllSprites

      LDY     byte_RAM_544
      STY     byte_RAM_545
      LDA     StarInvincibilityTimer
      BNE     loc_BANKF_E64C

      LDA     LevelMusicIndexes,Y
      STA     Music1Queue

loc_BANKF_E64C:
      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_874C

loc_BANKF_E654:
      JSR     WaitForNMI

      JSR     sub_BANK0_87AA

      LDA     byte_RAM_537
      BEQ     loc_BANKF_E654

      JSR     WaitForNMI_TurnOnPPU

      JMP     loc_BANKF_E491

; ---------------------------------------------------------------------------

loc_BANKF_E665:
      JSR     sub_BANKF_F6DA

      LDY     GameMode
      LDA     #GameMode_InGame
      STA     GameMode
      STA     StarInvincibilityTimer
      STA     BigVeggiesPulled
      STA     CherryCount
      STA     StopwatchTimer
      DEY
      BNE     loc_BANKF_E69F

      STY     PlayerCurrentSize
      JSR     sub_BANKF_F1E1

      LDA     #$FF
      STA     byte_RAM_545
      LDA     #$25
      STA     byte_RAM_7180
      LDA     #$48
      STA     byte_RAM_7181
      LDA     #$15
      STA     byte_RAM_5BD
      JSR     sub_BANKF_E9F4

      JMP     loc_BANKF_E438

; ---------------------------------------------------------------------------

loc_BANKF_E69F:
      LDA     #PlayerHealth_2_HP
      STA     PlayerHealth
      LDA     #0
      STA     PlayerMaxHealth
      STA     KeyUsed
      STA     Mushroom1upPulled
      STA     Mushroom1Pulled
      STA     Mushroom2Pulled
      STA     SubspaceVisits
      STA     EnemiesKilledForHeart
      DEY
      BEQ     DoGameOverStuff

      JMP     loc_BANKF_E75A

; ---------------------------------------------------------------------------

DoGameOverStuff:
      STY     PlayerCurrentSize
      LDA     #Music2_GameOver
      STA     MusicQueue2
      JSR     WaitForNMI_TurnOffPPU

      JSR     ChangeTitleCardCHR

      JSR     ClearNametablesAndSprites

      JSR     SetBlackAndWhitePalette

      JSR     SetScrollXYTo0

      JSR     EnableNMI

      JSR     WaitForNMI_TurnOnPPU

      LDA     #ScreenUpdateBuffer_Text_Game_Over
      STA     ScreenUpdateIndex
      LDA     #$C0
      STA     byte_RAM_6

loc_BANKF_E6E6:
      JSR     WaitForNMI

      DEC     byte_RAM_6
      BNE     loc_BANKF_E6E6

      LDY     #$28

loc_BANKF_E6EF:
      LDA     Text_Continue,Y
      STA     PPUBuffer_67B,Y
      DEY
      BPL     loc_BANKF_E6EF

      LDA     #$FB
      STA     byte_RAM_68F
      LDA     Continues
      CLC
      ADC     #$D0
      STA     byte_RAM_67E
      LDA     #0
      STA     byte_RAM_8
      LDA     #6
      DEC     Continues
      BPL     loc_BANKF_E717

      LDA     #1
      STA     byte_RAM_8
      LDA     #ScreenUpdateBuffer_Text_Retry

loc_BANKF_E717:
      STA     ScreenUpdateIndex

loc_BANKF_E719:
      JSR     WaitForNMI

      LDA     Player1JoypadPress
      AND     #ControllerInput_Select
      BEQ     loc_BANKF_E747

      LDA     byte_RAM_8
      EOR     #1
      STA     byte_RAM_8
      LDY     Continues
      CPY     #$FF
      BNE     loc_BANKF_E733

      LDA     #1
      STA     byte_RAM_8

loc_BANKF_E733:
      ASL     A
      ASL     A
      TAY
      LDA     #$FB
      STA     byte_RAM_71AB
      STA     byte_RAM_71AF
      LDA     #$F6
      STA     byte_RAM_71AB,Y
      LDA     #ScreenUpdateBuffer_RAM_71a8
      STA     ScreenUpdateIndex

loc_BANKF_E747:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Start
      BEQ     loc_BANKF_E719

      LDA     byte_RAM_8
      BNE     GameOver_Retry

      STA     SlotMachineCoins
      JMP     ContinueGame

; ---------------------------------------------------------------------------

GameOver_Retry:
      JMP     StartGame

; ---------------------------------------------------------------------------

loc_BANKF_E75A:
      DEY
      BEQ     EndOfLevel

      LDY     CurrentWorld
      STY     byte_RAM_405
      LDA     WarpDestinations,Y
      STA     CurrentWorld
      TAY
      LDX     CurrentCharacter
      LDA     WorldStartingLevel,Y
      STA     CurrentLevel
      STA     byte_RAM_4E7
      INY
      TYA
      ORA     #$D0
      STA     byte_RAM_71A6
      JSR     WaitForNMI_TurnOffPPU

      JSR     SetScrollXYTo0

      JSR     ClearNametablesAndSprites

      JSR     SetBlackAndWhitePalette

      JSR     EnableNMI

      JSR     ChangeTitleCardCHR

      LDA     #ScreenUpdateBuffer_RAM_7194
      STA     ScreenUpdateIndex
      LDA     #Music2_SlotWarpFanfare
      STA     MusicQueue2
      JSR     sub_BANKF_E94A

      JSR     InitializeSomeLevelStuff

      JMP     loc_BANKF_E435

; ---------------------------------------------------------------------------

EndOfLevel:
      LDA     #Music2_StopMusic			  ; Stop music
      STA     MusicQueue2
      LDX     CurrentCharacter			  ; Increase the current character's
      INC     CharacterLevelsCompleted,X	  ; "contribution" counter
      LDA     CurrentLevel			  ; Check if we've just completed
      CMP     #$13				  ; the	final level
      BNE     EndOfLevelSlotMachine		  ; Jump to slots if not final level

      JMP     EndingSceneRoutine		  ; Otherwise, do ending

; ---------------------------------------------------------------------------

EndOfLevelSlotMachine:
      STY     PlayerCurrentSize
      JSR     WaitForNMI_TurnOffPPU

      JSR     ClearNametablesAndSprites

      JSR     LoadBonusChanceCHRBanks

      JSR     CopyUnusedCoinSpriteToSpriteArea

      LDA     #PRGBank_A_B
      JSR     ChangeMappedPRGBank

      JSR     CopyBonusChanceLayoutToRAM

      LDA     #ScreenUpdateBuffer_RAM_BonusChanceLayout
      STA     ScreenUpdateIndex
      LDA     #$40
      STA     StackArea
      JSR     EnableNMI

      JSR     WaitForNMI

      LDA     #$C0
      STA     StackArea
      JSR     DisableNMI

      JSR     sub_BANKF_EA33

      LDA     #Music2_SlotWarpFanfare
      STA     MusicQueue2
      LDA     SlotMachineCoins
      BNE     loc_BANKF_E7F2

      JMP     NoCoinsForSlotMachine

; ---------------------------------------------------------------------------

loc_BANKF_E7F2:
      LDA     #3
      STA     ObjectXLo+3
      STA     ObjectXLo+4
      STA     ObjectXLo+5
      JSR     WaitForNMI_TurnOnPPU

loc_BANKF_E7FD:
      LDA     SlotMachineCoins
      BNE     StartSlotMachine

loc_BANKF_E802:
      LDY     CurrentWorld
      LDA     WorldPlus1StartingLevel,Y
      SEC
      SBC     #1
      CMP     CurrentLevel
      BNE     loc_BANKF_E81E

      JSR     sub_BANKF_E1F4

      LDA     #$FF
      STA     byte_RAM_545
      INC     CurrentWorld
      JMP     StartCharacterSelectMenu

; ---------------------------------------------------------------------------

loc_BANKF_E81E:
      JSR     sub_BANKF_F6A1

      LDA     CurrentLevel
      LDY     #0

loc_BANKF_E826:
      INY
      CMP     WorldStartingLevel,Y
      BCS     loc_BANKF_E826

      DEY
      STY     CurrentWorld			  ; I am sure this is important	somehow, but...	why
      LDY     CurrentWorld
      LDA     CurrentLevel
      SEC
      SBC     WorldStartingLevel,Y
      STA     byte_RAM_629
      LDA     CurrentLevel
      STA     byte_RAM_4E7
      LDA     CurrentLevelArea
      STA     byte_RAM_4E8
      LDA     CurrentLevelPage
      STA     byte_RAM_4E9
      LDY     #0
      STY     byte_RAM_4E6
      STY     TransitionType
      STY     byte_RAM_4EA
      DEY
      STY     byte_RAM_545
      JSR     sub_BANKF_E1F4

      JMP     loc_BANKF_E435

; ---------------------------------------------------------------------------

StartSlotMachine:
      DEC     SlotMachineCoins
      JSR     WaitForNMI

      JSR     sub_BANKF_EA68

      LDA     #1				  ; Set	all reel timers
      STA     ObjectXLo
      STA     ObjectXLo+1
      STA     ObjectXLo+2
      LSR     A					  ; Set	all reels to the first position
      STA     ObjectXLo+6
      STA     ObjectXLo+7
      STA     ObjectXLo+8

DoSlotMachineSpinnyShit:
      JSR     WaitForNMI			  ; $2C-$2E: Reel change timer
						  ; $2F-$31: Current reel icon

      LDA     #SoundEffect2_Climbing		  ; Play "reel sound" sound effect
      STA     SoundEffectQueue2
      JSR     sub_BANKF_EAC2

      JSR     sub_BANKF_EADC

      JSR     sub_BANKF_EAF6

      JSR     sub_BANKF_E916

      LDA     byte_BANKF_E9DF,Y
      STA     ScreenUpdateIndex
      INC     byte_RAM_6
      LDA     ObjectXLo				  ; Reel 1 still active?
      ORA     ObjectXLo+1			  ; Reel 2 still active?
      ORA     ObjectXLo+2			  ; Reel 3 still active?
      BNE     DoSlotMachineSpinnyShit		  ; If any are still active, go	back to	waiting

      LDA     #ScreenUpdateBuffer_RAM_6df
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

      LDY     #0
      LDX     ObjectXLo+6			  ; Load reel 1
      LDA     SlotMachineReelOrder1RAM,X
      BNE     CheckReel2Symbol			  ; Is this reel a cherry?

      INY					  ; Yes; add one life

CheckReel2Symbol:
      LDX     ObjectXLo+7			  ; Load reel 2
      CMP     SlotMachineReelOrder2RAM,X
      BNE     AddSlotMachineExtraLives		  ; Does this match the	previous symbol?

      CMP     #0				  ; Yes; are they both cherries?
      BNE     CheckReel3Symbol			  ; If no, skip	to third reel

      INY					  ; They are both cherries, add	another	life or	something

CheckReel3Symbol:
      LDX     ObjectXLo+8			  ; Load reel 3
      CMP     SlotMachineReelOrder3RAM,X	  ; Does reel 3	match the previous two?
      BNE     AddSlotMachineExtraLives		  ; No,	fuck you

      INY					  ; They all match! Yay! Add a life.
						  ; Cherry count: 3 / Non-cherry: 1
      CMP     #0				  ; Were they all cherries?
      BNE     AddSlotMachineExtraLives		  ; Nope, all done

      INY					  ; Yes, add 2 more extra lives
      INY

AddSlotMachineExtraLives:
      TYA					  ; Y contains extra lives to add
      CLC
      ADC     ExtraLives			  ; Add	won extra lives	to current lives
      BCC     loc_BANKF_E8D3			  ; Check if adding extra lives	has wrapped the	counter

      LDA     #$FF				  ; If so, set extra lives to 255 (#$FF)

loc_BANKF_E8D3:
      STA     ExtraLives
      TYA					  ; Did	we actually win	any lives?
      BEQ     SlotMachineLoseFanfare		  ; No,	play lose sound	effect

      ORA     #$D0
      STA     byte_RAM_6C8
      LDA     #Music2_CrystalGetFanfare		  ; Play winner	jingle
      STA     MusicQueue2
      LDA     #$A0
      STA     byte_RAM_6
      JSR     WaitForNMI

      JSR     sub_BANKF_EA68

loc_BANKF_E8ED:
      JSR     WaitForNMI

      JSR     sub_BANKF_E916

      LDA     byte_BANKF_E9E3,Y
      STA     ScreenUpdateIndex
      DEC     byte_RAM_6
      BNE     loc_BANKF_E8ED

      BEQ     loc_BANKF_E90C

SlotMachineLoseFanfare:
      LDA     #Music2_DeathJingle
      STA     MusicQueue2
      JSR     WaitForNMI

      JSR     sub_BANKF_EA68

      JSR     sub_BANKF_E94A

loc_BANKF_E90C:
      LDA     #ScreenUpdateBuffer_RAM_6e4
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

      JMP     loc_BANKF_E7FD

; =============== S U B R O U T I N E =======================================

sub_BANKF_E916:
      LDA     byte_RAM_6
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      AND     #1
      TAY
      RTS

; End of function sub_BANKF_E916

; ---------------------------------------------------------------------------

NoCoinsForSlotMachine:
      JSR     sub_BANKF_E946

      LDA     #Music2_DeathJingle
      STA     MusicQueue2
      STA     byte_RAM_6

loc_BANKF_E92A:
      LDA     byte_RAM_6
      AND     #1
      TAY
      LDA     byte_BANKF_E9E1,Y
      STA     ScreenUpdateIndex
      LDA     #$A
      STA     byte_RAM_7

loc_BANKF_E938:
      JSR     WaitForNMI_TurnOnPPU

      DEC     byte_RAM_7
      BNE     loc_BANKF_E938

      DEC     byte_RAM_6
      BPL     loc_BANKF_E92A

      JMP     loc_BANKF_E802

; =============== S U B R O U T I N E =======================================

sub_BANKF_E946:
      LDA     #$50
      BNE     loc_BANKF_E94C

; End of function sub_BANKF_E946

; =============== S U B R O U T I N E =======================================

sub_BANKF_E94A:
      LDA     #$A0

loc_BANKF_E94C:
      STA     byte_RAM_7

loc_BANKF_E94E:
      JSR     WaitForNMI_TurnOnPPU

      DEC     byte_RAM_7
      BNE     loc_BANKF_E94E

      RTS

; End of function sub_BANKF_E94A

; ---------------------------------------------------------------------------

EndingSceneRoutine:
      JSR     SetScrollXYTo0

      LDA     #$80
      STA     byte_RAM_4080			  ; FDS	leftover; $4080	is an old sound	register
						  ; The	prototype had two writes to this address!
						  ; It looks like they missed this one,	though.
      ASL     A
      STA     byte_RAM_607
      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK1_A43B

      JSR     WaitForNMI_TurnOffPPU

      JSR     DisableNMI

      JSR     LoadCelebrationSceneBackgroundCHR

      JSR     EnableNMI

      JSR     WaitForNMI

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      INC     byte_RAM_6F3
      JSR     sub_BANK1_AA79

      JSR     WaitForNMI_TurnOffPPU

      JSR     DisableNMI

      JSR     LoadMarioSleepingCHRBanks

      JSR     EnableNMI

      JSR     WaitForNMI

      LDA     #PRGBank_C_D
      JSR     ChangeMappedPRGBank

      INC     byte_RAM_6F3
      JMP     MarioSleepingScene

; =============== S U B R O U T I N E =======================================

DisableNMI:
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIDisabled
      STA     PPUCTRL
      STA     PPUCtrlMirror
      RTS

; End of function DisableNMI

; ---------------------------------------------------------------------------
PPUBuffer_Text_Game_Over:
      .BYTE $21, $CB, $A, $E0, $DA, $E6, $DE, $FB, $FB, $E8,	$EF, $DE
      .BYTE $EB, 0				  ; $C ; "GAME	OVER"
Text_Continue:
      .BYTE $21, $75, 1, 0			  ; (Placeholder for continue count)
						  ; This is loaded manually and	drawn so the count
						  ; can	be patched in
						  ; * CONTINUE
      .BYTE $21, $6A, $A, $F6, $FB, $DC, $E8, $E7, $ED,	$E2, $E7, $EE
      .BYTE $DE					  ; $C
PPUBuffer_Text_Retry:
      .BYTE $21,	$AA, 7,	$F6, $FB, $EB, $DE, $ED, $EB, $F2; * RETRY
      .BYTE $21, $CB, $A, $FB, $FB, $FB, $FB, $FB, $FB,	$FB, $FB, $FB; Blank, erases "GAME	OVER"
      .BYTE $FB, 0				  ; $C
      .BYTE   9
      .BYTE  $F
byte_BANKF_E9DF:
      .BYTE ScreenUpdateBuffer_RAM_6ab
      .BYTE ScreenUpdateBuffer_RAM_6df
byte_BANKF_E9E1:
      .BYTE ScreenUpdateBuffer_RAM_693

      .BYTE ScreenUpdateBuffer_RAM_6da
byte_BANKF_E9E3:
      .BYTE ScreenUpdateBuffer_RAM_6bd
      .BYTE ScreenUpdateBuffer_RAM_6da

; =============== S U B R O U T I N E =======================================

sub_BANKF_E9E5:
      LDA     #$16
      STA     byte_RAM_5BD
      LDA     #$26
      STA     byte_RAM_7180
      LDA     #$C8
      STA     byte_RAM_7181

; End of function sub_BANKF_E9E5

; =============== S U B R O U T I N E =======================================

sub_BANKF_E9F4:
      JSR     WaitForNMI_TurnOffPPU

      JSR     ChangeTitleCardCHR

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_81A2

      LDY     #$23

loc_BANKF_EA04:
      LDA     TitleCardPalettes,Y
      STA     PPUBuffer_55F,Y
      DEY
      BPL     loc_BANKF_EA04

      JSR     sub_BANKF_E166

      JSR     sub_BANKF_E17F

      LDX     CurrentWorld
      LDY     CurrentLevel
      JSR     sub_BANKF_E198

      LDA     #$FF
      STA     PPUScrollXMirror
      JSR     WaitForNMI

      LDA     byte_RAM_5BD
      STA     ScreenUpdateIndex
      JSR     WaitForNMI

; End of function sub_BANKF_E9F4

; =============== S U B R O U T I N E =======================================

EnableNMI:
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      RTS

; End of function EnableNMI

; =============== S U B R O U T I N E =======================================

sub_BANKF_EA33:
      JSR     SetScrollXYTo0

      LDA     PPUSTATUS
      LDY     #0
      LDA     #$3F
      STA     PPUADDR
      STY     PPUADDR

loc_BANKF_EA43:
      LDA     unk_RAM_59C,Y
      STA     PPUDATA
      INY
      CPY     #$10
      BCC     loc_BANKF_EA43

      LDY     #0
      LDA     PPUSTATUS
      LDA     #$3F
      STA     PPUADDR
      LDA     #$10
      STA     PPUADDR

SetBonusChancePalette:
      LDA     BonusChanceSpritePalettes,Y
      STA     PPUDATA
      INY
      CPY     #$10
      BCC     SetBonusChancePalette

; End of function sub_BANKF_EA33

; =============== S U B R O U T I N E =======================================

sub_BANKF_EA68:
      LDY     ExtraLives
      DEY
      TYA
      JSR     sub_BANKF_EA8E

      STY     byte_RAM_599
      STA     byte_RAM_59A
      LDA     SlotMachineCoins
      CLC
      ADC     #$D0
      STA     byte_RAM_588
      LDA     #ScreenUpdateBuffer_RAM_583
      STA     ScreenUpdateIndex
      LDA     #$40
      STA     StackArea
      JSR     EnableNMI

      JMP     WaitForNMI

; End of function sub_BANKF_EA68

; =============== S U B R O U T I N E =======================================

sub_BANKF_EA8E:
      LDY     #$D0

loc_BANKF_EA90:
      CMP     #$A
      BCC     loc_BANKF_EA9A

      SBC     #$A
      INY
      JMP     loc_BANKF_EA90

; ---------------------------------------------------------------------------

loc_BANKF_EA9A:
      ORA     #$D0
      CPY     #$D0
      BNE     locret_BANKF_EAA2

      LDY     #$FB

locret_BANKF_EAA2:
      RTS

; End of function sub_BANKF_EA8E

; =============== S U B R O U T I N E =======================================

WaitForNMI_TurnOffPPU:
      LDA     #0
      BEQ     _WaitForNMI_StuffPPUMask		  ; Branch always

; End of function WaitForNMI_TurnOffPPU

; =============== S U B R O U T I N E =======================================

WaitForNMI_TurnOnPPU:
      LDA     #PPUMask_ShowLeft8Pixels_BG|PPUMask_ShowLeft8Pixels_SPR|PPUMask_ShowBackground|PPUMask_ShowSprites

_WaitForNMI_StuffPPUMask:
      STA     PPUMaskMirror

; End of function WaitForNMI_TurnOnPPU

; =============== S U B R O U T I N E =======================================

WaitForNMI:
      LDA     ScreenUpdateIndex
      ASL     A
      TAX
      LDA     ScreenUpdateBufferPointers,X
      STA     RAM_PPUDataBufferPointer
      LDA     ScreenUpdateBufferPointers+1,X
      STA     RAM_PPUDataBufferPointer+1
      LDA     #0
      STA     NMIWaitFlag			  ; Start waiting for NMI to finish

WaitForNMILoop:
      LDA     NMIWaitFlag			  ; Has	the NMI	routine	set the	flag yet?
      BPL     WaitForNMILoop			  ; If no, wait	some more

      RTS					  ; If yes, go back to what we were doing

; End of function WaitForNMI

; =============== S U B R O U T I N E =======================================

sub_BANKF_EAC2:
      LDA     Player1JoypadPress
      BPL     locret_BANKF_EAD1

      LDX     #0

loc_BANKF_EAC8:
      LDA     ObjectXLo,X
      BNE     loc_BANKF_EAD2

      INX
      CPX     #3
      BCC     loc_BANKF_EAC8

locret_BANKF_EAD1:
      RTS

; ---------------------------------------------------------------------------

loc_BANKF_EAD2:
      LDA     #0
      STA     ObjectXLo,X
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffectQueue1
      RTS

; End of function sub_BANKF_EAC2

; =============== S U B R O U T I N E =======================================

sub_BANKF_EADC:
      LDX     #2

loc_BANKF_EADE:
      LDA     ObjectXLo,X
      BEQ     loc_BANKF_EAF2

      DEC     ObjectXLo+3,X
      BNE     loc_BANKF_EAF2

      LDA     #4
      STA     ObjectXLo+3,X
      DEC     ObjectXLo+6,X
      BPL     loc_BANKF_EAF2

      LDA     #7
      STA     ObjectXLo+6,X

loc_BANKF_EAF2:
      DEX
      BPL     loc_BANKF_EADE

      RTS

; End of function sub_BANKF_EADC

; =============== S U B R O U T I N E =======================================

sub_BANKF_EAF6:
      LDA     #2
      STA     byte_RAM_0

loc_BANKF_EAFA:
      LDA     byte_RAM_0
      TAY
      ASL     A
      ASL     A
      ASL     A
      TAX
      ADC     ObjectXLo+6,Y
      TAY
      LDA     SlotMachineReelOrder1RAM,Y
      TAY
      LDA     #7
      STA     byte_RAM_1

loc_BANKF_EB0D:
      LDA     BonusChanceCherrySprite,Y
      STA     SpriteDMAArea+$10,X
      INX
      INY
      DEC     byte_RAM_1
      BPL     loc_BANKF_EB0D

      DEC     byte_RAM_0
      BPL     loc_BANKF_EAFA

      LDX     #$17

loc_BANKF_EB1F:
      TXA
      AND     #$18
      ASL     A
      ASL     A
      ADC     SpriteDMAArea+$10,X
      STA     SpriteDMAArea+$10,X
      DEX
      DEX
      DEX
      DEX
      BPL     loc_BANKF_EB1F

      RTS

; End of function sub_BANKF_EAF6

; =============== S U B R O U T I N E =======================================

CopyUnusedCoinSpriteToSpriteArea:
      LDY     #0				  ; This copies	the unused coin	sprite from memory
						  ; into the sprite DMA	area at	$200

loc_BANKF_EB33:
      LDA     unk_RAM_653,Y			  ; Copy two sprites from memory to memory.
      STA     SpriteDMAArea+$28,Y		  ; This is definitely efficient.
      INY					  ; Two	sprites	for each half of the coin.
      CPY     #8				  ; Four bytes per sprite * 2 sprites =	8 bytes
      BCC     loc_BANKF_EB33

      RTS

; End of function CopyUnusedCoinSpriteToSpriteArea

; ---------------------------------------------------------------------------

loc_BANKF_EB3F:
      LDA     #0
      STA     OAMADDR
      LDA     #2
      STA     OAM_DMA
      JSR     sub_BANKF_FF73

      LDA     PPUMaskMirror
      STA     PPUMASK
      JSR     DoSoundProcessing

      LDA     PPUCtrlMirror
      STA     PPUCTRL
      DEC     NMIWaitFlag
      JMP     loc_BANKF_EC61

; ---------------------------------------------------------------------------

loc_BANKF_EB5E:
      LDA     #0
      STA     PPUMASK
      STA     OAMADDR
      LDA     #2
      STA     OAM_DMA
      JSR     sub_BANKF_FF73

      JSR     UpdatePPUFromBufferWithOptions

      JSR     sub_BANKF_EC68

      LDA     PPUScrollXMirror
      STA     PPUSCROLL
      LDA     #0
      STA     PPUSCROLL
      LDA     PPUMaskMirror
      STA     PPUMASK
      JMP     loc_BANKF_EC4B

; ---------------------------------------------------------------------------

loc_BANKF_EB86:
      LDA     PPUMaskMirror
      STA     PPUMASK
      JMP     loc_BANKF_EC5E

; =============== S U B R O U T I N E =======================================

      ;	public NMI
NMI:
      PHP
      PHA
      TXA
      PHA
      TYA
      PHA
      BIT     StackArea
      BPL     loc_BANKF_EB5E

      BVC     loc_BANKF_EB3F

      LDA     #0
      STA     PPUMASK
      STA     OAMADDR
      LDA     #2
      STA     OAM_DMA
      JSR     sub_BANKF_FF73

      LDA     NMIWaitFlag
      BNE     loc_BANKF_EB86

      LDA     IsHorizontalLevel
      BEQ     loc_BANKF_EC1F

      LDA     byte_RAM_51C
      BEQ     loc_BANKF_EBE8

      LDA     #0
      STA     byte_RAM_51C
      LDX     #$1E
      LDY     #0
      LDA     PPUSTATUS
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteVertical|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled
      STA     PPUCTRL

loc_BANKF_EBC9:
IFDEF COMPATIBILITY
      .db $ad, $d1, $00 ; LDA $00D1
ENDIF
IFNDEF COMPATIBILITY
      LDA     byte_RAM_D1			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF

      STA     PPUADDR
IFDEF COMPATIBILITY
      .db $ad, $d2, $00 ; LDA $00D2
ENDIF
IFNDEF COMPATIBILITY
      LDA     byte_RAM_D2			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF

      STA     PPUADDR

loc_BANKF_EBD5:
      LDA     unk_RAM_380,Y
      STA     PPUDATA
      INY
      DEX
      BNE     loc_BANKF_EBD5

      LDX     #$1E
IFDEF COMPATIBILITY
      .db $ee, $d2, $00 ; INC $00D2
ENDIF
IFNDEF COMPATIBILITY
      INC     byte_RAM_D2			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF

      CPY     #$3C
      BNE     loc_BANKF_EBC9

loc_BANKF_EBE8:
      LDA     byte_RAM_3BC
      BEQ     loc_BANKF_EC1F

      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteVertical|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled
      STA     PPUCTRL
      LDY     #0
      LDX     #4

loc_BANKF_EBF6:
      LDA     PPUSTATUS
      LDA     byte_RAM_3BC
      STA     PPUADDR
      LDA     byte_RAM_3BD
      STA     PPUADDR

loc_BANKF_EC05:
      LDA     unk_RAM_3BE,Y
      STA     PPUDATA
      INY
      TYA
      LSR     A
      BCS     loc_BANKF_EC05

      LDA     byte_RAM_3BD
      CLC
      ADC     #8
      STA     byte_RAM_3BD
      DEX
      BNE     loc_BANKF_EBF6

      STX     byte_RAM_3BC

loc_BANKF_EC1F:
      JSR     UpdatePPUFromBufferNMI

      JSR     sub_BANKF_EC68

      LDA     #$B0
      ORA     byte_RAM_C9
      LDY     IsHorizontalLevel
      BNE     loc_BANKF_EC31

      AND     #$FE
      ORA     byte_RAM_C8

loc_BANKF_EC31:
      STA     PPUCTRL
      STA     PPUCtrlMirror
      LDA     PPUScrollXMirror
      STA     PPUSCROLL
      LDA     PPUScrollYMirror
      CLC
      ADC     byte_RAM_4C5
      STA     PPUSCROLL
      LDA     PPUMaskMirror
      STA     PPUMASK
      INC     byte_RAM_10

loc_BANKF_EC4B:
      LDA     ScreenUpdateIndex
      BNE     loc_BANKF_EC55

      STA     byte_RAM_300
      STA     PPUBuffer_301

loc_BANKF_EC55:
      LDA     #0
      STA     ScreenUpdateIndex
      JSR     UpdateJoypads

      DEC     NMIWaitFlag

loc_BANKF_EC5E:
      JSR     DoSoundProcessing

IFDEF DEBUG
DebugHook:
     ; Hook into debug routine if select is pressed
     LDA Player1JoypadPress
     CMP #ControllerInput_Select
     BNE loc_BANKF_EC61
     LDA #>Debug_Init
     PHA
     LDA #<Debug_Init
     PHA
     PHP
     RTI
ENDIF

loc_BANKF_EC61:
      PLA
      TAY
      PLA
      TAX
      PLA
      PLP
      RTI

; End of function NMI

; =============== S U B R O U T I N E =======================================

sub_BANKF_EC68:
      LDA     PPUSTATUS
      LDA     #$3F
      STA     PPUADDR
      LDA     #0
      STA     PPUADDR
      STA     PPUADDR
      STA     PPUADDR
      RTS

; End of function sub_BANKF_EC68

; =============== S U B R O U T I N E =======================================

DoSoundProcessing:
      LDA     #PRGBank_4_5
      JSR     ChangeMappedPRGBankWithoutSaving

      JSR     StartProcessingSoundQueue

      LDA     MMC3PRGBankTemp
      JMP     ChangeMappedPRGBank

; End of function DoSoundProcessing

; =============== S U B R O U T I N E =======================================

ClearNametablesAndSprites:
      LDA     #0
      STA     PPUMaskMirror
      STA     PPUMASK
      LDA     #$20
      JSR     ClearNametableChunk

      LDA     #$24
      JSR     ClearNametableChunk

      LDA     #$28
      JSR     ClearNametableChunk

; End of function ClearNametablesAndSprites

; =============== S U B R O U T I N E =======================================

HideAllSprites:
      LDY     #0
      LDA     #$F8

HideAllSpritesLoop:
      STA     SpriteDMAArea,Y
      DEY
      DEY
      DEY
      DEY
      BNE     HideAllSpritesLoop

      RTS

; End of function HideAllSprites

; =============== S U B R O U T I N E =======================================

ClearNametableChunk:
      LDY     PPUSTATUS				  ; Reset PPU address latch
      LDY     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIDisabled
      STY     PPUCTRL				  ; Turn off NMI
      STY     PPUCtrlMirror
      LDY     #0
      STA     PPUADDR				  ; A will contain the high byte of the	PPU address
						  ; (generally $20, $24, $28)
      STY     PPUADDR				  ; And	Y has the low byte ($00)
      LDX     #3				  ; Do $300 bytes for this loop.
      LDA     #$FB

ClearNametableChunk_Loop:
      STA     PPUDATA				  ; Store the blank tile $300 times
      INY
      BNE     ClearNametableChunk_Loop		  ; (Loop falls	through	every $100 bytes)

      DEX
      BNE     ClearNametableChunk_Loop		  ; Loop falls through after $300 bytes

ClearNametableChunk_Loop2:
      STA     PPUDATA				  ; Do another loop of $C0 bytes to clear the
						  ; rest of the	nametable chunk
      INY
      CPY     #$C0
      BNE     ClearNametableChunk_Loop2

      LDA     #0				  ; Load A with	$00 for	clearing the attribute tables

ClearNametableChunk_AttributeTableLoop:
      STA     PPUDATA				  ; Clear attribute table...
      INY					  ; Y was $C0 on entry,	so write $40 bytes...
      BNE     ClearNametableChunk_AttributeTableLoop

PPUBufferUpdatesComplete:
      RTS					  ; Woo	fucking	hoo

; End of function ClearNametableChunk

; =============== S U B R O U T I N E =======================================

; Used to update the PPU nametable / palette data during NMI.
;
; This function	can only handle	$100 bytes of data
; (actually less).
;
; Unlike UpdatePPUFromBuffer, this one does not	support
; $80 or $40 as	options, instead treating them as direct length.
; It also does not increment the buffer	pointer, only using Y
; to read further data.
;
; If Y overflows, it will resume copying again from the	beginning,
; and can get into an infinite loop if it doesn't encounter
; a terminating	$00. Welp!

UpdatePPUFromBufferNMI:
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled
      STA     PPUCTRL
      LDY     #0

UpdatePPUFromBufferNMI_CheckForBuffer:
      LDA     (RAM_PPUDataBufferPointer),Y
      BEQ     PPUBufferUpdatesComplete

      LDX     PPUSTATUS
      STA     PPUADDR
      INY
      LDA     (RAM_PPUDataBufferPointer),Y
      STA     PPUADDR
      INY
      LDA     (RAM_PPUDataBufferPointer),Y
      TAX

UpdatePPUFromBufferNMI_CopyLoop:
      INY
      LDA     (RAM_PPUDataBufferPointer),Y
      STA     PPUDATA
      DEX
      BNE     UpdatePPUFromBufferNMI_CopyLoop

      INY
      JMP     UpdatePPUFromBufferNMI_CheckForBuffer

; End of function UpdatePPUFromBufferNMI

; =============== S U B R O U T I N E =======================================

; This reads from $F0/$F1 to determine where a "buffer"	is.
; Basically, a buffer is like this:
;
; PPUADDR  LEN	DATA ......
; $20 $04  $03	$E9 $F0	$FB
; $25 $5F  $4F	$FB
; $21 $82  $84	$00 $01	$02 $03
; $00
;
; PPUADDR is two bytes (hi,lo) for the address to send to PPUADDR.
; LEN is the length, with the following	two bitmasks:
;  - $80: Set the "draw	vertically" option
;  - $40: Use ONE tile instead of a string
; DATA is either (LEN) bytes or	one byte.
;
; After	(LEN) bytes have been written, the buffer pointer
; is incremented to (LEN+2) and	the function restarts.
; A byte of $00	terminates execution and returns.
;
; There	is a similar function, UpdatePPUFromBufferNMI,
; that is called during	NMI, but unlike	this one,
; that one does	NOT use	bitmasks, nor increment	the pointer.
;

UpdatePPUFromBufferWithOptions:
      LDY     #0				  ; First, check if we have anything
						  ; to send to the PPU
      LDA     (RAM_PPUDataBufferPointer),Y
      BEQ     PPUBufferUpdatesComplete		  ; If the first byte at the buffer address
						  ; is #$00, we	have nothing. We're done here

      LDX     PPUSTATUS				  ; Clear address latch
      STA     PPUADDR				  ; Set	the PPU	address	to the
						  ; address from the PPU buffer
      INY
      LDA     (RAM_PPUDataBufferPointer),Y
      STA     PPUADDR
      INY
      LDA     (RAM_PPUDataBufferPointer),Y	  ; Data segment length	byte...
      ASL     A
      PHA
      LDA     PPUCtrlMirror			  ; Enable NMI + Vertical increment
						  ; + whatever else was	already	set...
      ORA     #PPUCtrl_Base2000|PPUCtrl_WriteVertical|PPUCtrl_Sprite0000|PPUCtrl_Background0000|PPUCtrl_SpriteSize8x8|PPUCtrl_NMIEnabled
      BCS     UpdatePPUFBWO_EnableVerticalIncrement ; ...but only if $80 was set in the	length byte.
						  ; Otherwise, turn vertical incrementing back off

      AND     #PPUCtrl_Base2C00|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite1000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled|$40

UpdatePPUFBWO_EnableVerticalIncrement:
      STA     PPUCTRL
      PLA
      ASL     A					  ; Check if the second	bit ($40) in the length
						  ; has	been set
      BCC     UpdatePPUFBWO_CopyStringOfTiles	  ; If not, we are copying a string of data

      ORA     #2				  ; Length (A) is now (A << 2).
						  ; OR in #$02 now if we are copying a single tile;
						  ; This will be rotated out into register C momentarily
      INY

UpdatePPUFBWO_CopyStringOfTiles:
      LSR     A					  ; Restore the	data length.
						  ; A =	(Length	& #$3F)
						  ;
						  ; This moves the second bit (used above to signal
						  ; "one tile mode") into the Carry register
      LSR     A
      TAX					  ; Copy the length into register X

UpdatePPUFBWO_CopyLoop:
      BCS     UpdatePPUFBWO_CopySingleTileSkip	  ; If Carry is	set (from above),
						  ; we're only copying one tile.
						  ; Do not increment Y to advance copying index

      INY

UpdatePPUFBWO_CopySingleTileSkip:
      LDA     (RAM_PPUDataBufferPointer),Y	  ; Load data from buffer...
      STA     PPUDATA				  ; ...store it	to the PPU.
      DEX					  ; Decrease remaining length.
      BNE     UpdatePPUFBWO_CopyLoop		  ; Are	we done? If no,	copy more stuff

      INY					  ; Y contains the amount of copied data now
      TYA					  ; ...and now A does
      CLC					  ; Clear carry	bit (from earlier)
      ADC     RAM_PPUDataBufferPointer		  ; Add	the length to the PPU data buffer
      STA     RAM_PPUDataBufferPointer
      LDA     RAM_PPUDataBufferPointer+1
      ADC     #0				  ; If the length overflowed (carry set),
						  ; add	that to	the hi byte of the pointer
      STA     RAM_PPUDataBufferPointer+1
      JMP     UpdatePPUFromBufferWithOptions	  ; Start the cycle over again.
						  ; (If	the PPU	buffer points to a 0,
						  ;  it	will terminate after this jump)

; End of function UpdatePPUFromBufferWithOptions

IFDEF DEBUG
      .include "src/debug-f.asm"
ENDIF
; ---------------------------------------------------------------------------
IFDEF PRESERVE_UNUSED_SPACE
     ; Unused space in the original
     ; $ED4D - $EFFF
     .pad $F000, $FF
ENDIF

; [000002B3 BYTES: END OF AREA UNUSED-BANKF:ED4D. PRESS	KEYPAD "-" TO COLLAPSE]
byte_BANKF_F000:
      .BYTE 0

      .BYTE 8
      .BYTE $10
      .BYTE $18
      .BYTE $20
      .BYTE $24
byte_BANKF_F006:
      .BYTE $28

      .BYTE $2A
      .BYTE $29
      .BYTE $2B
byte_BANKF_F00A:
      .BYTE $2C

byte_BANKF_F00B:
      .BYTE $2E

      .BYTE $30
      .BYTE $34
      .BYTE $38	; 8
      .BYTE $3C
      .BYTE $40
byte_BANKF_F011:
      .BYTE 6

      .BYTE 9
      .BYTE 6
      .BYTE 9
      .BYTE 1
      .BYTE 1
      .BYTE $E
      .BYTE $E
      .BYTE 6
      .BYTE 9
      .BYTE 6
      .BYTE 9
      .BYTE 1
      .BYTE 1
      .BYTE $E
      .BYTE $E
      .BYTE 6
      .BYTE 9
      .BYTE 6
      .BYTE 9
      .BYTE 1
      .BYTE 1
      .BYTE $E
      .BYTE $E
      .BYTE 6
      .BYTE 9
      .BYTE 6
      .BYTE 9
      .BYTE 1
      .BYTE 1
      .BYTE $E
      .BYTE $E
      .BYTE 8
      .BYTE 8
      .BYTE 0
      .BYTE $F
      .BYTE 8
      .BYTE 8
      .BYTE 3
      .BYTE $C
      .BYTE $F8
      .BYTE $18
      .BYTE $F8
      .BYTE $18
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE 3
      .BYTE $C
      .BYTE 3
      .BYTE 3
      .BYTE 2
      .BYTE 5
      .BYTE   8
      .BYTE   8
      .BYTE   3
      .BYTE  $C
      .BYTE 8
      .BYTE 8
      .BYTE $FF
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE   2
      .BYTE $1E
byte_BANKF_F055:
      .BYTE 7

      .BYTE 7
      .BYTE $20
      .BYTE $20
      .BYTE $D
      .BYTE $1C
      .BYTE $D
      .BYTE $1C
      .BYTE $FF
      .BYTE $FF
      .BYTE $20
      .BYTE $20
      .BYTE 4
      .BYTE $1C
      .BYTE 4
      .BYTE $1C
      .BYTE $F
      .BYTE $F
      .BYTE $20
      .BYTE $20
      .BYTE $1C
      .BYTE $1C
      .BYTE $1C
      .BYTE $1C
      .BYTE 7
      .BYTE 7
      .BYTE $20
      .BYTE $20
      .BYTE $D
      .BYTE $1C
      .BYTE $D
      .BYTE $1C
      .BYTE 0
      .BYTE $10
      .BYTE 9
      .BYTE 9
      .BYTE 3
      .BYTE $10
      .BYTE 9
      .BYTE 9
      .BYTE $FF
      .BYTE $FF
      .BYTE $F
      .BYTE $F
      .BYTE $C
      .BYTE $14
      .BYTE 7
      .BYTE $20
      .BYTE $FE
      .BYTE $20
      .BYTE $10
      .BYTE $10
      .BYTE 9
      .BYTE $A
      .BYTE 8
      .BYTE 8
      .BYTE   3
      .BYTE $30
      .BYTE $18
      .BYTE $18
      .BYTE $FF
      .BYTE $10
      .BYTE 8
      .BYTE 8
      .BYTE 9
      .BYTE $A
      .BYTE   8
      .BYTE 8
byte_BANKF_F099:
      .BYTE 2

      .BYTE 2
      .BYTE 3
      .BYTE 0
      .BYTE 3
      .BYTE 3
      .BYTE $F8
      .BYTE 0
      .BYTE 3
      .BYTE 1
      .BYTE $F3
      .BYTE 4
      .BYTE 3
      .BYTE 3
      .BYTE 3
      .BYTE $F2
      .BYTE 3
      .BYTE 3
      .BYTE 5
      .BYTE 3
      .BYTE $B
      .BYTE $10
      .BYTE 3
      .BYTE 0
      .BYTE 3
      .BYTE 3
      .BYTE $F8
      .BYTE 0
      .BYTE 9
      .BYTE 4
      .BYTE 3
      .BYTE 3
      .BYTE $E
      .BYTE 3
      .BYTE 3
      .BYTE 3
      .BYTE $F6
      .BYTE $C
      .BYTE 2
      .BYTE 3
      .BYTE $B
      .BYTE $B
      .BYTE 9
      .BYTE $10
      .BYTE 9
      .BYTE $19
      .BYTE $20
      .BYTE $20
      .BYTE 3
      .BYTE $1E
      .BYTE $19
      .BYTE 8
      .BYTE 9
      .BYTE 9
      .BYTE 9
      .BYTE $18
      .BYTE 9
      .BYTE $1A
      .BYTE 6
      .BYTE $15
      .BYTE $16
      .BYTE $11
      .BYTE $D
      .BYTE $10
      .BYTE $1A
      .BYTE $19
      .BYTE $24
      .BYTE $10
      .BYTE 3
      .BYTE 4
      .BYTE $2D
      .BYTE $30
      .BYTE $F
      .BYTE $2E
      .BYTE $3E
      .BYTE $1E
      .BYTE $28
      .BYTE $13
      .BYTE $48
      .BYTE $26

; =============== S U B R O U T I N E =======================================

sub_BANKF_F0E9:
      DEC     byte_RAM_400
      BPL     locret_BANKF_F0F3

      LDA     #8
      STA     byte_RAM_400

locret_BANKF_F0F3:
      RTS

; End of function sub_BANKF_F0E9

; ---------------------------------------------------------------------------
LevelMusicIndexes:
      .BYTE	Music1_Overworld
      .BYTE Music1_Inside			  ; 1 ;	Music1 indexes.
      .BYTE Music1_Boss				  ; 2
      .BYTE Music1_Wart				  ; 3
      .BYTE Music1_Subspace			  ; 4

; =============== S U B R O U T I N E =======================================

sub_BANKF_F0F9:
      JSR     sub_BANKF_F0E9

      LDA     byte_RAM_4C7
      BNE     loc_BANKF_F11B

      LDA     byte_RAM_606
      CMP     #2
      BEQ     loc_BANKF_F115

      LDA     byte_RAM_41B
      BNE     loc_BANKF_F115

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     HandlePlayerState

loc_BANKF_F115:
      JSR     sub_BANKF_F228

      JSR     sub_BANKF_F31A

loc_BANKF_F11B:
      JMP     loc_BANKF_F146

; End of function sub_BANKF_F0F9

; =============== S U B R O U T I N E =======================================

sub_BANKF_F11E:
      JSR     sub_BANKF_F0E9

      LDA     byte_RAM_4C7
      BNE     loc_BANKF_F146

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      LDA     byte_RAM_606
      CMP     #2
      BEQ     loc_BANKF_F13A

      LDA     byte_RAM_41B
      BNE     loc_BANKF_F13A

      JSR     HandlePlayerState

loc_BANKF_F13A:
      JSR     sub_BANKF_F2C2

      JSR     sub_BANK0_85EC

      JSR     sub_BANKF_F228

      JSR     sub_BANKF_F31A

loc_BANKF_F146:
      LDA     #PRGBank_2_3
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK2_8010

      JSR     sub_BANK3_BE0B

      JSR     sub_BANKF_FACA

      JSR     sub_BANKF_F47C

      LDX     #3

loc_BANKF_F159:
      LDA     PlayerStateTimer,X
      BEQ     loc_BANKF_F15F

      DEC     PlayerStateTimer,X

loc_BANKF_F15F:
      DEX
      BPL     loc_BANKF_F159

      LDY     StarInvincibilityTimer
      BEQ     locret_BANKF_F17D

      LDA     byte_RAM_10
      AND     #7
      BNE     locret_BANKF_F17D

      DEC     StarInvincibilityTimer
      CPY     #8
      BNE     locret_BANKF_F17D

      LDY     byte_RAM_545
      LDA     LevelMusicIndexes,Y
      STA     Music1Queue

locret_BANKF_F17D:
      RTS

; End of function sub_BANKF_F11E

; =============== S U B R O U T I N E =======================================

sub_BANKF_F17E:
      JSR     sub_BANKF_F0E9

      JSR     sub_BANKF_F494

      LDA     byte_RAM_4C7
      BNE     loc_BANKF_F1AB

      LDA     byte_RAM_606
      CMP     #2
      BEQ     loc_BANKF_F19D

      LDA     byte_RAM_41B
      BNE     loc_BANKF_F19D

      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     HandlePlayerState

loc_BANKF_F19D:
      LDA     #PRGBank_0_1
      JSR     ChangeMappedPRGBank

      JSR     sub_BANK0_8083

      JSR     sub_BANKF_F228

      JSR     sub_BANKF_F31A

loc_BANKF_F1AB:
      JMP     loc_BANKF_F146

; End of function sub_BANKF_F17E

; =============== S U B R O U T I N E =======================================

sub_BANKF_F1AE:
      LDA     byte_RAM_627
      CMP     #2
      BEQ     locret_BANKF_F1E0

      LDY     #3

loc_BANKF_F1B7:
      LDA     CurrentLevel,Y
      STA     byte_RAM_4E7,Y
      DEY
      BPL     loc_BANKF_F1B7

      LDA     PlayerXLo
      STA     byte_RAM_4E1
      LDA     PlayerYLo
      STA     byte_RAM_4E2
      LDA     PlayerScreenX
      STA     byte_RAM_4E3
      LDA     PlayerScreenYLo
      STA     byte_RAM_4E4
      LDA     PlayerYAccel
      STA     byte_RAM_4E5
      LDA     PlayerState
      STA     byte_RAM_4E6

locret_BANKF_F1E0:
      RTS

; End of function sub_BANKF_F1AE

; =============== S U B R O U T I N E =======================================

sub_BANKF_F1E1:
      LDY     #3

loc_BANKF_F1E3:
      LDA     byte_RAM_4E7,Y
      STA     CurrentLevel,Y
      DEY
      BPL     loc_BANKF_F1E3

      LDA     byte_RAM_4E1
      STA     PlayerXLo
      LDA     byte_RAM_4E2
      STA     PlayerYLo
      LDA     byte_RAM_4E3
      STA     PlayerScreenX
      LDA     byte_RAM_4E4
      STA     PlayerScreenYLo
      LDA     byte_RAM_4E5
      STA     PlayerYAccel
      LDA     byte_RAM_4E6
      STA     PlayerState
      LDA     #0
      STA     InSubspaceOrJar
      STA     byte_RAM_4EE
      STA     PlayerInAir
      STA     DamageInvulnTime

; End of function sub_BANKF_F1E1

; =============== S U B R O U T I N E =======================================

RestorePlayerToFullHealth:
      LDY     PlayerMaxHealth			  ; Get	player's current max HP
      LDA     PlayerHealthValueByHeartCount,Y	  ; Get	the health value for this amount of hearts
      STA     PlayerHealth
      RTS

; End of function RestorePlayerToFullHealth

; ---------------------------------------------------------------------------
PlayerHealthValueByHeartCount:
      .BYTE PlayerHealth_2_HP, PlayerHealth_3_HP, PlayerHealth_4_HP; Max	hearts = (hearts - 2), value is	0,1,2
						  ; This table determines what the player's HP is set to
byte_BANKF_F225:
      .BYTE 0

byte_BANKF_F226:
      .BYTE $20

byte_BANKF_F227:
      .BYTE $F0

; =============== S U B R O U T I N E =======================================

sub_BANKF_F228:
      LDA     PlayerXLo
      SEC
      SBC     ScreenBoundaryLeftLo
      STA     PlayerScreenX
      LDA     PlayerYLo
      CLC
      SBC     ScreenYLo
      STA     PlayerScreenYLo
      LDA     PlayerYHi
      SBC     ScreenYHi
      STA     PlayerScreenYHi
      LDA     PlayerState
      CMP     #PlayerState_Lifting
      BCS     locret_BANKF_F297

      LDA     PlayerScreenYHi
      BEQ     loc_BANKF_F298

      BMI     loc_BANKF_F254

      LDA     #0
      STA     PlayerStateTimer
      JMP     KillPlayer

; ---------------------------------------------------------------------------

loc_BANKF_F254:
      LDA     PlayerYHi
      BPL     locret_BANKF_F297

      LDA     byte_RAM_4EE
      BEQ     loc_BANKF_F298

      LDA     PlayerYLo
      CMP     #$F0
      BCS     locret_BANKF_F297

      JSR     sub_BANKF_F6DA

      PLA
      PLA
      LDY     #0
      STY     PlayerDucking
      STY     PlayerYAccel
      STY     PlayerXAccel
      LDA     #PlayerState_ExitingJar
      STA     PlayerState
      LDA     #SpriteAnimation_Ducking
      STA     PlayerAnimationFrame
      LDA     byte_RAM_4EE
      STY     byte_RAM_4EE
      CMP     #2
      BNE     loc_BANKF_F286

      STA     byte_RAM_627
      RTS

; ---------------------------------------------------------------------------

loc_BANKF_F286:
      STY     InSubspaceOrJar
      LDA     CurrentLevelAreaCopy
      STA     CurrentLevelArea
      LDA     #4
      JSR     ChangeMappedPRGBank

      JMP     GetEnemyPointers

; ---------------------------------------------------------------------------

locret_BANKF_F297:
      RTS

; ---------------------------------------------------------------------------

loc_BANKF_F298:
      LDA     PlayerState
      CMP     #PlayerState_Climbing
      BNE     locret_BANKF_F297

      LDA     InSubspaceOrJar
      CMP     #2
      BEQ     locret_BANKF_F297

      LDA     byte_BANKF_F227
      LDY     PlayerYHi
      BMI     loc_BANKF_F2BB

      LDA     PlayerScreenYLo
      CMP     #$B8
      BCC     locret_BANKF_F297

      LSR     PlayerYLo
      SEC
      ROL     PlayerYLo
      LDA     byte_BANKF_F226

loc_BANKF_F2BB:
      STA     PlayerYAccel
      LDA     #3
      STA     PlayerState
      RTS

; End of function sub_BANKF_F228

; =============== S U B R O U T I N E =======================================

sub_BANKF_F2C2:
      LDA     #0
      LDY     byte_RAM_4FA
      BNE     loc_BANKF_F2D2

      LDA     PlayerXLo
      SEC
      SBC     #$78
      SEC
      SBC     ScreenBoundaryLeftLo

loc_BANKF_F2D2:
      STA     byte_RAM_BA
      RTS

; End of function sub_BANKF_F2C2

; ---------------------------------------------------------------------------
byte_BANKF_F2D5:
      .BYTE 0

      .BYTE   0
      .BYTE 0
      .BYTE   0
      .BYTE $FB
      .BYTE $FB
      .BYTE 0
      .BYTE $FB
      .BYTE $FB
      .BYTE 0
      .BYTE $FB
byte_BANKF_F2E0:
      .BYTE $D5

      .BYTE $D9
      .BYTE $FB
      .BYTE $D7
byte_BANKF_F2E4:
      .BYTE 0

byte_BANKF_F2E5:
      .BYTE 2

byte_BANKF_F2E6:
      .BYTE 4

byte_BANKF_F2E7:
      .BYTE 6

      .BYTE $C
      .BYTE $E
      .BYTE $10
      .BYTE $12
      .BYTE 0
      .BYTE 2
      .BYTE 8
      .BYTE $A
      .BYTE $C
      .BYTE $E
      .BYTE $14
      .BYTE $16
      .BYTE $FB
      .BYTE $FB
      .BYTE $2C
      .BYTE $2C
      .BYTE $FB
      .BYTE $FB
      .BYTE $2E
      .BYTE $2E
      .BYTE $C
      .BYTE $E
      .BYTE $10
      .BYTE $12
      .BYTE $30
      .BYTE $30
      .BYTE $32
      .BYTE $32
      .BYTE $20
      .BYTE $22
      .BYTE $24
      .BYTE $26
      .BYTE 0
      .BYTE 2
      .BYTE $28
      .BYTE $2A
      .BYTE $18
      .BYTE $1A
      .BYTE $1C
      .BYTE $1E
      .BYTE $B4
      .BYTE $B6
DamageInvulnBlinkFrames:
      .BYTE 1, 1, 1, 2, 2, 4,	4, 4		    ; =============== S U B R O U T I N E =======================================

sub_BANKF_F31A:
IFDEF COMPATIBILITY
      .db $ac, $50, $00 ; LDA $0000 + PlayerState
ENDIF
IFNDEF COMPATIBILITY
      LDY     PlayerState			  ; Absolute address for zero-page
	  NOP ; Alignment fix
ENDIF

      CPY     #PlayerState_ChangingSize
      BEQ     loc_BANKF_F337

      LDY     StarInvincibilityTimer
      BNE     loc_BANKF_F337

      LDA     DamageInvulnTime			  ; Determine if the player is invincible from damage,
						  ; and	if so, if they should be visible
      BEQ     loc_BANKF_F345

      LSR     A
      LSR     A
      LSR     A
      LSR     A
      TAY
      LDA     DamageInvulnTime
      AND     DamageInvulnBlinkFrames,Y
      BNE     loc_BANKF_F345

      RTS

; ---------------------------------------------------------------------------

loc_BANKF_F337:
      LDA     byte_RAM_10
      CPY     #$18
      BCS     loc_BANKF_F33F

      LSR     A
      LSR     A

loc_BANKF_F33F:
      AND     #3
      ORA     PlayerAttributesMaybe
      STA     PlayerAttributesMaybe

loc_BANKF_F345:
      LDA     byte_RAM_4DF
      BEQ     loc_BANKF_F350

      LDA     #$20
      ORA     PlayerAttributesMaybe
      STA     PlayerAttributesMaybe

loc_BANKF_F350:
      LDA     PlayerScreenX
      STA     SpriteDMAArea+$23
      STA     SpriteDMAArea+$2B
      CLC
      ADC     #8
      STA     SpriteDMAArea+$27
      STA     SpriteDMAArea+$2F
      LDA     PlayerScreenYLo
      STA     byte_RAM_0
      LDA     PlayerScreenYHi
      STA     byte_RAM_1
      LDY     PlayerAnimationFrame
      CPY     #4
      BEQ     loc_BANKF_F382

      LDA     PlayerCurrentSize
      BEQ     loc_BANKF_F382

      LDA     byte_RAM_0
      CLC
      ADC     #8
      STA     byte_RAM_0
      BCC     loc_BANKF_F382

      INC     byte_RAM_1

loc_BANKF_F382:
      LDA     CurrentCharacter
      CMP     #Character_Princess
      BEQ     loc_BANKF_F394

      CPY     #0
      BNE     loc_BANKF_F394

      LDA     byte_RAM_0
      BNE     loc_BANKF_F392

      DEC     byte_RAM_1

loc_BANKF_F392:
      DEC     byte_RAM_0

loc_BANKF_F394:
      JSR     loc_BANKF_FAFE

      LDA     byte_RAM_1
      BNE     loc_BANKF_F3A6

      LDA     byte_RAM_0
      STA     SpriteDMAArea,Y
      STA     SpriteDMAArea+$20
      STA     SpriteDMAArea+$24

loc_BANKF_F3A6:
      LDA     byte_RAM_0
      CLC
      ADC     #$10
      STA     byte_RAM_0
      LDA     byte_RAM_1
      ADC     #0
      BNE     loc_BANKF_F3BB

      LDA     byte_RAM_0
      STA     SpriteDMAArea+$28
      STA     SpriteDMAArea+$2C

loc_BANKF_F3BB:
      LDA     CrouchJumpTimer
      CMP     #$3C
      BCC     loc_BANKF_F3CA

      LDA     byte_RAM_10
      AND     #1
      ORA     PlayerAttributesMaybe
      STA     PlayerAttributesMaybe

loc_BANKF_F3CA:
      LDA     byte_RAM_9D
      LSR     A
      ROR     A
      ROR     A
      ORA     PlayerAttributesMaybe
      AND     #$FC
      ORA     #1
      STA     SpriteDMAArea+2,Y
      LDX     PlayerAnimationFrame
      CPX     #7
      BEQ     loc_BANKF_F3E2

      CPX     #4
      BNE     loc_BANKF_F3EE

loc_BANKF_F3E2:
      LDA     PlayerAttributesMaybe
      STA     SpriteDMAArea+$22
      STA     SpriteDMAArea+$2A
      ORA     #$40
      BNE     loc_BANKF_F3F8

loc_BANKF_F3EE:
      AND     #$FC
      ORA     PlayerAttributesMaybe
      STA     SpriteDMAArea+$22
      STA     SpriteDMAArea+$2A

loc_BANKF_F3F8:
      STA     SpriteDMAArea+$26
      STA     SpriteDMAArea+$2E
      LDA     byte_BANKF_F2D5,X
      BNE     loc_BANKF_F408

      LDX     CurrentCharacter
      LDA     byte_BANKF_F2E0,X

loc_BANKF_F408:
      STA     SpriteDMAArea+1,Y
      LDA     PlayerAnimationFrame
      CMP     #6
      BCS     loc_BANKF_F413

      ORA     HoldingItem

loc_BANKF_F413:
      ASL     A
      ASL     A
      TAX
      LDA     byte_RAM_9D
      BNE     loc_BANKF_F44A

      LDA     SpriteDMAArea+$23
      STA     SpriteDMAArea+3,Y
      LDA     byte_BANKF_F2E4,X
      STA     SpriteDMAArea+$21
      LDA     byte_BANKF_F2E5,X
      STA     SpriteDMAArea+$25
      LDA     PlayerCurrentSize
      BNE     loc_BANKF_F43F

      LDA     CurrentCharacter
      CMP     #Character_Princess
      BNE     loc_BANKF_F43F

      LDA     PlayerAnimationFrame
      CMP     #SpriteAnimation_Jumping
      BNE     loc_BANKF_F43F

      LDX     #$2A

loc_BANKF_F43F:
      LDA     byte_BANKF_F2E6,X
      STA     SpriteDMAArea+$29
      LDA     byte_BANKF_F2E7,X
      BNE     loc_BANKF_F478

loc_BANKF_F44A:
      LDA     SpriteDMAArea+$27
      STA     SpriteDMAArea+3,Y
      LDA     byte_BANKF_F2E5,X
      STA     SpriteDMAArea+$21
      LDA     byte_BANKF_F2E4,X
      STA     SpriteDMAArea+$25
      LDA     PlayerCurrentSize
      BNE     loc_BANKF_F46F

      LDA     CurrentCharacter
      CMP     #Character_Princess
      BNE     loc_BANKF_F46F

      LDA     PlayerAnimationFrame
      CMP     #SpriteAnimation_Jumping
      BNE     loc_BANKF_F46F

      LDX     #$2A

loc_BANKF_F46F:
      LDA     byte_BANKF_F2E7,X
      STA     SpriteDMAArea+$29
      LDA     byte_BANKF_F2E6,X

loc_BANKF_F478:
      STA     SpriteDMAArea+$2D
      RTS

; End of function sub_BANKF_F31A

; =============== S U B R O U T I N E =======================================

sub_BANKF_F47C:
      LDA     IsHorizontalLevel
      BNE     loc_BANKF_F48E

      LDY     PlayerYHi
      LDA     PlayerYLo
      JSR     sub_BANKF_F4C3

      TYA
      BPL     loc_BANKF_F490

      LDA     #0
      BEQ     loc_BANKF_F490

loc_BANKF_F48E:
      LDA     PlayerXHi

loc_BANKF_F490:
      STA     byte_RAM_535
      RTS

; End of function sub_BANKF_F47C

; =============== S U B R O U T I N E =======================================

sub_BANKF_F494:
      LDX     NeedVerticalScroll
      BNE     locret_BANKF_F4C2

      LDA     PlayerState
      CMP     #PlayerState_Lifting
      BCS     locret_BANKF_F4C2

      LDA     PlayerScreenYLo
      LDY     PlayerScreenYHi
      BMI     loc_BANKF_F4B0

      BNE     loc_BANKF_F4B6

      CMP     #$B4
      BCS     loc_BANKF_F4B6

      CMP     #$21
      BCS     loc_BANKF_F4B8

loc_BANKF_F4B0:
      LDY     PlayerInAir
      BNE     loc_BANKF_F4B8

      BEQ     loc_BANKF_F4B7

loc_BANKF_F4B6:
      INX

loc_BANKF_F4B7:
      INX

loc_BANKF_F4B8:
      LDA     byte_RAM_425
      STX     byte_RAM_425
      BNE     locret_BANKF_F4C2

      STX     NeedVerticalScroll

locret_BANKF_F4C2:
      RTS

; End of function sub_BANKF_F494

; =============== S U B R O U T I N E =======================================

sub_BANKF_F4C3:
      STA     byte_RAM_F
      TYA
      BMI     locret_BANKF_F4D9

      ASL     A
      ASL     A
      ASL     A
      ASL     A
      CLC
      ADC     byte_RAM_F
      BCS     loc_BANKF_F4D5

      CMP     #$F0
      BCC     locret_BANKF_F4D9

loc_BANKF_F4D5:
      CLC
      ADC     #$10
      INY

locret_BANKF_F4D9:
      RTS

; End of function sub_BANKF_F4C3

; ---------------------------------------------------------------------------
byte_BANKF_F4DA:
      .BYTE $C0

      .BYTE $70
      .BYTE $80
      .BYTE $50
      .BYTE $A0
      .BYTE $40
      .BYTE $B0
      .BYTE $60
      .BYTE $90
      .BYTE $C0
      .BYTE $70
      .BYTE $80
      .BYTE $50
      .BYTE $A0
      .BYTE $40
      .BYTE $B0
      .BYTE $60
ObjectAttributeTable:
      .BYTE ObjAttrib_Palette1
      .BYTE ObjAttrib_Palette1			  ; 1
      .BYTE ObjAttrib_Palette1			  ; 2
      .BYTE ObjAttrib_Palette3			  ; 3
      .BYTE ObjAttrib_Palette2			  ; 4
      .BYTE ObjAttrib_Palette1			  ; 5
      .BYTE ObjAttrib_Palette2			  ; 6
      .BYTE ObjAttrib_Palette3			  ; 7
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; 8
      .BYTE ObjAttrib_Palette1			  ; 9
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_16x32; $A
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_16x32; $B
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_16x32; $C
      .BYTE ObjAttrib_Palette1			  ; $D
      .BYTE ObjAttrib_Palette1			  ; $E
      .BYTE ObjAttrib_Palette1			  ; $F
      .BYTE ObjAttrib_Palette2			  ; $10
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $11
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_Unknown_08; $12
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $13
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $14
      .BYTE ObjAttrib_Palette0			  ; $15
      .BYTE ObjAttrib_Palette0			  ; $16
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $17
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32|ObjAttrib_UpsideDown; $18
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $19
      .BYTE ObjAttrib_Palette2|ObjAttrib_Unknown_08; $1A
      .BYTE ObjAttrib_Palette2|ObjAttrib_Unknown_08; $1B
      .BYTE ObjAttrib_Palette2|ObjAttrib_16x32	  ; $1C
      .BYTE ObjAttrib_Palette3|ObjAttrib_16x32	  ; $1D
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $1E
      .BYTE ObjAttrib_Palette2|ObjAttrib_Unknown_08; $1F
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $20
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $21
      .BYTE ObjAttrib_Palette2			  ; $22
      .BYTE ObjAttrib_Palette1			  ; $23
      .BYTE ObjAttrib_Palette3			  ; $24
      .BYTE ObjAttrib_Palette2			  ; $25
      .BYTE ObjAttrib_Palette1			  ; $26
      .BYTE ObjAttrib_Palette1			  ; $27
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $28
      .BYTE ObjAttrib_Palette1			  ; $29
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $2A
      .BYTE ObjAttrib_Palette1			  ; $2B
      .BYTE ObjAttrib_Palette3|ObjAttrib_Unknown_04|ObjAttrib_Unknown_08|ObjAttrib_16x32; $2C
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $2D
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $2E
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $2F
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $30
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $31
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$32
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$33
      .BYTE ObjAttrib_Palette2|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$34
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$35
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$36
      .BYTE ObjAttrib_Palette1|ObjAttrib_UpsideDown; $37
      .BYTE ObjAttrib_Palette1|ObjAttrib_UpsideDown; $38
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $39
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08|ObjAttrib_UpsideDown; $3A
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_Unknown_08|ObjAttrib_16x32; $3B
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $3C
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08; $3D
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08|ObjAttrib_UpsideDown; $3E
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $3F
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_08|ObjAttrib_UpsideDown; $40
      .BYTE ObjAttrib_Palette1|ObjAttrib_Unknown_04|ObjAttrib_16x32; $41
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $42
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32	  ; $43
      .BYTE ObjAttrib_Palette1|ObjAttrib_Mirrored ; $44
      .BYTE ObjAttrib_Palette2|ObjAttrib_Mirrored ; $45
      .BYTE ObjAttrib_Palette2|ObjAttrib_Mirrored|ObjAttrib_UpsideDown;	$46
EnemyArray_46E_Data:
      .BYTE 4

      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 3
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE $50
      .BYTE $40
      .BYTE $42
      .BYTE $42
      .BYTE $42
      .BYTE $40
      .BYTE $40
      .BYTE $40
      .BYTE $40
      .BYTE $13
      .BYTE $D0
      .BYTE $80
      .BYTE 0
      .BYTE 6
      .BYTE 6
      .BYTE 7
      .BYTE $10
      .BYTE $50
      .BYTE $90
      .BYTE 7
      .BYTE $A
      .BYTE $3B
      .BYTE $40
      .BYTE $18
      .BYTE 7
      .BYTE $1B
      .BYTE $10
      .BYTE 7
      .BYTE 7
      .BYTE 7
      .BYTE $50
      .BYTE $53
      .BYTE $96
      .BYTE $50
      .BYTE $9B
      .BYTE $D3
      .BYTE $1B
      .BYTE $B
      .BYTE 3
      .BYTE 3
      .BYTE 3
      .BYTE 3
      .BYTE 0
      .BYTE 0
      .BYTE   0
      .BYTE   0
      .BYTE   4
      .BYTE 4
      .BYTE 4
      .BYTE 0
      .BYTE 0
      .BYTE 6
      .BYTE 4
      .BYTE 0
      .BYTE 4
      .BYTE   4
      .BYTE   4
      .BYTE $16
      .BYTE 6
      .BYTE 6
      .BYTE $C
      .BYTE 4
      .BYTE   4
EnemyArray_492_Data:
      .BYTE   0
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE $C
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE $D
      .BYTE $D
      .BYTE 5
      .BYTE $C
      .BYTE $C
      .BYTE 5
      .BYTE $D
      .BYTE $C
      .BYTE $C
      .BYTE 5
      .BYTE $E
      .BYTE $D
      .BYTE $C
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE $C
      .BYTE   5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 5
      .BYTE 0
      .BYTE $F
      .BYTE $F
      .BYTE $F
      .BYTE $F
      .BYTE 5
      .BYTE 5
      .BYTE   5
      .BYTE   5
      .BYTE   5
      .BYTE 5
      .BYTE 5
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE   4
      .BYTE   4
      .BYTE $10
      .BYTE 0
      .BYTE 0
      .BYTE 5
      .BYTE 5
      .BYTE   5
EnemyArray_489_Data:
      .BYTE   8
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 4
      .BYTE 2
      .BYTE 9
      .BYTE 9
      .BYTE 9
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 8
      .BYTE 8
      .BYTE 2
      .BYTE 4
      .BYTE 4
      .BYTE $E
      .BYTE 8
      .BYTE 4
      .BYTE 4
      .BYTE 2
      .BYTE $F
      .BYTE 2
      .BYTE $13
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE $10
      .BYTE   2
      .BYTE $12
      .BYTE 2
      .BYTE $F
      .BYTE 2
      .BYTE $11
      .BYTE $B
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE   2
      .BYTE   2
      .BYTE   2
      .BYTE 2
      .BYTE 4
      .BYTE 3
      .BYTE 3
      .BYTE 7
      .BYTE 4
      .BYTE 3
      .BYTE 3
      .BYTE   3
      .BYTE   3
      .BYTE 9
      .BYTE $B
      .BYTE $B
      .BYTE 2
      .BYTE 2
      .BYTE   2
byte_BANKF_F607:
      .BYTE 0

      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 2
      .BYTE 1
      .BYTE 0
      .BYTE 2
      .BYTE 3
      .BYTE 2
      .BYTE 4
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 0
      .BYTE 2
byte_BANKF_F64E:
      .BYTE 1

      .BYTE $43
      .BYTE $80
      .BYTE $C0
      .BYTE $12
      .BYTE $60
      .BYTE $91
      .BYTE $CA
      .BYTE $18
      .BYTE $69
      .BYTE $98
      .BYTE $D5
WarpDestinations:
      .BYTE 3, 1, 4,	5, 6, 5, 6		     ; =============== S U B R O U T I N E =======================================

UpdateJoypads:
      JSR     ReadJoypads

loc_BANKF_F664:
      LDY     Player1JoypadPress		  ; Work around	DPCM sample bug,
						  ; where some spurious	inputs are read
      JSR     ReadJoypads

      CPY     Player1JoypadPress
      BNE     loc_BANKF_F664

      LDX     #1

loc_BANKF_F66F:
      LDA     Player1JoypadPress,X		  ; Update the press/held values
      TAY
      EOR     Player1JoypadHeld,X
      AND     Player1JoypadPress,X
      STA     Player1JoypadPress,X
      STY     Player1JoypadHeld,X
      DEX
      BPL     loc_BANKF_F66F

      RTS

; End of function UpdateJoypads

; =============== S U B R O U T I N E =======================================

ReadJoypads:
      LDX     #1
      STX     JOY1
      DEX
      STX     JOY1
      LDX     #8

ReadJoypadLoop:
      LDA     JOY1
      LSR     A
      ROL     Player1JoypadPress
      LSR     A
      ROL     Player1JoypadUnk			  ; @TODO These	seem to	never be read, and even	then are using a
						  ; second bit from JOY1/JOY2 ... Was this reading from
						  ; the	expansion port???
      LDA     JOY2
      LSR     A
      ROL     Player2JoypadPress
      LSR     A
      ROL     Player2JoypadUnk
      DEX
      BNE     ReadJoypadLoop

      RTS

; End of function ReadJoypads

; =============== S U B R O U T I N E =======================================

sub_BANKF_F6A1:
      LDA     byte_RAM_535
      ASL     A
      TAY
      LDA     unk_RAM_51D,Y
      STA     CurrentLevel
      INY
      LDA     unk_RAM_51D,Y
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     CurrentLevelArea
      LDA     unk_RAM_51D,Y
      AND     #$F
      STA     CurrentLevelPage
      RTS

; End of function sub_BANKF_F6A1

; =============== S U B R O U T I N E =======================================

; @TODO	Handle music changes?
; Seems	to compare against the currently selected music
; and check if a Starman is still active ...

sub_BANKF_F6C0:
      LDA     byte_RAM_544
      CMP     byte_RAM_545
      BEQ     locret_BANKF_F6D9

      TAX
      STX     byte_RAM_545
      LDA     StarInvincibilityTimer
      CMP     #8
      BCS     locret_BANKF_F6D9

      LDA     LevelMusicIndexes,X
      STA     Music1Queue

locret_BANKF_F6D9:
      RTS

; End of function sub_BANKF_F6C0

; =============== S U B R O U T I N E =======================================

sub_BANKF_F6DA:
      LDA     #0
      STA     byte_RAM_4AE
      STA     byte_RAM_4AF
      STA     SubspaceTimer
      STA     byte_RAM_4B3
      LDX     #8

loc_BANKF_F6EA:
      LDA     EnemyState,X
      BEQ     loc_BANKF_F6FE

      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANKF_F6FB

      LDA     ObjectType,X
      CMP     #Enemy_MushroomBlock
      BEQ     loc_BANKF_F6FB

      STA     byte_RAM_4AF

loc_BANKF_F6FB:
      JSR     sub_BANKF_F704

loc_BANKF_F6FE:
      DEX
      BPL     loc_BANKF_F6EA

      LDX     byte_RAM_12
      RTS

; End of function sub_BANKF_F6DA

; =============== S U B R O U T I N E =======================================

sub_BANKF_F704:
      LDY     unk_RAM_441,X
      BMI     loc_BANKF_F70F

      LDA     (byte_RAM_CC),Y
      AND     #$7F
      STA     (byte_RAM_CC),Y

loc_BANKF_F70F:
      LDA     #EnemyState_0
      STA     EnemyState,X
      RTS

; End of function sub_BANKF_F704

; =============== S U B R O U T I N E =======================================

KillPlayer:
      LDA     #PlayerState_Dying		  ; Mark player	as dead
      STA     PlayerState
      LDA     #0				  ; Clear some variables
      STA     PlayerHealth
      STA     CrouchJumpTimer
      STA     StarInvincibilityTimer
      LDA     #SpriteAnimation_Dead		  ; Set	player animation to dead?
      STA     PlayerAnimationFrame
      LDA     HoldingItem
      BEQ     loc_BANKF_F749

      DEC     HoldingItem			  ; Probably something to throw	away
						  ; a held item	on death
      LDY     byte_RAM_42D
      STA     EnemyArray_42F,Y
      LSR     A
      STA     ObjectBeingCarriedTimer,Y
      STA     ObjectXAccel,Y
      LDA     #$E0
      STX     word_RAM_C+1
      LDX     EnemyState,Y
      CPX     #EnemyState_7
      BEQ     loc_BANKF_F747

      STA     ObjectYAccel,Y

loc_BANKF_F747:
      LDX     word_RAM_C+1

loc_BANKF_F749:
      LDA     #Music2_DeathJingle		  ; Set	music to death jingle
      STA     MusicQueue2
      LDA     #DPCM_PlayerDeath			  ; BUG: Setting DPCM at the same time as music
						  ; causes DPCM	to not play
      STA     DPCMQueue
      RTS

; End of function KillPlayer

; =============== S U B R O U T I N E =======================================

; Something to do with loading levels here

GetLevelPointers:
      LDY     CurrentLevel
      LDA     LevelAreaStartIndexes,Y
      CLC
      ADC     CurrentLevelArea
      TAY					  ; Y now contains the current area or something
      LDA     LevelDataPointersLo,Y
      STA     byte_RAM_5			  ; $0005/$0006	are pointers to	the level data
      LDA     LevelDataPointersHi,Y
      STA     byte_RAM_6
      LDX     #$FF				  ; Set	to load	level data into	$7800 in RAM
      LDA     #$78
      STA     byte_RAM_2
      LDY     #0
      STY     byte_RAM_1

CopyLevelDataToMemory:
      LDA     (byte_RAM_5),Y
      STA     (byte_RAM_1),Y
      INY
      DEX
      BNE     CopyLevelDataToMemory

      STA     (byte_RAM_1),Y

; End of function GetLevelPointers

; =============== S U B R O U T I N E =======================================

GetEnemyPointers:
      LDY     CurrentLevel
      LDA     EnemyPointersByLevel_HiHi,Y
      STA     byte_RAM_1
      LDA     EnemyPointersByLevel_HiLo,Y
      STA     byte_RAM_0
      LDA     EnemyPointersByLevel_LoHi,Y
      STA     byte_RAM_3
      LDA     EnemyPointersByLevel_LoLo,Y
      STA     byte_RAM_2
      LDA     InSubspaceOrJar			  ; Are	we in a	jar?
      CMP     #1
      BNE     loc_BANKF_F7A0			  ; No,	load the area as usual

      LDY     #4				  ; Yes; jars are always area #$04 for some reason
      JMP     loc_BANKF_F7A3

; ---------------------------------------------------------------------------

loc_BANKF_F7A0:
      LDY     CurrentLevelArea

loc_BANKF_F7A3:
      LDA     (byte_RAM_0),Y
      STA     byte_RAM_1
      LDA     (byte_RAM_2),Y
      STA     byte_RAM_0
      LDX     #$FF
      LDA     #$7B
      STA     byte_RAM_3
      LDY     #0
      STY     byte_RAM_2

CopyEnemyDataToMemory:
      LDA     (byte_RAM_0),Y
      STA     (byte_RAM_2),Y
      INY
      DEX
      BNE     CopyEnemyDataToMemory

      RTS

; End of function GetEnemyPointers

; =============== S U B R O U T I N E =======================================

GetJarPointers:
      LDY     CurrentLevel			  ; Get	the area starting index	for the	current	level
      LDA     LevelAreaStartIndexes,Y
      CLC
      ADC     #4				  ; 4 is always	the jar	sub area
      TAY
      LDA     LevelDataPointersLo,Y
      STA     byte_RAM_5
      LDA     LevelDataPointersHi,Y
      STA     byte_RAM_6
      LDA     #$7A
      STA     byte_RAM_2
      LDY     #0
      STY     byte_RAM_1

CopyJarDataToMemory:
      LDA     (byte_RAM_5),Y
      CMP     #$FF				  ; This one actually terminates on any	$FF read! Welp.
      BEQ     CopyJarDataToMemoryFinished

      STA     (byte_RAM_1),Y
      INY
      JMP     CopyJarDataToMemory

; ---------------------------------------------------------------------------

CopyJarDataToMemoryFinished:
      STA     (byte_RAM_1),Y
      RTS

; End of function GetJarPointers

; ---------------------------------------------------------------------------
TileQuadPointersLo:
      .BYTE <TileQuads1

      .BYTE <TileQuads2
      .BYTE <TileQuads3
      .BYTE <TileQuads4
TileQuadPointersHi:
      .BYTE >TileQuads1

      .BYTE >TileQuads2
      .BYTE >TileQuads3
      .BYTE >TileQuads4
TileQuads1:
      .BYTE $FE,$FE,$FE,$FE
      .BYTE $B4,$B6,$B5,$B7			  ; 4
      .BYTE $B8,$FA,$B9,$FA			  ; 8
      .BYTE $FA,$FA,$B2,$B3			  ; $C
      .BYTE $BE,$BE,$BF,$BF			  ; $10
      .BYTE $BF,$BF,$BF,$BF			  ; $14
      .BYTE $4A,$4A,$4B,$4B			  ; $18
      .BYTE $5E,$5F,$5E,$5F			  ; $1C
      .BYTE $E8,$E8,$A9,$A9			  ; $20
      .BYTE $46,$FC,$46,$FC			  ; $24
      .BYTE $A9,$A9,$A9,$A9			  ; $28
      .BYTE $FC,$FC,$FC,$FC			  ; $2C
      .BYTE $E9,$E9,$A9,$A9			  ; $30
      .BYTE $FC,$48,$FC,$48			  ; $34
      .BYTE $11,$11,$11,$11			  ; $38
      .BYTE $22,$22,$22,$22			  ; $3C
      .BYTE $33,$33,$33,$33			  ; $40
      .BYTE $E8,$EB,$A9,$A9			  ; $44
      .BYTE $74,$76,$75,$77			  ; $48
      .BYTE $98,$9A,$99,$9B			  ; $4C
      .BYTE $9C,$9A,$9D,$9B			  ; $50
      .BYTE $9C,$9E,$9B,$9F			  ; $54
      .BYTE $58,$5A,$59,$5B			  ; $58
      .BYTE $5E,$5F,$5E,$5F			  ; $5C
      .BYTE $8E,$8F,$8F,$8E			  ; $60
      .BYTE $72,$73,$73,$72			  ; $64
      .BYTE $A6,$A6,$A7,$A7			  ; $68
      .BYTE $92,$93,$93,$92			  ; $6C
      .BYTE $74,$76,$75,$77			  ; $70
      .BYTE $70,$72,$71,$73			  ; $74
      .BYTE $71,$73,$71,$73			  ; $78
      .BYTE $24,$26,$25,$27			  ; $7C
      .BYTE $32,$34,$33,$35			  ; $80
      .BYTE $33,$35,$33,$35			  ; $84
      .BYTE $24,$26,$25,$27			  ; $88
TileQuads2:
      .BYTE $FA,$FA,$FA,$FA
      .BYTE $FA,$FA,$FA,$FA			  ; 4
      .BYTE $FA,$FA,$FA,$FA			  ; 8
      .BYTE $FA,$FA,$B0,$B1			  ; $C
      .BYTE $FA,$FA,$B0,$B1			  ; $10
      .BYTE $FA,$FA,$B0,$B1			  ; $14
      .BYTE $FA,$FA,$B0,$B1			  ; $18
      .BYTE $FA,$FA,$B0,$B1			  ; $1C
      .BYTE $FA,$FA,$B0,$B1			  ; $20
      .BYTE $FA,$FA,$B0,$B1			  ; $24
      .BYTE $FA,$FA,$B0,$B1			  ; $28
      .BYTE $FA,$FA,$B0,$B1			  ; $2C
      .BYTE $FA,$FA,$B0,$B1			  ; $30
      .BYTE $FA,$FA,$B0,$B1			  ; $34
      .BYTE $A0,$A2,$A1,$A3			  ; $38
      .BYTE $80,$82,$81,$83			  ; $3C
      .BYTE $F4,$86,$F5,$87			  ; $40
      .BYTE $84,$86,$85,$87			  ; $44
      .BYTE $FC,$FC,$FC,$FC			  ; $48
      .BYTE $AD,$FB,$AC,$AD			  ; $4C
      .BYTE $AC,$AC,$AC,$AC			  ; $50
      .BYTE $FB,$3B,$3B,$AC			  ; $54
      .BYTE $FC,$FC,$FC,$FC			  ; $58
      .BYTE $F4,$86,$F5,$87			  ; $5C
      .BYTE $FB,$49,$49,$FB			  ; $60
      .BYTE $FE,$FE,$FE,$FE			  ; $64
      .BYTE $FE,$FE,$6D,$FE			  ; $68
      .BYTE $3C,$3E,$3D,$3F			  ; $6C
      .BYTE $58,$FD,$59,$5A			  ; $70
      .BYTE $5B,$5A,$FD,$FD			  ; $74
      .BYTE $5B,$5C,$FD,$5D			  ; $78
      .BYTE $FD,$FD,$5B,$5A			  ; $7C
      .BYTE $6C,$FE,$FE,$FE			  ; $80
      .BYTE $FE,$FE,$FE,$FE			  ; $84
      .BYTE $FE,$6E,$FE,$6F			  ; $88
      .BYTE $20,$22,$21,$23			  ; $8C
      .BYTE $6E,$6F,$70,$71			  ; $90
      .BYTE $57,$57,$FB,$FB			  ; $94
      .BYTE $57,$57,$FE,$FE			  ; $98
      .BYTE $D3,$D3,$FB,$FB			  ; $9C
      .BYTE $D2,$D2,$FB,$FB			  ; $A0
      .BYTE $7C,$7E,$7D,$7F			  ; $A4
      .BYTE $CA,$CC,$CB,$CD			  ; $A8
      .BYTE $CA,$CC,$CB,$CD			  ; $AC
      .BYTE $C0,$C2,$C1,$C3			  ; $B0
      .BYTE $2C,$2E,$2D,$2F			  ; $B4
      .BYTE $8E,$8F,$8F,$8E			  ; $B8
      .BYTE $88,$8A,$89,$8B			  ; $BC
      .BYTE $89,$8B,$89,$8B			  ; $C0
      .BYTE $89,$8B,$8C,$8D			  ; $C4
      .BYTE $88,$8A,$8C,$8D			  ; $C8
      .BYTE $88,$8A,$89,$8B			  ; $CC
      .BYTE $88,$8A,$89,$8B			  ; $D0
      .BYTE $6A,$6C,$6B,$6D			  ; $D4
      .BYTE $6C,$6C,$6D,$6D			  ; $D8
      .BYTE $6C,$6E,$6D,$6F			  ; $DC
      .BYTE $6C,$54,$6D,$55			  ; $E0
      .BYTE $32,$34,$33,$35			  ; $E4
      .BYTE $33,$35,$33,$35			  ; $E8
TileQuads3:
      .BYTE $94,$95,$94,$95
      .BYTE $96,$97,$96,$97			  ; 4
      .BYTE $48,$49,$48,$49			  ; 8
      .BYTE $FE,$FE,$FE,$FE			  ; $C
      .BYTE $FB,$32,$32,$33			  ; $10
      .BYTE $33,$33,$33,$33			  ; $14
      .BYTE $FD,$FD,$FD,$FD			  ; $18
      .BYTE $34,$FB,$FD,$34			  ; $1C
      .BYTE $FB,$30,$FB,$FB			  ; $20
      .BYTE $FB,$FB,$31,$FB			  ; $24
      .BYTE $D0,$D0,$D0,$D0			  ; $28
      .BYTE $D1,$D1,$D1,$D1			  ; $2C
      .BYTE $64,$66,$65,$67			  ; $30
      .BYTE $68,$6A,$69,$6B			  ; $34
      .BYTE $FA,$6C,$FA,$6C			  ; $38
      .BYTE $6D,$FA,$6D,$FA			  ; $3C
      .BYTE $92,$93,$93,$92			  ; $40
      .BYTE $AE,$AF,$AE,$AF			  ; $44
      .BYTE $78,$7A,$79,$7B			  ; $48
      .BYTE $A8,$A8,$AF,$AE			  ; $4C
      .BYTE $94,$95,$94,$95			  ; $50
      .BYTE $96,$97,$96,$97			  ; $54
      .BYTE $22,$24,$23,$25			  ; $58
      .BYTE $92,$93,$93,$92			  ; $5C
      .BYTE $50,$51,$50,$51			  ; $60
      .BYTE $AE,$AF,$AE,$AF			  ; $64
      .BYTE $50,$51,$50,$51			  ; $68
      .BYTE $8E,$8F,$8F,$8E			  ; $6C
      .BYTE $72,$73,$73,$72			  ; $70
      .BYTE $50,$52,$51,$53			  ; $74
      .BYTE $FD,$FD,$FD,$FD			  ; $78
      .BYTE $FB,$36,$36,$4F			  ; $7C
      .BYTE $4F,$4E,$4E,$4F			  ; $80
      .BYTE $4E,$4F,$4F,$4E			  ; $84
      .BYTE $92,$93,$93,$92			  ; $88
      .BYTE $8E,$8F,$8F,$8E			  ; $8C
      .BYTE $44,$45,$45,$44			  ; $90
      .BYTE $4F,$37,$4E,$FE			  ; $94
      .BYTE $4F,$3A,$4E,$FE			  ; $98
      .BYTE $4F,$4E,$37,$38			  ; $9C
      .BYTE $4A,$4B,$FE,$FE			  ; $A0
      .BYTE $72,$73,$4A,$4B			  ; $A4
      .BYTE $40,$42,$41,$43			  ; $A8
      .BYTE $41,$43,$41,$43			  ; $AC
TileQuads4:
      .BYTE $40,$42,$41,$43
      .BYTE $40,$42,$41,$43			  ; 4
      .BYTE $BA,$BC,$BB,$BD			  ; 8
      .BYTE $BA,$BC,$90,$91			  ; $C
      .BYTE $FA,$FA,$FA,$FA			  ; $10
      .BYTE $FA,$FA,$FA,$FA			  ; $14
      .BYTE $FD,$FD,$FD,$FD			  ; $18
      .BYTE $61,$63,$61,$63			  ; $1C
      .BYTE $65,$63,$65,$63			  ; $20
      .BYTE $65,$67,$65,$67			  ; $24
      .BYTE $60,$62,$61,$63			  ; $28
      .BYTE $32,$34,$33,$35			  ; $2C
      .BYTE $64,$62,$65,$63			  ; $30
      .BYTE $36,$34,$37,$35			  ; $34
      .BYTE $64,$66,$65,$67			  ; $38
      .BYTE $36,$38,$37,$39			  ; $3C
      .BYTE $68,$62,$61,$63			  ; $40
      .BYTE $64,$69,$65,$67			  ; $44
      .BYTE $46,$62,$61,$63			  ; $48
      .BYTE $64,$47,$65,$67			  ; $4C
      .BYTE $BA,$BC,$BB,$BD			  ; $50
      .BYTE $70,$72,$71,$73			  ; $54
      .BYTE $8E,$8F,$8F,$8E			  ; $58
      .BYTE $72,$73,$73,$72			  ; $5C
      .BYTE $44,$45,$45,$44			  ; $60
byte_BANKF_FA7D:
      .BYTE $22

      .BYTE $D0
      .BYTE 4
      .BYTE $FC
      .BYTE $FC
      .BYTE $AD
      .BYTE $FA
      .BYTE $22
      .BYTE $F0
      .BYTE 4
      .BYTE $FC
      .BYTE $FC
      .BYTE $AC
      .BYTE $AD
      .BYTE $23
      .BYTE $10
      .BYTE 6
      .BYTE $FC
      .BYTE $FC
      .BYTE $AC
      .BYTE $AC
      .BYTE $AD
      .BYTE $FA
      .BYTE $23
      .BYTE $30
      .BYTE 6
      .BYTE $FC
      .BYTE $FC
      .BYTE $AC
      .BYTE $AC
      .BYTE $AC
      .BYTE $AD
      .BYTE 0
byte_BANKF_FA9E:
      .BYTE 0

      .BYTE 7
      .BYTE $E
      .BYTE $17
byte_BANKF_FAA2:
      .BYTE 0

      .BYTE 0
      .BYTE 6
      .BYTE 6
      .BYTE $A
      .BYTE $A
      .BYTE $B
      .BYTE $D
      .BYTE $E
      .BYTE $11
      .BYTE $11
      .BYTE $12
      .BYTE $12
      .BYTE $12
      .BYTE $12
      .BYTE $13
byte_BANKF_FAB2:
      .BYTE 1

      .BYTE 5
      .BYTE 1
      .BYTE 3
      .BYTE 1
      .BYTE 2
      .BYTE 4
      .BYTE 2
      .BYTE 4
      .BYTE 3
      .BYTE 4
      .BYTE 0
      .BYTE 1
      .BYTE 2
      .BYTE 3
      .BYTE 0
BackgroundCHRAnimationSpeedByWorld:
      .BYTE 7, 7, 7, 7, 9,	7, 5
      .BYTE $B

; =============== S U B R O U T I N E =======================================

sub_BANKF_FACA:
      DEC     BackgroundCHR2Timer
      BPL     locret_BANKF_FAFD

      LDX     #7
      LDY     #$F

loc_BANKF_FAD3:
      LDA     byte_RAM_4E7
      CMP     byte_BANKF_FAA2,Y
      BNE     loc_BANKF_FAE3

      LDA     byte_RAM_4E8
      CMP     byte_BANKF_FAB2,Y
      BEQ     loc_BANKF_FAE9

loc_BANKF_FAE3:
      DEY
      BPL     loc_BANKF_FAD3

      LDX     CurrentWorld

loc_BANKF_FAE9:
      LDA     BackgroundCHRAnimationSpeedByWorld,X
      STA     BackgroundCHR2Timer
      LDY     BackgroundCHR2
      INY
      INY
      CPY     #$26
						  ; This is present in the original game.
      BCC     loc_BANKF_FAFA

      LDY     #$18

loc_BANKF_FAFA:
      STY     BackgroundCHR2

locret_BANKF_FAFD:
      RTS

; End of function sub_BANKF_FACA

; ---------------------------------------------------------------------------

loc_BANKF_FAFE:
      LDX     #8				  ; @TODO Something to with drawing certain sprites?

loc_BANKF_FB00:
      LDA     EnemyState,X
      BEQ     loc_BANKF_FB1C

loc_BANKF_FB04:
      DEX
      BPL     loc_BANKF_FB00

      LDY     #0
      LDA     SpriteDMAArea,Y
      CMP     #$F8
      BNE     loc_BANKF_FB17

      LDA     SpriteDMAArea+4,Y
      CMP     #$F8
      BEQ     loc_BANKF_FB19

loc_BANKF_FB17:
      LDY     #$10

loc_BANKF_FB19:
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

loc_BANKF_FB1C:
      TXA
      CLC
      ADC     byte_RAM_400
      TAY
      LDA     byte_BANKF_F4DA,Y
      TAY
      LDA     SpriteDMAArea,Y
      CMP     #$F8
      BNE     loc_BANKF_FB04

      LDA     SpriteDMAArea+4,Y
      CMP     #$F8
      BNE     loc_BANKF_FB04

      BEQ     loc_BANKF_FB19

; ---------------------------------------------------------------------------
IFDEF PRESERVE_UNUSED_SPACE
     ; Unused space in the original
     ; $FB36 - $FDFF
     .pad $FE00, $FF
ENDIF

; [000002CA BYTES: END OF AREA BANKF:FB36. PRESS KEYPAD	"-" TO COLLAPSE]
byte_BANKF_FE00:
      .BYTE $C
						  ; @TODO Sprite CHR banks?
      .BYTE $D
      .BYTE $C
      .BYTE $E
      .BYTE $C
      .BYTE $D
      .BYTE $F
byte_BANKF_FE07:
      .BYTE $10
						  ; @TODO Sprite CHR banks?
      .BYTE $12
      .BYTE $10
      .BYTE $14
      .BYTE $A
      .BYTE $12
      .BYTE $16
byte_BANKF_FE0E:
      .BYTE 0
						  ; @TODO Player size CHR bank?
      .BYTE 4
      .BYTE 2
      .BYTE   6
      .BYTE 3
      .BYTE 7
      .BYTE 1
      .BYTE 5

; =============== S U B R O U T I N E =======================================

sub_BANKF_FE16:
      LDY     #8
      STY     SpriteCHR2
      INY
      STY     SpriteCHR3
      LDY     CurrentWorld
      LDA     byte_BANKF_FE00,Y
      STA     SpriteCHR4
      LDA     byte_BANKF_FE07,Y
      STA     BackgroundCHR1
      LDA     #$18
      STA     BackgroundCHR2

; load current player sprites
loc_BANKF_FE33:
      LDA     CurrentCharacter
      ASL     A
      ORA     PlayerCurrentSize
      TAY
      LDA     byte_BANKF_FE0E,Y
      STA     SpriteCHR1
      RTS

; End of function sub_BANKF_FE16

; =============== S U B R O U T I N E =======================================

LoadTitleScreenCHRBanks:
      LDA     #$28
      STA     BackgroundCHR1
      LDA     #$2A
      STA     BackgroundCHR2
      RTS

; End of function LoadTitleScreenCHRBanks

; =============== S U B R O U T I N E =======================================

LoadCelebrationSceneBackgroundCHR:
      LDA     #$38
      STA     BackgroundCHR1
      LDA     #$3A
      STA     BackgroundCHR2
      RTS

; End of function LoadCelebrationSceneBackgroundCHR

; =============== S U B R O U T I N E =======================================

LoadCharacterSelectCHRBanks:
      LDA     #$30
      STA     SpriteCHR1
      LDA     #$2C
      STA     BackgroundCHR1
      LDA     #$2E
      STA     BackgroundCHR2
      RTS

; End of function LoadCharacterSelectCHRBanks

; ---------------------------------------------------------------------------
TitleCardCHRBanks:
      .BYTE $40, $42, $40, $44, $40, $42, $46     ; =============== S U B R O U T I N E =======================================

ChangeTitleCardCHR:
      LDY     CurrentWorld
      LDA     TitleCardCHRBanks,Y
      STA     BackgroundCHR2
      RTS

; End of function ChangeTitleCardCHR

; =============== S U B R O U T I N E =======================================

LoadBonusChanceCHRBanks:
      LDA     #$34
      STA     BackgroundCHR1
      LDA     #$36
      STA     BackgroundCHR2
      RTS

; End of function LoadBonusChanceCHRBanks

; =============== S U B R O U T I N E =======================================

LoadMarioSleepingCHRBanks:
      LDY     #$48
      STY     SpriteCHR1
      INY
      STY     SpriteCHR2
      LDA     #$50
      STA     BackgroundCHR1
      LDA     #$52
      STA     BackgroundCHR2
      RTS

; End of function LoadMarioSleepingCHRBanks

; ---------------------------------------------------------------------------
IFDEF PRESERVE_UNUSED_SPACE
     ; Unused space in the original
     ; $FE97 - $FF4F
     .pad $FF50, $FF
ENDIF

; [000000B9 BYTES: END OF AREA UNUSED-BANKF:FE97. PRESS	KEYPAD "-" TO COLLAPSE]

; =============== S U B R O U T I N E =======================================

      ;	public RESET
RESET:
      SEI					  ; This code is called	when the NES is	reset.
      CLD
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background0000|PPUCtrl_SpriteSize8x8|PPUCtrl_NMIDisabled
      STA     PPUCTRL
      LDX     #$FF				  ; Reset stack	pointer
      TXS

loc_BANKF_FF5A:
      LDA     PPUSTATUS				  ; Wait for VBlank
      AND     #PPUStatus_VBlankHit
      BEQ     loc_BANKF_FF5A

loc_BANKF_FF61:
      LDA     PPUSTATUS				  ; Wait for a second VBlank
      BPL     loc_BANKF_FF61

      LDA     #0
IFDEF DEBUG
       STA Debug_InMenu
ENDIF
      STA     $A000
      LDA     #$80
      STA     $A001
      JMP     StartGame

; End of function RESET

; =============== S U B R O U T I N E =======================================

sub_BANKF_FF73:
      LDY     #5

loc_BANKF_FF75:
      TYA
      ORA     #$80
      STA     $8000
      LDA     BackgroundCHR1,Y
      STA     $8001
      DEY
      BPL     loc_BANKF_FF75

      RTS

; End of function sub_BANKF_FF73

; =============== S U B R O U T I N E =======================================

ChangeMappedPRGBank:
      STA     MMC3PRGBankTemp			  ; See	below comment.
						  ; Calling this one will save the changed bank
						  ; to RAM, so if something uses the below version
						  ; the	original bank set with this can	be restored.

; End of function ChangeMappedPRGBank

; =============== S U B R O U T I N E =======================================

ChangeMappedPRGBankWithoutSaving:
      ASL     A					  ; Any	call to	this sub switches the lower
						  ; two	banks together.	e.g.:
						  ; LDA	0 JSR Change...	= Bank 0/1
						  ; LDA	1 JSR Change...	= Bank 2/3
						  ; etc.
						  ;
						  ; This version changes the bank numbers without
						  ; saving the change to RAM, so the previous bank
						  ; can	be recalled later (mostly for temporary	switches,
						  ; like music handling	and such)
      PHA
      LDA     #$86
      STA     $8000
      PLA
      STA     $8001				  ; Change first bank
      ORA     #1				  ; Use	the bank right after this one next
      PHA
      LDA     #$87
      STA     $8000
      PLA
      STA     $8001				  ; Change second bank
      RTS

; End of function ChangeMappedPRGBankWithoutSaving

; =============== S U B R O U T I N E =======================================

ChangeNametableMirroring:
      STA     $A000				  ; Writing to $A000 sets mirroring.
						  ; 0 Vertical
						  ; 1 Horizontal
      RTS

; End of function ChangeNametableMirroring

; ---------------------------------------------------------------------------
IFDEF PRESERVE_UNUSED_SPACE
     ; Unused space in the original
     ; $FFA4 - $FFEA
     .pad $FFEB, $FF
ENDIF

; [00000047 BYTES: END OF AREA UNUSED-BANKF:FFA4. PRESS	KEYPAD "-" TO COLLAPSE]
; Technically you can delete the stuff from here to the	vector table
; as well, but because it looks	slightly less like unused space
; it isn't being removed now
UnusedTextZELDA:
      .BYTE 'ZELDA'                     ; Not used; leftover part of FamicomBox cart title?
IRQ:
	    .BYTE $DF
						  ; Note that this is NOT CODE.
						  ; If the NES actually	hits a BRK,
						  ; the	game will probably just	explode.
						  ; If you wanted, you could write
						  ; some sort of crash handler though.
      .BYTE $E6
      .BYTE   0
      .BYTE   0
      .BYTE $38	; 8
      .BYTE   4
      .BYTE   1
      .BYTE   4
      .BYTE   1
      .BYTE $BE
      ;	Ensure our vectors are always here
      .pad $FFFA, $FF
NESVectorTables:
      .WORD NMI			  ; Vectors for	the NES	CPU. These should ALWAYS be at $FFFA!
						  ; Add	a .pad or .base	before here if you change code above.
						  ; NMI	= VBlank, RESET	= ...well, reset.
						  ; IRQ	is not used, but you could if you wanted.
      .WORD RESET
      .WORD IRQ
; end of 'BANKF'
; End