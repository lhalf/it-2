class_name RotationInput extends RotationInputBase

@export var sensitivity: Sensitivity

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		x_rotation.emit(-event.relative.x * sensitivity.sensitivity)
