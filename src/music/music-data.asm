;
; Music Data
; ==========
;
; Each segment of music is broken down into tracks for individual instruments.
;
; Square 2:
;   $00: End of segment
;   $01-$7D: Note On
;   $7E: Rest
;   $80-$FE: first nybble is the instrument, second nybble is the note length
;            as determined by the note length lookup table. The next byte is
;            expected to be a Note On.
;   $FF: activate bend if used after a Note On
;
; Square 1 is the same as Square 2, except for the following:
;   $00: Activate a ramp effect
;
; Triangle is the same as Square 2, except for the following:
;   $00: Mute output (triangle channel is constant volume otherwise)
;   $80-$FF: second nybble is the note length from the note length lookup table
;
; Noise/DPCM:
;   $00: Restart (used for looping percussion within a segment)
;   $01: Rest
;   $02-$7F: Various note-on values, low bit is ignored
;   $02: Closed Hi-Hat
;   $04: Kick
;   $06: Open Hi-Hat
;   $08: Quiet Hi-Hat
;   $0A: Crash Cymbal
;   $0C: Brushed Snare
;   $0E: Muted Crash
;   $10: Snare
;   $12: Deep Kick
;   $14: High Static
;   $16: Low Static
;   $18: Ride
;   $1A: Closed Hi-Hat
;   $1C: Medium Static
;   $1E: Obnoxious Crash
;   $80-$FF: second nybble is the note length from the note length lookup table
;
; DPCM is the same as Noise, except for the following:
;
; The SMB3 disassembly is a good reference, since the format is the same:
; http://sonicepoch.com/sm3mix/disassembly.html#TRACK
;
MusicData:

;
; Ending music
; Segments 3 and 4 share a noise track (set in segment 4)
;
.include "src/music/segments/ending/ending-1.asm"
.include "src/music/segments/ending/ending-3.asm"
.include "src/music/segments/ending/ending-4.asm"
.include "src/music/segments/ending/ending-2.asm"
.include "src/music/segments/ending/ending-5.asm"
.include "src/music/segments/ending/ending-6.asm"

;
; Starman music
;
.include "src/music/segments/star/star.asm"

;
; Underground music
; (including prototype version)
;
IFNDEF PROTOTYPE_MUSIC
	.include "src/music/segments/underground/underground.asm"
ENDIF
IFDEF PROTOTYPE_MUSIC
	.include "src/music/segments/underground/underground-prototype.asm"
ENDIF

;
; Subspace music
; Segments 1 and 2 share the same noise track,
; as do segments 3 and 4 (defined in 2 and 4)
;
.include "src/music/segments/subspace/subspace-1.asm"
.include "src/music/segments/subspace/subspace-2.asm"
.include "src/music/segments/subspace/subspace-3.asm"
.include "src/music/segments/subspace/subspace-4.asm"

;
; Title screen music
;
.include "src/music/segments/title/title-1.asm"
.include "src/music/segments/title/title-2.asm"
.include "src/music/segments/title/title-3.asm"
.include "src/music/segments/title/title-4.asm"

;
; Character Select screen music (1 through 5)
; Segment 1 is in a single group,
; Segments 3-6 are split by channel,
; Segments 3 and 4 share the same triangle and noise channel
; Segments 5 and 6 are just split by channel for some reason
; Segments 7 and 8 are back in single groups like usual
;
.include "src/music/segments/character-select/character-select-1.asm"

.include "src/music/segments/character-select/character-select-2-square2.asm"
.include "src/music/segments/character-select/character-select-3-square2.asm"
.include "src/music/segments/character-select/character-select-4-square2.asm"
.include "src/music/segments/character-select/character-select-2-square1.asm"
.include "src/music/segments/character-select/character-select-3-square1.asm"
.include "src/music/segments/character-select/character-select-4-square1.asm"
.include "src/music/segments/character-select/character-select-2-triangle.asm"
.include "src/music/segments/character-select/character-select-3-4-triangle.asm"
.include "src/music/segments/character-select/character-select-2-noise.asm"
.include "src/music/segments/character-select/character-select-3-4-noise.asm"

.include "src/music/segments/character-select/character-select-5-square2.asm"
.include "src/music/segments/character-select/character-select-6-square2.asm"
.include "src/music/segments/character-select/character-select-5-square1.asm"
.include "src/music/segments/character-select/character-select-6-square1.asm"
.include "src/music/segments/character-select/character-select-5-triangle.asm"
.include "src/music/segments/character-select/character-select-6-triangle.asm"
.include "src/music/segments/character-select/character-select-5-noise.asm"
.include "src/music/segments/character-select/character-select-6-noise.asm"

.include "src/music/segments/character-select/character-select-7.asm"
.include "src/music/segments/character-select/character-select-8.asm"


.include "src/music/segments/overworld/overworld-1.asm"
.include "src/music/segments/overworld/overworld-2.asm"
.include "src/music/segments/overworld/overworld-3-square2.asm"
.include "src/music/segments/overworld/overworld-4-square2.asm"
.include "src/music/segments/overworld/overworld-3-4-noise.asm"
.include "src/music/segments/overworld/overworld-3-square1.asm"
.include "src/music/segments/overworld/overworld-4-square1.asm"
.include "src/music/segments/overworld/overworld-3-triangle.asm"
.include "src/music/segments/overworld/overworld-4-triangle.asm"
.include "src/music/segments/overworld/overworld-5.asm"
.include "src/music/segments/overworld/overworld-6.asm"





MusicDataBoss:
MusicDataBoss_Square2:
	.db $94
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $36
	.db $34
	.db $36
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $3A
	.db $38
	.db $3A
	.db $00
MusicDataBoss_Square1:
	.db $94
	.db $7E
	.db $42
	.db $42
	.db $7E
	.db $42
	.db $42
	.db $7E
	.db $42
	.db $7E
	.db $42
	.db $42
	.db $7E
	.db $42
	.db $42
	.db $7E
	.db $42
	.db $7E
	.db $40
	.db $40
	.db $7E
	.db $40
	.db $40
	.db $7E
	.db $40
	.db $7E
	.db $40
	.db $40
	.db $7E
	.db $40
	.db $40
	.db $7E
	.db $40
	.db $7E
	.db $46
	.db $46
	.db $7E
	.db $46
	.db $46
	.db $7E
	.db $46
	.db $7E
	.db $46
	.db $46
	.db $7E
	.db $46
	.db $46
	.db $7E
	.db $46
	.db $7E
	.db $44
	.db $44
	.db $7E
	.db $44
	.db $44
	.db $7E
	.db $44
	.db $7E
	.db $44
	.db $44
	.db $7E
	.db $44
	.db $44
	.db $7E
	.db $44
MusicDataBoss_Triangle:
	.db $89
	.db $3C
	.db $3C
	.db $88
	.db $3C
	.db $89
	.db $3C
	.db $3C
	.db $88
	.db $3C
	.db $89
	.db $3A
	.db $3A
	.db $88
	.db $3A
	.db $89
	.db $3A
	.db $3A
	.db $88
	.db $3A
	.db $89
	.db $40
	.db $40
	.db $88
	.db $40
	.db $89
	.db $40
	.db $40
	.db $88
	.db $40
	.db $89
	.db $3E
	.db $3E
	.db $88
	.db $3E
	.db $89
	.db $3E
	.db $3E
	.db $88
	.db $3E

MusicDataWart:
MusicDataWart_Square2:
	.db $A9
	.db $56
	.db $54
	.db $A8
	.db $4C
	.db $A9
	.db $54
	.db $52
	.db $A8
	.db $4A
	.db $A9
	.db $52
	.db $50
	.db $A8
	.db $48
	.db $A4
	.db $4E
	.db $AB
	.db $4C
	.db $A4
	.db $7E
	.db $A9
	.db $5A
	.db $58
	.db $A8
	.db $50
	.db $A9
	.db $58
	.db $56
	.db $A8
	.db $4E
	.db $A9
	.db $56
	.db $54
	.db $A8
	.db $4C
	.db $A4
	.db $52
	.db $AB
	.db $50
	.db $A4
	.db $7E
	.db $4E
	.db $4C
	.db $4E
	.db $4C
	.db $4E
	.db $4C
	.db $4E
	.db $4C
	.db $50
	.db $4E
	.db $50
	.db $4E
	.db $50
	.db $4E
	.db $50
	.db $4E
	.db $52
	.db $50
	.db $52
	.db $50
	.db $52
	.db $50
	.db $52
	.db $50
	.db $54
	.db $52
	.db $54
	.db $52
	.db $54
	.db $52
	.db $54
	.db $52
	.db $00
MusicDataWart_Square1:
	.db $A9
	.db $44
	.db $42
	.db $A8
	.db $3A
	.db $A9
	.db $42
	.db $40
	.db $A8
	.db $38
	.db $A9
	.db $40
	.db $3E
	.db $A8
	.db $36
	.db $A4
	.db $3C
	.db $AB
	.db $3A
	.db $A4
	.db $7E
	.db $A9
	.db $48
	.db $46
	.db $A8
	.db $3E
	.db $A9
	.db $46
	.db $44
	.db $A8
	.db $3C
	.db $A9
	.db $44
	.db $42
	.db $A8
	.db $3A
	.db $A4
	.db $42
	.db $AB
	.db $40
	.db $A4
	.db $7E
	.db $A4
	.db $42
	.db $40
	.db $42
	.db $40
	.db $42
	.db $40
	.db $42
	.db $40
	.db $44
	.db $42
	.db $44
	.db $42
	.db $44
	.db $42
	.db $44
	.db $42
	.db $46
	.db $44
	.db $46
	.db $44
	.db $46
	.db $44
	.db $46
	.db $44
	.db $48
	.db $46
	.db $48
	.db $46
	.db $48
	.db $46
	.db $48
	.db $46
MusicDataWart_Triangle:
	.db $84
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $42
	.db $44
	.db $3E
	.db $44
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $40
	.db $42
	.db $3C
	.db $42
	.db $84
	.db $3A
	.db $88
	.db $3A
	.db $3A
	.db $3A
	.db $84
	.db $3A
	.db $3C
	.db $88
	.db $3C
	.db $3C
	.db $3C
	.db $84
	.db $3C
	.db $3E
	.db $88
	.db $3E
	.db $3E
	.db $3E
	.db $84
	.db $3E
	.db $40
	.db $88
	.db $40
	.db $40
	.db $40
	.db $84
	.db $40

MusicDataMushroomBonusChance:
MusicDataMushroomBonusChance_Square2:
	.db $82
	.db $46
	.db $48
	.db $4A
	.db $4C
	.db $7E
	.db $56
	.db $88
	.db $52
	.db $00
MusicDataMushroomBonusChance_Square1:
	.db $82
	.db $3E
	.db $42
	.db $44
	.db $46
	.db $7E
	.db $50
	.db $88
	.db $4C

MusicDataGameOver:
MusicDataGameOver_Square2:
	.db $94
	.db $56
	.db $5A
	.db $60
	.db $3E
	.db $42
	.db $48
	.db $26
	.db $2A
	.db $98
	.db $30
	.db $26
	.db $30
	.db $00
MusicDataGameOver_Square1:
	.db $98
	.db $7E
	.db $94
	.db $30
	.db $98
	.db $7E
	.db $94
	.db $30
	.db $98
	.db $7E
	.db $30
	.db $3A
	.db $38
MusicDataGameOver_Triangle:
	.db $88
	.db $7E
	.db $89
	.db $60
	.db $48
	.db $88
	.db $30
	.db $3E
	.db $30

MusicDataBossBeaten:
MusicDataBossBeaten_Square2:
	.db $94
	.db $42
	.db $48
	.db $4C
	.db $42
	.db $48
	.db $4C
	.db $3E
	.db $42
	.db $50
	.db $3E
	.db $42
	.db $52
	.db $50
	.db $48
	.db $42
	.db $7E
	.db $3A
	.db $42
	.db $48
	.db $50
	.db $4C
	.db $3E
	.db $42
	.db $7E
	.db $30
	.db $7E
	.db $26
	.db $2A
	.db $7E
	.db $26
	.db $20
	.db $7E
	.db $98
	.db $18
	.db $26
	.db $30
	.db $7E
	.db $00
MusicDataBossBeaten_Square1:
	.db $88
	.db $7E
	.db $30
	.db $7E
	.db $30
	.db $7E
	.db $34
	.db $7E
	.db $38
	.db $7E
	.db $42
	.db $7E
	.db $46
	.db $48
	.db $94
	.db $3E
	.db $98
	.db $42
	.db $94
	.db $3E
	.db $98
	.db $38
	.db $30
	.db $7E
	.db $9A
	.db $48
MusicDataBossBeaten_Triangle:
	.db $88
	.db $3A
	.db $52
	.db $3C
	.db $54
	.db $3E
	.db $56
	.db $42
	.db $5A
	.db $4C
	.db $3A
	.db $3E
	.db $4C
	.db $48
	.db $7E
	.db $7E
	.db $7E
	.db $48
	.db $3E
	.db $30
	.db $7E

MusicDataCrystal:
MusicDataCrystal_Square2:
	.db $89
	.db $40
	.db $84
	.db $40
	.db $88
	.db $40
	.db $88
	.db $56
	.db $56
	.db $52
	.db $8B
	.db $50
	.db $00
MusicDataCrystal_Square1:
	.db $89
	.db $36
	.db $84
	.db $36
	.db $88
	.db $36
	.db $88
	.db $44
	.db $88
	.db $44
	.db $88
	.db $40
	.db $8B
	.db $3E
MusicDataCrystal_Triangle:
	.db $89
	.db $40
	.db $84
	.db $40
	.db $88
	.db $40
	.db $88
	.db $4E
	.db $4E
	.db $4A
	.db $8B
	.db $48

MusicDataDeath:
MusicDataDeath_Square2:
	.db $84
	.db $7E
	.db $82
	.db $4E
	.db $7E
	.db $46
	.db $3E
	.db $7E
	.db $3A
	.db $8A
	.db $38
	.db $00
MusicDataDeath_Square1:
	.db $84
	.db $7E
	.db $82
	.db $3E
	.db $7E
	.db $34
	.db $2E
	.db $7E
	.db $2A
	.db $8A
	.db $26
MusicDataDeath_Triangle:
	.db $84
	.db $7E
	.db $88
	.db $46
	.db $3E
	.db $8A
	.db $30
