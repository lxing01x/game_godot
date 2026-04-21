extends CharacterBody2D

@export var speed: float = 300.0
@export var jump_force: float = -400.0
@export var gravity: float = 1800.0

var direction: Vector2 = Vector2.ZERO
var is_grounded: bool = false

func _ready():
	print("Player _ready() called")
	print("Player position: ", position)

func _physics_process(delta: float):
	_get_input()
	_apply_gravity(delta)
	_move_and_slide()
	_update_animation()

func _get_input():
	direction.x = Input.get_axis("move_left", "move_right")
	
	if is_grounded and Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
		is_grounded = false

func _apply_gravity(delta: float):
	if not is_grounded:
		velocity.y += gravity * delta

func _move_and_slide():
	velocity.x = direction.x * speed
	move_and_slide()
	
	is_grounded = is_on_floor()

func _update_animation():
	if direction.x != 0:
		scale.x = sign(direction.x)
