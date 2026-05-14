extends CanvasLayer


@onready var hp_label: Label = $HpLabel
@onready var score_label: Label = $ScoreLabel



func _process(_delta):
	hp_label.text = "HEALTH: " + str(GameManager.hp)
	score_label.text = "SCORE: " + str(GameManager.score)
