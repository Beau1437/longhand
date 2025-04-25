extends State

@onready
var jump_state: State = $"../Jump"
@onready
var fall_state: State = $"../Fall"
@onready
var walk_state: State = $"../Walk" 

func enter() -> void:
	super()
	if Input.get_axis("move_left", "move_right") != 0:
		parent.dir = Input.get_axis("move_left", "move_right")
	parent.velocity.y = 0
	parent.velocity.x += parent.dir * 500
	cooldown()

func process_physics(delta: float) -> State:
	parent.velocity.x -= parent.dir * (gravity * delta)
	#print(parent.velocity.x)
	if (parent.dir > 0 && parent.velocity.x <= 100):
		return walk_state
	elif (parent.dir < 0 && parent.velocity.x >= -100):
		return walk_state
	
	#var movement = Input.get_axis("move_left", "move_right") * move_speed
	#parent.velocity.x = movement
	#if movement != 0:
		#parent.animations.flip_h = movement < 0
	parent.move_and_slide()
	return null

func cooldown() -> void:
	parent.can_grab = false
	get_tree().create_timer(2).timeout.connect(
		func(): 
			parent.can_grab = true)
#func process_input(event: InputEvent) -> State:
	#if Input.is_action_just_released("jump"):
		#parent.velocity.y -= parent.velocity.y / 2
		#parent.velocity.y = 0 #Needs to be more gradual
	#return null
