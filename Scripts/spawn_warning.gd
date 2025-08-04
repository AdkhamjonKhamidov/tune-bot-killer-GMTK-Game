extends Node2D

@export var enemy_type: PackedScene
@onready var enemy_shooter = preload("res://Scenes/Game/Enemy/shooter.tscn")
@onready var sprite = $"AnimatedSprite2D"

func _ready() -> void:
	sprite.play()

func _on_timeout() -> void:
	var enemy = enemy_type.instantiate()
	enemy.position = position
	$"/root/Base".add_child(enemy)
	queue_free()
	var shooter = enemy_shooter.instantiate()
	shooter.position = position
	$"/root/Base".add_child(shooter)
	queue_free()
