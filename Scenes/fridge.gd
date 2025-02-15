extends MeshInstance3D

@export var shop_manager : shop_manager

var last_state = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shop_manager.state_changed.connect(on_state_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_state_changed(state):
	if state == shop_manager.state.ingredients:
		$AnimationPlayer.play("open")
		$Open.play()
	else:
		if last_state == shop_manager.state.ingredients:
			$AnimationPlayer.play_backwards("open")
			$Close.play()
	last_state = state
