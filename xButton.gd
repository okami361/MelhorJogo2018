extends Area2D

func _on_xButton_body_entered(body):
	if Global.Player.key:
		$ButtonBlock.queue_free()
		Global.Player.destroy_key("xnotepad")
		$CloseButton.set_disabled(false)