class_name HeldReload extends Node3D

@export var left_animation: AnimationPlayer
@export var right_animation: AnimationPlayer

var right_loaded: bool = true
var left_loaded: bool = true

func _ready() -> void:
	if left_animation:
		left_animation.connect("animation_finished", func reload(_animation): left_loaded=true)
	if right_animation:
		right_animation.connect("animation_finished", func reload(_animation): right_loaded=true)

func reload_left() -> void:
	left_animation.play("reload_left")

func reload_right() -> void:
	right_animation.play("reload_right")
