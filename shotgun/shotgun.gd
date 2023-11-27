class_name Shotgun extends HeldItem

@export var gun_reload: GunReload
@export var gun_shoot: GunShoot
@export var knockback: int

func on_left_input(camera_ray) -> int:
	if not gun_reload.left_loaded:
		return 0
	gun_reload.left_loaded = false
	gun_shoot.shoot_left(camera_ray)
	gun_reload.reload_left()
	return knockback

func on_right_input(camera_ray) -> int:
	if not gun_reload.right_loaded:
		return 0
	gun_reload.right_loaded = false
	gun_shoot.shoot_right(camera_ray)
	gun_reload.reload_right()
	return knockback
