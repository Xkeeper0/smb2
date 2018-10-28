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
IFNDEF PROTOTYPE_MUSIC_ENDING
	.include "src/music/segments/ending/ending-5.asm"
	.include "src/music/segments/ending/ending-6.asm"
ELSE
	.include "src/music/segments/ending/ending-5-prototype.asm"
ENDIF

;
; Starman music
;
IFNDEF PROTOTYPE_MUSIC_STARMAN
	.include "src/music/segments/star/star.asm"
ELSE
	.include "src/music/segments/star/star-prototype.asm"
ENDIF

;
; Underground music
; (including prototype version)
;
IFNDEF PROTOTYPE_MUSIC_UNDERGROUND
	.include "src/music/segments/underground/underground.asm"
ELSE
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

;
; Overworld music segments ...
; Segments 1, 2, 5, and 6 are all separate;
; Segments 3 and 4 have separate square2, square1, and triangle tracks,
; but share a noise track
;
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

;
; Boss music segment...
;
.include "src/music/segments/boss/boss.asm"

;
; Wart's final boss music segment
;
.include "src/music/segments/wart/wart.asm"

;
; Various sound effect jingles; not really full songs...
;
.include "src/music/segments/jingles/mushroom-bonus-chance.asm"
.include "src/music/segments/jingles/game-over.asm"
.include "src/music/segments/jingles/boss-beaten.asm"
.include "src/music/segments/jingles/crystal.asm"
.include "src/music/segments/jingles/death.asm"
