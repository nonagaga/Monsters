extends Area3D

@export var shader : Shader
@export var mesh : MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)
	var shaderMat = ShaderMaterial.new()
	shaderMat.shader = shader
	mesh.material_overlay = shaderMat

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_mouse_entered():
	var shaderMat: ShaderMaterial = mesh.material_overlay
	shaderMat.set_shader_parameter("on", true)

func on_mouse_exited():
	var shaderMat: ShaderMaterial = mesh.material_overlay
	shaderMat.set_shader_parameter("on", false)


func _on_input_event(_camera: Node, _event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	pass # Replace with function body.
