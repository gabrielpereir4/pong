extends Node

const VERSION : String = '1.1.0'

var is_multiplayer = false  
var match_time = 60  
var cpu_paddle_speed = 500 # 400 easy 500 normal 600 hard
var cpu_difficulty_index = 1
var player_paddle_speed = 500 # always 500
var ball_speed = 500 # 400 slow 500 regular 600 fast 650 very fast
var ball_speed_index = 1
var player_2_name = "CPU"
