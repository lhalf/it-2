class_name TrackController extends Node3D

@export var animation: AnimationPlayer
@export var particles: GPUParticles3D
@export var rewind: AudioStreamPlayer3D
@export var tracks: AudioStreamPlayer3D

func _ready() -> void:
	rewind.connect("finished", _play)
	_play()

func on_hit(_point, _normal) -> void:
	animation.stop()
	particles.emitting = false
	tracks.stop()
	tracks.seek(0.0)
	rewind.play()

func _play() -> void:
	tracks.play()
	animation.play("playing")
	particles.emitting = true
