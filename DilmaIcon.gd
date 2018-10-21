extends Area2D

var sprite
var tex

func _ready():
	tex = preload("res://Images//Dilma.png")
	sprite = get_node("Sprite")

func _on_Notepad_body_entered(body):
	if Global.Player.dilma:
		sprite.set_texture(tex)
		Global.IconKey = true
		Global.Player.destroy_key("dilmaicon")