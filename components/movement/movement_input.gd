class_name MovementInput
extends Node

@export var player: CharacterBody3D
@export var movement_values: MovementValues

func _process(delta: float) -> void:
	var input = Input.get_vector("left", "right", "forward", "backward")
	if input.length() > 0:
		player.velocity.x = lerp(player.velocity.x, input.x * movement_values.max_speed, movement_values.acceleration * delta)
		player.velocity.z = lerp(player.velocity.z, input.y * movement_values.max_speed, movement_values.acceleration * delta)
	else:
		player.velocity.x = lerp(player.velocity.x, 0.0, movement_values.friction * delta)
		player.velocity.z = lerp(player.velocity.z, 0.0, movement_values.friction * delta)
