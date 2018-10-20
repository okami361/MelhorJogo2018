extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var countLabel = get_node("CountLabel")

func _ready():
	
	
	
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_ScanButton_pressed():
	var windowAvast = get_node("..")
	windowAvast._start_scan()
	
	
	pass # replace with function body
