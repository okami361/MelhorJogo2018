extends Node2D

var vel = 500
var difX
var difY
var segurando = false

onready var pointerManager = get_node("/root/Leval1/PointerManager")

func _process(delta):
	if !segurando:
		self.position = self.position + (Vector2(difX, difY).normalized() * vel * delta)

func _calculate_direction():
	var player = get_tree().get_root().find_node("Player", true, false)
	difX = player.position.x - self.position.x
	difY = player.position.y - self.position.y

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
		pointerManager.segurando = true
		pointerManager.objeto = self
		segurando = true
		
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and !event.is_pressed():
		_calculate_direction()
		segurando = false
