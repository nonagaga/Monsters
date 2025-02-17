extends Node3D

@export var area : Area3D
@export var draggable_area : Area3D

var dragging = false
@onready var initial_position = area.global_position
var last_event_position = Vector3.ZERO
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
				drop_object()
	last_event_position = event_position

func drop_object():
	if area.has_overlapping_areas():
		var pizza_base : Node3D = area.get_overlapping_areas().front()
		for child in pizza_base.get_children():
			if child is topping_manager:
				child.add_topping(area.topping)
				area.queue_free()
	else:
		area.global_position = initial_position

func _physics_process(_delta: float) -> void:
	if dragging:
		var params = PhysicsPointQueryParameters3D.new()
		params.collide_with_areas = true
		params.collide_with_bodies = false
		params.position = last_event_position
		params.collision_mask = 2
		var result = get_world_3d().direct_space_state.intersect_point(params)
		if result.size() > 0:
			area.global_position = last_event_position
			area.global_position.y = initial_position.y
