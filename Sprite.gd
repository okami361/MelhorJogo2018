extends Area2D

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
		get_node("../../").segurando = true
		get_node("../../").objeto = self
	
	pass # replace with function body
