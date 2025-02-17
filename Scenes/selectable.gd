extends Node3D

@export var area : Area3D
@export var shader : Shader
@export var mesh : GeometryInstance3D
@export_range(0,5,.1) var lift_height : float = 0.1
@export var does_highlight = true
var default_height : float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if mesh == null:
		var parent = get_parent()
		parent.ready.connect(set_mesh)
	else:
		default_height = mesh.position.y
		area.mouse_entered.connect(on_mouse_entered)
		area.mouse_exited.connect(on_mouse_exited)
		var shaderMat = ShaderMaterial.new()
		shaderMat.shader = shader
		mesh.material_overlay = shaderMat
		default_height = mesh.position.y
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_mouse_entered():
	if does_highlight:
		var shaderMat: ShaderMaterial = mesh.material_overlay
		shaderMat.set_shader_parameter("on", true)
	mesh.position.y = default_height + lift_height

func on_mouse_exited():
	if does_highlight:
		var shaderMat: ShaderMaterial = mesh.material_overlay
		shaderMat.set_shader_parameter("on", false)
	mesh.position.y = default_height


func _on_input_event(_camera: Node, _event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	pass # Replace with function body.

func set_mesh(mesh):
	var parent = get_parent()
	if not parent is pizza_component:
		return
	mesh = parent.get_topping_node().get_child(0)
	area.mouse_entered.connect(on_mouse_entered)
	area.mouse_exited.connect(on_mouse_exited)
	var shaderMat = ShaderMaterial.new()
	shaderMat.shader = shader
	mesh.material_overlay = shaderMat
	default_height = mesh.position.y
