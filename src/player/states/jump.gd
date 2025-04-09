extends State

@export
var walk_state: State

@export
var jump_force: float = 900

func enter() -> void:
	super()
	parent.velocity.y = -jump_force
	
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return walk_state
		
	var movement = Input.get_axis("move_left", "move_right")
	
	parent.move_and_slide()
	return null
