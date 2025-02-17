class_name topping_manager

extends Node3D

enum toppings {sauce, cheese}
var topping_list = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	render_toppings()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_topping(topping : toppings):
	if not topping_list.has(topping):
		topping_list.append(toppings.keys()[topping])
	render_toppings()

func render_toppings():
	for child : Node3D in get_children():
		child.visible = false
	for topping in topping_list:
		var topping_node : Node3D = get_node_or_null(str(topping))
		if topping_node:
			topping_node.visible = true
