extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var tex = preload("res://Images//sair4.png")
	if (Global.turnoffDilma):
		tex = preload("res://Images//sair7.png")
	elif (Global.turnoffAvast):
		tex = preload("res://Images//sair6.png")
	elif (Global.turnoffNotepad):
		tex = preload("res://Images//sair5.png")
	self.texture = 	tex
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
