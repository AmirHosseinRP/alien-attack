class_name Enemy

extends Area2D

@export var speed: float = 200


func _physics_process(delta: float) -> void:
	global_position.x -= speed * delta


func die() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_damage()
	die()
