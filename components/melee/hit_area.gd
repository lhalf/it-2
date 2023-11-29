class_name HitArea extends Area3D

func _enter_tree() -> void:
	connect("body_entered", _hit_body_entered)

func _hit_body_entered(body: Node3D) -> void:
	if body.has_node("HitController"):
		body.get_node("HitController").on_hit(Vector3(0,0,0), Vector3(0,1,0))
