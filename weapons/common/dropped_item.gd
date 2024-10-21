class_name DroppedItem extends RigidBody3D

@export var mesh: MeshInstance3D

func stop_highlight() -> void:
	if mesh.material_overlay is ShaderMaterial:
		mesh.material_overlay.set_shader_parameter("outline_color", Vector4(0,0,0,255))

func highlight() -> void:
	if mesh.material_overlay is ShaderMaterial:
		mesh.material_overlay.set_shader_parameter("outline_color", Vector4(255,255,255,255))

func pickup() -> PackedScene:
	# bit noddy, we should know the class of the Weapon
	print(self.name)
	return Weapons.look_up.get(self.name.rstrip("0123456789")).held_object

# any body can free a dropped item, do it locally too
@rpc("any_peer", "call_local")
func rpc_queue_free() -> void:
	queue_free()
