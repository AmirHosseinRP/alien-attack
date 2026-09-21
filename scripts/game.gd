extends Node2D

@export var lives_count: int = 3

@onready var player: Player = $Player


func _on_death_zone_area_entered(area: Area2D) -> void:
	if area is Enemy:
		area.die()


func _on_player_took_damage() -> void:
	lives_count -= 1

	if lives_count == 0:
		player.die()
