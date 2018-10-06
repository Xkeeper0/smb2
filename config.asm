; To disable these, comment the defining line out.
; (Changing the assignment to 0 won't work.)

; Compatibility with the original.
; This forces use of absolute addressing instead of zero-page
; when Nintendo used it.
; Note that if you use this, you should probably use
; PRESERVE_FREE_SPACE, too.
COMPATIBILITY = 1

; Preserve unused space.
; Empty areas in the ROM will continue to be padded, even if you
; add code around them. (The padding should automatically shrink,
; if needed, hopefully)
; Turning this off will "squish" most banks and move free space
; within them to the end, making it easier to add your own code.
; ...but it might also cause problems if data gets relocated
; when it isn't properly pointed to.
PRESERVE_UNUSED_SPACE = 1

; Include debugging tools
; DEBUG = 1

; Includes controller 2 debug features
; CONTROLLER_2_DEBUG = 1

; Use MMC5 (mapper 5) instead of MMC3 (mapper 4)
; Based on RetroRain's MMC5 patch (https://www.romhacking.net/hacks/2568)
; MMC5 = 1

; Builds a "Revision A" ROM, which fixes the FryGuy softlock bug.
REV_A = 1

; Show all 8 frames of CHR cycling animation
; FIX_CHR_CYCLE = 1

; Fixes the POW falling log glitch
; FIX_POW_LOG_GLITCH = 1

; Fixes vine climbing bug when holding up and down simultaneously
; FIX_CLIMB_ZIP = 1

; Skip unnecessary bonus chance RAM copy
; BONUS_CHANCE_RAM_OPTIMIZATION = 1

; Skips Bonus Chance after the end of a level
; DISABLE_BONUS_CHANCE = 1

; Go to the Charater Select screen after death
; CHARACTER_SELECT_AFTER_DEATH = 1

; Enables prototype samples and/or music
; PROTOTYPE_DPCM_SAMPLES = 1
; PROTOTYPE_MUSIC = 1

; Encode world tileset in unused 3 bits of area header
; AREA_HEADER_TILESET = 1

; Enables additional level engine features
; LEVEL_ENGINE_UPGRADES = 1

; Disables door pointers, so that area pointers are always required
; DISABLE_DOOR_POINTERS = 1

; Enables full-page door/vine searching so that entrances don't need to align
; ROBUST_TRANSITION_SEARCH = 1
