class_name AIRotation extends Node

@export var npc: CharacterBody3D
@export var vision_area: Area3D

var target: CharacterBody3D = null
var looking: bool = false


func _ready() -> void:
	vision_area.connect("body_entered", seen)
	vision_area.connect("body_exited", unseen)

func seen(body: Node3D) -> void:
	if body is CharacterBody3D:
		target = body
		looking = true

func unseen(body: Node3D) -> void:
	if body is CharacterBody3D:
		target = null
		looking = false

func _physics_process(delta: float) -> void:
	if looking:
		npc.look_at(target.global_position)
