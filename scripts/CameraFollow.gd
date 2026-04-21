extends Camera2D

@export var target: Node2D
@export var smoothness: float = 5.0
@export var min_position: Vector2 = Vector2(960, 540)
@export var max_position: Vector2 = Vector2(2880, 540)

func _ready():
	print("CameraFollow _ready() called")
	if not target:
		print("Attempting to find Player node automatically...")
		var player_node = get_parent().get_node_or_null("Player")
		if player_node:
			target = player_node
			print("Player node found automatically: ", target.name)
		else:
			print("WARNING: Player node not found in parent")
	
	if target:
		print("Camera target found: ", target.name)
	else:
		print("WARNING: Camera target not found!")

func _process(delta: float):
	if target and is_instance_valid(target):
		var target_position: Vector2 = target.global_position
		target_position.x = clamp(target_position.x, min_position.x, max_position.x)
		target_position.y = clamp(target_position.y, min_position.y, max_position.y)
		
		global_position = global_position.lerp(target_position, smoothness * delta)
	else:
		print("WARNING: Camera target is invalid or null")
