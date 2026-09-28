class_name PathEnemy

extends Path2D

@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var enemy: Enemy = $PathFollow2D/Enemy

@export var speed: float = 0.15


func _ready() -> void:
	path_follow_2d.progress_ratio = 1


func _process(delta: float) -> void:
	path_follow_2d.progress_ratio -= speed * delta

	if path_follow_2d.progress_ratio <= 0:
		queue_free()
