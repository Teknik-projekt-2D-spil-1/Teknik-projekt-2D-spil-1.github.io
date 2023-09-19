extends KinematicBody2D

var velocity = Vector2.ZERO

#ganger ikke med velocity med delta, da det allerede er indbygget i funktionen 
func _physics_process(delta):
	velocity.y += 3
	#den linje over svarer til gravity
	
	if Input.action_is_pressed("move_right"):
		velocity.x = 60
	elif Input.action_is_pressed("move_left"):
		velocity.x = -60
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("jump"):
		velocity.y = -150
	#-y svarer til opad
	
	velocity = move_and_slide(velocity)
