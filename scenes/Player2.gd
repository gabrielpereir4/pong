extends StaticBody2D

var win_height : int
var p_height : int

# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('w'):
		position.y -= get_parent().PADDLE_SPEED * delta
	if Input.is_action_pressed('s'):
		position.y += get_parent().PADDLE_SPEED * delta

	# Limitando a posição para dentro da tela
	# p_height / 2 porque a posição é referente ao centro do objeto.
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
