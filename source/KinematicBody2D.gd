extends KinematicBody2D

var velocity = Vector2.ZERO
var jump = -16





#ganger ikke med velocity med delta, da det allerede er indbygget i funktionen 
func _physics_process(_delta):
	velocity.y += 3
	#den linje over svarer til gravity


	if Input.is_action_pressed("ui_right"):
		velocity.x = 60
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -60
	else:
		velocity.x = 0

	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = jump
	#-y svarer til opad
	
	velocity = move_and_slide(velocity)
