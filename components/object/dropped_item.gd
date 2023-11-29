class_name DroppedItem extends Node3D

@export var mesh: MeshInstance3D
@export_file("*.tscn") var pickup_object_path
var pickup_object

func _enter_tree() -> void:
	pickup_object = load(pickup_object_path)

func stop_highlight() -> void:
	if mesh.material_overlay is ShaderMaterial:
		mesh.material_overlay.set_shader_parameter("outline_color", Vector4(0,0,0,255))

func highlight() -> void:
	if mesh.material_overlay is ShaderMaterial:
		mesh.material_overlay.set_shader_parameter("outline_color", Vector4(255,255,255,255))

func pickup() -> PackedScene:
	return pickup_object
