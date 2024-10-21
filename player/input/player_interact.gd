class_name PlayerInteract extends Node

signal dropped_weapon(held_item: HeldItem)

@export var knockback: PlayerKnockback

@onready var interact_ray: RayCast3D = %InteractRay
@onready var holding: Node3D = %Holding
@onready var right_hand_mesh: MeshInstance3D = %RightHandMesh
@onready var camera_ray: RayCast3D = %CameraRay
@onready var camera_point: Marker3D = %CameraPoint
@onready var tag_animation: AnimationPlayer = %TagAnimation
@onready var tag_area: HitArea = %TagArea
@onready var tag_sound: AudioStreamPlayer3D = %Tag

var interacting_with_object

# connect directly?
#func _enter_tree() -> void:
	#tag_animation.connect("animation_finished", func reset_tag_area(_animation): tag_area.monitoring=false)

func _process(_delta: float) -> void:	
	if interact_ray.get_collider() is DroppedItem:
		if not interacting_with_object:
			interacting_with_object = interact_ray.get_collider()
			interacting_with_object.highlight()
		
		if Input.is_action_pressed("interact") and not _holding_something():
			_pickup_object(interact_ray.get_collider())
	else:
		if interacting_with_object:
			interacting_with_object.stop_highlight()
			interacting_with_object = null

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot_left"):
		left_input()
	if event.is_action_pressed("shoot_right"):
		right_input()
	if event.is_action_pressed("interact"):
		if _holding_something():
			right_hand_mesh.show()
			# tell the player to tell the map we dropped a weapon
			dropped_weapon.emit(holding.get_child(0))
			holding.remove_child(holding.get_child(0))

func _pickup_object(object: DroppedItem) -> void:
	# duplicated - consider making object know when to stop highlighting
	if interacting_with_object:
		interacting_with_object.stop_highlight()
		interacting_with_object = null
	holding.add_child(object.pickup().instantiate())
	right_hand_mesh.hide()
	object.rpc_queue_free.rpc()

func _holding_something() -> bool:
	return holding.get_child_count() != 0 and holding.get_child(0) is HeldItem

func left_input() -> void:
	if not _holding_something():
		tag_sound.play()
		tag_area.monitoring=true
		tag_animation.play("tag")
		return
	knockback.apply(holding.get_child(0).on_left_input(camera_ray), camera_ray.global_position.direction_to(camera_point.global_position))

func right_input() -> void:
	if not _holding_something():
		return #do basic hand stuff here
	knockback.apply(holding.get_child(0).on_right_input(camera_ray),  camera_ray.global_position.direction_to(camera_point.global_position))
