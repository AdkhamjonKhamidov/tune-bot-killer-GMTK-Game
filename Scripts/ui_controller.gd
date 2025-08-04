extends Control

@onready var indicator = $MarginContainer/BeatIndicator

func _on_heartbeat_beep_fire(_arg) -> void:
	print("playing")
	indicator.play("beat", 5.0)
