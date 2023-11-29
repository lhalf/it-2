class_name Shotgun extends HeldItem

@export var held_reload: HeldReload
@export var gun_shoot: GunShoot
@export var knockback: int

func on_left_input(camera_ray_normal: RayCast3D) -> int:
	if not held_reload.left_loaded:
		return 0
	held_reload.left_loaded = false
	gun_shoot.shoot_left(camera_ray_normal)
	held_reload.reload_left()
	return knockback

func on_right_input(camera_ray_normal: RayCast3D) -> int:
	if not held_reload.right_loaded:
		return 0
	held_reload.right_loaded = false
	gun_shoot.shoot_right(camera_ray_normal)
	held_reload.reload_right()
	return knockback
