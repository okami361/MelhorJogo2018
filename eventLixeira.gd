extends Area2D

var pointerManager

func _ready():
	pointerManager = get_node("../WindowAvast").get_node("PointerManager")

func _on_Lixeira_mouse_entered():
	pointerManager.emCimaLixeira = true



func _on_Lixeira_mouse_exited():
	pointerManager.emCimaLixeira = false
