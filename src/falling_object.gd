extends Node2D
class_name FallingObject
@export var cut_scene: PackedScene = preload("res://assets/images/cut.tscn")

@export var objects: Array[PackedScene]
signal damaged
signal sliced
signal boomed

var speed = GameManager.falling_speed
func _process(delta):
	position.y += speed * delta
	

func _ready():
	spawn_object()

var is_bomb = false
func spawn_object():
	var random_fruit = objects.pick_random()
	var new_instance = random_fruit.instantiate()
	add_child(new_instance)
	if random_fruit.resource_path == "res://assets/images/bomb.tscn":
		is_bomb = true
	



func _on_visible_on_screen_notifier_2d_screen_exited():

	if is_bomb:
		sliced.emit()
	else:
		damaged.emit()
	queue_free()

func _on_area_2d_mouse_entered():
	var cut = cut_scene.instantiate()
	cut.global_position=global_position
	
	if is_bomb:
		boomed.emit()
	else:
		get_tree().current_scene.add_child(cut)
		sliced.emit()
	queue_free()
	
