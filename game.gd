extends Node3D

@export var PORT: int = 9999
@export var name_input: LineEdit
@export var ip_input: LineEdit 

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("exit"):
		get_tree().quit()

#TEMP

var mpp = ENetMultiplayerPeer.new()
var upnp

#func _on_debug_pressed():
	#mpp.create_server(PORT)
	#mpp.peer_connected.connect(_add_player)
	#mpp.peer_disconnected.connect(_delete_player)
	#multiplayer.multiplayer_peer = mpp
	#_add_player(1)
	#$Menu.hide()

func _on_debug_pressed():
	upnp = UPNP.new()
	var discover_result = upnp.discover()
	if discover_result != UPNP.UPNP_RESULT_SUCCESS:
		print("no upnp discover results")
		return
	if not upnp.get_gateway() or not upnp.get_gateway().is_valid_gateway():
		print("no valid upnp gateway")
		return
	var map_result_udp = upnp.add_port_mapping(PORT, PORT, "godot_udp", "UDP", 0)
	var map_result_tcp = upnp.add_port_mapping(PORT, PORT, "godot_tcp", "TCP", 0)
	if map_result_udp != UPNP.UPNP_RESULT_SUCCESS:
		print("udp mapping didn't work")
		return
	if map_result_tcp != UPNP.UPNP_RESULT_SUCCESS:
		print("tcp mapping didn't work")
		return
	print("hosting on " + upnp.query_external_address())
	mpp.create_server(PORT)
	mpp.peer_connected.connect(_add_player)
	mpp.peer_disconnected.connect(_delete_player)
	multiplayer.multiplayer_peer = mpp
	_add_player(1)
	$Menu.hide()

func _exit_tree():
	if upnp:
		print("remove upnp mapping")
		upnp.delete_port_mapping(PORT, "UDP")
		upnp.delete_port_mapping(PORT, "TCP")

func _on_join_pressed():
	mpp.create_client(ip_input.text, PORT)
	multiplayer.multiplayer_peer = mpp
	$Menu.hide()

func _add_player(id=1):
	var player = preload("res://player/player.tscn").instantiate()
	player.name = str(id)
	add_child(player)

func _delete_player(id):
	get_node(str(id)).queue_free()
