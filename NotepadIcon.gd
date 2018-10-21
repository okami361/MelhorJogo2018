extends Area2D

var sprite
var tex

func _ready():
	tex = preload("res://Images//Notepad.png")
	sprite = get_node("Sprite")
	pass

func _on_Notepad_body_entered(body):
	if Global.Player.notepad:
		sprite.set_texture(tex)
		Global.notepad = true
	pass # replace with function body
