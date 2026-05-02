extends Node2D
@onready var spawn_timer = $Timer

var fruits=[
	preload("res://assets/images/grapes.tscn"),
	preload("res://assets/images/banana.tscn"),
	preload("res://assets/images/bomb.tscn"),
	preload("res://assets/images/limon.tscn"),
	preload("res://assets/images/pineapple.tscn"),
	preload("res://assets/images/strawberry.tscn")
]


func spawn_object():#pos):
	var random_fruit = fruits.pick_random()
	#random_fruit.position = pos
	var new_instance = random_fruit.instantiate()
	new_instance.position = global_position
	#get_tree().current_scene.add_child(new_instance)
	#new_instance.position = Vector2(0,1000)
	add_child(new_instance)
	


func _ready():
	spawn_timer.timeout.connect(spawn_object)
