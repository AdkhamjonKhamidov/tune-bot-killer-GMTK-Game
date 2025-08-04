extends Node2D

@export var enemy_type: PackedScene
@onready var sprite = $"AnimatedSprite2D"

func _ready() -> void:
	sprite.play()

func _on_timeout() -> void:
	var enemy = enemy_type.instantiate()
	enemy.position = position
	$"/root/Base".add_child(enemy)
	queue_free()
