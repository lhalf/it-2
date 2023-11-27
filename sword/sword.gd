class_name Sword extends HeldItem

@export var melee_attack: MeleeAttack

func on_left_input(camera_ray) -> int:
	melee_attack.on_left_input()
	return 0
	
func on_right_input(camera_ray) -> int:
	return 150
