extends MeshInstance3D

@export var s_manager : shop_manager
@export var desired_state : shop_manager.state

var last_state = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	s_manager.state_changed.connect(on_state_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func on_state_changed(state):
	if state == desired_state:
		$AnimationPlayer.play("open")
		$Open.play()
	else:
		if last_state == desired_state:
			$AnimationPlayer.play_backwards("open")
			$Close.play()
	last_state = state
