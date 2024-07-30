extends PathFollow2D

const MAX_SPEED = 100
const ACCELERATION_RATE = 0.05
const DECELERATION_RATE = -0.01
var speed = 0
var speed_delta = 0
var is_slowing = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = clamp(speed + speed_delta, 0, MAX_SPEED)
	
	# TODO: needs to be normalized by the progress
	#progress_ratio += delta * speed
	progress += delta * speed
	
	if progress_ratio == 1:
#		# TODO: level is over!
		pass

func _on_area_2d_area_entered(area):
	speed_delta = MAX_SPEED * ACCELERATION_RATE

func _on_area_2d_area_exited(area):
	speed_delta = MAX_SPEED * DECELERATION_RATE
