class_name Player extends CharacterBody3D

# to tell the map to add a weapon
signal dropped_weapon(name: String, position: Vector3, rotation: Vector3, velocity: Vector3)

@onready var camera: Camera3D = %Camera
@onready var player_input: MultiplayerSynchronizer = %PlayerInput

@export var player: int = 1 :
	set(id):
		player = id
		# need $ reference as before ready
		$PlayerInput.set_multiplayer_authority(id)

func _ready() -> void:
	if player == multiplayer.get_unique_id():
		camera.current = true

func _drop_weapon(weapon: HeldItem) -> void:
	dropped_weapon.emit(weapon.name, weapon.global_position, weapon.global_rotation, self.velocity)
