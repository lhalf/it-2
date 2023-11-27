class_name HeldItem extends Node3D

@export_file("*_object.tscn") var dropped_object_path
var dropped_object: PackedScene

func _ready() -> void:
	dropped_object = load(dropped_object_path)

func drop() -> void:
	var object_to_drop = dropped_object.instantiate()
	object_to_drop.position = get_parent().global_position
	object_to_drop.rotation = get_parent().global_rotation
	object_to_drop.linear_velocity = get_parent().owner.velocity
	get_tree().root.add_child(object_to_drop)

func on_left_input(camera_ray: RayCast3D) -> int:
	return 0

func on_right_input(camera_ray: RayCast3D) -> int:
	return 0
