extends Node

onready var pointerManager = get_node("/root/Leval1/PointerManager")

func _on_Button_pressed():
	self.queue_free()
	get_node("../../").one_dead()


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
		pointerManager.segurando = true
		pointerManager.objeto = self
	pass # replace with function body
