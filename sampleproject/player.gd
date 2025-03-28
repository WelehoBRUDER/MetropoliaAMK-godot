extends CharacterBody2D
@export var movementSpeed = 500
@export var jumpStrength = 400
@export var jumpLength = 20
@export var acceleration = 60
@export var deceleration = 800

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jumpStrength
			
	var direction = Input.get_axis("move-left", "move-right")
	
	if direction:
		velocity.x = move_toward(velocity.x, direction * movementSpeed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0.0, deceleration)
		
	move_and_slide()
	set_animation(direction)
	
func set_animation(dir: float) -> void:
	if dir > 0:
		$PlayerSprite.flip_h = false
	elif dir < 0:
		$PlayerSprite.flip_h = true
		
	if is_on_floor() and velocity.x != 0:
		$PlayerAnimation.play("walk")
	elif not is_on_floor() and velocity.y < 0:
		$PlayerAnimation.play("jump-up")
	elif not is_on_floor() and velocity.y > 0:
		$PlayerAnimation.play("jump-down")
	else:
		$PlayerAnimation.play("idle")
	
