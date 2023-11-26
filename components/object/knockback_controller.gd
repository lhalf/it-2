class_name KnockbackController extends Node3D

@export var object: Node3D
@export var amount: float

func on_hit(point: Vector3, normal: Vector3) -> void:
	if object is RigidBody3D:
		object.apply_impulse(normal*amount, point - object.global_position)
