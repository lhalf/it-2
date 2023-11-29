class_name GunShoot extends Node3D

@export var shoot_animations: AnimationPlayer
@export var eject_shell: GPUParticles3D
@export var audio: AudioStreamPlayer3D
@export var tip_cast: RayCast3D
@export var shot_range: int

func _set_tip_cast(camera_ray_normal) -> void:
	tip_cast.global_position = camera_ray_normal.global_position
	tip_cast.target_position = camera_ray_normal.target_position * shot_range

func shoot_right(camera_ray_normal: RayCast3D) -> void:
	_set_tip_cast(camera_ray_normal)
	_play_shoot_audio()
	_eject_shell()
	shoot_animations.play("shoot_right")
	_hit_something(tip_cast)

func shoot_left(camera_ray_normal: RayCast3D) -> void:
	_set_tip_cast(camera_ray_normal)
	_play_shoot_audio()
	_eject_shell()
	shoot_animations.play("shoot_left")
	_hit_something(tip_cast)

func _play_shoot_audio() -> void:
	audio.seek(0.0)
	audio.play()

func _eject_shell() -> void:
	eject_shell.restart()
	eject_shell.emitting = true

func _hit_something(input_ray: RayCast3D) -> void:
	if not input_ray.is_colliding():
		return
	
	var collider: Object = input_ray.get_collider()
	var point: Vector3 = input_ray.get_collision_point()
	var normal: Vector3 = input_ray.global_position.direction_to(point)
	
	if collider.has_node("HitController"):
		collider.get_node("HitController").on_hit(point, normal)
