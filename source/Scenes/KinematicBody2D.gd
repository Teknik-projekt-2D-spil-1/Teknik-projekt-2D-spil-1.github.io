extends KinematicBody2D

var velocity = Vector2.ZERO



#ganger ikke med velocity med delta, da det allerede er indbygget i funktionen 
func _physics_process(_delta):
	velocity.y += 3
#den linje over svarer til gravity
	if Input.is_action_pressed("move_right"):
		velocity.x = 60
	elif Input.is_action_pressed("move_left"):
		velocity.x = -60
	else:
		velocity.x = 0

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -60
	#-y svarer til opad
	
	velocity = move_and_slide(velocity)
