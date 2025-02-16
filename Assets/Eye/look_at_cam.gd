@tool
extends Node3D

var cam : Camera3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	cam = get_viewport().get_camera_3d()
	look_at(cam.global_position)
