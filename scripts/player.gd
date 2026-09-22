class_name Player

extends CharacterBody2D

signal took_damage

@export var speed: float = 300

@onready var laser_container: Node = $LaserContainer

var laser_scene: PackedScene = preload("res://scenes/laser.tscn")


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()


func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, 0)

	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed

	move_and_slide()

	var screen_size: Vector2 = get_viewport_rect().size

	global_position = global_position.clamp(Vector2(0, 0), screen_size)


func shoot() -> void:
	var laser_instance: Area2D = laser_scene.instantiate()
	laser_container.add_child(laser_instance)
	laser_instance.global_position = global_position + Vector2(40, 0)


func take_damage() -> void:
	emit_signal("took_damage")


func die() -> void:
	queue_free()
