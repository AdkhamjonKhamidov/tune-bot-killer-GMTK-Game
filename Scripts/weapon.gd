extends Node2D
const bullet = preload("res://Scenes/Game/Weapon/bullet.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)

	if Input.is_action_just_pressed("fire"):
		var bullet_instance = bullet.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = global_position
		bullet_instance.rotation = rotation
