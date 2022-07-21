extends Spatial

export var Look_sensetivity : float = 15.0
export var Min_look_angle : float = -20.0
export var Max_look_angle : float = 75.0

var Mouse_delta : Vector2 = Vector2()

onready var player = get_parent()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if  event is InputEventMouseMotion:
		Mouse_delta = event.relative

func _process(delta):
	
	var rotation = Vector3(Mouse_delta.y, Mouse_delta.x, 0) * Look_sensetivity * delta

	rotation_degrees.x += rotation.x
	rotation_degrees.x = clamp(rotation_degrees.x, Min_look_angle, Max_look_angle)

	player.rotation_degrees.y -= rotation.y

	Mouse_delta = Vector2()
