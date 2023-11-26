class_name MeleeAttack extends Node3D

@export var animations: AnimationPlayer

func attack_left() -> void:
	animations.play("attack_left")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("shoot_left"):
			attack_left()
