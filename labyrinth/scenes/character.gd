extends Area2D

const MAX_SPEED = 150
const ACCELERATION_RATE = 0.05
const DECELERATION_RATE = -0.01
var speed = 0
var speed_delta = 0
var is_slowing = false

@onready var path_follow: PathFollow2D = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = clamp(speed + speed_delta, 0, MAX_SPEED)
	
	path_follow.progress += delta * speed
	
	if path_follow.progress_ratio == 1:
#		# TODO: level is over!
		pass

func _on_area_entered(area):	
	if area.is_in_group("escalator"):
		z_index += 1
		area.queue_free()
	
	if area.is_in_group("finger"):
		speed_delta = MAX_SPEED * ACCELERATION_RATE

func _on_area_exited(area):
	if area.is_in_group("finger"):
		speed_delta = MAX_SPEED * DECELERATION_RATE
