extends Area2D

func _on_xNotepad_body_entered(body):
	Global.Player.pickup_key()
	queue_free()

