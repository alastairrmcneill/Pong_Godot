extends KinematicBody2D

var speed = 500

func _physics_process(delta):
	var velocity = Vector2.ZERO
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1 
	
	velocity = speed * direction
	move_and_slide(velocity)
	
	 
