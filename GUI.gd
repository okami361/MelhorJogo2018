extends CanvasLayer

func _ready():
	Global.GUI = self

func update_GUI(coins,lives):
	$Banner/HBoxContainer2/VBoxContainer/HBoxContainer/CoinCount.text = str(coins)
	$Banner/HBoxContainer2/VBoxContainer/HBoxContainer/LifeCount.text = str(lives)

func animate_GUI(animation):
	$Banner/AnimationPlayer.play(animation)