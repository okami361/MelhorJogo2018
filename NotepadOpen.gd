extends Node2D

var letters = []
var blink
var LetterPlatform = preload("res://LetterPlatform.tscn")
var Blink = preload("res://Blink.tscn")

var textEnabled = false

func _ready():
	$TextEdit.connect("cursor_changed", self, "on_cursor_changed")
	$TextEdit.connect("text_changed", self, "on_text_changed")
	_blink_instace()
	blink.position = Vector2(20,70)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		print("ui_accept")
		$TextEdit.grab_focus()
		$TextEdit.set_text("")
	if $TextEdit.cursor_get_line() >= 10:
		$TextEdit.cursor_set_line(10)

func _blink_instace():
	pass
	blink = Blink.instance()
	add_child(blink)

func on_cursor_changed():
	print("",$TextEdit.cursor_get_column())
	print("",$TextEdit.cursor_get_line())
	blink.position = Vector2($TextEdit.cursor_get_column() * 20 + 8, $TextEdit.cursor_get_line() * 55 + 80)
	if $TextEdit.cursor_get_column() >= 53:
		if  $TextEdit.cursor_get_line() <= 9:
			$TextEdit.insert_text_at_cursor("\n")
		$TextEdit.cursor_set_column(0)
		$TextEdit.cursor_set_line($TextEdit.cursor_get_line() + 1)

func on_text_changed():
	#print("Pressed ", $TextEdit.text)
	for letter in letters:
		letter.queue_free()
	letters = []
	var start = Vector2(20,80)
	for character in $TextEdit.text:
		#blink.queue_free()
		if start.y <= 650:
			if character == " ":
				start += Vector2(20,0)
				#_blink_instace()
				#blink.position = Vector2(start.x+22,start.y)
				continue
			if character == "\n":
				start = Vector2(20,start.y + 55)
				#_blink_instace()
				#blink.position = Vector2(22,start.y)
				continue
						
			if start.x == 1120:
				start = Vector2(20,start.y + 55)
				
			var new_letter = LetterPlatform.instance()
			#_blink_instace()
			new_letter.init(character)
			new_letter.position = start
			#blink.position = Vector2(start.x+22,start.y)
			start += Vector2(20,0)
			letters.push_back(new_letter)
			add_child(new_letter)

func _on_Button_button_down():
	queue_free()
	print("passou")

func _on_InsideNotepad_button_down(event):
	print("nos")
	if (event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
    and event.is_pressed()):
		print("nos")
