class_name PlayerRotation extends Node

@export var player: CharacterBody3D
@export var head: Node3D
@export var rotation_values: RotationValues

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		player.rotation_degrees.y += (-event.relative.x * rotation_values.sensitivity)
		head.rotation_degrees.x = clamp(head.rotation_degrees.x + -event.relative.y * rotation_values.sensitivity,
		 -rotation_values.clamp_angle_degrees,
		 rotation_values.clamp_angle_degrees)
