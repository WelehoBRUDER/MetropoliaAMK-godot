extends PathFollow2D

@export var flight_speed = 100

func _physics_process(delta: float) -> void:
	var oldPos = global_position
	progress += flight_speed * delta
	$Bird.flip_h = global_position.x < oldPos.x
