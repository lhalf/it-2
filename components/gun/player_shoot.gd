class_name PlayerShoot extends Node

@export var camera_ray: RayCast3D
@export var gun: Node3D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("shoot_right"):
			if gun.gun_shoot.gun_reload.right_loaded:
				gun.gun_shoot.shoot_right()
				_hit_something()
		if event.is_action_pressed("shoot_left"):
			if gun.gun_shoot.gun_reload.left_loaded:
				gun.gun_shoot.shoot_left()
				_hit_something()

func _hit_something() -> void:
	if not camera_ray.is_colliding():
		return
	
	var collider: Object = camera_ray.get_collider()
	var point: Vector3 = camera_ray.get_collision_point()
	var normal: Vector3 = camera_ray.global_position.direction_to(point)
	
	if collider.has_node("HitController"):
		collider.get_node("HitController").on_hit(point, normal)
