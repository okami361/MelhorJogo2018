extends Node2D


# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var pointerManager = get_node("/root/Leval1/PointerManager")
onready var countLabel = get_node("ScanButton/CountLabel")
onready var avastAttack = preload("res://avastAttackScene.tscn")
export var count = 30

var rateSpawn = 2
var wasteTime = 0
var whereSpawn = 1

var random
var started = false

var finalizeAttack = false

func _start_scan():
	if(!finalizeAttack):
		countLabel.show()
		_update_countText()
		started = true

func _update_countText():
	countLabel.text = "Count Enemys: " + str(count)
		
func _stop_scan():
	started = false	
	
func _one_died():
	count -= 1 
	_update_countText()
	if(count == 0):
		_stop_scan()
		for children in pointerManager.get_children():
			children.queue_free()
		finalizeAttack = true
	
func _process(delta):
	if (started):
		wasteTime += delta
		if (wasteTime >= rateSpawn):
			var newAttack = avastAttack.instance()
			pointerManager.add_child(newAttack)
			
			if(whereSpawn == 1):
				newAttack.position = Vector2(0,  rand_range(0, get_viewport_rect().size.y))
				whereSpawn = 2
			elif(whereSpawn == 2):
				newAttack.position = Vector2(rand_range(0, get_viewport_rect().size.x), 0)
				whereSpawn = 3
			elif(whereSpawn == 3):
				newAttack.position = Vector2(get_viewport_rect().size.x, rand_range(0, get_viewport_rect().size.y))
				whereSpawn = 1
			
			newAttack._calculate_direction()
			
			wasteTime = 0

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
		pointerManager.segurando = true
		pointerManager.objeto = self
