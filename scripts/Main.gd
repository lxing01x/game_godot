extends Node2D

@onready var title_screen: Control = $UI/TitleScreen

func _ready():
	print("Main scene _ready() called")
	title_screen.visible = true
	print("Title screen is now visible")

func _on_start_button_pressed():
	print("Start button pressed")
	title_screen.visible = false
	
	var level_path: String = "res://scenes/basic_level.tscn"
	print("Attempting to load scene: ", level_path)
	
	if ResourceLoader.exists(level_path):
		print("Scene file exists, attempting to change scene...")
		var result = get_tree().change_scene_to_file(level_path)
		if result == OK:
			print("Scene change successful!")
		else:
			print("Scene change failed with error code: ", result)
			title_screen.visible = true
	else:
		print("ERROR: Scene file does not exist: ", level_path)
		title_screen.visible = true
