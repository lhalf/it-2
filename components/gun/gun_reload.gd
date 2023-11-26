class_name GunReload extends Node3D

@export var left_animation: AnimationPlayer
@export var right_animation: AnimationPlayer
@export var left_reload_timer: Timer
@export var right_reload_timer: Timer

var right_loaded: bool = true
var left_loaded: bool = true

func _ready() -> void:
	left_reload_timer.connect("timeout", func reload(): left_loaded=true)
	right_reload_timer.connect("timeout", func reload(): right_loaded=true)

func reload_left() -> void:
	left_animation.play("reload_left")
	left_reload_timer.start()

func reload_right() -> void:
	right_animation.play("reload_right")
	right_reload_timer.start()
