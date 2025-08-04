extends Node2D

var speed = 200
var player_pos
var target_pos


@onready var player = $"/root/Base/Player"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_pos  = player.position
	target_pos = (player_pos - position).normalized()
	
	if position.distance_to(player_pos) > 3:
		position += target_pos * speed * delta
	
