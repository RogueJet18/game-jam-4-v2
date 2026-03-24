extends CharacterBody2D

@export var speed := 50 # how fast it moves

var direction := -1

func _physics_process(_delta):
	
	# for detect edge walking
	if $RayCast2D.is_colliding() == false:
		direction *= -1 # flip direction
		$RayCast2D.position.x *= -1 # flip raycast2d direction
		$Sprite2D.flip_h = direction > 0 # flip sprite
	
	# move left/right
	velocity.x = direction * speed
	move_and_slide()
