class_name GunShoot extends Node3D

@export var shoot_animations: AnimationPlayer
@export var eject_shell: GPUParticles3D
@export var audio: AudioStreamPlayer3D
@export var shot_range: int
@export var force: float

func _set_shot_range(camera_ray: RayCast3D) -> void:
	camera_ray.target_position.z = shot_range 

func shoot_right(camera_ray: RayCast3D) -> void:
	_set_shot_range(camera_ray)
	_play_shoot_audio()
	_eject_shell()
	shoot_animations.play("shoot_right")
	_hit_something(camera_ray)

func shoot_left(camera_ray: RayCast3D) -> void:
	_set_shot_range(camera_ray)
	_play_shoot_audio()
	_eject_shell()
	shoot_animations.play("shoot_left")
	_hit_something(camera_ray)

func _play_shoot_audio() -> void:
	audio.seek(0.0)
	audio.play()

func _eject_shell() -> void:
	eject_shell.restart()
	eject_shell.emitting = true

func _hit_something(camera_ray: RayCast3D) -> void:
	if not camera_ray.is_colliding():
		return
	
	var collider: Object = camera_ray.get_collider()
	var point: Vector3 = camera_ray.get_collision_point()
	var normal: Vector3 = camera_ray.global_position.direction_to(point)
	
	if collider.has_node("HitController"):
		collider.get_node("HitController").on_hit(point, normal, force)
