
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
	  .BYTE	$21,$49,6,$E9,$E5,$DE,$DA,$EC,$DE     ; PLEASE
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

