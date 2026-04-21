extends Node

var current_level: int = 1
var player_position: Vector2 = Vector2.ZERO
var is_game_paused: bool = false

func _ready():
	print("GameManager initialized")

func change_level(level_num: int):
	current_level = level_num
	get_tree().change_scene_to_file("res://scenes/level_" + str(level_num) + ".tscn")

func toggle_pause():
	is_game_paused = !is_game_paused
	get_tree().paused = is_game_paused
