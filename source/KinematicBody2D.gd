extends KinematicBody2D
deez nuts
var max_speed = 3000
var ACCELERATION = 1500
var friction = 1200
var gravity = 2000
var jump_velocity = -800
var axis = Vector2.ZERO

func _physics_process(delta):
	move(delta)

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_velocity

func get_input_axis():
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	return axis.normalized()
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

func move(delta):
	axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		apply_friction(friction * delta)
	
	else:
		apply_movement(axis * ACCELERATION * delta)

	move_and_slide()


func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	
	else:
		velocity = Vector2.ZERO


func apply_movement(ACCELERATION):
	velocity += ACCELERATION
	velocity = velocity.limit_length(max_speed)
