extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
	#new_game() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_game():
	$Player.start($StartPosition.position)
	
