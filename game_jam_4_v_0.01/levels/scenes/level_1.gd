extends Node2D

@export var next_level_path : String
@export var previous_level_path : String

# next level testing (hit "P" key for next level, "O" for previous)
func _process(_delta):
	if Input.is_action_just_pressed("next_level_testing"):
		get_tree().change_scene_to_file(next_level_path)
	if Input.is_action_just_pressed("previous_level_testing"):
		get_tree().change_scene_to_file(previous_level_path)
