class_name KnockbackController extends Node3D

@export var object: Node3D
@export var multiplier: float = 1

func on_hit(point: Vector3, normal: Vector3, force: float) -> void:
	if object is RigidBody3D:
		object.apply_impulse(normal*force*multiplier, point - object.global_position)
