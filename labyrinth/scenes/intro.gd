extends Control

@onready var anim = $AnimationPlayer

func _ready():
	# TODO: start random level
	anim.play("fade_in")

func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/levels/level_0001.tscn")
