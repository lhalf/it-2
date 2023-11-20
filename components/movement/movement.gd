class_name Movement extends Node

@export var player: CharacterBody3D

func _ready() -> void:
	player.motion_mode = CharacterBody3D.MOTION_MODE_GROUNDED

func _physics_process(_delta: float) -> void:
	player.move_and_slide()
