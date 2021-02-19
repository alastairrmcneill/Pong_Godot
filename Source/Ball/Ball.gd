extends KinematicBody2D

var speed = 800 
var direction = Vector2.ZERO
var velocity = Vector2.ZERO

func _ready():
	randomize()
	direction.x = [-1, 1][randi() % 2]
	direction.y = [0, 0][randi() % 2]
	
func _physics_process(delta):
	velocity = direction * speed
	
	var collision_object = move_and_collide(velocity * delta)
	
	if collision_object:
		direction = direction.bounce(collision_object.normal)
		if collision_object.collider.get_class() == "KinematicBody2D":
			randomize()
			var random_dir = [-0.1, -0.05, 0.05, 0.1, 0.15, 0.2][randi() % 6]
			if direction.y > 0:
				direction.y += random_dir
			else:
				direction.y -= random_dir

func stop_ball():
	speed = 0
	
func reset_ball():
	speed = 600
	randomize()
	direction.x = [-1, 1][randi() % 2]
	direction.y = [0.5, 0.5][randi() % 2]

