class_name PlayerKnockback extends Node

@export var player: CharacterBody3D

func apply(amount: int, direction: Vector3) -> void:
	player.velocity += direction*amount
