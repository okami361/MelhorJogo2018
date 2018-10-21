extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		Global.Player.avast = true
		self.queue_free()
	pass # replace with function body
