extends TextureButton

onready var countLabel = get_node("CountLabel")

func _on_ScanButton_pressed():
	var windowAvast = get_node("..")
	windowAvast._start_scan()
