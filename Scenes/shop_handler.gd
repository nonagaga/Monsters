class_name shop_manager
extends Node3D

enum state {ingredients, prepare, bake, deliver}

signal state_changed

@export var curr_state : state = state.deliver :
	set(value):
		if(value == curr_state):
			return
		state_changed.emit(value)
		$GUI.reset_camera_priorities()
		curr_state = value
	get():
		return curr_state

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
