extends Node2D

var score: int = 0
var lives: int = 3

var game_over_screen_scene: PackedScene = preload("res://scenes/game_over_screen.tscn")

@onready var player: Player = $Player
@onready var hud: HUD = $UI/HUD
@onready var ui: CanvasLayer = $UI
@onready var enemy_hit_sound: AudioStreamPlayer = $EnemyHitSound
@onready var player_take_damage_sound: AudioStreamPlayer = $PlayerTakeDamageSound


func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives_label(lives)


func _on_death_zone_area_entered(area: Area2D) -> void:
	if area is Enemy:
		area.queue_free()


func _on_player_took_damage() -> void:
	lives -= 1
	hud.set_lives_label(lives)
	player_take_damage_sound.play()

	if lives == 0:
		player.die()

		await get_tree().create_timer(1.5).timeout

		var game_over_screen_instance: GameOverScreen = game_over_screen_scene.instantiate()
		ui.add_child(game_over_screen_instance)
		game_over_screen_instance.set_score(score)


func _on_enemy_spawner_enemy_spawned(enemy_instance: Enemy) -> void:
	enemy_instance.connect("died", _on_enemy_died)


func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance: PathEnemy) -> void:
	path_enemy_instance.enemy.connect("died", _on_enemy_died)


func _on_enemy_died() -> void:
	score += 100
	hud.set_score_label(score)
	enemy_hit_sound.play()
