extends Area2D

var sprite
var tex

func _ready():
	tex = preload("res://Images//Notepad.png")
	sprite = get_node("Sprite")

func _on_Notepad_body_entered(body):
	if Global.IconKeyNotepad:
		sprite.set_texture(tex)
		Global.Player.destroy_key("notepadicon")
