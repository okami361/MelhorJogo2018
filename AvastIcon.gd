extends Area2D

var sprite
var tex

func _ready():
	tex = preload("res://Images//avastIcone.png")
	sprite = get_node("Sprite")

func _on_Notepad_body_entered(body):
	if Global.IconKeyAvast:
		sprite.set_texture(tex)
		Global.Player.avast = true
		Global.Player.destroy_key("avasticon")