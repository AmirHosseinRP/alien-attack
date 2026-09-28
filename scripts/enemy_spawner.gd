extends Node2D

signal enemy_spawned(enemy_instance: Enemy)
signal path_enemy_spawned(path_enemy_instance: PathEnemy)

var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")
var path_enemy_scene: PackedScene = preload("res://scenes/path_enemy.tscn")

@onready var spawn_posiotions: Node2D = $SpawnPosiotions


func _on_enemy_timer_timeout() -> void:
	spawn_enemy()


func _on_path_enemy_timer_timeout() -> void:
	spawn_path_enemy()


func spawn_enemy() -> void:
	var spawn_positions_children: Array[Node] = spawn_posiotions.get_children()
	var random_spawn_point: Marker2D = spawn_positions_children.pick_random()

	var enemy_instance: Enemy = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_point.global_position
	add_child(enemy_instance)
	emit_signal("enemy_spawned", enemy_instance)


func spawn_path_enemy() -> void:
	var path_enemy_instance: PathEnemy = path_enemy_scene.instantiate()
	add_child(path_enemy_instance)
	emit_signal("path_enemy_spawned", path_enemy_instance)
