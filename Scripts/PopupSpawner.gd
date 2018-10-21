extends Node

var enabled = false
var spawnDelay = 0.3
var popup
var smallPopup
var popupContainer
var spawnDelta = 0

var countPopups = 10

func enable():
	enabled = true

func disable():
	enabled = false

func _ready():
	popup = preload("res://Popup.tscn")
	smallPopup = preload("res://SmallPopup.tscn")
	popupContainer = get_node("PopupContainer")
	enable()
	

func spawn(which):
	var p 
	var x
	var y
	
	if (which == 1):
		p = popup.instance()
	else:
		p = smallPopup.instance()
		
	if(which == 1):
		x = rand_range(0, get_viewport().size.x - 100)
		y = rand_range(get_viewport().size.y + 300, 350)
	elif(which == 2):
		x = rand_range(0, get_viewport().size.x - 100)
		y = rand_range(get_viewport().size.y + 100, 200)
		
	p.position = Vector2(x,y)
		
	popupContainer.add_child(p)

func one_dead():
	if (get_node("PopupContainer").get_child_count() <= 1):
		disable()

func _process(delta):
	if (enabled):
		spawnDelta += delta
		
		if (spawnDelta >= spawnDelay):
			spawnDelta  = 0
			spawn(randi()%2 + 1)
			
			countPopups -= 1
			if (countPopups == 0):
				spawnDelay = 2
				countPopups = 0
		
		
		
		
