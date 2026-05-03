extends Node2D
@onready var spawn_timer = $Timer
@export var falling_object_scene: PackedScene = preload("res://src/falling_object.tscn")

func spawn_object():
	var falling_object: FallingObject = falling_object_scene.instantiate()
	falling_object.position = Vector2(randi() %get_window().size.x, 0)
	add_child(falling_object)
	


func _ready():
	spawn_timer.timeout.connect(spawn_object)
	
