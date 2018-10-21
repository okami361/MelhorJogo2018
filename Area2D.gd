extends Area2D

var time
var NotePad = preload("res://NotepadOpen.tscn")
var xButton = preload("res://xNotepad.tscn")
var Avast = preload("res://WindowAvast.tscn")

func _ready():
	time = false

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
		if Global.IconKey:
			print("uau")
			print(Global.IconKey)
			Double_Click()

func Double_Click():
	if not time:
		$Timer.start()
		time = true 
		print("click")
	else:
		if get_node("../..").name == "NotepadIcon":
			var _NotePad = NotePad.instance()
			var _xButton = xButton.instance()
			print("doubleclick")
			get_node("/root/Leval1/NotepadPos").add_child(_NotePad)
			get_node("/root/Leval1/NotepadPos").add_child(_xButton)
			Global.IconKey = false
			print(Global.IconKey)
		elif get_node("../..").name == "AvastIcon":
			var _Avast = Avast.instance()
			get_node("/root/Leval1/NotepadPos").add_child(_Avast)
			Global.IconKey = false

func _on_Timer_timeout():
	time = false	
