extends Node2D
class_name FallingObject

@export var objects: Array[PackedScene]

func _ready():
	spawn_object()
	

func spawn_object():
	var random_fruit = objects.pick_random()
	var new_instance = random_fruit.instantiate()
	add_child(new_instance)

var speed = 400
func _process(delta):
	position.y += speed * delta
