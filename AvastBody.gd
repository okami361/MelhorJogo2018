extends RigidBody2D

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		Global.Player.pickup_key("avasticon")
		self.queue_free()
