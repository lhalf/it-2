extends RigidBody3D

@export var animation: AnimationPlayer

func _ready():
	animation.play("playing")
