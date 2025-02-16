extends Node3D

@export var area : Area3D

var dragging = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.input_event.connect(on_input_event)

func on_input_event(camera:Node, event:InputEvent, event_position:Vector3, normal:Vector3, shape_idx:int):
	if event is InputEventMouseButton:
		event = event as InputEventMouseButton
		if event.button_index == MOUSE_BUTTON_LEFT:
			if(event.is_pressed()):
				dragging = true
			else:
				dragging = false
	
	if dragging:
		area.global_position = event_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
