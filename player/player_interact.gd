class_name PlayerInteract extends Node

@export var interact_ray: RayCast3D
@export var hand: Node3D

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("interact"):
		if _holding_something_interactable():
			hand.get_child(0).get_node("Interactable").drop()
			hand.remove_child(hand.get_child(0))
		if interact_ray.is_colliding():
			_interact_with_object()

func _interact_with_object() -> void:	
	var object = interact_ray.get_collider()
	
	if object.has_node("Interactable"):
		hand.add_child(object.get_node("Interactable").pickup())

func _holding_something_interactable() -> bool:
	return hand.get_child_count() != 0 \
	and hand.get_child(0).has_node("Interactable")
