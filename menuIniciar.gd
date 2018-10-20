extends Node2D

var pressionado=false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass



func _on_btnAreaDeTrabalho_pressed():
	print("botao area de trabalho")
	get_node("..").find_node("AnimationPlayer").stop(false)
	pressionado = false
	get_node(".").apply_scale(Vector2(1,0))	
	pass # replace with function body


func _on_btnMenuIniciar_pressed():
	print("botao menu iniciar")
	if not pressionado :
		get_node("..").find_node("AnimationPlayer").play("animMenuIniciar")
		pressionado = true
	else :
		get_node("..").find_node("AnimationPlayer").stop(false)
		pressionado = false
		get_node(".").apply_scale(Vector2(1,0))	
	
	pass
