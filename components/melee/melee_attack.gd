class_name MeleeAttack extends Node3D

@export var animations: AnimationPlayer
@export var left_sound: AudioStreamPlayer3D
@export var right_sound: AudioStreamPlayer3D
@export var hit_area: HitArea

func _enter_tree() -> void:
	animations.connect("animation_finished", func reset_hit_area(_animation): hit_area.monitoring=false)

func on_left_input(_camera_ray: RayCast3D) -> void:
	if left_sound:
		left_sound.play()
	hit_area.monitoring = true
	animations.play("attack_left")

func on_right_input(_camera_ray: RayCast3D) -> void:
	if right_sound:
		right_sound.play()
	hit_area.monitoring = true
	animations.play("attack_right")
