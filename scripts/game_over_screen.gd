class_name GameOverScreen

extends Control

@onready var score_label: Label = $Panel/ScoreLabel


func set_score(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
