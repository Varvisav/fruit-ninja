extends Node2D
@onready var spawn_timer = $Timer
@export var falling_object_scene: PackedScene = preload("res://src/falling_object.tscn")


func spawn_object():
	var falling_object: FallingObject = falling_object_scene.instantiate()
	falling_object.sliced.connect(GameManager.up_score)
	falling_object.damaged.connect(GameManager.damage)
	falling_object.boomed.connect(GameManager.boom)
	falling_object.position = Vector2(randi_range(25, get_window().size.x - 25), 0)
	add_child(falling_object)
	update_spawn_speed()


func _ready():
	spawn_timer.timeout.connect(spawn_object)
	spawn_timer.wait_time = GameManager.spawn_time

func update_spawn_speed():
	spawn_timer.wait_time = GameManager.spawn_time
