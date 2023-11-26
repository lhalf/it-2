class_name GunInput extends Node

@export var gun_reload: GunReload
@export var gun_shoot: GunShoot
@export var gun: Shotgun

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("shoot_right"):
			if gun_reload.right_loaded:
				gun_reload.right_loaded = false
				gun_shoot.shoot_right()
				gun_reload.reload_right()
				_hit_something()
		if event.is_action_pressed("shoot_left"):
			if gun_reload.left_loaded:
				gun_reload.left_loaded = false
				gun_shoot.shoot_left()
				gun_reload.reload_left()
				_hit_something()

func _hit_something() -> void:
	if not gun.camera_ray.is_colliding():
		return
	
	var collider: Object = gun.camera_ray.get_collider()
	var point: Vector3 = gun.camera_ray.get_collision_point()
	var normal: Vector3 = gun.camera_ray.global_position.direction_to(point)
	
	if collider.has_node("HitController"):
		collider.get_node("HitController").on_hit(point, normal)
