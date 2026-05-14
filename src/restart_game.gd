extends VBoxContainer

@onready var score_label: Label = $ScoreEnd
@onready var best_score_label: Label = $BestScore

func _on_quit_button_pressed():
	GameManager.quit()

func _on_restart_button_pressed():
	GameManager.start_game()

func _process(_delta):
	score_label.text = "YOUR SCORE: " + str(GameManager.score)
	best_score_label.text = "YOUR BEST SCORE: " + str(GameManager.best_score)
