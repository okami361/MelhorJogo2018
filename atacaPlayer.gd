extends Node2D

var vel = .7
var difX
var difY

func _ready():
	var player = get_tree().get_root().find_node("Player", true, false)
	difX = player.position.x - self.position.x
	difY = player.position.y - self.position.y
	pass

func _process(delta):
	print("",difX)
	print("",difY)
	self.position = self.position + (Vector2(difX*vel*delta, difY*vel*delta))
	pass
