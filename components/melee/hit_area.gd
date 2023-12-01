class_name HitArea extends Area3D

@export var force: float

func _enter_tree() -> void:
	connect("body_entered", _hit_body_entered)

func _hit_body_entered(body: Node3D) -> void:
	if body.has_node("HitController"):
		body.get_node("HitController").on_hit(Vector3(0,0,0), self.global_position.direction_to(body.global_position), force)
