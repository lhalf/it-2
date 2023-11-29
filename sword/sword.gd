class_name Sword extends HeldItem

@export var melee_attack: MeleeAttack
@export var held_reload: HeldReload
@export var thrust_force: int

func on_left_input(camera_ray_normal: RayCast3D) -> int:
	melee_attack.on_left_input(camera_ray_normal)
	return 0
	
func on_right_input(camera_ray_normal: RayCast3D) -> int:
	if not held_reload.right_loaded:
		return 0
	held_reload.right_loaded = false
	melee_attack.on_right_input(camera_ray_normal)
	held_reload.reload_right()
	return thrust_force
