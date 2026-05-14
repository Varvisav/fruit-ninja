extends Node
#@onready var spawn_timer = $Timer

func start_game():
	get_tree().change_scene_to_file("res://src/main.tscn")
	hp=3
	score=0

func quit():
	get_tree().quit()

func restart():
	get_tree().change_scene_to_file("res://src/restart_game.tscn")

var hp: int = 3
var score: int = 0
var best_score: int = 0

func damage(how_many:int = 1):
	hp -=how_many
	if hp <= 0:
		restart()
	
func boom():
	damage(3)

var falling_speed = 310
var spawn_time = 4.5

func up_score():
	score += 10
	if score > best_score:
		best_score=score
	
	if score % 50 == 0:
		falling_speed += 30
	
	if score % 30 == 0:
		spawn_time = max(0.6, spawn_time - 0.2)
		
