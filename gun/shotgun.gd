class_name Shotgun extends CanDrop

var camera_ray: RayCast3D

#maybe change this so player gives gun the ray instead
func _enter_tree() -> void:
	if get_parent().owner is Player:
		camera_ray = get_parent().owner.camera_ray
