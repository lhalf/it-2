class_name MeleeAttack extends Node3D

@export var animations: AnimationPlayer
@export var hit_area: HitArea

func _enter_tree() -> void:
	animations.connect("animation_finished", func reset_hit_area(_animation): hit_area.monitoring=false)

func on_left_input(_camera_ray_normal: RayCast3D) -> void:
	hit_area.monitoring = true
	animations.play("attack_left")

func on_right_input(_camera_ray_normal: RayCast3D) -> void:
	hit_area.monitoring = true
	animations.play("attack_right")
