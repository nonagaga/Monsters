@tool
class_name pizza_component
extends Area3D

@export var topping: topping_manager.toppings:
	set(val):
		topping = val
		if Engine.is_editor_hint():
			hide_toppings()
			show_topping(topping)

@export var toppings : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hide_toppings():
	for child in toppings.get_children():
		child.visible = false

func show_topping(topping : topping_manager.toppings):
	var selection = get_topping_node()
	selection.visible = true

func get_topping_node() -> Node3D:
	return toppings.get_node_or_null(topping_manager.toppings.keys()[topping])
