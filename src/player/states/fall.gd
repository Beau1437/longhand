extends State

@onready
var walk_state: State = $"../Walk"
@onready
var jump_state: State = $"../Jump"
@onready
var grab_state: State = $"../Grab"

func enter() -> void:
	super()
	
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	if Input.is_action_pressed("grab"):
		return grab_state
	if parent.is_on_floor() && !(grab_state.grabbing()):
		if Input.is_action_pressed("jump"):
			return jump_state
		return walk_state
		
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	parent.velocity.x = movement
	
	parent.move_and_slide()
	return null
