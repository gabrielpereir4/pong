extends StaticBody2D

@export var is_player = Gameconfig.is_multiplayer  # Define se esta raquete será controlada por IA
var ball_pos : Vector2
var dist : int
var move_by : int
var win_height : int
var p_height : int

func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y

func _process(delta):
	if is_player:
		player_move(delta)
	else:
		ai_move(delta)
	
	# Limitando a posição para dentro da tela
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)

func ai_move(delta):
	# Mover em direção à bola
	ball_pos = $'../Ball'.position
	dist = position.y - ball_pos.y

	if abs(dist) > Gameconfig.cpu_paddle_speed * delta:
		move_by = Gameconfig.cpu_paddle_speed * delta * (dist/abs(dist))
	else:
		move_by = dist

	position.y -= move_by

func player_move(delta):
	if Input.is_action_pressed('ui_up'):
		position.y -= Gameconfig.player_paddle_speed * delta
	if Input.is_action_pressed('ui_down'):
		position.y += Gameconfig.player_paddle_speed * delta
