extends CharacterBody2D

@export var speed: float = 300.0

func _ready():
	print("BasicPlayer _ready() called")
	print("Player position: ", position)

func _physics_process(delta):
	var direction: float = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	move_and_slide()
	
	if direction != 0:
		scale.x = sign(direction)
