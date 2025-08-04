extends Area2D

@onready var camera: Camera2D = get_node("../../Camera2D")

signal crossed_door(direction)

func _on_body_entered(body:Node2D):
	camera.position_smoothing_enabled = true
	if(body.name=="Player"):
		match name:
			"North_Trigger":
				camera.position += Vector2(0,-336)
				crossed_door.emit("N")
			"South_Trigger":
				camera.position += Vector2(0,336)
				crossed_door.emit("S")
			"East_Trigger":
				camera.position += Vector2(625,0)
				crossed_door.emit("E")
			"West_Trigger":
				camera.position += Vector2(-625,0)
				crossed_door.emit("W")
