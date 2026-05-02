extends Node2D

func _ready():
	pass 

var speed = 400
func _process(delta):
	position.y += speed * delta
