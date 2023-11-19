class_name Rotation
extends Node

@export var player: CharacterBody3D
@export var rotation_input: RotationInput

func _ready() -> void:
	rotation_input.connect("x_rotation_received", _on_x_rotation_received)

func _on_x_rotation_received(rotation: float) -> void:
	player.rotation_degrees.y += rotation
