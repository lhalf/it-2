class_name PlayerInteract extends Node

@export var interact_ray: RayCast3D
@export var hand: Node3D
@export var hand_mesh: MeshInstance3D

var highlight_target

func _process(_delta: float) -> void:
	if interact_ray.get_collider() is DroppedItem:
		if !highlight_target:
			highlight_target = interact_ray.get_collider()
			highlight_target.highlight()
	else:
		_clear_highlight_if_valid_target()
	
	if Input.is_action_pressed("interact") and !_holding_something():
		_interact_with_object()

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("interact"):
		if _holding_something():
			hand_mesh.show()
			hand.get_child(1).drop()
			hand.remove_child(hand.get_child(1))

func _clear_highlight_if_valid_target() -> void:
	if highlight_target:
		highlight_target.stop_highlight()
		highlight_target = null

func _interact_with_object() -> void:	
	var object = interact_ray.get_collider()
	
	if object is DroppedItem:
		_clear_highlight_if_valid_target()
		hand.add_child(object.pickup().instantiate())
		hand_mesh.hide()
		object.queue_free()

func _holding_something() -> bool:
	return hand.get_child_count() != 1 and hand.get_child(1) is HeldItem

