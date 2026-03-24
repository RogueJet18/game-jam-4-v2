extends CharacterBody2D

@export var speed := 50 # how fast it moves
@onready var ray_cast: RayCast2D = $RayCast2D
@onready var enemy_sprite: Sprite2D = $Sprite2D
var direction := -1

func _physics_process(_delta):
	
	# for detect edge walking
	if not ray_cast.is_colliding():
		direction *= -1 # flip direction
		ray_cast.position.x *= -1 # flip raycast2d direction
		enemy_sprite.flip_h = true # flip sprite
	else:
		direction *= 1
		ray_cast.position.x *= 1 # flip raycast2d direction
		enemy_sprite.flip_h = false
	
	# move left/right
	velocity.x = direction * speed
	move_and_slide()
