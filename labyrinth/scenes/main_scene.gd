extends Node2D

var level_instance: Node2D

func hide_escalators():
	get_tree().call_group("escalator", "hide")

func _ready():
	load_level("0001")
	hide_escalators()
	
func unload_level():
	if (is_instance_valid(level_instance)):
		level_instance.queue_free()
	level_instance = null

func load_level(level_name: String):
	unload_level()
	var level_path = "res://scenes/levels/level_%s.tscn" % level_name
	var scene = load(level_path)
	if (scene):
		level_instance = scene.instantiate()
		add_child(level_instance)
