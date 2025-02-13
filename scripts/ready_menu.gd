extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mp_button_pressed():
	Gameconfig.is_multiplayer = true
	Gameconfig.player_2_name = "Player 2"
	get_tree().change_scene_to_file("res://scenes/Game.tscn")


func _on_sp_button_pressed():
	Gameconfig.is_multiplayer = false
	Gameconfig.player_2_name = "CPU"
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
	
func _input(event):
	if Input.is_action_just_pressed("ui_exit"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
