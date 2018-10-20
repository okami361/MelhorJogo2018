extends Node2D

var vel = .7
var difX
var difY

onready var pointerManager = get_tree().get_root().find_node("PointerManager", true, false)

func _ready():
	_calculate_direction()
	pass

func _process(delta):
	self.position = self.position + (Vector2(difX*vel*delta, difY*vel*delta))
	pass

func _calculate_direction():
	var player = get_tree().get_root().find_node("Player", true, false)
	difX = player.position.x - self.position.x
	difY = player.position.y - self.position.y
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
		pointerManager.segurando = true
		pointerManager.objeto = self
		
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and !event.is_pressed():
		_calculate_direction()
		
	
	pass # replace with function body
