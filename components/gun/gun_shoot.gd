class_name GunShoot extends Node

@export var shoot_animations: AnimationPlayer
@export var eject_shell: GPUParticles3D
@export var audio: AudioStreamPlayer3D
@export var gun_reload: GunReload

func shoot_right() -> void:
	gun_reload.right_loaded = false
	_play_shoot_audio()
	_eject_shell()
	shoot_animations.play("shoot_right")
	gun_reload.reload_right()

func shoot_left() -> void:
	gun_reload.left_loaded = false
	_play_shoot_audio()
	_eject_shell()
	shoot_animations.play("shoot_left")
	gun_reload.reload_left()

func _play_shoot_audio() -> void:
	audio.seek(0.0)
	audio.play()

func _eject_shell() -> void:
	eject_shell.restart()
	eject_shell.emitting = true
