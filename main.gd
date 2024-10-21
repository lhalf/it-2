extends Node

var peer := ENetMultiplayerPeer.new()

const PORT: int = 9999

@onready var name_input: LineEdit = %NameInput
@onready var ip_input: LineEdit = %IPInput
@onready var map: Node = %Map
@onready var ui: CanvasLayer = %UI

func _ready() -> void:
	get_tree().paused = true
	multiplayer.server_relay = false

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("exit"):
		get_tree().quit()

func _host() -> void:
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	_start()
	_change_map.call_deferred(load("res://map/map.tscn"))

func _join():
	peer.create_client("localhost", PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.server_disconnected.connect(get_tree().change_scene_to_file.bind("res://main.tscn"))
	_start()

func _start() -> void:
	ui.hide()
	get_tree().paused = false

func _change_map(scene: PackedScene) -> void:
	for child in map.get_children():
		map.remove_child(child)
		child.queue_free()
	map.add_child(scene.instantiate())
