extends Control

@export var shop_manager : shop_manager

@export var ingredientsCam : PhantomCamera3D
@export var prepareCam : PhantomCamera3D
@export var bakeCam : PhantomCamera3D
@export var deliverCam : PhantomCamera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func reset_camera_priorities():
	ingredientsCam.priority = 0
	prepareCam.priority = 0
	bakeCam.priority = 0
	deliverCam.priority = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_ingredients_button_pressed() -> void:
	shop_manager.curr_state = shop_manager.state.ingredients
	ingredientsCam.priority = 1

func _on_prepare_button_pressed() -> void:
	shop_manager.curr_state = shop_manager.state.prepare
	prepareCam.priority = 1

func _on_bake_button_pressed() -> void:
	shop_manager.curr_state = shop_manager.state.bake
	bakeCam.priority = 1

func _on_deliver_button_pressed() -> void:
	shop_manager.curr_state = shop_manager.state.deliver
	deliverCam.priority = 1
