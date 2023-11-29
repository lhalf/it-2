class_name PlayerInput extends Node

@export var camera_ray_normal: RayCast3D
@export var camera_point: Marker3D
@export var hand: Node3D
@export var knockback: PlayerKnockback

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_action_pressed("shoot_left"):
		left_input()
	if event is InputEventMouseButton and event.is_action_pressed("shoot_right"):
		right_input()

func left_input() -> void:
	if !_holding_something():
		return #do basic hand stuff here
	knockback.apply(hand.get_child(1).on_left_input(camera_ray_normal), camera_ray_normal.global_position.direction_to(camera_point.global_position))

func right_input() -> void:
	if !_holding_something():
		return #do basic hand stuff here
	knockback.apply(hand.get_child(1).on_right_input(camera_ray_normal),  camera_ray_normal.global_position.direction_to(camera_point.global_position))

func _holding_something() -> bool:
	return hand.get_child_count() != 1 and hand.get_child(1) is HeldItem
