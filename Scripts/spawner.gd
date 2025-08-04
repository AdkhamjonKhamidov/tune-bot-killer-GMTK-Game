extends Node

@onready var timer: Timer = $"../Tiles/Timer"
const simple_enemy_scene = preload("res://Scenes/Game/Enemy/enemy.tscn")
const simple_shooter_scene = preload("res://Scenes/Game/Enemy/shooter.tscn")

const spawn_warning_scene = preload("res://Scenes/Game/spawn_warning.tscn")
const vertical_spawn_range = [0,320]
const horizontal_spawn_range = [16,624]


var difficulty = 0

func random_spawn_location() -> Vector2:
	var x = randi_range(horizontal_spawn_range[0],horizontal_spawn_range[1])
	var y = randi_range(vertical_spawn_range[0],vertical_spawn_range[1])
	return Vector2(x,y)

func _ready() -> void:
	timer.timeout.connect(_on_timeout)

func _on_timeout():
	difficulty += 1
	for i in range(difficulty+randi_range(0,2)):
		var spawn_warning = spawn_warning_scene.instantiate()
		spawn_warning.position = random_spawn_location()
		spawn_warning.enemy_type = simple_enemy_scene
		$"/root/Base".add_child(spawn_warning)
