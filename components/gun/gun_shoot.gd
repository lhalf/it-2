class_name GunShoot extends Node3D

@export var shoot_animations: AnimationPlayer
@export var eject_shell: GPUParticles3D
@export var audio: AudioStreamPlayer3D
@export var knockback: GunKnockback

func shoot_right() -> void:
	knockback.apply_to_parent()
	_play_shoot_audio()
	_eject_shell()
	shoot_animations.play("shoot_right")

func shoot_left() -> void:
	knockback.apply_to_parent()
	_play_shoot_audio()
	_eject_shell()
	shoot_animations.play("shoot_left")

func _play_shoot_audio() -> void:
	audio.seek(0.0)
	audio.play()

func _eject_shell() -> void:
	eject_shell.restart()
	eject_shell.emitting = true
