extends State

@onready
var fall_state: State = $"../Fall"
@onready
var grab_state: State = $"../Grab"

@export
var jump_force: float = 500

func enter() -> void:
	super()
	parent.velocity.y = -jump_force
	
func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	if Input.is_action_pressed("grab") && parent.can_grab:
		return grab_state
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	parent.velocity.x = movement
	#if movement != 0:
		#parent.animations.flip_h = movement < 0
	parent.move_and_slide()
	return null
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_released("jump"):
		parent.velocity.y -= parent.velocity.y / 2
		#parent.velocity.y = 0 #Needs to be more gradual
	return null
