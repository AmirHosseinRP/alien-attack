class_name HUD

extends Control

@onready var score_label: Label = $ScoreLabel
@onready var lives_label: Label = $LivesLabel


func set_score_label(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)


func set_lives_label(new_lives: int) -> void:
	lives_label.text = "x " + str(new_lives)
