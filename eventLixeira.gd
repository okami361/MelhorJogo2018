extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var pointerManager = get_node("/root/Leval1/PointerManager")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

>>>>>>> 067d82ae1c266ef783c955ed956ccaec51714138

func _on_Lixeira_mouse_entered():
	pointerManager.emCimaLixeira = true



func _on_Lixeira_mouse_exited():
	pointerManager.emCimaLixeira = false
