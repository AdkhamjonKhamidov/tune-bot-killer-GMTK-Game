extends Timer

@onready var player: CharacterBody2D = get_node("../../Player")
@onready var camera: Camera2D = get_node("../../Camera2D")
var facing = "0"

func _on_trigger_crossed_door(direction: Variant) -> void:
	facing = direction
	start(1)

func _on_timeout():
	match facing:
		"N":
			player.position -= Vector2(0,-336)
		"S":
			player.position -= Vector2(0,336)
		"E":
			player.position -= Vector2(625,0)
		"W":
			player.position -= Vector2(-625,0)
	camera.position=Vector2(0,-15)
	camera.reset_smoothing()
