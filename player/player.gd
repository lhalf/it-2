extends CharacterBody3D

@export var camera: Camera3D

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

func _ready() -> void:
	camera.current = get_multiplayer_authority() == multiplayer.get_unique_id()
	set_physics_process(get_multiplayer_authority() == multiplayer.get_unique_id())
	set_process(get_multiplayer_authority() == multiplayer.get_unique_id())
	set_process_input(get_multiplayer_authority() == multiplayer.get_unique_id())
