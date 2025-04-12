extends State

@export
var jump_state: State
@export
var fall_state: State

func enter() -> void:
	super()
	process_input(null)

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("jump") && parent.is_on_floor():
		return jump_state
	if Input.is_action_pressed("move_left"):
		parent.velocity.x = -move_speed
	elif Input.is_action_pressed("move_right"):
		parent.velocity.x =  move_speed
	else:
		parent.velocity.x = 0
	return null

func process_physics(delta: float) -> State:
	if !parent.is_on_floor():
		return fall_state
	parent.move_and_slide()
	return null
	
	# "move_and_slide" already takes delta time into account.
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
