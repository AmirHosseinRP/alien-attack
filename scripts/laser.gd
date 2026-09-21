extends Area2D

@export var speed: float = 400


func _physics_process(delta: float) -> void:
	global_position.x += speed * delta


func _on_visible_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Enemy:
		queue_free()
		area.die()
