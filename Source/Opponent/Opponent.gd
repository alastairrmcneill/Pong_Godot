extends KinematicBody2D

var speed = 350
var direction = Vector2.ZERO
var ball 

func _ready():
	ball = get_parent().find_node("Ball")
	
func _physics_process(delta):
	direction.y = get_opponent_direction()
	move_and_slide(direction * speed)
	
func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		else:
			return -1
	else: 
		return 0
			
			
	
