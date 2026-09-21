extends Node2D

var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")

@onready var spawn_posiotions: Node2D = $SpawnPosiotions


func _on_timer_timeout() -> void:
	spawn_enemy()


func spawn_enemy() -> void:
	var spawn_positions_children: Array[Node] = spawn_posiotions.get_children()
	var random_spawn_point: Marker2D = spawn_positions_children.pick_random()

	var enemy_instance: Area2D = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_point.global_position
	add_child(enemy_instance)
