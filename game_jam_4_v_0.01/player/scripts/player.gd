class_name Player extends CharacterBody2D
##we love export variables, they appear --> in the inspector of the Player node, just above the CharacterBody2D box. :) 
##the jump needs fine tuning somehow
@export var speed = 30.0
@export var jump_speed = 25.0

@export var health = 5
@export var can_take_damage := true

var acceleration = 30.0
var jump_acceleration = -25.0
var direction = 0
##no changing constants 
##const SPEED = 100.0
##const JUMP_Velocity = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") ##ignore this, the tut had preset code and ive just copied for now, ill grab a better grav soon

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed * jump_acceleration
	
	direction = Input.get_axis("left","right")
	if direction:
		velocity.x = direction * speed * acceleration
	else:
		velocity.x = move_toward(velocity.x, 0, speed * acceleration)
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		if can_take_damage == true:
			if health > 1:
				health -= 1
				can_take_damage = false
				$health_display.text = "Health: %d/5" % health
				$can_take_damage.start() # start cooldown timer (1 sec)
			else:
				$health_display.text = "Death"
				can_take_damage = false
				## should we lock player movement here since they're dead?
				## also change the animation

func _on_can_take_damage_timeout() -> void: # damage taking cooldown 
	can_take_damage = true
	# cooldown is currently 1 second

func _on_water_hitbox_body_entered(body: Node2D) -> void:
	health = 0
	$health_display.text = "Death"
	# die when you fall off the platform and hit the water at the bottom
	## how do you make it not fall through the water like that??
