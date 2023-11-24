class_name BulletTracer extends MeshInstance3D

@export var bullet_ray: RayCast3D

func draw() -> void:
	var draw_mesh = ImmediateMesh.new()
	mesh = draw_mesh
	draw_mesh.surface_begin(Mesh.PRIMITIVE_LINES, material_override)
	draw_mesh.surface_add_vertex(Vector3(0,0,0))
	draw_mesh.surface_add_vertex(bullet_ray.get_collision_point())
	draw_mesh.surface_end()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("shoot_left"):
			draw()
