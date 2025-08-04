extends Marker2D

#not best practice, but it works for now
@onready var player = $"../../Player"

func _process(delta: float) -> void:
	look_at(player.position)
