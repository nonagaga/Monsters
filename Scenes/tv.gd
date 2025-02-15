extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var spat_mat = StandardMaterial3D.new()
	var texture_to_apply = $SubViewport.get_texture()

	spat_mat.albedo_texture = texture_to_apply
	set_surface_override_material(1, spat_mat)
