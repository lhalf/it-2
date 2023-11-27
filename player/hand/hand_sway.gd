class_name HandSway extends Node

@export var player: CharacterBody3D
@export var head: Node3D
@export var hand: Node3D
@export var hand_location: Marker3D
@export var gun_sway_values: GunSwayValues

func _ready() -> void:
	hand.top_level = true

func _process(delta: float) -> void:
	hand.global_position = hand_location.global_position
	hand.rotation.z = 0
	hand.rotation.y = lerp_angle(hand.rotation.y, player.rotation.y, gun_sway_values.sway * delta)
	hand.rotation.x = lerp_angle(hand.rotation.x, head.rotation.x, gun_sway_values.sway * delta)
