extends Area2D

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if (area.name == "enemy-bullet"):
		area.queue_free()
		get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")
