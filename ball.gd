extends RigidBody2D

const BOUNCE_SCALE_FACTOR = 1.3

var max_speed_value = 1200
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	randomize()
	max_speed_value = get_viewport_rect().size.x
	connect("body_enter", self, "_on_body_enter")
	_reset_ball()

func _reset_ball():
	var viewport_size = get_viewport_rect().size
	var position = Vector2(viewport_size.x / 2, viewport_size.y / 2)
	var speed =  Vector2(220, 0).rotated(rand_range(0, 360))
	set_pos(position)
	set_linear_velocity(speed)

func _on_body_enter(body):
	if body.get_name().ends_with("Paddle"):
		_speed_up()
		
	if body.get_name().ends_with("Terminate"):
		_reset_ball()
	
func _speed_up():
	var new_velocity = get_linear_velocity() * BOUNCE_SCALE_FACTOR 
	if new_velocity.length() > max_speed_value:
		new_velocity = new_velocity.normalized() * max_speed_value
		disconnect("body_enter", self, "_on_body_enter")
	set_linear_velocity(new_velocity)	