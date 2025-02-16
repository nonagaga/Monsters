extends Node3D

@export var area : Area3D
@export var shader : Shader
@export var mesh : GeometryInstance3D
@export_range(0,5,.1) var lift_height : float = 0.1
@export var does_highlight = true
@onready var default_height = mesh.position.y


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.mouse_entered.connect(on_mouse_entered)
	area.mouse_exited.connect(on_mouse_exited)
	var shaderMat = ShaderMaterial.new()
	shaderMat.shader = shader
	mesh.material_overlay = shaderMat

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
