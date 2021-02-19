extends Node

var playerScore = 0
var opponentScore = 0

func _ready():
	reset_paddles()
	$Ball.reset_ball()
	$Ball.stop_ball()
	$CountdownTimer.start()

func _on_WallLeft_body_entered(body):
	scored()
	opponentScore += 1

func _on_WallRight_body_entered(body):
	scored()
	playerScore += 1

func _process(delta):
	$PlayerScore.text = str(playerScore)
	$OpponentScore.text = str(opponentScore)


func _on_CountdownTimer_timeout():
	$Ball.reset_ball()


func scored():
	$Ball.position = Vector2(512, 300)
	$Ball.stop_ball()
	$ScoreSound.play()
	$CountdownTimer.start()
	reset_paddles()

func reset_paddles():
	$Player.position.x = 30
	$Player.position.y = 300
	$Opponent.position.x = 1024 - 30
	$Opponent.position.y = 300
