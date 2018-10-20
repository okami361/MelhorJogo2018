extends Node

var objeto 
var segurando

func _ready():
	segurando = false
	#Input.set_custom_mouse_cursor(arrow)
    # Changes a specific shape of the cursor (here the IBeam shape)
	#Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
	
func _input(event):
   # Mouse in viewport coordinates
	if (event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and !event.is_pressed()):
		objeto = null
		segurando = false
	elif event is InputEventMouseMotion:
		if(segurando):
			objeto.position = event.position

	

	
