extends Node2D

var score: int = 0
var lives: int = 3

@onready var player: Player = $Player
@onready var hud: HUD = $UI/HUD


func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives_label(lives)


func _on_death_zone_area_entered(area: Area2D) -> void:
	if area is Enemy:
		area.die()


func _on_player_took_damage() -> void:
	lives -= 1
	hud.set_lives_label(lives)

	if lives == 0:
		player.die()


func _on_enemy_spawner_enemy_spawned(enemy_instance: Area2D) -> void:
	enemy_instance.connect("died", _on_enemy_died)


func _on_enemy_died() -> void:
	score += 100
	hud.set_score_label(score)
