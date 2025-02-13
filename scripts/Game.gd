extends ColorRect

var score := [0, 0] 
const PADDLE_SPEED : int = 500
var cpu_paddle_speed = PADDLE_SPEED
var is_multiplayer : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameTimer.start()  # Inicia o Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD/TimerLabel.text = str(round($GameTimer.time_left))

func _on_ball_timer_timeout():
	$Ball.new_ball()
	$GameTimer.paused = false


func _on_score_left_body_entered(body):
	$GameTimer.paused = true
	score[1] += 1
	$HUD/CPUScore.text = str(score[1])
	$BallTimer.start()

func _on_score_right_body_entered(body):
	$GameTimer.paused = true
	score[0] += 1
	$HUD/PlayerScore.text = str(score[0])
	$BallTimer.start()

func show_result(): 
	var winner = get_winner()
	$HUD/ResultLabel.text = "END! " + winner
	$HUD/ResultLabel.visible = true 
	await get_tree().create_timer(3.0).timeout  # Aguarda 3 segundos antes de reiniciar
	get_tree().paused = false
	rematch()

func get_winner():
	var score_esquerda = score[0]
	var score_direita = score[1]

	if score_esquerda > score_direita:
		return "Player 1 wins!"
	elif score_direita > score_esquerda:
		return str(Gameconfig.player_2_name) + " wins!"
	else:
		return "Tie!"

func _input(event):
	if Input.is_action_just_pressed("ui_exit"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_game_timer_timeout():
	get_tree().paused = true
	show_result()

func rematch():
	get_tree().reload_current_scene()
