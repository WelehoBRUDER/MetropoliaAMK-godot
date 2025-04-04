extends Area2D

@export var speed = 150

func _process(delta: float) -> void:
	$NavigationAgent2D.target_position = get_global_mouse_position()
	var direction = $NavigationAgent2D.get_next_path_position() - global_position
	direction = direction.normalized()
	global_position += direction * delta * speed
