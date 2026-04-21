extends Camera2D

@export var target: Node2D
@export var smoothness: float = 5.0
@export var min_position: Vector2 = Vector2(960, 540)
@export var max_position: Vector2 = Vector2(960, 540)

func _physics_process(delta: float):
	if target:
		var target_position: Vector2 = target.global_position
		target_position.x = clamp(target_position.x, min_position.x, max_position.x)
		target_position.y = clamp(target_position.y, min_position.y, max_position.y)
		
		global_position = global_position.lerp(target_position, smoothness * delta)
