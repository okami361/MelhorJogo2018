extends Node2D

var player_words = []
var current_story
var strings  #All the text that's displayed to the player

func _ready():
	set_random_story()
	strings = get_from_json("other_strings.json")
	$Blackboard/TextBox.text = ""
	$Blackboard/StoryText.text =  strings["intro_text"]
	prompt_player()

func set_random_story():
	var stories = get_from_json("stories.json")
	randomize()
	current_story = stories[randi() % stories.size()]

func get_from_json(filename):
	var file = File.new() #the file object
	file.open(filename,File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/TextBox.get_text()
		_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.text = ""
	$Blackboard/StoryText.text = ""
	check_player_word_length()

func is_story_done():
	return player_words.size() == current_story.prompt.size()

func prompt_player():
	var next_prompt = current_story["prompt"][player_words.size()]
	$Blackboard/StoryText.text += (strings["prompt"] % next_prompt)

func check_player_word_length():
	if is_story_done():
		tell_story()
		$Blackboard/TextureButton/ButtonLabel.text = strings["again"]
	else:
		prompt_player()

func tell_story():
	$Blackboard/StoryText.text = current_story.story % player_words
	end_game()

func end_game():
	$Blackboard/TextBox.queue_free()