class_name GunKnockback extends Node3D

@export var power: int = 10
@export var gun_tip: Marker3D

func apply_to_parent() -> void:
	var gun = get_parent()
	var hand = gun.get_parent()
	var head = hand.get_parent()
	var player = head.get_parent()
	if player.has_node("PlayerKnockback"):
		player.get_node("PlayerKnockback").apply(power, gun_tip.global_position.direction_to(self.global_position))
