extends Sprite2D

@onready var anim = get_node("CutAnimation")
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("cut")


func _on_cut_animation_animation_finished():
	queue_free()
