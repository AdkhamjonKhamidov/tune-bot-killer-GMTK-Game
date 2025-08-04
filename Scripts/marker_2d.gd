extends Marker2D

@onready var player = $"../../Player"
func _process(delta: float) -> void:
	look_at(player.position)
