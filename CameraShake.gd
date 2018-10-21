extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var shake = false
var magnitude
var lifeTime

var wastedTime = 0
var initialPosition

func _ready():
	initialPosition = position
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	pass

func _shake_camera(mag, time):
	magnitude = mag
	lifeTime = time
	shake = true

func _process(delta):
	if (shake):
		wastedTime += delta
			
		position.x = rand_range(-magnitude, magnitude)
		position.y = rand_range(-magnitude, magnitude)
		
		if(wastedTime > lifeTime):
			shake = false
			wastedTime = 0
			position = initialPosition
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
