extends Node

var objeto = null
var segurando = false
var emCimaLixeira = false

func _ready():
	#Input.set_custom_mouse_cursor(arrow)
    # Changes a specific shape of the cursor (here the IBeam shape)
	#Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
   # Mouse in viewport coordinates
	if (event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and !event.is_pressed()):
		if(objeto != null):
			if(objeto.is_in_group("AvastAttacks") and emCimaLixeira):
				get_node("../WindowAvast")._one_died()
				objeto.queue_free()
			
		objeto = null
		segurando = false
	elif event is InputEventMouseMotion:
		if(segurando):
			objeto.position = event.position
			print(objeto)
			if (objeto.is_in_group("AvastWindow")):
				objeto.position = Vector2(event.position.x, event.position.y +325)
			elif (objeto.is_in_group("SmallPopups")):
				objeto.position = Vector2(event.position.x, event.position.y +135)
			elif (objeto.is_in_group("BigPopups")):
				objeto.position = Vector2(event.position.x, event.position.y +300)
					
	

	
