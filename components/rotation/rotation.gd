class_name Rotation extends Node

@export var player: CharacterBody3D
@export var rotation_input: RotationInputBase

func _ready() -> void:
	rotation_input.connect("x_rotation", _on_x_rotation)

func _on_x_rotation(rotation: float) -> void:
	player.rotation_degrees.y += rotation
