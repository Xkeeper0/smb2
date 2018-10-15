; inside CheckCollisionWithPlayer_NotInvincible
IFDEF JUMP_STOMPS
	LDA ObjectType, Y
	CMP #Enemy_ShyguyRed
	BMI CheckCollisionWithPlayer_NoStompEnemy
	CMP #Enemy_Ostro
	BPL CheckCollisionWithPlayer_NoStompEnemy

	LDA byte_RAM_F
	AND #$0B
	BEQ CheckCollisionWithPlayer_StompEnemy
CheckCollisionWithPlayer_NoStompEnemy:
ENDIF

; new subroutine
IFDEF JUMP_STOMPS
CheckCollisionWithPlayer_StompEnemy:
	LDA PlayerYVelocity
	BMI CheckCollisionWithPlayer_ExitStompEnemy

	LDA #EnemyState_Dead
	STA EnemyState, Y

	LDA EnemyCollision, Y
	ORA #CollisionFlags_Damage
	STA EnemyCollision, Y

	; stash Y
	TYA
	PHA

	LDY #$02
	; INY

	LDA JumpHeightStanding, Y
	AND #$7F
	ASL A
	ORA #$80
	STA PlayerYVelocity
	LDA JumpFloatLength
	STA JumpFloatTimer

	; restore Y
	PLA
	TAY

	LDA #SoundEffect1_EnemyHit
	STA SoundEffectQueue1

CheckCollisionWithPlayer_ExitStompEnemy:
	RTS
ENDIF
