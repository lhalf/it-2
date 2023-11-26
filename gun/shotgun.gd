class_name Shotgun extends Node3D

var camera_ray: RayCast3D

func _ready() -> void:
	if owner is Player:
		camera_ray = owner.camera_ray
