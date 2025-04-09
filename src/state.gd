extends Node
class_name State

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent: Player

func enter() -> void:
	pass

func exit() -> void:
	pass

func _process_input(event: InputEvent) -> State:
	return null

func _process_frame(delta: float) -> State:
	return null

func _process_physics(delta: float) -> State:
	return null
