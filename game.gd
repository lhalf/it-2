extends Node3D

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("exit"):
		get_tree().quit()