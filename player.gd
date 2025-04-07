extends CharacterBody2D
class_name Player

@export var speed = 400
var screen_size
var vel1 = velocity.y
const GRAVITY = 200
const WALK_SPEED = 200
const JUMP_HEIGHT = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	vel1 = velocity.y
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("jump") && is_on_floor():
		velocity.y = -JUMP_HEIGHT
	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
	#if velocity.length() > 0:
		#velocity = velocity.normalized() * speed
		#$AnimatedSprite2D.play()
	#else: 
		#$AnimatedSprite2D.stop()
	
	#var collision = move_and_collide(velocity * delta)
	#if collision:
		#print("I collided with ", collision.get_collider().name)
	#position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
	#if velocity.x != 0:
		#$AnimatedSprite2D.animation = "walk"
		#$AnimatedSprite2D.flip_v = false
		
		#$AnimatedSprite2D.flip_h = velocity.x < 0
	#elif velocity.y != 0:
		#$AnimatedSprite2D.animation = "up"
		#$AnimatedSprite2D.flip_v = velocity.y > 0
	
#func _on_body_entered(body: Node2D) -> void:

#func _on_body_entered(body) -> void:
	#hide()
	#hit.emit()
	#$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
