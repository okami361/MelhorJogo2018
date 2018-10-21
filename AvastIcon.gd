extends Area2D

var sprite
var tex

func _ready():
	tex = preload("res://Images//avastIcone.png")
	sprite = get_node("Sprite")
	pass

func _on_Notepad_body_entered(body):
	if Global.Player.avast:
		sprite.set_texture(tex)
		Global.avast = true
	pass # replace with function body
