extends State

@export
var walk_state: State

func enter() -> void:
	super()
	
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.is_on_floor():
		return walk_state
		
	var movement = Input.get_axis("move_left", "move_right")
	
	parent.move_and_slide()
	return null
