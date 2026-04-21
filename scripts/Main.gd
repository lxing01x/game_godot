extends Node2D

@onready var title_screen: Control = $UI/TitleScreen

func _ready():
	title_screen.visible = true

func _on_start_button_pressed():
	title_screen.visible = false
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
