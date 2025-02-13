extends Node

@onready var difficulty_dropdown = $ColorRect/cpu_difficulty_options
@onready var ball_speed_dropdown = $ColorRect/ball_speed_options

# Called when the node enters the scene tree for the first time.
func _ready():
	difficulty_dropdown.selected = Gameconfig.cpu_difficulty_index
	ball_speed_dropdown.selected = Gameconfig.ball_speed_index


func _input(event):
	if Input.is_action_just_pressed("ui_exit"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_cpu_difficulty_options_item_selected(index):
	print("Changing difficulty: " + str(index))
	if index == 0:
		Gameconfig.cpu_paddle_speed = 400
	elif index == 1:
		Gameconfig.cpu_paddle_speed = 500
	elif index == 2:
		Gameconfig.cpu_paddle_speed = 600
	Gameconfig.cpu_difficulty_index = index

func _on_ball_speed_options_item_selected(index):
	print("Changing speed: " + str(index))
	if index == 0:
		Gameconfig.ball_speed = 400
	elif index == 1:
		Gameconfig.ball_speed = 500
	elif index == 2:
		Gameconfig.ball_speed = 600
	elif index == 3:
		Gameconfig.ball_speed = 650
	Gameconfig.ball_speed_index = index
