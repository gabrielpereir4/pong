extends ColorRect

var score := [0, 0] 
const PADDLE_SPEED : int = 500
var cpu_paddle_speed = PADDLE_SPEED
var is_multiplayer : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_timer_timeout():
	$Ball.new_ball()


func _on_score_left_body_entered(body):
	score[1] += 1
	$HUD/Player2Score.text = str(score[1])
	$BallTimer.start()

func _on_score_right_body_entered(body):
	score[0] += 1
	$HUD/PlayerScore.text = str(score[0])
	$BallTimer.start()
	
func _input(event):
	if Input.is_action_just_pressed("ui_exit"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
