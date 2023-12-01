class_name HitController extends Node3D

@export var controllers: Array[Node]

func on_hit(point: Vector3, normal: Vector3, force: float):
	for controller in controllers:
		if controller.has_method("on_hit"):
			controller.on_hit(point, normal, force)
