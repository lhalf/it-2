extends Interactable

var dropped_gun: PackedScene = load("res://gun/shotgun_object.tscn")

func drop() -> void:
	var gun_to_drop = dropped_gun.instantiate()
	gun_to_drop.global_position = owner.global_position
	gun_to_drop.rotation = owner.global_rotation
	get_tree().root.add_child(gun_to_drop)
