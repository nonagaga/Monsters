extends CharacterBody3D

@export var speed : int= 5
@export var sens : float = 0.01
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var head = $Head
@onready var camera = $Head/Camera3D

@export var bob_freq := 2.0
@export var bob_amp := 0.08
var time := 0.0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x*sens)
		camera.rotate_x(-event.relative.y*sens)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))
	elif event is InputEventKey:
		if event.keycode == KEY_ESCAPE:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var dir = (head.transform.basis*Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if dir:
		velocity.x = dir.x*speed
		velocity.z = dir.z*speed
	else:
		velocity.x = 0
		velocity.z = 0
	
	
	time += delta*velocity.length()*float(is_on_floor())
	camera.transform.origin = headbob()
	
	move_and_slide()

func headbob():
	var pos = Vector3.ZERO
	pos.y = sin(time*bob_freq)*bob_amp
	pos.x = cos(time*bob_freq/2)*bob_amp
	return pos
