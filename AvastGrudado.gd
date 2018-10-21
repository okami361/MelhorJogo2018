extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_TextureButton_button_down():
	var novoAvastAttack = preload("res://avastAttackScene.tscn").instance()
	get_tree().get_root().find_node("NotepadPos", true, false).add_child(novoAvastAttack)
	novoAvastAttack.position = get_node(".").position + get_node("..").position
	novoAvastAttack.segurando = true
	get_node("/root/Leval1/PointerManager").segurando = true
	get_node("/root/Leval1/PointerManager").objeto = novoAvastAttack
	novoAvastAttack._calculate_direction()
	get_node("..").take_damage_off()
	var windowAvast = get_node("/root/Leval1/NotepadPos/WindowAvast")
	windowAvast.wasteTime = 0
	queue_free()
	pass # replace with function body
