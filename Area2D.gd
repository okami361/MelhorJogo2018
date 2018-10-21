extends Area2D

var time
var NotePad = preload("res://NotepadOpen.tscn")
var lastClick
var Avast = preload("res://WindowAvast.tscn")

func _ready():
	time = false

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
		if Global.notepad:
			Double_Click("notepad")
		if Global.avast:
			Double_Click("avast")

func Double_Click(who):

	if not time:
		$Timer.start()
		time = true 
		print("click")
	elif who == "notepad":
		var _NotePad = NotePad.instance()
		print("doubleclick")
		get_node("/root/Leval1/NotepadPos").add_child(_NotePad)
		Global.notepad = false
	elif who == "avast":
		var _Avast = Avast.instance()
		get_node("/root/Leval1/NotepadPos").add_child(_Avast)
		Global.avast = false

func _on_Timer_timeout():
	time = false	
