class_name PlayerInteract extends Node

@export var interact_ray: RayCast3D
@export var hand: Node3D

var highlight_target

func _process(_delta: float) -> void:
	if interact_ray.get_collider() is CanPickUp:
		if !highlight_target:
			highlight_target = interact_ray.get_collider()
			highlight_target.highlight()
	else:
		_clear_highlight_if_valid_target()
	
	if Input.is_action_pressed("interact"):
		_interact_with_object()

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("interact"):
		if _holding_something_to_drop():
			hand.get_child(0).drop()
			hand.remove_child(hand.get_child(0))

func _clear_highlight_if_valid_target() -> void:
	if highlight_target:
		highlight_target.stop_highlight()
		highlight_target = null

func _interact_with_object() -> void:	
	var object = interact_ray.get_collider()
	
	if object is CanPickUp:
		_clear_highlight_if_valid_target()
		hand.add_child(object.pickup().instantiate())
		object.queue_free()

func _holding_something_to_drop() -> bool:
	return hand.get_child_count() != 0 and hand.get_child(0) is CanDrop

