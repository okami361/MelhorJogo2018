extends Area2D


onready var pointerManager = get_node("/root/Leval1/PointerManager")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Lixeira_mouse_entered():
	pointerManager.emCimaLixeira = true



func _on_Lixeira_mouse_exited():
	pointerManager.emCimaLixeira = false
