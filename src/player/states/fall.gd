extends State

@export
var walk_state: State
@export
var jump_state: State

func enter() -> void:
	super()
	
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.is_on_floor():
		if Input.is_action_pressed("jump"):
			return jump_state
		return walk_state
		
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	parent.velocity.x = movement
	
	parent.move_and_slide()
	return null
