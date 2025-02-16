@tool
extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mat : ShaderMaterial = get_surface_override_material(1)
	var texture_to_apply = $SubViewport.get_texture()
	
	mat.set_shader_parameter("SCREEN_TEXTURE", texture_to_apply)
	set_surface_override_material(1, mat)
