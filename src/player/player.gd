extends CharacterBody2D
class_name Player

@onready
var StateMachine = $StateMachine

var can_grab = true
var dir : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StateMachine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	StateMachine.process_input(event)

func _physics_process(delta: float) -> void:
	StateMachine.process_physics(delta)

func _process(delta: float) -> void:
	StateMachine.process_frame(delta)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
func push_stuff() -> void:
	# after calling move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			print("PUSHING!")
			c.get_collider().apply_central_impulse(-c.get_normal() * 80)
