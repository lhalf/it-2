class_name KnockbackController extends Node3D

@export var object: Node3D

func on_hit(point: Vector3, normal: Vector3) -> void:
	if object is RigidBody3D:
		object.apply_impulse(normal*0.5, point - object.global_position)
