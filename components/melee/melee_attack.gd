class_name MeleeAttack extends Node3D

@export var animations: AnimationPlayer

func on_left_input() -> void:
	animations.play("attack_left")
