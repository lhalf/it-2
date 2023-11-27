class_name PlayerJump extends Node

@export var player: CharacterBody3D
@export var movement_values: MovementValues

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta: float) -> void:
	if not player.is_on_floor():
		player.velocity.y -= gravity * delta

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("jump") and player.is_on_floor():
		player.velocity.y += movement_values.jump_velocity
