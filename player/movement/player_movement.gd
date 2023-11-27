class_name PlayerMovement extends Node

@export var player: CharacterBody3D
@export var movement_values: MovementValues

func _ready() -> void:
	player.motion_mode = CharacterBody3D.MOTION_MODE_GROUNDED

func _process(delta: float) -> void:
	var input = Input.get_vector("left", "right", "forward", "backward")
	var relative_input = Vector2(input.x, input.y).rotated(-player.global_rotation.y)
	if input.length() > 0:
		#player.velocity = lerp(player.velocity, Vector3(relative_input.x, 0, relative_input.y) * movement_values.max_speed, movement_values.acceleration * delta)
		player.velocity.x = lerp(player.velocity.x, relative_input.x * movement_values.max_speed, movement_values.acceleration * delta)
		player.velocity.z = lerp(player.velocity.z, relative_input.y * movement_values.max_speed, movement_values.acceleration * delta)
	else:
		player.velocity.x = lerp(player.velocity.x, 0.0, movement_values.friction * delta)
		player.velocity.z = lerp(player.velocity.z, 0.0, movement_values.friction * delta)

func _physics_process(_delta: float) -> void:
	player.move_and_slide()
