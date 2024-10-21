extends MultiplayerSynchronizer

@export var left_click: bool = false
@export var right_click: bool = false
@export var space_pressed: bool = false
@export var direction := Vector2()
@export var mouse_movement := Vector2()

func _ready() -> void:
	var is_authority: bool = get_multiplayer_authority() == multiplayer.get_unique_id()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	set_process(is_authority)
	set_process_input(is_authority)

func _process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "forward", "backward")
	left_click = Input.is_action_pressed("shoot_left")
	right_click = Input.is_action_pressed("shoot_right")
	space_pressed = Input.is_action_pressed("jump")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_movement = event.relative
