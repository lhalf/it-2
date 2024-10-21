extends Node

class Weapon:
	var dropped_object: PackedScene
	var held_object: PackedScene
	
	static func from(dropped_object_path: String, held_object_path: String) -> Weapon:
		var weapon := Weapon.new()
		weapon.dropped_object = load(dropped_object_path)
		weapon.held_object = load(held_object_path)
		return weapon

var look_up: Dictionary = {
	"Shotgun": Weapon.from("res://weapons/shotgun/shotgun_object.tscn", "res://weapons/shotgun/shotgun.tscn"),
	"Sword": Weapon.from("res://weapons/sword/sword_object.tscn", "res://weapons/sword/sword.tscn")
}
