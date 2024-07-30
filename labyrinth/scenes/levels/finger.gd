extends CharacterBody2D

var click_position = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("left_click"):
		click_position = get_global_mouse_position()
		position = click_position
