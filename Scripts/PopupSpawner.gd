extends Node

# class member variables go here, for example:
# var a = 2
var enabled = false
var spawnDelay = 2
var popup
var smallPopup
var popupContainer
var spawnDelta = 0

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
	if (which == 1):
		p = popup.instance()
	else:
		p = smallPopup.instance()
	
	var x = randi()%1100+300
	var y = randi()%600+300
	p.position = Vector2(x,y)
	popupContainer.add_child(p)


func _process(delta):
	if (enabled):
		spawnDelta += delta
		if (spawnDelta >= spawnDelay):
			spawnDelta  -= spawnDelay
			spawn(2)
