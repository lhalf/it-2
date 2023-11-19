class_name RotationInput
extends Node

@export var sensitivity: Sensitivity

signal x_rotation_received(rotation: float)

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		x_rotation_received.emit(-event.relative.x * sensitivity.sensitivity)
