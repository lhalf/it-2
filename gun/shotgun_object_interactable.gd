extends Interactable

var gun_to_pickup: PackedScene = load("res://gun/shotgun.tscn")

func pickup():
	if gun_to_pickup.can_instantiate():
		return gun_to_pickup.instantiate()
