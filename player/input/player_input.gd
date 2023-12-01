class_name PlayerInput extends Node

@export var camera_ray: RayCast3D
@export var camera_point: Marker3D
@export var holding: Node3D
@export var knockback: PlayerKnockback
@export var tag_animation: AnimationPlayer
@export var tag_area: HitArea
@export var tag_sound: AudioStreamPlayer3D

func _enter_tree() -> void:
	tag_animation.connect("animation_finished", func reset_tag_area(_animation): tag_area.monitoring=false)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_action_pressed("shoot_left"):
		left_input()
	if event is InputEventMouseButton and event.is_action_pressed("shoot_right"):
		right_input()

func left_input() -> void:
	if !_holding_something():
		tag_sound.play()
		tag_area.monitoring=true
		tag_animation.play("tag")
		return
	knockback.apply(holding.get_child(0).on_left_input(camera_ray), camera_ray.global_position.direction_to(camera_point.global_position))

func right_input() -> void:
	if !_holding_something():
		return #do basic hand stuff here
	knockback.apply(holding.get_child(0).on_right_input(camera_ray),  camera_ray.global_position.direction_to(camera_point.global_position))

func _holding_something() -> bool:
	return holding.get_child_count() != 0 and holding.get_child(0) is HeldItem
