extends AnimatedSprite

func update_animation(motion):
	if motion.y < 0 and not Global.Player.hurt:
		play("jump")
	elif motion.x > 0 and not Global.Player.hurt:
		play("run")
		flip_h = true
	elif motion.x < 0 and not Global.Player.hurt:
		play("run")
		flip_h = false
	elif not Global.Player.hurt:
		play("idle")
	elif Global.Player.hurt:
		play("hurt")
