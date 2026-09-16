extends Area2D

@export_category("Parameters")
@export var speed: float = 400


func _physics_process(delta: float) -> void:
	global_position.x += speed * delta
