class_name Player extends CharacterBody2D
##we love export variables, they appear --> in the inspector of the Player node, just above the CharacterBody2D box. :) 
##the jump needs fine tuning somehow
@export var speed = 30.0
@export var jump_speed = 25.0
@export var health = 5

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
		health -= 1
		print("Health now:", health)
