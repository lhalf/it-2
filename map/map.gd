extends Node3D

@onready var players: Node = %Players
@onready var weapons: Node = %Weapons

func _ready() -> void:
	if not multiplayer.is_server():
		return
	
	multiplayer.peer_connected.connect(_add_player)
	multiplayer.peer_disconnected.connect(_del_player)
	
	for id in multiplayer.get_peers():
		_add_player(id)
	
	_add_player(1)

func _add_player(id: int):
	print(str(id) + " joined")
	var player = preload("res://player/player.tscn").instantiate()
	player.player = id
	player.name = str(id)
	player.dropped_weapon.connect(_request_weapon_add)
	players.add_child(player, true)

func _del_player(id: int):
	print(str(id) + " left")
	if not players.has_node(str(id)):
		return
	players.get_node(str(id)).queue_free()

func exit_tree():
	if not multiplayer.is_server():
		return
	multiplayer.peer_connected.disconnect(_add_player)
	multiplayer.peer_disconnected.disconnect(_del_player)

func _request_weapon_add(_name: String, _position: Vector3, _rotation: Vector3, velocity: Vector3) -> void:
	if multiplayer.get_unique_id() != 1:
		_add_weapon.rpc_id(1, _name, _position, _rotation, velocity)
	else:
		_add_weapon(_name, _position, _rotation, velocity)

# anyone can call, but only the server can do - we call this with rpc_id 1
@rpc("any_peer")
func _add_weapon(_name: String, _position: Vector3, _rotation: Vector3, velocity: Vector3) -> void:
	var weapon: DroppedItem = Weapons.look_up.get(_name).dropped_object.instantiate()
	weapon.position = _position
	weapon.rotation = _rotation
	weapon.linear_velocity = velocity
	weapons.add_child(weapon)
