class_name GunShoot extends Node

@export var animation_player: AnimationPlayer

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("shoot_right"):
			animation_player.play("shoot_right")
		if event.is_action_pressed("shoot_left"):
			animation_player.play("shoot_left")

func _process(_delta: float) -> void:
	if (Input.is_action_pressed("shoot_right") and Input.is_action_just_pressed("shoot_left")) or (Input.is_action_just_pressed("shoot_right") and Input.is_action_pressed("shoot_left")):
		print("double")
