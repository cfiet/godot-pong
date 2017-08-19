extends Node

const PADDLE_SPEED = 10

var left_paddle
var right_paddle

func _ready():
	set_process(true)
	left_paddle = get_node("leftPaddle")
	right_paddle = get_node("rightPaddle")

func _move_paddle(paddle, y):
	paddle.move(Vector2(0, y))

func _process(delta):
	if Input.is_action_pressed("left_paddle_up"):
		_move_paddle(left_paddle, -PADDLE_SPEED)
	if Input.is_action_pressed("left_paddle_down"):
		_move_paddle(left_paddle, PADDLE_SPEED)
	if Input.is_action_pressed("right_paddle_up"):
		_move_paddle(right_paddle, -PADDLE_SPEED)
	if Input.is_action_pressed("right_paddle_down"):
		_move_paddle(right_paddle, PADDLE_SPEED)