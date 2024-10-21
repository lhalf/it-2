class_name PlayerMovement extends Node

@export var player: CharacterBody3D
@onready var head: Node3D = %Head
@onready var player_input: MultiplayerSynchronizer = %PlayerInput
@export var rotation_values: RotationValues
@export var movement_values: MovementValues

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready() -> void:
	player.motion_mode = CharacterBody3D.MOTION_MODE_GROUNDED

func _process(delta: float) -> void:
	var direction: Vector2 = player_input.direction
	var relative_input = Vector2(direction.x, direction.y).rotated(-player.global_rotation.y)
	if direction.length() > 0:
		player.velocity.x = lerp(player.velocity.x, relative_input.x * movement_values.max_speed, movement_values.acceleration * delta)
		player.velocity.z = lerp(player.velocity.z, relative_input.y * movement_values.max_speed, movement_values.acceleration * delta)
	else:
		if player.is_on_floor():
			player.velocity.x = lerp(player.velocity.x, 0.0, movement_values.friction * delta)
			player.velocity.z = lerp(player.velocity.z, 0.0, movement_values.friction * delta)
		else:
			player.velocity.x = lerp(player.velocity.x, 0.0, movement_values.air_resistance * delta)
			player.velocity.z = lerp(player.velocity.z, 0.0, movement_values.air_resistance * delta)

func _physics_process(delta: float) -> void:
	if player.is_on_floor() and player_input.space_pressed:
		player.velocity.y += movement_values.jump_velocity
	if not player.is_on_floor():
		player.velocity.y -= gravity * delta
	player.move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		player.rotation_degrees.y += (-event.relative.x * rotation_values.sensitivity)
		head.rotation_degrees.x = clamp(head.rotation_degrees.x + -event.relative.y * rotation_values.sensitivity,
		 -rotation_values.clamp_angle_degrees,
		 rotation_values.clamp_angle_degrees)
