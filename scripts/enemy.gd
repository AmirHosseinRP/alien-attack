class_name Enemy
extends Area2D

@export_category("Parameters")
@export var speed: float = 200


func _physics_process(delta: float) -> void:
	global_position.x -= speed * delta


func die() -> void:
	queue_free()
