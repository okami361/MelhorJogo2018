extends Node2D

var vel = 1000
var difX
var difY
var segurando = false

onready var pointerManager = get_node("/root/Leval1/PointerManager")

func _process(delta):
	if !segurando:
		self.position = self.position + (Vector2(difX, difY).normalized() * vel * delta)
		
		if(position.x > get_viewport_rect().size.x):
			queue_free()
		if(position.x < 0):
			queue_free()
		if(position.y > get_viewport_rect().size.y):
			queue_free()
		if(position.y < 0):
			queue_free()

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
		var windowAvast = get_node("/root/Leval1/NotepadPos/WindowAvast")
		
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and !event.is_pressed():
		var windowAvast = get_node("/root/Leval1/NotepadPos/WindowAvast")
		_calculate_direction()
		segurando = false


func _on_Area2D_body_entered(body):
	if body.name == "Player" and !segurando:
		body.take_damage(self.position.x, self.position.y)
		queue_free()
	pass # replace with function body
