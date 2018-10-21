extends Area2D

func _on_xNotepad_body_entered(body):
	if (body.name == "Player"):
		Global.Player.pickup_key("xnotepad")
		get_node("..").queue_free()