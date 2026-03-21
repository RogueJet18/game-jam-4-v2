extends CharacterBody2D
##no changing constants 
const SPEED = 100.0
const JUMP_Velocity = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") ##ignore this, the tut had preset code and ive just copied for now, ill grab a better grav soon

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity + delta
		
