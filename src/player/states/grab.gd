extends State

@onready
var jump_state: State = $"../Jump"
@onready
var fall_state: State = $"../Fall"
@onready
var walk_state: State = $"../Walk" 
@onready
var dir : float
var grabzo = false

func enter() -> void:
	super()
	if Input.get_axis("move_left", "move_right") != 0:
		dir = Input.get_axis("move_left", "move_right")
	print(dir)
	parent.velocity.y = 0
	parent.velocity.x += dir * 500
	#grabzo = true

func process_physics(delta: float) -> State:
	parent.velocity.x -= dir * (gravity * delta)
	#print(parent.velocity.x)
	if (dir > 0 && parent.velocity.x <= 100):
		return walk_state
	elif (dir < 0 && parent.velocity.x >= -100):
		return walk_state
	
	#var movement = Input.get_axis("move_left", "move_right") * move_speed
	#parent.velocity.x = movement
	#if movement != 0:
		#parent.animations.flip_h = movement < 0
	parent.move_and_slide()
	return null
	
#func process_input(event: InputEvent) -> State:
	#if Input.is_action_just_released("jump"):
		#parent.velocity.y -= parent.velocity.y / 2
		#parent.velocity.y = 0 #Needs to be more gradual
	#return null
func grabbing() -> bool:
	return grabzo
