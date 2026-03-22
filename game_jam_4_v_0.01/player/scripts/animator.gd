extends AnimatedSprite2D
@export var player : Player
@onready var animated_sprite_2d: AnimatedSprite2D = $"."

## animation player, easy to use, no ive not followed the video lmao, im still waiting for idle animation
func _process(_delta: float) -> void:
	if player.direction == 1 or player.direction == -1:
		animated_sprite_2d.play("walk side")
	
	if player.direction == 1:
		animated_sprite_2d.flip_h = false
	elif player.direction == -1:
		animated_sprite_2d.flip_h = true
	
	if not player.is_on_floor():
		animated_sprite_2d.play("jump?")
