extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#get_node("Button").connect("pressed", self, "_on_Button_pressed")
	pass

func _on_Button_pressed():
	self.queue_free()

