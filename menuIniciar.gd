extends Node2D

var pressionado=false

func _on_btnMenuIniciar_pressed():
	print("botao menu iniciar")
	if not pressionado :
		get_node("..").find_node("AnimationPlayer").play("animMenuIniciar")
		pressionado = true
	else :
		get_node("..").find_node("AnimationPlayer").stop(false)
		pressionado = false
		get_node(".").position = Vector2(215,1439)	
	
	pass

func _on_BtncCloseIniciar_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
		get_node("..").find_node("AnimationPlayer").stop(false)
		pressionado = false
		get_node(".").position = Vector2(215,1439)
		#using this to make the player moves when clicking outside the notepad
		Global.Player.notmoving = false

