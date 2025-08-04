extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")
